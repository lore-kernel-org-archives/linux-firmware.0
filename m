Return-Path: <SRS0=6E6G=EW=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AB9EB8FAF
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 11:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6086C433CB; Wed,  6 Sep 2023 11:36:49 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB712C433C8
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 11:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CB712C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d7bbaa8efa7so3133024276.3
        for <linux-firmware@kernel.org>; Wed, 06 Sep 2023 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694000207; x=1694605007; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARqqnV5RUKOZrE62CjUH+mZxkGrJ3vy4uKrUnWYINHw=;
        b=MoZeqLIomZrk8ITuMl8BSX+WSA8sSse5jtGYhsSlsTUvN/v0CsBUp641ERtVvEIgx4
         ZO4NSgoswOEPd77jKBiViiTSdZsZ8WihDUHTILF2vKjpXUMkWjLEso97DKJahI+LIPjU
         wO4CHDEN8qy0PP3bOwk6mSr08+rVm3iEXhMZ8ulcQTLlpb87+wwRM95vqrxq5WRVfToe
         uADR357zTalQ3yCjPs0MLAbWkndZYWdCJk8NdyrN+Qbzgx7ZIING6JegLjfIw1WHZAFq
         W8SYxGfeD6eaN94NGiUvlUqWgzIu+Nb/tI0l6q8NGPwyXou+2LJCN8mU+KMke+MAPVrz
         +NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694000207; x=1694605007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARqqnV5RUKOZrE62CjUH+mZxkGrJ3vy4uKrUnWYINHw=;
        b=khRxsF2QtYxmK2pjSV/v65XXCwsbyialE7ioNbraCgSPMghDNSr6tQcU0LN5rBxUNQ
         WVPpbfeNJQlig2U62HVAzDftW/84CjCa+Zm9Qegi/h5xbTmGWTacVhXfU9x6xnAl9nPf
         z8+MaPrRhxDs0Ew0efzT6+dW04OsOLG/7UY733zFEjbTS8BILjKLdKBY2w2jtqL0hkv8
         jlTrQiThUFBABKkbB15jv4oNHnm6wEskDHNeMl7meWkyAgR6/Q2pP1R7tiipTgYMVzlo
         85UiFnIzYlskDWImSnzin+ve/tAYLPkHYq94WBYwUbqA9w1gd4w1YOtiVxbWIkyo7EEK
         0PFw==
X-Gm-Message-State: AOJu0YztpkjZolOYw5rUniWEW/5tE5f0CN5hlmegMavxU35V93GzUDDw
	DTRqMDXNHtK0iLUSmvD8HwIlJu1aNMLW55ZaDKeuEw==
X-Google-Smtp-Source: AGHT+IHzN1O4eKhhaHQsSNTImOt728Le7M43YBqMykRfepRO2PBuT3k9nODQuABhWHpayV2T1mbw6Hsshs4JQzYt5qc=
X-Received: by 2002:a25:26c9:0:b0:d11:c89:4256 with SMTP id
 m192-20020a2526c9000000b00d110c894256mr16819309ybm.31.1694000207521; Wed, 06
 Sep 2023 04:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230906004459.1311755-1-dmitry.baryshkov@linaro.org> <CA+5PVA6rzmv7oF9XngMjkLiqydcmnMyck1rtYySHBajWQQDyxw@mail.gmail.com>
In-Reply-To: <CA+5PVA6rzmv7oF9XngMjkLiqydcmnMyck1rtYySHBajWQQDyxw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Sep 2023 14:36:36 +0300
Message-ID: <CAA8EJpqTwbEDcws=Wd1tuXkmEdRZnh_DkMydofKZ-n9srEyJWQ@mail.gmail.com>
Subject: Re: [PULL] qcom: firmware updates for the sm8250 / RB5 platform
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Sept 2023 at 14:19, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Sep 5, 2023 at 8:45=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Please pull in firmware updates for the Qualcomm Robotics RB5 platform.=
 This
> > includes SM8250 DSP firmware updates, video encoder/decoder (venus.mbn)
> > firmware update. Also as a part of this update is included the board-sp=
ecific
> > firmware for the Sensors DSP.
> >
> > The following changes since commit 7be2766de1f45a494a3e913f2e9fb77191a8=
ddb5:
> >
> >   Merge branch 'rb3-update' of https://github.com/lumag/linux-firmware =
(2023-08-04 06:33:54 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/lumag/linux-firmware rb5-update
> >
> > for you to fetch changes up to 60b397dfd9d77da4b62e08572bdc7174a29f53a8=
:
> >
> >   qcom: sm8250: add RB5 sensors DSP firmware (2023-08-16 16:03:46 +0300=
)
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (3):
> >       qcom: sm8250: update DSP firmware
> >       qcom: Update vpu-1.0 firmware
> >       qcom: sm8250: add RB5 sensors DSP firmware
> >
> >  qcom/sm8250/Thundercomm/RB5/slpi.mbn   | Bin 0 -> 5646296 bytes
> >  qcom/sm8250/Thundercomm/RB5/slpir.jsn  |  21 +++++++++++++++++++++
> >  qcom/sm8250/Thundercomm/RB5/slpius.jsn |  21 +++++++++++++++++++++
> >  qcom/sm8250/adsp.mbn                   | Bin 15515796 -> 15515796 byte=
s
> >  qcom/sm8250/cdsp.mbn                   | Bin 5822228 -> 5826324 bytes
> >  qcom/vpu-1.0/venus.mbn                 | Bin 1973540 -> 1974884 bytes
> >  6 files changed, 42 insertions(+)
> >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpi.mbn
> >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpir.jsn
> >  create mode 100644 qcom/sm8250/Thundercomm/RB5/slpius.jsn
>
> This misses WHENCE entries for the new files.
>
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: qcom/sm8250/Thundercomm/RB5/slpi.mbn not listed in WHENCE
> E: qcom/sm8250/Thundercomm/RB5/slpir.jsn not listed in WHENCE
> E: qcom/sm8250/Thundercomm/RB5/slpius.jsn not listed in WHENCE
> [jwboyer@vader linux-firmware]$
>
> Can you rebase against the main branch and fix this?

Done. Please give it a try:

The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade901=
:

  Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +0000)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware rb5-update

for you to fetch changes up to bb3d5bc99fe629cab2024c9bac528c3b466d2f31:

  qcom: sm8250: add RB5 sensors DSP firmware (2023-09-06 14:35:32 +0300)


--=20
With best wishes
Dmitry
