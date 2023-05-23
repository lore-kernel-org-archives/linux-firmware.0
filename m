Return-Path: <SRS0=PNaw=BM=cknow.org=didi.debian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FFEC77B75
	for <linux-firmware@archiver.kernel.org>; Tue, 23 May 2023 15:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C9B3C4339B; Tue, 23 May 2023 15:16:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFA96C433EF;
	Tue, 23 May 2023 15:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFA96C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cknow.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cknow.org
Received: (Authenticated sender: didi.debian@cknow.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 500B520014;
	Tue, 23 May 2023 15:16:03 +0000 (UTC)
From: Diederik de Haas <didi.debian@cknow.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
	Josh Boyer <jwboyer@kernel.org>
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Maximilian Weigand <mweigand@mweigand.net>
Subject: [PATCH] brcm: Add symlinks from Pine64 devices to AW-CM256SM.txt
Date: Tue, 23 May 2023 17:15:41 +0200
Message-Id: <20230523151541.179373-1-didi.debian@cknow.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a number of Pine64 devices which all use the same wireless
chipset, so add symlinks for those modules/(base)boards:
- Pine64 RockPro64 v2.0 and v2.1 (via adapter board)
- Pine64 RK3566 Quartz64-A Board (via adapter board)
- Pine64 PineNote v1.1 and v1.2
- PINE64 RK3566 SOQuartz on Model A carrier board
- Pine64 RK3566 SoQuartz with CM4-IO Carrier Board
- PINE64 RK3566 SOQuartz on Blade carrier board

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
Tested-by: Maximilian Weigand <mweigand@mweigand.net>
---
 WHENCE | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/WHENCE b/WHENCE
index 6762c0bc..07897f04 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2718,8 +2718,16 @@ Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,quartz64-a.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.0.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,rockpro64-v2.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,soquartz-model-a.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,soquartz-cm4io.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,soquartz-blade.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
-- 
2.39.2

