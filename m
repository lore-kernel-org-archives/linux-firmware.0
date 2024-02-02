Return-Path: <SRS0=CsBo=JL=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4167C4828F
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 15:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 808E3C433A6; Fri,  2 Feb 2024 15:39:18 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D863CC433C7
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 15:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D863CC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 07AF7404AB
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 15:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706888354;
	bh=5G7F1C79XLUcEClc0LseRXrX63IEJ/r6WHq5nKl4Cys=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=HcNW0ic3CbJFECRbfhCO6FtVtA8TSfW52HAdlCMha3FNzYDtaJHmPxCFW3sWM4Syr
	 P4XGqep1dRs9yzW5/bUO91madlYlKEV2wd+lh520M5umWh3PKAvXUXR9F1uaSJ3Uh4
	 28nijDjGv/uEGVG32aaAP7jzCt4RENYf5+W91LVnQZtjlehIviLS0ET8BwypmWXdbr
	 XA1tm5rxHne6+nz3pziJ5WONX3jKJvtL20pK3KtxtBnVp417tJgmxwZXk9UE8d320f
	 10zrgbWEonX2e8clRvmGE1symXN8TiUZE7nOss4kq/ougK+QB455hLgiISBc30OJ/y
	 oRBMcj50ynhYQ==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40ef6b8d0f6so12373435e9.2
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 07:39:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706888353; x=1707493153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5G7F1C79XLUcEClc0LseRXrX63IEJ/r6WHq5nKl4Cys=;
        b=pas7UMsVcCaK+0b8xA7TV3Qdlb8rcgSbqdgrxt3W+7Ed8mtRnSfjDZmtia32BveMRy
         XJhS3WsLPy0nW+0drdT4hV85loJ/eeZN+npqnrVobWl2PYw2cxSHMUakzmNn8VpwG/RE
         tgMF4EERMSQxdDz2Zqj1g7fGSjgwJOikx/W6N9xRbHfnjjcQZNLbywWMbPQlehlLbs2o
         wUqRyjrOhgsG/EsbP6etMhW+zfE5rxPno75rJQg1HJPZ/4UJxBypiuGYQ7LDIu2MzGXI
         bcexW7XRV9oJ+rQsfGWEJezCsP0GhdhfAUhMtEtnYbsb60ca/pZGUM1SzpGcNAeupw5P
         a3Uw==
X-Gm-Message-State: AOJu0YyX6IwUKdiaRerT3EQOvaIp9G3jD0YoNLUcCPxZIcvhejP9PeDa
	CiUTvQBCKhRs1bXNtlkoSXxB2BUYSBXYdZWfFZqnrf4EqCKRI86Igl9VgdB6KGWudI6MTVmn2Sa
	/mEimwoqvOTc/KbNeHgiEv+prCHxCmUaQfX9HmD18dnZ9HLITYJWaV26fRijlhUM4w2aKR+c7Ub
	5VxZeydw==
X-Received: by 2002:a05:600c:5191:b0:40f:cb0d:a44e with SMTP id fa17-20020a05600c519100b0040fcb0da44emr867168wmb.9.1706888353246;
        Fri, 02 Feb 2024 07:39:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4q98aKTAoyOlkcX4G1vEo8XUMgCfsOWH0d3OhLVC7qaDk94gdYSbLMmUNJ8iyLMYbT+fmgA==
X-Received: by 2002:a05:600c:5191:b0:40f:cb0d:a44e with SMTP id fa17-20020a05600c519100b0040fcb0da44emr867157wmb.9.1706888352870;
        Fri, 02 Feb 2024 07:39:12 -0800 (PST)
Received: from localhost ([81.221.247.52])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d46c9000000b0033af4848124sm2170004wrs.109.2024.02.02.07.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 07:39:12 -0800 (PST)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org
Subject: [PATCH] WHENCE: Clean up section separators
Date: Fri,  2 Feb 2024 16:39:11 +0100
Message-Id: <20240202153911.1256524-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove an erroneous extra separator and make them all the same length.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 WHENCE | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/WHENCE b/WHENCE
index 5e736230d496..6742cf675dfe 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1541,7 +1541,7 @@ Licence: Redistributable. See LICENCE.ralink-firmware.txt for details
 
 Downloaded from http://www.ralinktech.com/ralink/Home/Support/Linux.html
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: mt7601u - MediaTek MT7601U Wireless MACs
 
@@ -2580,8 +2580,6 @@ Licence: Redistributable. See LICENSE.amdgpu for details.
 
 --------------------------------------------------------------------------
 
---------------------------------------------------------------------------
-
 Driver: amd_pmf - AMD Platform Management Framework TA
 
 File: amdtee/773bd96f-b83f-4d52-b12dc529b13d8543.bin
@@ -5497,7 +5495,7 @@ Version: 1.0.07-b370
 
 Licence: Redistributable. See LICENCE.mediatek for details.
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: mt76x2e - MediaTek MT76x2 Wireless MACs
 
@@ -5511,7 +5509,7 @@ Link: mt7662_rom_patch.bin -> mediatek/mt7662_rom_patch.bin
 
 Licence: Redistributable. See LICENCE.ralink_a_mediatek_company_firmware for details
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: mt76x2u - MediaTek MT76x2u Wireless MACs
 
@@ -6180,7 +6178,7 @@ Permission is hereby granted for the distribution of this firmware
 as part of Linux or other Open Source operating system kernel,
 provided this copyright notice is accompanying it.
 
-------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: prestera - Marvell driver for Prestera family ASIC devices
 
@@ -6192,7 +6190,7 @@ File: mrvl/prestera/mvsw_prestera_fw_arm64-v4.1.img
 
 Licence: Redistributable. See LICENCE.Marvell for details.
 
-------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: lt9611uxc - Lontium DSI to HDMI bridge
 
@@ -6228,7 +6226,7 @@ File: cnm/wave521c_k3_codec_fw.bin
 
 Licence: Redistributable. See LICENCE.cnm for details.
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: rvu_cptpf - Marvell CPT driver
 
@@ -6248,7 +6246,7 @@ Version: v1.21
 
 Licence: Redistributable. See LICENCE.Marvell for details.
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: amphion - Amphion VPU(Video Processing Unit) Codec IP driver
 
@@ -6259,7 +6257,7 @@ Version: 1.3.4
 
 Licence: Redistributable. See LICENSE.amphion_vpu for details
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: cs35l41_hda - CS35l41 ALSA HDA audio driver
 
@@ -7469,7 +7467,7 @@ only in connection with Cirrus Logic hardware products.
 Copyright © 2022 Cirrus Logic, Inc. and Cirrus Logic International
 Semiconductor Ltd. All Rights Reserved.
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: cs42l43 - CS42L43 ALSA audio driver
 
@@ -7483,7 +7481,7 @@ only in connection with Cirrus Logic hardware products.
 Copyright © 2023 Cirrus Logic, Inc. and Cirrus Logic International
 Semiconductor Ltd. All Rights Reserved.
 
----------------------------------------------------------------------------
+--------------------------------------------------------------------------
 
 Driver: mtk-sof - MediaTek Sound Open Firmware driver
 
-- 
2.40.1

