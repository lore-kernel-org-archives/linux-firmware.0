Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E102C7115B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jun 2025 16:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8287C4CEEF; Mon, 23 Jun 2025 16:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2508C4CEF0
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694452;
	bh=MdSi8w2Q2q04eaRyO0Y1rbkKG8BkY0CLH/i0yy824Vo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=M0Mujosf40ei5kYI/aDYRQgdhq3P7PZiLThwXz/m7tCeTr9r7TnZOwYkzsmp3FQ/Y
	 BaAJ1CYrTrM5z2kD9YRTHFYIMBG2ObRrW/uRknK4RKNBwQH4WGWXBP7zuuPF/ZWhhZ
	 OK1hhpfetgPn6PAW2ksDFjG/RmaLBX5daLNVEJUZ6gNFJc4dfhH0plLHGGH/a2PWnC
	 AUyALhcjIsR014ymeT0c8fXOw6PZLybkKKGgJb5h3zfsDSfZRw9B49GEcLZArnxho2
	 TYxFKOxCMG1tBwOjdeXHA0wR+bfWlq+44Q1Jg4WTuL8LZuHtX9RFv7Oym9+VjxTgxu
	 wbbYyoJyDc76Q==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e767ce72eso37242737b3.1
        for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 09:00:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3gslhShZJMF2GjWsy7CFfrwu0ntFyT1YIQM3LYr+yTU0JdTQ/6soPjaaUHwLBqEOZwLezGWZIGaEcOHtgWQ==@kernel.org
X-Gm-Message-State: AOJu0Yx3NpC0HHX2jSwB+txz7DWYhwdKuhr/FcT/wwnhpsr96Ei4KMl+
	8C6ojlT3v2NU7iPRBNBeF+I1CE6MPltsFzz8agWhAUee5jbXWuc47dbVjbxDCiIDxcRELOdmsz7
	1NjJQgfcU3YZZ8mZuBaz6ktxkYTSyPOY=
X-Google-Smtp-Source: AGHT+IHXZRFLC9W8jvfbNHNGN3lHzZ9+LThVZMheARaZJBg1usSv/9Rk7z2/0N1PCoKCgo62V3bA5aMiN1KHrX3u7uY=
X-Received: by 2002:a05:690c:f8b:b0:70e:73ae:766d with SMTP id
 00721157ae682-712c639d4d1mr190454437b3.3.1750694451915; Mon, 23 Jun 2025
 09:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250623115444.12870-1-slark.xiao@gmail.com> <xlredaznmv2li7vs4vi5dze65d5fhbff4tvvsjcraltmrs7jx7@vdj4n3u2zu5f>
 <CA+5PVA5CuoMv3rTxb=StPWxf2T8KcQjvgJG_1duHG7f8gWuf6Q@mail.gmail.com> <6733b4ea-c682-4a0c-b166-d6e9a3bb4e6a@oss.qualcomm.com>
In-Reply-To: <6733b4ea-c682-4a0c-b166-d6e9a3bb4e6a@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 23 Jun 2025 12:00:40 -0400
X-Gmail-Original-Message-ID: <CA+5PVA516=cSSZZTAZT9Zvx6J=AuOJutVN4Zd9hu4OEZEVuMoA@mail.gmail.com>
X-Gm-Features: AX0GCFvnytqzxe3TU_F0qUHGrhW8Mxh9gip6MZ_TgW2CbvI8Aw4g6ewVr0RzJuE
Message-ID: <CA+5PVA516=cSSZZTAZT9Zvx6J=AuOJutVN4Zd9hu4OEZEVuMoA@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add sdx61 Foxconn vendor firmware image file
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Slark Xiao <slark.xiao@gmail.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 23/06/2025 16:50, Josh Boyer wrote:
> > On Mon, Jun 23, 2025 at 9:42=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Mon, Jun 23, 2025 at 07:54:44PM +0800, Slark Xiao wrote:
> >>> For MHI modems, it defines an edl firmware in kernel drivers/bus/
> >>> mhi/host/pci_generic.c file. According to the requirement of MHI
> >>> driver maintainer, we shall commit this firmware before commiting
> >>> kernel driver support.
> >>> Since different vendor use different firmwares, so we add a
> >>> vendor sub-folder under qcom/sdx61.
> >>>
> >>> Signed-off-by: Slark Xiao <slark.xiao@gmail.com>
> >>> ---
> >>>   WHENCE                                    |   7 +++++++
> >>>   qcom/sdx61/foxconn/prog_firehose_lite.elf | Bin 0 -> 663552 bytes
> >>>   2 files changed, 7 insertions(+)
> >>>   create mode 100644 qcom/sdx61/foxconn/prog_firehose_lite.elf
> >>>
> >>
> >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > I'm sorry, but I have no indication the submitter has the authority to
> > submit this firmware.  It's from a gmail address.  Is your Ack
> > implying Qualcomm is agreeing to submit this firmware?
>
> No, I can not validate the submitter too. It's more about the filename
> hierarchy. I'm sorry for the confusion.

Thank you for clarifying.

Slark, given we can't identify this was supposed to be released and
licensed under the Qualcomm license from your email address alone, we
can't merge this.  We have no idea what the provenance of this
firmware is.

Can you work with someone in Qualcomm to acknowledge this came from
them and it's licensed appropriately by sending the firmware or at
least an Ack from a qualcomm email address?

josh
