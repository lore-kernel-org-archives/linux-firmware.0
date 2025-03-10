Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1925C282DE
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Mar 2025 11:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6DC7CC4CEEA; Mon, 10 Mar 2025 11:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58451C4CEED
	for <linux-firmware@kernel.org>; Mon, 10 Mar 2025 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741607952;
	bh=l4AIyS1D2Qedab4ysVuSXom3qFj8fGZxl9ioEbaYOd4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LGXuNTwUvmD/nwAUDnWWpC/2zhOjWsxr93C9GMHmU9kpDJchP1UebKdiBwfZ8u+6S
	 FrYQAhno9vsJkyfEgglxh8yE0MKfQ8/FfhSIXFcZy059PT9YKg9Zzt/F9Xv3vOsIc2
	 9QgEAMzYx0FlJaNSD77cQx0xKaqj3hSHbQRIPkPeJuLRxI0qPHZXOIl/qMsZuniDyg
	 S4YSG9MnDx8ITfPWsJZj6gIkS1x5mblh9/qGUKtC0+T7CXQGXGXPyDOEzMS5puRWEO
	 PR6Wh7yQXJMoKOeEGidHJ43Kl+zb5oSrbOEL9gmLbn2mBzb4GIDAD6vKzZ62vK7W/N
	 MiI4K6WuhL9SA==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5dcc411189so3675727276.0
        for <linux-firmware@kernel.org>; Mon, 10 Mar 2025 04:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJmdbn7XU1FqR9S3qXKll9yIhAx/aD3DkfDGexFd/RdBBD71rbTFg9wEHPtDB8fKPg/4N9qJOSvVjo2AsWaA==@kernel.org
X-Gm-Message-State: AOJu0YwBW4W84mVOPSekwaSjw8CVCtdnZKUWzQyNQgHKNyLMBmNr1kpJ
	OxP3E6FR3hTrgxzjVkhzi2t2McttAtctAufqMrLXMDCXYoa87yddMHPZqYIaBuvdmPtjuvUl0+m
	kbJ4XxVeDp1VOf5IUoJD3CRm/PoM=
X-Google-Smtp-Source: AGHT+IFRxfdBAO64MgeQvuq+L1PO2gQg85sdJSv8QxQNa+vkxYt1JIxjOAK66FffLsSTdT68R8xMWpfl2S5ffsAYZWw=
X-Received: by 2002:a05:6902:1693:b0:e60:87a0:6216 with SMTP id
 3f1490d57ef6-e635c101147mr18373190276.5.1741607951511; Mon, 10 Mar 2025
 04:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <628a50fa-d0c1-49f6-8df1-9a7e9abacb58@quicinc.com> <fblss3wgrwhytnedaafxc5vrz7mvo6fnckqjzmflrelrvyqlbd@xqvdtuoioqih>
In-Reply-To: <fblss3wgrwhytnedaafxc5vrz7mvo6fnckqjzmflrelrvyqlbd@xqvdtuoioqih>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 10 Mar 2025 07:59:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5dDZJdY2f-CZYqCBWkUP7HzqgTTYJrPyz1=R+fV+hgqg@mail.gmail.com>
X-Gm-Features: AQ5f1JrQqWnBWzisP9m_gMrEqXWSgBY-Tfb4g9S_xlWPR6cydG4A5mapYm-vQtE
Message-ID: <CA+5PVA5dDZJdY2f-CZYqCBWkUP7HzqgTTYJrPyz1=R+fV+hgqg@mail.gmail.com>
Subject: Re: [GIT PULL v3] QCA: Add and update Bluetooth firmwares for WCN685x
 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/474

josh

On Thu, Mar 6, 2025 at 3:16=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Mar 06, 2025 at 03:57:06PM +0800, Zijun Hu wrote:
> > Hi linux-firmware maintainers
> >
> > Here's a pull request for btqca bluetooth driver. Please let me know if
> > you have any problems.
> >
> > The following changes since commit 41a528251649772edbcb705a40e617fd1485=
8e53:
> >
> >   Merge branch 'intel/guc_70402' into 'main' (2025-03-04 19:09:49 +0000=
)
> >
> > are available in the git repository at:
> >
> >   https://github.com/zijun-hu/qca_btfw qca_btfw_0305-2
> >
> > for you to fetch changes up to f573fa75ee6cdc6d176cadd0e63059f6c082928b=
:
> >
> >   QCA: Add Bluetooth firmwares for QCA2066 with USB transport
> > (2025-03-06 15:43:38 +0800)
> >
> > ----------------------------------------------------------------
> > Zijun Hu (4):
> >       QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00653
> >       QCA: Update Bluetooth QCA2066 firmware to 2.1.0-00653
> >       QCA: Add two bluetooth firmware nvm files for QCA2066
> >       QCA: Add Bluetooth firmwares for QCA2066 with USB transport
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> Thank you!
>
>
> --
> With best wishes
> Dmitry
