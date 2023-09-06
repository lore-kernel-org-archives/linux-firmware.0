Return-Path: <SRS0=6E6G=EW=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23E1CCF9ED
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 00:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76755C433C8; Wed,  6 Sep 2023 00:45:05 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A38A1C433CA
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 00:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A38A1C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99bcf2de59cso462614666b.0
        for <linux-firmware@kernel.org>; Tue, 05 Sep 2023 17:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693961101; x=1694565901; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PCA9M0ErtIMnGr2+NMuuG37Qgx1f0Dgh7duQchM62bY=;
        b=Qn2xnXrrBoTwOmEdwV9BaP8YmSiNYF4gHgESzKemh0wax8zsCtT4KCbXUayPlNkJDc
         6KcpTds5pO1why3s+yctYXbbqYRcASjp+H8QVy5PemDTJwdRA136LHeqDDfUDL5g+rTM
         hcpejG9FqgQlWcrans7NzKZ7IbR3gcqQ2zEoNtbFmS+2FgTUXxBOLERfpERiCoKyTNR/
         GnQUfptFxQdGY2aeKLQmyqZONafSN0x7/zfzKddZtGhA9f8WSilT3tjaWo7FFOGgYVaJ
         Nce5P8ca5iQct7wSTfy1TlT/NLqGJmtvW0BF5jaYKpj1SypwEdDxIRdJkdtQkzUOclVA
         7gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693961101; x=1694565901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCA9M0ErtIMnGr2+NMuuG37Qgx1f0Dgh7duQchM62bY=;
        b=U4iCZNrrPTLNCVAkezrtqwqFfXRt0gtU4/zvP60WqaiBbj9Uskhn+TKhjsHp6mct/+
         M/OjVxHqZqqBlu6liYD2KnqLHiGvFAVfEOiPht11IYNk4iHTTCc3Q5Am7XDZLit+7N74
         Q7vPish+xeXozqEj0H3XlqoxUchVuJyQqlwkFY/SuQrgIASQC7eEKVyCPX+Qg6E8/Z+7
         O/b5F/UIE1OghLxU5j1lztsQ7ugrELgIXOV3KSkmz+Ms371eV1694/O9qyPY8Ws/Jw9H
         xZOLepVBLdTbec8PSSWMJKeYGpl/xIsJLHNGBe7nrNQifTlMaMkK12xJbm50GrZ3kvgs
         fpXg==
X-Gm-Message-State: AOJu0Yxtuzumm+ySZXILZZExK7D/qLQW9EREHQgmVwJUfLZSPA6kt1+C
	DOXaAz/18uJnCCVmLZvUv/wI3wWwaeV/ttTEJ4Q=
X-Google-Smtp-Source: AGHT+IH1vE4SBXZ/Sa6e+78HiEzsV22rk2zukfewmzq/KUqgxMnGrmsQ+PwJPfw0HNb2UzZSFkqstQ==
X-Received: by 2002:a17:906:3caa:b0:9a2:2635:daa9 with SMTP id b10-20020a1709063caa00b009a22635daa9mr1081028ejh.6.1693961101257;
        Tue, 05 Sep 2023 17:45:01 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906c30700b0099cbfee34e3sm8224585ejz.196.2023.09.05.17.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 17:45:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PULL] qcom: firmware updates for the sm8250 / RB5 platform
Date: Wed,  6 Sep 2023 03:44:59 +0300
Message-Id: <20230906004459.1311755-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please pull in firmware updates for the Qualcomm Robotics RB5 platform. This
includes SM8250 DSP firmware updates, video encoder/decoder (venus.mbn)
firmware update. Also as a part of this update is included the board-specific
firmware for the Sensors DSP.

The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8ddb5:

  Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware (2023-08-04 06:33:54 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb5-update

for you to fetch changes up to 60b397dfd9d77da4b62e08572bdc7174a29f53a8:

  qcom: sm8250: add RB5 sensors DSP firmware (2023-08-16 16:03:46 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qcom: sm8250: update DSP firmware
      qcom: Update vpu-1.0 firmware
      qcom: sm8250: add RB5 sensors DSP firmware

 qcom/sm8250/Thundercomm/RB5/slpi.mbn   | Bin 0 -> 5646296 bytes
 qcom/sm8250/Thundercomm/RB5/slpir.jsn  |  21 +++++++++++++++++++++
 qcom/sm8250/Thundercomm/RB5/slpius.jsn |  21 +++++++++++++++++++++
 qcom/sm8250/adsp.mbn                   | Bin 15515796 -> 15515796 bytes
 qcom/sm8250/cdsp.mbn                   | Bin 5822228 -> 5826324 bytes
 qcom/vpu-1.0/venus.mbn                 | Bin 1973540 -> 1974884 bytes
 6 files changed, 42 insertions(+)
 create mode 100644 qcom/sm8250/Thundercomm/RB5/slpi.mbn
 create mode 100644 qcom/sm8250/Thundercomm/RB5/slpir.jsn
 create mode 100644 qcom/sm8250/Thundercomm/RB5/slpius.jsn
