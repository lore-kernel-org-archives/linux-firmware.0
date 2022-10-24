Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8325BC38A2D
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Oct 2022 16:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D885C43140; Mon, 24 Oct 2022 16:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F33C433D7
	for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666628304;
	bh=hX21Dssca+NLeXrL9URFGDEhdKNfQ2hZOAd0kbP5xV8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Qg31UK9kJf68pE5wCMgPLaRigVdoVhfHE6Av0jhYzZzHzi5O4MX+K17A5JabgtepL
	 tWkrCXtD+AOfnsA8mS1udZCov1tcSFHUREpLlC7sufFmoiOcpQ8J80cqillOruid1z
	 UDKgnlUAB2Sy3nTncC4ObhigSfmFAAiBrux9dm3SWKBuv6OA8tXA5XKMO4aqsBK/Ad
	 cWPl/GKZCrcm1EhYenONPn4WUQl7bk7u2lQcv0LSwl7CwBOTVsQ70FWtdYXCLnKFEt
	 0eX7hqwE2q6sxSHel6+htgoorvaUhqfgQ+sMD5990X0K638VcxrNRfVFxxuU+Rtl7g
	 bBHlDUHnvNZ4g==
Received: by mail-ot1-f47.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso6170298otb.6
        for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 09:18:24 -0700 (PDT)
X-Gm-Message-State: ACrzQf0E0zk0YyaLCjOETZ89WIPtS0jOpP+nunslJ8TTo4wVs38RQG/e
	XoEISZnRr1AvobK5VAkz0yp1gMYs2V9N2V2jnig=
X-Google-Smtp-Source: AMsMyM5I8Tuim+yr2nlCZ1dw9d43mkLy164RCipgXSVkX1V3Ij8Y22cBbZNhk2BPu1qROpsKMHtZb9tt9ySjY3uN08A=
X-Received: by 2002:a9d:12a6:0:b0:661:d26c:708c with SMTP id
 g35-20020a9d12a6000000b00661d26c708cmr16789996otg.160.1666628303302; Mon, 24
 Oct 2022 09:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAFqVybqsda75NPUAYX47FCQp0OAkRWOUw7K9UbPawbNo=Th2bQ@mail.gmail.com>
In-Reply-To: <CAFqVybqsda75NPUAYX47FCQp0OAkRWOUw7K9UbPawbNo=Th2bQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 24 Oct 2022 12:18:12 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4SOyhji1Y-OzFkAJsRz6k70qdKOOvPEKN4PyCBUygCsA@mail.gmail.com>
Message-ID: <CA+5PVA4SOyhji1Y-OzFkAJsRz6k70qdKOOvPEKN4PyCBUygCsA@mail.gmail.com>
Subject: Re: Feature request: Adding tools to be able to split the
 linux-firmware package into separate components
To: Azamat Hackimov <azamat.hackimov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 12:15 PM Azamat Hackimov
<azamat.hackimov@gmail.com> wrote:
>
> The size of linux-firmware already reaches over 1 GB. Linux
> distributions typically do not split the linux-firmware package into
> components, which results in the user's installation storing files
> that are never used by the system and take up unnecessary space. This
> problem is especially acute for embedded systems or systems running in
> containers.

Why is firmware installed in containers at all?

> There has been a request among some distributions to separate
> linux-firmware into components in order to make it easier for the user
> to install and use firmware. Among them are Arch Linux[1], Fedora[2],
> Alpine[3], however, separation on the side of the maintainers of the
> distribution is fraught with difficulties associated with the
> inability to reliably separate the individual components of the
> linux-firmware package by driver or even by category.
>
> I propose to provide a similar mechanism for filtering prerequisites
> on the side of the linux-firmware package. To do this, I propose to
> transform the WHENCE file into a structured file that can be processed
> by an additional tool that can filter the necessary components by
> driver, category, manufacturer or license.

If someone is going to implement this, I'd suggest just creating a new
file to start with, and keeping WHENCE as-is.

> Suggested structured file format is YAML (although other formats are
> possible), example entry (actual existing entry from WHENCE):
>
> ```
> drivers:
>   - driver: emi62
>     description: EMI 6|2m USB Audio interface
>     category:
>       - drivers/usb/misc
>     vendor: Emagic
>     license: Unknown
>     info: |
>       Converted from Intel HEX files, used in our binary representation of ihex.
>     files:
>       - name: emi62/bitstream.fw
>         version: 1.0.0.191
>         info: DATE=2002oct28
>       - name: emi62/loader.fw
>         version: 1.0.2.002
>         info: DATE=10.01.2002
>       - name: emi62/midi.fw
>         version: 1.04.062
>         info: DATE=16.10.2002
>       - name: emi62/spdif.fw
>         version: 1.04.062
>         info: DATE=16.10.2002
> ```
>
> The firmware-install utility to query and filter a structured file
> should parse the following options:
>
> firmware-install list [--category <LIST>] [--driver <LIST>] [--license
> <LIST>] [--vendor <LIST>]
>   List drivers and firmwares that applies to filter

This implies the linux-firmware project and utilities would have to
monitor Linux kernel driver information.  I don't think we want to tie
the two directly together like that.  There's little need from the
firmware side because the kernel drivers already have the firmware
they need embedded in the module info.

> firmware-install show <DRIVER>
>   Show information about driver

This is already covered by modinfo.

> firmware-install install <DESTINATION> [--category <LIST>] [--driver
> <LIST>] [--license <LIST>] [--vendor <LIST>]
>   Install firmwares that applies to filter

This would be useful for highly specific, non-changing installations
(e.g. embedded as you mention).  However, a distribution is not going
to use this as they have to install firmware for any kind of device a
user may have.  They can already package the files in separate
distribution packages if they wish.

> firmware-install check
>   Check format and content of structured file (like check_whence.py does)
>
> After the implementation of such a utility, maintainers of Linux
> distributions will have a convenient tool that will allow them to
> create sets of linux-firmware-* packages with content separation
> instead of a monolithic installation of all firmware.

They can and do already do this.

I'm not against the overall idea, but I don't have time to implement
anything for this and it's unclear to me what the overall value would
be.  If someone wants to send patches for this, I'd happily review
them.

josh

> [1] https://bugs.archlinux.org/task/72559
> [2] https://fedoraproject.org/wiki/Changes/Linux_Firmware_Minimization
> [3] https://lists.alpinelinux.org/~alpine/devel/%3C4d19a51c-3eba-9775-0208-4d87da66effc%40bitmessage.ch%3E
