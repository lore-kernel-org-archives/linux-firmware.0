Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C63CCD184
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Oct 2025 14:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37507C116B1; Thu,  9 Oct 2025 14:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2106EC4CEFE
	for <linux-firmware@kernel.org>; Thu,  9 Oct 2025 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760019805;
	bh=1NPWfFUEpJEEFS0xnpduGTzr3wRRKDQdqJ8tQWtUrSA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Em653l77mye39D0EYos9eGRO3HMfRpnticHFq3blTMn5oTWs0n+pEvHS5A1rIk5jr
	 WkJ4rgRD80RwX08/XvOZXcCHAZqITgkTvGDFmm3cgxPF90WsO/UOCfHtbtVyf3NBx9
	 f91lWziF4m1BbzzTPaUx4EvFSVg0zJvJbVWTMJijNPwwGS4dDDibA282OoUyyoGrzZ
	 1EISFsJRsZ5L0DTV0BsBqXGuSRHirCLjVevwBEUDQRy1PIWwyT8PC6xck4v2ANvqtr
	 8gjvgNGb62Czecqjx9ETmd6dlyjvLIHFmB/RFIF7IUeRNCNdpJh/Ub3hBiTqX181wy
	 4d01YKkrqoHjw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d603a269cso10367867b3.1
        for <linux-firmware@kernel.org>; Thu, 09 Oct 2025 07:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVUQUnB2ScGAoLhKGgn4frqdSuABojpz1t/opbZOTXAdCqbg50MMA9bqi1toM+Zwq3cgDpbckZNJjKyBVt7w==@kernel.org
X-Gm-Message-State: AOJu0YyL2ZbAN7qNdP+WMnxBmOmuKpi8sidr7ZW/8bDLZhD5gRiHGtLi
	m237A4ijgK2ggRwTCqLiMCGIu03Enc6r0oEqRp/C6qk4TLjPPCM+TKKp2XQib5bKWx/QS/HB3eh
	dD5xVHm5DpHfRRaRchDA46icEfWou6Lo=
X-Google-Smtp-Source: AGHT+IENL+1bz9jmIzPqd4DtPmjrTlfgzNpQQmXu2gWJ2HPYhqAnuTOH6qC9nQ4aNGybjV6jHOYw8nVvgbA63zOM/2U=
X-Received: by 2002:a53:c08c:0:b0:639:58f7:f6f2 with SMTP id
 956f58d0204a3-63ccb91b8d5mr6173398d50.45.1760019804216; Thu, 09 Oct 2025
 07:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAPiVHHi2dk5eX2vRqzX014q__WH=-YNghqv-kZgSfbzGvUgJHA@mail.gmail.com>
 <CAO9ioeWCfAFMZEwpC5U=Jh006TR38qhE9uzgTpWnq7YDfSOvHw@mail.gmail.com>
 <CAPiVHHiTQpEgC7Fs4qYQJ_N3a+nT2LGKD3xkwjBfmfyD08SZgQ@mail.gmail.com> <zsddtjaefzbj3flnddfiac63hdhrid6vadziguyufd3nvxbczs@56ewmb74font>
In-Reply-To: <zsddtjaefzbj3flnddfiac63hdhrid6vadziguyufd3nvxbczs@56ewmb74font>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 9 Oct 2025 10:23:13 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6yq8AG+pjFtMYbgzysL=Zgb9DXAo0nUbfhGO1nCmVHdw@mail.gmail.com>
X-Gm-Features: AS18NWCKKTCnECBbQfrfEmXcWKGm3Op9nj_7Gm1DoDKKhUJpkD4K1cm125xcFVQ
Message-ID: <CA+5PVA6yq8AG+pjFtMYbgzysL=Zgb9DXAo0nUbfhGO1nCmVHdw@mail.gmail.com>
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>, linux-firmware@kernel.org, 
	hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 10:07=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Oct 07, 2025 at 12:22:46PM +0530, Janaki Ramaiah Thota wrote:
> > On Mon, Oct 6, 2025 at 5:21=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, 6 Oct 2025 at 14:18, Janaki Ramaiah Thota
> > > <janaki.thota@oss.qualcomm.com> wrote:
> > > >
> > > > Hi linux-firmware maintainers,
> > > >
> > > >  Here's a pull request for bluetooth firmware. Please let me know i=
f
> > > >  you have any problems.
> > > >
> > > > The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf5=
43f59034:
> > > >
> > > >   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:3=
6:21 +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD
> > >
> > > This commit changes the default NV dump, but leaves two board-specifi=
c
> > > files untouched. Are they still compatible with the new firmware?
> > >
> >
> > Hi Dmitry, Thanks for the quick review!!
> > Updated the below pull request with updated remaining two files
>
> Thanks!
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/727

josh

>
>
> >
> > The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f5=
9034:
> >
> >   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21=
 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD
> >
> > for you to fetch changes up to e06a43b9eee777b8fd9197c09b50c8744118e8d7=
:
> >
> >   qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> > (2025-10-07 12:14:26 +0530)
> >
> > ----------------------------------------------------------------
> > Janaki Ramaiah Thota (1):
> >       qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> >
> >  WHENCE           |   8 +++++---
> >  qca/msbtfw11.mbn | Bin 202276 -> 202464 bytes
> >  qca/msbtfw11.tlv | Bin 190064 -> 190252 bytes
> >  qca/msnv11.b09   | Bin 5847 -> 5885 bytes
> >  qca/msnv11.b0a   | Bin 5847 -> 5885 bytes
> >  qca/msnv11.bin   | Bin 5905 -> 5885 bytes
> >  6 files changed, 5 insertions(+), 3 deletions(-)
> >
> > > >
> > > > for you to fetch changes up to 64b8572f8542709bb9331fd30da0165c4ecf=
dc24:
> > > >
> > > >   qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> > > > (2025-10-06 16:18:31 +0530)
> > > >
> > > > ----------------------------------------------------------------
> > > > Janaki Ramaiah Thota (1):
> > > >       qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-0=
0100
> > > >
> > > > Thanks,
> > > > Janakiramaiah Thota
> > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >
> > Thanks,
> > Janaki Ramaiah Thota
>
> --
> With best wishes
> Dmitry
