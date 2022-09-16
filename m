Return-Path: <SRS0=oq2c=ZT=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308CCECAAD8
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Sep 2022 08:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF29AC433B5; Fri, 16 Sep 2022 08:16:55 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4667BC433D7
	for <linux-firmware@kernel.org>; Fri, 16 Sep 2022 08:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4667BC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 601f64ac4d8d43098119da4e0a176bab-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MLZIOkEjEyE+zAQv9v+Cv5xDRXAHppMKiS00s2v2zx8=;
	b=NicPOOYROVvGBCJV4JsFCQdZweF+WgsDG3Huh1tmBvN3rpSOCyjzHERS638SjHnpNuwdEwBkmrMwbBNjQPqfuZ2gkFfDYB2/j1c+ac1UKouepX1Nr9FpDpKknoGwOLogaAZuDc2Syb03ABvpegyZhRZqk2bGBok1nm16rUxFu+c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d2dac62e-2bf3-480e-8feb-87a13862b7ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:da9ce25d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 601f64ac4d8d43098119da4e0a176bab-20220916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1856244550; Fri, 16 Sep 2022 16:16:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 16:16:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 16:16:44 +0800
Message-ID: <2583b4850bb68c4d68a4f0a2131f900eb4c8c4c4.camel@mediatek.com>
Subject: Re: [PULL linux-firmware] Update mediatek mt81xx SOF firmware
From: TingHan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <chunxu.li@mediatek.com>,
	<allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 16 Sep 2022 16:16:43 +0800
In-Reply-To: <8b130b9c-1d86-46de-f4c8-1a9cdae45c45@collabora.com>
References: <20220916032146.17774-1-tinghan.shen@mediatek.com>
	 <8b130b9c-1d86-46de-f4c8-1a9cdae45c45@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

On Fri, 2022-09-16 at 09:28 +0200, AngeloGioacchino Del Regno wrote:
> Il 16/09/22 05:21, Tinghan Shen ha scritto:
> > Hi maintainers,
> > 
> > This pull request adds new MediatekTek MT8195 SOF firmware and
> > updates MT8186 SOF firmware.
> > 
> > Please let me know if there is any problem.
> > 
> 
> TingHan, please, also add sof-mt8195-mt6359-rt1019-rt5682-dts.tplg as
> that's used by "google,tomato" (for more information, please check
> sound/soc/sof/mediatek/mt8195/mt8195.c).
> 
Hi Angelo,

ok, I'll update this PR.

Thanks,
TingHan



> Thanks,
> Angelo
> 
> > Best regards,
> > TingHan
> > 
> > ---
> > 
> > The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
> > 
> >    amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
> > 
> > are available in the Git repository at:
> > 
> >    https://urldefense.com/v3/__https://github.com/tinghan-shen/linux_fw_scp__;!!CTRNKA9wMg0ARbw!zpAPF7ykmOeU8Bo8r1QtkNh24moDSk8fNvQn-Nh0JRetcsd-Lpc0IaQb5qbHCH5S9Hc$  mtk-20220915
> > 
> > for you to fetch changes up to 78cff08a90dff21fe6f5f2f961d12604bd125e95:
> > 
> >    mediatek: Add new mt8195 SOF firmware (2022-09-16 10:42:01 +0800)
> > 
> > ----------------------------------------------------------------
> > Tinghan Shen (2):
> >        mediatek: Update mt8186 SOF firmware
> >        mediatek: Add new mt8195 SOF firmware
> > 
> >   WHENCE                                                                                      |  11 ++++++++---
> >   mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
> >   .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
> >   mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
> >   mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
> >   mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
> >   mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
> >   7 files changed, 8 insertions(+), 3 deletions(-)
> >   rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
> >   rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
> >   create mode 100644 mediatek/sof/sof-mt8186.ldc
> >   create mode 100644 mediatek/sof/sof-mt8195.ldc
> >   create mode 100644 mediatek/sof/sof-mt8195.ri
> > 
> 
> 


