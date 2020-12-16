Return-Path: <SRS0=I3oN=FU=b1-systems.com=seife+dev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBDFC4361B
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Dec 2020 13:50:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DDBED233A0; Wed, 16 Dec 2020 13:50:57 +0000 (UTC)
X-Greylist: delayed 505 seconds by postgrey-1.34 at mail.kernel.org; Wed, 16 Dec 2020 13:50:57 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1282311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=b1-systems.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=seife+dev@b1-systems.com
Received: from mx2.b1-systems.de (mx2.b1-systems.de [78.46.169.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1282311B
	for <linux-firmware@kernel.org>; Wed, 16 Dec 2020 13:50:56 +0000 (UTC)
From: Stefan Seyfried <seife+dev@b1-systems.com>
Subject: brcmfmac: add AP6212 symlinks to make bananapi boards happy
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Organization: B1 Systems GmbH
Message-ID: <f0abb3ea-0c12-3b21-12e5-331071bbbe8b@message-id.b1-systems.de>
Date: Wed, 16 Dec 2020 14:42:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D905BCB6193E20CA78FFBD42"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D905BCB6193E20CA78FFBD42
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi linux-firmware maintainers.

The attached (sorry ;-) trivial patch, also available from
https://github.com/seife/linux-firmware.git adds two symlinks to make 
BananaPi M2 zero and M2 plus WiFi work out of the box.

Thanks,

	Stefan
-- 
Stefan Seyfried, Linux Consultant & Developer

B1 Systems GmbH
Osterfeldstraße 7 / 85088 Vohburg / http://www.b1-systems.de
GF: Ralph Dehner / Unternehmenssitz: Vohburg / AG: Ingolstadt,HRB 3537

--------------D905BCB6193E20CA78FFBD42
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-make-AP6212-in-bananpi-m2-plus-zero-work.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-make-AP6212-in-bananpi-m2-plus-zero-work.patch"

From be209721f6ea5fc20c27a90d9d4194a39c707570 Mon Sep 17 00:00:00 2001
From: Stefan Seyfried <seife+dev@b1-systems.com>
Date: Wed, 16 Dec 2020 14:24:40 +0100
Subject: [PATCH] make AP6212 in bananpi m2 plus/zero work

BananaPi M2 zero and M2 plus boards contain an AP6212 module which
works well with the default AP6212 config. Create symlinks so that
they work out of the box.

Signed-off-by: Stefan Seyfried <seife+dev@b1-systems.com>
---
 WHENCE | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/WHENCE b/WHENCE
index 687cc2c..24ffcf5 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2692,6 +2692,8 @@ Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdio.cubiet
 File: "brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt"
 File: "brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt"
 File: "brcm/brcmfmac43430-sdio.AP6212.txt"
+Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
-- 
2.29.2


--------------D905BCB6193E20CA78FFBD42--
