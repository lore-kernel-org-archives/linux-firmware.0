Return-Path: <SRS0=mAre=ER=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829C7CA0FE9
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Sep 2023 06:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69930C433CA; Fri,  1 Sep 2023 06:52:41 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C7C5C433C7
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C7C5C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 643C54459B
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693551157;
	bh=ZmNRkgBP64LCpy3PIU5Neq0jCkoIsGbhyz/2IFqP9MY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=hZcQHPPdT2CKsIyz/NtdBzfu/pR6ZlfzsGQTr8O32SRXqR1Mp5rBD7AeaUfT5FfQj
	 nwY1sfMCuXRNX3VcCdinNP7k4qASoutqSUqrCMOqmKGsgVGCCllsFdJ76hwozvs9dh
	 MCpqd81j0/C8HRIwO3CBBbSzBc0Boj6vFU7kAQJphJXs5wbLzz7OjyrcAc0p30WlPA
	 kvobY3gyBumE+V9auiKB6cvTrOFMlY+7zJFV7ubBkOWSTgvicg0shUPEOxAEPJCXmF
	 L8aA1PjNKaYxM26z6zTSilCQV/EdoWi3ffetLNgMUqTbUshJYr6/SKb7MwgulTBip4
	 vosfkHcTRdzHQ==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31c5cc5537dso1143648f8f.1
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 23:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693551157; x=1694155957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmNRkgBP64LCpy3PIU5Neq0jCkoIsGbhyz/2IFqP9MY=;
        b=PazgUnahCD15WBm3zjvHF3+SmxzRxovH35jLmOaHk8lia5WVCUHwf1ZKulsYF+fkML
         MEm3GdseQQjnTlPxjUdShjODdXPFFTIQwvLYsQPa+WebEV2ymIVLsm4+ZVkMhXJK6TmN
         Bergj5wbpJov2jvQTbG9xrR8HYWgylcGcn2EnoFomBhAk5zn9/ULBRZni2AtnbDw8SxZ
         AyowwNczuamEzUHA02eRZuiFxq33QBFUhnTyp7KiKcBGpLlQNmqmPPGp3LqTeMGBPv+p
         3KkMoY9tvCvh05Y3sYLlLEB4G/0O6qtNi5fJM9pcujLMT1mcaz3PXKpbDVRke/GrK7RF
         QFzA==
X-Gm-Message-State: AOJu0YzQZdf/E+n2VISF4iHhgC4RgapUBTGdw5Pwp0RvaITbsxl5TR7A
	05NyjqGEw0wuyrW4sBNp7ayh3vZI3cx4aR0jA0mIVVyu9O6fp11PbhJ/NYcE1dW4tcix9UIPIEY
	++QuijX/YGPShqS8UtRxCcXui6FFJzqvc+3jJhw==
X-Received: by 2002:a5d:6451:0:b0:317:52ba:81f2 with SMTP id d17-20020a5d6451000000b0031752ba81f2mr3332154wrw.16.1693551157205;
        Thu, 31 Aug 2023 23:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCKvutgmEIJoPsgvq7BQrwR436q44kDwjkKrQ2QfraqnQ/I2FmMij0Ke3wXposCfTRI/LteA==
X-Received: by 2002:a5d:6451:0:b0:317:52ba:81f2 with SMTP id d17-20020a5d6451000000b0031752ba81f2mr3332144wrw.16.1693551157008;
        Thu, 31 Aug 2023 23:52:37 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b0031ad5fb5a0fsm4245865wro.58.2023.08.31.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 23:52:36 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: mario.limonciello@amd.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: juerg.haefliger@canonical.com,
	jwboyer@kernel.org,
	linux-firmware@kernel.org
Subject: [PATCH v2 3/3] WHENCE: Don't compress qcom json files
Date: Fri,  1 Sep 2023 08:52:26 +0200
Message-Id: <20230901065226.13607-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901065226.13607-1-juerg.haefliger@canonical.com>
References: <41fb7957-98e8-4ad6-b958-1e673e7476e0@amd.com>
 <20230901065226.13607-1-juerg.haefliger@canonical.com>
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

