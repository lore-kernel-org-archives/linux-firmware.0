Return-Path: <SRS0=Ym9N=SD=molgen.mpg.de=pmenzel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5AAD5E147
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Nov 2024 08:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08721C4CED3; Fri,  8 Nov 2024 08:38:16 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80E15C4CECD;
	Fri,  8 Nov 2024 08:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80E15C4CECD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (unknown [95.90.242.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BDE3A600AA639;
	Fri, 08 Nov 2024 09:37:44 +0100 (CET)
Message-ID: <46444b60-2d1a-45c2-9a96-8352d1879516@molgen.mpg.de>
Date: Fri, 8 Nov 2024 09:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] linux-firmware: update firmware for mediatek bluetooth
 chip (MT7920)
To: Chris Lu <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Allan Wang <allan.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-firmware@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241108082515.19817-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20241108082515.19817-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Chris,


Thank you for your patch. Maybe include the version in the 
summary/title? `linux-firmware` also seems redundant. Maybe:

mediatek MT7920: Update BT_RAM_CODE_MT7961_1a_2_hdr to 20241104091246

mediatek MT7920: Update BT_RAM_CODE_MT7961_1a_2_hdr from 20240930111457 
to 20241104091246

Am 08.11.24 um 09:25 schrieb Chris Lu:
> Update binary firmware for MT7920 BT devices.
> 
> File: mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin

The summary says MT7920, but the file name has MT7961. Is MT7961 a part 
of MT7920?

> Version: 20241104091246

It’d be great if you added a change-log.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                   |   2 +-
>   mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin | Bin 493809 -> 493809 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)


Kind regards,

Paul
