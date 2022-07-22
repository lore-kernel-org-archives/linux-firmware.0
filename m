Return-Path: <SRS0=fxJV=X3=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C47FC43334
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Jul 2022 08:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4357EC341C7; Fri, 22 Jul 2022 08:29:43 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EA75C341C6
	for <linux-firmware@kernel.org>; Fri, 22 Jul 2022 08:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EA75C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 11fa722ef6d040098034a04091ef7046-20220722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ecace9ce-ad54-4e8f-bc34-d08c3f36ca68,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:b9678e29-fd69-41f1-91fc-8b8a329d3a88,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 11fa722ef6d040098034a04091ef7046-20220722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1593722257; Fri, 22 Jul 2022 16:29:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 22 Jul 2022 16:29:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 22 Jul 2022 16:29:34 +0800
Message-ID: <42437b6fc5dac19bf23f9806dfbe6915e055397b.camel@mediatek.com>
Subject: pull request: linux-firmware: Update Mediatek MT8183/MT8192/MT8195
 SCP firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>,
	<shawnku@google.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<Justin.Yeh@mediatek.com>, <Allen-KH.Cheng@mediatek.com>
Date: Fri, 22 Jul 2022 16:29:34 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi maintainers,

Update SCP firmware for MediaTek MT8183/MT8192/MT8195.
Thank you!


Regards,
TingHan

---

The following changes since commit 4421586e8e95ce789cb6b3f1af98962bfef74c7b:

  amdgpu: update renoir to release 22.20 (2022-07-19 06:44:08 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-scp-20220722

for you to fetch changes up to 56cf6461a82b08facd41154f7c44a19f0a085f66:

  mediatek: Update mt8183/mt8192/mt8195 SCP firmware (2022-07-22 16:16:27 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Update mt8183/mt8192/mt8195 SCP firmware

 WHENCE                  |   6 +++---
 mediatek/mt8183/scp.img | Bin 1032064 -> 1030776 bytes
 mediatek/mt8192/scp.img | Bin 327968 -> 328096 bytes
 mediatek/mt8195/scp.img | Bin 429668 -> 429820 bytes
 4 files changed, 3 insertions(+), 3 deletions(-)

