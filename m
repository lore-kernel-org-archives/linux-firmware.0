Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77586C77B73
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Apr 2023 13:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F61EC4339C; Thu, 27 Apr 2023 13:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286A8C4339B
	for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682601068;
	bh=8+NkhmLbADoNtjd+KuD9OGcjfxRR7aSyZM9t2/d706U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=KXnAZxAjQ6mKB7mehH+iJ/rAD9iiTwl0J512stWdcC+gT+IIO8ppqwa068bc0C6pG
	 VIb4ZSY2ME0Qyy1pd6E4FBZVhA4s5r1RlcIazTgjjALTFLn8J5RTLMh/yWIRYeyBNY
	 XqpvVKnsHXkB0rNvvHoyugS9OAl9Pn+KqYUDp441LlUuK2jrbKRrYVnRI2Evxm3XFk
	 VH/jV7FYo/KDbV6AGU23waMWXZD8rSpczPZQ0X3GCCP9xouwlNjZYbv9gpI8QomczF
	 wHi9E4uv4we7DyHZhDvuzy7hhKL11nmPDizpqsVx/Shx8yEzIa2n4nB3GY3KjXbWN4
	 YXQJh1eNuWa5g==
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-b9a6ab9ede3so1448151276.2
        for <linux-firmware@kernel.org>; Thu, 27 Apr 2023 06:11:08 -0700 (PDT)
X-Gm-Message-State: AC+VfDwtOONuiqd6Pr87rqv087KSiEk+9TjmJpiG15MojWlpZ4RDoPiL
	tl4QU02mFCRVUok3qR41TQKqaz9ayYlHaTacpgQ=
X-Google-Smtp-Source: ACHHUZ5Wi7VAQssle6FahsHjioepXxPw8djvEdmZiGLng2/sR1UARPg2WJvqsocN40emk+D4Klak7egNK7tSeA3Qoag=
X-Received: by 2002:a81:924c:0:b0:54f:e085:58d9 with SMTP id
 j73-20020a81924c000000b0054fe08558d9mr1027235ywg.46.1682601067118; Thu, 27
 Apr 2023 06:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR02MB75428BF5CB96C4533A0ECD79FA959@PH0PR02MB7542.namprd02.prod.outlook.com>
 <CA+5PVA7mh3mFp28oxVxJa=DbKehhgX0Sxxtz8YBWSsU_7iWkiQ@mail.gmail.com>
 <PH0PR02MB75421FE9F55AAEC9C5D9AF3EFA629@PH0PR02MB7542.namprd02.prod.outlook.com>
 <CA+5PVA6Z3mDq4wwWTsPVT0REV1M8LSa=WYV9Jm=MFpj1DdVmvg@mail.gmail.com> <PH0PR02MB7542B8433C51D3DD7941510FFA639@PH0PR02MB7542.namprd02.prod.outlook.com>
In-Reply-To: <PH0PR02MB7542B8433C51D3DD7941510FFA639@PH0PR02MB7542.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 27 Apr 2023 09:10:56 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6pj+40j=Sdd5Jn+yMymWZwtqWfNGeOKDBZhFKmckCwZA@mail.gmail.com>
Message-ID: <CA+5PVA6pj+40j=Sdd5Jn+yMymWZwtqWfNGeOKDBZhFKmckCwZA@mail.gmail.com>
Subject: Re: QCA: Update firmware files for BT chip WCN6750
To: "Sampath Nimmala (Temp) (QUIC)" <quic_sampnimm@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-bluethooth@vger.kernel.org" <linux-bluethooth@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Balakrishna Godavarthi (QUIC)" <quic_bgodavar@quicinc.com>, 
	"Sai Teja Aluvala (Temp) (QUIC)" <quic_saluvala@quicinc.com>, 
	"Atul Dhudase (QUIC)" <quic_adhudase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 12:17=E2=80=AFAM Sampath Nimmala (Temp) (QUIC)
