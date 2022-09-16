Return-Path: <SRS0=oq2c=ZT=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730A9ECAAD8
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Sep 2022 08:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34EFEC433D7; Fri, 16 Sep 2022 08:35:21 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C3D7C433D6
	for <linux-firmware@kernel.org>; Fri, 16 Sep 2022 08:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C3D7C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c623a7b67cc243548b0e27314213d4d6-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=dQvL4phTZ/lvUB9ULw+yjti6A47tzFc0Rt2NEl/QKBY=;
	b=kjFh/RtKgu2/cW3fR9HBZujYHR5By0eQWlJhivfmxN0vvkcvTJc+Lg3sI4RvS1fB7G0XShlP9xX00HV4ajIeClzuRUDjgNycSKgI8qJOJaYu9A30R5nF7bZpr0a3rJKF5nj68iHQH+eK1UxZrg8M4i0S3KlXyQudq4JlgqLzSIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:9d4b63b4-f47e-4d3a-8dfa-2b0d495a53a8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:2457a3f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c623a7b67cc243548b0e27314213d4d6-20220916
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 40574802; Fri, 16 Sep 2022 16:35:11 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 16:35:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 16:35:10 +0800
Message-ID: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
Subject: [PULL v2 linux-firmware] Update mediatek mt81xx SOF firmware
From: TingHan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <chunxu.li@mediatek.com>,
	<allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>
Date: Fri, 16 Sep 2022 16:35:10 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi maintainers,

This pull request adds new MediatekTek MT8195 SOF firmware and 
updates MT8186 SOF firmware.

Please let me know if there is any problem.

Best regards,
TingHan

--

The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:

  amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-20220915

for you to fetch changes up to 3e08c58f8af488c41573c4a64a261e3b3f35849b:

  mediatek: Add new mt8195 SOF firmware (2022-09-16 16:19:11 +0800)

----------------------------------------------------------------
Tinghan Shen (2):
      mediatek: Update mt8186 SOF firmware
      mediatek: Add new mt8195 SOF firmware

 WHENCE                                                                                      |  11 ++++++++---
 mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                  | Bin 0 -> 20895 bytes
 .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
 mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
 mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
 mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
 mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
 8 files changed, 8 insertions(+), 3 deletions(-)
 rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
 create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
 rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
 create mode 100644 mediatek/sof/sof-mt8186.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ri

