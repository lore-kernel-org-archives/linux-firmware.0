Return-Path: <SRS0=kfaf=FG=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8B2E7D0CB
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Sep 2023 05:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3D20C433C9; Fri, 22 Sep 2023 05:55:46 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0E1DC433C8;
	Fri, 22 Sep 2023 05:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0E1DC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38M5tWcN53748262, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38M5tWcN53748262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Sep 2023 13:55:33 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 22 Sep 2023 13:55:33 +0800
Received: from localhost.localhost (172.21.132.123) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 22 Sep 2023 13:55:31 +0800
From: <max.chou@realtek.com>
To: <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: <linux-firmware@kernel.org>, <alex_lu@realsil.com.cn>,
        <hildawu@realtek.com>, <karenhsu@realtek.com>, <max.chou@realtek.com>,
        <Alan.Chen6@dell.com>, <mu_hua_chen@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8851B BT USB firmware to 0x048A_D230
Date: Fri, 22 Sep 2023 13:55:25 +0800
Message-ID: <20230922055525.49787-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.21.132.123]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS03.realtek.com.tw (172.21.6.96)
X-KSE-ServerInfo: RTEXMBS03.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Max Chou <max.chou@realtek.com>

    This firmware patch update for Realtek RTL8851B BT USB controller.

    Release Version: 0x048A_D230

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 rtl_bt/rtl8851bu_fw.bin | Bin 46376 -> 49760 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8851bu_fw.bin b/rtl_bt/rtl8851bu_fw.bin
index 046fab7ee7460b2bb66cd1a72c087148e3b3a8a8..6bcd03bb19f845fffb828ad30d0500d125b6819a 100644
GIT binary patch
delta 15419
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
T$dLT&7SMDuP0bTMTKoS17%1q3

delta 12117
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

-- 
2.25.1

