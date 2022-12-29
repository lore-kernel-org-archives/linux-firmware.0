Return-Path: <SRS0=s92x=43=mediatek.com=chris.lu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5110FC4332F
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Dec 2022 09:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 076D8C433F1; Thu, 29 Dec 2022 09:30:51 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AC5CC433F0;
	Thu, 29 Dec 2022 09:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AC5CC433F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 28528b3f37ea46babc10e30a0a762d47-20221229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sXcNxMU0XkRUEU/VSFPQ9YDdBU2AUeJjvtvf4/nko/s=;
	b=rrLMUWeXobNnkpcSIwzijCuB6eOJNFwRWUIZEDXAU5aUMoM5VLc2gUDzuzoWvoVf/xwPNR3Vb+3hHgvYqbWA2uWWg4cG4lTdSZCagkKxTkeDxZTUnV0fx1NvIqO8q+Wmr8MJftOhKDYPcJ00FHFWi+MitWBs5+c+2lhSLzLRKqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:3d12f546-24df-4595-995e-af0b7bcd303c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:74c14af4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 28528b3f37ea46babc10e30a0a762d47-20221229
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1767341134; Thu, 29 Dec 2022 17:30:44 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Dec 2022 17:30:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 29 Dec 2022 17:30:44 +0800
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
Subject: [PATCH] linux-firmware: update firmware for mediatek bluetooth chip (MT7922)
Date: Thu, 29 Dec 2022 17:30:40 +0800
Message-ID: <20221229093041.25434-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain

From: "Chris.Lu" <chris.lu@mediatek.com>

*** BLURB HERE ***

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7922)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin | Bin 505558 -> 506710 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
 mode change 100755 => 100644 mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin

-- 
2.18.0

