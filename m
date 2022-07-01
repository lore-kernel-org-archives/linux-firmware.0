Return-Path: <SRS0=IFSX=XG=mediatek.com=allen-kh.cheng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1434AC43334
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Jul 2022 06:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4496C341C7; Fri,  1 Jul 2022 06:32:30 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8BD92C341C6
	for <linux-firmware@kernel.org>; Fri,  1 Jul 2022 06:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8BD92C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1ea522c047154873ba75924318a07849-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:6ab3f580-40f9-413e-800a-0cac40ff8501,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:f9132363-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1ea522c047154873ba75924318a07849-20220701
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 718148324; Fri, 01 Jul 2022 14:32:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 1 Jul 2022 14:32:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 1 Jul 2022 14:32:18 +0800
Message-ID: <b4392c845d0af4e0e9d06493078c8af9dc39e237.camel@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8186 SCP firmware
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: "linux-mediatek@lists.infradead.org;
		 linux-arm-kernel@lists.infradead.org; 	 linux-remoteproc@vger.kernel.org;
	Yunfei Dong =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?="
	<Yunfei.Dong@mediatek.com>, <"; shawnku"@google.com>
Date: Fri, 1 Jul 2022 14:32:17 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi maintianers,

Add a new SCP firmware for MediaTek MT8186.
Thank you!

Regards,
Allen

---

The following changes since commit
9ed4d42c51aca99d70adc6738d7ea55c5e897835:

  amdgpu: update Yellow Carp VCN firmware (2022-06-22 06:28:03 -0400)

are available in the Git repository at:

  https://github.com/kuanhsuncheng/linux-firmware-scp v0.0.6

for you to fetch changes up to
1c8b6c3dddf751f5f786bdd3440aa3ce238ab808:

  mediatek: Add SCP firmware for MT8186 (2022-07-01 14:20:06 +0800)

----------------------------------------------------------------
Allen-kh Cheng (1):
      mediatek: Add SCP firmware for MT8186

 WHENCE                  |   2 ++
 mediatek/mt8186/scp.img | Bin 0 -> 416960 bytes
 2 files changed, 2 insertions(+)
 create mode 100644 mediatek/mt8186/scp.img

