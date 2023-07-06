Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57417EB64D9
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Jul 2023 19:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A1F4C433C8; Thu,  6 Jul 2023 19:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3918C433CA;
	Thu,  6 Jul 2023 19:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688672316;
	bh=53wtYJCTguAD3loDOB8ufKxFrKH4Vgx1tRVG1E8oGmE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TFeFrADWgl4MsyGIafOObz039wZroOpVAM2rJg+FOTe9U7xTzk3pOVWS8tPBFqTQf
	 gi51YP5vmFpXIVwCIjWvbGd5qJfkKI5krE3nizQajlhsVoEzpYAfp+qBpLjwWzMTiq
	 DDzZg3cTvE2nHPZAStwzWwB3EcISJcC55HGQqaFZgGD2WkAG67o6Nd3O+WVhie4GEq
	 f58DvfXDil4DC3HMs6G9ynX9wdBjFyrRmt3pcAldcVRa4Fc8W1x6CSAfIi5w0zQcHm
	 0Uf+ucyMSmcO5+V5aRPsUWLj2JX8435dh8J9TdSJkRg23O3SLOuTR3wr5HeDxW9xRF
	 7X3YTbYzR3LOQ==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so1159045276.0;
        Thu, 06 Jul 2023 12:38:36 -0700 (PDT)
X-Gm-Message-State: ABy/qLaO4XQNte3hpzhEF9JcZhIzXftzet4Ur0fAJr0M+9fb3VoQuRS4
	ldLF15ARScDu76MT074Rnqkx9e4Nt3Zy5tfQppI=
X-Google-Smtp-Source: APBJJlENWPGNiuX1XGziVJu24PMJnkdkCrkfxePxRI6fbsrh8a+qNwdK+bIGDdtPHzFEzyFfVxJQIxmO9WccyqPlilc=
X-Received: by 2002:a0d:d415:0:b0:570:1a2c:5844 with SMTP id
 w21-20020a0dd415000000b005701a2c5844mr3039658ywd.35.1688672315929; Thu, 06
 Jul 2023 12:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <9786de04-fd1c-b209-b7b8-0bdbd5a1e215@linaro.org> <86102be0-87ea-6130-6b9b-739dda279808@linaro.org>
In-Reply-To: <86102be0-87ea-6130-6b9b-739dda279808@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 6 Jul 2023 15:38:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA60S8RmhLhqz8+GfaFeQ+=fvvLKPrEtU_X5y1h8GmxGkA@mail.gmail.com>
Message-ID: <CA+5PVA60S8RmhLhqz8+GfaFeQ+=fvvLKPrEtU_X5y1h8GmxGkA@mail.gmail.com>
Subject: Re: [GIT PULL, v2] Add Audio topology firmware for Qualcomm SC8280XP
 X13s platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-firmware@kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Brian Masney <bmasney@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 1:01=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28/06/2023 14:00, Srinivas Kandagatla wrote:
> > The following changes since commit
> > ee91452dac5abfc4c5b9827cf55e701d8c0ca678:
> >
> >    Makefile, copy-firmware: support xz/zstd compressed firmware
> > (2023-06-25 12:18:57 -0400)
> >
> > are available in the Git repository at:
> >
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git
> > sc8280xp-audio-fw
> >
> > for you to fetch changes up to f9a35b3f0779844aa686b76506344db70a72820d=
:
> >
> >    qcom: Add Audio firmware for SC8280XP X13s (2023-06-28 11:52:02 +010=
0)
> >
> > ----------------------------------------------------------------
> > Srinivas Kandagatla (1):
> >        qcom: Add Audio firmware for SC8280XP X13s
> >
> >   LICENCE.linaro                                |  30
> > ++++++++++++++++++++++++++++++
> >   WHENCE                                        |   8 ++++++++
> >   qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin | Bin 0 -> 24296 bytes
> >   3 files changed, 38 insertions(+)
> >   create mode 100644 LICENCE.linaro
> >   create mode 100644 qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin
>
> I'm not sure if this is used for linux-firmware, but:
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Thanks a lot for moving the file into a proper, device-specific location!

Pulled and pushed out.

josh
