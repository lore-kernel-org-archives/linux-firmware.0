Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81710C48BF8
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B1E2C43399; Mon, 19 Feb 2024 12:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557BCC433C7
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347212;
	bh=HzXC9QPB6X5VVLQLHf9254CrLgb+WKDpEJOP2Siw+/s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OMvYHo/VamZR/fXbW2saES9P8XCxR+8lpbQNCeThd9RvxbQjUYpjaKBk4a1wZBOBj
	 zrMSbTyTC90BKNsNAcY5b2mXHMBHJLyI6rRCa0vw7pCdE5GYpTTbiUKukqo915k0bO
	 zCYHI2wrFacboeVXP7n0kwDie4+1xP8YDqSpsnX1FKdlmsvTvN1Spxb3juG3ksthDY
	 jiloMfPqRXTsjRrQSJ9+2j+sECHl80LIedu0Y4T+hTA3x11y86puxpg0zmaV7GzHEX
	 iaHWCjKjjnY5zMsuNZab3FK+hs1CPMWdWlJlx9EesdUbxbtPMJOkHvLPl9mIwPaBcc
	 hoyrPNroieFaQ==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6002317a427so34737157b3.2
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:53:32 -0800 (PST)
X-Gm-Message-State: AOJu0YyUjCKAPwDVjac2NMlxWMD7OkftjPjWz3PBtQXfxFxLWXFC/B9m
	blzx4ulqRH5M2/o3JKjJzDBDElk1SxU/aSvtOQgPz+OuSd6VzD0dShLATsliRRSSKvTTqSxTRBY
	VyfXBGIinUMUNgi4f10H2gkwwUWY=
X-Google-Smtp-Source: AGHT+IFcE37YZQoWW38HX8DQqn8iE4l3mZ5+Ox4g6bihcBI8qv8fh3P/pVlY113Bj9sXr+H1g5uvpTD/bmMTFC7hN8E=
X-Received: by 2002:a81:b614:0:b0:607:f4b9:11aa with SMTP id
 u20-20020a81b614000000b00607f4b911aamr9788920ywh.21.1708347211526; Mon, 19
 Feb 2024 04:53:31 -0800 (PST)
MIME-Version: 1.0
References: <CANHAJhGVU=h1+4WLMW-LW=U5-+vXozxkp-HC=CcCbXUHCZqd_g@mail.gmail.com>
In-Reply-To: <CANHAJhGVU=h1+4WLMW-LW=U5-+vXozxkp-HC=CcCbXUHCZqd_g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:53:20 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5_jLiKKngz_fiebkTgkQ1gfPwttgVpZipCTENwq9U+yA@mail.gmail.com>
Message-ID: <CA+5PVA5_jLiKKngz_fiebkTgkQ1gfPwttgVpZipCTENwq9U+yA@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 venus firmware update
To: Nathan Hebert <nhebert@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm@vger.kernel.org, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Fritz Koenig <frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 2:42=E2=80=AFPM Nathan Hebert <nhebert@chromium.org>=
 wrote:
>
> The following changes since commit b4b04a5cbcbb0f67d0d63fa66aa68f32b9dc5f=
a7:
>
>   Merge branch 'amd-staging' into 'main' (2024-02-03 04:45:27 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/nathan-google/linux-firmware.git sc7180_vp9_decoder_=
fix

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/149

josh

>
> for you to fetch changes up to 52ac76144aa006c284e509cbb02772c9264bfd15:
>
>   qcom: update venus firmware file for v5.4 (2024-02-07 11:15:07 -0800)
>
> ----------------------------------------------------------------
> Nathan Hebert (1):
>       qcom: update venus firmware file for v5.4
>
>  WHENCE                   |   2 +-
>  qcom/venus-5.4/venus.mbn | Bin 921236 -> 922240 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
