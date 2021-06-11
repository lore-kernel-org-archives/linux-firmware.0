Return-Path: <SRS0=tNDv=LF=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ADAC48BD1
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Jun 2021 11:32:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F1B7F613CC; Fri, 11 Jun 2021 11:32:45 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0775161287;
	Fri, 11 Jun 2021 11:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0775161287
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hildawu@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 15BBWfMK2013178, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 15BBWfMK2013178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 11 Jun 2021 19:32:41 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 11 Jun 2021 19:32:40 +0800
Received: from localhost.localdomain (172.21.132.99) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 11 Jun 2021 19:32:40 +0800
From: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x05A8_C6B4
Date: Fri, 11 Jun 2021 19:32:34 +0800
Message-ID: <20210611113234.2511-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.99]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/11/2021 10:48:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzYvMTEgpFekyCAwNjowMDowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/11/2021 10:44:49
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 164266 [Jun 11 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: hildawu@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;realtek.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/11/2021 10:48:00

From: Hilda Wu <hildawu@realtek.com>

This firmware patch update for Realtek RTL8822C BT controller.(UART I/F)

Release Version:0x05A8_C6B4

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8822cs_fw.bin | Bin 65404 -> 65820 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
index f87d9401c3a28eba4aed9a753683e372c41a4807..e211961906d9f0fbb4f6a0abaddbab6a21deff90 100644
GIT binary patch
delta 4831
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
F{dXvj+xY+h

delta 4410
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
APXGV_

-- 
2.17.1

