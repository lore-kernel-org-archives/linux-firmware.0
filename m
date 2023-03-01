Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313E6C7EE33
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEE8DC433A1; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D291FC4339E;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=wz5fUAXBkSY3O7VTqv29uWnZmblE82cZsgSV90ukp9I=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=ZzNRaNilA8EidiFNjEAckfYb76lEFmXJvpVoW2LYhK1Z3BRRmyqw/3t3I7fCY2XPz
	 ntPdTgVqpkqgNGANgksmf0OGAjvDCFHb4HlcgIoavfISKvgZGGx1B+Sj/NmjOCngb6
	 57JX/vGD2USGZDesCSgCJHLpwE7SMbW80WEsBj4BmFkX7TR+ZLCTSGLnmrXLiCJOnL
	 9EeBTh2SACyNeIhnWrEcxzizoDCW8PKwsEfdsefLU1rHiNNYer4Ny96P5ovWKPSSIk
	 kfaAXdf5K+A9GO1JsIZfMbeLirK/4ifb+lr03H0ooP1Lt7OKhJY4MWcmL/Dz2UsSJZ
	 CFLZOtm1Sz11A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7B4C7EE33;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:23 +0000
Subject: [PATCH RESEND v2 09/16] check_whence: error if File: is actually a
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-9-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=1339;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=0av+eIxNaRMO5FMJU9ukW6YWNWL0wtYKOyBS7RQJeUw=;
 b=31CAGQk8ngwZay3fwCToNKjgAa+MSNx1Fu7Ai4WADYWwujMr5wUNX2hhF/fTC9ey/0GtLE/Ex
 OmG2x65uxxVD9HhSzonL89kPVCqZGA7az2rAmc6jvtE4vPF5YkcZcDH
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

This allows us to remove the -d aka --no-dereference --preserve=links
from the copy command.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py  | 5 +++++
 copy-firmware.sh | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/check_whence.py b/check_whence.py
index 130966e..92b104e 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -56,6 +56,11 @@ def main():
         sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
         ret = 1
 
+    for name in set(link for link in whence_files if os.path.islink(link)):
+        sys.stderr.write('E: %s listed in WHENCE as File, but is a symlink\n' %
+                         name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1
diff --git a/copy-firmware.sh b/copy-firmware.sh
index 656b0ec..e3f3176 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -34,7 +34,7 @@ done
 grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
     $verbose "copying file $f"
     install -d $destdir/$(dirname "$f")
-    cp -d "$f" $destdir/"$f"
+    cp "$f" $destdir/"$f"
 done
 
 grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do

-- 
2.39.2

