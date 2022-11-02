Return-Path: <SRS0=YGyI=3C=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7324C4332F
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Nov 2022 13:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 740B7C43470; Wed,  2 Nov 2022 13:03:02 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.kernel.org (Postfix) with ESMTP id CCCD1C433D7;
	Wed,  2 Nov 2022 13:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCCD1C433D7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2A2D2EK70002955, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2A2D2EK70002955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 2 Nov 2022 21:02:14 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 2 Nov 2022 21:02:50 +0800
Received: from localhost.localdomain (172.21.132.192) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 2 Nov 2022 21:02:47 +0800
From: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <mu_hua_chen@realtek.com>,
        <hsinyu_chang@realtek.com>, <kidman@realtek.com>
Subject: [PATCH 1/2] rtl_bt: Update RTL8822C BT USB firmware to 0xFFB8_ABD3
Date: Wed, 2 Nov 2022 21:02:29 +0800
Message-ID: <20221102130230.23896-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.192]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/02/2022 12:44:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzExLzIgpFekyCAwOToxOTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Hilda Wu <hildawu@realtek.com>

This firmware patch update for Realtek RTL8822C BT USB controller.

Release Version: 0xFFB8_ABD3

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8822cu_fw.bin | Bin 58960 -> 59332 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
index ba031e2e2da16b313105216397999eb79c48541d..05fcba3fa9813ac41d05909b57421c01b703b7ac 100644
GIT binary patch
delta 5648
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

delta 5336
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

-- 
2.17.1

