Return-Path: <SRS0=/xlt=OP=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB0CC3DA4B
	for <linux-firmware@archiver.kernel.org>; Mon, 15 Jul 2024 12:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37AFEC4AF0E; Mon, 15 Jul 2024 12:25:04 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A315C4AF0B
	for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 12:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A315C4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eecd2c6432so58419851fa.3
        for <linux-firmware@kernel.org>; Mon, 15 Jul 2024 05:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721046301; x=1721651101; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCPqymuE1696F1HXcUi+tB+c7mFe5Hm0KK5Kdb2Bj6o=;
        b=bURNNdyefiqFna1n0bPYw3av6djkmlLH9YQlAFOjwo4v7DFV8U2lXagjEELMCafr/o
         zLYk+DxQjJe3cpu3iWtCpIpDChp+jmK0e/wuwaIuzZ1WGUb7uN6fVl3IaK45zktIHJfC
         GN8ksZpqKjxVW+428YP6GFIrRqzKIpTIyu9hGuCiM1l9w/ZzI+kVfZXC0QURNEMnvcc3
         nA4Qp4NW8j258sMLNhN7BPERqLSI1uNSmN1F8VED6rCK3NN3iXvFRjZVQ8ns3x0sQ5LO
         xIiuyKl0/jxQvgBgL3dugiwMCwfiloq4UZTkBc4kqSwNfjbNF8vLWeOlcSw8LrljxKqD
         NUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721046301; x=1721651101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCPqymuE1696F1HXcUi+tB+c7mFe5Hm0KK5Kdb2Bj6o=;
        b=WOcRtaG+eb5WNovLDRL72sD+rbqtx81RMcvlfj6xNKU5d437IW4HTfYzeed64Ql0yP
         TerDvUAkwycx682BAqXX31pNySz1gkGApGdrZvjBJJMzL0MBNBj4WCjPN1qGEv8UZGEz
         LBUgQVcAHvbrapvrBQyNQwFJZgBgKNItbVh8g6UdIAI/p2SY0WHHjtvTE4gVhnkISl1I
         QxTrcK39Mwtgn+3NxlWRon8ROKOeTbdjSvrXKHVTakPeZP3nnBiEqg/GIBF2S4l0gBuq
         m8sVRnSjMtCREvKFibSn/ENcu7WQ+MbhCcGNz/CRiywTZ0qz1CrLbcdXB2PIJ8lDmwtr
         KY3Q==
X-Gm-Message-State: AOJu0Yxl6S90+kOuGIGmmuNf/BTf5hSgvmr/kU3o4wK1q36pXGFNkOMn
	tIGhs4DbNM4DvAuabx9w6b6KjnrBtC+9IBqKn9AVqCMcLkPzEEwt+N2SBGqZRCtbBF3lRSu8MjA
	9QNXG6g==
X-Google-Smtp-Source: AGHT+IFuaB5hWdlEUlx+L2Fk0YWQZUNUsQXsLuGZDH7wxw0vxm8nrCvNGmOzNWXYTI7eL6PnKlFkyg==
X-Received: by 2002:a2e:8ed3:0:b0:2ee:4d37:91df with SMTP id 38308e7fff4ca-2eeb30fef50mr147387991fa.27.1721046301088;
        Mon, 15 Jul 2024 05:25:01 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee1939b56sm8287711fa.115.2024.07.15.05.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:25:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] qcom: move signed x1e80100 signed firmware to the SoC subdir
Date: Mon, 15 Jul 2024 15:25:00 +0300
Message-ID: <20240715122500.3115456-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ZAP shader is signed and is specific for the particular SoC. As such
it should be put the corresponding subdir rather than the topdir.

Move it to the subdir (like all other zap.mbn files).

Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE                               |   2 +-
 qcom/{ => x1e80100}/gen70500_zap.mbn | Bin
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename qcom/{ => x1e80100}/gen70500_zap.mbn (100%)

diff --git a/WHENCE b/WHENCE
index e4e06b966e89..b6451372a6ef 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5992,7 +5992,7 @@ File: qcom/leia_pm4_470.fw
 File: qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 File: qcom/gen70500_gmu.bin
 File: qcom/gen70500_sqe.fw
-File: qcom/gen70500_zap.mbn
+File: qcom/x1e80100/gen70500_zap.mbn
 
 Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
 
diff --git a/qcom/gen70500_zap.mbn b/qcom/x1e80100/gen70500_zap.mbn
similarity index 100%
rename from qcom/gen70500_zap.mbn
rename to qcom/x1e80100/gen70500_zap.mbn
-- 
2.43.0

