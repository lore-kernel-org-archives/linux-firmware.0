Return-Path: <SRS0=oq2c=ZT=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4906C32771
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Sep 2022 03:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B624C433C1; Fri, 16 Sep 2022 03:22:31 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1388AC433D6
	for <linux-firmware@kernel.org>; Fri, 16 Sep 2022 03:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1388AC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 62ea881d66f14da58282c7fad21b4f3f-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lEXUBFRQRamXHA1KTyZBS3QBLnZ3z3zGas0T/X/92HY=;
	b=lNu8Drg9XWK5m1VzjzMGnYsOzTBo9f1HEkWyqS1oIykJb83TtAzqmWQNpjBa4Pmxo+I5SipC+svVxcufcgGKMOhdKEvcWQfRrNPv4RMIXm/XsZC4Zv1Ks89Lz8VhLt58K5h5S7zkKll5uSgt/hIWxH6o+EgRB82AsTFJ0ug5Ctw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:64763d8e-cc53-4ebe-9053-ff76db591dd9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:6487d27b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 62ea881d66f14da58282c7fad21b4f3f-20220916
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1103245745; Fri, 16 Sep 2022 11:22:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 16 Sep 2022 11:22:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 11:22:20 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <chunxu.li@mediatek.com>,
	<allen-kh.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
Subject: [PULL linux-firmware] Update mediatek mt81xx SOF firmware
Date: Fri, 16 Sep 2022 11:21:46 +0800
Message-ID: <20220916032146.17774-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Hi maintainers,

This pull request adds new MediatekTek MT8195 SOF firmware and 
updates MT8186 SOF firmware.

Please let me know if there is any problem.

Best regards,
TingHan

---

The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:

  amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)

are available in the Git repository at:

  https://github.com/tinghan-shen/linux_fw_scp mtk-20220915

for you to fetch changes up to 78cff08a90dff21fe6f5f2f961d12604bd125e95:

  mediatek: Add new mt8195 SOF firmware (2022-09-16 10:42:01 +0800)

----------------------------------------------------------------
Tinghan Shen (2):
      mediatek: Update mt8186 SOF firmware
      mediatek: Add new mt8195 SOF firmware

 WHENCE                                                                                      |  11 ++++++++---
 mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
 .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
 mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
 mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
 mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
 mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
 7 files changed, 8 insertions(+), 3 deletions(-)
 rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
 rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
 create mode 100644 mediatek/sof/sof-mt8186.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ldc
 create mode 100644 mediatek/sof/sof-mt8195.ri

