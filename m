Return-Path: <SRS0=+VU+=7B=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89194C64EC4
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Mar 2023 12:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55794C433D2; Thu,  9 Mar 2023 12:18:14 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA7EDC433EF;
	Thu,  9 Mar 2023 12:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BA7EDC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 329CHsvT6013705, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 329CHsvT6013705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 9 Mar 2023 20:17:54 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 9 Mar 2023 20:17:25 +0800
Received: from localhost.localdomain (172.21.132.192) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 9 Mar 2023 20:17:23 +0800
From: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <mu_hua_chen@realtek.com>,
        <hsinyu_chang@realtek.com>, <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT UART firmware to 0x05C6_D2E3
Date: Thu, 9 Mar 2023 20:17:18 +0800
Message-ID: <20230309121718.7142-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.192]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Hilda Wu <hildawu@realtek.com>

This firmware patch update for Realtek RTL8822C BT UART controller.

Release Version: 0x05C6_D2E3

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8822cs_fw.bin | Bin 62040 -> 62580 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
index f22013afaa5be2955653470e7124970c0ce5c3d5..9bc8f0350d50a7ec8e750bc037b7a9b8a922c112 100644
GIT binary patch
delta 6882
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

delta 6133
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
HlWg<|0NL~R

-- 
2.17.1

