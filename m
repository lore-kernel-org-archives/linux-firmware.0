Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89D2C433E0
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Jan 2021 12:34:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BEDCC23A58; Sat,  9 Jan 2021 12:34:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EB1823A3C
	for <linux-firmware@kernel.org>; Sat,  9 Jan 2021 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610195642;
	bh=SgwLVnDWSYhew9jW5whggwoh/PnivLWzb68COhVELsE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=AI+oefgSI9cqk+STBYKN+R3F8yntjJ7ymBwJdNsBfY060sRkafE3MBJvmCIo3r7JD
	 oMTl/d5U4/dumfPKR27OyaSzkJDV0yq/nAiMaowrX2gPi1y9OEq74ydmgLTb/cBOMl
	 2NKnVcIG4FD1QGoIZk/+YwPdpuvdXxg2W9fwEJDFy/2suSzOEEGxFcMKEnsWfE6ZwU
	 4Up0YsPFj/J1IQGl6gt7gCBNtu0wNBUGyW3A4ime1PrJ6jI/ySClbBAHSpftSbJqdT
	 WPm2Zd09IOAvckFhBPZmsHMqlP+qXvuq6gQ/z/mlyepCFVfhACuVR3gslaoelhBbsB
	 SFxdsbToDRiGQ==
Received: by mail-il1-f180.google.com with SMTP id t3so9074572ilh.9
        for <linux-firmware@kernel.org>; Sat, 09 Jan 2021 04:34:02 -0800 (PST)
X-Gm-Message-State: AOAM531snp7shgpKw99D9xk8BdZZfShpCcFi2+TWs8VC/A1U3PitXuIN
	JbKkjRx5WGi6ueuNVEqBSrGwL+OXXPVST0COY4Q=
X-Google-Smtp-Source: ABdhPJzm4icCgj62GVZ2xH1IwINzDND6dzBCVOAaNEB1j3O5tAyDB8MAPOvUcerXYefGNVNzbbFiUu9kXX4+K8XssKY=
X-Received: by 2002:a92:155b:: with SMTP id v88mr8399711ilk.303.1610195642041;
 Sat, 09 Jan 2021 04:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20210108204916.1724298-1-jeremy.linton@arm.com> <CALeDE9M4YZc9Wga5DvUebr4bgM8z3E-Aa7V-WoKxy01GfkaCSw@mail.gmail.com>
In-Reply-To: <CALeDE9M4YZc9Wga5DvUebr4bgM8z3E-Aa7V-WoKxy01GfkaCSw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Sat, 9 Jan 2021 07:33:51 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5uogMz53S+gaBGVC5E=miJjDoa+sbRjmubcFXPueOzGQ@mail.gmail.com>
Message-ID: <CA+5PVA5uogMz53S+gaBGVC5E=miJjDoa+sbRjmubcFXPueOzGQ@mail.gmail.com>
Subject: Re: [PATCH] brcm: Link rpi4's wifi with newer DMI string
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>, Linux Firmware <linux-firmware@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 8, 2021 at 6:35 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Fri, Jan 8, 2021 at 8:49 PM Jeremy Linton <jeremy.linton@arm.com> wrote:
> >
> > The rpi4 when booted with a full featured
> > firmware reports a machine id from SMBIOS/DMI.
> > Since that is used to select the firmware we
> > need to add a new symlink.
>
> Overall the patch is fine but the commit message is very opinionated
> for a wifi firmware support patch. For one it's not a newer DMI string
> for Raspberry Pi as all current strings are for device tree and in the
> context of supporting WiFi the difference between what ever the
> firmware you're referring to when you say "full featured firmware" is
> irrelevant and marketing, does that "full featured firmware" support
> more features of the wifi chipset than the other variants of firmware?
>
> Except for the commit message:
> Reviewed-by: Peter Robinson <pbrobinson@gmail.com>

Not sure what I'm going to do with that.  Do you have a better commit
message you'd like to suggest, or are your objections not strong
enough to warrant a rewrite?

josh

> > Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> > ---
> >  WHENCE | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/WHENCE b/WHENCE
> > index cbde48d..1f69078 100644
> > --- a/WHENCE
> > +++ b/WHENCE
> > @@ -2711,6 +2711,7 @@ File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
> >  File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
> >  Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
> >  File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
> > +Link: brcm/brcmfmac43455-sdio.Raspberryi\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> >  File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
> >  File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
> >
> > --
> > 2.26.2
> >
