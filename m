Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108BBC61DA4
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0D09C433EF; Sat, 18 Feb 2023 18:46:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1CC0FC4339B
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1CC0FC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id d11-20020a05600c3acb00b003ddca7a2bcbso854705wms.3
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+q2iufXJVDv0V4cnsXDiQZuK79sJesGKYGfLzK/45Cs=;
        b=NDu34LZ/JBT5csezA8ti2nlmOXRCfxb1jx1LSrZNitW9kAZCH4UyByyYICcLFrBuSz
         H1bc5jaV5ibUHws0Il/D70fK1psUrlNI1pxHfxH6bQzliVeRacADfOOhhJuLj6SqufCY
         JnhuX3lqIfgwIFBwSdniJrRn+KtXiWKMnwn0TbNcPxkOijJXFCnRWDKJHF/qRSpN5z5x
         DS/sc87bvWchEioxtPn79T6Kg9kyaBVaU58dn7UCGOavuiOYImviqO2exjP6l15YBdw5
         Ady60+K6xOlTxb399984VaO8Y6GYntZDteRhthgFYR3rlMgl6S6YokIBQHyTSMFtDAwM
         sJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+q2iufXJVDv0V4cnsXDiQZuK79sJesGKYGfLzK/45Cs=;
        b=gYkjmFinMDLRPeqM9kEYa9cLimg/98tBAI/k6H7vxKMleI5iSLFA+KDBrgzFysrtEE
         Vft4un3oVC7q/TC8heTUnGfdSUNawNcABT4V5Y3MUxy8N+BCMtKRl6PIFNS85yKszs8e
         VE67rnRi3LkesAeujiuKSaWUFz5VZdauw7h67Uy0eKLrtM1gsXQzUKO1fbYMMfmAqHn1
         cyMeEvQW3GUu8nDHj5Y8G04EI8UApfNS4xah7kiOBdm602362M3wJaUcU5MKkEUtEVQS
         MOvatBV/1QeB5ncnkvWFq2adK+HNiKCSmqJE/Bp2MzMO9dERLHHMhMLS2C9kMoDXCqOP
         hQuw==
X-Gm-Message-State: AO0yUKXGY/ve3xMBsGFkD5tW9iLRynuZJ4BFm24K2xTF3KKWgLghMI6D
	FClVNDjkrNCBtDD2+n0Qp+CE9rpyh/w=
X-Google-Smtp-Source: AK7set+itywY5imenkwai3jW9eYV3qlNKmMY3yeTr4lMz3at2htbcIh3ZYnQYvyRI/6mGvSUFlEoJQ==
X-Received: by 2002:a05:600c:1656:b0:3e1:12d1:fde0 with SMTP id o22-20020a05600c165600b003e112d1fde0mr4188514wmn.6.1676745988924;
        Sat, 18 Feb 2023 10:46:28 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id 1-20020a05600c028100b003e200dc15f5sm8898038wmk.42.2023.02.18.10.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:28 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 04/15] WHENCE: remove duplicate File entries
Date: Sat, 18 Feb 2023 18:46:10 +0000
Message-Id: <20230218184621.2026504-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XXX: still one outstanding - mediatek/mt7663pr2h.bin

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/WHENCE b/WHENCE
index 13013f8..d1cc3f8 100644
--- a/WHENCE
+++ b/WHENCE
@@ -1073,10 +1073,6 @@ Version: 75.27f1c37b.0
 File: iwlwifi-so-a0-jf-b0-77.ucode
 Version: 74.f92b5fed.0
 
-File: iwlwifi-so-a0-gf-a0.pnvm
-
-File: iwlwifi-so-a0-gf4-a0.pnvm
-
 File: iwlwifi-ty-a0-gf-a0.pnvm
 
 Licence: Redistributable. See LICENCE.iwlwifi_firmware for details
@@ -2980,19 +2976,6 @@ Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
 
 --------------------------------------------------------------------------
 
-Driver: r8723au - Realtek 802.11n WLAN driver for RTL8723AU
-
-Info: Taken from Realtek driver rtl8723A_WiFi_linux_v4.1.3_6044.20121224
-      Firmware is embedded in the driver as data statements. This info
-      has been extracted into a binary file.
-File: rtlwifi/rtl8723aufw_A.bin
-File: rtlwifi/rtl8723aufw_B.bin
-File: rtlwifi/rtl8723aufw_B_NoBT.bin
-
-Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
-
---------------------------------------------------------------------------
-
 Driver: rtl8188ee - Realtek 802.11n WLAN driver for RTL8188EE
 
 Info: Taken from Realtek version rtl_92ce_92se_92de_8723ae_88ee_linux_mac80211_0010.0109.2013
@@ -5943,8 +5926,6 @@ Link: cirrus/cs35l41-dsp1-spk-prot-103c8995.wmfw -> cs35l41/v6.61.1/halo_cspl_RA
 Link: cirrus/cs35l41-dsp1-spk-cali-103c8995.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
 Link: cirrus/cs35l41-dsp1-spk-prot-103c89c6.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
 Link: cirrus/cs35l41-dsp1-spk-cali-103c89c6.wmfw -> cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw
-File: cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
-File: cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
 File: cirrus/cs35l41-dsp1-spk-prot-103c8971.bin
 File: cirrus/cs35l41-dsp1-spk-cali-103c8971.bin
 File: cirrus/cs35l41-dsp1-spk-prot-103c8972.bin
-- 
2.39.2

