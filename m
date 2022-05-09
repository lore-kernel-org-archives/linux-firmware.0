Return-Path: <SRS0=zywv=VR=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51329C433EF
	for <linux-firmware@archiver.kernel.org>; Mon,  9 May 2022 08:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A185C385AB; Mon,  9 May 2022 08:04:30 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76993C385A8
	for <linux-firmware@kernel.org>; Mon,  9 May 2022 08:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76993C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: fd8f2da2b34241ffa3decd742d965bf2-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:ac44b17f-a9a9-489c-81fd-d32baea30f07,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,A
	CTION:release,TS:75
X-CID-INFO: VERSION:1.1.4,REQID:ac44b17f-a9a9-489c-81fd-d32baea30f07,OB:0,LOB:
	0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,A
	CTION:quarantine,TS:75
X-CID-META: VersionHash:faefae9,CLOUDID:1e2a18b3-56b5-4c9e-8d83-0070b288eb6a,C
	OID:517f39b583df,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
	,QS:0,BEC:nil
X-UUID: fd8f2da2b34241ffa3decd742d965bf2-20220509
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 639729001; Mon, 09 May 2022 16:04:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 9 May 2022 16:04:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 9 May 2022 16:04:19 +0800
Message-ID: <4a46f800702c33bd9c2b0c2069179572a3eb1044.camel@mediatek.com>
Subject: [PULL] mediatek: Update mt8183 firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <rongchang@google.com>,
	<yunfei.dong@mediatek.com>, <shawnku@google.com>, <hsinyi@google.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Mon, 9 May 2022 16:04:19 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi linux-firmware maintainers,

Update the MediaTek mt8183 firmware is to v2.0.2745.


Thanks,
TingHan

---

The following changes since commit d4b75516c46b22d17b8654c65f2ea2730875bf14:

  Merge branch 'dg2_dmc_v2.06_rebase' of git://anongit.freedesktop.org/drm/drm-firmware into main
(2022-05-03 08:20:28 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp 8183-v2.0.2745

for you to fetch changes up to bdc8ff9f974d541c296212f208ac23bdbdd076d1:

  mediatek: Update mt8183 SCP firmware (2022-05-09 14:54:43 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Update mt8183 SCP firmware

 WHENCE                  |   2 +-
 mediatek/mt8183/scp.img | Bin 1027104 -> 1032064 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)


