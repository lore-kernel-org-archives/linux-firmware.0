Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F0CCD4F52
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E05E6C4CECD; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8EE8C4CEE7;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=Uce0TJkkHPrhRpSBO/9LvhsxyXd3AN+DcMMteI03uFA=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=O4hzcQ8FVQrxYYmUqvs8XLawOiaHWO+yhW3pHi4eph5F2uPjQWRcBQWdSecXf60Cx
	 P0D0XUHY/GD6d0uqkVOSXz1zrX2sI/y+A/yglw4IS8pTQ6RgBOkUJeY9XXTXM1Bh8N
	 OltcsRAKZCukiyUtxxZGnp9PSF0zs/EzVaBOL9dKfeDBgDkEho+zi9dVtssp3AqWug
	 hM08TmGYOMOx+MnNeHQQa5CD6nTkCwCK8u8fllCsrug2cHm2rqutoRIYrsJxeVwNEv
	 gtYjqf7288rcHDMfimEcVdrWdwyem3TZVzKkbrPiadud5/iKBR8Xat7T+0m2hftoCt
	 VVGOrrMMmHj/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BDECF9C77;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:42 +0100
Subject: [PATCH v2 14/16] copy-firmware.sh: remove no longer reachable test
 -f
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-14-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=911;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=QDN2msaWLL4LMcQJGzGJJiag3JpIJ1uFyJ088OvH4r0=;
 b=XIgTk6QKrn6w+5hKNEhbgsFxrrg2KuPEdZZVTCgytjnBagik3pmNDBADo68IUcr/KYXvGOyL0
 cJGShjpFVUXCImF42B0DU1uM72HPOR1KQXYug2+2PFhcFDXBR6IPjy7
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

With previous commit we call check_whence.py, which ensures that all files
listed are available. Drop the now dead code.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 12322530e5e155f77829f0d070d173ab5bfbab5b..bdc20d596ef5f9d99b17e9cea74a0358f0f4de09 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -76,7 +76,6 @@ $verbose "Checking that WHENCE file is formatted properly"
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
-    test -f "$f" || continue
     install -d "$destdir/$(dirname "$f")"
     $verbose "copying/compressing file $f$compext"
     if test "$compress" != "cat" && test "$k" = "RawFile"; then

-- 
2.46.1


