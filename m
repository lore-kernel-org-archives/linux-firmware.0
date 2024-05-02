Return-Path: <SRS0=M5qM=MF=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17AFC4345F
	for <linux-firmware@archiver.kernel.org>; Thu,  2 May 2024 05:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64643C116B1; Thu,  2 May 2024 05:47:48 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2025C32789;
	Thu,  2 May 2024 05:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2025C32789
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4425laoC72184557, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4425laoC72184557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2024 13:47:36 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 13:47:36 +0800
Received: from localhost.localhost (172.21.132.53) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 2 May
 2024 13:47:35 +0800
From: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <mu_hua_chen@realtek.com>,
        <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT USB firmware to 0x0ED6_407B
Date: Thu, 2 May 2024 13:47:29 +0800
Message-ID: <20240502054729.2854164-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.21.132.53]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

This firmware patch update for Realtek RTL8822C BT USB controller.

Release Version: 0x0ED6_407B

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8822cu_fw.bin | Bin 59864 -> 60892 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
index 457e1cc387727223911305f021065d4c651b66fc..0c7b5656e91ba5ce316f956c905b008c2ae3c644 100644
GIT binary patch
delta 6695
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
D)i~xH

delta 5574
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

-- 
2.34.1

