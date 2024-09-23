Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D754C78859
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24842C4CECE; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E17AC4CED3;
	Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096984;
	bh=IEGj1NfElSDEgsIKR1MfNZV7qyN1ETJjMlQUThfQljg=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=XLGIzwK1qpDlmFHBq8SPBj6hp/1B6pNz1uKRIe7k1BGIy3SLARuPJua9SOiLj4yL6
	 B3J5GZ2lTp9U/rM4dCsi9o39dV88Cs1G5VPA8M0MGRRE4j5q1SUoOKk0nXHlTAILeX
	 J5/6ur2JTfzyvJHq6nXnJP+BJkuR8Pz/SGFU/QDlqFtoVECgsLu3qLhFD6nGuMz7Ca
	 +lyCsxnP/mUGI/wdYbH4OlU0CWgKfJ6/i2K9gCgdoIL54TWiu9QjM/vQ4Icf+53eRw
	 h9ApzUNts2ApoAASfVbSwW/3MLtGk4WnmIFihGlRMidHoPUcsvtO/K/TP4ePmoJVp7
	 23lIAHUyN2ZvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE5DCF9C7D;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:44 +0100
Subject: [PATCH v2 16/16] copy-firmware.sh: rename variables in symlink
 hanlding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-16-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1507;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=Z5/WxfoLZqkgFB6L8ZRR1GpWggGK55LAePYnh7qPIeY=;
 b=L4qfEt4ryL24H4JiUxSBVwDZXE5UXowZ37y/px22T0tCJOQaRWO6lsqIE4nE/xuIFEMj/giMg
 gRVk2FcgK9ZBNc9sdZtnemJQA948qEpMHatETovmLMzn9Mp6hZsm1TZ
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Currently we use f(ile) and d(irectory), over the more common ones t(arget) and
l(ink). Rename things appropriately.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 57d43cd004231e34c5349ccff90072b26af63093..e2d2945c926872e55800c2a637574e8234908a5d 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -81,16 +81,16 @@ grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g'
 done
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
-grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
-    directory="$destdir/$(dirname "$f")"
+grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read l t; do
+    directory="$destdir/$(dirname "$l")"
     install -d "$directory"
-    target="$(cd "$directory" && realpath -m -s "$d")"
+    target="$(cd "$directory" && realpath -m -s "$t")"
     if test -e "$target"; then
-        $verbose "creating link $f -> $d"
-        ln -s "$d" "$destdir/$f"
+        $verbose "creating link $l -> $t"
+        ln -s "$t" "$destdir/$l"
     else
-        $verbose "creating link $f$compext -> $d$compext"
-        ln -s "$d$compext" "$destdir/$f$compext"
+        $verbose "creating link $l$compext -> $t$compext"
+        ln -s "$t$compext" "$destdir/$l$compext"
     fi
 done
 

-- 
2.46.1


