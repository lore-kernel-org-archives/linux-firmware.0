Return-Path: <SRS0=mA5z=VT=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F02C433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 11 May 2022 06:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4864BC385DB; Wed, 11 May 2022 06:54:52 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAB81C385A7
	for <linux-firmware@kernel.org>; Wed, 11 May 2022 06:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CAB81C385A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4097e350d80e409b8d4bb4c9df744e89-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:e2fcd4f0-38b9-4d40-85a2-f996a9c0c723,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:-20
X-CID-META: VersionHash:faefae9,CLOUDID:941764b3-56b5-4c9e-8d83-0070b288eb6a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4097e350d80e409b8d4bb4c9df744e89-20220511
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 211360160; Wed, 11 May 2022 14:54:44 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 11 May 2022 14:54:42 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 14:54:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 14:54:42 +0800
Message-ID: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com>
Subject: [PULL] mediatek: Update mt8192 firmware
From: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <rongchang@google.com>,
	<yunfei.dong@mediatek.com>, <shawnku@google.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>,
	<nfraprado@collabora.corp-partner.google.com>
Date: Wed, 11 May 2022 14:54:42 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi linux-firmware maintainers,

Update the MediaTek mt8192 firmware to v2.0.8537.


Thanks,
TingHan

--
The following changes since commit b19cbdca78ab2adfd210c91be15a22568e8b8cae:

  Merge branch '8183-v2.0.2745' of https://github.com/tinghan-shen/linux_fw_scp into main (2022-05-
09 13:59:43 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp 8192-v2.0.8537

for you to fetch changes up to 86e64fe7c052b85762eeefc258c379331e6b20b3:

  mediatek: Update mt8192 SCP firmware (2022-05-11 13:36:48 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Update mt8192 SCP firmware

 WHENCE                  |   2 +-
 mediatek/mt8192/scp.img | Bin 309436 -> 327968 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

