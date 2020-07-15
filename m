Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842BAC433E1
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Jul 2020 14:41:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6EF59206D5; Wed, 15 Jul 2020 14:41:14 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4D9BB2065D
	for <linux-firmware@kernel.org>; Wed, 15 Jul 2020 14:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594824074;
	bh=q0zGfQrFhoCkB0gPkZX8jr1+tsa3cTDz1HlZQz+/c4A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sI7S7rfYYTTpH2zluNzedfTxb8RckaDNzu6uxeGzcX3WIsgcqPUXy9Bf/4y6NCIAB
	 zV9J5TEVRElGQJE4j+scdi0EAVoJTAio6SaIHBdJIL98O9fkVMKtRcHiq+DQEMxzxi
	 IPgvxbih+1k55cdcR7Qz3Sykcz+vDQheEvBaLB6g=
Received: by mail-il1-f175.google.com with SMTP id t27so2150234ill.9
        for <linux-firmware@kernel.org>; Wed, 15 Jul 2020 07:41:14 -0700 (PDT)
X-Gm-Message-State: AOAM533jJmRRwpEOEh9SwW7FRgKxiQCa8ljmdKhETPvvBfHfwjSQFGja
	a71e/BiEUzBxZ71hPl1LBrwKhUI8HESVA5KUiYk=
X-Google-Smtp-Source: ABdhPJzmx0AITEAD4vLJO8HK0H9izH1MiGYxXJ1xrNNXBTvoXnJg73XFQ8X+PYd9xQD+LHyfs4JFKG35fN8nxlGPByU=
X-Received: by 2002:a05:6e02:e43:: with SMTP id l3mr3740244ilk.11.1594824073753;
 Wed, 15 Jul 2020 07:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <ec13a841-ad71-dbad-6d1c-60470610cdd5@gmail.com> <6984bfd1f42242bb852706ef0cb36bc1@realtek.com>
In-Reply-To: <6984bfd1f42242bb852706ef0cb36bc1@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 15 Jul 2020 10:41:02 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4bnk-bvODw0k5H4oVPzhHyDU2Pte7PT4s0VLY8WAqH+Q@mail.gmail.com>
Message-ID: <CA+5PVA4bnk-bvODw0k5H4oVPzhHyDU2Pte7PT4s0VLY8WAqH+Q@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: update firmware for RTL8125B
To: Hau <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Linux Firmware <linux-firmware@kernel.org>, 
	nic_swsd <nic_swsd@realtek.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Tue, Jul 14, 2020 at 12:30 PM Hau <hau@realtek.com> wrote:
>
> >
> > Realtek provided updated versions of RTL8125B rev.a and rev.b firmware.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>
> Signed-off-by: Chunhao Lin <hau@realtek.com>
>
> > ---
> >  WHENCE                |   4 ++--
> >  rtl_nic/rtl8125b-1.fw | Bin 9952 -> 10128 bytes  rtl_nic/rtl8125b-2.fw=
 | Bin
> > 3264 -> 3328 bytes
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/WHENCE b/WHENCE
> > index 75d3d5e..1a3324d 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -3066,10 +3066,10 @@ File: rtl_nic/rtl8125a-3.fw
> >  Version: 0.0.1
> >
> >  File: rtl_nic/rtl8125b-1.fw
> > -Version: 0.0.1
> > +Version: 0.0.2
> >
> >  File: rtl_nic/rtl8125b-2.fw
> > -Version: 0.0.1
> > +Version: 0.0.2
> >
> >  Licence:
> >   * Copyright =C2=A9 2011-2013, Realtek Semiconductor Corporation diff =
--git
> > a/rtl_nic/rtl8125b-1.fw b/rtl_nic/rtl8125b-1.fw index
> > 577e1bb61eb95dcea7ab91d3c20b4b6c2adbe3c1..90191ab9c9f6eb4144c68d8
> > be711b7c601b4d637 100644 GIT binary patch delta 256
> > zcmaFhJHcO<0SJmpax4suOp|mC;|=3Dr-^o$e?%=3DHaT^o<Nal0Z-Z#78+97-
> > T2vns6AJ
> > zTA7+y85vB>%&z~zE#JT}LAb$z2S_srGBB_(2mt8=3DAol;?3<@Cj4WJqU0bw8(X}A
> > JX
> > z&maz!69=3DjjXJFs}=3D@CEh1uQ4b@c%nVpD<8Pn1O*EBqw~J2`nc7;(*YB1~8vNv
> > Vf6+
> > s;Q>g@fq_B6fq`j33IoFg1_oAxjaOLI6kxjE{|A{UaKM2JWIF-?0Hvfct^fc4
> >
> > delta 79
> > zcmbQ>|G-z50SJmpax4suOp|mC;|=3Dr-^b8dY%=3D8US^^FWbl0Z-
> > Z#IrdW7}O`~ns68y
> > aTbY_!nOIEB%-)>C$fCyKz$M=3DRQUw5^#t)eQ
> >
> > diff --git a/rtl_nic/rtl8125b-2.fw b/rtl_nic/rtl8125b-2.fw index
> > 45b04434263d6d69a8e70e27ccf4843bd5f939a4..dc753b587c38b04478213e8
> > 3b5d723809248ab11 100644 GIT binary patch delta 157
> > zcmX>g*&wCM00c!PITnUSrb)U+@dkPZdPWKc=3DK6-
> > l`bGvINgyZyVg+Uf2AzqzCLD$q
> > zRt82^hK3t6nVAflxaAud7zBV2j1Dw_`3wb&3=3D9uILJmNU4h&2SQWzK}FfgzhY|
> > deF
> > W;8KC<djFq60jTPL0~g2?Q~&^+bQ#$I
> >
> > delta 92
> > zcmZpWIv}ab00c!PITnUSrb)U+@dkPZdWH%HX8MMv`bGvINgyZyVgY6bhV+TL
> > CLBh_
> > cR;FfFrj{EsnVB}vVRGOSap00~04YNT04914$p8QV
> >
> > --
> > 2.27.0
> >
> >
> > ------Please consider the environment before printing this e-mail.
