Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA33C77B73
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Apr 2023 13:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BC69C4339E; Wed, 19 Apr 2023 13:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66646C4339B
	for <linux-firmware@kernel.org>; Wed, 19 Apr 2023 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681910423;
	bh=JqYj9LaRCfCbxnqQOEr1VaO/WJHOUKiKZyfdjreFfr4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LcMUEdD6lKZJzxeEMWMIZd5veoGe+6GG+Y0gcf89JUt/VvuQ2gWQNltuGRaPFECvl
	 idl4bZDaaNBjaOb5yJ7AGZGUJu8ajf8ZoSG3+S31JOF6lq/CiDGcYrIq2wJw1CXS8w
	 XQUWaJ64NKbAGK/m3SmTUFIgAQ7gVa3Y/qUr/hpvbkC2zCH40SW2/hX2wFcmKdnaOt
	 hFlKanNXRdfxR0nX5xDCqBT4jspB62y6NYr7ZWeikpUkHSnei0PMxWEGaRrc9rVgnz
	 dqNyIMSIZOalCOuBxq+sQEjPIZiNT/sCvGDWpPQH+xKtOW82RKBMqqJLpp3/CDGuSG
	 YNGNoUOor298Q==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-54fc337a650so249210167b3.4
        for <linux-firmware@kernel.org>; Wed, 19 Apr 2023 06:20:23 -0700 (PDT)
X-Gm-Message-State: AAQBX9cuMVwtkNKk2oWooEi/41NZPWGb+DLURtgHYQzXK29tWI0fCDog
	9UCvYPvWI3yE9j3WghVFQB2y5fdi4xneBvKypIM=
X-Google-Smtp-Source: AKy350bfI8leBZFTAhnUdm1QrLgsdy/ieia+sRsxqox1v7JRAxLGTOZlo1QT8TrYT/XN1P+u/2q+DUuIbADjEHdmtKY=
X-Received: by 2002:a0d:d953:0:b0:54f:5cec:a643 with SMTP id
 b80-20020a0dd953000000b0054f5ceca643mr3273608ywe.41.1681910422465; Wed, 19
 Apr 2023 06:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR02MB75428BF5CB96C4533A0ECD79FA959@PH0PR02MB7542.namprd02.prod.outlook.com>
 <CA+5PVA7mh3mFp28oxVxJa=DbKehhgX0Sxxtz8YBWSsU_7iWkiQ@mail.gmail.com> <PH0PR02MB75421FE9F55AAEC9C5D9AF3EFA629@PH0PR02MB7542.namprd02.prod.outlook.com>
In-Reply-To: <PH0PR02MB75421FE9F55AAEC9C5D9AF3EFA629@PH0PR02MB7542.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 19 Apr 2023 09:20:11 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6Z3mDq4wwWTsPVT0REV1M8LSa=WYV9Jm=MFpj1DdVmvg@mail.gmail.com>
Message-ID: <CA+5PVA6Z3mDq4wwWTsPVT0REV1M8LSa=WYV9Jm=MFpj1DdVmvg@mail.gmail.com>
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

On Wed, Apr 19, 2023 at 2:35=E2=80=AFAM Sampath Nimmala (Temp) (QUIC)
<quic_sampnimm@quicinc.com> wrote:
>
> Added changes to WHENCE, please find below screenshot for pull request.
>
> -------------------------------------------------------------------------=
---
> The following changes since commit 8451c2b1d529dc1a49328ac9235d3cf5bb8a8f=
cb:
>
>   mt76xx: Move the old Mediatek WiFi firmware to mediatek (2023-04-18 08:=
14:08 -0400)
>
> are available in the Git repository at:
>
>   git@github.com:sampathnimmmala/bt_firmware.git main

You somehow committed an actual .patch file:

https://github.com/sampathnimmmala/bt_firmware/commit/a058883beac84c6b209bd=
4e4ec2bd5d2c1aa5403

Can you please drop that?

josh

>
> for you to fetch changes up to 61be71a8d1bf05d0df8e0772449465e430deeb5f:
>
>   qca: Update firmware files for BT chip WCN6750 (2023-04-19 11:59:49 +05=
30)
> ----------------------------------------------------------------
> sampnimm (1):
>       qca: Update firmware files for BT chip WCN6750
>
>  qca/msbtfw11.mbn | Bin 166836 -> 167552 bytes
>  qca/msbtfw11.tlv | Bin 154624 -> 155340 bytes
>  qca/msnv11.b09   | Bin 0 -> 5847 bytes
>  qca/msnv11.b0a   | Bin 0 -> 5847 bytes
>  qca/msnv11.bin   | Bin 5847 -> 5847 bytes
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  create mode 100755 qca/msnv11.b09
>  create mode 100755 qca/msnv11.b0a
> --------------------------------------------------------------------
>
> Thanks,
> Sampath
>
> -----Original Message-----
> From: Josh Boyer <jwboyer@kernel.org>
> Sent: Tuesday, April 18, 2023 5:27 PM
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
> On Mon, Apr 10, 2023 at 4:31=E2=80=AFAM Sampath Nimmala (Temp) (QUIC) <qu=
ic_sampnimm@quicinc.com> wrote:
> >
> > Hi Team,
> >
> > Please include firmware bins for WCN6750.
> >
> > Major contributions : Bug Fixes.
> >
> > Snapshot of pull request is as below, let me know if anything is missin=
g.
> > ----------------------------------------------------------------------
> > ----------- The following changes since commit
> > 86da2ac9b4e57e9a88f8bfcb5a163a406f5c00e1:
> >
> >   Merge https://github.com/pkshih/linux-firmware (2023-04-06 07:30:31
> > -0400)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:sampathnimmmala/Bluetooth_FW.git main
> >
> > for you to fetch changes up to 167ab8853bc15f8ec58e6b76f98ee5007770d907=
:
> >
> >   qca: Update firmware files for BT chip WCN6750 (2023-04-10 13:55:38
> > +0530)
> >
> > ----------------------------------------------------------------
> > sampnimm (1):
> >       qca: Update firmware files for BT chip WCN6750
> >
> > qca/msbtfw11.mbn | Bin 166836 -> 167552 bytes qca/msbtfw11.tlv | Bin
> > 154624 -> 155340 bytes
> > qca/msnv11.b09   | Bin 0 -> 5847 bytes
> > qca/msnv11.b0a   | Bin 0 -> 5847 bytes
>
> These file additions need to be added to WHENCE or check_whence.py fails:
>
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: qca/msnv11.b09 not listed in WHENCE
> E: qca/msnv11.b0a not listed in WHENCE
> [jwboyer@vader linux-firmware]$
>
> Can you adjust please?
>
> josh
>
> > qca/msnv11.bin   | Bin 5847 -> 5847 bytes
> > 5 files changed, 0 insertions(+), 0 deletions(-) mode change 100644 =3D=
>
> > 100755 qca/msbtfw11.mbn mode change 100644 =3D> 100755 qca/msbtfw11.tlv
> > create mode 100755 qca/msnv11.b09 create mode 100755 qca/msnv11.b0a
> > mode change 100644 =3D> 100755 qca/msnv11.bin
> >
> > ----------------------------------------------------------------------
> > -----------
> >
> >
> >
> > Thanks,
> >
> > Sampath
> >
> >
