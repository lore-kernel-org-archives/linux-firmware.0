Return-Path: <SRS0=yR/6=A6=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E60C7EE22
	for <linux-firmware@archiver.kernel.org>; Tue,  9 May 2023 15:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1788EC433D2; Tue,  9 May 2023 15:19:14 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4E9EC4339E
	for <linux-firmware@kernel.org>; Tue,  9 May 2023 15:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4E9EC4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1BD1C3F22C
	for <linux-firmware@kernel.org>; Tue,  9 May 2023 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683645548;
	bh=5xJ1wgb1A81fQaNPwzx2u2g93D5fVnsKwQ74RVkU2GU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gp6xcvsVar1APq25o0jOHYF9vFhMyBanEFmbyTikiemC+/Eim3pUNyQDFhIdWL1uO
	 WzyuSRhL4oHGnKnOfELMjgCbjzQ88+tqRa2i2hBLXuEYSejs02kBLPcQIp8O+31l0g
	 F7CIgHoTDYpmj6QPtoREObV2h4OlKQ6BO5OaGXWdaAxThRjAU26JfoIAk0sfzIEUeA
	 9w9H39idRu5CBg6sDxafyN0ajwBOiIGL9x3sIrnlyMEg1WDj2823d3ihxcIKXMD/zW
	 o7yFTnDyJL3riDz9mJrhgf6wZLtChV3P6MxuqdQRpwmViOHKx311DOaXzWtgakysy4
	 IIW+WCksh/zbQ==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50bc456a94dso5704578a12.1
        for <linux-firmware@kernel.org>; Tue, 09 May 2023 08:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683645547; x=1686237547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xJ1wgb1A81fQaNPwzx2u2g93D5fVnsKwQ74RVkU2GU=;
        b=M5qjHdptMBfu5khBz/SdCT39Mq9G+e2r8rOsAVFrQ8vu4duMVCM66g1GOZmL5w5m6l
         sYmlQC9VFx7wMJ3p+VpBK+2/w2Dc2WqHS3T2tTku98fGP3qAsHbVVuzQroLRP7Bf2rXQ
         CjNrFpVFJ7Hpamqd2vr20cMjeLEBQlZfKs13Oy0SEASjmSHH0K+/dlvy1RL6b0iLbZDd
         yhkErM/OJldP4wweKGrs7saZfTlajQz4819dqB/Cn1clDbb4eIHezG8S44C9HHmblXdI
         dCibJuQfWQfbyGSPIfAxCG8CKJaZfCS+rlenejXRVfvy9bIpbzsPcGzcJFrr7er53r6S
         NmJw==
X-Gm-Message-State: AC+VfDyDUaRUkfORiC8KoBKisvkhroB+/y+SV3B4p4wIHlpFpLN+hmr6
	4IH0RX2pdpFkRDjdniMhc/1NKBzdKzUuQ/ZHRdaszdjM9p1u9R6qc/MsKRaHUEtqBNwKZ0nD0qk
	kqtQQWiN8UHRs4CbatS01OMftW7MPmiO6iAtvlhJxm5981A==
X-Received: by 2002:a17:907:608c:b0:94e:6a24:9463 with SMTP id ht12-20020a170907608c00b0094e6a249463mr13421100ejc.28.1683645547596;
        Tue, 09 May 2023 08:19:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Z4prxtId7TC05xihqAWKDF+ePr8y4x4SHsmGzHWPxNMVoc4I/MLPsDD0t6VyUQkM6cgX3Ww==
X-Received: by 2002:a17:907:608c:b0:94e:6a24:9463 with SMTP id ht12-20020a170907608c00b0094e6a249463mr13421080ejc.28.1683645547339;
        Tue, 09 May 2023 08:19:07 -0700 (PDT)
Received: from localhost.localdomain ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id pk25-20020a170906d7b900b00965d9892bafsm1446446ejb.111.2023.05.09.08.19.06
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:19:06 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] WHENCE: Cleanup Realtek BT firmware provenance
Date: Tue,  9 May 2023 17:19:02 +0200
Message-Id: <20230509151902.65810-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Juerg Haefliger <juergh.haefliger@canonical.com>

Over the years, Realtek has submitted updates of firmwares that were
originally pulled out of vendor driver packages. Remove old and obsolete
provenance notes for these blobs.

Signed-off-by: Juerg Haefliger <juergh.haefliger@canonical.com>
---
 WHENCE | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/WHENCE b/WHENCE
index 74a496864afc..7b78ac22d0ea 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3794,18 +3794,11 @@ Found in vendor driver, linux_bt_usb_2.11.20140423_8723be.rar
 From https://github.com/troy-tan/driver_store
 Files rtl_bt/rtl8822b_* came directly from Realtek. These files are
 updated on April 14, 2017.
-Files rtl_bt/rtl8821c_* and rtl_bt/rtl8723d_* came directly from Realtek.
-File rtl_bt/rtl8822cu_fw.bin came directly from Realtek.
-updated on February 24, 2019
-File rtl_bt/rtl8822cu_fw.bin came directly from Realtek.
-updated on October 23, 2019
-File rtl_bt/rtl8822cu_config.bin came directly from Realtek.
 
 Found in vendor driver, 20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202.zip
-File rtl_bt/rtl8761b_fw.bin
 File rtl_bt/rtl8761b_config.bin
-File rtl_bt/rtl8761bu_fw.bin
 File rtl_bt/rtl8761bu_config.bin
+
 --------------------------------------------------------------------------
 
 Driver: btmtk_usb - Bluetooth USB driver
-- 
2.37.2

