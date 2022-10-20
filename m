Return-Path: <SRS0=guQf=2V=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4FBC433FE
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Oct 2022 17:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39B2BC433B5; Thu, 20 Oct 2022 17:08:00 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39EE9C433C1
	for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 17:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39EE9C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id m23so186011lji.2
        for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IybMlsJw1Yys6p7xGaPp2Y1xUUcDYRPKINWOHYDcdwc=;
        b=ibmMQrzhrxmtZ/6A5mbyXJKFAvXn12OA0sQuE6UBFA0NmdpGznMXrdR7vmIamgYZRg
         /x89uIj1e+1t5U8t6MS515XATn1Yk+tzIKFg8RWe/RFUK6ufnh7Lcry4rEoDy301aLUA
         GpPt9au+HKaHTNJAEbkXrHgo4pJaH3Ho/a7Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IybMlsJw1Yys6p7xGaPp2Y1xUUcDYRPKINWOHYDcdwc=;
        b=pC62hwD9C+gl16UdKJV9q6wl/sQ7jYYO4SF/mebOqW68chkr0SlLY9DDaYxFyI6tY/
         s6Ku7nTcv6Zrte5acval8/wk/yTFt7/CiMq7OfNe7K9L7/5OxqvZr8vNHakWCuvTkqo6
         s+LI3/f/UhNzVtyW484UR/lnaN3FGaEKpeDJUAFzA7DPEt1Ukb1P2W4rWXsr3iWOoFNg
         v5xCsU7MZOAb9pXwpuvkOLFloIclCcmqBvcwIYxDDCBdAJqTwR5nyiLEqlMYKd42NEHh
         O3ubtC/Z8qXeda3v5GyQb9vGjMc87zOAfJgbNqu3RoW81utWRnNbNwTCjjYAE6Gw7L+A
         dOvQ==
X-Gm-Message-State: ACrzQf2/7zsQCqfIj8PImPNna+dryA6N/yqMT8dUevfbtCKqJ+9bKovD
	cP3CcKrlANND8y41SW4KXwsFkKuanyVbB7wU13VjdgJ+Q4dp+A==
X-Google-Smtp-Source: AMsMyM5bZnvNjkE/0TBP4deiruJQxWvKQcODnmlc5+pOuYofdw95lEMHkRbBlWwSgh7s+ZB5/KH7gmu9IYqaNaAE9QI=
X-Received: by 2002:a05:651c:907:b0:26f:bb25:f66c with SMTP id
 e7-20020a05651c090700b0026fbb25f66cmr5377618ljq.132.1666285676679; Thu, 20
 Oct 2022 10:07:56 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Hebert <nhebert@chromium.org>
Date: Thu, 20 Oct 2022 10:07:45 -0700
Message-ID: <CANHAJhG7wCv4TwVCtWa2wqHzaG5ncbtfnVJtnQqqDSbEoPmoHw@mail.gmail.com>
Subject: [PULL V2]: qcom: SC7180 and SC7280 venus firmware updates
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:

  cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)

are available in the Git repository at:

  https://github.com/nathan-google/linux-firmware.git
update_sc7180_and_sc7280_firmwares_v2

for you to fetch changes up to 054271e4164b6b4c069a3aaaeb9bfcde8c850339:

  qcom: update venus firmware files for VPU-2.0 (2022-10-20 09:37:35 -0700)

----------------------------------------------------------------
Nathan Hebert (3):
      qcom: update venus firmware files for v5.4
      qcom: remove split SC7280 venus firmware images
      qcom: update venus firmware files for VPU-2.0

 WHENCE                   |  17 ++---------------
 qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
 qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
 qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
 qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
 qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
 qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
 qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
 qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
 qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
 qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
 qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
 qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
 qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
 qcom/vpu-2.0/venus.b19   |   1 -
 qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
 qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
 21 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 qcom/vpu-2.0/venus.b00
 delete mode 100644 qcom/vpu-2.0/venus.b01
 delete mode 100644 qcom/vpu-2.0/venus.b02
 delete mode 100644 qcom/vpu-2.0/venus.b03
 delete mode 100644 qcom/vpu-2.0/venus.b04
 delete mode 100644 qcom/vpu-2.0/venus.b05
 delete mode 100644 qcom/vpu-2.0/venus.b06
 delete mode 100644 qcom/vpu-2.0/venus.b07
 delete mode 100644 qcom/vpu-2.0/venus.b08
 delete mode 100644 qcom/vpu-2.0/venus.b09
 delete mode 100644 qcom/vpu-2.0/venus.b10
 delete mode 100644 qcom/vpu-2.0/venus.b19
 delete mode 100644 qcom/vpu-2.0/venus.mdt
