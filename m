Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06013C433FE
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Nov 2022 12:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E29D8C433D6; Wed, 30 Nov 2022 12:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8A1C433D7
	for <linux-firmware@kernel.org>; Wed, 30 Nov 2022 12:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669812911;
	bh=AUYnDfwFIk6wJJbRcYArkwpRhFp+dv331HmdxZwBWQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=SUqD9DTmGPbkkncyIy/lxgUaF2qmj/IvMZ0I4mbPm45TcKD/M7/2Oej10GF29ckwn
	 pXIKsfV3yCjMM8aCSNce+RShq6PhZPBY0ZwmrDvhfJwSMdcw3wIJwH6sW+8tnQOqR3
	 a7nSTT/rSZgCY+WaavEq4BKZjQKnACWs4gIGRC//dwzpQcTfH3XIStEQdjzhHorE/3
	 PW87/WOgdnkujhmFZauf+limxhTO+7s+KzGdUP5QX3r0pG3QXLph8qZasvx7uRvvl2
	 IjQ1bf3eGMOyq6Up4tl2ilbdopKt8Bj/CF1wX99YspIwq7YJyVcx1BWXG4DoYpP1VP
	 /gRkl57L/k29Q==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-14286d5ebc3so20850674fac.3
        for <linux-firmware@kernel.org>; Wed, 30 Nov 2022 04:55:11 -0800 (PST)
X-Gm-Message-State: ANoB5pkuRU1m46QOnMMvXyT71s1weDuvc9AtzMlJomzK2Xgw/fhAC/aJ
	4Yutl74cAQ9yGwBNXDWZTKiRZwIIP6ZRm+sRlLY=
X-Google-Smtp-Source: AA0mqf6AP+RG2NYZ66FzLU6sF1SOCUbpQIFsBKiI+IMX1CPI3CC9qh5b+yyEUqqIJQ/tPfxW1ZFGdlQZndsYSQ2TfWE=
X-Received: by 2002:a05:6870:8a28:b0:13b:b528:1b8e with SMTP id
 p40-20020a0568708a2800b0013bb5281b8emr26504766oaq.3.1669812911029; Wed, 30
 Nov 2022 04:55:11 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_O3uUj4SHq9_zuE=TOB0iOyMbkSPJRjxRc0NgBPM44dvw@mail.gmail.com>
In-Reply-To: <CADnq5_O3uUj4SHq9_zuE=TOB0iOyMbkSPJRjxRc0NgBPM44dvw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 30 Nov 2022 07:55:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7d=Qd35HeKoVWO2+x0r_NOE=i2krFw8HWUzsUdvC7Esw@mail.gmail.com>
Message-ID: <CA+5PVA7d=Qd35HeKoVWO2+x0r_NOE=i2krFw8HWUzsUdvC7Esw@mail.gmail.com>
Subject: Re: Updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, Nov 29, 2022 at 2:29 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> New sdma firmware.  Please apply!
>
> Thanks,
>
> Alex
