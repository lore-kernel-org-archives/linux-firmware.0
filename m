Return-Path: <SRS0=yaD8=JT=ipik.org=spam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC32C433ED
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Apr 2021 17:47:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2ED7E613F5; Thu, 22 Apr 2021 17:47:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11896613B8;
	Thu, 22 Apr 2021 17:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11896613B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ipik.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=spam@ipik.org
X-Originating-IP: 88.136.76.194
Received: from [192.168.19.33] (194.76.136.88.rev.sfr.net [88.136.76.194])
	(Authenticated sender: sendmail@ipik.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 484E9C0004;
	Thu, 22 Apr 2021 17:47:51 +0000 (UTC)
From: Michel Piquemal <spam@ipik.org>
Subject: Re: brcm: add missing symlink for Pi Zero W NVRAM file
To: jwboyer@kernel.org
References: <0c5cfa45-1bc6-3f63-435b-5281529457d4@ipik.org>
 <CA+5PVA5Zs8iX77chTnZfw38OHbV+Y4G0ib3B-2_+O4oGv9ERzg@mail.gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Message-ID: <5c22e2d0-8397-71d5-0395-e9fac50aeaba@ipik.org>
Date: Thu, 22 Apr 2021 19:47:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CA+5PVA5Zs8iX77chTnZfw38OHbV+Y4G0ib3B-2_+O4oGv9ERzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 7bit


On 21/04/2021 13:23, Josh Boyer wrote:
> On Mon, Apr 19, 2021 at 1:38 PM Michel Piquemal <spam@ipik.org> wrote:
>>
>> Raspberry Pi Zero W has no NVRAM files specified and dmesg reports the
>> following error at boot:
>> brcmfmac mmc1:0001:1: Direct firmware load for
>> brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt failed with error -2
>>
>> Pi Zero W uses same wifi BCM43430 module than Pi 3 model B:
>> symlinking to that Pi 3b NVRAM file fixes the issue, and wifi works as
>> expected.
>>
> Your patch is corrupted and doesn't apply.  Please update your local
> tree to the latest in git and resend.
> 
> josh
> 

Hi. Apologies it got mangled by mail client; here it is again:

Signed-off-by: Michel Piquemal <spam@ipik.org>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 9699246..57f7cbb 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2771,6 +2771,7 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.t
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
+Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
-- 
2.28.0

