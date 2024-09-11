Return-Path: <SRS0=zBb6=QJ=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FB0EE4990
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Sep 2024 10:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C595FC4CEC6; Wed, 11 Sep 2024 10:40:36 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18551C4CEC5;
	Wed, 11 Sep 2024 10:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18551C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48BAeNuZ53618839, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726051223; bh=tT3Iz1khT5A/AdqG5RmjMO+u/9MLJorZZ2fbf65RkyI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=hWTBv35a+yLLs+D7UUh1KXW+A51/HY1uLeKL1XkVVe/rf8t6/iPBtdbUwESS+9GW4
	 J53R1foqvMiG2+MLxfjdVbti/7gU2J0+jDoBLobd2MdKDsS/IsNmOLd6zhw4qi3OfA
	 oST6EdKw3ogelu7vHYK+lKNyOYaOgsseCdmpjnVNGTveig0lkrcjnUcAj7JpXNVLkM
	 omrkUcbmZ51zQZ5yVa21/PlpqspOkgsewWexujvGqZgoTbZL9uMLQ2zMcddzUHL36u
	 wI0O7IJFXrt56rIm0yF2NSplvW7GvAfEMTbYgTOAc+J+1mdmY+WE3wv07pD7EMbcGl
	 sdb7UFapBVMLA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48BAeNuZ53618839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 18:40:23 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 18:40:23 +0800
Received: from localhost.localhost (172.21.132.53) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 11 Sep
 2024 18:40:22 +0800
From: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <max.chou@realtek.com>, <mu_hua_chen@realtek.com>,
        <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8852B BT USB FW to 0x0447_9301
Date: Wed, 11 Sep 2024 18:40:08 +0800
Message-ID: <20240911104008.1688043-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.21.132.53]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

This firmware patch update for Realtek RTL8852B BT USB controller.

Release Version: 0x0447_9301

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8852bu_fw.bin | Bin 101229 -> 101277 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8852bu_fw.bin b/rtl_bt/rtl8852bu_fw.bin
index 254c75831ec464e21cfa34a8dfac44b851a1688f..f1128e15cbf40035eb8c4e3a9b7689561ca89613 100644
GIT binary patch
delta 4603
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
Vi6&3{F-QN`W+d_>LyD<2=O3S9)KCBb

delta 4507
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

-- 
2.34.1

