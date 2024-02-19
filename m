Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF30C48BC3
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 268F8C43390; Mon, 19 Feb 2024 12:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1114FC43394
	for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 12:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347384;
	bh=JxhizZu9OAg7BuPn0n0EruAEebeqJDlBoRyN4CL0J4k=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IZOnIAr5+oxmSce3DUimfVFdltdUoSTVRN7TNQRBArAbU9kd4sX9+EWDAXU4i4wvW
	 7uSjuubtoXcbQTQcsNsNqXHsCoGttyOEOdfdFcxUDof4PDDeatwAajngBIlk6WbTT+
	 jwC6ZKSy0EI0S3mZb3FwFKZ+Lj5v8q5tJepUftPBiz7LuWC9AVuPsXpBN9lWF0M+sk
	 kYZM515HP7dy1uyZmu6wGGlfbTImzSMCFN6eU96k4QJES+pxWCv+DToygELCv0nFfv
	 XeEX39C5KkZtpANQOrVR17VXeO3z+0DfNguTfH8B7jIjfixwGExxxAkXeyTSvEOrTv
	 DJKvB937/VhQQ==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6083befe2a7so8191727b3.0
        for <linux-firmware@kernel.org>; Mon, 19 Feb 2024 04:56:24 -0800 (PST)
X-Gm-Message-State: AOJu0YyjLVFLYEnJFIHFi/Bex4qf6VeX5Yyg9k4uKfR3xFGjE0VAp5er
	wZaH3XqbMoVQeQOumOdefdGoG+/AeJRFV9JwF4nWFohKKZ9MvRWU2H77PYGXOLtH73PzmYR2LNT
	nN1XaxSnbh+/TQ6llzju7YirjyDw=
X-Google-Smtp-Source: AGHT+IGsISyLvMOfaFiZGrcqa8y8y+u8MwyxJt7T5uOseQTwnh/Tkl/3iYQJITvf3HzKWc/xBlOaqBqnhJcEOMO9lnw=
X-Received: by 2002:a81:914a:0:b0:604:f681:a1 with SMTP id i71-20020a81914a000000b00604f68100a1mr12086216ywg.16.1708347383229;
 Mon, 19 Feb 2024 04:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20240206042416.GB5111@craftyguy.net>
In-Reply-To: <20240206042416.GB5111@craftyguy.net>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:56:12 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7t+2U-XOd0zXEagjNPd2_egk-piX5hEG7nJxNZuOjkXA@mail.gmail.com>
Message-ID: <CA+5PVA7t+2U-XOd0zXEagjNPd2_egk-piX5hEG7nJxNZuOjkXA@mail.gmail.com>
Subject: Re: firmware files located in root of repo
To: clayton@craftyguy.net
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 7:24=E2=80=AFAM <clayton@craftyguy.net> wrote:
>
> Some distributions shipping linux-firmware (e.g. Alpine Linux) split the
> linux-firmware project into multiple packages based on subdirectories in =
the
> repo, e.g. /amdgpu might be in a linux-firmware-amdgpu package, to allow =
for
> reducing the rootfs size. Distro images and users can install only the fi=
rmware
> they need. Ideally, for this use case, all vendor firmware in linux-firmw=
are
> would be in subdirectories.
>
> iwlwifi makes this more difficult to support. I called out iwlwifi becaus=
e 1)
> the collective size is large (~175MB, almost 20% of the entire linux-firm=
ware
> repo), 2) there are other "free floating" firmware files at the root of t=
he
> project but it is by far the worst "offender".
>
> Is there a reason why iwlwifi (and other) firmware is in the root of the =
repo
> and not in some subdirectory ('intel' ?) ?

Historical mostly.  But the kernel needs to look in the correct
location for the firmware before it can move.

josh
