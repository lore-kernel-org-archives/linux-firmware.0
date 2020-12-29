Return-Path: <SRS0=eipY=GB=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51568C433DB
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Dec 2020 06:30:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2237121D7F; Tue, 29 Dec 2020 06:30:02 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BF39207B1;
	Tue, 29 Dec 2020 06:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BF39207B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=max.chou@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BT6TwQiA018937, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs03.realtek.com.tw[172.21.6.96])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BT6TwQiA018937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Dec 2020 14:29:58 +0800
Received: from localhost.localdomain (172.21.132.186) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 29 Dec 2020 14:29:57 +0800
From: <max.chou@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <linux-firmware@kernel.org>,
        <alex_lu@realsil.com.cn>, <hsinyu_chang@realtek.com>,
        <hildawu@realtek.com>
CC: <birming@realtek.com>, <max.chou@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8821C BT(USB I/F) FW to 0x829a_7644
Date: Tue, 29 Dec 2020 14:29:53 +0800
Message-ID: <20201229062953.4267-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.186]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS03.realtek.com.tw (172.21.6.96)

From: Max Chou <max.chou@realtek.com>

This firmware patch update for Realtek RTL8821C BT controller with USB
I/F.

Release Version: 0x829a_7644

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 rtl_bt/rtl8821c_fw.bin | Bin 51008 -> 51700 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8821c_fw.bin b/rtl_bt/rtl8821c_fw.bin
index 2868d37dc9acf981a194bed94862a80678fe887a..b30e645f193c2a4415c435ecc889e9d7bb137cc3 100644
GIT binary patch
delta 8959
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

delta 8150
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
G(f<K}?Z8t2

-- 
2.17.1

