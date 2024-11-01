Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2BBE6B278
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Nov 2024 13:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A5CDC4CED3; Fri,  1 Nov 2024 13:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CBBC4CED2
	for <linux-firmware@kernel.org>; Fri,  1 Nov 2024 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730467792;
	bh=cXH71nPvj8JAAmQmV6mxtvWV8Xo9JST9alZiZB8stNY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nZhjsL8eQkCELvGlANjsUJdUhB4P8YtirUoBG6TPVFasNcAN3Mpd2heZWexojPbN4
	 vvcrhPELSqqIvEX57xm89cQlrGo9QPLevFm4M7T8625RuB/OieC6OWoiahaet/wvg9
	 /ezcRpO46Of92F60Rc5eU0WVsJMrzCDDnTy3v6ZWwHpI7WPWGR37Wlu+IzmHWC5b00
	 m+tVldVonbiUSgwmYAS/HXA7RUwuv3aFXYhO0d0nu5Qa4oHdU7HbB3jL6RKfQ5Y4/X
	 sTpvZm9K0Q/4pQ7sTZUh4fBEAKnTcWat9+bilg/vyEg4UZImXOEXEZ2xYmU9ES/Sjy
	 iYCkHULULHFZw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb51f39394so17820381fa.2
        for <linux-firmware@kernel.org>; Fri, 01 Nov 2024 06:29:52 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw5EYbKPdllW3PxTW7ZfVa0BYvA8FmlfcxugWUebfY9AOiSLs8N
	CAvBTyNAeXTM8HM5Lb6KXmb42c8EAyCGOfdU1hmJ1lXxcOIpUigjXikduujzM+0LtsX0kF+sVdG
	xdOI6C/fbC7WG6jPnJvlRFkkGGys=
X-Google-Smtp-Source: AGHT+IEzpSkdqkl0VdRpFHTp02OOtePMJE/WQugT8zMkNHig7VIE/IFcZFqI3ILZEENR+Xga3n9NHmN89Hh08AmGEmI=
X-Received: by 2002:a2e:4c12:0:b0:2f6:57b1:98b0 with SMTP id
 38308e7fff4ca-2fcbe0c3a14mr95369741fa.42.1730467791199; Fri, 01 Nov 2024
 06:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <001801db2bbe$4e62ccc0$eb286640$@opensource.cirrus.com>
In-Reply-To: <001801db2bbe$4e62ccc0$eb286640$@opensource.cirrus.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 1 Nov 2024 09:29:34 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7mXH=T3C+ZVbCDrgY+9k+Myz0JR_UptUQ8C4TLO9r55g@mail.gmail.com>
Message-ID: <CA+5PVA7mXH=T3C+ZVbCDrgY+9k+Myz0JR_UptUQ8C4TLO9r55g@mail.gmail.com>
Subject: Re: [PULL v1 linux-firmware] Update firmware for Cirrus Amps for some
 HP laptops
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 1:57=E2=80=AFPM Simon Trimmer
<simont@opensource.cirrus.com> wrote:
>
> Hi,
>
> We=E2=80=99d like to update the firmware for the Cirrus CS35L54 and CS35L=
56 smart amplifiers for some HP Laptops.
>
> Thanks,
>
> -Simon
>
>
>
> The following changes since commit 3c9f887a81aea0a69a3ec141602fef15603b56=
f4:
>
>
>
>   Merge branch 'robot/pr-0-1728627648' into 'main' (2024-10-29 13:04:21 +=
0000)
>
>
>
> are available in the Git repository at:
>
>
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20241031

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/350

josh

>
>
>
> for you to fetch changes up to a6f3ab98d416a311bb24c4b4cddf8276d4e699d2:
>
>
>
>   cirrus: cs35l56: Update firmware for Cirrus Amps for some HP laptops (2=
024-10-31 17:54:09 +0000)
>
>
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Update firmware for Cirrus Amps for some HP laptop=
s
>
>
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp1.bin | Bin 7104 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8c-amp2.bin | Bin 7100 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp1.bin | Bin 7108 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8d-amp2.bin | Bin 7108 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp1.bin | Bin 7108 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8d8e-amp2.bin | Bin 7108 -> 7040 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp1.bin | Bin 7100 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e14-amp2.bin | Bin 7096 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp1.bin | Bin 7108 -> 7040 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e15-amp2.bin | Bin 7108 -> 7036 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin | Bin 7168 -> 7100 bytes
>
> cirrus/cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin | Bin 7172 -> 7100 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp1.bin | Bin 7172 -> 7100 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-103c8d90-amp2.bin | Bin 7172 -> 7100 bytes
>
> 14 files changed, 0 insertions(+), 0 deletions(-)
