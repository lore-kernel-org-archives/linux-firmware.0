Return-Path: <SRS0=2Cek=3V=crapouillou.net=paul@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D324C4332F
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Nov 2022 23:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 237CCC433D7; Mon, 21 Nov 2022 23:07:16 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E57AAC433D6
	for <linux-firmware@kernel.org>; Mon, 21 Nov 2022 23:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E57AAC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1669072027; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:content-transfer-encoding:in-reply-to:
	 references; bh=HCw+3BKoLlCU+ZYO+9WB8uZ2LKaY9ZGDRG7UnD6s7vI=;
	b=lLuxmFFFoOFNfQxzIWcJMOOL04nbbIB7LWT5WLF1ygTK1OIHVan2XKvZ/o/RA6rCcJDLZ6
	YSu+Pp5+bb6gDyvINWPSI8GZjvJUZNcLDkIaumnlbB5i7B74WndTmR8cjqa5VrRMWLzYFv
	r6+v0P3kzAd2OtChsQAQB510leyYKSM=
Date: Mon, 21 Nov 2022 23:06:57 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Please bump brcm/bcm4330-sdio.bin firmware
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com, linux-mips@vger.kernel.org,
	Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>, Artur Rojek
	<contact@artur-rojek.eu>
Message-Id: <L70QLR.XAGB8X2431341@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

As a week-end project I got the BCM4330 chip to work with the mainline 
Linux kernel on the MIPS CI20 board. One of the problems I was facing 
was the firmware crashing, resulting in timeout errors in the brcmfmac 
driver.

It turns out the bcm4330-sdio.bin firmware that's currently in 
linux-firmware is not the latest one. Running "strings" on the blob 
points out to a version 5.90.125.104 dated 2011-10-25. The firmware 
that originally came on the CI20 is version 5.90.195.26 dated 
2012-05-09, and the version found in Android [1] is 5.90.195.114 dated 
2013-01-23. Only the last two will work on the CI20 board.

My question then, could we bump the firmware available in 
linux-firmware to the latest version? Or is there a valid reason why an 
older firmware is kept in the tree?

Best regards,
-Paul Cercueil

[1] 
https://android.googlesource.com/platform/hardware/broadcom/wlan/+/refs/heads/master/bcmdhd/firmware/bcm4330/fw_bcm4330_bg.bin


