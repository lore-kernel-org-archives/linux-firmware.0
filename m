Return-Path: <SRS0=g2Oh=SG=mediatek.com=irui.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2A2C433EF
	for <linux-firmware@archiver.kernel.org>; Sat, 22 Jan 2022 12:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98411C340E2; Sat, 22 Jan 2022 12:13:53 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CB1DC004E1
	for <linux-firmware@kernel.org>; Sat, 22 Jan 2022 12:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CB1DC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9868838fdc69480f9c2e1a5f135f34ee-20220122
X-UUID: 9868838fdc69480f9c2e1a5f135f34ee-20220122
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 434374060; Sat, 22 Jan 2022 20:13:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 22 Jan 2022 20:13:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Jan 2022 20:13:45 +0800
From: Irui Wang <irui.wang@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<tiffany.lin@mediatek.com>, <Maoguang.Meng@mediatek.com>,
	<Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
	<Andrew-CT.Chen@mediatek.com>, <erin.lo@mediatek.com>,
	<PoChun.Lin@mediatek.com>, <irui.wang@mediatek.com>,
	<srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: mediatek: Update MT8173 VPU firmware to v1.17 
Date: Sat, 22 Jan 2022 20:13:06 +0800
Message-ID: <20220122121307.20770-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Hi linux-firmware maintainers,

The following changes since commit 0c6a7b3bf728b95c8b7b95328f94335e2bb2c967:

  linux-firmware: Update firmware file for Intel Bluetooth 9260 (2022-01-19 11:16:28 -0500)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.7.git v1.1.7

for you to fetch changes up to 80d16ecb66f28c82987bab2a361df4dfe2c8b25f:

  linux-firmware: mediatek: Update MT8173 VPU firmware to v1.17 (2022-01-22 19:48:53 +0800)

----------------------------------------------------------------
Irui Wang (1):
      linux-firmware: mediatek: Update MT8173 VPU firmware to v1.17

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)



