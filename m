Return-Path: <SRS0=eipY=GB=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	LOTS_OF_MONEY,MONEY_NOHTML,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBA4C433E0
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Dec 2020 09:17:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B37DE208D5; Tue, 29 Dec 2020 09:17:24 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCCFF207CF;
	Tue, 29 Dec 2020 09:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCCFF207CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=max.chou@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BT9HLSV0027190, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs03.realtek.com.tw[172.21.6.96])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BT9HLSV0027190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Dec 2020 17:17:21 +0800
Received: from localhost.localdomain (172.21.132.186) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 29 Dec 2020 17:17:20 +0800
From: <max.chou@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <linux-firmware@kernel.org>,
        <alex_lu@realsil.com.cn>, <hsinyu_chang@realtek.com>,
        <hildawu@realtek.com>
CC: <kidman@realtek.com>, <max.chou@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT(USB I/F) FW to 0x099a_7253
Date: Tue, 29 Dec 2020 17:17:16 +0800
Message-ID: <20201229091716.4954-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.186]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS03.realtek.com.tw (172.21.6.96)

From: Max Chou <max.chou@realtek.com>

This firmware update for Realtek RTL8822C BT controller with USB I/F.

Release Version: 0x099a_7253

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 rtl_bt/rtl8822cu_fw.bin | Bin 58212 -> 59388 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
index 297b078a462e86ab6c2177837876674066600a6d..96fd2f0691e0b7828f97e2306a592e75aaa1ed3b 100644
GIT binary patch
delta 6416
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

delta 5142
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
BcqRY<

-- 
2.17.1

