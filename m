Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A10CF9C6E
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 12:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B119CC4CEC7; Mon, 23 Sep 2024 12:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94904C4CECE
	for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 12:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727094054;
	bh=1B0SrKFjHfVwFRiIuv4ZUAsECziKG0FX8duWYCtXq4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=exnEXUWwHLUXVCDAbq+/GEZFuj8ETPpyrsTbo1SlI4LrdiJko9lXb3OJLHlFg6N6G
	 6mp7PA4B161DmrFpkoJFEKXYh3k27Q1m5NzZCQsXdG4810Hi/UpncBonO8pdeF04Ng
	 kBcrMlc3Rn92YPRQIS/jaXeg1YQf0XJVMb/4RSTOOJAmmHwC0DN4QN2a4UtVU4Vzam
	 oaSHQ/EEAUxUP6NR9cjcWHzdCrTIhws44Jw+ypoYg7QvMKTa3xXHi1ooOcF2aWdckv
	 Y+1KEEIcSs8d6xGoXVKl2vXoyxAGtQJVBdSHD0yDjdtoBItftgoObWL9rR+iuIVPcT
	 VVRjdtkJ1io1w==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6dbb24ee34dso35054037b3.2
        for <linux-firmware@kernel.org>; Mon, 23 Sep 2024 05:20:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzOiEeVRoZrGIXOogmEiPyMb9TX0cvi+hYNTUXq/+KYNfZOxA72ETXDgYv72F2I//GFyxm9MoowahLz0b9Cg==@kernel.org
X-Gm-Message-State: AOJu0YwekV/G+3o3I01Y59imz9Pa4KTSxEOeCNP6UjSRGRfBZ6fA4lA/
	9v6Fs13hi/Z+d840K/tHyoSC2ysEKSkjc5TtQTjhWAhksCm/QJcrejWEnkOiOehJCcYv6ubD8mO
	vGHwSjcrgSPRqjFOVd6bipFscltI=
X-Google-Smtp-Source: AGHT+IEY+om/TrA+d35I9qOcGZKpA/TaI1QnMK5c+hIT29txiCR2pO8hcJ7TLj9neHD2fQcpBkLCcEOhrGSO+tbsryk=
X-Received: by 2002:a05:690c:2507:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6dfeed31d35mr66772847b3.15.1727094053708; Mon, 23 Sep 2024
 05:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <dgdqakvmsezdusggiv3c53a3m64nwe2ybhgfv2dm5pldl2kkpg@4tge74omjzrr>
 <20240923.050651.1829650131953275090.fujita.tomonori@gmail.com>
 <tb5ykgcjrvowen2w7wklq46ypibmlzi4l3whdzxwrecelbzyw5@cw45aljcai24> <20240923.102214.413602747512610544.fujita.tomonori@gmail.com>
In-Reply-To: <20240923.102214.413602747512610544.fujita.tomonori@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 23 Sep 2024 08:20:41 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7Wwep-tUjzK42WTxpZvES6HShpV44p1jxTuffdE94Yvg@mail.gmail.com>
Message-ID: <CA+5PVA7Wwep-tUjzK42WTxpZvES6HShpV44p1jxTuffdE94Yvg@mail.gmail.com>
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: dmitry.baryshkov@linaro.org, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 6:22=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Mon, 23 Sep 2024 13:02:02 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>
> > On Mon, Sep 23, 2024 at 05:06:51AM GMT, FUJITA Tomonori wrote:
> >> On Mon, 23 Sep 2024 06:40:10 +0300
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> >> >> >> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 E=
thernet Phy
> >> >> >> >> +File: qt2025-2.0.3.3.fw
> >> >> >> >> +Version: 2.0.3.3
> >> >> >> >> +
> >> >> >> >> +Licence: GPLv2.
> >> >> >> >
> >> >> >> > If it is GPLv2, where is the source code?
> >> >> >>
> >> >> >> For example, the driver is available at Edimax site:
> >> >> >
> >> >> > Where is the source code for the firmware itself? (or quoting GPL=
 v2
> >> >> > "preferred form of the work for making modifications to it").
> >> >>
> >> >> It's included in the distributed file. Someone extracted the file a=
nd
> >> >> uploaeded. To save you the trouble, here are the links:
> >> >>
> >> >> - the firmware
> >> >> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/=
QT2025_phy.h
> >> >> - the PHY driver
> >> >> https://github.com/acooks/tn40xx-driver/blob/vendor-drop/v0.3.6.15/=
QT2025_phy.c
> >> >>
> >> >> Am I understanding your question correctly?
> >> >
> >> > Not quite. You are stating that the firmware is also covered by the
> >> > GPLv2. As such we have to provide source code for the firmware blob.=
 In
> >> > other words, the "preferred form for making modifications" to the
> >> > firmware file, not just the C source file containing the embedded
> >> > binary.
> >>
> >> Ah, understood. It's impossible to get source code for the firmware
> >> blob. What's an appropriate licence for this case?
> >>
> >> Redistributable or Unknown?
> >
> > Well, either way it might be problematic for linux-firmware. Is the
> > original vendor still alive?
>
> No, the vendor went out of business.

I don't think we can take this firmware.  While we do have firmware
listed as "License: Unknown" in the repository, they've been there
since the very early days and they also came from hex dumps in the
upstream Linux kernel.  This driver wasn't merged upstream and we
don't know what license the firmware blob is under.

josh
