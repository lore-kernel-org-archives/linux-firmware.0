Return-Path: <SRS0=0Hc/=7S=mediatek.com=moudy.ho@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B8FCF45DB
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Jan 2026 02:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48852C19423; Tue, 13 Jan 2026 02:10:11 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22529C116D0
	for <linux-firmware@kernel.org>; Tue, 13 Jan 2026 02:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22529C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f842cf5cf02411f0942a039f3f28ce95-20260113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3RsK6qSFLu9CPDTWow3qqdM70hxJwjF6dfgE2tEmLlk=;
	b=GkYdBdTECoU+WRpWoY4QHgq8zcEnnSxXL8S+a4lUSb9VnZyC2DV2i7bRH31FMHsCH8aZva76RpQOsQoZD9K19IMCxi/Z1MN9LTNIajsL+uB9iT6wSYGbsZ9zgDCFal1sBkcTQ97ocHfdAdRCXOL3YyMcP10hss5XMSNbRirWSQA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:2c364c64-2c95-495b-ac32-0bfa5e5a1bba,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:1ac56fe8-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f842cf5cf02411f0942a039f3f28ce95-20260113
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2052413015; Tue, 13 Jan 2026 10:10:02 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 10:10:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 10:10:00 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <nfraprado@collabora.com>,
	<Jason-ch.Chen@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Macpaul.Lin@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH] mediatek: add symlink for MT8188 SCP dual core firmware
Date: Tue, 13 Jan 2026 10:08:55 +0800
Message-ID: <20260113020959.2377348-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260113020959.2377348-1-moudy.ho@mediatek.com>
References: <20260113020959.2377348-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The MT8188 device tree (DTS) is configured for dual core SCP, and the
driver by default attempts to load "scp_c0.img" as the core 0 firmware.
Without this symlink, the firmware fails to load and the following error
is observed:

  [   79.494105] remoteproc remoteproc0: powering up scp
  [   79.496217] remoteproc remoteproc0: Booting fw image mediatek/mt8188/scp.img, size 636548
  [   79.497298] platform 10500000.scp: IPI buf addr 0x000ffb40
  [   79.498013] platform 10500000.scp: IPI buffer does not fit in SRAM.

This patch adds a symlink "scp_c0.img" pointing to "scp.img" under
meditek/mt8188/ to ensure proper firmware loading for dual core SCP.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 mediatek/mt8188/scp_c0.img | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 mediatek/mt8188/scp_c0.img

diff --git a/mediatek/mt8188/scp_c0.img b/mediatek/mt8188/scp_c0.img
new file mode 120000
index 00000000..8d1dcd4d
--- /dev/null
+++ b/mediatek/mt8188/scp_c0.img
@@ -0,0 +1 @@
+scp.img
\ No newline at end of file
-- 
2.45.2

