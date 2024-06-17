Return-Path: <SRS0=U0wG=NT=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB0CC27C6E
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Jun 2024 06:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9519C3277B; Mon, 17 Jun 2024 06:19:22 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A1F6C2BD10;
	Mon, 17 Jun 2024 06:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A1F6C2BD10
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 45H6JFYB02827736, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 45H6JFYB02827736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 14:19:15 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 14:19:15 +0800
Received: from localhost.localhost (172.21.132.53) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 17 Jun
 2024 14:19:14 +0800
From: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <mu_hua_chen@realtek.com>,
        <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT USB firmware to 0xAED6_6DCB
Date: Mon, 17 Jun 2024 14:19:04 +0800
Message-ID: <20240617061904.3236394-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.21.132.53]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

This firmware patch update for Realtek RTL8822C BT USB controller.

Release Version: 0xAED6_6DCB

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8822cu_fw.bin | Bin 60892 -> 61220 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
index 0c7b5656e91ba5ce316f956c905b008c2ae3c644..f4e7618ef5e2e09ac42cec023b626d1fb6f1554f 100644
GIT binary patch
delta 4485
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

delta 4263
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
YZN<^!&>5PS{>4OzM7(4p6TUb6KS2Y{s{jB1

-- 
2.34.1

