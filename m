Return-Path: <SRS0=xDd9=KV=mediatek.com=irui.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47642C54E58
	for <linux-firmware@archiver.kernel.org>; Fri, 15 Mar 2024 04:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E804C43390; Fri, 15 Mar 2024 04:11:12 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7792CC433F1
	for <linux-firmware@kernel.org>; Fri, 15 Mar 2024 04:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7792CC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0acdad8ee28211eeb8927bc1f75efef4-20240315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PlqOaih2uAz/fZ7QnBrX7slnDt1y0lkGyDguQclX9xE=;
	b=bHI4I+0WAq9iJbOziiGa6KueZhBxLXIMsbovXpzCuamzfriPwnvYX6rBuPw6YQ9YRFUDsEW6GNQ2eMaXJqcnz8FwRktUbdqO7QTHOgCiV4OcJ6oZl9J3B5O4phNCGgLjIo2Gc5gX8jlHfblWUJB22tjfAKDvXcbkIB90GCKxbCw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ba4230aa-7081-4461-827e-354a60ba0d7d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:f05a0785-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 50,UGT
X-CID-BAS: 50,UGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0acdad8ee28211eeb8927bc1f75efef4-20240315
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 187788050; Fri, 15 Mar 2024 12:11:04 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Mar 2024 12:11:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Mar 2024 12:11:03 +0800
From: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <tiffany.lin@mediatek.com>,
	<irui.wang@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 
Date: Fri, 15 Mar 2024 12:10:27 +0800
Message-ID: <20240315041028.25273-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Dear linux-firmware maintainers,

The following changes since commit 3b128b6069267b60a46a4074c383183177ee6e6d:

  Merge branch 'mt7921-bt' into 'main' (2024-03-12 11:09:41 +0000)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.8.git v1.1.8

for you to fetch changes up to 38684ddd81f16e9c5cd41c83a3937649bab43413:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8 (2024-03-15 11:55:58 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.8

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131380 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)


