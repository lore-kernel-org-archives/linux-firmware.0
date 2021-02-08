Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B667EC433E0
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Feb 2021 13:21:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6408864EB1; Mon,  8 Feb 2021 13:21:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B52A64E9C
	for <linux-firmware@kernel.org>; Mon,  8 Feb 2021 13:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612790508;
	bh=JCowdY9/swgNvLGKCtYILHUDvwFwe3wlliPaauwJtqo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Z0OnUMf1XF6wkRce7+KX5yJEIK6rZnwX/0/uGbV2554m5cIGXXf99QGkLMeuM2fo4
	 nd+PvQhfz2KCYi5XqodKdoD0PYFGrupII7JGvkT/qoRyvGD26bNaz93mXnYoJMZnRb
	 XFnWTvefmgX+P1z2gr+Jco4NiaPfHaMatAsoGDDYRSF/B/F66UcGVCq1MZPngEkxbb
	 ATc163bd6VzzSwq/mqlS9wAs+dmMbqPMJWRaRKdulx3KF8yOrzO6fioAv76GkwLhaW
	 8mgSRn8dSSdEkZ2xBqvLCaL7F8AFVEHODzDZVS1VsCgjQUrHuQJxbi9NsMQLAW+NEw
	 PupCXLjtMynFg==
Received: by mail-il1-f172.google.com with SMTP id e7so12639334ile.7
        for <linux-firmware@kernel.org>; Mon, 08 Feb 2021 05:21:48 -0800 (PST)
X-Gm-Message-State: AOAM530+uMGpF3fsF0Sfbvah+oCYxmRzC3B9IA1Zjj6LNRyyjIQBW6IN
	g080M2gnKWzgIm7/75LbQhxR4Eg0YsFRyZ1puuI=
X-Google-Smtp-Source: ABdhPJxZjp+8gF8o8padJL0+IzzLbtZUb75SL2CM/u1HRiY8+G7HYRwykHjohne3jzUWkH/+/7nK2pb8nWzP/J4obWU=
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id i11mr15393249ila.206.1612790507545;
 Mon, 08 Feb 2021 05:21:47 -0800 (PST)
MIME-Version: 1.0
References: <b6580306-fbfb-e7ac-aa4e-2476a5ee39da@linaro.org>
In-Reply-To: <b6580306-fbfb-e7ac-aa4e-2476a5ee39da@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 Feb 2021 08:21:36 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7OC5JeW7rug-JXiGRZRtiirGcBf9jj0geJ2ZuQDBGU-Q@mail.gmail.com>
Message-ID: <CA+5PVA7OC5JeW7rug-JXiGRZRtiirGcBf9jj0geJ2ZuQDBGU-Q@mail.gmail.com>
Subject: Re: linux-firmware for Qualcomm SM8250 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Fri, Jan 22, 2021 at 5:12 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hello linux-firmware maintainers,
>
> We'd like to submit firmware for Qualcomm SM8250-based platforms.
> Firmware successfully tested on Qualcomm Robotics RB5 platform.
>
> The following changes since commit d5288624259300c558480c21a860fcf94187d29d:
>
>    brcm: Add NVRAM for Vamrs 96boards Rock960 (2021-01-09 07:31:33 -0500)
>
> are available in the Git repository at:
>
>    https://github.com/lumag/linux-firmware qcom-rb5
>
> for you to fetch changes up to df822a848cceb185d2d50a39140ba0c9cd9f33e9::
>
>    qcom: Add venus firmware files for VPU-1.0 (2021-01-23 01:10:05 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (4):
>        qcom: add firmware files for Adreno a650
>        qcom: Add SM8250 Audio DSP firmware
>        qcom: Add SM8250 Compute DSP firmware
>        qcom: Add venus firmware files for VPU-1.0
>
>   WHENCE                   |  26 ++++++++++++++++++++++++++
>   qcom/a650_gmu.bin        | Bin 0 -> 41548 bytes
>   qcom/a650_sqe.fw         | Bin 0 -> 31488 bytes
>   qcom/sm8250/a650_zap.mbn | Bin 0 -> 13964 bytes
>   qcom/sm8250/adsp.mbn     | Bin 0 -> 15515796 bytes
>   qcom/sm8250/adspr.jsn    |  21 +++++++++++++++++++++
>   qcom/sm8250/adspua.jsn   |  27 +++++++++++++++++++++++++++
>   qcom/sm8250/cdsp.mbn     | Bin 0 -> 5822228 bytes
>   qcom/sm8250/cdspr.jsn    |  21 +++++++++++++++++++++
>   qcom/vpu-1.0/venus.b00   | Bin 0 -> 692 bytes
>   qcom/vpu-1.0/venus.b01   | Bin 0 -> 7528 bytes
>   qcom/vpu-1.0/venus.b02   | Bin 0 -> 300 bytes
>   qcom/vpu-1.0/venus.b03   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b04   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b05   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b06   | Bin 0 -> 20 bytes
>   qcom/vpu-1.0/venus.b07   | Bin 0 -> 24 bytes
>   qcom/vpu-1.0/venus.b08   | Bin 0 -> 16 bytes
>   qcom/vpu-1.0/venus.b09   | Bin 0 -> 883152 bytes
>   qcom/vpu-1.0/venus.b10   | Bin 0 -> 41360 bytes
>   qcom/vpu-1.0/venus.b19   |   1 +
>   qcom/vpu-1.0/venus.mbn   | Bin 0 -> 1973540 bytes
>   qcom/vpu-1.0/venus.mdt   | Bin 0 -> 8220 bytes
>   23 files changed, 96 insertions(+)
>   create mode 100644 qcom/a650_gmu.bin
>   create mode 100644 qcom/a650_sqe.fw
>   create mode 100644 qcom/sm8250/a650_zap.mbn
>   create mode 100644 qcom/sm8250/adsp.mbn
>   create mode 100644 qcom/sm8250/adspr.jsn
>   create mode 100644 qcom/sm8250/adspua.jsn
>   create mode 100644 qcom/sm8250/cdsp.mbn
>   create mode 100644 qcom/sm8250/cdspr.jsn
>   create mode 100644 qcom/vpu-1.0/venus.b00
>   create mode 100644 qcom/vpu-1.0/venus.b01
>   create mode 100644 qcom/vpu-1.0/venus.b02
>   create mode 100644 qcom/vpu-1.0/venus.b03
>   create mode 100644 qcom/vpu-1.0/venus.b04
>   create mode 100644 qcom/vpu-1.0/venus.b05
>   create mode 100644 qcom/vpu-1.0/venus.b06
>   create mode 100644 qcom/vpu-1.0/venus.b07
>   create mode 100644 qcom/vpu-1.0/venus.b08
>   create mode 100644 qcom/vpu-1.0/venus.b09
>   create mode 100644 qcom/vpu-1.0/venus.b10
>   create mode 100644 qcom/vpu-1.0/venus.b19
>   create mode 100644 qcom/vpu-1.0/venus.mbn
>   create mode 100644 qcom/vpu-1.0/venus.mdt
>
>
>
> --
> With best wishes
> Dmitry
