Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3926CCA1005
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 11:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22C84C4CEF9; Tue,  2 Sep 2025 11:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD5BC4CEF5
	for <linux-firmware@kernel.org>; Tue,  2 Sep 2025 11:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813699;
	bh=nvf/MT1EYta6WKY/b5xFRmYsirqsNoNJo+2orQEw2DU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HVZe861zuthN41E+Quf9i/P6GLCTffTUIixv1S+FZKDxjwHs8QzKuJIKJ9HMjr7+u
	 c/wxlWEKn7/aK0wtHWqohjiTDQZGGExhLIyZzYY8mF4UrUjyBQ4/0jFfT9AdWkPpkK
	 OBiUVEGpVIFmuFs5v61+HCXovWuHt7z5MVrRi4YI+BM/dzJXXHo50BR3/JsX7XiwQU
	 wNU7vlLBV7jiEAUxh89YjzztXq+IREVvnNh7AayGJGpmHumWfAgEjYuKQdrL+oBp3e
	 dHDmowMVwd5gef9rTZbLhR7fprEc8UGeyGTKOspIWfN/k3/uptsQ5+H2anUHX9r9S3
	 sjJcHQez6diJg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-71d60504788so42807487b3.2
        for <linux-firmware@kernel.org>; Tue, 02 Sep 2025 04:48:19 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywvg4Uir7+Ol+C2pFmJLxmL302HWLTHTumTmEl8giKAppf1Pnpn
	i2Tw1rPAS4jOIowTZN3Uw33b3t99dIPqa/ImmsC0QlnlWxR7FHlpJBvufwlVX5Our/QKXW/2tND
	qn+I+B5j9UcHil3TtFbhUkXfiORbyvQE=
X-Google-Smtp-Source: AGHT+IG+Gk8MS2zXVG+y1RjiOr/1wJT7yxYScwc4fbDGYCnyt0Ix4lics+7qlzbhr0KTFR/65sqsyFpEIbEkZyib1ww=
X-Received: by 2002:a05:690c:3510:b0:71f:b944:101a with SMTP id
 00721157ae682-7227658c744mr133550107b3.53.1756813698283; Tue, 02 Sep 2025
 04:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250901145934.86404-1-jun@zzy040330.moe>
In-Reply-To: <20250901145934.86404-1-jun@zzy040330.moe>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Sep 2025 07:48:07 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6W+7Mdt_ZHFfwOS4qXAWm3oyKp6V7Aff5Tvy5fumBJKw@mail.gmail.com>
X-Gm-Features: Ac12FXySg6URB8Dhor-oiBVhEH8bLuGBNOigAzA1y0RgBnqPcOr120J48ySjghE
Message-ID: <CA+5PVA6W+7Mdt_ZHFfwOS4qXAWm3oyKp6V7Aff5Tvy5fumBJKw@mail.gmail.com>
Subject: Re: [PATCH] cs35l56: Rename firmware for Thinkbook 16P Gen6
 (17AA3921) without multiple speakers
To: Ziyu Zhou <jun@zzy040330.moe>, Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Simon,

Any thoughts on this one?

josh

On Mon, Sep 1, 2025 at 10:59=E2=80=AFAM Ziyu Zhou <jun@zzy040330.moe> wrote=
:
>
> Remove the 'spkid1' suffix from
> cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp*.bin and its corresponding
> wmfw symlink, since Thinkbook 16P Gen6 (Subsystem ID 17AA3921) does
> not have multiple speakers. The suffix prevents the kernel from
> finding the correct firmware, which leads to very low speaker volume
> and the error message: ".bin file required but not found".
>
> Signed-off-by: Ziyu Zhou <jun@zzy040330.moe>
> ---
>  WHENCE                                              |   6 +++---
>  ...1.bin =3D> cs35l56-b0-dsp1-misc-17aa3921-amp1.bin} | Bin
>  ...2.bin =3D> cs35l56-b0-dsp1-misc-17aa3921-amp2.bin} | Bin
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename cirrus/{cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin =3D> cs35l5=
6-b0-dsp1-misc-17aa3921-amp1.bin} (100%)
>  rename cirrus/{cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin =3D> cs35l5=
6-b0-dsp1-misc-17aa3921-amp2.bin} (100%)
>
> diff --git a/WHENCE b/WHENCE
> index 2161ec89..7cd782b3 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -8295,9 +8295,9 @@ File: cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0.wmfw -> cs35l56/CS35L5=
6_Rev3.11.21.wmfw
>  File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin
>  File: cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin
> -Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1.wmfw -> cs35l56/CS35L5=
6_Rev3.11.21.wmfw
> -File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
> -File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
> +Link: cirrus/cs35l56-b0-dsp1-misc-17aa3921.wmfw -> cs35l56/CS35L56_Rev3.=
11.21.wmfw
> +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
> +File: cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1.wmfw -> cs35l56/CS35L5=
6_Rev3.11.21.wmfw
>  File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin
>  File: cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin
> diff --git a/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin b/cirru=
s/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
> similarity index 100%
> rename from cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin
> rename to cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp1.bin
> diff --git a/cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin b/cirru=
s/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
> similarity index 100%
> rename from cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin
> rename to cirrus/cs35l56-b0-dsp1-misc-17aa3921-amp2.bin
> --
> 2.51.0
