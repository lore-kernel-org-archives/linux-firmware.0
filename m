Return-Path: <SRS0=hXOW=GM=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63E5C433E0
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Jan 2021 13:09:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BF491239E4; Sat,  9 Jan 2021 13:09:53 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4DE23998;
	Sat,  9 Jan 2021 13:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F4DE23998
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-ed1-f54.google.com with SMTP id cw27so14018226edb.5;
        Sat, 09 Jan 2021 05:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a3hDtpwBGouOdYKjMsEm0Wu9em19hzXcuUYoaPSC3F0=;
        b=emYVcWwoZNr98qIBOLQVeBiqTAKwPp6+ytdTQ+AiBEPh2rSwxIoWkmdYGGWeHQDNMv
         1+mq9qIgm8GK01jYvIGmjBIeKhlX5Zx5HZOAMHkyaFPRxi20dtquzY/UyAUj16O+nuZK
         xFNeSr50O2tc9qqEw/SLOb8SK748jXnE9pYuLNAmtINN8mOqnP5GdmP0+m+AMeVxU9Nt
         4dlFzTtcmQI2QSArRdSrPaQTq9nHtzdsEfQzrqjw2+RHkMu+sQHYrgooB/MWghckvIdd
         Zf6F87hbyjW6BJRFG3Ej17qfZRLFYJATsqp6oQRgSgMs+Vbn8wF+zaejdlwWaNLl3i4T
         ZC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a3hDtpwBGouOdYKjMsEm0Wu9em19hzXcuUYoaPSC3F0=;
        b=lcIng10PSI12wCpf2JOzRYitw7Qe85DxurVHAgEi7cPOk9hdKiXqkkYSaK7P5p6HdX
         GAFPcmVpXgTl8aJnbhggFgqdO8WxE8KVBRC5s7S+JfRWLO9M3rxYRwctXH0RoCjRncNd
         mTEzKqv8Ej7UomRrf0yU+grTyu/fvpv9ENGwy7QhEVmsEMEU0jlhaNMu1i4rw5yx5IsR
         6GAZslVhSG+tejNnOLjXQ0K3gdmczVGdQHVq03TzrEa4Q6SZa3NX5zYnvl9drfWYNTFD
         bNZ34sq5ySX559cyT/AapyF5BEj+32k69QploZLAf5hAvvJl/Yq3o7f1kn4ouvfMHaRM
         unsQ==
X-Gm-Message-State: AOAM531S6W+TGA4zWS4rWVs5iN2wEXBIusQ420hEeaJsXxrwsucXg7Gj
	x/I1EWTEHhvhKhWI5yU4M1qOnJ/GwAND9o7fGyWyb1cPFBg=
X-Google-Smtp-Source: ABdhPJwWUZNawM90amN54/BXtbsTR3s0eCCMPEJAiepxNO42ul3yeV483hgRYtEM3dO6IJwDTwEmP+QUQP+oNa9WFPw=
X-Received: by 2002:a05:6402:46:: with SMTP id f6mr8437382edu.163.1610197792057;
 Sat, 09 Jan 2021 05:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20210108204916.1724298-1-jeremy.linton@arm.com>
 <CALeDE9M4YZc9Wga5DvUebr4bgM8z3E-Aa7V-WoKxy01GfkaCSw@mail.gmail.com> <CA+5PVA5uogMz53S+gaBGVC5E=miJjDoa+sbRjmubcFXPueOzGQ@mail.gmail.com>
In-Reply-To: <CA+5PVA5uogMz53S+gaBGVC5E=miJjDoa+sbRjmubcFXPueOzGQ@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 9 Jan 2021 13:09:40 +0000
Message-ID: <CALeDE9P+KLXx4qhJs520K+AYkWwOgNEGgMEo2XnZgcLnr=hMuQ@mail.gmail.com>
Subject: Re: [PATCH] brcm: Link rpi4's wifi with newer DMI string
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jeremy Linton <jeremy.linton@arm.com>, Linux Firmware <linux-firmware@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 9, 2021 at 12:34 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Fri, Jan 8, 2021 at 6:35 PM Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > On Fri, Jan 8, 2021 at 8:49 PM Jeremy Linton <jeremy.linton@arm.com> wrote:
> > >
> > > The rpi4 when booted with a full featured
> > > firmware reports a machine id from SMBIOS/DMI.
> > > Since that is used to select the firmware we
> > > need to add a new symlink.
> >
> > Overall the patch is fine but the commit message is very opinionated
> > for a wifi firmware support patch. For one it's not a newer DMI string
> > for Raspberry Pi as all current strings are for device tree and in the
> > context of supporting WiFi the difference between what ever the
> > firmware you're referring to when you say "full featured firmware" is
> > irrelevant and marketing, does that "full featured firmware" support
> > more features of the wifi chipset than the other variants of firmware?
> >
> > Except for the commit message:
> > Reviewed-by: Peter Robinson <pbrobinson@gmail.com>
>
> Not sure what I'm going to do with that.  Do you have a better commit
> message you'd like to suggest, or are your objections not strong
> enough to warrant a rewrite?

How about:
brcm: Add link for Raspberry Pi 4 for matching DMI string

When the Raspberry Pi 4 is booted using a ACPI firmware
the wireless driver matches against a DMI string so
add a link to ensure the wireless works with that firmware
variant as well.
