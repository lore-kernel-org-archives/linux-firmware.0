Return-Path: <SRS0=q/HK=RU=mediatek.com=yr.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9666D0BB59
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Oct 2024 03:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9969AC4CEE5; Thu, 24 Oct 2024 03:45:55 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFB50C4CEC7
	for <linux-firmware@kernel.org>; Thu, 24 Oct 2024 03:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFB50C4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7375339c91ba11efbd192953cf12861f-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rlk3QRcH7Ks80dwuVKbQIrEI0lSPNUwzwey7SfnjSMA=;
	b=gO2ZejuKfhLPUFperwlbqFfAUoYezQNChXJNIwP5YXXlFkr5E4hhRq+CclKhotKwUF3jDmxL4Qg2LM8VAAPMC8SDGkH3WSFmH+GSkyW+iXS+5a1NgB+AcwqznBiKVtQFyx42vWI3fKMXve24knaMUi4CCoYeNMZihmElFTLFx40=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:44c73f75-e6c0-47d6-9dd6-c5037932d378,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:bd77bf41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7375339c91ba11efbd192953cf12861f-20241024
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 275515407; Thu, 24 Oct 2024 11:45:45 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 24 Oct 2024 11:45:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 11:45:44 +0800
From: 20220315151852 created <yr.yang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <shawnku@google.com>
Subject: pull request: linux-firmware: Add sof-tplg for mt8195 
Date: Thu, 24 Oct 2024 11:44:06 +0800
Message-ID: <20241024034558.667-1-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:

  Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04 +0000)

are available in the Git repository at:

  https://github.com/mtk13576/sof_tplg adspsof

for you to fetch changes up to 7f3099f4482f2eda1dfa45068c3618c1203fd1fd:

  mediatek: Add sof-tolg for mt8195 (2024-10-24 10:21:23 +0800)

----------------------------------------------------------------
20220315151852 created (1):
      mediatek: Add sof-tolg for mt8195

 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg | Bin 0 -> 16191 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-max98390-rt5682.tplg

