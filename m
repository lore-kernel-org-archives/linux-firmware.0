Return-Path: <SRS0=kgob=WF=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ECBC35FF8
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 09:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCA21C4CEEE; Tue, 18 Mar 2025 09:48:45 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A3667C4CEE9
	for <linux-firmware@kernel.org>; Tue, 18 Mar 2025 09:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A3667C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2ad5e91003de11f0aae1fd9735fae912-20250318
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Abn5SRwxSoXafbb8XtEGGIz+oEpRrTFEKLIK4kZbNJY=;
	b=t0X6bdieJTQQlVZk8XlOJahQ5IXazsl0MtKPKyZOUA++q2s5qeuMusc4nBOqsXZDUEjHzcSoYi+P54sQMGGpQ7YoKGy8SZh6bixMizgmS2Cz8yIcBctlDlBiQK7EAcbZFn8zMYEtC3YL8EcFoUdALKH+25yngyPjdwjAznDlbUs=;
X-CID-CACHE: Type:Local,Time:202503181743+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:cf00fa60-1147-4880-874b-0733adb87cc5,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:6114858c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 2ad5e91003de11f0aae1fd9735fae912-20250318
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1238544302; Tue, 18 Mar 2025 17:48:38 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 18 Mar 2025 17:48:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 18 Mar 2025 17:48:10 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Prado
	<nfraprado@collabora.com>, Jason Chen <Jason-ch.Chen@mediatek.com>
Subject: pull request: linux-firmware: Create MediaTek MT8188 SCP firmware 
Date: Tue, 18 Mar 2025 17:47:18 +0800
Message-ID: <20250318094809.3540043-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The following changes since commit 588505068c48fe07b1cfa32c5f3acd4395ec9482:

  Merge branch 'copy-firmware' into 'main' (2025-03-18 00:45:21 +0000)

are available in the Git repository at:

  https://github.com/MoudyHo/linux_fw_scp v27749

for you to fetch changes up to a39712f2c8c9a520b889a45cbbdd2fa36d249cc3:

  mediatek: Add MT8188 SCP firmware (3035-03-18 16:49:53 +0800)

