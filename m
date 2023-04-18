Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5047DC6FD18
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Apr 2023 12:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34C3FC433A8; Tue, 18 Apr 2023 12:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF14C433EF
	for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681819636;
	bh=egy+qJoqGYAr2jREM5FQSOBmnwKp+dFdn0CdHNlpzxM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=H+n46AsckAXon6sknoGBYLa/ZN8wpH/32WYACuGmz0Xv3wLUZJ8rP67MmWBN5jLCX
	 qiXHN3QcPeovUjPkt4yhicGVyfukc/RpSod0QYlATKeKi6enZqKfP0IzYHYqfDv1JY
	 EydS5w/m2M0vUeoycOo361bZsZ4USX8YJjFWabXnp8eiAQ8+uKggdXg4nKvxTJIdxw
	 PiKNJFQbhVLnmBF9whsU8MpYnLB6VSph38xlQw2bKnW5XrjGHwRO1JkKV9XgbpJVyw
	 B0pemkxHiGDSXllhNLyXQ+R3KOiRwdT8x2yAxZ7Yl9OCN29oc43yp1WDgGnqGAxCsV
	 8cbiINKLS85Ug==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-54fb615ac3dso241393627b3.2
        for <linux-firmware@kernel.org>; Tue, 18 Apr 2023 05:07:16 -0700 (PDT)
X-Gm-Message-State: AAQBX9dM+wFlUPEznWPOgkNVzAc7Xk84nUbReLR8obdV4bSnYdqvYacu
	J9B7Q8Tq/G1YSX3CRv9th4PkPkawYHIRU0dp+bo=
X-Google-Smtp-Source: AKy350YnPAiagIueAn8twxol36zT4p6JWpDHliVxTSoII+Da5zHPZFQ3XCXBwrRGjmAbMUMxzt6674fQRpbeaCS+LMo=
X-Received: by 2002:a0d:e60d:0:b0:54f:9b01:b353 with SMTP id
 p13-20020a0de60d000000b0054f9b01b353mr17584490ywe.9.1681819635224; Tue, 18
 Apr 2023 05:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230418055604.5650-1-max.chou@realtek.com> <73261d9e-2f38-da16-03ad-832804d1bc92@molgen.mpg.de>
In-Reply-To: <73261d9e-2f38-da16-03ad-832804d1bc92@molgen.mpg.de>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Apr 2023 08:07:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6eNTs5UK53dpsZ3LwFQ_eCDEBpDq4gzhQAbA9UBJsw7Q@mail.gmail.com>
Message-ID: <CA+5PVA6eNTs5UK53dpsZ3LwFQ_eCDEBpDq4gzhQAbA9UBJsw7Q@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Add firmware and config files for RTL8851B
To: Paul Menzel <pmenzel@molgen.mpg.de>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Max Chou <max.chou@realtek.com>, linux-firmware@kernel.org, 
	linux-bluetooth@vger.kernel.org, alex_lu@realsil.com.cn, hildawu@realtek.com, 
	karenhsu@realtek.com, hsinyu_chang@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 2:41=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear max,
>
>
> Thank you for your patch.
>
> Am 18.04.23 um 07:56 schrieb max.chou@realtek.com:
> > From: Max Chou <max.chou@realtek.com>
> >
> > This firmware/config is submitted for RTL8851B BT USB I/F.
> >
> > Version: 0x0411_7851
> >
> > Signed-off-by: Max Chou <max.chou@realtek.com>
> > ---
> >   WHENCE                      |   2 ++
> >   rtl_bt/rtl8851bu_config.bin | Bin 0 -> 6 bytes
> >   rtl_bt/rtl8851bu_fw.bin     | Bin 0 -> 46376 bytes
> >   3 files changed, 2 insertions(+)
> >   create mode 100644 rtl_bt/rtl8851bu_config.bin
> >   create mode 100644 rtl_bt/rtl8851bu_fw.bin
> >
> > diff --git a/WHENCE b/WHENCE
> > index 7cc9afd4..d15b3507 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -3820,6 +3820,8 @@ File: rtl_bt/rtl8852bu_fw.bin
> >   File: rtl_bt/rtl8852bu_config.bin
> >   File: rtl_bt/rtl8852cu_fw.bin
> >   File: rtl_bt/rtl8852cu_config.bin
> > +File: rtl_bt/rtl8851bu_fw.bin
> > +File: rtl_bt/rtl8851bu_config.bin
>
> Please sort it?

I don't think that's needed.

josh
