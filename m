Return-Path: <SRS0=sU6d=UX=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F393C433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Apr 2022 23:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4214C385A6; Wed, 13 Apr 2022 23:48:49 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBD97C385A3
	for <linux-firmware@kernel.org>; Wed, 13 Apr 2022 23:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBD97C385A3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id bn33so4081508ljb.6
        for <linux-firmware@kernel.org>; Wed, 13 Apr 2022 16:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORBNSb55HLrQXXkE7Gee3v6upYJe8NBlLeoTQT4L488=;
        b=qVr99L287eaB0tbftUfAAeP/Uy4c/WBia3R1tOnTUUEPfTnI0+o3JZuJZKwXKtC79t
         1OMEUeHlZNJWLtfdVT4LWmFdg6nrk64/zPVhH/RsAuLh/7hl1ov0eiWarg9wLqxSkgc8
         TXvKAXHijgPFcqfUf6N5iuQQAs8cfB7SsOYfm9bLMwgjISDEn0WrgQuhOS8+NWaoNfUM
         nOJe951Pyo4ZmOe+gnXXHq1RjFgTkuZpy0ZJljMCtz2pKNBKMh2MlDccpCRCeNcfR+R8
         CQwTTo9DBgtL3nW5+KGFAN9vVCVkFWPahVdFHFJt3LpeotpviOcIfFithdw9OO8Rf+bX
         S6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORBNSb55HLrQXXkE7Gee3v6upYJe8NBlLeoTQT4L488=;
        b=1aQzzEp9ubc4567j1GLsn93D4IhtESg9iKysLHUXLgkE46nTPFYsBf8KHbj6ErHHNE
         /c+3GgiSzPADE3uf7dpnr+Xrfiv7zBVHE9gg3Ic1h45iRqUctXmjqqyU0XV6eaczUNYK
         DdCsUlitRLGoCj9OEG7v1gAWx/tRKvzT2yibh0ml5DEM+hHiYu9ldWIFrgp5NcMjr/C8
         qNAyma4/5+GBQbcBVLJkd10A6FV9nMcncuupS/OxbyEGTsuxR978UO3D2lovTyN+Ugap
         7CwqdjqRkc+9fGa/ViJTfie2uYFrtfnJ4vfB6rs/hD/Jjnjs04P8f1ExpmF3q6qH3IiQ
         2Fnw==
X-Gm-Message-State: AOAM531ZYPOijKis0qikA3UnlzQFNborYxMZgpmCgXxqVeagUSVPFaag
	l7AaGs/25g0ukmwZdANBwVQSXTg9hl3ErQ==
X-Google-Smtp-Source: ABdhPJwBaiLZCv1bv96pZqmIezsxQUGweUw4jgihNGi3bblfXt8xxbHpETMPKm0FIDy9S57g3rf68A==
X-Received: by 2002:a2e:9241:0:b0:24b:63e8:1cd with SMTP id v1-20020a2e9241000000b0024b63e801cdmr68170ljg.390.1649893726644;
        Wed, 13 Apr 2022 16:48:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l20-20020a056512111400b0044aba8206ccsm41901lfg.253.2022.04.13.16.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 16:48:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PULL] qcom: add firmware for APQ8096 SoC
Date: Thu, 14 Apr 2022 02:48:45 +0300
Message-Id: <20220413234845.276726-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi linux-firmware maintainers,

Please pull the audio and modem DSP firmware for the Qualcomm APQ8096 platform.
The firmware files come from Dragonboard 820c BSP available at [1] or directly
from Qualcomm at [2] (registration is required).

[1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
[2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip

The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:

  rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware apq8096

for you to fetch changes up to afc44bb26f7656e4bda1b63e530f787ffefb7609:

  qcom: apq8096: add modem firmware (2022-04-14 02:34:16 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      qcom: apq8096: add aDSP firmware
      qcom: apq8096: add modem firmware

 WHENCE                  |   6 ++++++
 qcom/apq8096/adsp.mbn   | Bin 0 -> 10533521 bytes
 qcom/apq8096/adspr.jsn  |  21 +++++++++++++++++++++
 qcom/apq8096/adspua.jsn |  21 +++++++++++++++++++++
 qcom/apq8096/mba.mbn    | Bin 0 -> 213888 bytes
 qcom/apq8096/modem.mbn  | Bin 0 -> 7434352 bytes
 qcom/apq8096/modemr.jsn |  21 +++++++++++++++++++++
 7 files changed, 69 insertions(+)
 create mode 100644 qcom/apq8096/adsp.mbn
 create mode 100644 qcom/apq8096/adspr.jsn
 create mode 100644 qcom/apq8096/adspua.jsn
 create mode 100644 qcom/apq8096/mba.mbn
 create mode 100644 qcom/apq8096/modem.mbn
 create mode 100644 qcom/apq8096/modemr.jsn
