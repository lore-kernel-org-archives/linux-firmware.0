Return-Path: <SRS0=0ahC=EE=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B938C2D0A3
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Oct 2020 08:36:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D0E4420780; Thu, 29 Oct 2020 08:36:16 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9868E20757;
	Thu, 29 Oct 2020 08:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9868E20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=max.chou@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 09T8aAtU5010134, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb04.realtek.com.tw[172.21.6.97])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 09T8aAtU5010134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 29 Oct 2020 16:36:10 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.34) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Thu, 29 Oct 2020 16:36:10 +0800
Received: from localhost.localdomain (172.21.132.186) by
 RTEXMBS03.realtek.com.tw (172.21.6.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 29 Oct 2020 16:36:09 +0800
From: <max.chou@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <linux-firmware@kernel.org>,
        <Larry.Finger@lwfinger.net>, <alex_lu@realsil.com.cn>,
        <hildawu@realtek.com>, <kidman@realtek.com>, <max.chou@realtek.com>,
        <hsinyu_chang@realtek.com>
Subject: [PATCH v2]  rtl_bt: Update RTL8822C BT(USB I/F) FW to 0x099A_281A
Date: Thu, 29 Oct 2020 16:36:04 +0800
Message-ID: <20201029083604.4819-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.186]
X-ClientProxiedBy: RTEXMB03.realtek.com.tw (172.21.6.96) To
 RTEXMBS03.realtek.com.tw (172.21.6.34)

From: Max Chou <max.chou@realtek.com>

    This firmware patch update for Realtek RTL8822C BT controller.(USB
I/F)

    Release Version: 0x099A_281A

Signed-off-by: Max Chou <max.chou@realtek.com>
---
Changes in v2:
- correct the fw version
---
 rtl_bt/rtl8822cu_fw.bin | Bin 55296 -> 58212 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
index f36e37f27aa2801ac84f17820d644a1418b8e082..297b078a462e86ab6c2177837876674066600a6d 100644
GIT binary patch
delta 9985
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

delta 6907
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
QL9-8P@wmA>UVYc=zdXle&j0`b

-- 
2.17.1

