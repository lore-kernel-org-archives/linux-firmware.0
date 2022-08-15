Return-Path: <SRS0=YATI=YT=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3627DC00140
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Aug 2022 09:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F41B1C433B5; Mon, 15 Aug 2022 09:13:31 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB310C433C1
	for <linux-firmware@kernel.org>; Mon, 15 Aug 2022 09:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB310C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6014dc707ebd49aaaca115439d4d0447-20220815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=Mi+Gi9iTKDF5VQ28kqgllLcvUnQ8Tb329H1uS9EjtlE=;
	b=ompUNrqlFCQ1HnnPRMJloeFlT0SfAQyDinwJCGlcK4tYGyc/+w1IdkDZwtNo6QkwPtrW0/21DApgukeljawR7iLVV9J68jUDRgo4TQDXK7dZTC75cw6hPD1SfAVQlRQ7k1KoFSlJv2nOo2sXNbTvZ4pxuRTIanMyIfdU0f1i1YQ=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:b7a77f26-2589-480b-8a32-0a4f53900816,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:95
X-CID-INFO: VERSION:1.1.9,REQID:b7a77f26-2589-480b-8a32-0a4f53900816,OB:0,LOB:
	0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS9
	81B3D,ACTION:quarantine,TS:95
X-CID-META: VersionHash:3d8acc9,CLOUDID:5895b19c-da39-4e3b-a854-56c7d2111b46,C
	OID:8e3ceb7852c1,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6014dc707ebd49aaaca115439d4d0447-20220815
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1409255464; Mon, 15 Aug 2022 17:13:25 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 17:13:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Aug 2022 17:13:23 +0800
Message-ID: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com>
Subject: [PULL linux-firmware] mediatek mt8186 SOF firmware v0.2.0
From: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <chunxu.li@mediatek.com>,
	<allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 15 Aug 2022 17:13:23 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi maintainers,

This pull request adds new MediatekTek firmware for MT8186 SOF.

Please let me know if there are any problems.

Best regards,
TingHan

---

The following changes since commit ad5ae82019480dc1feffb538c118397a40934e62:

  Merge branch 'main' of https://github.com/suraj714/BT-Upstream (2022-08-10 07:58:34 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mt8186-sof-20220815

for you to fetch changes up to 12ca0753342651fa2ab640deffde5e51b0dd9868:

  mediatek: Add new mt8186 SOF firmware (2022-08-15 16:43:11 +0800)

----------------------------------------------------------------
Tinghan Shen (1):
      mediatek: Add new mt8186 SOF firmware

 WHENCE                                              |  21 +++++++++++++++++++++
 mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg | Bin 0 -> 16191 bytes
 mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg  | Bin 0 -> 16191 bytes
 mediatek/sof/sof-mt8186.ri                          | Bin 0 -> 128712 bytes
 4 files changed, 21 insertions(+)
 create mode 100644 mediatek/sof/sof-mt8186-mt6366-da7219-max98357.tplg
 create mode 100644 mediatek/sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg
 create mode 100644 mediatek/sof/sof-mt8186.ri



