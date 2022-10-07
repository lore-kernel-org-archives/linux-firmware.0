Return-Path: <SRS0=lRTf=2I=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3755EC433F5
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Oct 2022 10:36:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1F28C433C1; Fri,  7 Oct 2022 10:36:02 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.kernel.org (Postfix) with ESMTP id 49C2FC433D6;
	Fri,  7 Oct 2022 10:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49C2FC433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 297AZNKr8024872, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 297AZNKr8024872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 7 Oct 2022 18:35:23 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 7 Oct 2022 18:35:51 +0800
Received: from localhost.localdomain (172.21.132.192) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 7 Oct 2022 18:35:50 +0800
From: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <mu_hua_chen@realtek.com>,
        <hsinyu_chang@realtek.com>, <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8852C BT USB firmware to 0xD5B8_A40A
Date: Fri, 7 Oct 2022 18:35:44 +0800
Message-ID: <20221007103544.26911-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.192]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/07/2022 10:15:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzEwLzcgpFekyCAwNDo1NDowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Hilda Wu <hildawu@realtek.com>

This firmware patch update for Realtek RTL8852C BT USB controller.

Release Version: 0xD5B8_A40A

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8852cu_fw.bin | Bin 103800 -> 106960 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8852cu_fw.bin b/rtl_bt/rtl8852cu_fw.bin
index 0566b1080ad7dbda64e73326b6adc8f207c1b8f6..f356629242bdc0e61aa9060ecc1e78be5579dea9 100644
GIT binary patch
delta 12453
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

delta 9590
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

-- 
2.17.1

