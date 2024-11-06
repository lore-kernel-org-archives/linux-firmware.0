Return-Path: <SRS0=OJFf=SB=mediatek.com=yr.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344ACD3E787
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Nov 2024 02:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BEC1C4CED1; Wed,  6 Nov 2024 02:55:22 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAB83C4CECF
	for <linux-firmware@kernel.org>; Wed,  6 Nov 2024 02:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAB83C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8b4578809bea11efbd192953cf12861f-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KOYxrBw8EUrrRWzm09yKcDBb3HHovQ1xJDDNiVTXfBE=;
	b=rniZClNYPfPVo5zOhNf9vUcwlyUtoNK02nb88B99ldjwE84Py9dC/EXKeZi2Hd/Ci1qsQtZUhQGAgWfqTfuNB4HeQiPsIiK0giwupl1q6zyI5fglzrDXuPBW9rBIhSZQa+/KBBixrz4fH2YmLYZKHMH4mLMGocXKfwh1s9/rgT0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:646aaaba-f0df-4704-ad3f-c027d1f59481,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:cbb5af1b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8b4578809bea11efbd192953cf12861f-20241106
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 835843918; Wed, 06 Nov 2024 10:55:13 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 10:55:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 10:55:08 +0800
From: yr.yang <yr.yang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>, YR Yang
	<yr.yang@mediatek.corp-partner.google.com>
Subject: [PATCH] WHENCE: Add sof-tolg for mt8195
Date: Wed, 6 Nov 2024 10:53:35 +0800
Message-ID: <20241106025439.25929-2-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241106025439.25929-1-yr.yang@mediatek.com>
References: <20241106025439.25929-1-yr.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.976600-8.000000
X-TMASE-MatchedRID: Po6oKkC+jBAxFdXyW/P+XQPZZctd3P4BsSrAWY+HdwqbKItl61J/yfJv
	ocwUrWp7FBpuM64i9KELbigRnpKlKTpcQTtiHDgWgupbOEVUWNXts+4REx60pksSKeSvkiWDDPG
	qMZBKAmW0KJRsn/ovowfkDiYNky8vISG4z1M0Wdp7FMChVAK0Iw+WefkcuSbU4sOrsb4iT/K/bb
	EolHIgZUOc7GjOamnWv5a9cmIodEspRnLV2kwrLg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.976600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	86225C840403CCC19E7FE9FF8DC4A4B91A67092ED95DBCF5103FD5BA1842D3E62000:8

From: YR Yang <yr.yang@mediatek.corp-partner.google.com>

mediatek: Add sof-tolg for mt8195

Signed-off-by: YR Yang <yr.yang@mediatek.corp-partner.google.com>
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

