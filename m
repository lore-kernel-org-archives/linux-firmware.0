Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20AEC47DB3
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 12:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD4BCC43394; Fri,  2 Feb 2024 12:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C819BC43390
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706877094;
	bh=PxAEKJ6QwoQ9z6FfquP3uUFDPKfq0FSpwrzsxyHAe3M=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=WJEaKI4AMUX3KZLYJb6tL3+ib5JtKIQ1t3CR2xMhfEOzYk+oj6c2i49B9Im9f+Ygp
	 Bc1ajk5CJNRIVPIkzJVUi3hoOAHIz4RmLrAPVVQftvMVoTXTOlo4me5gX+yhAakftz
	 5BMmlq1U4RzLz0RR9rJADlV1soGOGXvo9AKTXY2JLibHGSYoaCdRAf8lE8iH5OAFFV
	 +7UKRAnhBjZ8VOaQL7WG8A5BJx7mgf5npYSlzmS9qLsshKRv9aNUt18/PksUO1Rc+W
	 hV9m0HD3ejTNVzijSVyvd1thqC4AG/v5Q/qybEDsb/ZXhjEyP6HbAWd+p8EnIZ9+l2
	 4izgsLWPhLE9A==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6002317a427so18390847b3.2
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 04:31:34 -0800 (PST)
X-Gm-Message-State: AOJu0Yw1IVf1sGlOybKLhRVGblbOfEnlop4flmKJr2c67SreoIMEHMUx
	mN3serKvW/JxUqGUc93MXoPhjf+SO6A6UG6/pwy6ruNSctrlF4v3QT6Cw1JR+VShO4Qn3fyXmbx
	RD9//9737PeKNvlrxRc4aE8dHqCw=
X-Google-Smtp-Source: AGHT+IEDKW0nsYd3ySSt5DwTl4pPJKIHd0wlBHI5jzORBSKDk26ilCRqgRtIFYRIxTovxmZCER441g3H6RYGmVi22NE=
X-Received: by 2002:a81:6dd4:0:b0:5ff:8269:1fc5 with SMTP id
 i203-20020a816dd4000000b005ff82691fc5mr7791257ywc.42.1706877093951; Fri, 02
 Feb 2024 04:31:33 -0800 (PST)
MIME-Version: 1.0
References: <62adc40d-fd8e-4a5e-9671-8a42260fc81c@gmail.com>
 <91d0c882-0ad5-4f25-a95b-bdbcf3f699ed@gmail.com> <a7367e1b27064656860c8faaca6fad0c@realtek.com>
In-Reply-To: <a7367e1b27064656860c8faaca6fad0c@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:31:23 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4nGjXPw22NuVu13vvvLA7q02exZV8ujftiqTirhRZTwA@mail.gmail.com>
Message-ID: <CA+5PVA4nGjXPw22NuVu13vvvLA7q02exZV8ujftiqTirhRZTwA@mail.gmail.com>
Subject: Re: [PATCH] rtl_nic: add firmware for RTL8126A
To: Hau <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Linux Firmware <linux-firmware@kernel.org>, 
	nic_swsd <nic_swsd@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 9:30=E2=80=AFAM Hau <hau@realtek.com> wrote:
>
> > On 01.02.2024 15:24, Heiner Kallweit wrote:
> > > Realtek provided a firmware file for new chip version RTL8126A.
> > >
> > > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > > ---
> > >  WHENCE                |   3 +++
> > >  rtl_nic/rtl8126a-2.fw | Bin 0 -> 29248 bytes
> > >  2 files changed, 3 insertions(+)
> > >  create mode 100644 rtl_nic/rtl8126a-2.fw
> > >
> > > diff --git a/WHENCE b/WHENCE
> > > index 99632bb..211202c 100644
> > > --- a/WHENCE
> > > +++ b/WHENCE
> > > @@ -3356,6 +3356,9 @@ Version: 0.0.2
> > >  File: rtl_nic/rtl8125b-2.fw
> > >  Version: 0.0.2
> > >
> > > +File: rtl_nic/rtl8126a-2.fw
> > > +Version: 0.0.2
> > > +
> >
> > Hi Hau,
> >
> > could you please respond with your Reviewed-by?
> >
> Reviewed-by: Chun-Hao Lin <hau@realtek.com>

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/140

josh
