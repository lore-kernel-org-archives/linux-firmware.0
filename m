Return-Path: <SRS0=h2UM=RH=mediatek.com=shayne.chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B285AD0D7BA
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Oct 2024 15:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F564C4CEC7; Fri, 11 Oct 2024 15:14:38 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBEA8C4CEC3
	for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 15:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBEA8C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 83bb8fca87e311ef88ecadb115cee93b-20241011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3QaSDnFFFbE8vRjYrjaSKgw7kmdxTwobCOyf6Kpde7U=;
	b=BRt3sTUABW04XHadnjrcLSfHgtMHbMs1oTjIU3EM9OwzWJudEWjt7E58Q6ZOgiM5qn9SdQZpiPgWm4fsNIg0gOrFaE7TLVRqLWW4EfrjDmtmZp45V5NP6Kojq3NluGEEz7OkjrVvL8S4FNNAp3Q9gp+pvZV/DnUMKcy/HFvXLqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c6cd476e-e846-4719-8363-6c94ca30a8e8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:10,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-META: VersionHash:6dc6a47,CLOUDID:e89fa406-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 83bb8fca87e311ef88ecadb115cee93b-20241011
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1622619354; Fri, 11 Oct 2024 23:14:30 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 23:14:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 23:14:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Daniel Golle
	<daniel@makrotopia.org>
Subject: pull-request: mtk_wed firmware 20241011
Date: Fri, 11 Oct 2024 23:14:23 +0800
Message-ID: <20241011151424.30750-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.715300-8.000000
X-TMASE-MatchedRID: 9SKQLBmTF7vgxStX0wUODsqXjImgj58bIR1rLBJm/M52CVwwf1a+igzR
	CsGHURLufsb4gWsAzqDAbEAUUTwVAGcV4sYfqMYeHDC6a94U1AD4qCLIu0mtIEYvSDWdWaRhC9B
	TOmY04/BJri6yNs2b3HATsg8MODVIHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWy4DzHzRjN6n38L
	4M0rTSSLErgvOjjWrLPa6JbT9/Ck9YIWbXtrx1NQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.715300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6AB2283C2A15734E666FF20D129126D412A712EDF399F97EC911404E00555F7B2000:8
X-MTK: N

Hi,

Here's a pull request for adding firmware files for mt7988 Wireless
Ethernet Dispatcher.

Please let me know if there are any problems.

Shayne

The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:

  Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)

are available in the Git repository at:

  https://github.com/csyuanc/linux-firmware.git mtk_wed-20241011

for you to fetch changes up to 8f2f0386630da115daf11229b4543f6672d8cca5:

  mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher (2024-10-11 22:22:35 +0800)

----------------------------------------------------------------
Shayne Chen (1):
      mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher

 WHENCE                          |  28 ++++++++++++++++++++++------
 mediatek/mt7988/mt7988_wo_0.bin | Bin 0 -> 107816 bytes
 mediatek/mt7988/mt7988_wo_1.bin | Bin 0 -> 107752 bytes
 3 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 mediatek/mt7988/mt7988_wo_0.bin
 create mode 100644 mediatek/mt7988/mt7988_wo_1.bin
