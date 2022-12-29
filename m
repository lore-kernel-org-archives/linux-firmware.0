Return-Path: <SRS0=s92x=43=mediatek.com=chris.lu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746DEC4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Dec 2022 09:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4735FC433F0; Thu, 29 Dec 2022 09:40:33 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E2E1C433D2;
	Thu, 29 Dec 2022 09:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E2E1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c2d09f6da94044a5a2d502c91130019e-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rCm7hH5uXZuEM5snO1A0LAgtMHllZa9phPVhoVRh7Lw=;
	b=fKG6olQZRBtTJOcI+DifSraGDoVzQyoG5r70bcYEIXXWCCcHBIYTGe6GPfHsZQGoH7LWk/9fdtzenSygo5a2wWK3nYNdKMdLG1jZ1xYgsTWlmFEaOrAvHfE1y5NR2Uz/XpPaxxbgfC0DvpMgjMllLUtNFwlz+1GPSHPByjesxSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e616e866-21c0-4389-a8ae-507ff1ab70a6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:e616e866-21c0-4389-a8ae-507ff1ab70a6,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:c744bc8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:221229173018XW0JXP9M,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:41,QS:nil,BEC:nil,COL:0
X-UUID: c2d09f6da94044a5a2d502c91130019e-20221229
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1969920721; Thu, 29 Dec 2022 17:40:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 29 Dec 2022 17:40:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 17:40:23 +0800
From: <chris.lu@mediatek.com>
To: <jwboyer@kernel.org>, <dwmw2@infradead.org>, <ben@decadent.org.uk>,
	<marcel@holtmann.org>, <johan.hedberg@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: <sean.wang@mediatek.com>, <soul.huang@mediatek.com>,
	<yn.chen@mediatek.com>, <robin.chiu@mediatek.com>, <Deren.Wu@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jing.cai@mediatek.com>,
	<linux-firmware@kernel.org>, <linux-bluetooth@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Chris.Lu <chris.lu@mediatek.com>
Subject: [PATCH v2] linux-firmware: update firmware for mediatek bluetooth chip (MT7921)
Date: Thu, 29 Dec 2022 17:40:19 +0800
Message-ID: <20221229094020.26547-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain

From: "Chris.Lu" <chris.lu@mediatek.com>

*** BLURB HERE ***

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7921)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 527150 -> 527662 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0

