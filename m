Return-Path: <SRS0=6DE2=NY=mediatek.com=irui.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5342C27C53
	for <linux-firmware@archiver.kernel.org>; Sat, 22 Jun 2024 10:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91EC6C32789; Sat, 22 Jun 2024 10:24:04 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E967C3277B
	for <linux-firmware@kernel.org>; Sat, 22 Jun 2024 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E967C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 84f0d5a8308111ef8da6557f11777fc4-20240622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MH6dYmQyhSE1302eUMFhKU681PeVCQBf2giSqmdTtj8=;
	b=qx9jTpzNRZKJG/+lil+51Qj8nu83Tj/peQE5MrJixrQ0b1K0ISMwt2Bqe3L2BAaUj8aqE72j/DH45JLk5k8k4tBwVwbbAw/yEVVEaaypbZ5vI+YHYAZNFpdj4DAlZ013Ke0u6w4/sJSHkS3EEzUhiRtwcITdjCGlRmrwemqxJ0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:573a5c91-d1df-434a-809f-97e2446a8e7a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:66216685-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 84f0d5a8308111ef8da6557f11777fc4-20240622
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1161163017; Sat, 22 Jun 2024 18:23:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 22 Jun 2024 18:23:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 22 Jun 2024 18:23:49 +0800
From: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 
Date: Sat, 22 Jun 2024 18:23:46 +0800
Message-ID: <20240622102347.7004-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Dear linux-firmware maintainers,

The following changes since commit 77eb1a9398784c42e23ad087acddef599f0dd9d7:

  Merge branch 'robot/pr-0-1718900951' into 'main' (2024-06-20 16:54:34 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.2.0.git  v1.2.0

for you to fetch changes up to 9e6aff680098f0def484e018413ad7c002c2f4fd:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0 (2024-06-22 18:06:17 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.2.0

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)


