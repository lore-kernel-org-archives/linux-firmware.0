Return-Path: <SRS0=9yZv=6F=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,LOTS_OF_MONEY,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EB0C2BA19
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Apr 2020 06:20:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 987FA20CC7; Tue, 21 Apr 2020 06:20:44 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A03206D6;
	Tue, 21 Apr 2020 06:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A03206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=max.chou@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 03L6Ke6gA000504, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
	by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 03L6Ke6gA000504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 21 Apr 2020 14:20:40 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 21 Apr 2020 14:20:40 +0800
Received: from localhost.localdomain (172.21.83.110) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 21 Apr 2020 14:20:39 +0800
From: <max.chou@realtek.com>
To: <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <alex_lu@realsil.com.cn>,
        <kidman@realtek.com>, <hildawu@realtek.com>, <birming@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT FW to 0x0999_3AA1
Date: Tue, 21 Apr 2020 14:20:35 +0800
Message-ID: <20200421062035.11621-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.83.110]
X-ClientProxiedBy: RTEXMB02.realtek.com.tw (172.21.6.95) To
 RTEXMB03.realtek.com.tw (172.21.6.96)

From: Max Chou <max.chou@realtek.com>

This firmware patch update for Realtek RTL8822C BT controller.

Release Version: 0x0999_3AA1

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 rtl_bt/rtl8822cu_fw.bin | Bin 54320 -> 55296 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
index 12edda1e402956504a6c337e953248059dbc9e21..f36e37f27aa2801ac84f17820d644a1418b8e082 100644
GIT binary patch
delta 5455
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

delta 4581
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
Dcr%#@

-- 
2.17.1

