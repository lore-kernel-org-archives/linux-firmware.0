Return-Path: <SRS0=QrvI=BV=mediatek.com=chris.lu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD4BC77B7E
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Jun 2023 07:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 750EFC433A0; Thu,  1 Jun 2023 07:33:39 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD788C4339B;
	Thu,  1 Jun 2023 07:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD788C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 982197d4004e11ee9cb5633481061a41-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VxYRFWIiNkIiVzU0sYK4wyw0WuGk1tNLQAJN5o20Yfk=;
	b=G2nFB2+uP419TorEzJbdSvaMt2Z+L6k5xPtNg6LHnRtq6yGoRRpG+dEwS9FaaknTYj9Sr0fVAn+4fj1iYoGnzm61OB4LLEAtNDnSZucuSmc5T/ZXUv9y1wJ7GQzDPvKO55WDs9piWkg8NnQvtU7pQhXrdBR04/9jC0gc9cOfnIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:7b0d4061-e1fe-4658-88f5-4b53bded0764,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:7b0d4061-e1fe-4658-88f5-4b53bded0764,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:058f0b3d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:23060115332838CVQQ6Y,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 982197d4004e11ee9cb5633481061a41-20230601
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 580085400; Thu, 01 Jun 2023 15:33:25 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 15:33:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 15:33:24 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
	Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, KM Lin <km.lin@mediatek.com>, Robin Chiu
	<robin.chiu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-firmware
	<linux-firmware@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Chris.Lu
	<chris.lu@mediatek.com>
Subject: [PATCH 1/1] linux-firmware: update firmware for mediatek bluetooth chip (MT7921)
Date: Thu, 1 Jun 2023 15:33:14 +0800
Message-ID: <20230601073315.22308-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain

From: "Chris.Lu" <chris.lu@mediatek.com>

Update binary firmware for MT7921 BT devices.

File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
Version: 20230526131214

Signed-off-by: Chris.Lu <chris.lu@mediatek.com>

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7921)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 532590 -> 532846 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0

