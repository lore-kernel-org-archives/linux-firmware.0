Return-Path: <SRS0=EIid=P5=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DCCA0EF7
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Aug 2024 09:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30B3BC4CEC4; Fri, 30 Aug 2024 09:36:00 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52EE8C4CEC2
	for <linux-firmware@kernel.org>; Fri, 30 Aug 2024 09:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52EE8C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47U9ZqsvE524788, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1725010553; bh=/PyXPRfUidC68wtC12LoOriAvJNKWQoadQJ1b4OqRto=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=e9LNFoOmYsD27gTrsEpB1y589wNADLqW8TaEoltFBeQLiYzPRnIZSiLDAjDesZy4n
	 D/tLjOUVANXevnQpktJtza41RJRnJxwodYL7Z+OxBmnkbehsedC/o85ut5nt2Hv5Lp
	 ayDOLxyRa+8GyyTbqMsTmLSvw10aE69Ojr/CdndpZN8nXXWIGzUkR+0ZcRnjz29hUU
	 nprCGiA5Po53zLK0WrYH/uzIqs19dbNvSx4Htr+FP3Le11AnJKvAeiybRhLMmJeada
	 sxctZ7KLYUdBmwCwzgFpp5c/13xKRfCy/RKJNN+axnCsdHYzILTorKG688ZVZTWaer
	 NuUBrjoL5a0DA==
Received: from RSEXMBS01.realsil.com.cn ([172.29.17.195])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47U9ZqsvE524788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 30 Aug 2024 17:35:52 +0800
Received: from RSEXH36501.realsil.com.cn (172.29.17.2) by
 RSEXMBS01.realsil.com.cn (172.29.17.195) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 30 Aug 2024 17:35:52 +0800
Received: from 172.29.32.27 (172.29.32.27) by RSEXH36501.realsil.com.cn
 (172.29.17.2) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 30 Aug 2024 17:35:52 +0800
From: ChunHao Lin <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <hkallweit1@gmail.com>,
        <nic_swsd@realtek.com>
CC: ChunHao Lin <hau@realtek.com>
Subject: [PATCH v2] rtl_nic: add firmware rtl8126a-3
Date: Fri, 30 Aug 2024 17:35:51 +0800
Message-ID: <20240830093551.4906-1-hau@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This adds firmware rtl8126a-3 for RTL8126A rev.b.

Signed-off-by: ChunHao Lin <hau@realtek.com>
---
 WHENCE                |   3 +++
 rtl_nic/rtl8126a-3.fw | Bin 0 -> 13232 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 rtl_nic/rtl8126a-3.fw

diff --git a/WHENCE b/WHENCE
index 4d9cd340..e047c5d2 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3463,6 +3463,9 @@ Version: 0.0.2
 File: rtl_nic/rtl8126a-2.fw
 Version: 0.0.2
 
+File: rtl_nic/rtl8126a-3.fw
+Version: 0.0.5
+
 Licence:
  * Copyright © 2011-2013, Realtek Semiconductor Corporation
  *
diff --git a/rtl_nic/rtl8126a-3.fw b/rtl_nic/rtl8126a-3.fw
new file mode 100644
index 0000000000000000000000000000000000000000..561bd5e0d47001752e0c1519478c1c0ef5ec517f
GIT binary patch
literal 13232
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
UzIrd=dGT-keOZ#<ka_(3e|&ur@c;k-

literal 0
HcmV?d00001

-- 
2.43.0

