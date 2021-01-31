Return-Path: <SRS0=Sn2P=HC=columbus.rr.com=scott.andrews@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=BAYES_40,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1492C433E0
	for <linux-firmware@archiver.kernel.org>; Sun, 31 Jan 2021 03:21:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6A84B64E19; Sun, 31 Jan 2021 03:21:15 +0000 (UTC)
X-Greylist: delayed 90 seconds by postgrey-1.34 at mail.kernel.org; Sun, 31 Jan 2021 03:21:14 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C17F564E18
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=columbus.rr.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=scott.andrews@columbus.rr.com
Received: from p-impout004.msg.pkvw.co.charter.net (p-impout004aa.msg.pkvw.co.charter.net [47.43.26.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C17F564E18
	for <linux-firmware@kernel.org>; Sun, 31 Jan 2021 03:21:14 +0000 (UTC)
Received: from rpi3.example.org ([65.186.67.174])
	by cmsmtp with ESMTP
	id 63H4l73bgT9mm63H4l4oJc; Sun, 31 Jan 2021 03:19:43 +0000
X-Authority-Analysis: v=2.3 cv=QZ4YQfTv c=1 sm=1 tr=0
 a=sU9zvJ2IlmR+ljC8PmHqMA==:117 a=sU9zvJ2IlmR+ljC8PmHqMA==:17
 a=IkcTkHD0fZMA:10 a=EmqxpYm9HcoA:10 a=xZbUXDpwH2uEOEeZ0NcA:9 a=QEXdDO2ut3YA:10
Received: from scott.columbus.rr.com ([192.168.1.54] helo=scott.example.org)
	by rpi3.example.org with esmtp (Exim 4.92.1)
	(envelope-from <scott.andrews@columbus.rr.com>)
	id 1l63H4-0004vb-Hh
	for linux-firmware@kernel.org; Sat, 30 Jan 2021 22:19:42 -0500
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Scott Andrews <scott.andrews@columbus.rr.com>
Subject: Firmware for raspberry pi brcm
Message-ID: <cb624be6-b907-60f9-c354-475d33f325dd@columbus.rr.com>
Date: Sat, 30 Jan 2021 22:19:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux armv7l; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfJcQHHVeVS3m3hE/ueiQYES6048QVqqwZFhzDv/BXYojyo46FuW7QuK2sRHrRaVcZsK+CD1PEuE3vGN4AIBkq0dqBxxHFS2/ZbSu8xrVK7QyQjxqHulr
 r7biXxQuTSOtjJOU9h44m6vl6qyKtQXZmt9IvZ6oh3vUp1X2ay4nMoBDKh53j6sT3e5X8GNiw/KGBw==

All the firmware for raspberry pi wireless seems to have been removed.

brcmfmac43430-sdio.bin

brcmfmac43430-sdio.bin

brcmfmac43455-sdio.bin

brcmfmac43455-sdio.clm_blob

brcmfmac43456-sdio.bin

brcmfmac43456-sdio.clm_blob

More may be missing but I only use the firmware for RPI3 and RPI4

I had to get the firmware from raspios after I temporary installed it

