Return-Path: <SRS0=NUt2=2Z=mediatek.com=huayu.zong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65335CA0EDC
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Aug 2025 01:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 279E7C4CEF8; Wed, 13 Aug 2025 01:58:21 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39414C4CEF0
	for <linux-firmware@kernel.org>; Wed, 13 Aug 2025 01:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39414C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f7c1aad077e811f0b33aeb1e7f16c2b6-20250813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XwMXWexvt6tR9BupyFp6yXOjD8SMPvd/Ny1SKZuMldg=;
	b=JmpjB5zYXgtAa9RvOLrRcwG/ZAZjUzVjQCQDgZ/m731UKpm/AgVc+6EMay6mFOZN0jIrHAGfD4TyaRgvd0YlDQk2gEwbHthTwllnX6+lWVHp+7I7RmZt1+yNVXu3+G894gcWqo+D/Jl7gegD7TckNOsScY7XAxBeJ7X0WeX9A3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:bf8c3294-dd0b-4521-a594-29bf370b8451,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:98ab5da1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f7c1aad077e811f0b33aeb1e7f16c2b6-20250813
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 599310592; Wed, 13 Aug 2025 09:58:12 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 13 Aug 2025 09:58:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 13 Aug 2025 09:58:09 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Create Mediatek MT8189 SCP firmware
Date: Wed, 13 Aug 2025 09:53:22 +0800
Message-ID: <20250813015808.26203-1-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:

  Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +0000)

are available in the Git repository at:

  https://github.com/HuayuZong/linux-firmware-mt8189-scp mt8189-fw-upstream

for you to fetch changes up to d66f2394a85934817f5597d161ce2c1cbd6a2b96:

  mediatek: Add MT8189 SCP firmware (2025-08-13 09:50:34 +0800)

----------------------------------------------------------------
Huayu Zong (1):
      mediatek: Add MT8189 SCP firmware

 WHENCE                  |   2 ++
 mediatek/mt8189/scp.img | Bin 0 -> 6588300 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8189/scp.img

