Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E99CF9C7D
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D19D1C4CEE8; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3B31C4CEE4;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=ugj4aI0Jc9e4+sjmwb0CzUK76M/CuV8acCNB3NKMDXM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=oF3+40yPk0nwYIPCdVtw6X0AeK+Efk0T2RNs+QmW42kXns+rU+cQkG+xs6ks2zdCi
	 BVolso7STaVBi0GSD5RYIeG3VvUBb2ZLpzYtNeIV0cM1BYdlABT/gIYxu9JzteZrfB
	 Ft0Cw+ndiG3HYKQuOF06SRd1I7ePGWxXI51PxfGooDg6lss7e+rREoayJBSihV8lAi
	 HkEL6/WdfpA+ZtlBStKny+WogxEDzvoE3VhMupL/KdcRROFYAwfRy8fHDod1hALIIU
	 R5hQ2/pV7DdvkRHdBle0lqk2SE5I/P4YBpZ2KeHIVeDVbxk4mGsLzC1QETBJKpC/+P
	 oSyUWFvgFL+xg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF42CF9C69;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:40 +0100
Subject: [PATCH v2 12/16] copy-firmware.sh: warn if the destination folder
 is not empty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-12-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1186;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=WJ8am6j5YgaMLhScDdjum39RpN5ff2d6IJBAx7vkpJ8=;
 b=fj4I+ZPKlTFqwcBPf4pOcoq28FPw3TIk28jT9H+xDSzqhciym2k8c8zYYmCgx82WCkIGvyxnI
 Jx9lxHC8LqnALMQt4YWnLLRTW3D4HMR+4Y9Mow5euKBqgd7AbNOSXfA
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

If the user provides an existing non-empty folder (their /usr/lib/firmware/ or otherwise)
there is a high chance we'll silently overwrite existing files. That may or may not be what
they wanted, so throw a warning so highlight that.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 610c8b65b2b3bdb9f723da3656112ac121e51c84..12b97ae32f953c96a1c7612ccd14b1991a8687bf 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -16,6 +16,10 @@ err() {
     exit 1
 }
 
+warn() {
+    echo "WARNING: $*"
+}
+
 while test $# -gt 0; do
     case $1 in
         -v | --verbose)
@@ -63,6 +67,10 @@ if test -z "$destdir"; then
     err "destination directory was not specified"
 fi
 
+if test -d "$destdir"; then
+    find "$destdir" -type d -empty >/dev/null || warn "destination folder is not empty."
+fi
+
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     test -f "$f" || continue

-- 
2.46.1


