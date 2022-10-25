Return-Path: <SRS0=sUHD=22=chromium.org=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C10CC38A2D
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 21:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E3F2C433D7; Tue, 25 Oct 2022 21:53:59 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FC93C433C1
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 21:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FC93C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id g12so14316837lfh.3
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 14:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0yM/e+WTW3oUfAY8MfxOUQ+ED2Cq5qxUwUsJjvobWQ0=;
        b=SAW43FVTyqs8guIkmnDC4LeB+apQpQkGpIJOw6p2MQ7UXm/wNzFLUlOID51Gu+mD11
         598l1RVRZO/hPJI8yBlrTL+ifobvJ91XRyKaeu9MqOY1Cq8ftRhNyK8zUZKIZu4b+8Lx
         PlaXjuCO/lROfgSnq2foQfV2URWv8jT9o4eXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0yM/e+WTW3oUfAY8MfxOUQ+ED2Cq5qxUwUsJjvobWQ0=;
        b=y8vRgpv5RmyUszvUuY2ckY+0sfpgc4R/reolN5PaP6IrKVx6hhb0Vyo9XPYsPBg6dh
         9tXJR2nDbNf4/4Uea/HOYffSobF/slwojniHbo6D8rDZNEf3DTeNccgU7IHT0YShbpfW
         Fo2XJsQrMYQGPHwd1sPx/Ark5/WWJzsMqsWVBx6zsZWSGi86coWYXknuXooEQ60tgNUe
         QxWwpf3BDoZrAmXQtAl2CxO4iAm9SfZ5kJELKWjEK7W6Q5oC288bd5VNIuByfiFeZT0t
         OzuscHxMeL3DGAPY+FXOJ9gNR2kAjtj4OjHq6X9i6s0z4pRcW6vaCAzXQfTQb5MjpxvM
         6kng==
X-Gm-Message-State: ACrzQf19w3wbU3k+G5z6iwdLCbmQDF+T5D15aQ2AEjK0+Q/lyHUIaaBu
	5wsg5cjdrXYrQ/3Aj/Ox5W8esKfBrVkHKWJ3IyDu7A==
X-Google-Smtp-Source: AMsMyM4/vdKyXEQGvcerwAShA9nl3l4ZaAfL7u3sS2Fp4Ke32myC6QH3cXoMbDojeXvRQCFO+JzdxWpjuWiKkGdHzJw=
X-Received: by 2002:a05:6512:75:b0:4a4:6c3e:a75d with SMTP id
 i21-20020a056512007500b004a46c3ea75dmr13947069lfo.408.1666734836241; Tue, 25
 Oct 2022 14:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhH41JnZA_fPNczMpBwnTy5P-5xhgPY5_eHkOsBzx0Qy=A@mail.gmail.com>
 <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org>
In-Reply-To: <d31e3aa3-fdec-f0b1-f400-0ea6055a0f6c@linaro.org>
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 25 Oct 2022 14:53:45 -0700
Message-ID: <CANHAJhFiVRxaDwfV5ej0c5o7JJ6cjRwoUiy2dvnSyGHo1H_ibA@mail.gmail.com>
Subject: Re: [PULL V4]: qcom: SC7180 and SC7280 venus firmware updates
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 25, 2022 at 2:48 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 26/10/2022 00:32, Nathan Hebert wrote:
> > The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94:
> >
> >    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/nathan-google/linux-firmware.git
> > update_sc7180_and_sc7280_firmware_v4
> >
> > for you to fetch changes up to 05df8e65182f7ee945f826e41b5eaa17c188a8df:
> >
> >    qcom: update venus firmware files for VPU-2.0 (2022-10-25 14:16:59 -0700)
> >
> > ----------------------------------------------------------------
> > Nathan Hebert (4):
> >        qcom: replace split SC7180 venus firmware images with symlink
> >        qcom: update venus firmware file for v5.4
> >        qcom: remove split SC7280 venus firmware images
> >        qcom: update venus firmware files for VPU-2.0
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Please excuse me for being too picky.
No worries! Thanks for helping me get the change right.
>
> --
> With best wishes
> Dmitry
>
