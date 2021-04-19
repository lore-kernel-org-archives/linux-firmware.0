Return-Path: <SRS0=BhJD=JQ=ipik.org=spam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C8FC433ED
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 17:38:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F1A4A611F2; Mon, 19 Apr 2021 17:38:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D006108B;
	Mon, 19 Apr 2021 17:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11D006108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ipik.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=spam@ipik.org
X-Originating-IP: 88.136.76.194
Received: from [192.168.19.33] (194.76.136.88.rev.sfr.net [88.136.76.194])
	(Authenticated sender: sendmail@ipik.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 940D7FF80A;
	Mon, 19 Apr 2021 17:38:16 +0000 (UTC)
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org
From: Michel Piquemal <spam@ipik.org>
Subject: brcm: add missing symlink for Pi Zero W NVRAM file
Message-ID: <0c5cfa45-1bc6-3f63-435b-5281529457d4@ipik.org>
Date: Mon, 19 Apr 2021 19:38:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr

Raspberry Pi Zero W has no NVRAM files specified and dmesg reports the 
following error at boot:
brcmfmac mmc1:0001:1: Direct firmware load for 
brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt failed with error -2

Pi Zero W uses same wifi BCM43430 module than Pi 3 model B:
symlinking to that Pi 3b NVRAM file fixes the issue, and wifi works as 
expected.

Signed-off-by: Michel Piquemal <spam@ipik.org>


--- a/WHENCE
+++ b/WHENCE
@@ -2771,6 +2771,7 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,b
  File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
  File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
  File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
+Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> 
brcmfmac43430-sdio.raspberrypi,3-model-b.txt
  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> 
brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"


