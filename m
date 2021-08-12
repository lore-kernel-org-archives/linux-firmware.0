Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7ADC4338F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Aug 2021 13:20:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACEC76109D; Thu, 12 Aug 2021 13:20:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 977D861059
	for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628774453;
	bh=SmFrTJJSIw+ZjGvmfeQqFBWe4f/KM3vwF8e154irn3s=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aSTf/t+gUaJ42+2n8SAd/dWBSUOk/Jy6zMqZat8VarEWrXpfbfFKmEegIwvbAYg+9
	 e52lP/yZXAtYSsX6rY4bfWkJNjis8U7o85nK7vAYDhj5koDDZZJsQizJPurBbF/4oH
	 4qUuD8RII7AG6JbJP2oqLlZjyKPEKBZ/bjx/iYCMqBpGRc4UYqrdQf/4jgmJFc0tBt
	 efit8lnMHJybiUlweW0td/H+6uR5CLPhzCgz5S0/TGm5505vs4VA6/dYltP9tKt1BL
	 Gbi1ZkzcaO/2GFUKal0wPK3U9DxjUzfOrJ+nFy96KOAHvT508geo1HK1Zff8Bk+Zyt
	 /z61ic6EqwEUA==
Received: by mail-io1-f51.google.com with SMTP id f11so8317356ioj.3
        for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 06:20:53 -0700 (PDT)
X-Gm-Message-State: AOAM532whq5u1dsyOFpwVKCamTveJxXsc2nAl82xbsWGGhuj0whufpFR
	Mc9Mot2RaxqJBkjwrJGiz1rJpfeh6rNfbUwbTKA=
X-Google-Smtp-Source: ABdhPJz8F2RQYfRQMvl3CqyNFjn+cNq1rfyylE+sKGlna5cjNZTMabLNcEGu1Hp0EP2ZKASV2NyCQFFZpGSeP44ic7Y=
X-Received: by 2002:a05:6602:1210:: with SMTP id y16mr2938703iot.159.1628774453074;
 Thu, 12 Aug 2021 06:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <9196f77c4b203dce3982e31d241392de@codeaurora.org> <2a70be94a1529153aed2a158e7b1e523@codeaurora.org>
In-Reply-To: <2a70be94a1529153aed2a158e7b1e523@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 12 Aug 2021 09:20:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4YYmt9WktNdqKBJFUrnqe21S5GKG8-zxtp2zXuVNH6+w@mail.gmail.com>
Message-ID: <CA+5PVA4YYmt9WktNdqKBJFUrnqe21S5GKG8-zxtp2zXuVNH6+w@mail.gmail.com>
Subject: Re: Request to update WCN6750 FW file
To: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, mka@chromium.org, 
	"Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux-bluethoth@vger.kernel.org, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, Hemantg <hemantg@codeaurora.org>, 
	abhishekpandit@chromium.org, Balakrishna Godavarthi <bgodavar@codeaurora.org>, 
	adhudase@codeaurora.org, sampnimm@codeaurora.org
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Wed, Aug 11, 2021 at 3:09 AM <smagar@codeaurora.org> wrote:
>
> On 2021-07-27 10:03, smagar@codeaurora.org wrote:
> > Hello Team,
> >
> > Please include new firmware bins for QCA BT SoC WCN6750.
> >
> > Snapshot of pull request is as below, let me know if anything is
> > missing.
> >
> >
> >
> > The following changes since commit
> > 168452ee695b5edb9deb641059bc110b9c5e8fc7:
> >
> >   Merge tag 'iwlwifi-fw-2021-07-19' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
> > into main (2021-07-19 14:35:47 -0400)
> >
> > are available in the git repository at:
> >
> >   https://github.com/suraj714/linux-firmware-bluetooth master
> >
> > for you to fetch changes up to
> > 5dd32d878e7561789422f3e1fe0f7c48fcc00e04:
> >
> >   qca: Add firmware files for BT chip WCN6750. (2021-07-26 16:38:01
> > +0530)
> >
> > ----------------------------------------------------------------
> > smagar (1):
> >       qca: Add firmware files for BT chip WCN6750.
> >
> >  WHENCE           |   6 ++++++
> >  qca/msbtfw11.mbn | Bin 0 -> 129348 bytes
> >  qca/msbtfw11.tlv | Bin 0 -> 117136 bytes
> >  qca/msnv11.bin   | Bin 0 -> 5633 bytes
> >  4 files changed, 6 insertions(+)
> >  create mode 100644 qca/msbtfw11.mbn
> >  create mode 100644 qca/msbtfw11.tlv
> >  create mode 100644 qca/msnv11.bin
> >
> >
> >
> > Regards,
> > Suraj Magar
>
> Hi Team,
>
> Any update on this?
