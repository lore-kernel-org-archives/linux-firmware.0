Return-Path: <SRS0=sUHD=22=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F3BFA373E
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 20:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9342C433D6; Tue, 25 Oct 2022 20:54:51 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C72D1C433D7
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 20:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C72D1C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f177.google.com with SMTP id u2so9680118ljl.3
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 13:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qpCoIXyGfubfE3X4kZy0CHeFFWQt64Ls0egPKk2u8yQ=;
        b=R3Mf5rveHb2ROeT1K+qJnXztMKDZ1Y5m8fWEC6tbC57fuiycD5uN/wEqSX5NTxqS4z
         pjHDFTQr/zzxIuSB1wq21STgTuX4d0dBbmDqq3JCuMsOsLmDVTeIA7wby3osmreow4OQ
         BtvyWKlRUInNu8pztaGahXA+zEXOiXlNxH13I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpCoIXyGfubfE3X4kZy0CHeFFWQt64Ls0egPKk2u8yQ=;
        b=PU4+h6wlJS6762tGAADshHtzh2nun46fTB5un/KlKbBZJz3QN/wGqy1fz6TlBCvEfP
         JXRjoPg/iiUfINs5RzQ9XltekMHnw7DTpRRQQVWeST2rJFy1U3q9rEulgosxkGzQDaGe
         Ygq9egqd/m3dxe1aQu5f1YeDnZ7q148NnUcb7RGaDhZ5ZUj7nE8YZVfR77VKONJLVn/l
         Ll9hCTZU6OWUDUCE8wStZglHXNiunAcRkRAkEHPJ8PVzxME02UH5z8xy7prUvS51pLrU
         aa3UT3wE+2u9qlG/NW+5Opr3P0rCov0tu9LTEVFOOQUN/vcL0XwJANOYCuOqaXUqks5e
         ULOQ==
X-Gm-Message-State: ACrzQf2nhyhJYYfx+a+Zorvy5XKL2WU9V5LMVWVA/DKlUaow87vqum7X
	JCN2pPTrkix1uVUO3hM939Ot9VnE1rOHBkHjOux4WnDqaDPYZw==
X-Google-Smtp-Source: AMsMyM7MtQ8BuSs3MR4uzASp3DCf6Lwyq5bzRIBH1Njy7gCY5wBEwoNc9AkHk3zGsb7/tnxVpVGn6m66t4L9YT+VOiA=
X-Received: by 2002:a05:651c:98a:b0:26d:fd1f:10 with SMTP id
 b10-20020a05651c098a00b0026dfd1f0010mr15282036ljq.323.1666731288518; Tue, 25
 Oct 2022 13:54:48 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 25 Oct 2022 13:54:37 -0700
Message-ID: <CANHAJhGcJT3nEq_s7qb4ammtiyCe1SQko3yXx7_5nm4PoJg+=A@mail.gmail.com>
Subject: [PULL V3]: qcom: SC7180 and SC7280 venus firmware updates
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:

  cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)

are available in the Git repository at:

  https://github.com/nathan-google/linux-firmware.git
update_sc7180_and_sc7280_firmware_v3

for you to fetch changes up to 99a1a406c0bc9144de6b8de8efd983cfe0389131:

  qcom: update venus firmware files for VPU-2.0 (2022-10-25 13:34:43 -0700)

----------------------------------------------------------------
Nathan Hebert (4):
      qcom: replace split SC7180 venus firmware images with symlink
      qcom: update venus firmware file for v5.4
      qcom: remove split SC7280 venus firmware images
      qcom: update venus firmware files for VPU-2.0

 WHENCE                   |  24 +++---------------------
 qcom/venus-5.4/venus.b00 | Bin 212 -> 0 bytes
 qcom/venus-5.4/venus.b01 | Bin 6808 -> 0 bytes
 qcom/venus-5.4/venus.b02 | Bin 873596 -> 0 bytes
 qcom/venus-5.4/venus.b03 | Bin 33792 -> 0 bytes
 qcom/venus-5.4/venus.b04 |   1 -
 qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 9 bytes
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
 22 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 qcom/venus-5.4/venus.b00
 delete mode 100644 qcom/venus-5.4/venus.b01
 delete mode 100644 qcom/venus-5.4/venus.b02
 delete mode 100644 qcom/venus-5.4/venus.b03
 delete mode 100644 qcom/venus-5.4/venus.b04
 mode change 100644 => 120000 qcom/venus-5.4/venus.mdt
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
