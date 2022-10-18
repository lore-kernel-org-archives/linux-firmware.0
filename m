Return-Path: <SRS0=OiK1=2T=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC3CC43217
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Oct 2022 21:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A461C4347C; Tue, 18 Oct 2022 21:12:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CAFAC433D6
	for <linux-firmware@kernel.org>; Tue, 18 Oct 2022 21:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CAFAC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id g7so19765008lfv.5
        for <linux-firmware@kernel.org>; Tue, 18 Oct 2022 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jBNmCEKNIJ8QoqMKRCXQ8dxLqKledSWNKpiUAkjyuYY=;
        b=QPiLaTKyd9Ebm8sv/378EOdEZ4aPnP+VPiwGTkz/amewbX5DDLbBPvmGRdl0M3JpDI
         rqIauBmNgAvNr4Y/cd8o+mo+HNtqZgsTzPdSyE+w5cE05RL1DUV95g+8r2G4F4tq6KiD
         0/AkNgmf+aR0PJ70ATQHZP16x0hoVCKaedXso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBNmCEKNIJ8QoqMKRCXQ8dxLqKledSWNKpiUAkjyuYY=;
        b=7dL7MgWN6onxlasgpXZ82/9DIQoP7paHCCjuCoR/U9ALBUZP+ptZGg8VP/uAti60uU
         8XUDL7Jbsd6ZHoT4aEZvjI1ReR9o2zZkLOynANitg7K+dxqRW1akCAW89xz+5pYJoHfO
         v2FJhASqxMl/FXJpIJ5Fw1pAJaeAVRtJhAyZLS3JoYeex8m8g25X62ppzpltRi/n7UcU
         cqXP2JJhpB07ZmYnush83Nc4xN8Z2/DwRr9fRX/I+3kZ2h4NQLRHO7il2r7h3aqitMit
         QSYM+lO0fR2Butlw3TDgrghfiBGQTG26TYYwKFlvAyKOvvsyFEsWAGI766CntrTeucnG
         loLw==
X-Gm-Message-State: ACrzQf24Bv78WxBdBCLU045I79bJor3X9sonQVQ14oKt+daxqH5t04rP
	YDlrKhnzTt3Llir8RuoKcTTToHAd/uRAZR+O2MbEq7iXXRGXIA==
X-Google-Smtp-Source: AMsMyM4BK9xE6db7GdQSimKMJ2byNr2ij+bHVZ8z4TJIIAGKS19whmG0FHGEXw3C22NsKH4yE7X6yj3twZpIhUyPB+4=
X-Received: by 2002:ac2:442d:0:b0:4a2:23e2:cf59 with SMTP id
 w13-20020ac2442d000000b004a223e2cf59mr1570305lfl.650.1666127568897; Tue, 18
 Oct 2022 14:12:48 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 18 Oct 2022 14:12:37 -0700
Message-ID: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
Subject: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org, quic_vgarodia@quicinc.com, 
	Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"

The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:

  cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)

are available in the Git repository at:

  https://github.com/nathan-google/linux-firmware.git
update_sc7180_and_sc7280_firmwares

for you to fetch changes up to 76e160366a28010fa06ddc965659c38a44d159d9:

  qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58 -0700)

----------------------------------------------------------------
Nathan Hebert (2):
      qcom: update venus firmware files for v5.4
      qcom: update venus firmware files for VPU-2.0

 qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
 qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
 qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
 qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
 qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
 qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
 qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
 qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
 qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
 qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
 qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
 qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
 qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
 qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
 14 files changed, 0 insertions(+), 0 deletions(-)
