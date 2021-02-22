Return-Path: <SRS0=8TfJ=HY=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B86C433E0
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Feb 2021 21:24:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 721AC64E02; Mon, 22 Feb 2021 21:24:10 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id D37CE64E32;
	Mon, 22 Feb 2021 21:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D37CE64E32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id C9654E77AE;
	Mon, 22 Feb 2021 22:24:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzPsM-hnrR9I; Mon, 22 Feb 2021 22:24:07 +0100 (CET)
Received: from photino.stro.at (unknown [82.220.104.185])
	by baikonur.stro.at (Postfix) with ESMTPSA id B1CCAE6D7F;
	Mon, 22 Feb 2021 22:24:07 +0100 (CET)
Date: Mon, 22 Feb 2021 22:24:06 +0100
From: maximilian attems <maks@stro.at>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, Josh Boyer <jwboyer@kernel.org>
Cc: 982579@bugs.debian.org, Bernhard <bewoern1@gmail.com>,
	vagrant@debian.org
Subject: Re: Bug#982579: Solution for loading firmware
Message-ID: <YDQg9nkcyzzdljno@photino.stro.at>
References: <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <cbcb1fabd3a005142216213ca67c1a1664b7958a.camel@gmail.com>
 <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <YCtw7RaNEyod8mxb@photino.stro.at>
 <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <YCwShdDfEI8Fzidn@photino.stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCwShdDfEI8Fzidn@photino.stro.at>

please also add BananaPi M3 support.


From 216a0bda280e7b361c335f545156e86a059d9551 Mon Sep 17 00:00:00 2001
From: maximilian attems <maks@stro.at>
Date: Mon, 22 Feb 2021 22:18:36 +0100
Subject: [PATCH 2/2] WHENCE: add missing symlink for BananaPi M3

Fixes (Debian bug #982579):
> [   11.957171] brcmfmac mmc2:0001:1: firmware: failed to load
brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt (-2)
> [   11.967106] firmware_class: See https://wiki.debian.org/Firmware for
information about missing firmware
> [   11.977035] brcmfmac mmc2:0001:1: firmware: failed to load
brcm/brcmfmac43430-sdio.txt (-2)
> [   12.994756] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000): clkctl
0x50

Reported-by: Bernhard <bewoern1@gmail.com>
Signed-off-by: maximilian attems <maks@stro.at>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 11c0970..b569990 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2717,6 +2717,7 @@ File: "brcm/brcmfmac43430-sdio.AP6212.txt"
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
-- 
2.30.0

