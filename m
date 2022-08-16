Return-Path: <SRS0=Vzom=YU=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6B5C00140
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Aug 2022 01:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11790C433D6; Tue, 16 Aug 2022 01:43:28 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A514EC433C1;
	Tue, 16 Aug 2022 01:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A514EC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5c61116fe9fe481b8bc7983289451683-20220816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eD5G5vRYVeJTazLCvxqkE8EG2fzJX8GMm55+IwwZtjk=;
	b=WyF2llk3+edmEQ+6bmqY4N/UmVzyfb2qwg9ISMB6mGZt54sEcqQDU+vT4jiFBld0qvz8PnHaeqEZKrwzHkcvgElwSHar0yHK8CJNIb85A+qjZilpiS/PYuvEUBUWW9PFNVhxYn65H3VRvWvkxZb9QqbuPrWYrcRma3xNkJzk434=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:4d310654-5048-436b-a863-a22edd5e0497,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:59f0c09c-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 5c61116fe9fe481b8bc7983289451683-20220816
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 960259297; Tue, 16 Aug 2022 09:43:17 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Aug 2022 09:43:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 09:43:15 +0800
Message-ID: <ca48295d59f23b68ef48b303e8d3e065ac95378e.camel@mediatek.com>
Subject: Re: [PULL linux-firmware] mediatek mt8186 SOF firmware v0.2.0
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<chunxu.li@mediatek.com>, <allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 16 Aug 2022 09:43:16 +0800
In-Reply-To: <CA+5PVA5_tj63z8izA_wigVtXzCUDSbuAhgtpVS6psSBdSXJ1dg@mail.gmail.com>
References: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
	 <CA+5PVA5_tj63z8izA_wigVtXzCUDSbuAhgtpVS6psSBdSXJ1dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

On Mon, 2022-08-15 at 09:01 -0400, Josh Boyer wrote:
> On Mon, Aug 15, 2022 at 5:13 AM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> > 
> > Hi maintainers,
> > 
> > This pull request adds new MediatekTek firmware for MT8186 SOF.
> > 
> > Please let me know if there are any problems.
> > 
> > Best regards,
> > TingHan
> > 
> > ---
> > 
> > The following changes since commit ad5ae82019480dc1feffb538c118397a40934e62:
> > 
> >   Merge branch 'main' of 
> > https://urldefense.com/v3/__https://github.com/suraj714/BT-Upstream__;!!CTRNKA9wMg0ARbw!1yTVOC7UDhMs-zna3kGo4Pq4k6mbowX_CHWQLh_iIdpK3fQ2bZEwZd0e2XNzAwQPNFc$
> >   (2022-08-10 07:58:34 -0400)
> > 
> > are available in the Git repository at:
> > 
> >   
> > https://urldefense.com/v3/__https://github.com/tinghan-shen/linux_fw_scp__;!!CTRNKA9wMg0ARbw!1yTVOC7UDhMs-zna3kGo4Pq4k6mbowX_CHWQLh_iIdpK3fQ2bZEwZd0e2XNzSAFZtnA$
> >   mt8186-sof-20220815
> > 
> > for you to fetch changes up to 12ca0753342651fa2ab640deffde5e51b0dd9868:
> > 
> >   mediatek: Add new mt8186 SOF firmware (2022-08-15 16:43:11 +0800)
> > 
> > ----------------------------------------------------------------
> > Tinghan Shen (1):
> >       mediatek: Add new mt8186 SOF firmware
> > 
> >  WHENCE                                              |  21 +++++++++++++++++++++
> 
> Pulled and pushed out.
> 
> I noticed several of the Mediatek entries in WHENCE all put the
> license information in the WHENCE file, but LICENCE.mediatek also
> exists with the same terms.  Can we clean up WHENCE and just have all
> the entries reference that file?
> 
> josh

No problem. I hadn't noticed that file before.
I'll send another pull request to clean it.

Best regards,
TingHan

