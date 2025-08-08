Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA03C87FD3
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Aug 2025 12:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4654FC4CEF6; Fri,  8 Aug 2025 12:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F10C4CEF8
	for <linux-firmware@kernel.org>; Fri,  8 Aug 2025 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754654825;
	bh=cPCkqMMsulvkCTdxmwelxBn2wqrJMr+RnqKStI3WSnY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HTL4s20lCfyrafX3jCJmcnR7JulCOa+gxiq4641SJIIWEnXBIjNv0zjbyV/6nfEtT
	 BhDT/vk49anNZONimuffBfZAhvCuahLeWDYSRYZl2vjy58YuYH+bIwDH6Y1gMqSwkf
	 kGbcyZLCr8sRzUX9L7JPyojLRSnWTOVPWktEmjewPCaRD19+CQHFL3ZYdtUx9RYz5r
	 E3ndq1X8PtZ0u2QRmoIB5SNN9NOT+fDkzzmbtAEZP53MofHHqUtqhZIb3YS3YoWqTE
	 lE+eJZHRmuJSHzTcfLA7Tjj2tM4OLow/DMH5K892GdQ2ErWtYx7e2PbIgssaItuZIN
	 xgsrZIk6Qt2sg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70a57a8ffc3so20346117b3.0
        for <linux-firmware@kernel.org>; Fri, 08 Aug 2025 05:07:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPGeuYKOI7XTjcyUR+5BNzDHLrDt/dLE647m1/r0iF2BJ9tu9lpyTgI9I0SXlJorzWZ3bMJ49eyoBq0S0S2A==@kernel.org
X-Gm-Message-State: AOJu0YzNwwgsR4Hckxyhu46ynrKBE8s3woZI29doH7QSiOqmoqw+I0nk
	udhbX/92x2fV+EbL+qKHQKxU1lLAv6pqRpY4bhTiCLn7hJNEwFTHtw/LOOyNO3StctMaYtMydDA
	CMvOf89lT0m441gA84Qmk+eaws2W4wso=
X-Google-Smtp-Source: AGHT+IEoPfWK147XxocZoMjZ1Os7v35wk3EklOcVaiZQLC/RWEtGF7+KBRYqhAm+0ZaJVI0dnM9K2RT3kUeUf2wj3UI=
X-Received: by 2002:a05:690c:a84:b0:71b:efeb:7ee with SMTP id
 00721157ae682-71bf0e3e3ffmr34880767b3.31.1754654824458; Fri, 08 Aug 2025
 05:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAPiVHHhZYkO=0C3b4LLTUKFyFgYeZcek-hL4NJ3ZH3-dUQ1xjQ@mail.gmail.com>
 <CAO9ioeWWoRrjgRQt9uUbbjPY4QZp47ufXeSHQp6K2eB1qjqngw@mail.gmail.com> <CAPiVHHiLRQD9=e0YhQsxBvk0JeQTQRf1zHka520urYsSbUMoxw@mail.gmail.com>
In-Reply-To: <CAPiVHHiLRQD9=e0YhQsxBvk0JeQTQRf1zHka520urYsSbUMoxw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 8 Aug 2025 08:06:53 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4-o+x5kOi26Mydz4szg=ongRFaZYpRffSGOdeg+oFAVA@mail.gmail.com>
X-Gm-Features: Ac12FXzCCSM1gkA4H39i-5uIx2o5ML8ItPARRoZJXnOqkOd_WYhe4E3Ux_1xRlY
Message-ID: <CA+5PVA4-o+x5kOi26Mydz4szg=ongRFaZYpRffSGOdeg+oFAVA@mail.gmail.com>
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-firmware@kernel.org, 
	hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 2:28=E2=80=AFPM Janaki Ramaiah Thota
<janaki.thota@oss.qualcomm.com> wrote:
>
> On Wed, Aug 6, 2025 at 11:24=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, 6 Aug 2025 at 23:21, Janaki Ramaiah Thota
> > <janaki.thota@oss.qualcomm.com> wrote:
> > >
> > > Hi linux-firmware maintainers,
> > >
> > >  Here's a pull request for bluetooth firmware. Please let me know if
> > >  you have any problems.
> >
> > Please also update version in the WHENCE file.
> >
>
> Hi Dimitry, Thanks for the quick review!
> updated the pull request with suggested change as below
>
> The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4be28e=
00:
>
>   Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/quicjathot/bt_msl_fw_1.1.3_00091.git HEAD

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/642

josh

>
> for you to fetch changes up to 2ac901176d6df149cb0f9e0a8cd36627746a55b7:
>
>   qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
> (2025-08-06 23:47:20 +0530)
>
> ----------------------------------------------------------------
> Janaki Ramaiah Thota (1):
>       qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091
>
> > >
> > > The following changes since commit b6b0b15278c76bbc1b7aaf17e706734d4b=
e28e00:
> > >
> > >   Merge branch 'amd-staging' into 'main' (2025-08-05 13:39:15 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/quicjathot/bt_msl_fw_1.1.3_00091.git HEAD
> > >
> > > for you to fetch changes up to d7925ab31e9406a0416bec96d2d1e6b25aba6b=
c7:
> > >
> > >   qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-00091 (=
2025-08-06 20:35:08 +0530)
> > >
> > > ----------------------------------------------------------------
> > > Janaki Ramaiah Thota (1):
> > >       qca: Update Bluetooth WCN6750 1.1.3-00069 firmware to 1.1.3-000=
91
> > >
> > > Thanks,
> > >  Janakiram
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> Thanks,
> Janakiram
