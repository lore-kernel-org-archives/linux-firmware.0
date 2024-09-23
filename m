Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1585DC7882B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D57BAC4CEE9; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE35FC4CEE5;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=7EG81f4mtXKQjNzHn56yNNwjbvmAeMaDabl3EvCk75Y=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=jHN5SjrTkIzV7Os13M1w0GTyc/vV/2/yaQHfIym98iwThe0F3fbpYHbr4OElZZ/tx
	 H1avzWTRs+BhnftXhxoxkEFfgnuclhjyWw00AXo21UYhamcuctOgjBhOD3dUtLHrcq
	 xvyYusKWMzneJneWXIphHrAC1h9MQNC1R2iLhKIByx8wjvMVcPqY24FKh9avpWe125
	 IuBAja7Hmlv6WRamAXZHuSsscXcekJy0TNiqOHuvZvMir+nAEZ97OEVCb114ppIwJo
	 jjbuxGlqHskZGL1VimtaCrYIq2TDzUeEE4Lgu6HWFj4AvfXg9rQhVD9W55M+uWKnmJ
	 lECtFE7FF9R+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2AFCF9C74;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:41 +0100
Subject: [PATCH v2 13/16] copy-firmware.sh: call ./check_whence.py before
 parsing the file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-13-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1318;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=epSgfa8es9kJaFPzd3/t8MH8sbvov5s3daxLlc4Grlc=;
 b=5UqTS4n7j2Az6CXtr3yU4rkHD7w1pAtTJC62/8GA5PaDB+HJGYAtfOLYXLMFemz8BrLC4aN7u
 JHJkUUIQ7B/CTgRL4+j5bNcBPBbIciYQCwfVG96cvbYHlD2GeEGIVe7
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Currently ./check_whence.py is used when submitting new firmware, while
copy-firmware.sh when the firmware is to be consumed.

Since the latter does (very little) validation, having a malformed WHENCE file
can lead to all sorted of problems. From the obvious, where it errors out, to
more serious one where it overwrites or executes something it should not have.

Just call check_whence.py and error out. It takes 0.2s on my 5 year old
mid-range laptop, so the overhead is negligible.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 12b97ae32f953c96a1c7612ccd14b1991a8687bf..12322530e5e155f77829f0d070d173ab5bfbab5b 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -71,6 +71,9 @@ if test -d "$destdir"; then
     find "$destdir" -type d -empty >/dev/null || warn "destination folder is not empty."
 fi
 
+$verbose "Checking that WHENCE file is formatted properly"
+./check_whence.py || err "check_whence.py has detected errors."
+
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     test -f "$f" || continue

-- 
2.46.1


