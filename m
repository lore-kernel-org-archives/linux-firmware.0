Return-Path: <SRS0=n8z5=2X=mediatek.com=huayu.zong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D906C87FCF
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Aug 2025 01:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF2A0C4CEF0; Mon, 11 Aug 2025 01:59:38 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C2F4C4CEEB
	for <linux-firmware@kernel.org>; Mon, 11 Aug 2025 01:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C2F4C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cf1544ea765611f0b33aeb1e7f16c2b6-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=x+wlAxAzgomGlkcqP5XgcQLFTBuEcdY5HbrFPTqS8Es=;
	b=qqsYLwA2mt1dLJxj8p68Jcy+B12YIoOMFynHajr/eSxn7smXUxpCWr2RuuAvAmwwKODrVYWXMfL9NG2wxVj9QW583laG5tHF+nOzV3FLccMPAO0Snvfhw7FkfCfwYrkAnk/ByOS27w43slVZ9bIhf5qD72CWJarwMlXjBGbcT4M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:121c86b8-3bc3-4c0b-8fdf-386e065779c9,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:c069cc9d-7ad4-4169-ab95-78e9164f00fe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cf1544ea765611f0b33aeb1e7f16c2b6-20250811
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 930349968; Mon, 11 Aug 2025 09:59:26 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 09:59:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 09:59:19 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Create Mediatek MT8189 SCP firmware
Date: Mon, 11 Aug 2025 09:57:52 +0800
Message-ID: <20250811015922.32680-1-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:

  Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +0000)

are available in the Git repository at:

  https://github.com/HuayuZong/linux-firmware-mt8189-scp mt8189-fw-upstream

for you to fetch changes up to 777171b10e2671de19fb41afb5bd0bbdd77c0e92:

  mediatek: Add MT8189 SCP firmware (2025-08-05 11:16:23 +0800)

----------------------------------------------------------------
Huayu Zong (1):
      mediatek: Add MT8189 SCP firmware

 mediatek/mt8189/scp.img | Bin 0 -> 6588300 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/mt8189/scp.img

