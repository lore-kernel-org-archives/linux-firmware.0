Return-Path: <SRS0=+gA2=SA=mediatek.com=yr.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF27D1CA3D
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Nov 2024 07:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C8FBC4CECF; Tue,  5 Nov 2024 07:16:06 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 717C3C4CED0
	for <linux-firmware@kernel.org>; Tue,  5 Nov 2024 07:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 717C3C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cc930b9a9b4511efb88477ffae1fc7a5-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ko2/lgbTDWkPYYq5LFxV1H81UxfUBuNJrVWXn+FJYTY=;
	b=JhYzAe8gFD4oAEkS3icH2pTBmNpK/p4jKB0pcM8d5u+2JA7wZXumjX3lDmGQKU1LvYYOdo7Yl5VieyPtdQeMkve9Z6y1Sz+Yo1Y/zNd6m5YVl3VOiINqRKpIM8xqFh7LhLJWW0I2NUhJaRMjpFTeV6kpUqgNCKugyCOcvXrugaw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:36d3945a-3204-44d7-af9b-c3d12f6fb002,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:3fccb548-ca13-40ea-8070-fa012edab362,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cc930b9a9b4511efb88477ffae1fc7a5-20241105
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 668722921; Tue, 05 Nov 2024 15:15:55 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 15:15:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 15:15:54 +0800
From: yr.yang <yr.yang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>, yr.yang
	<yr.yang@mediatek.com>
Subject: [PATCH] WHENCE: Add sof-tolg for mt8195
Date: Tue, 5 Nov 2024 15:12:53 +0800
Message-ID: <20241105071549.17476-2-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241105071549.17476-1-yr.yang@mediatek.com>
References: <20241105071549.17476-1-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

mediatek: Add sof-tolg for mt8195

Signed-off-by: yr.yang <yr.yang@mediatek.com>
---
 WHENCE | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/WHENCE b/WHENCE
index 691291c3..dfa5ea70 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7529,6 +7529,9 @@ File: mediatek/sof/sof-mt8195.ldc
 File: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg
 Version: v0.4.2
 
+File: mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg
+Version: v0.4.3
+
 Licence: Redistributable. See LICENCE.mediatek for details.
 
 --------------------------------------------------------------------------
-- 
2.46.0

