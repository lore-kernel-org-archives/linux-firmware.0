Return-Path: <SRS0=PbDS=7T=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA7AD31A16
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Jan 2026 07:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DD22C19424; Wed, 14 Jan 2026 07:24:45 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3D00C4CEF7
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 07:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3D00C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1406bba4f11a11f0942a039f3f28ce95-20260114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=U7nHMmte4jZDlZIIYx9NXNOXVIfDhYodf8UXKbPOKwk=;
	b=iGUuSY5wsWX8pyisKwbEt58Fh9udZznk8fsf2fvJsEAs1c24NOD5R8HSD8fV0vWDSkRlDn9uzUUsLEPjXoh5EAql1DLp/jfdPEYMr1QqDiFCfEWTYVGll5N1rQ/+cnmS8758O6oLJVfqa3CZNl7EtJQm3QbiATYxu/65VDpRRi0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:0f42959d-693c-4503-bbcb-bba05994e8fc,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:f74983ef-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1406bba4f11a11f0942a039f3f28ce95-20260114
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 924522490; Wed, 14 Jan 2026 15:24:35 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 15:24:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 15:24:34 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>
Subject: pull request: linux-firmware: rename MediaTek MT8188 SCP firmware
Date: Wed, 14 Jan 2026 15:23:02 +0800
Message-ID: <20260114072433.3076970-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:

  Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748.05

for you to fetch changes up to dc0fa0cd80a676ea66e204400966be598fe3f554:

  mediatek: rename MT8188 SCP firmware (2026-01-14 15:16:36 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: rename MT8188 SCP firmware

 WHENCE                                  |   3 ++-
 mediatek/mt8188/{scp.img => scp_c0.img} | Bin
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)

