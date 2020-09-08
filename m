Return-Path: <SRS0=vWTX=CR=suse.de=tiwai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBA3C433E2
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Sep 2020 10:17:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E73C8216C4; Tue,  8 Sep 2020 10:17:12 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBB120C09
	for <linux-firmware@kernel.org>; Tue,  8 Sep 2020 10:17:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EBB120C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=tiwai@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F011BB6B7;
	Tue,  8 Sep 2020 10:17:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH linux-firmware] brcm: Fix a stale symlink for RPi3 model b+
Date: Tue,  8 Sep 2020 12:16:56 +0200
Message-Id: <20200908101656.27835-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4

The symlink for brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
was wrongly listed with the same subdirectory brcm, and this resulted
in a stale symlink.  Fix it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 WHENCE | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/WHENCE b/WHENCE
index 4adac39e28eb..f4af5d01e2c8 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2639,7 +2639,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
-Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
+Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
-- 
2.16.4

