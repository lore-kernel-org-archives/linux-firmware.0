Return-Path: <SRS0=ERgN=BU=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DAAC77B7A
	for <linux-firmware@archiver.kernel.org>; Wed, 31 May 2023 10:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DDC5C433EF; Wed, 31 May 2023 10:21:52 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40AF4C4339B
	for <linux-firmware@kernel.org>; Wed, 31 May 2023 10:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40AF4C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2af316b4515so58029961fa.1
        for <linux-firmware@kernel.org>; Wed, 31 May 2023 03:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685528509; x=1688120509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QtbaJIHq75M0HgWzYBYseF2Snm0R8Gn+tXgK+DSAkA=;
        b=iS3aYc29FpYhoJv1+htKhKuR+OEiJ5M27HqkuOSXBATo45rxgd1dBYuAb3nrN4DFsY
         TlBNYQt5NJBcGSwCrrBZcbYIR1ODjq2tpW+WIf/Cv1NwQPJSh47dV7iuDAWhdfjQT5V6
         /P+RWVayWCu3bYE3+A0etwefqD3w3/lEax0EhY1gd3KG4VkdZmgTYvRtUePkeYYfufZZ
         o3QVcM7ecyI/uO2iyWQQuZecVXEgD5bDmRTXZonsy55ldu6MaflxU33P1bj4L0PiJTY+
         ozojLFNVz0fzeo1aCcvsaAGbFDK4SAZHJOm/AjttI6D1blMc7V843QjfVPav6nCgBfUv
         +tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685528509; x=1688120509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QtbaJIHq75M0HgWzYBYseF2Snm0R8Gn+tXgK+DSAkA=;
        b=EabWHKeTDVepIzjv5/XoYkkT3kQqCVwyM/Nut99EmipcDxIFNlmJMny0TwInPqKo8C
         6P53LLK8dNFULxfutj6bH7xCkeDMeWgKF7YQEdJA33MW3K0LEnciU0iC9RCYsRBblOZh
         8V4PLYa/0zhF0XXC8cXypXJZic4LyO/GIMTTgkwV3cpdNvo8P/MfJPA7ePmJYA/8M29j
         cJDuRpAjVyzdg9UQwww27wMljEP+s7adXqQG86apW1VeHPofQNPiDK/lxavndk1LP4r0
         DCwdJ2yb7ucsCh1KqqnDQiKbucLrM/pROfDY6ZxIpq0V2KKBBx9YyGCEMm8eZStb6s1O
         TKmA==
X-Gm-Message-State: AC+VfDwWuB64vEJG3bzPiJlToQt2GHdIb0BXoSCVeYmjEYE/rzdqj9SC
	hB5WBpX+VUaOhh7CNUZkLsfoLVZ16RHFUQJDImE=
X-Google-Smtp-Source: ACHHUZ4dsC2gihLbiJrYPsoPwP2tnrgKYDiLFaoHLYVQrugLZId2o+pDJcbgKO9ghsiU3MBtAc8B9g==
X-Received: by 2002:a2e:7a07:0:b0:2a6:16b5:c658 with SMTP id v7-20020a2e7a07000000b002a616b5c658mr2593063ljc.31.1685528509037;
        Wed, 31 May 2023 03:21:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y28-20020a05651c021c00b002adf8d948dasm3229131ljn.35.2023.05.31.03.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 03:21:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PULL] qcom: apq8016: add Dragonboard 410c WiFi and modem firmware
Date: Wed, 31 May 2023 13:21:47 +0300
Message-Id: <20230531102147.380502-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add firmware for the Qualcomm Dragonboard 410c, an SBC using Qualcomm APQ8016
platform.

The following changes since commit 1f9667ebd8e6aac23bab8e95b0d555181dd432ba:

  Merge branch 'for-upstream' of http://git.chelsio.net/pub/git/linux-firmware (2023-05-30 07:46:20 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware db410c

for you to fetch changes up to 9d4c9a52c2377c367978ff7b2ec4963b0704613e:

  qcom: apq8016: add Dragonboard 410c WiFi and modem firmware (2023-05-31 06:30:31 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: apq8016: add Dragonboard 410c WiFi and modem firmware

 WHENCE                                  |   5 +++++
 qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin | Bin 0 -> 31723 bytes
 qcom/apq8016/mba.mbn                    | Bin 0 -> 230272 bytes
 qcom/apq8016/modem.mbn                  | Bin 0 -> 10678876 bytes
 qcom/apq8016/wcnss.mbn                  | Bin 0 -> 4111376 bytes
 5 files changed, 5 insertions(+)
 create mode 100644 qcom/apq8016/WCNSS_qcom_wlan_nv_sbc.bin
 create mode 100644 qcom/apq8016/mba.mbn
 create mode 100644 qcom/apq8016/modem.mbn
 create mode 100644 qcom/apq8016/wcnss.mbn
