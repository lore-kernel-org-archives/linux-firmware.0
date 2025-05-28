Return-Path: <SRS0=VkXG=YM=molgen.mpg.de=pmenzel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD7BC5AE59
	for <linux-firmware@archiver.kernel.org>; Wed, 28 May 2025 07:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E595C4CEF0; Wed, 28 May 2025 07:07:58 +0000 (UTC)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3538BC4CEE7;
	Wed, 28 May 2025 07:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3538BC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af669.dynamic.kabel-deutschland.de [95.90.246.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AE289601EEA61;
	Wed, 28 May 2025 09:07:21 +0200 (CEST)
Message-ID: <afe65c91-9120-4327-84a0-faf2d341ebb0@molgen.mpg.de>
Date: Wed, 28 May 2025 09:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mediatek MT7925: update bluetooth firmware to
 20250526153203
To: Chris Lu <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Jiande Lu <jiande.lu@mediatek.com>,
 Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-firmware@kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20250528064625.533578-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250528064625.533578-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Chris,


Thank you for updating the firmware file


Am 28.05.25 um 08:46 schrieb Chris Lu:
> Update binary firmware for MT7925 BT devices.
> 
> File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> Version: 20250526153203

It’d be great if you could add some kind of change-log compared to the 
previous version 20250425073330.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                        |   2 +-
>   .../mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin     | Bin 459695 -> 459887 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 93f849c4..c653db09 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6225,7 +6225,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>   Driver: mt7925 - MediaTek MT7925 bluetooth chipset
>   
>   File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> -Version: 20250425073330
> +Version: 20250526153203
>   
>   Licence: Redistributable. See LICENCE.mediatek for details.
>   
> diff --git a/mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin b/mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> index cce1ddaeefac5a70d7ac9172ef78ce6043bf1334..9263027786aa73ad3de420ff14131492ad7f16a6 100644

[…]


Kind regards,

Paul
