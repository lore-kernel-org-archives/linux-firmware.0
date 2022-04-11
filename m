Return-Path: <SRS0=Qu/P=UV=mediatek.com=yunfei.dong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB86EC433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 12:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4E93C385A5; Mon, 11 Apr 2022 12:05:55 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 495A7C385A3
	for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 12:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 495A7C385A3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 55c9f4dc5cd144ea82112c418746b7c6-20220411
X-UUID: 55c9f4dc5cd144ea82112c418746b7c6-20220411
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1136917470; Mon, 11 Apr 2022 20:05:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 11 Apr 2022 20:05:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 20:05:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<tinghan.shen@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<irui.wang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware 
Date: Mon, 11 Apr 2022 20:05:44 +0800
Message-ID: <20220411120545.20066-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:

  amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)

are available in the Git repository at:

  https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1

for you to fetch changes up to ae8dfb4a5d4c6028ee1fca04b374b0e03ec35360:

  mediatek: Add mt8192 SCP firmware (2022-04-11 20:00:24 +0800)

----------------------------------------------------------------
Yunfei Dong (1):
      mediatek: Add mt8192 SCP firmware

 WHENCE                  |   3 +++
 mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 mediatek/mt8192/scp.img


