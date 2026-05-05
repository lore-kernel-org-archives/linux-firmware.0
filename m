Return-Path: <SRS0=6I44=DC=gmail.com=zenmchen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D53CD3430
	for <linux-firmware@archiver.kernel.org>; Tue,  5 May 2026 07:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6ECA4C2BCF5; Tue,  5 May 2026 07:13:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3AF0C2BCF4
	for <linux-firmware@kernel.org>; Tue,  5 May 2026 07:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3AF0C2BCF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso28659445ad.1
        for <linux-firmware@kernel.org>; Tue, 05 May 2026 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965238; x=1778570038; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sy3e8IR5hEUnfKVT0vuxiLFc55DE78+tD8yhZrKPdYI=;
        b=BOhBH331B8YB6hBcqFtLIKmbULxb0aI6LihaQSUuFNsSX1dzzqjwP3QB8UmGJjv4Kh
         UTeVlrwhhNyKaxIWnVrQoLPz8NkArQ+mtNMRcvTVvSe5c8OAgCK8Pj1/4FK+0XzPKtpa
         PJjI3+hcO+02MbP0CLMUsvrbREAuFFeXMx0rIbMtRWKgzswzqlwEatz9WwMDnlWotvFe
         8LZWb6WWPYDEaLknUKV0yYOqlbzhGB+ELJ44654bMlD54ocfmNQqzyyVp9lpylb8pPvT
         Z/8sjtwZYOsdDvWTQaz2mBctw55w4ehN0Tx7asPhhN2fpw2G2JwwBf/o1upvHazb9rjS
         MRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965238; x=1778570038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy3e8IR5hEUnfKVT0vuxiLFc55DE78+tD8yhZrKPdYI=;
        b=kUr3IakaTcY+cXk39ApZXjtW3fCwGE45JY5d13amBOKSuwS6C8RnWFn5jz0+PlSBGX
         ard+npa7E125L2SAudkgY8ELT/yNPqvCeP7AX+cimKEsSif+M5ZYwiUnMkLSbcAABKWf
         35kOoJ2AN2k72729ix3O7nWJazXTOoLqaW2IAE3pXGqb0rmuwwsbY3A4p7n5lLM6Cz3g
         j1DDd25GWKAVeDpef2pvi3FUaiQAh1DnL9vYzZqfY57H4au00tO+Q7bx1MC3RJUpXzjb
         LSkfMEfikTEIJmAdh4emvXYff8lMFk2Qd0Yfhm65ZjnPX0qbU+QKaYfeuuOC8TwVyUKV
         rEMg==
X-Gm-Message-State: AOJu0YzZv38zT6pBP+eKSXKgwi1Wofrz09KC7QJgjrcwqwUOBxzh57Sv
	c6a+CGGBSEJMbh2tL8l0MIeVLFoXSJHwfdwm8z2QV80SsBIbfjglbnRf3ZwK1g==
X-Gm-Gg: AeBDieuDu273BajL8lf0DV7/zMuPc1p7oEZXeIrVlpXtIHePYtmJQaTKi6GPjjODMS4
	NUsUtre4DS2wNftSKMtDSo313XXW+Rr3yQNC8T5OihznMnRzk4tpr9uN55z1Na6Kv7ePZJD0qd5
	oJ6w+8IxkOvbUJoLYmdi9ZQybpoRAZBxE2wT+06EADeYbUQyg5NospVoPk/mB92JNmRcfgA66SK
	BpCl4vNbwKkAb8rvuPCjCACZcD13QHsJVn6ZHUjmWgFHSr8EtPEg8t9DwHbqOoyyveVPVhJ2CKR
	7qthltwtCnMih9n8JyoB2aBdlEiEwXG6sUByVC0YnsC3kBAdWXW7QXCyZvQiocdgQMQr5EU7A4W
	u7/adhYq/X+HQbD3PdunzHEMVeWnIxtUTonj5L3AGtGKadjPmOMkayXbY200RSFH0ZNlQWIW/I4
	UoiOltXtFdpN0Kw0JRw8UMNB7vL9FFsALbG3IOyZT245S1G2aPHUBiAzFGnnoy258=
X-Received: by 2002:a17:903:1207:b0:2b2:a267:784a with SMTP id d9443c01a7336-2b9f28098b7mr119696455ad.24.1777965237726;
        Tue, 05 May 2026 00:13:57 -0700 (PDT)
Received: from BM5220 (118-232-8-190.dynamic.kbronet.com.tw. [118.232.8.190])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b9caaae29dsm123840115ad.19.2026.05.05.00.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:13:57 -0700 (PDT)
From: Zenm Chen <zenmchen@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: max.chou@realtek.com,
	hildawu@realtek.com,
	pkshih@realtek.com,
	zenmchen@gmail.com
Subject: [PATCH] rtl_bt: Add missing rtl8761a_config.bin for RTL8761AU
Date: Tue,  5 May 2026 15:13:41 +0800
Message-ID: <20260505071341.7688-1-zenmchen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RTL8761AU Bluetooth controller functions correctly but there is an error
like below in dmesg because the rtl8761a_config.bin config file is missing.

[  171.949697] bluetooth hci0: Direct firmware load for rtl_bt/rtl8761a_config.bin failed with error -2

To suppress this error message, add a soft link from rtl8761a_config.bin to 
rtl8761bu_config.bin. The latter is an empty/header-only config file
compatible with this device.

Signed-off-by: Zenm Chen <zenmchen@gmail.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 48c471e2..f7fc4928 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4395,6 +4395,7 @@ Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config.bin
 File: rtl_bt/rtl8723cs_xx_fw.bin
 File: rtl_bt/rtl8723cs_xx_config.bin
 File: rtl_bt/rtl8761a_fw.bin
+Link: rtl_bt/rtl8761a_config.bin -> rtl8761bu_config.bin
 File: rtl_bt/rtl8761b_fw.bin
 File: rtl_bt/rtl8761b_config.bin
 File: rtl_bt/rtl8761bu_fw.bin
-- 
2.53.0

