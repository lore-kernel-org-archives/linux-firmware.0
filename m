Return-Path: <SRS0=FeZJ=P3=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67583C5472D
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Aug 2024 06:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26D18C4AF0C; Wed, 28 Aug 2024 06:08:37 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B691C32786
	for <linux-firmware@kernel.org>; Wed, 28 Aug 2024 06:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B691C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-533488ffaf7so8610889e87.0
        for <linux-firmware@kernel.org>; Tue, 27 Aug 2024 23:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724825314; x=1725430114; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nCqnl2sMu7twSUyqIdp8octUBxKB48K5e/4cn44TIBI=;
        b=b0U1wwzv4QDd0yzYVAxUMfzuGuOVxQaHwD9hrmucYdCfdoiU34fh2UvqAnoKRl0Ilb
         DXss18QNQv8OcGwrRE5H7ZW4HkfhSKpRm1ikqbK8xenxA/PdyD6umwJbjfIDcBYX2jL8
         rvQoPX5E6fOlWWqV6izV1okv0rxE1OAXaFDq54ayh51bc5hsEmMUYR21z4obODOvx5FA
         g30QtDTdiJ22VFMy6hbkyl2lnqC+6Yf4ov42nmNIbdXXwER4k4Gks7XVi56O+Op/PYv1
         4FNIa5kuNJb31cei20zkvwyeqxU8k8diqLTCEsG4x26QaKK7cgr4cs0npGug2u/UQSyT
         zJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724825314; x=1725430114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCqnl2sMu7twSUyqIdp8octUBxKB48K5e/4cn44TIBI=;
        b=BoO1ku2EHX4IGiRcWXM8k6G/kcE/XHDzXn8ypLvqdKf46p12wJD85XBhvy1JJrhGBC
         xPRkMIsQ+3ijemHO9NNVYyfZvTYb3VkviM9aXb2tvWmDsRbgsoYNLv96TQY0iTiBTWwG
         InGQgXk8NbCMPCqsPrTReextTj9SLczBQsuLdJB9L46J4DLu13Y+Oi9rgvlIKAQm7Qtq
         9McXARHtu15sI1j7DYhQd/+RbF5ByumXTfDx9TIeLqL3VYxHOmwskG0qv/IspyoVAW86
         vwcmYWKtUUIJl+iiIR24Q+nJLsca38JJBQfnNY1Rupf43U+RzkVmrFo9jPQDEKfXqloP
         tMhQ==
X-Gm-Message-State: AOJu0YzO0I8KLpcA8/1o2c2FqZTnK1OaSXtOYTLFM4bUjJJF8mXNwi1W
	U0tZwbam9WA/uUgJ1cmBmPlgncg2gHQXcKHFtH4+TESdQRhYbJFpVu5tDy1uyeKAIr+OcRWSsP2
	V
X-Google-Smtp-Source: AGHT+IELMEkK/2j0M7yRYCtkj2qg7rctGtvZ0KHvAcf+/xERiQQTNZyWbHkZKtnuFxaWls7vvPHSfg==
X-Received: by 2002:a05:6512:b0e:b0:530:c212:4a5a with SMTP id 2adb3069b0e04-5346c6007c2mr763000e87.22.1724825313028;
        Tue, 27 Aug 2024 23:08:33 -0700 (PDT)
Received: from rohan.lan (dzdbxzyyyyyyyyyyyyxft-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea2a64fsm2042863e87.57.2024.08.27.23.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:08:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH] qcom: vpu: restore compatibility with kernels before 6.6
Date: Wed, 28 Aug 2024 09:08:31 +0300
Message-ID: <20240828060831.34519-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux kernels before 6.6 used qcom/vpu-1.0/venus.mdt as a firmware
filename for Qualcomm SM8250 devices. Commit 36db650dae03 ("qcom: update
path for video firmware for vpu-1/2/3.0") moved the VPU firmware, added
the venus.mbn compatibility symlink, but at the same time it dropped
the venus.mdt symlink. Bring the historical name back to restore
compatibility with kernels older than 6.6.

Fixes: 36db650dae03 ("qcom: update path for video firmware for vpu-1/2/3.0")
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 06c3c6fff673..4d9cd340a9dd 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5974,6 +5974,7 @@ Version: VIDEO.VE.6.0-00049-PROD-1
 
 File: qcom/vpu/vpu20_p4.mbn
 Link: qcom/vpu-1.0/venus.mbn -> ../vpu/vpu20_p4.mbn
+Link: qcom/vpu-1.0/venus.mdt -> ../vpu/vpu20_p4.mbn
 
 Version: VIDEO.VPU.1.0-00087-PROD-1
 
-- 
2.45.2

