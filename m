Return-Path: <SRS0=wlcU=ZL=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC35CC6FA89
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Sep 2022 14:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A19B3C43148; Thu,  8 Sep 2022 14:37:47 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19161C433D6
	for <linux-firmware@kernel.org>; Thu,  8 Sep 2022 14:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19161C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id i26so12327936lfp.11
        for <linux-firmware@kernel.org>; Thu, 08 Sep 2022 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=RNmjRCm7zp6gfhnDbGtXXp3Ow7DG5rNTPxBsCmw0T0k=;
        b=UiNwU5FC9oq1iV40o/AK7iYo3u/N4KI4HkX8melgE3J3o1a6REoEJ/GHAvPdlsCj4o
         T1Tv2liuEiNf3qDJBsbLfzTyetYg+D5xeyXxpZPvejYBIwWh0/9JEoNfbDAgp97sxZ8J
         Km70V+3kUKpJO74gMCR0Ygp1/wnlGsz5eQ4KSu2d1RHO8W4QG0na8PsWtWSWLx1DUytY
         mIzPYE7/5pB3LvzSVafExZn4oSKaRfpmYvfScmMy0fBG60WX4PMzavQsk9aBVx5DDxeZ
         7S/HMhwwnowv2/b0JAXVTsDEk2b7rLvrzHCuCguOf41UbDZNAmFJHLDU1Jt491pRfk8F
         7mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=RNmjRCm7zp6gfhnDbGtXXp3Ow7DG5rNTPxBsCmw0T0k=;
        b=Y9R62CiM3IawhehvJMQzaINKXFhVBOP9cksFcGdVQ5lO9ufFGdRK7x/KHasO8Oc/PP
         1qEqiMUDj57BNxW/POpkAgiPRjvwVhBTHp2EXzaGWwfZBVIr0d4gWvxl4cSs2eEi32HZ
         I2GzB9/qeHTE9kgoGPuy80uvH2wWe+nlA+QMRpTrwA5b2YHHO7sUGxEmPnKmVTrR73hS
         pbhW1zXtelujgkrMVW44RQ2U2jrWUOZL3G4uKzlflDyAO8vC6M18V1kqm2mt49f5OBh3
         EgGOGRGP4/EXT7HxLfrL2DwXuoBzB/j8jXnqFpO0PllgKt/SAqPIkgJfKsfax+5uo5m6
         C2rA==
X-Gm-Message-State: ACgBeo0v4NtAvJ6+q3BBwtxZkqgxDRK832uXfE3Dhlle81aK0azomIaR
	nf89vXkwK8o0+xAKYFe5vXShgi+jWEAKoQ==
X-Google-Smtp-Source: AA6agR7mpj3it6eDsjVMl1IxYuI85I9BkkFrnKGzlEP+GwDz5QHkJLw6Dh7DlG1poRQE9fX8+LscnA==
X-Received: by 2002:a05:6512:2608:b0:494:7168:888a with SMTP id bt8-20020a056512260800b004947168888amr2742434lfb.440.1662647863858;
        Thu, 08 Sep 2022 07:37:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p7-20020a05651211e700b0049487818dd9sm3053373lfs.60.2022.09.08.07.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 07:37:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH] qcom: rename Lenovo ThinkPad X13s firmware paths
Date: Thu,  8 Sep 2022 17:37:42 +0300
Message-Id: <20220908143742.3362357-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After some discussion with Bjorn, the Qualcomm platform maintainer, it
was agreed to follow the established practice and to inject the SoC name
into the firmware paths.

