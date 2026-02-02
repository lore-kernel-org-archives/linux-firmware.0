Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A30E7315D
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Feb 2026 12:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C05EC2BC87; Mon,  2 Feb 2026 12:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62993C2BC86
	for <linux-firmware@kernel.org>; Mon,  2 Feb 2026 12:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034953;
	bh=gwqq2p0Fz7BPDzNR3l2jZgueqlWC55nQwqqMsRiUZ+c=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Am7YoU53fCdjitSa2zXr/OgfFomNwy5pOEjhRSduhRJaHe5yJ+QMYMWmcSJxvDFR1
	 aNzh/cTijOjnho6vi/n/CbTnvxFsS0j+9YtIlTnhGA9ytazd/clFii8KBqrFI7MSo1
	 I6N5M1ucqACCIpY+cTTiWA/eUgzNXpN2NXV34g0O3VsIn72oD8fkq+6kKbzo2Z7RHk
	 2GFvdCnfnBbR65VXhBVkaL+5lYJT6D0a96aJocFHYxzTB6X4OqUwaGgPQ8B3shMVe9
	 LQ7dJiCXZ7A56UyY6grX9yEupzVzgbRWWC4/xGlfMS1lGnEW0JmocAdNJYVY78gwYC
	 0zOjsBs4Zr0cw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79472374371so26378477b3.0
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 04:22:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfIKCGFnvlVWMUASUheW5RvD2zz497HnkC8pHSWqQaul2PNg6RMTEDRVA8SThMMgSE8WhabYmgZDormNz8dw==@kernel.org
X-Gm-Message-State: AOJu0YySlvfpJzTTV6uV57oPLEDbClvAw/+8MMvaSX54SCQlcQC2aVFb
	zSES94/+4H3d6pdfYVM7MV84Pkspyanf+cJY10g1WvR+NP//PEez51iXihQNNdu5oTm7jN9qgcD
	wTHp7fOTAM8Iv5ZWuzXPVJ1bSMOC1M3E=
X-Received: by 2002:a05:690c:4b13:b0:794:e839:ad75 with SMTP id
 00721157ae682-794e839dd42mr4124397b3.42.1770034952586; Mon, 02 Feb 2026
 04:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20260120212659.4454-1-ansuelsmth@gmail.com> <htkipxs5s3lmkm65wrgsyouk5hh7iyno4aci6cbu5sba3swnw2@pxgawgx4yzmd>
 <CA+_ehUy-9Gd8x81btYdq1sRpKtGv8BuynbFJz6tTg655pba8Rw@mail.gmail.com> <DM3PR19MB83582370043EC80A5BE42ECF8691A@DM3PR19MB8358.namprd19.prod.outlook.com>
In-Reply-To: <DM3PR19MB83582370043EC80A5BE42ECF8691A@DM3PR19MB8358.namprd19.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Feb 2026 07:22:20 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6hcFzF1rOfsBzAYWgCsG8oxotc3LGCsrWPSB5V9hRYww@mail.gmail.com>
X-Gm-Features: AZwV_QiyYanGogyWo6-u3hEd5Tw26Z4WhnXU5XFCuG1MB1f5Eupj0FkLRJXOmU4
Message-ID: <CA+5PVA6hcFzF1rOfsBzAYWgCsG8oxotc3LGCsrWPSB5V9hRYww@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: update Aeonsemi AS21x1x firmware to 1.9.1
To: Ryan Huang <xin.huang@aeonsemi.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, =?UTF-8?Q?Peter_Steinh=C3=A4user?= <ps@embedd.com>, 
	Huajian Zhou <huajian.zhou@aeonsemi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/874

josh

On Tue, Jan 27, 2026 at 9:41=E2=80=AFPM Ryan Huang <xin.huang@aeonsemi.com>=
 wrote:
>
> Hi all,
>
> Yes. this patch is intentionally contributed to the linux-firmware repo a=
nd there is an upstream driver submitted to the Linux kernel that would loa=
d this firmware. thanks.
>
>
> Best Regards,
>
> Ryan Huang
>
> +86-15366006084
>
>
>
>
>
> ________________________________
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Christian Marangi (Ansuel) <ansuelsmth@gmail=
.com>
> =E5=B7=B2=E5=8F=91=E9=80=81: 2026 =E5=B9=B4 1 =E6=9C=88 28 =E6=97=A5 =E6=
=98=9F=E6=9C=9F=E4=B8=89 10:29
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Ryan Huang <xin.huang@aeonsemi.com>
> =E4=B8=BB=E9=A2=98: Fwd: [PATCH] linux-firmware: update Aeonsemi AS21x1x =
firmware to 1.9.1
>
> On Tue, Jan 20, 2026 at 10:26:47PM +0100, Christian Marangi wrote:
> > Update Aeonsemi AS21x1x firmware to version 1.9.1
> >
> > This new version introduce new command to configure the DPC Rate
> > Adaption to better configure the In Band support.
> >
> > Also introduce some fixup for some specific scenario:
> >
> > - 10G performance is optimized for unstandard RJ45 with WIFI filter
> > - 100meter 10G performance is improved for setup of serial resistor on =
MDI trace
> > - Auto crossover in force 100M mode / parallel detection issue fixed
> >
> > (quoted from Aeonsemi release notice)
>
> Can we please get Aeonsemi's ack on these changes?
> I CC'd Ryan Huang.
>
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  aeonsemi/as21x1x_fw.bin | Bin 261400 -> 290272 bytes
> >  1 file changed, 0 insertions(+), 0 deletions(-)
>
> --
> With best wishes
> Dmitry
