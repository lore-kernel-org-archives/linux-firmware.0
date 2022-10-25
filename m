Return-Path: <SRS0=sUHD=22=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BB9C38A2D
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 21:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24F74C433B5; Tue, 25 Oct 2022 21:32:21 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E058BC433D6
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 21:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E058BC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id o4so14147229ljp.8
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 14:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lNl18H7nWoSg769nmPB4Fbb4nB49kkuQLERALgD+1Y4=;
        b=Yn/mSchSYMqvsnMbPCEEme2tqkdvEi3zO/P7A0aWLrUfwKoaG3xymu68CLNuZ/gqE+
         TXo0CFO0Mt8SZtotHwihLJArVdiqJw11mQGfXh0c+THt33QcD8/phaFUpelm5TZx0vp8
         KTlFp03xFplmFDCGa69AHkx9jGsfqldHLttHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNl18H7nWoSg769nmPB4Fbb4nB49kkuQLERALgD+1Y4=;
        b=eoUIP62lnxLf26iJeth7CYBzgEr2sZw9Q1FpHKFUlNwXXPYRNspDd4ZWfbH9Itca84
         0sxUGLTyI3ZaNDxbSP5KEgzVucY7A5jKnSrgmmKGMB3t/OYH5bInnwBsztg821EsPs3v
         Yr0sIiNI0qodxg5DGtCGW4NLoJ6QPCTUBeQt1HiLdh97aLWIeUfTaRPUDwKazdK3yK/G
         KtFjgZ7hUqoNJg5DYGwZNBOSk856w5fdQyu0GXBnsWd6nEssM0a7ponlGCLFzgt77JrN
         P+hNLlXsIGBZQcUwwOhMm43aFJA3qcqxq0YxxB6geKKWuGexImWlDjU8mM5LWvjGiIFv
         3uSA==
X-Gm-Message-State: ACrzQf2sZciMNBQiFgqYhs9Hoey7fdjWgMC8qTjI4x7kFjbWQCPBgsBY
	ES0CGp3zhWB9UbG8WIPtq7eJ46fQaSaD+M+g+W6LA4o4hZphLA==
X-Google-Smtp-Source: AMsMyM6oOm735Tw4SCfCbxdiC5xAzsoPMgJAxelTIMgOFci+ndfnXH2la4glFkPX5J57nWcCE2yyUl8epmTCvSxnMhM=
X-Received: by 2002:a05:651c:907:b0:26f:bb25:f66c with SMTP id
 e7-20020a05651c090700b0026fbb25f66cmr15471794ljq.132.1666733537626; Tue, 25
 Oct 2022 14:32:17 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 25 Oct 2022 14:32:06 -0700
Message-ID: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
Subject: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
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
update_sc7180_and_sc7280_firmware_v4

for you to fetch changes up to 05df8e65182f7ee945f826e41b5eaa17c188a8df:

  qcom: update venus firmware files for VPU-2.0 (2022-10-25 14:16:59 -0700)

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
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 0 bytes
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
 delete mode 100644 qcom/venus-5.4/venus.mdt
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
