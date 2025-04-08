Return-Path: <SRS0=b6AL=W2=mediatek.com=zoran.zhan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F7C3600C
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Apr 2025 08:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14B43C4CEE9; Tue,  8 Apr 2025 08:14:27 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D498CC4CEE5
	for <linux-firmware@kernel.org>; Tue,  8 Apr 2025 08:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D498CC4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 738ec1bc145111f08eb9c36241bbb6fb-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=b0xWe0ofKTYajpgnthI9jgKiT8gjjJuUi7JF4fzkGDs=;
	b=H3Y1qXL6sLNgRFHQ0nJUGXtAFY7ICMQEKf1GThxphuZ0Wb8ydznYyNsDeDJZ3v/7r+Ci70jfsTaLCGcCA0qJa7IBki9VEcciniUnLJPCmYocBN4/SInrgi5S5uA5+LXn/l3D/TY1GhTBvToY7U0Y99rRYY4SLzev1T/gGiFoFDc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:53c95354-3f52-4239-a08e-6e708d7f2332,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:f1fdd0a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 738ec1bc145111f08eb9c36241bbb6fb-20250408
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <zoran.zhan@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2029712087; Tue, 08 Apr 2025 16:14:11 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 16:14:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 16:14:09 +0800
From: Zoran Zhan <zoran.zhan@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
CC: linux-mediatek <linux-mediatek@lists.infradead.org>, <shawnku@google.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>
Subject: pull request: linux-firmware: Add MediaTek MT8188 and MT8195 SOF firmware
Date: Tue, 8 Apr 2025 16:12:34 +0800
Message-ID: <20250408081404.302196-1-zoran.zhan@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit d864697fd38a94092b636c8030843343f265fe69:

  Merge branch 'rtl-bt' into 'main' (2025-04-01 11:24:40 +0000)

are available in the Git repository at:

  https://github.com/zoran055/linux_fw_sof zoran/soffw_0327

for you to fetch changes up to a7b3d211e8ef628ab84d955d1b13d2070388fd02:

  mediatek: Add new mt8195 SOF firmware (2025-04-07 16:04:56 +0800)

----------------------------------------------------------------
Zoran Zhan (2):
      mediatek: Add new mt8188 SOF firmware
      mediatek: Add new mt8195 SOF firmware

 WHENCE                            |   8 ++++++++
 mediatek/sof-tplg/sof-mt8188.tplg | Bin 0 -> 16191 bytes
 mediatek/sof-tplg/sof-mt8195.tplg | Bin 0 -> 16191 bytes
 mediatek/sof/sof-mt8188.ldc       | Bin 0 -> 53900 bytes
 mediatek/sof/sof-mt8188.ri        | Bin 0 -> 112488 bytes
 5 files changed, 8 insertions(+)
 create mode 100644 mediatek/sof-tplg/sof-mt8188.tplg
 create mode 100644 mediatek/sof-tplg/sof-mt8195.tplg
 create mode 100644 mediatek/sof/sof-mt8188.ldc
 create mode 100644 mediatek/sof/sof-mt8188.ri

