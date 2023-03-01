Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9523AC87FDC
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E172C433B4; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 478C3C43444;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696979;
	bh=RzQzD9NbpjGlPNYWHADvPNYWQkjiDXXOFyPdE9bqa6k=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=SEjY0LaqLMxeTqSSrXP59YId90cecwEFCdBVEMAexSgBydXgC2ZOwSUe7GLt3c33S
	 HTuzmbfp5XiPuU+VPbCS4DvzCAVDQD0HSS/cNG9AtJstsh1JpkWu7qrm3L5UTTClHp
	 7C4fyQM0ed+Jds5863F8/2kJLHxFJJ0ywp4VAOgWctfY2SCZ1g/kf0afmJGn/GBehP
	 1HXsUsh+7vQbd9saSbYemiyogiFpbRGt8/PjPh9eL03WR+Yd81jQQYy2qMGOtLdkz0
	 U7OiJXFhMIXA3/lh78nTBt671VDFLxLQKNDf+9I2NRGG0068kIK4pov1hU6F8k8b9n
	 Y7phHT1bpLDLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37151C7EE43;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:28 +0000
Subject: [PATCH RESEND v2 14/16] copy-firmware: quote the output of dirname
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-14-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=952;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=sqz+7/rDijj7yKvt+728HKEpkgelptx0CPqhbGox/6I=;
 b=3rrZT57lv57NZfWe1t6d7hUZ7tB3RlK9/jfZ8QXt5WlM1QY1wPcsWDPPhnrK7K2MJIpMgpBsV
 vqHYZ8X6chABvaPohYCVZQR7E638PhvQ+kxRihy8Hf/94gxeoT9PVsH
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

As highlighted by shellcheck - as-is one could get word splitting. That
isn't an issue, yet, since none of the in-tree directories have space in
their name.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 722227f..5a5e1a8 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -27,13 +27,13 @@ done
 
 grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
     $verbose "copying file $f"
-    install -d "$destdir"/$(dirname "$f")
+    install -d "$destdir/$(dirname "$f")"
     cp "$f" "$destdir/$f"
 done
 
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
-    install -d "$destdir"/$(dirname "$f")
+    install -d "$destdir/$(dirname "$f")"
     ln -s "$d" "$destdir/$f"
 done
 

-- 
2.39.2

