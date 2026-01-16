Return-Path: <SRS0=5Cr7=7V=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0647DD4A609
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Jan 2026 09:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD0F3C19421; Fri, 16 Jan 2026 09:03:26 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A420BC116C6;
	Fri, 16 Jan 2026 09:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A420BC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 60G93DjJ4747155, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1768554193; bh=YFntVSF0gXEjTGOnh5dmnqwDqheMR92+a0cZ5yTKZu8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=dkGXM9X7a6kLd9vH9IeQEvvKiyzmPX8ntdiCz5V/HtW3nGvlKLgWTAQY364uhuOGx
	 HLIBkaquIrYnjgFJ+MQXE4alcNLJi8ZLfTID+/4o8OP23MwuKLOo9HGusOqjCaX5Jm
	 0EwLsEt84eQauM+YYkaFLNjLD0NaOawj1g8+P7QsRyDrUhzze6BlMvlbJKl+7Rrxlw
	 6p+BKYBCgFKIPcrqCPpTneZbmIJs1BFrANX7XsT0hZ7hbybPB9blAdL6ATNPDc9MW6
	 VUOtMP0NMOSgdegx4fvSavl3tbXh9D4HTxIrmZusMP1ojMPMqPNvJ/k0AmPndIny8t
	 UWbDJZhokWgcA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 60G93DjJ4747155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 17:03:13 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 16 Jan 2026 17:03:13 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 16 Jan 2026 17:03:12 +0800
Received: from localhost.localhost (172.24.54.48) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 16 Jan 2026 17:03:12 +0800
From: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <max.chou@realtek.com>, <alex_lu@realsil.com.cn>,
        <kevinchen@realtek.com>, <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8852BT/RTL8852BE-VT BT USB FW to 0x06EB_C65F
Date: Fri, 16 Jan 2026 17:02:12 +0800
Message-ID: <20260116090212.859506-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This firmware is submitted for RTL8852BT/RTL8852BE-VT BT USB I/F.

Release Version: 0x06EB_C65F

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8852btu_fw.bin | Bin 125940 -> 128140 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8852btu_fw.bin b/rtl_bt/rtl8852btu_fw.bin
index 858ccc1ebb8bc7374e20cf5f6d9c33f5d5e1a2ae..5a2043c341ac4330ce24e3088e3402683b78b04b 100644
GIT binary patch
delta 15396
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

delta 13088
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
GEc}1XPh5cj

-- 
2.34.1

