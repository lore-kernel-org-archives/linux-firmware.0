Return-Path: <SRS0=+gRy=HB=mediatek.com=jason-ch.chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E783C54E76
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Nov 2023 08:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB9BAC433C8; Mon, 20 Nov 2023 08:42:19 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 003BDC433C7
	for <linux-firmware@kernel.org>; Mon, 20 Nov 2023 08:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 003BDC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b27988bc878011ee8051498923ad61e6-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6OWGdmPDtLYdunCwZiQeWtejrbXgW6HPimKj8ttk0XQ=;
	b=dEu/G+g9duW+cCAvtcicuSMlQP9N0Ew+YQmIaj+WxguXX2/U+Mz+DhvUtKakPaLNsQjbPRq4amVENg/Iu+m6s+DrHj3tyjiva5CAWuVAB30BVsmo0a6UfMILb2Vc+fFO/Bn9L1ZsmGFbONG3XVuJ6LDEQw4n1+l7iipCeuhU5DM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:712928b7-323c-456d-bd40-92002e4070dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:eee4d972-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: b27988bc878011ee8051498923ad61e6-20231120
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 266034330; Mon, 20 Nov 2023 16:42:11 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 16:42:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 16:42:10 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<menghui.lin@mediatek.com>, <shawnku@google.com>
Subject: pull-request: linux-firmware: Update MT8195 SCP firmware to
Date: Mon, 20 Nov 2023 16:42:06 +0800
Message-ID: <20231120084207.830-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

The following changes since commit 7124ce30ba82266e3972e99aacebeda712131d6f:

  Merge branch 'mlimonci/encoding' into 'main' (2023-11-17 16:54:55 +0000)

are available in the Git repository at:

  https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23033

for you to fetch changes up to a41fa7c5008809ae360ce0808e378b37b1d6c0f4:

  mediatek: Sync shared memory structure changes (2023-11-20 16:18:04 +0800)

----------------------------------------------------------------
Jason Chen (1):
      mediatek: Sync shared memory structure changes

 mediatek/mt8195/scp.img | Bin 635492 -> 635448 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)