It is highly unlikely that we are going to run Linux off the existing
ACPI data in these platforms anytime soon. And even if we do so, we'd
have to figure out the file names anyway, as they do not follow the
existing standard names.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE                                         |  17 +++++++++--------
 qcom/{ => sc8280xp}/LENOVO/21BX/adspr.jsn      |   0
 qcom/{ => sc8280xp}/LENOVO/21BX/adspua.jsn     |   0
 qcom/{ => sc8280xp}/LENOVO/21BX/battmgr.jsn    |   0
 qcom/{ => sc8280xp}/LENOVO/21BX/cdspr.jsn      |   0
 qcom/{ => sc8280xp}/LENOVO/21BX/qcadsp8280.mbn | Bin
 qcom/{ => sc8280xp}/LENOVO/21BX/qccdsp8280.mbn | Bin
 .../LENOVO/21BX/qcdxkmsuc8280.mbn              | Bin
 qcom/{ => sc8280xp}/LENOVO/21BX/qcslpi8280.mbn | Bin
 9 files changed, 9 insertions(+), 8 deletions(-)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/adspr.jsn (100%)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/adspua.jsn (100%)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/battmgr.jsn (100%)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/cdspr.jsn (100%)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/qcadsp8280.mbn (100%)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/qccdsp8280.mbn (100%)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/qcdxkmsuc8280.mbn (100%)
 rename qcom/{ => sc8280xp}/LENOVO/21BX/qcslpi8280.mbn (100%)

diff --git a/WHENCE b/WHENCE
index f5aa93cd3726..f3f9a7a93cde 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5595,7 +5595,7 @@ File: qcom/a660_gmu.bin
 File: qcom/a660_sqe.fw
 File: qcom/leia_pfp_470.fw
 File: qcom/leia_pm4_470.fw
-File: qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
+File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
@@ -5622,13 +5622,14 @@ File: qcom/sm8250/adspr.jsn
 File: qcom/sm8250/adspua.jsn
 File: qcom/sm8250/cdsp.mbn
 File: qcom/sm8250/cdspr.jsn
-File: qcom/LENOVO/21BX/adspr.jsn
-File: qcom/LENOVO/21BX/adspua.jsn
-File: qcom/LENOVO/21BX/battmgr.jsn
-File: qcom/LENOVO/21BX/cdspr.jsn
-File: qcom/LENOVO/21BX/qcadsp8280.mbn
-File: qcom/LENOVO/21BX/qccdsp8280.mbn
-File: qcom/LENOVO/21BX/qcslpi8280.mbn
+File: qcom/sc8280xp/LENOVO/21BX/adspr.jsn
+File: qcom/sc8280xp/LENOVO/21BX/adspua.jsn
+File: qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
+File: qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
+File: qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
+File: qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
+File: qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
+Link: qcom/LENOVO/21BX -> ../sc8280xp/LENOVO/21BX
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
diff --git a/qcom/LENOVO/21BX/adspr.jsn b/qcom/sc8280xp/LENOVO/21BX/adspr.jsn
similarity index 100%
rename from qcom/LENOVO/21BX/adspr.jsn
rename to qcom/sc8280xp/LENOVO/21BX/adspr.jsn
diff --git a/qcom/LENOVO/21BX/adspua.jsn b/qcom/sc8280xp/LENOVO/21BX/adspua.jsn
similarity index 100%
rename from qcom/LENOVO/21BX/adspua.jsn
rename to qcom/sc8280xp/LENOVO/21BX/adspua.jsn
diff --git a/qcom/LENOVO/21BX/battmgr.jsn b/qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
similarity index 100%
rename from qcom/LENOVO/21BX/battmgr.jsn
rename to qcom/sc8280xp/LENOVO/21BX/battmgr.jsn
diff --git a/qcom/LENOVO/21BX/cdspr.jsn b/qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
similarity index 100%
rename from qcom/LENOVO/21BX/cdspr.jsn
rename to qcom/sc8280xp/LENOVO/21BX/cdspr.jsn
diff --git a/qcom/LENOVO/21BX/qcadsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
similarity index 100%
rename from qcom/LENOVO/21BX/qcadsp8280.mbn
rename to qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
diff --git a/qcom/LENOVO/21BX/qccdsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
similarity index 100%
rename from qcom/LENOVO/21BX/qccdsp8280.mbn
rename to qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
diff --git a/qcom/LENOVO/21BX/qcdxkmsuc8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
similarity index 100%
rename from qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
rename to qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
diff --git a/qcom/LENOVO/21BX/qcslpi8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
similarity index 100%
rename from qcom/LENOVO/21BX/qcslpi8280.mbn
rename to qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
-- 
2.35.1

