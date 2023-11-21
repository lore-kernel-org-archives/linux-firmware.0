Return-Path: <SRS0=T/uF=HC=mediatek.com=jason-ch.chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBE6C5ACB3
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Nov 2023 07:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 097FBC433C9; Tue, 21 Nov 2023 07:36:34 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28CB5C433C8
	for <linux-firmware@kernel.org>; Tue, 21 Nov 2023 07:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28CB5C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a9279928884011eea33bb35ae8d461a2-20231121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZYFr5QisH8O6Z9rmHybQUHW9IA2vLXfMYSxUMUoNbA4=;
	b=H61yQVGOBwDADB9oXYoLPS41hwRzbuGzB9WdZGJdIVObA8y0M999ya6pzwpk+7TDm5FxnXb0wJTEsrg2QcTHrOwk+BY7cg44zU+rL2VjNgfKFULpOvJLJBo9fe1txXgED4c3GpsUjN8BE6tAaiSesD0jmpmgnuNKgA5OrLpLNPk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:8658b7ad-41e7-473e-bb8f-5cdbc9767c40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:282b4d60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: a9279928884011eea33bb35ae8d461a2-20231121
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1995938547; Tue, 21 Nov 2023 15:36:19 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 21 Nov 2023 15:36:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 21 Nov 2023 15:36:18 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<menghui.lin@mediatek.com>, <shawnku@google.com>
Subject: pull-request: linux-firmware: Update MT8195 SCP to remove an unused packed library
Date: Tue, 21 Nov 2023 15:36:16 +0800
Message-ID: <20231121073617.21410-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

The following changes since commit 7124ce30ba82266e3972e99aacebeda712131d6f:

  Merge branch 'mlimonci/encoding' into 'main' (2023-11-17 16:54:55 +0000)

are available in the Git repository at:

  https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23042

for you to fetch changes up to dced4dd00fb148923bd205526f286ccbc811c513:

  mediatek: Remove an unused packed library (2023-11-21 15:28:00 +0800)

----------------------------------------------------------------
Jason Chen (1):
      mediatek: Remove an unused packed library

 mediatek/mt8195/scp.img | Bin 635492 -> 635532 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)


