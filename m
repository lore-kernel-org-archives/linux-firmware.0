Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E82FCCF9F4
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Sep 2023 11:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3871C116C8; Thu,  7 Sep 2023 11:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA645C116C9;
	Thu,  7 Sep 2023 11:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694085514;
	bh=mfq3Jl70B8GlcGZbGgf1Oer3LauCYXws+aAY8c8wnr0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nz30A9gq8NaDiajpsbAhpFH+NxF6QC+fwmJpd/UJ6B2HZuLAckg7//hJU/E6xCMzj
	 yXavRsROrevphS8VdoWcuuy5v/DMv2o/TVgU8Za3hDvFTpKa71yzDcRMG6vQFqhqRd
	 JXLvYeYMmycproID6KcNU0d3/O3bSLiqnoFI8fE+0WbkLFEHpCXlMRQbEnu3ujIcaY
	 4jhaBTaDQMsjYUKMeKgLzob2nsnLYB4ZeFjMqjP6IcLbNcazudvdSgA7VBnw35FT9i
	 DEXRoj3DCIlmTTn+ZBADkCecdLHAljbm3nua95LCcYn8GMj4ty5aoosTQAavJ8qCTv
	 otRxNpKQrRNPA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58caaedb20bso8715437b3.1;
        Thu, 07 Sep 2023 04:18:34 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxy17yKVP7GaMYIoY+UNnxpUZ9JNK1PkjWQNStFevhkZY0JqMbK
	mHrvi8JsFVak1ONY8uPEVEu0ZynYS2WhxjJ9VR8=
X-Google-Smtp-Source: AGHT+IEs3f0X13JeJb5Gp19fdVmYC9Kc1l/7+u0ibf8L/d2BufTDw/euqe85XQ4AzyVJyXsNziAcZyQ+GHpJVzQ1lXc=
X-Received: by 2002:a25:5091:0:b0:d77:81e2:e9b2 with SMTP id
 e139-20020a255091000000b00d7781e2e9b2mr18190521ybb.45.1694085513931; Thu, 07
 Sep 2023 04:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <7d49d791-bea2-e163-d8db-71866cf7713b@linaro.org>
In-Reply-To: <7d49d791-bea2-e163-d8db-71866cf7713b@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 7 Sep 2023 07:18:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7E9GEqBQpcXj0tqebfr3MaWnn-9EvOBY9UgaouBDnM-A@mail.gmail.com>
Message-ID: <CA+5PVA7E9GEqBQpcXj0tqebfr3MaWnn-9EvOBY9UgaouBDnM-A@mail.gmail.com>
Subject: Re: [GIT PULL, v2] Add soft link for Audio topology firmware for
 SC8280XP X13s platform
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 
	"dmitry.baryshkov@linaro.org >> Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 6, 2023 at 9:02=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
> The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade9=
01:
>
>    Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +00=
00)
>
> are available in the Git repository at:
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git
> sc8280xp-audio-fw-fixes

Pulled and pushed out.

josh

>
> for you to fetch changes up to 7d94e0fa84701f0c01877c21cf4857f94fd367ab:
>
>    linux-firmware: add link to sc8280xp audioreach firmware (2023-09-06
> 05:55:50 -0700)
>
> ----------------------------------------------------------------
> Srinivas Kandagatla (1):
>        linux-firmware: add link to sc8280xp audioreach firmware
>
>   WHENCE | 1 +
>   1 file changed, 1 insertion(+)
>
