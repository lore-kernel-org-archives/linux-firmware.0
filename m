Return-Path: <SRS0=DvUr=Z6=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FB1C07E9D
	for <linux-firmware@archiver.kernel.org>; Tue, 27 Sep 2022 02:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 300B5C433C1; Tue, 27 Sep 2022 02:13:00 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEA32C433D6;
	Tue, 27 Sep 2022 02:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEA32C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c139f6fdbed148e0902e1ed0f2320c24-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=V+q13yZDqENXy1FOydXcSZraRyY3jub7Y3xr4iCyUYY=;
	b=lpcVUtI8sKtAEMVRt/IdRKgdQqk42+pQheFmUYqauZazSNs16lXJBjGnqsjdN0BIIZhC7WfavDLdKMKqOTHDDIENAKLEYMwhAZvfpwFtVEzy3aZKgb0q9AqbABwHw9WDgag50ntOhqVPhqQmgzvrrflbDLpJv8q0zCV2Dl77q+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:083d3d9b-7043-4809-bcf4-b700f8c2b8e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.11,REQID:083d3d9b-7043-4809-bcf4-b700f8c2b8e8,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:39a5ff1,CLOUDID:bc4a4fe4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:220926222724XZJW1LIF,BulkQuantity:64,Recheck:0,SF:28|17|19|48|823|82
	4,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0
X-UUID: c139f6fdbed148e0902e1ed0f2320c24-20220927
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1765595324; Tue, 27 Sep 2022 10:12:44 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 10:12:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 27 Sep 2022 10:12:43 +0800
Message-ID: <668c8e070faa138d5a2bf345f65a27fab908842f.camel@mediatek.com>
Subject: Re: [PULL v2 linux-firmware] Update mediatek mt81xx SOF firmware
From: TingHan Shen <tinghan.shen@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<chunxu.li@mediatek.com>, <allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>
Date: Tue, 27 Sep 2022 10:12:43 +0800
In-Reply-To: <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
References: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
	 <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

On Mon, 2022-09-26 at 10:27 -0400, Josh Boyer wrote:
> On Fri, Sep 16, 2022 at 4:35 AM TingHan Shen <tinghan.shen@mediatek.com> wrote:
> > 
> > Hi maintainers,
> > 
> > This pull request adds new MediatekTek MT8195 SOF firmware and
> > updates MT8186 SOF firmware.
> > 
> > Please let me know if there is any problem.
> > 
> > Best regards,
> > TingHan
> > 
> > --
> > 
> > The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
> > 
> >   amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
> > 
> > are available in the Git repository at:
> > 
> >   https://urldefense.com/v3/__https://github.com/tinghan-shen/linux_fw_scp__;!!CTRNKA9wMg0ARbw!zqfFVP7tWlJ3XFU-l8fMAh36-BXt04WguMdj2WJq4tCdMxoKl0Ikb3chkJ9nzBB0I0Q$  mtk-20220915
> > 
> > for you to fetch changes up to 3e08c58f8af488c41573c4a64a261e3b3f35849b:
> > 
> >   mediatek: Add new mt8195 SOF firmware (2022-09-16 16:19:11 +0800)
> > 
> > ----------------------------------------------------------------
> > Tinghan Shen (2):
> >       mediatek: Update mt8186 SOF firmware
> >       mediatek: Add new mt8195 SOF firmware
> > 
> >  WHENCE                                                                                      |  11 ++++++++---
> >  mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
> >  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                  | Bin 0 -> 20895 bytes
> >  .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
> 
> This fails check_whence.py:
> 
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg not
> listed in WHENCE
> [jwboyer@vader linux-firmware]$
> 
> Can you fix it up please?
> 
> josh
> 
> >  mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
> >  mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
> >  mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
> >  mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
> >  8 files changed, 8 insertions(+), 3 deletions(-)
> >  rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
> >  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
> >  rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
> >  create mode 100644 mediatek/sof/sof-mt8186.ldc
> >  create mode 100644 mediatek/sof/sof-mt8195.ldc
> >  create mode 100644 mediatek/sof/sof-mt8195.ri
> > 

Hi josh,

I forgot to update the WHENCE after added the file.
I'm sorry, and following is the udpated PR.

Best regards,
TingHan

--

The following changes since commit 126b56964ff8714657eb51a28cc07a31629e603d:

  Merge branch 'guc_70.5.1_huc_nover' of git://anongit.freedesktop.org/drm/drm-firmware (2022-09-26 10:30:08 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-20220915

for you to fetch changes up to daee413cb1a49ce87d237247dbdfcea405ee3b99:

  mediatek: Add new mt8195 SOF firmware (2022-09-27 10:03:00 +0800)

----------------------------------------------------------------
Tinghan Shen (2):
      mediatek: Update mt8186 SOF firmware to v0.2.1
      mediatek: Add new mt8195 SOF firmware

 WHENCE                                                                                                |  12 +++++++++---
 mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}                     | Bin
 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                            | Bin 0 -> 20895 bytes
 mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
 mediatek/sof/sof-mt8186.ldc                                                                           | Bin 0 -> 48436 bytes
 mediatek/sof/sof-mt8186.ri                                                                            | Bin 128712 -> 128712 bytes
 mediatek/sof/sof-mt8195.ldc                                                                           | Bin 0 -> 40568 bytes
 mediatek/sof/sof-mt8195.ri                                                                            | Bin 0 -> 100740 bytes
 8 files changed, 9 insertions(+), 3 deletions(-)
 rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
 rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
 create mode 100644 mediatek/sof/sof-mt8186.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ri



