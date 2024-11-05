Return-Path: <SRS0=+gA2=SA=mediatek.com=yr.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EDBD1CA3A
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Nov 2024 07:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D264C4CED3; Tue,  5 Nov 2024 07:16:05 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA1FDC4CECF
	for <linux-firmware@kernel.org>; Tue,  5 Nov 2024 07:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA1FDC4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cd76aeb89b4511efbd192953cf12861f-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zAcG4U16bKQFhsKkGG7xv5CA4zm+IXs3PR2YUVCjODs=;
	b=O870lpWyidL/WFC6DsVKeL6nyWmMqPC8Ff26N89qbLwZJm8myZtOVC0uQLB6IWBaKvrr3u1g47Ul8zUgboR1hHiYQhqQBqC5XDrygpG2AGeYzLDaDeV30xUV/wRtfFtlNwLvZuJSLDQi1wr+O1fgVz+We+8eSffC1P3vpKeAozw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:5ffafbef-17cb-47eb-b762-ab33cd873fb3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:3c949007-7990-429c-b1a0-768435f03014,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: cd76aeb89b4511efbd192953cf12861f-20241105
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 190372017; Tue, 05 Nov 2024 15:15:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Nov 2024 15:15:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Nov 2024 15:15:52 +0800
From: yr.yang <yr.yang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Add sof-tplg for mt8195
Date: Tue, 5 Nov 2024 15:12:52 +0800
Message-ID: <20241105071549.17476-1-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.568900-8.000000
X-TMASE-MatchedRID: /IY58nGWDe4eMlyElPeCGC0x8J2DopENXXbpPagZMfcR34ro7k23nZgC
	Mlq+sZ+fKyIRzcIhtVlwE7IPDDg1SB8TzIzimOwPlpYqKNmWxsHZs3HUcS/scCq2rl3dzGQ1Gpe
	evGsoI5fxYVW9Dt9xPAALbFkH3VDIHvkNQnA1c2mCCcS+AMQypYLqKlN9pJTaQGswJytg1/k5cF
	bcyjLLWi3d7VyUb1gvvvfQgwBZV59pp55fZDlsr34cY/B7JqXaYZ1R7NXn0MdBmmCXcKyFFH7cG
	d19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.568900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	E4CA96BD09B3A63677EE62CB0E07DB498613047871E9C7BE21BD98C91B753EBC2000:8

The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:

  Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04 +0000)

are available in the Git repository at:

  https://github.com/mtk13576/sof_tplg adspsof

for you to fetch changes up to 7fbd03699a95b0624f26da4dbb00019669b9bed9:

  WHENCE: Add sof-tolg for mt8195 (2024-11-05 14:43:15 +0800)

----------------------------------------------------------------
YR Yang (1):
      mediatek: Add sof-tolg for mt8195

yr.yang (1):
      WHENCE: Add sof-tolg for mt8195

 WHENCE                                                   |   3 +++
 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg | Bin 0 -> 16191 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg

