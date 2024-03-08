Return-Path: <SRS0=zXlM=KO=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298DBC54E4A
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Mar 2024 10:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DECDFC43390; Fri,  8 Mar 2024 10:50:59 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A9F9C433C7;
	Fri,  8 Mar 2024 10:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A9F9C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 428AolmQ72033536, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 428AolmQ72033536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Mar 2024 18:50:47 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 18:50:48 +0800
Received: from NIC.realtek.com.tw (172.21.132.192) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 8 Mar
 2024 18:50:47 +0800
From: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <mu_hua_chen@realtek.com>,
        <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8852A BT USB firmware to 0xD9D6_17DA
Date: Fri, 8 Mar 2024 18:50:41 +0800
Message-ID: <20240308105041.407236-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.21.132.192]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

From: Hilda Wu <hildawu@realtek.com>

This firmware patch update for Realtek RTL8852A BT USB controller.

Release Version: 0xD9D6_17DA

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8852au_fw.bin | Bin 67580 -> 67188 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8852au_fw.bin b/rtl_bt/rtl8852au_fw.bin
index 1c9ba8dc604165ada473b1e32ee2371104e81aca..23947ba5131e1e99980ba36c34d0e8b960c721ff 100644
GIT binary patch
delta 10914
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
EcgO9zP5=M^

delta 11241
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
T{U86){U866@d-bdYz6@cREsL7

-- 
2.34.1

