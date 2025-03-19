Return-Path: <SRS0=uxMw=WG=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AA4C35FF1
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Mar 2025 06:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 852CBC4CEEF; Wed, 19 Mar 2025 06:52:54 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5053CC4CEEA
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 06:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5053CC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c32d7e0c048e11f08eb9c36241bbb6fb-20250319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=leCWnjxbuD3QqJWjec/tvRazbXSNvb/QAMksouGRwB4=;
	b=mfs2FVOYpkN7Q8tpMicsLjWo9VSvVifj6ENULOklLUOD5fZkSIlbowss8VH9Oke6UdWP555wTYMutHV15O/3ZrpUSOcZmHvdTXybOFChct9kpf2vsQuHypUx59IwMZO8r15O3V8nqaKRKvy9vLc4I8+mJGfBGwIwWEMIQS18PO4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:fb7ceed3-a2fd-4c65-9751-813650d79ab0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-35
X-CID-META: VersionHash:0ef645f,CLOUDID:d1094c4a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: c32d7e0c048e11f08eb9c36241bbb6fb-20250319
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1226321360; Wed, 19 Mar 2025 14:52:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 19 Mar 2025 14:52:44 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 19 Mar 2025 14:52:44 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Prado
	<nfraprado@collabora.com>, Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: pull request: linux-firmware: Create MediaTek MT8188 SCP firmware
Date: Wed, 19 Mar 2025 14:51:55 +0800
Message-ID: <20250319065243.3775352-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The following changes since commit 588505068c48fe07b1cfa32c5f3acd4395ec9482:

  Merge branch 'copy-firmware' into 'main' (2025-03-18 00:45:21 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748

for you to fetch changes up to a5932c0dc930fa54bbbe2360d1eca5f87b2db8bc:

  mediatek: Add MT8188 SCP firmware (2025-03-19 14:50:24 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: Add MT8188 SCP firmware

 WHENCE                  |   2 ++
 mediatek/mt8188/scp.img | Bin 0 -> 636548 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8188/scp.img
