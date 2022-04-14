Return-Path: <SRS0=Cyag=UY=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A28C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Apr 2022 06:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8C5CC385A1; Thu, 14 Apr 2022 06:48:31 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA78DC385A5
	for <linux-firmware@kernel.org>; Thu, 14 Apr 2022 06:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA78DC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4005545082aa4246960c90e677792933-20220414
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:c7afce9a-6c71-4232-b502-fd030d6f3145,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-20,EDM:-30,RT:0,SF:95,FILE:0,RULE:Release_Ham
	,ACTION:release,TS:45
X-CID-INFO: VERSION:1.1.4,REQID:c7afce9a-6c71-4232-b502-fd030d6f3145,OB:0,LOB:
	0,IP:0,URL:0,TC:0,Content:-20,EDM:-30,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
	CTION:release,TS:45
X-CID-META: VersionHash:faefae9,CLOUDID:33105a78-0afa-4dca-bdec-ca54c998425a,C
	OID:aa5bc31544ca,Recheck:0,SF:13|15|28|17|19|48,TC:nil,Content:0,EDM:2,Fil
	e:nil,QS:0,BEC:nil
X-UUID: 4005545082aa4246960c90e677792933-20220414
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1064366547; Thu, 14 Apr 2022 14:48:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 14 Apr 2022 14:48:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Apr 2022 14:48:21 +0800
Message-ID: <b6e1b4b7b5f894cf77a60768e445218805fbb681.camel@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8195 SCP firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <rongchang@google.com>,
	<yunfei.dong@mediatek.com>, <shawnku@google.com>, <stevecho@google.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Thu, 14 Apr 2022 14:48:21 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi,

Add new SCP firmware for MediaTek MT8195.
Thank you!


Regards,
TingHan

---
The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:

  rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp v14454.8.0

for you to fetch changes up to 10612bd12e4778069aff50caad9431002f92e374:

  mediatek: Add mt8195 SCP firmware (2022-04-14 14:03:33 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Add mt8195 SCP firmware

 WHENCE                  |   2 ++
 mediatek/mt8195/scp.img | Bin 0 -> 429668 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8195/scp.img

