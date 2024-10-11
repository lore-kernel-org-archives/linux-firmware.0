Return-Path: <SRS0=h2UM=RH=mediatek.com=shayne.chen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4F6D0EE12
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Oct 2024 16:36:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79B5CC4CECE; Fri, 11 Oct 2024 16:36:59 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB09AC4CEC7
	for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 16:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB09AC4CEC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 053c069687ef11ef8b96093e013ec31c-20241012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tb6/zYZ762FrKsZuaklFpQpOK7qBPMn60N+XHfs5vRk=;
	b=AKIRGAUkHBlahlX+sZLYIZ3zOK4nVfEMxu1IuhWQXn/iSX9O0eLVF4gQLlyJBN7xjf1dIaaabAq2Cc8Z+lNPg8hELO9E+0y79UD7SJRyT7Tr+Ejwpfdn2JnGAJq2HCoWFRlNT8g9jHNn91D8PF6sYg4yNoOK9O96gUabVm5+dP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:45172fe5-fb26-48a0-ba56-977bb42e5bc8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:5,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:9c5f1d41-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 053c069687ef11ef8b96093e013ec31c-20241012
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1636368223; Sat, 12 Oct 2024 00:36:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 12 Oct 2024 00:36:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 12 Oct 2024 00:36:49 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Daniel Golle
	<daniel@makrotopia.org>
Subject: pull-request: mtk_wed firmware 20241011 v2
Date: Sat, 12 Oct 2024 00:36:49 +0800
Message-ID: <20241011163649.19110-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.381700-8.000000
X-TMASE-MatchedRID: 9SKQLBmTF7vgxStX0wUODsqXjImgj58bIfyQNHR2naZd9fDYSm945TC0
	pJIQUiJOMyjG/vEwWNeun8wjeYlO74BX93VZG6SnnVTWWiNp+v+y4iyjvVWTorIPyqeQTeKkV78
	paYC694ArIhHNwiG1WXATsg8MODVIHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWjtA42YMO2JEV0T
	f3EbjItSrYPj2tn+n3+OgcVNG/hM8bxn22FR0dWw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.381700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	2119E5403AD242148E6EF7DA970DF9683D5BCA2DD6006F21F78561E54B8660C92000:8
X-MTK: N

Hi,

Here's a v2 pull request which fixes CI failures.
Please let me know if there are any problems, thanks.

Shayne

The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:

  Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)

are available in the Git repository at:

  https://github.com/csyuanc/linux-firmware.git mtk_wed-20241011

for you to fetch changes up to 808cba847c70a91eb5a1d502a5e1a63379bb328b:

  mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher (2024-10-12 00:02:10 +0800)

----------------------------------------------------------------
Shayne Chen (1):
      mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher

 WHENCE                          |  28 ++++++++++++++++++++++------
 mediatek/mt7988/mt7988_wo_0.bin | Bin 0 -> 107816 bytes
 mediatek/mt7988/mt7988_wo_1.bin | Bin 0 -> 107752 bytes
 3 files changed, 22 insertions(+), 6 deletions(-)
 create mode 100644 mediatek/mt7988/mt7988_wo_0.bin
 create mode 100644 mediatek/mt7988/mt7988_wo_1.bin
