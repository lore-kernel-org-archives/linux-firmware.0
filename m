Return-Path: <SRS0=0Hc/=7S=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAD2CF45CB
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Jan 2026 02:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18626C19421; Tue, 13 Jan 2026 02:10:17 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADDE7C116D0
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 02:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADDE7C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f8305e6cf02411f0bb3cf39eaa2364eb-20260113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GN+EfxtSXpSpYh8WBBWLkneHMPPoPNLHKxsJiNifKXc=;
	b=QXQg1WX+TlgRxWKZzAllBIX7VMPHKH4sk/Y1iqIo0IKH9MZmw3lIiP25Lx2FyiXpDQN3ru4IEvDL2VZYayAj6xZ2riOjR1Q8kZXoVvbIDjcO3cjkW4IheTMltsWK1xtG/M+cQ9H7/QsCEtGbn8g72nye3I/xJV/ZHcUIrwUe32E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:a0452406-2024-491b-a968-1000efef07c6,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:5047765,CLOUDID:642b74ef-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8305e6cf02411f0bb3cf39eaa2364eb-20260113
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 621683988; Tue, 13 Jan 2026 10:10:02 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:10:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 10:10:00 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>
Subject: pull request: linux-firmware: add symlink for MT8188 SCP core 0
Date: Tue, 13 Jan 2026 10:08:54 +0800
Message-ID: <20260113020959.2377348-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:

  Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748.01

for you to fetch changes up to 1cdd079780792a4df3b36a78844112412c044983:

  mediatek: add symlink for MT8188 SCP dual core firmware (2026-01-13 09:50:06 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: add symlink for MT8188 SCP dual core firmware

 mediatek/mt8188/scp_c0.img | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 mediatek/mt8188/scp_c0.img

