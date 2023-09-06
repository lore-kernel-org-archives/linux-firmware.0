Return-Path: <SRS0=6E6G=EW=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A926EB8FB7
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 11:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4471AC433C9; Wed,  6 Sep 2023 11:33:20 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A9BCC43391
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 11:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A9BCC43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6bf298ef1f5so2634582a34.0
        for <linux-firmware@kernel.org>; Wed, 06 Sep 2023 04:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693999994; x=1694604794; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK8NHS2iC+EdIrz93YoOnu4w+oJGTzeh1xrolghJ1sE=;
        b=lCoz13Mnexhk0GQtVSkEfK9GY6Jhhge8ObDjW2WsNTJUVTyq2noRW0tCHSx2M0APFs
         e5wNx9aceI/4ws0tXzYTEeuMcOpJZDuR3i+ahBNecptJRudXfLVZCj87HtsQRrUBB7Yx
         a8qPxCGc9/PleXwQ0np0UCOkt0jJX0XCp7ZRpHLsCrC+ZWiaOA+DuVfLMfZN13gtT/cy
         KetAXx4sR6OEcPBPPDRiyY/cknYDXC7xj1020K/DeDVgGewYG8M0G3uSXewRqS47v6IC
         WpcMfPfDwAdataB0tsTSYW1XisIFEKklXpKdg+InMOEoIAS1fL1hWTvyk7XxandeJlyt
         4ENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693999994; x=1694604794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SK8NHS2iC+EdIrz93YoOnu4w+oJGTzeh1xrolghJ1sE=;
        b=lqmv2FnPqpPEGAkwOHpVeUIaLKu51vTidleRJa3mQbiIzoVHW1YGiPSYIpEC2j0RKx
         32OYlm+X5gHueEhatI3PUBlL49GYeB2t4UvWUO5V5vI9a8GJDV1t0pHe9gvlpJ0r7ldQ
         OZJievT3ewL4HAr1E2Mfo19y/pXNuCmWI7AsKsUgrEKw2gMMmsBsgpdQXZBFQrA2mz8w
         Krn8Zz+c9Q64UACTaEE1o8Wt46BBF2mRexPyR1eF3RfrnC9VbpCGjbPhLA02TUQZyj+Y
         z7EtTiTVB1vX4Xyq2oBQTivHmzXnRCwzuU0qFL8TxqGlkxnKmQSLjRReFKzfq6h5HRkL
         Qn9w==
X-Gm-Message-State: AOJu0YyT01tsx2pYsMgVfEl/5kqzPEJ8KfN63groQdfSS/sBfBX5dfLp
	DmBHAwQcUq8+vT9h/DJt/jY0xneNbRrniVqrtXAefg==
X-Google-Smtp-Source: AGHT+IEL+0Z0XHNTz7i2K/mMp7ueLzlwT/AaPbcDh8kRFJFEJmq0WxqnWGkdTYlDm6LWmROLnuMaO3obmL4C5DgIdok=
X-Received: by 2002:a9d:6956:0:b0:6b9:6481:8e33 with SMTP id
 p22-20020a9d6956000000b006b964818e33mr16933615oto.13.1693999993888; Wed, 06
 Sep 2023 04:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230906000213.1286283-1-dmitry.baryshkov@linaro.org> <CA+5PVA71iXzkjWU7x27k3qGxTFz4rdcFAArU9AGVE+Eg0-sdoQ@mail.gmail.com>
In-Reply-To: <CA+5PVA71iXzkjWU7x27k3qGxTFz4rdcFAArU9AGVE+Eg0-sdoQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Sep 2023 14:33:02 +0300
Message-ID: <CAA8EJpqTd20xGZFpgsA=yoQELonn4QtOwAE6OX9abmv01SWDpA@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware for Qualcomm Robotics RB1 and RB2 platforms
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Sept 2023 at 14:17, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Sep 5, 2023 at 8:02=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Please pull in firmware files for new Thundercomm boards, Qualcomm Robo=
tics RB1
> > and RB2 platforms. This includes Audio, Compute and Modem DSP, WiFi, vi=
deo
> > en/decoder (venus) and Adreno GPU firmware files.
> >
> > The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8=
ddb5:
> >
> >   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware =
(2023-08-04 06:33:54 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/lumag/linux-firmware rb12-fw-v2
> >
> > for you to fetch changes up to f29e3265b02430630222fb3aba8b76ebcba632be=
:
> >
> >   qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210 (2023-08=
-23 20:24:47 +0300)
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (5):
> >       qcom: add GPU firmware for QCM2290 / QRB2210
> >       qcom: add firmware for QCM2290 platforms
> >       qcom: add firmware for QRB4210 platforms
> >       qcom: add venus firmware files for v6.0
> >       qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210
> >
> >  WHENCE                    |  27 +++++++++++++++++++++++++++
>
> This conflicts in WHENCE now with the addition of the RawFile type.
> Can you rebase on top of the main branch?

Done.

The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade901=
:

  Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +0000)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb12-fw-v2

for you to fetch changes up to 74cc8ca8217cb0967ade52953f9d9242f09e3460:

  qcom: add firmware for the onboard WiFi on qcm2290 / qrb4210
(2023-09-06 14:30:16 +0300)


--=20
With best wishes
Dmitry
