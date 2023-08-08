Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073B4C04A94
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Aug 2023 10:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD05CC433CD; Tue,  8 Aug 2023 10:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E82C433D9
	for <linux-firmware@kernel.org>; Tue,  8 Aug 2023 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691492139;
	bh=F0q53CZzDy5ceeo51kTfO5+/0O8BjVvghWnhVoP3oCs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=t+TFQ3iQvUcuGyJr5/cBK/uDNCww268C/MjuxHSX8AxHuhSLrOeW0r4lmnHWYJLsa
	 aNOcW0LD7GK9hl0AB42yoOWeuvuhNAgcD3h/FJ1hbFoHvS8jcXTcJfjeicIrBrQQh7
	 D93sMkXSnDNo35sJSIarJUPJ7G/Nff9L0r2jnnSEhRUayToju0gTSJZ9OQc32bV2y5
	 64u6iXT/4RxS1Xfn4XWCLbW001OtxeV60KdenoK7u8yglqH84LSIcIcr031mjBdCgW
	 +9QfPjG5aKTEOlMd8ah7DpaL6KeDM84h+ZbtE+uF6U83OQdhlq/Sn+I/SDDFQA0To2
	 a9kay+hVs0SpQ==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d45caf42d73so3815884276.2
        for <linux-firmware@kernel.org>; Tue, 08 Aug 2023 03:55:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YywleuAwWVaUlRzffrU/dK5DiYms718NIi5AyFnpoR+DeSOQYI7
	+hcCppB1IifasMZFEqRduKRpJr/U+PTIy+YzPeI=
X-Google-Smtp-Source: AGHT+IG3B3t+kVBJ++nB17T0yRgsRx4L8a3UquvWrgEENRWCU43dLVgINlJpZjG+y6I8Oi2V2J7TYbKdoM/OVo4Tyrc=
X-Received: by 2002:a25:d3c1:0:b0:d14:c33c:391a with SMTP id
 e184-20020a25d3c1000000b00d14c33c391amr11126642ybf.52.1691492138747; Tue, 08
 Aug 2023 03:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230807103218.10157-1-hildawu@realtek.com> <20230807133220.7d5952d3@gollum>
In-Reply-To: <20230807133220.7d5952d3@gollum>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 8 Aug 2023 06:55:28 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5VQ92N-qJ3ohBPs6tUT9zQi1MQGSrDLptZO7XzwaUf5g@mail.gmail.com>
Message-ID: <CA+5PVA5VQ92N-qJ3ohBPs6tUT9zQi1MQGSrDLptZO7XzwaUf5g@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "rtl_bt: Update RTL8852C BT USB firmware to 0x040D_7225"
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: hildawu@realtek.com, linux-firmware@kernel.org, Larry.Finger@lwfinger.net, 
	max.chou@realtek.com, alex_lu@realsil.com.cn, mu_hua_chen@realtek.com, 
	hsinyu_chang@realtek.com, kidman@realtek.com, karenhsu@realtek.com, 
	vicamo.yang@canonical.com, Riley.Kao@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 7:32=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> On Mon, 7 Aug 2023 18:32:18 +0800
> <hildawu@realtek.com> wrote:
>
> > From: Hilda Wu <hildawu@realtek.com>
> >
> > This reverts commit 55e7448533e774824cfb34a7eaeb9604608e1a4a.
> >
> > Commit 55e7448533e7 replaced rtl_bt firmware with a v2 binary which
> > is not compatible with older kernels and introduced a regression.
> > Undo that and add the v2 binary later using a different filename.
> >
> > Let the rtl8852cu_fw.bin file keep the firmware format v1 and stay
> > at version 0xD7B8_FABF.
> > Subsequent RTL8852C BT USB firmware format v2 updates will be
> > launched with rtl8852cu_fw_v2.bin
> >
> > Suggested-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > Signed-off-by: Hilda Wu <hildawu@realtek.com>
> > ---
> > Changes in v2:
> > - Modify the commit log to make it clearer. Thanks Juerg
> > ---
> > ---
>
>
> I don't have the HW to test this but FWIW:
>
> Reviewed-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Applied and pushed out.

josh
