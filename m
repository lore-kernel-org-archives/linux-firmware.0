Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7247CED624
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 12:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62F96C16AAE; Tue, 18 Nov 2025 12:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D180C19422
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 12:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763468227;
	bh=Ev3YYGBG0nMllT8cImDhnBpX+rjzAOnaxmwl1b92maI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HSZXwO1WC9otsJtkDPge7sE9c2P/1x7ucrah5rvK//1uaZEf1t55xafEOxoCLCzFj
	 Q3XpRkuLbKMei6zQdt2axr/14JC+3Q6P3pWAJtjQ1CMq6NioJNkMnfFZEiaOylmA8Y
	 d8zgp3qFBDtDOmv1JK+hQQWY43qJXnicgwRO4H8fyKvhHoKegqrsMkm2n+WyYKrKL+
	 w9FenkygteqpC/XltaaUROrRywkMguIPwgIuc4/pPCBhcnSYNJB9a77tUDwv/x1HDS
	 3MuCVPsyaFxNyLPPw68bQXw9ZBXFP4pUoKy2oLN1gwIyAYXPUuG+EPJXZ2dwVIbIfi
	 g2VmWwihZRAkA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-787eb2d8663so78934817b3.0
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 04:17:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0q7pawT3uZzEHqgJgfYuy/XAUrvxqma0DCN99VoQWfNZg1e3NVyxUSIuKqxcht9xNz2jigSFyISewNiJtjQ==@kernel.org
X-Gm-Message-State: AOJu0YxCxf6iwdMIqCW2qfhPLus2i9drZuHfzVCY2MpeLyYtjHB3N5Yc
	8Yv0HJ48YdSLIhcM6+JknKoqISSpZD5Iw91d15MZGszJgb1hrIAezHVD+1KYxO0YUdvX/RV/tIg
	sNDHoNk9prJcT57PFuU3Wpi8vsGivXJM=
X-Google-Smtp-Source: AGHT+IGxokrHULspGT34qG3Qn0sNsMAG53a/uc9Ur7eYH+2y/c+1XjbFQKh3rnqjhIlVD5G4sy85G7hHvn+xV7m5O0A=
X-Received: by 2002:a05:690e:418e:b0:63f:af94:79d2 with SMTP id
 956f58d0204a3-6421350ff8dmr2566916d50.34.1763468225875; Tue, 18 Nov 2025
 04:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20251118023557.3424-1-javen_xu@realsil.com.cn> <e362812eb2134b3fa3d0ffd3903c57f1@realtek.com>
In-Reply-To: <e362812eb2134b3fa3d0ffd3903c57f1@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Nov 2025 07:16:53 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5Up5z+pnQHXhhxKq+ceqSvjCEbsN+ufrqeo+r06wE5tQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmdgFRDyU6PWuSksLUrYukk69AJkRAfPRHoUKL7jNGgJD0dsKY3RG02al8
Message-ID: <CA+5PVA5Up5z+pnQHXhhxKq+ceqSvjCEbsN+ufrqeo+r06wE5tQ@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: add firmware rtl9151a-1
To: Hau <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, 
	nic_swsd <nic_swsd@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 12:49=E2=80=AFAM Hau <hau@realtek.com> wrote:
>
>
>
> > -----Original Message-----
> > From: javen [mailto:javen_xu@realsil.com.cn]
> > Sent: Tuesday, November 18, 2025 10:36 AM
> > To: linux-firmware@kernel.org; hkallweit1@gmail.com; nic_swsd
> > <nic_swsd@realtek.com>
> > Cc: javen_xu@realsil.com.cn
> > Subject: [PATCH] rtl_nic: add firmware rtl9151a-1
> >
> > This adds firmware rtl9151a-1 for RTL9151A.
> >
> > Signed-off-by: javen <javen_xu@realsil.com.cn>
>
> Reviewed-by: ChunHao Lin <hau@realtek.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/785

josh

> > ---
> >  WHENCE                |   3 +++
> >  rtl_nic/rtl9151a-1.fw | Bin 0 -> 640 bytes
> >  2 files changed, 3 insertions(+)
> >  create mode 100644 rtl_nic/rtl9151a-1.fw
> >
> > diff --git a/WHENCE b/WHENCE
> > index b2a73d16..46f3345d 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -3615,6 +3615,9 @@ Version: 0.0.4
> >  File: rtl_nic/rtl8125k-1.fw
> >  Version: 0.0.1
> >
> > +File: rtl_nic/rtl9151a-1.fw
> > +Version: 0.0.1
> > +
> >  File: rtl_nic/rtl8126a-2.fw
> >  Version: 0.0.2
> >
> > diff --git a/rtl_nic/rtl9151a-1.fw b/rtl_nic/rtl9151a-1.fw new file mod=
e 100644
> > index
> > 0000000000000000000000000000000000000000..f2eb2c4219b7ebeb6ccdfd44c
> > 7bbde90687c2f33
> > GIT binary patch
> > literal 640
> > zcmb7=3DO-
> > lk%6o!u<nM`7Xb5M!UOGUUz9mynD1Jw`c7s#N7L6(Ra?GEl*1TKpf*~hMJ
> > zi=3Da)oX<Mtd{eymjy>}dH8QqzOhkNJDnKLgDQMY%nX_swx&8`*m#k{R-
> > yI@xer81uB
> > z)d2$#{HavkW<T$$wp&;3VMBFVr>b2)R(t#1_KDkVs*c;Mw^aS8(NuP&THdIx
> > m+1UT
> > z_X-
> > d><N2%*<v<h|AO_;V1PQ<(3DRHzEP@PBU<s^%RS6M&5=3DBJ3e&h`1bYByfcf
> > W|Y
> > zrw+b}I+GkUa40xx5DkfDid#ljmc<g<WywET5+D}cV~9EQv*gGUg|h^#XJYL%iz
> > %27
> > zPWjIL!+|rF*$<Y!GwpF{O??d;BbG>vB^Y3FZdrz4`wsgDmhe5x>pRQN8|qD#S
> > ^`F&
> > z=3DNgMbjh<(WcjGsfOeQQb--
> > hp~?}+cP?;!k$_Xxhg3?>|+X%0vd|DE!(@N)9ck)?N*
> > Uk>6UK@7IJB{AcbCvL%0g0|KF(0RR91
> >
> > literal 0
> > HcmV?d00001
> >
> > --
> > 2.43.0
>
