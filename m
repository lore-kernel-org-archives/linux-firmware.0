Return-Path: <SRS0=zDeJ=ZT=collabora.com=angelogioacchino.delregno@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818D8ECAAD8
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Sep 2022 08:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CEAEC433D6; Fri, 16 Sep 2022 08:36:08 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70669C433C1
	for <linux-firmware@kernel.org>; Fri, 16 Sep 2022 08:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70669C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A5256601F3F;
	Fri, 16 Sep 2022 09:36:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663317364;
	bh=DMIlwgFh1yzu3iWUbxH6mn4JH7kYeaOeF3u/P7kRbyA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JjEemS5qJb4d4lNyqVW+8NFgqJOmiGR0KdStqsQ1mlSJ2b5D6RS8sbATeri8ZxPcn
	 nmgyP4kz7s2PTLJvMOe0imJN1w80tlLL+Z3oVyYv0HVoeaBumj4A4t0DLKpu9ooKjG
	 Ze4mGpr11IY11YIct8s9mZH7o+SJtzigjRUXIcp7QKfgmVnD08Vyx4lDW6+c5QqwFr
	 bZRb5rTZbYFz+mOvUkDxezVcFl0qrWwCGcl3Fn8TXT444TpR17vVGDobcZBrZlaeaf
	 y/AnnuxLuEOS3KH/1JbAaQ3CCqB79VU142PztusPLR3vmJSzje5IHt2lGVysV/xSRN
	 n6xx3neyYwMSA==
Message-ID: <5ab1617f-2ecf-dd15-616a-5c2555d36020@collabora.com>
Date: Fri, 16 Sep 2022 10:36:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PULL v2 linux-firmware] Update mediatek mt81xx SOF firmware
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: TingHan Shen <tinghan.shen@mediatek.com>, linux-firmware@kernel.org
Cc: linux-mediatek@lists.infradead.org, chunxu.li@mediatek.com,
 allen-kh.cheng@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/09/22 10:35, TingHan Shen ha scritto:
> Hi maintainers,
> 
> This pull request adds new MediatekTek MT8195 SOF firmware and
> updates MT8186 SOF firmware.
> 
> Please let me know if there is any problem.

It's fine now, thank you!

Regards,
Angelo

> 
> Best regards,
> TingHan
> 
> --
> 
> The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
> 
>    amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/tinghan-shen/linux_fw_scp mtk-20220915
> 
> for you to fetch changes up to 3e08c58f8af488c41573c4a64a261e3b3f35849b:
> 
>    mediatek: Add new mt8195 SOF firmware (2022-09-16 16:19:11 +0800)
> 
> ----------------------------------------------------------------
> Tinghan Shen (2):
>        mediatek: Update mt8186 SOF firmware
>        mediatek: Add new mt8195 SOF firmware
> 
>   WHENCE                                                                                      |  11 ++++++++---
>   mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
>   mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                  | Bin 0 -> 20895 bytes
>   .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
>   mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
>   mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
>   mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
>   mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
>   8 files changed, 8 insertions(+), 3 deletions(-)
>   rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
>   create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
>   rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
>   create mode 100644 mediatek/sof/sof-mt8186.ldc
>   create mode 100644 mediatek/sof/sof-mt8195.ldc
>   create mode 100644 mediatek/sof/sof-mt8195.ri
> 


