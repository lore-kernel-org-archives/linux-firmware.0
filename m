Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED671C04A94
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Aug 2023 10:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D47FAC433C7; Fri,  4 Aug 2023 10:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4B2C43391
	for <linux-firmware@kernel.org>; Fri,  4 Aug 2023 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691145123;
	bh=H4fDLrS7YKbniZ0WamNnnNoYK2Eahy5a4It780gtcvw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AwgSwZbDmQ8U/upV0bP0u9DZEfkYUxHTsNT47Gsl70bqudACmYd20up/DY/tO6VMh
	 SLEwff1Hhyss4wnJkIwh68NQcITMNc7rtpre8BRvratfUiSCQBxE0QriQC10/MKAp3
	 bPNi+EomE7YJQ0p1V9x7owfSgJklO0wOScX9dENbDqW4AVQo8Y66ao0HyNqrK2LGOX
	 67P/W/8VM1b7FzXdI9nW/FpHt2gz2lqTiZwrme2RvDNECh2qDXXts9PZfUPEFG9DMG
	 LEXTO/s12+mTjANZmaqTONuXc0u0Mw+H7N5jpoSskmwJNstOHmtliVed3jMHZA1Qix
	 P/aOM0RJPVU7g==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d18566dc0c1so2227484276.0
        for <linux-firmware@kernel.org>; Fri, 04 Aug 2023 03:32:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YwYjzwyUXHRCbfV7WaPIkkIVbt7EyokwVNwf7AFKaFicZQOGx4m
	8lGbZIVnTpsHlbypELjZu8okny89XMEKZFk6DbE=
X-Google-Smtp-Source: AGHT+IHnxjKYoPDrRUlgPcIkJoWBb7XKoV1l4ePWFhqSRS7vYQB5oxSaYEkajEQZGSkMetQ9g3bJocKX/+NrQouKjN0=
X-Received: by 2002:a5b:3cd:0:b0:c5d:953b:db6 with SMTP id t13-20020a5b03cd000000b00c5d953b0db6mr1046853ybp.41.1691145122681;
 Fri, 04 Aug 2023 03:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230801140504.1855-1-neeraj.sanjaykale@nxp.com>
In-Reply-To: <20230801140504.1855-1-neeraj.sanjaykale@nxp.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 4 Aug 2023 06:31:51 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6vOjPsBcp+tjGwXzMZhF+qYmUVWy=LYH+HzhjEtPaKAQ@mail.gmail.com>
Message-ID: <CA+5PVA6vOjPsBcp+tjGwXzMZhF+qYmUVWy=LYH+HzhjEtPaKAQ@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: Add URL for latest FW binaries for NXP
 BT chipsets
To: Neeraj Kale <neeraj.sanjaykale@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, amitkumar.karwar@nxp.com, rohit.fule@nxp.com, 
	sherry.sun@nxp.com, kundan.kumar@nxp.com, ashish.patel_2@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, Aug 1, 2023 at 10:05=E2=80=AFAM Neeraj Kale <neeraj.sanjaykale@nxp.=
com> wrote:
>
> Adding URL to find latest FW binaries for btnxpuart driver.
>
> Signed-off-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
> ---
>  WHENCE | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index e53002fb..bea94f74 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6332,6 +6332,8 @@ Version: 18.99.1.p154.40
>
>  Licence: Redistributable. See LICENSE.nxp for details
>
> +Originates from https://github.com/nxp-imx/imx-firmware/tree/lf-6.1.22_2=
.0.0/nxp
> +
>  ------------------------------------------------------------------------=
--
>
>  Driver: qcom-sc8280xp - Qualcomm ASoC tplg Firmware
> --
> 2.33.0.windows.2
>
