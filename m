Return-Path: <SRS0=QrvI=BV=mediatek.com=chris.lu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0066CC7EE29
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Jun 2023 07:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2E96C433EF; Thu,  1 Jun 2023 07:31:50 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6092C433D2;
	Thu,  1 Jun 2023 07:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6092C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5a8883d8004e11ee9cb5633481061a41-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7WNlNiEWD6ncoYGLw+NNM+cpAH2qY+X20yMdDUBpzxU=;
	b=MfxV/Ql1TcQpF6JEIHSJrxW514+BDt9NGx9Bgyj0OGeCrsMD9Q/zFNI4y5VdfVvsTATHTq/RE1pINU3kAP9EJXKvr7QCCCLW1xL1ehiFHEKZW522tjh60VFZKGqt9kgV2hkS4YxqBV8hvk2V3bXtgIzz2fqX1Ruhmx5Te02vZsU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:9a5af340-e54b-4b63-93d0-943206c0041c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:16473c3d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5a8883d8004e11ee9cb5633481061a41-20230601
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 27262697; Thu, 01 Jun 2023 15:31:42 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 15:31:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 15:31:40 +0800
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
Subject: [PATCH 1/1] linux-firmware: update firmware for mediatek bluetooth chip (MT7922)
Date: Thu, 1 Jun 2023 15:31:37 +0800
Message-ID: <20230601073138.22227-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain

From: "Chris.Lu" <chris.lu@mediatek.com>

Update binary firmware for MT7922 BT devices.

File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
Version: 20230530123531

Signed-off-by: Chris.Lu <chris.lu@mediatek.com>

Chris.Lu (1):
  linux-firmware: update firmware for mediatek bluetooth chip (MT7922)

 WHENCE                                  |   2 +-
 mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin | Bin 511830 -> 509974 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0

