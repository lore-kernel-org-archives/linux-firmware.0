Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76938C28B30
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Mar 2025 11:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B482C4CEEC; Thu, 20 Mar 2025 11:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2545EC4CEEA
	for <linux-firmware@kernel.org>; Thu, 20 Mar 2025 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742471383;
	bh=sQrrHdnQfG1uyUNF3xUuzKAPXpzVZoqvxGAHiSlHExs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=kvuw6e3+F/DJpNbHiRyUfmlGlUT/a0lraYH6ZvNX7GxRfjW0uprkfpg8HOUHVUtCs
	 6NL1Bv7lQ7NIsPsKuQUtNlPFFaI0Xix0afsX7+lgoPO8Bx/fFG4u7UJOTiJUXQa/tz
	 CQWP/eN7j+a9CIsP3t6f2me2ytZ7mfbJtN23dDFHWeO7fHA6124yjZjr8kqx3JhJ2e
	 f1Ms+FHdnZhHLfs1t20xOL6/Byk5k4LCon2N4BYk0Ul9j/GqKw6eUgVk7DgSKhMoVS
	 I1M/TFmpFAVy6RFqpvhPTcqT/deIoNlBtyWyENYevK4W6pmMgXZc7eGpXT0L0P94CF
	 zaf1RrsfWzOIA==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso531883276.1
        for <linux-firmware@kernel.org>; Thu, 20 Mar 2025 04:49:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YyojIMxGiLF/2ez89uO7buLj60XVWSBwI3nZReYyK2CYbeGGQCV
	kehQu05WEu1xyFhfNFdYK0Q7NuMt5+x/1+zpW/EpmYJywqm+yM8/tHcxRZ/5lwaFYISWWvjUBKb
	EFfnVVD2gj1L6mJB9F6PMm6mlcnU=
X-Google-Smtp-Source: AGHT+IFMKJGKDWHS+B5igNNNYbIVi2TiHY0A4J6ezVBJTPcu36mPVsoxu3X2gv9+zgWl5gGANYLLi4VJGy+McH3UlBI=
X-Received: by 2002:a05:6902:120d:b0:e60:a3f1:b13b with SMTP id
 3f1490d57ef6-e667b3c3145mr8328159276.18.1742471382309; Thu, 20 Mar 2025
 04:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250320091503.16427-1-andres.traumann.01@gmail.com>
In-Reply-To: <20250320091503.16427-1-andres.traumann.01@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 20 Mar 2025 07:49:31 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6ODw9Mc-M1Vg8SQz7CqeqdhNbZc_cRxDkMXv7jTSWX3A@mail.gmail.com>
X-Gm-Features: AQ5f1Jpk_op0yAMy00BOANOEmRAiBRHF2O1wgu72H5HA1VpWoWFLAOnjBsSvM_I
Message-ID: <CA+5PVA6ODw9Mc-M1Vg8SQz7CqeqdhNbZc_cRxDkMXv7jTSWX3A@mail.gmail.com>
Subject: Re: [PATCH] cirrus: Add cs35l56 firmware symlinks for Asus UM5606KA
To: Andres Traumann <andres.traumann.01@gmail.com>, 
	Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 5:15=E2=80=AFAM Andres Traumann
<andres.traumann.01@gmail.com> wrote:
>
> Symlinks previously existed for amp1 and amp2, but amp3 and amp4 were fai=
ling to load.
>
> Signed-off-by: Andres Traumann <andres.traumann.01@gmail.com>
> ---
>  WHENCE | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/WHENCE b/WHENCE
> index 6b3506d8..85247beb 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7935,6 +7935,8 @@ File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-a=
mp2.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431264.wmfw -> cs35l56/CS35L56_Rev3.=
11.16.wmfw
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp1.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp1.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp2.bin
> +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp3.bin
> +Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin -> cs35l56-b0-dsp1-m=
isc-10431df3-amp4.bin
>  Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw -> cs35l56/CS35L5=
6_Rev3.11.16.wmfw
>  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
>  File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin

Simon, any issues with this?

josh
