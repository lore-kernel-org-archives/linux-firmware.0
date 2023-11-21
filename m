Return-Path: <SRS0=T/uF=HC=mediatek.com=jason-ch.chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BBBC5ACB3
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Nov 2023 08:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 655E0C433C8; Tue, 21 Nov 2023 08:17:47 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 599A6C433C7
	for <linux-firmware@kernel.org>; Tue, 21 Nov 2023 08:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 599A6C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7030a122884611ee8051498923ad61e6-20231121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d3xFHwEXm15Y6Khl36WCr93o41d4aY0DOB63bZVjGEU=;
	b=g93AvjjgQckPzTiDqF3k3BVRFqI1DrlAwzzuMVddbh8NR5h10Aj7OEdtNPnks09EJJdiQVe9/y7bquFSYQG/qBbFGopbqo0uyMet/8xd83BU5x5tN07VlqEX1v+uhOYA/eSU/ZublCNu66aP7QVRvHcFJRwOvJXHqsO3MFJCgIw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:bd6df564-92b9-40d3-ad5c-18c7ccabfc22,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:caac4d60-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7030a122884611ee8051498923ad61e6-20231121
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-ch.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2036624493; Tue, 21 Nov 2023 16:17:40 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 21 Nov 2023 16:17:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 21 Nov 2023 16:17:37 +0800
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<menghui.lin@mediatek.com>, <shawnku@google.com>
Subject: pull-request: linux-firmware: Update MT8195 SCP to remove an unused packed library 
Date: Tue, 21 Nov 2023 16:17:34 +0800
Message-ID: <20231121081735.21837-1-jason-ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.325100-8.000000
X-TMASE-MatchedRID: CuNqLv8MpA1necAFxyDbb6b8GfRpncAzUXlp1FHYSPWYvYlYOb0cVDpZ
	dqvergj0LQB4O+D+n6OZNELIyCEhgEUC1IloJffrngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AHCttcwYNipX6mrAiastWSfbm4z9EtL/eaxYRJxsm0iVN5mguw6o1rn2axFov2Dgs3zJ1
	GLsOuFfUDPq1xfP/eydePhRU3qGQGHZhwAAZRYA7Iji40FrQMIdmtRsRmKkASJZPT2ZDPuzPD2Q
	fzMDLjhIh26TkmSN3fud1QdQyZe7n7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.325100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	CEE92A6A58DF3E371E738FC763D2AB593B3769FCDC0C3C3D687EB4F04517FF842000:8
X-MTK: N

The following changes since commit 9552083a783e5e48b90de674d4e3bf23bb855ab0:

  Merge branch 'robot/pr-0-1700470117' into 'main' (2023-11-20 13:09:23 +0000)

are available in the Git repository at:

  https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23042

for you to fetch changes up to ebebd79cb34038b0dcc964fbb4a07525b2b790aa:

  mediatek: Remove an unused packed library (2023-11-21 16:14:00 +0800)

----------------------------------------------------------------
Jason Chen (1):
      mediatek: Remove an unused packed library

 mediatek/mt8195/scp.img | Bin 635448 -> 635532 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)


