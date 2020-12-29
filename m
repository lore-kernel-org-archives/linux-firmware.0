Return-Path: <SRS0=eipY=GB=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35297C433DB
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Dec 2020 07:00:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0606821D7F; Tue, 29 Dec 2020 07:00:27 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F54208BA;
	Tue, 29 Dec 2020 07:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F54208BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=max.chou@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BT70NI80025045, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs03.realtek.com.tw[172.21.6.96])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BT70NI80025045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Dec 2020 15:00:23 +0800
Received: from localhost.localdomain (172.21.132.186) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 29 Dec 2020 15:00:23 +0800
From: <max.chou@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <linux-firmware@kernel.org>,
        <alex_lu@realsil.com.cn>, <hsinyu_chang@realtek.com>,
        <hildawu@realtek.com>
CC: <kidman@realtek.com>, <max.chou@realtek.com>
Subject: [PATCH] rtl_bt: Add firmware and config files for RTL8852A BT USB chip
Date: Tue, 29 Dec 2020 15:00:19 +0800
Message-ID: <20201229070019.4510-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.186]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS03.realtek.com.tw (172.21.6.96)

From: Max Chou <max.chou@realtek.com>

The firmware and config files are for RTL8852A BT controller with USB interface.

Version: 0xd99a_7644

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 WHENCE                      |   2 ++
 rtl_bt/rtl8852au_config.bin | Bin 0 -> 6 bytes
 rtl_bt/rtl8852au_fw.bin     | Bin 0 -> 53236 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 rtl_bt/rtl8852au_config.bin
 create mode 100644 rtl_bt/rtl8852au_fw.bin

diff --git a/WHENCE b/WHENCE
index 2a6ca3a..2f79c1d 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3656,6 +3656,8 @@ File: rtl_bt/rtl8822cu_fw.bin
 File: rtl_bt/rtl8822cu_config.bin
 File: rtl_bt/rtl8822cs_fw.bin
 File: rtl_bt/rtl8822cs_config.bin
+File: rtl_bt/rtl8852au_fw.bin
+File: rtl_bt/rtl8852au_config.bin
 
 Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
 
diff --git a/rtl_bt/rtl8852au_config.bin b/rtl_bt/rtl8852au_config.bin
new file mode 100644
index 0000000000000000000000000000000000000000..91d3f4402289e7b0efd395c7fcc8b4789465aba6
GIT binary patch
literal 6
NcmWGtt=!JQ000Mk0jmH2

literal 0
HcmV?d00001

diff --git a/rtl_bt/rtl8852au_fw.bin b/rtl_bt/rtl8852au_fw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..7de4f816b93025d44744b4308ceedf0b4cc83b61
GIT binary patch
literal 53236
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
IfBw+_0Cyko2><{9

literal 0
HcmV?d00001

-- 
2.17.1

