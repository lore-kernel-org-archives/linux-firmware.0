Return-Path: <SRS0=1l1r=GC=realtek.com=hayeswang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22538CDB474
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Oct 2023 07:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC49EC433C8; Fri, 20 Oct 2023 07:07:06 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADBA7C433C9
	for <linux-firmware@kernel.org>; Fri, 20 Oct 2023 07:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ADBA7C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 39K76mQ523912054, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 39K76mQ523912054
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 15:06:48 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 20 Oct 2023 15:06:48 +0800
Received: from fc38.localdomain (172.22.228.98) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 20 Oct
 2023 15:06:48 +0800
From: Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <cyrozap@gmail.com>, <fejes@inf.elte.hu>,
        Hayes Wang
	<hayeswang@realtek.com>
Subject: [PATCH linux-firmware] rtl_nic: update firmware of RTL8156B
Date: Fri, 20 Oct 2023 15:06:32 +0800
Message-ID: <20231020070632.1188561-435-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.228.98]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)
X-KSE-ServerInfo: RTEXMBS04.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

rtl8156b-2.fw
   version: rtl8156b-2 v3 10/20/23

Signed-off-by: Hayes Wang <hayeswang@realtek.com>
---
 rtl_nic/rtl8156b-2.fw | Bin 7256 -> 5776 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_nic/rtl8156b-2.fw b/rtl_nic/rtl8156b-2.fw
index 417fbd3407dd51670d25e473fe2b0ee56d33163b..a7a888c5b2ccc44c391504e968373a6f802fd694 100644
GIT binary patch
literal 5776
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

literal 7256
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
U03CP-6$E-F(C^6fXTj(H0NqYnNB{r;

-- 
2.41.0

