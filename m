Return-Path: <SRS0=Kolx=7I=collabora.com=nfraprado@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2653AC6FD1F
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Mar 2023 19:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E152CC433D2; Thu, 16 Mar 2023 19:18:34 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 302F8C433EF
	for <linux-firmware@kernel.org>; Thu, 16 Mar 2023 19:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 302F8C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C535B66030A6;
	Thu, 16 Mar 2023 19:18:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678994311;
	bh=i61gSr8D+YphjmXc/K8ablVlUsLEsAqRig6vCYrlFws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V96eG5CSmESRa7NEbxvf3USFhvDGn1S9DCCOo+53AhsQhO+5uvX+6M5kWxuCQzYI+
	 1YRBk9yrzaMqOmG0QJ0XRlxNYxxNEl8ogfw3B15I25I9so+FCH6HAJNz33THzF93jd
	 LRTnijIUF7Jsax3xmd4AYpnDoziX/bafgnBAc0Iu7qVV8Gz/+eiJDTO2NJSwhO0pL5
	 /scPrHji1SsIXqWAQ/PAFO/7NVZyagpeH5rP9v763+/uaPMkWaPGp+BxrRRYyLUJQ/
	 7vYFOUcE0S86GuAOgib6ewt5Nk7WU3YtbFyKJmF6HBKFPYgUdh8eh4N/dxhnkFT2v6
	 21RwZKK5FA1xw==
Date: Thu, 16 Mar 2023 15:18:26 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: TingHan Shen =?utf-8?B?KOayiOW7t+e/sCk=?= <TingHan.Shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	Yunfei Dong =?utf-8?B?KOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: Re: pull request: update mediatek mt8192/mt8195 SCP firmware
Message-ID: <20230316191826.zqnzbmyb2xos5tat@notapiano>
References: <a43524a089a783f70adbe89b83eeb01fbd405d04.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a43524a089a783f70adbe89b83eeb01fbd405d04.camel@mediatek.com>

On Wed, Mar 15, 2023 at 03:20:03AM +0000, TingHan Shen (沈廷翰) wrote:
> Hi ,
> 
> This is a companion update for https://lore.kernel.org/all/20230314072557.29669-1-yunfei.dong@mediatek.com/.
> 
> Please let me know if there is any issue, thank you.

Hi TingHan,

thank you for the patch.

I can confirm that both firmwares do indeed support both MM21 and MT21C formats
(based on enum mtk_vdec_format_types):

MT8192:
[ 2664.319640] mtk_vcodec_dec:fops_vcodec_open: fops_vcodec_open(),212: decoder capability 770

MT8195:
[   64.265701] mtk_vcodec_dec:fops_vcodec_open: fops_vcodec_open(),212: decoder capability 20f60

The MT21C format does indeed provide a compressed output. And with the driver
patch linked above to force selection of the MM21 format, I was able to run
fluster using all of VP8, VP9 and H.264 codecs, on both platforms:

MT8192:
	        VP8: 59/61
	        VP9: 250/303
		     0/6 (HIGH)
	        H.264: 92/135
		       27/69 (JVT-FR-EXT)

MT8195:
	        VP8: 59/61
	        VP9: 276/303
		     0/6 (HIGH)
	        H.264: 95/135
		       27/69 (JVT-FR-EXT)

The MT8192 scp.img currently on linux-firmware had broken this behavior, so this
is great news.

So,

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> 
> --
> 
> The following changes since commit c761dbe804f903cc2df81f251d367cca285eca06:
> 
>   Merge tag 'iwlwifi-fw-2023-03-13' of http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware (2023-03-13 09:20:47 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20230315
> 
> for you to fetch changes up to d0997ff65cb1edd0a0d6d96c998618a912132c12:
> 
>   mediatek: Update mt8192/mt8195 SCP firmware to support MM21 and MT21 (2023-03-15 10:55:00 +0800)
> 
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: Update mt8192/mt8195 SCP firmware to support MM21 and MT21
> 
>  WHENCE                  |   4 ++--
>  mediatek/mt8192/scp.img | Bin 328096 -> 309164 bytes
>  mediatek/mt8195/scp.img | Bin 429920 -> 587828 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)
> 
> -- 
> Best regards,
> TingHan
