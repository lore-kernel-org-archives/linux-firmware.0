Return-Path: <SRS0=ZWJV=2U=gmail.com=robdclark@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A54C433FE
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Oct 2022 15:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CDEBC433D7; Wed, 19 Oct 2022 15:53:12 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8DD0C433C1
	for <linux-firmware@kernel.org>; Wed, 19 Oct 2022 15:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8DD0C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id d13so10968435qko.5
        for <linux-firmware@kernel.org>; Wed, 19 Oct 2022 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBHWHRYZIKVyYQXTQ0xEuNFskPCPX2MZMQbHpxS/OLw=;
        b=bnNIO5I0OlMiKJf5z2xhhpzl5PbYKjmyHD+j7K9oW4gfqXism/Cz6GnrsY51PozL4Z
         a+D6hzhEoVNQ0qcRjWqeZD49ar4VVKy2HXfELJm6MQii0dPfVJC27GvqZlQLwLWaVk4q
         e7+LAzkAO6A7EBvfNcSmRgNVWFU9AjFIuHPiZ+k8Tyvh8IlpBEG29+tb+fJ+vGXAGLEJ
         vC8AyDPwHtWrr6wPqPgeIM1qNB0fn6TLnIL4NC63SLJgc5vBEYEVe68UQXX3K1odCAvC
         ZZmCp/2wcic6I75xami/SRdUK5GpverRf0bsCKgJlHSbb3NqJNbo8JJ4CCZGM0rnO570
         8Udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBHWHRYZIKVyYQXTQ0xEuNFskPCPX2MZMQbHpxS/OLw=;
        b=DmpZ3Oxw7mr+H8KOiqmIsHz+MMupbKKGAOCuzJV8IGmJFUw2wVNvl+H2gvXB1Eav3C
         CvvsiZD9CImjO2YNRZexPpxck9XuocXzgVU5DTuWmormtGKWCe/I0gGSoG9dk+Oichmp
         WpXnhPO0lycapv2omRAD4XewY1DKpO8WQoEQOk64/hCDoROEANLwJPT+H1j10rag5eqa
         e1crMGe+OH6jp+ewYi4t6bvvt73FZfJ61l5GJ3dytDsTbrGUK1LxnoHxJenUv3OMIlMv
         86e1vyXiJJaaB2dAPy/GfYzYnG0AO5rIM9iDRPCZHEoE8g8N5VlRPeGHP4KBZSWDXPKQ
         tekg==
X-Gm-Message-State: ACrzQf2USH/RSoFoAj/dwo7dvpw/4kI8TahuwSSPJPROnKUNx1KHhyIq
	NkmYg/zIWfYliA2AQTknGyKrMSch6kZaXpIdWp8=
X-Google-Smtp-Source: AMsMyM71zhSyKXPPYv4FP4cbpVvsaMgpEqOZFzRlIMCRpHEICbbxcqJL9DC3Jprnlg9lkpTJkxJr98zN+bmG+HxmUYA=
X-Received: by 2002:a37:bd47:0:b0:6e1:be21:e6e1 with SMTP id
 n68-20020a37bd47000000b006e1be21e6e1mr5888896qkf.473.1666194790468; Wed, 19
 Oct 2022 08:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
In-Reply-To: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Oct 2022 08:52:58 -0700
Message-ID: <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To: Nathan Hebert <nhebert@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_vgarodia@quicinc.com, Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hmm, does venus not support the combined firmware yet?  Elsewhere
we've moved away from split fw to using a single ELF file..

BR,
-R

On Tue, Oct 18, 2022 at 2:18 PM Nathan Hebert <nhebert@chromium.org> wrote:
>
> The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
>
>   cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/nathan-google/linux-firmware.git
> update_sc7180_and_sc7280_firmwares
>
> for you to fetch changes up to 76e160366a28010fa06ddc965659c38a44d159d9:
>
>   qcom: update venus firmware files for VPU-2.0 (2022-10-18 13:42:58 -0700)
>
> ----------------------------------------------------------------
> Nathan Hebert (2):
>       qcom: update venus firmware files for v5.4
>       qcom: update venus firmware files for VPU-2.0
>
>  qcom/venus-5.4/venus.b00 | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01 | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02 | Bin 873596 -> 875020 bytes
>  qcom/venus-5.4/venus.b03 | Bin 33792 -> 33896 bytes
>  qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
>  qcom/venus-5.4/venus.mdt | Bin 7020 -> 7020 bytes
>  qcom/vpu-2.0/venus.b00   | Bin 692 -> 692 bytes
>  qcom/vpu-2.0/venus.b01   | Bin 7376 -> 7376 bytes
>  qcom/vpu-2.0/venus.b02   | Bin 300 -> 300 bytes
>  qcom/vpu-2.0/venus.b04   | Bin 20 -> 20 bytes
>  qcom/vpu-2.0/venus.b09   | Bin 939184 -> 939472 bytes
>  qcom/vpu-2.0/venus.b10   | Bin 42976 -> 43120 bytes
>  qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
>  qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 8068 bytes
>  14 files changed, 0 insertions(+), 0 deletions(-)
