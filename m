Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54708C61DA4
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23A46C433EF; Sat, 18 Feb 2023 18:46:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 165CEC4339C
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 165CEC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id m22-20020a7bcb96000000b003e21e018039so242273wmi.3
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ve4IecG0AfYJhwkNA7LRFAEQphKrLLqZHgjfErvdfU=;
        b=UaoeRB771+EkwvEDiFAAzTaU/uuvmzkXNnJ76NgnOYM2B42mDWi6DqpusveJhS/rxy
         Lh6BcsnJVIgQX2N1SCpRU/8J0ASOBYeZg35waxVRuIJZYkOoc/2c/rj6dGZBco0Dh89O
         frBNp5NHiypr5BEuutljiLoevX5de43zHs9zxYnhmnXAIMS4cUijeSFI2gfZGaL1OVeH
         rJso+x2fXyatT1pvWvoirFUmL42337bGD7DlCaN6062kZANGQnV6FHoqz2RmaRi5poXn
         NVSNC+bVae0MS0PcX70ztOTrGerwSE+PoNOHvtiJnlVmR4BuOH2623MQEtgCAdZiEkVh
         3huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ve4IecG0AfYJhwkNA7LRFAEQphKrLLqZHgjfErvdfU=;
        b=w7wnUAdkQZawpm4zOvZYpqQuZanTFlxNdKvSGYegkB5Tc/LRT3GzsJeUgFSHpR+DfP
         pHpq3isVPGTfb8at1UpQydFN5eWhmNXrtRxL2Ap8kgM7SdUSwBLpz0oCYJAXywKTPsyd
         ufkgjZ0jJAhJBRNoqROAXnOa6m3QErwpLtMxGIprggTvvF06KsJDqp5xQDxCUa6LhBCb
         Umg2oh8JzGVV23xKDZnyETcj6Eh0ya7e6N7bryMq+c/ziJ0H5Ejoph9D4tumxYYzi/CZ
         TFu9sBOsN0C9ozJbfKNaS54KiyqiwyMZ6XuXwULwLlYhOQyu+1johnFV/8IUjFLuhxty
         mbOA==
X-Gm-Message-State: AO0yUKWQT8/bgbpCo7weXwzPH95BBQsSB4og0hREtkdNAkv8PDJk8c10
	HFIgMKRl2gGsvFUOgKRIeO1EX/r4Yok=
X-Google-Smtp-Source: AK7set/JgEChqOxu45SF+nPgMKJ0P7auWKZvP9czJp1SQSx3oGH6R/KBLuWNS37NYMZIdo63ftMZtw==
X-Received: by 2002:a05:600c:708:b0:3e0:98c:dd93 with SMTP id i8-20020a05600c070800b003e0098cdd93mr3364914wmn.29.1676745984790;
        Sat, 18 Feb 2023 10:46:24 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id hn30-20020a05600ca39e00b003db03725e86sm8942296wmb.8.2023.02.18.10.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:24 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 01/15] WHENCE: remove trailing white space
Date: Sat, 18 Feb 2023 18:46:07 +0000
Message-Id: <20230218184621.2026504-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 WHENCE | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/WHENCE b/WHENCE
index b6199d6..23c8847 100644
--- a/WHENCE
+++ b/WHENCE
@@ -395,7 +395,7 @@ Version: 8.07.00 MIDQ
 
 Licence: Redistributable. See LICENCE.qla2xxx for details
 
-Available from http://ldriver.qlogic.com/firmware/ 
+Available from http://ldriver.qlogic.com/firmware/
 
 --------------------------------------------------------------------------
 
@@ -2563,29 +2563,29 @@ Licence: Redistributable. See LICENCE.ueagle-atm4-firmware for details
 Driver: ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
 
 File: ueagle-atm/930-fpga.bin
-File: ueagle-atm/CMVeiWO.bin    
-File: ueagle-atm/CMVepFR10.bin  
-File: ueagle-atm/DSP9p.bin	
+File: ueagle-atm/CMVeiWO.bin
+File: ueagle-atm/CMVepFR10.bin
+File: ueagle-atm/DSP9p.bin
 File: ueagle-atm/eagleIII.fw
-File: ueagle-atm/adi930.fw     
-File: ueagle-atm/CMVep.bin      
-File: ueagle-atm/CMVepFR.bin    
+File: ueagle-atm/adi930.fw
+File: ueagle-atm/CMVep.bin
+File: ueagle-atm/CMVepFR.bin
 File: ueagle-atm/DSPei.bin
-File: ueagle-atm/CMV9i.bin     
-File: ueagle-atm/CMVepES03.bin  
-File: ueagle-atm/CMVepIT.bin    
+File: ueagle-atm/CMV9i.bin
+File: ueagle-atm/CMVepES03.bin
+File: ueagle-atm/CMVepIT.bin
 File: ueagle-atm/DSPep.bin
-File: ueagle-atm/CMV9p.bin     
-File: ueagle-atm/CMVepES.bin    
-File: ueagle-atm/CMVepWO.bin    
+File: ueagle-atm/CMV9p.bin
+File: ueagle-atm/CMVepES.bin
+File: ueagle-atm/CMVepWO.bin
 File: ueagle-atm/eagleI.fw
-File: ueagle-atm/CMVei.bin     
-File: ueagle-atm/CMVepFR04.bin  
-File: ueagle-atm/DSP9i.bin	    
+File: ueagle-atm/CMVei.bin
+File: ueagle-atm/CMVepFR04.bin
+File: ueagle-atm/DSP9i.bin
 File: ueagle-atm/eagleII.fw
 Version: 1.1
 
-Licence: Redistributable. Based on 
+Licence: Redistributable. Based on
          https://mail.gna.org/public/eagleusb-dev/2004-11/msg00172.html
 
 --------------------------------------------------------------------------
@@ -3949,7 +3949,7 @@ License:
 
   This SDD ("Static Dynamic Data") file is licensed strictly for use with
   the Sagrad WiFi modules (such as the SG901-1091/1098) that utilize the
-  cw1200 driver. There is no warranty expressed or implied about its 
+  cw1200 driver. There is no warranty expressed or implied about its
   fitness for any purpose.
 
   Permission is hereby granted for the distribution of this SDD file as
-- 
2.39.2

