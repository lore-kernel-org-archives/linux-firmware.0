Return-Path: <SRS0=6E6G=EW=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32D6CCF9F1
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 00:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2D1DC433C9; Wed,  6 Sep 2023 00:21:12 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D027C433C8
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 00:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7D027C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9936b3d0286so478113766b.0
        for <linux-firmware@kernel.org>; Tue, 05 Sep 2023 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693959669; x=1694564469; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMVYqhgoDtHhF5pmsZuFKhOwMGZVLTFyvkiWPnVn3eY=;
        b=h72CS2bagzJnJ/Jao81Ojiz5VVh3iZypUQ6p4Kz6g2bgrNX8olu074A5rrLOM07/iI
         25VuQhM0NVhwA520KD0TpEf8mxilZmFrQ63osubH2jMz7QJwcGbl3sn3VssqRCpFKTEg
         mYun2hIbdYSkJfGAoGeVCHgD/SQGnCLA3wl7utVfdxG7yHvkCtN5fU3Zwf0+QopYNbcB
         5lpEEYXcBMTSpayKhVUjjjhhOh8IK7G590on4tzFJuNpGfKSm3Z5WU+GoEHRf9+XwLo9
         CpfP6CEu+qSLPRXWMp2/kIX/Syd05CL4FBm7ybfaglLBBenUxH+txsgmTAkDQXVpBqXi
         u7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693959669; x=1694564469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMVYqhgoDtHhF5pmsZuFKhOwMGZVLTFyvkiWPnVn3eY=;
        b=iSJTR8kBbhTcvJzm5UweNdyLkWS6xOZhhFT4y1qoVYUxfQtTCrj8JJskqKGWOOsQCb
         ir0yOO52cVG7KmZYBJg7imzZvIfm5584GMwf/LfA+5+uTGfOyBqZT1sb+TL93H77ybB/
         Dy9avMc0lbZRj7k4CFNPn3h3fQNtkXcP00SnarrJ3lbwJ9KQTftgSys7Xzkb9VDL+I2+
         VwXWdyeZSDkB6fhAkv0jXyFasPGkME8yuYrdbbYhjexLhLg9ZWFcctgTYYEd4dDPrY/j
         1Rt/o8bBVkENn2tQEqu6ouDrhyRkaOrI0dTiLLSOkCTFvPnKmYmlxCZ1CXkhDMcrFhEu
         55ug==
X-Gm-Message-State: AOJu0Yx7FJ6cnLNrOu/0RF74dt/Y64OKml2HjRv28ri5XPgjdyPffLCj
	QhtpaL9BHvyGeq9+H8Z+na2seSRALzIjUKhGBQc=
X-Google-Smtp-Source: AGHT+IH3EKpbgT8SBSa14ChDUK9xukALT9utSbyiz5vXKhue1jyYHBwAM0OTrcyi8Mkck8TB3Cds/Q==
X-Received: by 2002:a17:907:2be1:b0:9a2:eb6e:2cf3 with SMTP id gv33-20020a1709072be100b009a2eb6e2cf3mr866818ejc.0.1693959669246;
        Tue, 05 Sep 2023 17:21:09 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f25-20020a170906495900b0099d9dee8108sm8305759ejt.149.2023.09.05.17.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:21:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Kalle Valo <kvalo@qca.qualcomm.com>
Subject: [PATCH] ath10k/WCN3990: move wlanmdsp to qcom/sdm845
Date: Wed,  6 Sep 2023 03:21:07 +0300
Message-Id: <20230906002107.1311378-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware file ath10k/WCN3990/hw1.0/wlanmdsp.mbn is platform-specific
(rather than being specific to the WiFi chip itself) and can be used
only on the Qualcomm SDM845 platform and close relatives. Other
platforms (e.g. Qualcomm QCM2290, QRB4210) are going to provie their own
copies of the wlanmdsp.mbn firmware.

As discussed with Kalle, move this file to the platform-specific folder,
providing the backwards-compatibility symlink.

Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE                                              |   6 +++---
 .../hw1.0 => qcom/sdm845}/notice.txt_wlanmdsp       |   0
 {ath10k/WCN3990/hw1.0 => qcom/sdm845}/wlanmdsp.mbn  | Bin
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename {ath10k/WCN3990/hw1.0 => qcom/sdm845}/notice.txt_wlanmdsp (100%)
 rename {ath10k/WCN3990/hw1.0 => qcom/sdm845}/wlanmdsp.mbn (100%)

diff --git a/WHENCE b/WHENCE
index 390a5689408e..7c3c34d51f53 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3395,10 +3395,10 @@ Version: WLAN.TF.2.1-00021-QCARMSWP-1
 File: ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
 File: ath10k/WCN3990/hw1.0/board-2.bin
 File: ath10k/WCN3990/hw1.0/firmware-5.bin
-File: ath10k/WCN3990/hw1.0/wlanmdsp.mbn
-Link: qcom/sdm845/wlanmdsp.mbn -> ../../ath10k/WCN3990/hw1.0/wlanmdsp.mbn
+File: qcom/sdm845/wlanmdsp.mbn
+Link: ath10k/WCN3990/hw1.0/wlanmdsp.mbn -> ../../../qcom/sdm845/wlanmdsp.mbn
 Version: WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
-File: ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
+File: qcom/sdm845/notice.txt_wlanmdsp
 
 Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details
 
diff --git a/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp b/qcom/sdm845/notice.txt_wlanmdsp
similarity index 100%
rename from ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
rename to qcom/sdm845/notice.txt_wlanmdsp
diff --git a/ath10k/WCN3990/hw1.0/wlanmdsp.mbn b/qcom/sdm845/wlanmdsp.mbn
similarity index 100%
rename from ath10k/WCN3990/hw1.0/wlanmdsp.mbn
rename to qcom/sdm845/wlanmdsp.mbn
-- 
2.40.1

