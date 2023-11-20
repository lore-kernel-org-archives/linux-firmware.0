Return-Path: <SRS0=TKUL=HB=molgen.mpg.de=pmenzel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5735C54FB9
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Nov 2023 07:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9AE3C433C8; Mon, 20 Nov 2023 07:45:56 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 696BEC433C7;
	Mon, 20 Nov 2023 07:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 696BEC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.183] (ip5f5af683.dynamic.kabel-deutschland.de [95.90.246.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0F43B61E5FE01;
	Mon, 20 Nov 2023 08:45:10 +0100 (CET)
Message-ID: <06e1b728-64f8-400b-8a2d-212d67992227@molgen.mpg.de>
Date: Mon, 20 Nov 2023 08:45:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: update firmware for mediatek bluetooth
 chip (MT7921)
To: Chris Lu <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-firmware@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20231116081430.28211-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20231116081430.28211-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Chris,


Thank you for the patch.

Am 16.11.23 um 09:14 schrieb Chris Lu:
> Update binary firmware for MT7921 BT devices.
> 
> File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> Version: 20231109191416

It’d be great if you added the version in the git commit message 
summary/title too. The `linux-firmware` prefix is probably redundant. No 
idea if a tag exists for it. So, maybe:

mediatek: Update BT MT7921 fw from 20230526131214 to 20231109191416

or

Update Mediatek BT MT7921 fw to 20231109191416


Also, it would be great if you added the change-log to the commit 
message, so people have an idea, what improved.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                  |   2 +-
>   mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 532846 -> 532206 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 571308be..eb6b21e9 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5526,7 +5526,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>   Driver: mt7921 - MediaTek MT7921 bluetooth chipset
>   
>   File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> -Version: 20230526131214
> +Version: 20231109191416
>   
>   Licence: Redistributable. See LICENCE.mediatek for details.
>   
> diff --git a/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin b/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> index 4b637d5156f2893ebed13d55e58c1e30e9eb1195..c7a96755b122ef7aa601eb40fbd7abb9ca85a545 100644
> GIT binary patch
> literal 532206

[…]


Kind regards,

Paul
