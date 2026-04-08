Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F363310F9943
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Apr 2026 14:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAA7AC2BCB2; Wed,  8 Apr 2026 14:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B001AC2BCB0
	for <linux-firmware@kernel.org>; Wed,  8 Apr 2026 14:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775660232;
	bh=KPezo/Jtwcew221Wx/KPblxXtMvlPVpxt4+m5Yqy0H4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=sjjLNl4SgJVu+BIDJ+ddCg8zTGCIKhd2DN/Aoaha9ft8v4tN6qrqZbrhNb9q90jmv
	 pVdfnLzsdM7YYju8Xa6XFLk9ZGNVjdrH4KdKm7SSuyWqSV+kvK17IExLB+QtMVNjns
	 TaKMs1kCYVYe0iGppB+KetuwVl4Y8UTHA7NEZEw07S2RBRCMgNECsFrmTTAUeHYkMb
	 l2ApaIeGmKCez7wH2Q86NuBkc9fzdA3hFt6fRPR9HMPgLPGV5aCKvzVTBctgUTquUQ
	 zgV5VRotF/G/pK10Xk57kTSW9ZvDMI6t8JLQWRVS1bt6gh+7cL4UUZyUqMVJZ08YJN
	 f0DKXP8ijDPYA==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6501725d888so5093701d50.0
        for <linux-firmware@kernel.org>; Wed, 08 Apr 2026 07:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg59jrIQunA4UtMgFTIVe13hnATNEuljGOm4MLCoPtcxl0K58DQEJRpWuxVJell2IYi/io4dSHEK8ECI34zg==@kernel.org
X-Gm-Message-State: AOJu0YxgnZJAUxUnTgfeRfs51r6081Xfxl2DDVS9T31sa7XXz0WssepY
	mnnDkxPzgQHDO+dxnU/XNG9OXstgs6LwRS2UfFWgn+lzvbzgOu/5sdH6NBzRtPhUDqYiuLzRGeK
	NkKQnvzRQQaI8miZUbxx9D5WV9HUqRqY=
X-Received: by 2002:a05:690e:148b:b0:650:73f9:3870 with SMTP id
 956f58d0204a3-65073f93a9fmr9235722d50.67.1775660231850; Wed, 08 Apr 2026
 07:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260408082834.94540-1-aaron.ma@canonical.com>
 <CA+5PVA5+t0DGasgNONe5GW-bD4hJX4Hc7ZKiB7D8kwsFQKtHuw@mail.gmail.com> <TYCPR01MB7578EE68948CE286A8F8C5FFD65BA@TYCPR01MB7578.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB7578EE68948CE286A8F8C5FFD65BA@TYCPR01MB7578.jpnprd01.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 8 Apr 2026 10:57:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4-pm8+LcPSAmcSBt7__TbOZf2udA3r_m+5F5ExqDSeyQ@mail.gmail.com>
X-Gm-Features: AQROBzBt2T4wKZl_ZIB_Xn0Aun4Hu-wnYSEHkZKJO89rjCNYzJ53rAG6e2h1Q0I
Message-ID: <CA+5PVA4-pm8+LcPSAmcSBt7__TbOZf2udA3r_m+5F5ExqDSeyQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] WHENCE: Fix ISH firmware symlink prefix
 for Lenovo PTL systems
To: Vishnu Sankar <vsankar@lenovo.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Aaron Ma <aaron.ma@canonical.com>, Richie roy Jayme2 <rjayme2@lenovo.com>, 
	"rjayme.jp@gmail.com" <rjayme.jp@gmail.com>, Vishnu Sankar <vishnuocv@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/993

josh

On Wed, Apr 8, 2026 at 8:27=E2=80=AFAM Vishnu Sankar <vsankar@lenovo.com> w=
rote:
>
> Hi Josh,
>
> Thanks for sharing the patch.
>
> After reviewing this, we realized that the incorrect symlink name was int=
roduced from our side. Sorry for this.
> This fix correctly help the firmware to be loaded on PTL systems.
>
> We ACK this patch. Please go ahead and accept it.
>
> Thanks @Aaron Ma
>
> ________________________________________
> Vishnu Sankar
> Staff Engineer, SW
> Minatomirai Center Bldg, 21F
> 3-6-1 Minatomirai, Nishi-ku, Yokohama, Kanagawa
> 220-0012 JAPAN
>
> Solutions Development
> Lenovo Japan
>
>  vsankar@lenovo.com
>
> Lenovo.com
> Facebook | Instagram | LinkedIn | TikTok | X | YouTube | Privacy
>
>
> ________________________________________
> From: Josh Boyer <jwboyer@kernel.org>
> Sent: 08 April 2026 20:53
> To: Aaron Ma <aaron.ma@canonical.com>; Richie roy Jayme2 <rjayme2@lenovo.=
com>; Vishnu Sankar <vsankar@lenovo.com>; rjayme.jp@gmail.com <rjayme.jp@gm=
ail.com>; Vishnu Sankar <vishnuocv@gmail.com>
> Cc: linux-firmware@kernel.org <linux-firmware@kernel.org>
> Subject: [External] Re: [PATCH] WHENCE: Fix ISH firmware symlink prefix f=
or Lenovo PTL systems
>
> Vishnu/Richie, can you review this patch?
>
> josh
>
> On Wed, Apr 8, 2026 at 4:28=E2=80=AFAM Aaron Ma <aaron.ma@canonical.com> =
wrote:
> >
> > Tested on ThinkPad X1 2-in-1 Gen 11 (21V9SIT260) with kernel 7.0-rc6:
> > renaming the symlink to ish_ptl_53c4ffad_bc3e29f7.bin loads the firmwar=
e
> > successfully (v5.8.1.7782) and all three HID sensor hubs enumerate.
> >
> > Fixes: 87a7d3c72b19 ("Add LENOVO ISH firmware v5.8.1.7720 for X1 Carbon=
 (Gen 14) and X1 2-in-1 (Gen 11)")
> > Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> > ---
> >  WHENCE | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/WHENCE b/WHENCE
> > index b243fee39..c46dc429b 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -9928,9 +9928,9 @@ Info: product_family - "ThinkPad X9-15 Gen 1"
> >  Version: 5.8.0.7720
> >
> >  File: LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin
> > -Link: intel/ish/ish_lnlm_53c4ffad_bc3e29f7.bin -> ../../LENOVO/ish/ish=
_ptl_lenovo_X1_2026_5.8.1.7782.bin
> > +Link: intel/ish/ish_ptl_53c4ffad_bc3e29f7.bin -> ../../LENOVO/ish/ish_=
ptl_lenovo_X1_2026_5.8.1.7782.bin
> >  Info: product_family - "ThinkPad X1 2-in-1 Gen 11"
> > -Link: intel/ish/ish_lnlm_53c4ffad_75d6ebe2.bin -> ../../LENOVO/ish/ish=
_ptl_lenovo_X1_2026_5.8.1.7782.bin
> > +Link: intel/ish/ish_ptl_53c4ffad_75d6ebe2.bin -> ../../LENOVO/ish/ish_=
ptl_lenovo_X1_2026_5.8.1.7782.bin
> >  Info: product_family - "ThinkPad X1 Carbon Gen 14"
> >  Version: 5.8.1.7782
> >
> > --
> > 2.43.0
> >
