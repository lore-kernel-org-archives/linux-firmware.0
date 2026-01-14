Return-Path: <SRS0=PbDS=7T=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78F3D30CFE
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Jan 2026 01:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA54AC2BC86; Wed, 14 Jan 2026 01:41:40 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5A20C19421
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 01:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5A20C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 283d4442f0ea11f0bb3cf39eaa2364eb-20260114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=F0labHvZyAx7aKVJm1m0fO8egqpiWcfaMBqKDsDmSMQ=;
	b=heBKzCBA4AqMQ74xDRsoPzDiyPDRlRqsjEaxFuW15LKiKEW9sMWf1onr6ALT7bwbtOTA6RalAdi/3umLf3z7sm5fpsOo4ymc4ebvYJ59ol/paePdtIzXcODKFQ6KMWvTgwPg57iYMZ3yDK/CawIUFngJ6Zgljvbqea80BGXxYG4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:738c4557-30fb-44e0-b71c-861b7c7b4763,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:9e9a185a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 283d4442f0ea11f0bb3cf39eaa2364eb-20260114
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1071195297; Wed, 14 Jan 2026 09:41:33 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 09:41:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 09:41:32 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>
Subject: mediatek: rename MT8188 SCP firmware
Date: Wed, 14 Jan 2026 09:40:42 +0800
Message-ID: <20260114014131.2933478-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The following changes since commit 486ac8f9adb4d77b951b55179985c6b3c20b6957:

  Merge branch 'robot/pr-0-1768198342' into 'main' (2026-01-12 07:14:40 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27748.04

for you to fetch changes up to a27572bc81d5073e8288c1b8a78903a8ae20478b:

  mediatek: rename MT8188 SCP firmware (2026-01-14 09:09:25 +0800)

----------------------------------------------------------------
Moudy Ho (1):
      mediatek: rename MT8188 SCP firmware

 WHENCE                                  |   3 ++-
 mediatek/mt8188/{scp.img => scp_c0.img} | Bin
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)

