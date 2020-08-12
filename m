Return-Path: <SRS0=+pxj=BW=suse.com=mbrugger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D198BC433E0
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Aug 2020 15:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C21452080C; Wed, 12 Aug 2020 15:10:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF0220781;
	Wed, 12 Aug 2020 15:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF0220781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mbrugger@suse.com
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D392BAEE6;
	Wed, 12 Aug 2020 15:11:03 +0000 (UTC)
Subject: Re: [PATCH] brcm: Add
 brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt symlink
List-Id: <linux-firmware.lore.kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>, linux-firmware@kernel.org
Cc: jwboyer@kernel.org
References: <20200812143315.1853427-1-pbrobinson@gmail.com>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <b6422746-1ae7-6b7c-4822-42f41c2be88a@suse.com>
Date: Wed, 12 Aug 2020 17:10:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812143315.1853427-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/08/2020 16:33, Peter Robinson wrote:
> The Raspberry Pi 3A+ uses the same WiFi module and NVRAM as the 3B+ and
> Raspbian uses the same file for both models so we can symlink the 3A+ to
> the 3B+ to have WiFi work on those devices too.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Matthias Brugger <mbrugger@suse.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   WHENCE | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/WHENCE b/WHENCE
> index be8c390..8f74167 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2624,6 +2624,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
>   File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
>   File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
>   File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
> +Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>   File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
>   File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
>   File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> 
