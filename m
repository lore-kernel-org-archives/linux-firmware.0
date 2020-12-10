Return-Path: <SRS0=TT/l=FO=mediatek.com=irui.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7544BC4361B
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Dec 2020 02:07:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4B32D23BC7; Thu, 10 Dec 2020 02:07:51 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by mail.kernel.org (Postfix) with ESMTP id A49E02313E
	for <linux-firmware@kernel.org>; Thu, 10 Dec 2020 02:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A49E02313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=irui.wang@mediatek.com
X-UUID: 29059de2b0f24aab936add0264399d32-20201210
X-UUID: 29059de2b0f24aab936add0264399d32-20201210
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 499842233; Thu, 10 Dec 2020 10:07:44 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 10:07:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 10:07:42 +0800
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
Subject: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
Date: Thu, 10 Dec 2020 10:07:39 +0800
Message-ID: <20201210020740.21467-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Hi linux-firmware maintainers,

The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:

  Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)

are available in the Git repository at:

  https://github.com/irui-wang/linux_fw_vpu_v1.1.6.git v1.1.6

for you to fetch changes up to 0fe0fe022b7f88f581254487b1d1768df1b218bb:

  mediatek: update MT8173 VPU firmware to v1.1.6 (2020-12-10 09:38:07 +0800)

----------------------------------------------------------------
Irui Wang (1):
      mediatek: update MT8173 VPU firmware to v1.1.6

 mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
 mediatek/mt8173/vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)


