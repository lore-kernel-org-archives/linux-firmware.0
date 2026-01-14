Return-Path: <SRS0=PbDS=7T=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F6DD31A15
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Jan 2026 07:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED4A0C4CEF7; Wed, 14 Jan 2026 07:24:45 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94577C16AAE
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 07:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94577C16AAE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1392751ef11a11f0bb3cf39eaa2364eb-20260114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3vE8iCltOqonZY+WTPFj/Qlwnh9gkvyqbwNIyDaUdsA=;
	b=ECicKgWrQwZj+Yo65srwimJhXVeYGnS2ufSp/zqmknzeokBilCUh9bBiogTA3Cg5e5HN1qV6nBxo0EoB5eJgmVoxxKFQY7/vWBYScaTmp8vYYROEzjZXVKR7cfzAOA9IPDMypwwMWvTfqy/+AFvFrZ93r5zoOwsjkpoEpWUPiOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:5ccb7dbd-7e9a-49a7-b832-3eb4ad473e41,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:eb4983ef-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1392751ef11a11f0bb3cf39eaa2364eb-20260114
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1321594362; Wed, 14 Jan 2026 15:24:34 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
	<Macpaul.Lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH V2] mediatek: rename MT8188 SCP firmware
Date: Wed, 14 Jan 2026 15:23:03 +0800
Message-ID: <20260114072433.3076970-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260114072433.3076970-1-moudy.ho@mediatek.com>
References: <20260114072433.3076970-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The MT8188 device tree (DTS) is configured for dual core SCP, and the
driver by default attempts to load "scp_c0.img" as the core 0 firmware.
To conform with upstream naming conventions, this patch renames the
existing firmware file "scp.img" to "scp_c0.img" to ensure proper firmware
loading for dual core SCP.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 WHENCE                                  |   3 ++-
 mediatek/mt8188/{scp.img => scp_c0.img} | Bin
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)

diff --git a/WHENCE b/WHENCE
index 4a211c48..fecf42f8 100644
--- a/WHENCE
+++ b/WHENCE
@@ -6057,7 +6057,8 @@ File: mediatek/mt8192/scp.img
 Version: v2.0.20536
 File: mediatek/mt8195/scp.img
 Version: v2.0.21961
-File: mediatek/mt8188/scp.img
+File: mediatek/mt8188/scp_c0.img
+Link: mediatek/mt8188/scp.img -> scp_c0.img
 Version: v2.0.27748
 File: mediatek/mt8189/scp.img
 Version: v1.0.0
diff --git a/mediatek/mt8188/scp.img b/mediatek/mt8188/scp_c0.img
similarity index 100%
rename from mediatek/mt8188/scp.img
rename to mediatek/mt8188/scp_c0.img
-- 
2.45.2

