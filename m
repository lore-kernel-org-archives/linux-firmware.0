Return-Path: <SRS0=IFSX=XG=mediatek.com=allen-kh.cheng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA0AC43334
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Jul 2022 07:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 022AAC3411E; Fri,  1 Jul 2022 07:37:14 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F396EC341C6
	for <linux-firmware@kernel.org>; Fri,  1 Jul 2022 07:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F396EC341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c31e45f98fdb49288a02087fd9d525fe-20220701
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:41315df1-1623-44d6-8e72-875f846daf3d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:d29b4786-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c31e45f98fdb49288a02087fd9d525fe-20220701
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 347598898; Fri, 01 Jul 2022 15:37:07 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 1 Jul 2022 15:37:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 1 Jul 2022 15:37:06 +0800
Message-ID: <10ed0b2a78baa88f7fd1d466036c98de2f6d8e29.camel@mediatek.com>
Subject: RE: pull request: linux-firmware: Create Mediatek MT8186 SCP
 firmware
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: <allen-kh.cheng@mediatek.com>, <yunfei.dong@mediatek.com>,
	<shawnku@google.com>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<rongchang@google.com>, <hsinyi@chromium.org>, <tinghan.shen@mediatek.com>
Date: Fri, 1 Jul 2022 15:37:06 +0800
References: <b4392c845d0af4e0e9d06493078c8af9dc39e237.camel@mediatek.com>
In-Reply-To: <b4392c845d0af4e0e9d06493078c8af9dc39e237.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N


I am sorry, there are some mistakes in CC list.

Regards,
Allen

-----Original Message-----
From: allen-kh.cheng <allen-kh.cheng@mediatek.com> 
Sent: Friday, July 1, 2022 2:32 PM
To: linux-firmware@kernel.org
Cc: Yunfei Dong (董云飞) <Yunfei.Dong@mediatek.com>; ";
shawnku"@google.com
Subject: pull request: linux-firmware: Create Mediatek MT8186 SCP
firmware

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

