Return-Path: <SRS0=MP8O=EQ=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A36C83F10
	for <linux-firmware@archiver.kernel.org>; Thu, 31 Aug 2023 08:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9EFBC433C9; Thu, 31 Aug 2023 08:14:20 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AF02C433C8
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AF02C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 139753F179
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693469652;
	bh=ZmNRkgBP64LCpy3PIU5Neq0jCkoIsGbhyz/2IFqP9MY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=FKPdxWg92w8gFjXnA0Zy+M338RCV265MdAltNWWTvYXG91KOfOrFNJLQ7Qt6es6RB
	 E30yQ2jNHjQUkYOVUhVr6W2SWCVwjdEFbrzsyCXLBWYsWUPEjlS1xrqyj+BdEYdL/7
	 g7GORrscwbBh5WFdRcgOIGtC2/QU5yp6BcyLe1r8YltcFOS7Qnkjz0BQyMo9Lf9a83
	 +T0jTUncsSAhU7Ygtukoi1p52sedTHg/fiYO/Ob3J2La4u5ezMmldUMIw0Yst38b6X
	 e5IWf9A4XkrtMX/g4mmmoWdT/eF4U44oFNyIcM8C66Ine+BbtNXdGOXV93HAA0pFql
	 NpXjpZ+OuEoyA==
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-30e4943ca7fso281412f8f.3
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 01:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469651; x=1694074451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmNRkgBP64LCpy3PIU5Neq0jCkoIsGbhyz/2IFqP9MY=;
        b=Uf8A+Bcvx6vdv2rGeHPLND3VyoGD+aiofYfbwJeNYW6vkz2bhKKR6gAymRRIIH1J9b
         vCekz1DgUlO2gpdxdYBnQFQORgEt5SiZCUCAhnrpuow4dCCfwPcNkWv1YxhZPya2wH5s
         IGOHLtBp3S/c1Ip3wQUkiIeWYBiMPi0zbmBoNJFMtLS+Mjqr3cMaUJoA/ofg4xZQvugF
         WK4YY5MctmnOM6M1AME3MVGv/FKN9M9alDBH//ORkQRHc7ZzD5cixGHr9ClSF8Cjb1UK
         3phafumrZbZzR0X3O27K+0Ffg+Avr87teRw3X/DNNsw0ggR8Nnd7DIazXU5NUMhOLGaY
         ebOw==
X-Gm-Message-State: AOJu0YywkPG+t4w81Bl3N0W4i1Y95zSYkBOtCmChjoUhn/bKsP+TduPR
	xEakwlFcyOLUX8sWvZAa2Hmr6pK9WMmNZSBj85hUb7GXayr1q2zOqscGM6LAYvEiVzzbs7Hgr37
	VA4tEAeTMAXm9gmITOaVIOWGB0TWkBI2St4c8fZf2Wf7Bfw==
X-Received: by 2002:a5d:452c:0:b0:31a:d1c3:97ca with SMTP id j12-20020a5d452c000000b0031ad1c397camr3773036wra.20.1693469651777;
        Thu, 31 Aug 2023 01:14:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqqU7q77nslOBLpXIj4hkr3Y6JbrkplzHtZbwP/cEvtnuAaVovopPGfaNLjgh8i9+OOvlQlw==
X-Received: by 2002:a5d:452c:0:b0:31a:d1c3:97ca with SMTP id j12-20020a5d452c000000b0031ad1c397camr3773027wra.20.1693469651566;
        Thu, 31 Aug 2023 01:14:11 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4588000000b003143add4396sm1359972wrq.22.2023.08.31.01.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:14:11 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH 3/3] WHENCE: Don't compress qcom json files
Date: Thu, 31 Aug 2023 10:13:45 +0200
Message-Id: <20230831081345.47699-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230831081345.47699-1-juerg.haefliger@canonical.com>
References: <20230831081345.47699-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't compress qcom json files. They are loaded by the pd-mapper userspace
app which doesn't know about compression.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 WHENCE | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/WHENCE b/WHENCE
index 852e88f55341..e057a5e49931 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5630,28 +5630,28 @@ File: qcom/apq8016/modem.mbn
 File: qcom/apq8016/wcnss.mbn
 File: qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin
 File: qcom/apq8096/adsp.mbn
-File: qcom/apq8096/adspr.jsn
-File: qcom/apq8096/adspua.jsn
+RawFile: qcom/apq8096/adspr.jsn
+RawFile: qcom/apq8096/adspua.jsn
 File: qcom/apq8096/mba.mbn
 File: qcom/apq8096/modem.mbn
-File: qcom/apq8096/modemr.jsn
+RawFile: qcom/apq8096/modemr.jsn
 File: qcom/sdm845/adsp.mbn
-File: qcom/sdm845/adspr.jsn
-File: qcom/sdm845/adspua.jsn
+RawFile: qcom/sdm845/adspr.jsn
+RawFile: qcom/sdm845/adspua.jsn
 File: qcom/sdm845/cdsp.mbn
-File: qcom/sdm845/cdspr.jsn
+RawFile: qcom/sdm845/cdspr.jsn
 File: qcom/sdm845/Thundercomm/db845c/slpi.mbn
-File: qcom/sdm845/Thundercomm/db845c/slpir.jsn
-File: qcom/sdm845/Thundercomm/db845c/slpius.jsn
+RawFile: qcom/sdm845/Thundercomm/db845c/slpir.jsn
+RawFile: qcom/sdm845/Thundercomm/db845c/slpius.jsn
 File: qcom/sm8250/adsp.mbn
-File: qcom/sm8250/adspr.jsn
-File: qcom/sm8250/adspua.jsn
+RawFile: qcom/sm8250/adspr.jsn
+RawFile: qcom/sm8250/adspua.jsn
 File: qcom/sm8250/cdsp.mbn
-File: qcom/sm8250/cdspr.jsn
-File: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
-File: qcom/sc8280xp/LENOVO/21BX/adspua.jsn
-File: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
-File: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
+RawFile: qcom/sm8250/cdspr.jsn
+RawFile: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
+RawFile: qcom/sc8280xp/LENOVO/21BX/adspua.jsn
+RawFile: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
+RawFile: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
 File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
 File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
@@ -5675,7 +5675,7 @@ Driver: qcom_q6v5_mss - Qualcomm modem subsystem firmware
 
 File: qcom/sdm845/mba.mbn
 File: qcom/sdm845/modem_nm.mbn
-File: qcom/sdm845/modemuw.jsn
+RawFile: qcom/sdm845/modemuw.jsn
 Link: qcom/sdm845/modem.mbn -> modem_nm.mbn
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
-- 
2.39.2

