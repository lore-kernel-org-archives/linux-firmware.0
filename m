Return-Path: <SRS0=0Hc/=7S=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DEED29DF3
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Jan 2026 09:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0FC28C19422; Tue, 13 Jan 2026 09:45:49 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FDCDC116C6
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 09:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FDCDC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a0b580aaf06411f0942a039f3f28ce95-20260113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TH9HLBFSf2M9aQf0oRpBhlUJN14RJoa5i1CqqbSox/4=;
	b=uzr1lc75P7NjCGAJ3DxA09paItdXdzkFw+LM5FArNqrz3B96zZjRIwN0KQQbqCUARGphPxYIVwC4QGTMd50J3Rhk8/XiuZqICHjJs291FVGol6KPSJeatN5uAizhF/GRcfWd+sZiz9BCknW14t1gDSzXlRUBYkES9thUBtUScf4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:64ab1204-08ea-420f-8f98-4baa56dc1bed,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:e303bc79-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a0b580aaf06411f0942a039f3f28ce95-20260113
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260073998; Tue, 13 Jan 2026 17:45:43 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 17:45:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 17:45:41 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>
Subject: rename MT8188 SCP firmware and add symlink
Date: Tue, 13 Jan 2026 17:45:04 +0800
Message-ID: <20260113094541.2528905-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:

  Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748.03

for you to fetch changes up to fdae06e63ed75fa3a91c8fab7a88c7b22c12ec3f:

  mediatek: rename MT8188 SCP firmware and add symlink (2026-01-13 17:13:26 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: rename MT8188 SCP firmware and add symlink

 WHENCE                     |   3 ++-
 mediatek/mt8188/scp.img    | Bin 636548 -> 10 bytes
 mediatek/mt8188/scp_c0.img | Bin 0 -> 636548 bytes
 3 files changed, 2 insertions(+), 1 deletion(-)
 mode change 100644 => 120000 mediatek/mt8188/scp.img
 create mode 100644 mediatek/mt8188/scp_c0.img

