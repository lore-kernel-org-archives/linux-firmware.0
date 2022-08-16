Return-Path: <SRS0=Vzom=YU=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F26C00140
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Aug 2022 02:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D543C433C1; Tue, 16 Aug 2022 02:22:54 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A676AC433D6
	for <linux-firmware@kernel.org>; Tue, 16 Aug 2022 02:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A676AC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f91932d1d47e408bad9c89df0665eaf6-20220816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ipYSdnHtEGC1qJEq9yMaN5uK8xzGfbStENG7194dhRs=;
	b=tOjME5BiKr9Egyf6M1xVeDAANJn03DF8QoQ+e58dDUcd5PkpMgjlhpNS2viJABPqNr66Uv2aBJ7VOiL5PrIu+Nz49TI1KW29RipWEqGxmR3Baw2pYHCnB1dY68Ln2hrhMwWHc7HGjNf0deTYLCFDZ6HclJNIUZmqcn0eiwRF4sA=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:cfbb76d8-b752-4149-844b-d660bdea08ec,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:95
X-CID-INFO: VERSION:1.1.9,REQID:cfbb76d8-b752-4149-844b-d660bdea08ec,OB:0,LOB:
	0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS9
	81B3D,ACTION:quarantine,TS:95
X-CID-META: VersionHash:3d8acc9,CLOUDID:de66c29c-da39-4e3b-a854-56c7d2111b46,C
	OID:38488be77326,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f91932d1d47e408bad9c89df0665eaf6-20220816
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1323242670; Tue, 16 Aug 2022 10:22:44 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 16 Aug 2022 10:22:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Aug 2022 10:22:43 +0800
Message-ID: <573792ba92de237d23a9a1c99cb45d5ccdff5067.camel@mediatek.com>
Subject: [PULL linux-firmware] Clean up mediatek WHENCE licence terms
From: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 16 Aug 2022 10:22:43 +0800
In-Reply-To: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
References: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi maintainers,

This pull request cleans up the WHENCE for MediaTek firmwares.

Please let me know if there are any problems.

Best regards,
TingHan

---

The following changes since commit 8413c63c7a539a912be8851ce941eea32dcd1786:

  Merge branch 'lenovo-thinkpad-x13s' of https://github.com/mrhpearson/linux-firmware (2022-08-15
09:02:17 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-20220816

for you to fetch changes up to a1c4b15986c07cdad873a72b1e130ea1fb02c5fa:

  mediatek: reference the LICENCE file for MediaTek firmwares (2022-08-16 10:13:16 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: reference the LICENCE file for MediaTek firmwares

 WHENCE | 42 ++++++------------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