<quic_sampnimm@quicinc.com> wrote:
>
> Dropped .patch from commit.
> -------------------------------------------------------------------------=
--------------
> The following changes since commit 8451c2b1d529dc1a49328ac9235d3cf5bb8a8f=
cb:
>
>   mt76xx: Move the old Mediatek WiFi firmware to mediatek (2023-04-18 08:=
14:08 -0400)
>
> are available in the Git repository at:
>
>   git@github.com:sampathnimmmala/bt_firmware.git main

Pulled and pushed out.  Thank you.

josh

>
> for you to fetch changes up to 2c6be1a4f0d0fadb103b72af2242fd3732337d6f:
>
>   qca: Update firmware files for BT chip WCN6750 (2023-04-20 09:42:43 +05=
30)
>
> ----------------------------------------------------------------
> sampnimm (1):
>       qca: Update firmware files for BT chip WCN6750
>
>  WHENCE           |   2 ++
>  qca/msbtfw11.mbn | Bin 166836 -> 167552 bytes
>  qca/msbtfw11.tlv | Bin 154624 -> 155340 bytes
>  qca/msnv11.b09   | Bin 0 -> 5847 bytes
>  qca/msnv11.b0a   | Bin 0 -> 5847 bytes
>  qca/msnv11.bin   | Bin 5847 -> 5847 bytes
>  6 files changed, 2 insertions(+)
>  create mode 100755 qca/msnv11.b09
>  create mode 100755 qca/msnv11.b0a
> -------------------------------------------------------------------------=
-------------------------
> Thanks,
> Sampath
>
> -----Original Message-----
> From: Josh Boyer <jwboyer@kernel.org>
> Sent: Wednesday, April 19, 2023 6:50 PM
> To: Sampath Nimmala (Temp) (QUIC) <quic_sampnimm@quicinc.com>
> Cc: linux-firmware@kernel.org; linux-bluethooth@vger.kernel.org; mka@chro=
mium.org; linux-kernel@vger.kernel.org; linux-arm-msm@vger.kernel.org; Bala=
krishna Godavarthi (QUIC) <quic_bgodavar@quicinc.com>; Sai Teja Aluvala (Te=
mp) (QUIC) <quic_saluvala@quicinc.com>; Atul Dhudase (QUIC) <quic_adhudase@=
quicinc.com>
> Subject: Re: QCA: Update firmware files for BT chip WCN6750
>
> WARNING: This email originated from outside of Qualcomm. Please be wary o=
f any links or attachments, and do not enable macros.
>
> On Wed, Apr 19, 2023 at 2:35=E2=80=AFAM Sampath Nimmala (Temp) (QUIC) <qu=
ic_sampnimm@quicinc.com> wrote:
> >
> > Added changes to WHENCE, please find below screenshot for pull request.
> >
> > ----------------------------------------------------------------------
> > ------ The following changes since commit
> > 8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb:
> >
> >   mt76xx: Move the old Mediatek WiFi firmware to mediatek (2023-04-18
> > 08:14:08 -0400)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:sampathnimmmala/bt_firmware.git main
>
> You somehow committed an actual .patch file:
>
> https://github.com/sampathnimmmala/bt_firmware/commit/a058883beac84c6b209=
bd4e4ec2bd5d2c1aa5403
>
> Can you please drop that?
>
> josh
>
> >
> > for you to fetch changes up to 61be71a8d1bf05d0df8e0772449465e430deeb5f=
:
> >
> >   qca: Update firmware files for BT chip WCN6750 (2023-04-19 11:59:49
> > +0530)
> > ----------------------------------------------------------------
> > sampnimm (1):
> >       qca: Update firmware files for BT chip WCN6750
> >
> >  qca/msbtfw11.mbn | Bin 166836 -> 167552 bytes  qca/msbtfw11.tlv | Bin
> > 154624 -> 155340 bytes
> >  qca/msnv11.b09   | Bin 0 -> 5847 bytes
> >  qca/msnv11.b0a   | Bin 0 -> 5847 bytes
> >  qca/msnv11.bin   | Bin 5847 -> 5847 bytes
> >  5 files changed, 0 insertions(+), 0 deletions(-)  create mode 100755
> > qca/msnv11.b09  create mode 100755 qca/msnv11.b0a
> > --------------------------------------------------------------------
> >
> > Thanks,
> > Sampath
> >
> > -----Original Message-----
> > From: Josh Boyer <jwboyer@kernel.org>
> > Sent: Tuesday, April 18, 2023 5:27 PM
> > To: Sampath Nimmala (Temp) (QUIC) <quic_sampnimm@quicinc.com>
> > Cc: linux-firmware@kernel.org; linux-bluethooth@vger.kernel.org;
> > mka@chromium.org; linux-kernel@vger.kernel.org;
> > linux-arm-msm@vger.kernel.org; Balakrishna Godavarthi (QUIC)
> > <quic_bgodavar@quicinc.com>; Sai Teja Aluvala (Temp) (QUIC)
> > <quic_saluvala@quicinc.com>; Atul Dhudase (QUIC)
> > <quic_adhudase@quicinc.com>
> > Subject: Re: QCA: Update firmware files for BT chip WCN6750
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary=
 of any links or attachments, and do not enable macros.
