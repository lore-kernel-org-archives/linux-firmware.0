Return-Path: <SRS0=fl16=CC=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A901FEB64D9
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Jun 2023 08:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A0BEC433CB; Wed, 14 Jun 2023 08:59:55 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A2A2C433C8
	for <linux-firmware@kernel.org>; Wed, 14 Jun 2023 08:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A2A2C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f769c37d26so173538e87.1
        for <linux-firmware@kernel.org>; Wed, 14 Jun 2023 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686733192; x=1689325192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJu8gPArW2pKxAwcLTACWfXF007XZf4qmmeSySXd5qo=;
        b=JFD/F+N3kHanfga+bpjSVTN3+M/er4toz6zdObmdq6cVJUG2lXQyYV7o9B0PlTtB8H
         1XTBEqfbVrew2bWnU5TrhA31z1m/5e9NhWMA/r9rDaeRD64PFtIWREqi4MqdLridxsyc
         jcUKGozIPraG3lCkDLPftrKFLh9L83RUDc81tY94+KsK+D9wqKZuQjVPjoMAskCxBwIx
         Fa0EK8VdiE+/5CeyuW4byJK24KPzzz4f4ALTTM6HnTDoNuADKF4RShclY0UgV/MN1vr/
         KzcbcLQI70iRXx7YLKppycppca8TwVyDGMXjEVJOgMiLk83nPppwWn1SdVFSxDNjrhL2
         oyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686733192; x=1689325192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJu8gPArW2pKxAwcLTACWfXF007XZf4qmmeSySXd5qo=;
        b=MXfsFgdBKI0sUJKDHE/G3x/n3CsJ9yfsTL0p57eHRE9Xvy0mO+mRAqfEZoP4HeuayX
         N37Ybo669ItySGR1qGXdK1AtkfCkXxnsQSxqaSDsX8KOzcuXLaBqBQcwKJMAYdGpBepO
         emB1MCNfGLudiLxAraqdVEst5+uawUPuA61jc2PWd6cBF2kV17cRcOMT1ZeL2jiJza7G
         dhO2KWD92/PXNtiJMmUO0fyr4EHTurc2eX+vC6WYELifavpHcn7O7FkKcUCeuJU4AYxT
         u0eDPZn9uIv+iOrkYePrg2yP53Rep4jasSjOZOwjgAtxtXi/cNrgTZmMthF8vG9AF4ds
         LXqg==
X-Gm-Message-State: AC+VfDyLddDdyiJCWi0aowiCbLIkF8ilDo1cZXrqhtjDRvqhaTZe7/QM
	p2XuGmIy3rLHqRC4cLcC0APzXOVnINW0o3vcES4=
X-Google-Smtp-Source: ACHHUZ6BVvJlptjJKSTh0QBwvkbzzGtLrBTWpHN9h6HmmXfknCcNJKbU5K/uqS+i7nbRXi6nvFPKyA==
X-Received: by 2002:a05:6512:1c6:b0:4f7:672a:453 with SMTP id f6-20020a05651201c600b004f7672a0453mr586915lfp.17.1686733192084;
        Wed, 14 Jun 2023 01:59:52 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b19-20020ac25633000000b004eedb66983csm57766lff.273.2023.06.14.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 01:59:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PULL] Update firmware for Qualcomm SDM845 platform
Date: Wed, 14 Jun 2023 11:59:50 +0300
Message-Id: <20230614085950.238378-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1cd1c871c9162a2c34380e6dd0c8ac9474d36522:

  rtl_bt: Update RTL8852A BT USB firmware to 0xDAC7_480D (2023-06-12 07:08:48 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb3-update

for you to fetch changes up to 01a7a844cda3009327145d117844fd78bf01011b:

  qcom: Update the microcode files for Adreno a630 GPUs. (2023-06-14 11:54:16 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qcom: sdm845: update remoteproc firmware
      qcom: sdm845: rename the modem firmware
      qcom: Update the microcode files for Adreno a630 GPUs.

 WHENCE                                  |   7 ++++---
 qcom/a630_sqe.fw                        | Bin 32056 -> 32304 bytes
 qcom/sdm845/a630_zap.mbn                | Bin 14256 -> 14256 bytes
 qcom/sdm845/adsp.mbn                    | Bin 10420560 -> 10425168 bytes
 qcom/sdm845/cdsp.mbn                    | Bin 2704916 -> 2709012 bytes
 qcom/sdm845/mba.mbn                     | Bin 242400 -> 242400 bytes
 qcom/sdm845/{modem.mbn => modem_nm.mbn} | Bin 5652688 -> 5673184 bytes
 7 files changed, 4 insertions(+), 3 deletions(-)
 rename qcom/sdm845/{modem.mbn => modem_nm.mbn} (73%)
