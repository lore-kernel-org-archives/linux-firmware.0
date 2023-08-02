Return-Path: <SRS0=yr9P=DT=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45556C00528
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Aug 2023 10:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05AC1C433C9; Wed,  2 Aug 2023 10:41:42 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18DF1C433C8
	for <linux-firmware@kernel.org>; Wed,  2 Aug 2023 10:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18DF1C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4fe45da0a89so967205e87.1
        for <linux-firmware@kernel.org>; Wed, 02 Aug 2023 03:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690972898; x=1691577698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsoFtm17lHc1E4c7Z/2gnQacNpom0Bf4d4YqKE+AWL4=;
        b=ZcB1ZW+tHuIdaM/3k/Evuw7JUeiEfKfg7EqMh/tAzzSggl7OnnUxPSFouIRj0m4zuH
         zwPajMZ1vDqA+nYf2TUEPCPxF/oprueeVZl6Yijh82mBfV/oVBPy6ZQ5jdu3sLq2kTjk
         6kPbaVJA1r8E4zcuqeKkYohQsOm0uGrGrQZ10RffgFXSBH0AeqELSTggDvLNx0lhmJu3
         DO+wyx2sHallgIL3C6975I8PC4kyyLUGVIU/vTsckIH0kd107yGTDrIrcvy4+/kOVIGs
         J0PxvdYbBXODuuHDTvZw8Pi/1Qc54fzcm/6jXu25NOKOtKD1Nul43R1GNPJRJEUfERzr
         9t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690972898; x=1691577698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsoFtm17lHc1E4c7Z/2gnQacNpom0Bf4d4YqKE+AWL4=;
        b=HEnAM4BmPMYTKzHFGys2RH7zP2qW+42PJzqrg9f4ElxYkD7wzGxJFPothMgumo3pvw
         lhfuP2KP48CRm8kQR2YQnzCKucYmhZSkFdJXRzp6SQ8k2Y86APAAklggUT54MGzzgRni
         pbjbEypEar1bXMkNqS4Jtzy/yvF00p9s6hAaP4nbGTH3dSl47TEaDPt7WCqfVqiSiQqy
         meUNrFIFnhJ+vk0QsmXs78F7TYuxpN6r27iSaNbouZusU9va304gvGfnMB7C+u4OH1cM
         KJzdwST0TtJLyKDEqeSg9x5D4Qk0sfADhMbAg6w8GV/eSDU5kBT8z9feMfcNzYG+SpGc
         6WIw==
X-Gm-Message-State: ABy/qLaboBNbVonW2m3EgYT3bjPaskc6s4CM0m/vAR7Qd82GPSZso2C5
	bkio5NqC+1y+ShGy8ADMVjKd8DRXMCi/sKwZfOQ=
X-Google-Smtp-Source: APBJJlENxlpwgdPOa5MQ1hwUOEpIRZ2wex8fGo3NR4RJj1NALmAF7imhxUVmgGGKlUPb20+GFMU3DA==
X-Received: by 2002:a05:6512:2812:b0:4fe:28cd:b3f with SMTP id cf18-20020a056512281200b004fe28cd0b3fmr2192251lfb.5.1690972898535;
        Wed, 02 Aug 2023 03:41:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id o15-20020ac2494f000000b004fe22967123sm2299974lfi.153.2023.08.02.03.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:41:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org
Subject: [PULL] qcom: add RB3/db845c sensors DSP firmware
Date: Wed,  2 Aug 2023 13:41:37 +0300
Message-Id: <20230802104137.1282273-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the firmware for the sensors DSP used on the Dragonboard 845c aka Qualcomm
Robotics RB3 platform.

The following changes since commit d3f66064cf43bd7338a79174bd0ff60c4ecbdf6d:

  Partially revert "amdgpu: DMCUB updates for DCN 3.1.4 and 3.1.5" (2023-07-07 15:24:32 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb3-update

for you to fetch changes up to 742bf577e1406f61716f477fa47e868765596dce:

  qcom: sdm845: add RB3 sensors DSP firmware (2023-08-02 03:42:15 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: sdm845: add RB3 sensors DSP firmware

 WHENCE                                    |   3 +++
 qcom/sdm845/Thundercomm/db845c/slpi.mbn   | Bin 0 -> 7028860 bytes
 qcom/sdm845/Thundercomm/db845c/slpir.jsn  |  21 +++++++++++++++++++++
 qcom/sdm845/Thundercomm/db845c/slpius.jsn |  21 +++++++++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 qcom/sdm845/Thundercomm/db845c/slpi.mbn
 create mode 100644 qcom/sdm845/Thundercomm/db845c/slpir.jsn
 create mode 100644 qcom/sdm845/Thundercomm/db845c/slpius.jsn
