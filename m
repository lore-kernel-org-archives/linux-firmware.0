Return-Path: <SRS0=fwJh=HS=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DB3C433DB
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Feb 2021 18:44:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A7EC064D73; Tue, 16 Feb 2021 18:44:26 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id 51FE164E10;
	Tue, 16 Feb 2021 18:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51FE164E10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id 2A467E77B5;
	Tue, 16 Feb 2021 19:44:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbK8b7Gy_YW2; Tue, 16 Feb 2021 19:44:23 +0100 (CET)
Received: from photino.stro.at (unknown [77.241.229.232])
	by baikonur.stro.at (Postfix) with ESMTPSA id 4CDE6E05F3;
	Tue, 16 Feb 2021 19:44:23 +0100 (CET)
Date: Tue, 16 Feb 2021 19:44:21 +0100
From: maximilian attems <maks@stro.at>
List-Id: <linux-firmware.lore.kernel.org>
To: 982579@bugs.debian.org, linux-firmware@kernel.org,
	Josh Boyer <jwboyer@kernel.org>
Cc: Bernhard <bewoern1@gmail.com>, vagrant@debian.org
Subject: Re: Bug#982579: Solution for loading firmware
Message-ID: <YCwShdDfEI8Fzidn@photino.stro.at>
References: <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <cbcb1fabd3a005142216213ca67c1a1664b7958a.camel@gmail.com>
 <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <YCtw7RaNEyod8mxb@photino.stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCtw7RaNEyod8mxb@photino.stro.at>

please find patch to add banana ultra support below

From b549a10838edc4f97d4a3b49b572fc613c7c703d Mon Sep 17 00:00:00 2001
From: maximilian attems <maks@stro.at>
Date: Tue, 16 Feb 2021 19:35:27 +0100
Subject: [PATCH] Add symlink for BananaPi M2 to brcmfmac43430-sdio config

Fixes ( Debian bug #982579 [1]):
 [   10.514530] brcmfmac mmc2:0001:1: firmware: direct-loading firmware brcm/brcmfmac43430-sdio.bin
 [   10.514732] brcmfmac mmc2:0001:1: firmware: failed to load brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt ( -2)

Refs:
[1] https://bugs.debian.org/982579

Reported-by: Bernhard <bewoern1@gmail.com>
Signed-off-by: maximilian attems <maks@stro.at>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index aa96404..11c0970 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2716,6 +2716,7 @@ File: "brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt"
 File: "brcm/brcmfmac43430-sdio.AP6212.txt"
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
-- 
2.30.0

