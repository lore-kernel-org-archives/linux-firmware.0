Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1ACC6FA9D
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEF55C43446; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A818CC433EF;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=Sbr73EBr4SOXQNwqzN4Y5qfrWUfHeGiTJPZyRRvIpGA=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=DkWm0ezKEqqwTFtxnKkNIS/58SM+X4Q8Sc4zjBDd9zOvMNs+eE6Rar7iJPwDWWAXv
	 sgAr98AO+qUHiyM3q3d1bERfD4Tuu0ILDtKff8jJU7QWdpfgZw6iLBM8xilX46tcQr
	 svYuZ6EiAlgw0miFqh3Jrl4qVhHN6WhCyaYIAwqfBlYmlLXrq/AnO5vc5+XHubzqHM
	 eRVrCqDHdwOs6McWolBIQI1VTLmEJbnvlw+t4+5/31PBX3GewptVkA7F27ik9ucmH/
	 N73GF7NmAdpwrT62e2/swbcXSh8OdezYp0zMyAx086k9KC//2pHQVQSn82ZERjxc4a
	 GoI+lpLhRi6XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B2DC7EE33;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:20 +0000
Subject: [PATCH RESEND v2 06/16] check_whence: error on duplicate file
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-6-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=1745;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=2c6pFHqccGS+CEGS7VUkdmEUpdp4j5BHwTb4gFxl86o=;
 b=m7VX1IWE58Y3n/9Ukgip8DHsO95RDFl4OL8NTidWscJIlJFgT0tQWVf5HVc0dCsU9UewOKRPY
 QhL0UHQ3mF+DzAy5UxZv/X3g4go95KwawNz/w/BS7LfkmEhPkdTT3DX
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

There's little point in copying (or compressing with later patches) the
same files multiple times. So let's error out when duplicate entries are
present.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index f347f0e..7ff21f6 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -24,6 +24,14 @@ def list_whence():
                         yield match.group(2)
                         continue
 
+def list_whence_files():
+    with open('WHENCE', encoding='utf-8') as whence:
+        for line in whence:
+            match = re.match(r'File:\s*(.*)', line)
+            if match:
+                yield match.group(1).replace("\ ", " ")
+                continue
+
 def list_git():
     with os.popen('git ls-files') as git_files:
         for line in git_files:
@@ -32,12 +40,17 @@ def list_git():
 def main():
     ret = 0
     whence_list = list(list_whence())
+    whence_files = list(list_whence_files())
     known_files = set(name for name in whence_list if not name.endswith('/')) | \
                   set(['check_whence.py', 'configure', 'Makefile',
                        'README', 'copy-firmware.sh', 'WHENCE'])
     known_prefixes = set(name for name in whence_list if name.endswith('/'))
     git_files = set(list_git())
 
+    for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
+        sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1

-- 
2.39.2

