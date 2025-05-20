Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E09CC3DA6D
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 12:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F4ACC4CEEA; Tue, 20 May 2025 12:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19881C4CEEB
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 12:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747745480;
	bh=hoOrYiX3fNWY0XrWJd204QoyPZG6is9TubBQFiHm5d8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=IfHWDyzbi3J0XH1RW6JFHH/qdPfZH9g/6xWqhegSiAo84+9PZOC84Rk+orqwDN2w/
	 LPlydSeWYbtcKkwjqYtKqATP1t1q2Y/oUOFivhrAh5obdBZ5ZxFqMsKbHoE0u9EfDA
	 jxBpahgxzQnV+mrvt76IGTw/ZljG+teX6Amyh1mYao+V0j3OHqo0qrolcmPy1TBNkx
	 c84A+59PRuQPHLsMB4fr+ePIIvvYq4A4KVhRXQ14y3NB3sG7u/HYdzYNL4ez0NaWLy
	 4K4njT17OGezErSNGUMs33ltkYbLEfpvfTtMETXspBd4Y8WIo1r9FERqnpvnDy1CW5
	 lOzNVCwRKs8Vg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70ca2888e99so35001887b3.0
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 05:51:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7FeD4YSNf3E431z6xVUVzSH7t6/3lJf0PwM4tljKdHXB0n6duml+aae8QFXP6+tY7bKBv6vbgrlm9SbQZOQ==@kernel.org
X-Gm-Message-State: AOJu0Yyu7c8GJq0lXj7yf6eTL5UX1OEVB32ql+vhjplYN+q8ipUbgYQH
	V+albaNnsPCwSAIE/DwAkB+qWjZQm48zq2juCWuoczuD65t50w5EoSmkEL27G9kxbjspfcEkwfX
	rNTvR6uHge35WKbYROSgz5B9SsaC89H4=
X-Google-Smtp-Source: AGHT+IEv2pVfKzTD3pfEU7Y2LXY0Kvl3zDbkHx1qkwjYD2LyQgbPNFbOCl2qxzUDNIia/5iXFb9JPJTiIJQMa8MJYSs=
X-Received: by 2002:a05:690c:48c3:b0:70c:b882:2f5 with SMTP id
 00721157ae682-70cb882051fmr186398057b3.2.1747745479314; Tue, 20 May 2025
 05:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <7b30419d-e801-44a3-86a4-b18da83ad066@oss.qualcomm.com>
 <netxlhikdd2jlievf7mevbbfpffaz4ttkjw6eykwvpklccoxbw@qtzh5hiqwcpv>
 <CA+5PVA5ndCY3gzjmUAD3_=yb4Xa_NUoAFxddvWJLgvZoy7cObQ@mail.gmail.com> <CAO9ioeV2FAmv6_K5BfE4=syg2XbAm8A3X0W7jU8M-jhN15547w@mail.gmail.com>
In-Reply-To: <CAO9ioeV2FAmv6_K5BfE4=syg2XbAm8A3X0W7jU8M-jhN15547w@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 20 May 2025 08:51:08 -0400
X-Gmail-Original-Message-ID: <CA+5PVA72FxrKASpgq3zNiui3GZ3wEb286_WG2hZxiZbaUC5XBQ@mail.gmail.com>
X-Gm-Features: AX0GCFsVo1ZpNZgk96fFwzXBsj0LaoiI2M_LzuS-oFvxb3jYD0j7WVzHis7W-Lo
Message-ID: <CA+5PVA72FxrKASpgq3zNiui3GZ3wEb286_WG2hZxiZbaUC5XBQ@mail.gmail.com>
Subject: Re: qcom: add QUPv3 firmware for QCM6490 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, linux-firmware@kernel.org, 
	mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 8:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, 20 May 2025 at 15:43, Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Tue, May 20, 2025 at 6:48=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Tue, May 20, 2025 at 12:51:47PM +0530, Viken Dadhaniya wrote:
> > > > The following changes since commit 759c4acafb4a80d76885e4a1542229a2=
7d677322:
> > > >
> > > >   Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:5=
9:07
> > > > +0000)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > qupv3-fw-qcm6490
> > > >
> > > > for you to fetch changes up to be949ef4113e8dfabafae6313f6bbe88520f=
483e:
> > > >
> > > >   qcom: add QUPv3 firmware for QCM6490 platform (2025-05-20 12:07:5=
3 +0530)
> > > >
> > > > ----------------------------------------------------------------
> > > > Viken Dadhaniya (1):
> > > >       qcom: add QUPv3 firmware for QCM6490 platform
> > >
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Mario merged the original PR already.  Is the only update the change
> > of the driver name in the WHENCE file?  If so, I'll just change that
> > in a separate commit.
>
> Yes, it is the only change.

Fixed.  Thanks.

josh
