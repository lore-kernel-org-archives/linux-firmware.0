Return-Path: <SRS0=yBgt=VE=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0617AC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Apr 2022 20:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CBBAFC385A4; Tue, 26 Apr 2022 20:45:32 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6358C385A0
	for <linux-firmware@kernel.org>; Tue, 26 Apr 2022 20:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6358C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id x33so34026960lfu.1
        for <linux-firmware@kernel.org>; Tue, 26 Apr 2022 13:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yS7t+owB0f8T4gOXe6aHgeEs/gx57xIkeKjotSTBji0=;
        b=nf00EnqdTVuaInkiRTATH+wUsR/zbQ065eWO/SHOQRq+jUqnz2T+b+PAXIDC7n1cvU
         1bP88lnPHF44nCEXVir8RcOzwvPbEwH+k5uwk2A6ol4eUptrZSJwfjBij+14Rvmgv+sz
         872oZ5AoOlYKcqNjCog/1ZRF7HWG6b5aombucXMM8gV/ryBWgM55/6Yq9R/Hzf75ktMD
         1yXZwZoobeZNkVpaRaKq5jyiKyMJgK2eOwTaVyTBI7F/cc2pHrejAtbQBMqp7RKpZx9G
         0I+bGaR+WxaE+2v9Fkd2dJFvEl9fcObsdRpQx/l7JKkJL6LLkzReeeYp1rdMbvJKxM0I
         r5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yS7t+owB0f8T4gOXe6aHgeEs/gx57xIkeKjotSTBji0=;
        b=2d2Xvo9kdk6/Gcbue0XCjh4TzcktEoJgpiNppdzcN89G5rMwcacE+cenOUv1NdUPz/
         x+Rf8rEfAXSHPHXYMg7WXGw98kbEQyDH6rnt437fgDoa6nw1aX1sTJHuI6+DS45IkwJc
         FpnO3MhDXy/ELtUc5nBbUfva4mEQNcBTnUKr8me8FQChL3KgcfGUOSdC+HIjVn128rEa
         kYmDLt3P2o86iuNpAJRWQa0WhIzMhM87fPGjtu0/5iykRCkVgoyCfz1tZ//skIZzEg4B
         hCf/bOW8TXvnRk2Ab/nbDGJB8IGt69DwhFlxBqZ+wDO5UQoPw++FtOLc7Z63STHKGqAt
         6tMQ==
X-Gm-Message-State: AOAM531VJ/69pCd565GRxkFcgEOBdALi4GOIEEv3ROLKhflUH/eKlGKF
	mcvjcIVL2KgA9IIvsnVoM4wSVjI1TUCaDQ==
X-Google-Smtp-Source: ABdhPJxf3pN/h29eAqBJozLJJk5QBm26rZN1LDkpibb5aehmkalHRNBXTcTjnEEWQSL3XAO3mcVSAw==
X-Received: by 2002:a19:f24e:0:b0:471:c076:bfb9 with SMTP id d14-20020a19f24e000000b00471c076bfb9mr15799324lfk.442.1651005929750;
        Tue, 26 Apr 2022 13:45:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f8-20020a19dc48000000b004720649aa22sm888322lfj.182.2022.04.26.13.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:45:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PULL] qcom: add firmware for several Adreno generation
Date: Tue, 26 Apr 2022 23:45:28 +0300
Message-Id: <20220426204528.3005774-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi linux-firmware maintainers,

Please pull the firmware for several generation of Adreno GPU (A220, A330,
A405/A420/A430).

The firmware files come from Dragonboard 820c BSP available at [1] or directly
from Qualcomm at [2] (registration is required).

[1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
[2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip

The following changes since commit ac21ab5d1de0de34201c90d32eee436f873d1e5b:

  Mellanox: Add lc_ini_bundle for xx.2010.1006 (2022-04-25 07:36:16 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware adreno-firmware

for you to fetch changes up to dfa3c4c30996376dbc3adb530c0505b2efad583b:

  qcom: add firmware files for Adreno a420 & related generations (2022-04-26 23:36:27 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qcom: add firmware files for Adreno a220
      qcom: add firmware files for Adreno a330
      qcom: add firmware files for Adreno a420 & related generations

 WHENCE               |   6 ++++++
 qcom/a330_pfp.fw     | Bin 0 -> 2212 bytes
 qcom/a330_pm4.fw     | Bin 0 -> 9220 bytes
 qcom/a420_pfp.fw     | Bin 0 -> 4292 bytes
 qcom/a420_pm4.fw     | Bin 0 -> 9556 bytes
 qcom/leia_pfp_470.fw | Bin 0 -> 1156 bytes
 qcom/leia_pm4_470.fw | Bin 0 -> 9220 bytes
 7 files changed, 6 insertions(+)
 create mode 100644 qcom/a330_pfp.fw
 create mode 100644 qcom/a330_pm4.fw
 create mode 100644 qcom/a420_pfp.fw
 create mode 100644 qcom/a420_pm4.fw
 create mode 100644 qcom/leia_pfp_470.fw
 create mode 100644 qcom/leia_pm4_470.fw
