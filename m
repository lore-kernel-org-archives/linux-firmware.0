Return-Path: <SRS0=Erni=5S=realsil.com.cn=javen_xu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE3BCCFA1A
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Nov 2025 06:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74F79C19423; Mon, 10 Nov 2025 06:51:17 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AE71C4CEF5
	for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 06:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AE71C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realsil.com.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realsil.com.cn
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AA6p5Do91217416, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1762757466;
	bh=LdEC/TktXhtBgAQolTmjoNwRvJSCs5jp5Gc884uBhgg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=cyDfEW/66soEOO/gBS38POicdNAyh4PkoMpT0bjLuGy7m0zf+78H4Ax9sms0JRpLj
	 /YDwJfvKs5S+4wksk3bk0ZhPuvAilLa2o+chGiyI998euOfHbBXw2IS9U9I9K/Igao
	 cvW+RO/VB/zpkpM3Sp3G8NWkHPE6LqcvtHjqQsH+J3D85b5wn1LnkuViihzZnuR1Oz
	 hgafQAUFiCD98OYT4tC2SZ4Hk3qW2zsPQDQ0FE0D70yaKZMBwsxvTryJqIduMntRek
	 L7MahhAAo1A1Wr5vbycg3jqYfrdSQ41PIAOfz0srjYd8tAR0fpUDta6BjTmn135ysr
	 ku0Q/ZrUbCwIA==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AA6p5Do91217416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Nov 2025 14:51:06 +0800
Received: from RS-EX-MBS1.realsil.com.cn (172.29.17.101) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 10 Nov 2025 14:51:06 +0800
Received: from 172.29.37.152 (172.29.37.152) by RS-EX-MBS1.realsil.com.cn
 (172.29.17.101) with Microsoft SMTP Server id 15.2.1544.36 via Frontend
 Transport; Mon, 10 Nov 2025 14:51:06 +0800
From: javen <javen_xu@realsil.com.cn>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: javen <javen_xu@realsil.com.cn>
Subject: [PATCH] rtl_nic: add firmware rtl8125k-1
Date: Mon, 10 Nov 2025 14:51:04 +0800
Message-ID: <20251110065104.3163-1-javen_xu@realsil.com.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This adds firmware rtl8125k-1 for RTL8125K.

Signed-off-by: javen <javen_xu@realsil.com.cn>
---
 WHENCE                |   3 +++
 rtl_nic/rtl8125k-1.fw | Bin 0 -> 8096 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8125k-1.fw

diff --git a/WHENCE b/WHENCE
index 9adbd42c..0bc967ba 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3612,6 +3612,9 @@ Version: 0.0.7
 File: rtl_nic/rtl8125d-2.fw
 Version: 0.0.4
 
+File: rtl_nic/rtl8125k-1.fw
+Version: 0.0.1
+
 File: rtl_nic/rtl8126a-2.fw
 Version: 0.0.2
 
diff --git a/rtl_nic/rtl8125k-1.fw b/rtl_nic/rtl8125k-1.fw
new file mode 100644
index 0000000000000000000000000000000000000000..8572cd689f55912d7a1f422af4ea9b51ad87eb15
GIT binary patch
literal 8096
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
N>pLjLyT*z9^FM{_!IuC4

literal 0
HcmV?d00001

-- 
2.43.0