> >
> > On Mon, Apr 10, 2023 at 4:31=E2=80=AFAM Sampath Nimmala (Temp) (QUIC) <=
quic_sampnimm@quicinc.com> wrote:
> > >
> > > Hi Team,
> > >
> > > Please include firmware bins for WCN6750.
> > >
> > > Major contributions : Bug Fixes.
> > >
> > > Snapshot of pull request is as below, let me know if anything is miss=
ing.
> > > --------------------------------------------------------------------
> > > --
> > > ----------- The following changes since commit
> > > 86da2ac9b4e57e9a88f8bfcb5a163a406f5c00e1:
> > >
> > >   Merge https://github.com/pkshih/linux-firmware (2023-04-06
> > > 07:30:31
> > > -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   git@github.com:sampathnimmmala/Bluetooth_FW.git main
> > >
> > > for you to fetch changes up to 167ab8853bc15f8ec58e6b76f98ee5007770d9=
07:
> > >
> > >   qca: Update firmware files for BT chip WCN6750 (2023-04-10
> > > 13:55:38
> > > +0530)
> > >
> > > ----------------------------------------------------------------
> > > sampnimm (1):
> > >       qca: Update firmware files for BT chip WCN6750
> > >
> > > qca/msbtfw11.mbn | Bin 166836 -> 167552 bytes qca/msbtfw11.tlv | Bin
> > > 154624 -> 155340 bytes
> > > qca/msnv11.b09   | Bin 0 -> 5847 bytes
> > > qca/msnv11.b0a   | Bin 0 -> 5847 bytes
> >
> > These file additions need to be added to WHENCE or check_whence.py fail=
s:
> >
> > [jwboyer@vader linux-firmware]$ ./check_whence.py
> > E: qca/msnv11.b09 not listed in WHENCE
> > E: qca/msnv11.b0a not listed in WHENCE [jwboyer@vader linux-firmware]$
> >
> > Can you adjust please?
> >
> > josh
> >
> > > qca/msnv11.bin   | Bin 5847 -> 5847 bytes
> > > 5 files changed, 0 insertions(+), 0 deletions(-) mode change 100644
> > > =3D>
> > > 100755 qca/msbtfw11.mbn mode change 100644 =3D> 100755
> > > qca/msbtfw11.tlv create mode 100755 qca/msnv11.b09 create mode
> > > 100755 qca/msnv11.b0a mode change 100644 =3D> 100755 qca/msnv11.bin
> > >
> > > --------------------------------------------------------------------
> > > --
> > > -----------
> > >
> > >
> > >
> > > Thanks,
> > >
> > > Sampath
> > >
> > >
