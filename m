Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B5FCAC5BB
	for <linux-firmware@archiver.kernel.org>; Sat,  4 Oct 2025 21:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EADE3C4CEF7; Sat,  4 Oct 2025 21:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6887C4CEF1
	for <linux-firmware@kernel.org>; Sat,  4 Oct 2025 21:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759613812;
	bh=Pj/BRYrzRQOinZs8wONhF5Wotx2bOwWtKMaivX1ELrE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=u6YPko6g/oUFmOgJYah0pZpoCY090ejihQvcsu2mBWrlswELTAeeD2R5xB5iCHD1H
	 14wiYaELAijRibjJpB6uvLkxQSguY+baPEpe3M2y7mt0UqfZHjKs/JbTclwnNKDtmV
	 ZqlhFRylXHDRUsKOQaHwBG/QcRDhOdWd4XyYVK2RBfiF9jG0z0uJBsCxaUPMcwZdpW
	 +Pcs/rZHnijBLpUO7fAhNbZORz8QFjwvGLv0jjunWcXJzxyBJ4p4LZUTEmgqP+BVSA
	 3+6XP2dkT8/CoMK7OmuPe/fALeZ0vDI5bosT6/NGXOHMPooNKb26zdEAokarOW+FiH
	 1sbtfBAObzvAw==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-636d5cefab2so4878068d50.2
        for <linux-firmware@kernel.org>; Sat, 04 Oct 2025 14:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+k1PhJxG8NAbuRz3sShTjXwWyJoBrPXKK/ROwZjFK1KC5P8BhfUErku256d3S/tDONIqOckXYxvk1Q3IqlA==@kernel.org
X-Gm-Message-State: AOJu0YyyPc3jE+wOuZ/Pu7vbqbRrA0UA2677r1yZXkNyEK1esSq/BtZy
	e9wE4Zx+wDsPp8S7fOMZrzvrnDmzO/Hp+isLBs78c2uU7IOOG614tRgHz08dH98Il4yYvtGc8WO
	/q5p/E1W2NdDBAdx/qiCm2yHD9lWiZBM=
X-Google-Smtp-Source: AGHT+IFyzZ9rbR+ZlrWlVRWxc3HQlhIN9z5lWApVcyb1pHwZ/cMt7IoqLdjg+WdIwTzWnm54qghYrTRCsH5xKG6ye9M=
X-Received: by 2002:a53:df4d:0:b0:636:d6b9:4c9e with SMTP id
 956f58d0204a3-63b9a0724c8mr5558009d50.5.1759613812031; Sat, 04 Oct 2025
 14:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <eecbbdb8-d60c-4fb7-8401-78e6109075ec@oss.qualcomm.com> <bqtfijdhbw3gkbtvcqrw6f7qll23cxiuhmo7etbhu2wwhxgpnq@evzypybztiti>
In-Reply-To: <bqtfijdhbw3gkbtvcqrw6f7qll23cxiuhmo7etbhu2wwhxgpnq@evzypybztiti>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 4 Oct 2025 17:36:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5U=v+-yzT6PTxfRnA5cEgdWh+cfefNwt4Q+gvcbbNTsg@mail.gmail.com>
X-Gm-Features: AS18NWDeo1jJsYEHUkGFvnFR15hb7-QQEIUYMkOyymoBgB-kizBZwOkGhqbzyNw
Message-ID: <CA+5PVA5U=v+-yzT6PTxfRnA5cEgdWh+cfefNwt4Q+gvcbbNTsg@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Venkata Kota <venkata.kota@oss.qualcomm.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/724

josh

On Sat, Oct 4, 2025 at 4:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Oct 04, 2025 at 12:16:00PM +0530, Venkata Kota wrote:
> > The following changes since commit 757854f42d83aab44a72eedded3485887798=
a4fd:
> >
> >   Merge branch 'amd-staging' into 'main' (2025-10-04 00:13:39 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > dsp-fw-sa8775p-dsplemans-163
> >
> > for you to fetch changes up to 80e2ccb38d412e80e2232242dab1bf5631e78560=
:
> >
> >   qcom: Update DSP firmware for sa8775p platform (2025-10-04 12:08:29 +=
0530)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> --
> With best wishes
> Dmitry
