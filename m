Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E354BC83003
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6C0BC433A0; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4AA9C43444;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=UH+zzGXAEsCFkqHR3zVhb9Jpp2OJhgWn/hCwNx8OsZU=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=F2lGsO9K3/jNjKdHAqKVgYM+GevMcZaObKfIFNyNeIFG6L98X+H8/mWRsK05F86Cc
	 xHZmhrTLBy2MwjbIIr6ZVJ9aL3Tik33whSALhG4n+9b3arMS8N/s1A7xKObn9324eA
	 LanutLGeG0BGsCrm/Sokx68A+RcbtlMHo1+xon/0KPnvvmEQa8wvaNJgSGLxPJp7A6
	 aOy/xQ/yG8NqLknLflxw2zPwsvm9E5NMAY2hPtmI0C1I+1tPkOLOVRLkz7vJG1UvBs
	 VOkI1go0uN2H8W5GPF8kVJepSKYY9ALhMR50LCDkMyRqgBg9xCTxWbbETm4iytNgil
	 5ed8J+mgkRG5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45A5C6FA9D;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:21 +0000
Subject: [PATCH RESEND v2 07/16] check_whence: error on directory listed as
 File
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-7-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=859;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=F3j5Qldgen7pQ7rPea6JFL3+27lQd6Q2y34UCLnJp7k=;
 b=YcfBTJXY19g5yHrBjDzL/Y7qOONQCvg5GFYpUDwm7RSKi7YoL77uRft62+9SjeGVNZEqIG2B7
 49B93zx0rWBBqkp9t+vc5mszGyHpccqsm3QRINvksKDA1xo/w1KYXil
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

No occurrences in-tree, but it makes sense to sanity check that.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 7ff21f6..130966e 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -47,6 +47,11 @@ def main():
     known_prefixes = set(name for name in whence_list if name.endswith('/'))
     git_files = set(list_git())
 
+    for name in set(name for name in whence_files if name.endswith('/')):
+        sys.stderr.write('E: %s listed in WHENCE as File, but is directory\n' %
+                         name)
+        ret = 1
+
     for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
         sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
         ret = 1

-- 
2.39.2

