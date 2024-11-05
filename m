Return-Path: <SRS0=z7e8=SA=mediatek.com=macpaul.lin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EFDD1266B
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Nov 2024 08:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D40CC4CED0; Tue,  5 Nov 2024 08:49:11 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2565C4CECF
	for <linux-firmware@kernel.org>; Tue,  5 Nov 2024 08:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2565C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cfcdf25e9b5211efb88477ffae1fc7a5-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=gcU6PozuCPu9FYvIDE2uLOOUp6AETnyh7mULKCxSOMQ=;
	b=l3K0Q9lX6QSoD2uE+c61uvkkGnwNfXYF08K5DjPLwPoFaefbphv3OLJaj+7/+MDyNx/RFtha9j8srKer/K1qVGoicg7f+TnkNqU1o7W+Yk50yDKEV/FHLcXE8zNEh1it0wODee2XlodnZ1ImUaBHvwdfzYnsze58a9RpH26oC48=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:1cf1feff-4adf-4c5f-bb31-2da231ecf4d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b67ab748-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: cfcdf25e9b5211efb88477ffae1fc7a5-20241105
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 24391870; Tue, 05 Nov 2024 16:49:04 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 00:49:03 -0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 5 Nov 2024 16:49:03 +0800
Message-ID: <b70f15ef-aa99-e284-9238-6e7b327e2237@mediatek.com>
Date: Tue, 5 Nov 2024 16:49:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] WHENCE: Add sof-tolg for mt8195
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: yr.yang <yr.yang@mediatek.com>, <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>,
	<ao.tang@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, Pablo Sun
	<pablo.sun@mediatek.com>
References: <20241105071549.17476-1-yr.yang@mediatek.com>
 <20241105071549.17476-2-yr.yang@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241105071549.17476-2-yr.yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/24 15:12, yr.yang wrote:
> mediatek: Add sof-tolg for mt8195
> 
> Signed-off-by: yr.yang <yr.yang@mediatek.com>
                  ^^^^^^^
Please use git config --global user.name to set your full name here.
Do not use the same abbreviation as your email address.
We'd like to know how to spell your name correctly. :)

> ---
>   WHENCE | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/WHENCE b/WHENCE
> index 691291c3..dfa5ea70 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7529,6 +7529,9 @@ File: mediatek/sof/sof-mt8195.ldc
>   File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg
>   Version: v0.4.2
>   
> +File: mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
> +Version: v0.4.3
> +
>   Licence: Redistributable. See LICENCE.mediatek for details.
>   
>   --------------------------------------------------------------------------

Thanks
Macpaul Lin
