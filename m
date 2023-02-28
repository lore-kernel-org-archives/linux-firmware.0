Return-Path: <SRS0=wfpw=6Y=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352F8C64EC7
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Feb 2023 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1868CC433D2; Tue, 28 Feb 2023 17:20:29 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDB31C433EF;
	Tue, 28 Feb 2023 17:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDB31C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-536cd8f6034so292345617b3.10;
        Tue, 28 Feb 2023 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZnwL8yrajiu8pdnIA3dHCWWn5GKk13WNeK/MOoaqdg=;
        b=IJQqTR0cdme5SZC3GEaas8r2pygUzUafM3VUpTvde01sUwqcnkz2eZ/ZK8RM4YwdBJ
         OwZa2tKldr8aoObhrptUL9MlX460ANWirJVZ5eewugiFM1KEWdJQI8TDg4h+J5p812Cg
         7a1ysz9K0nrpZzTj5bo0TJLvamZMus7KZrf6DLuYi0Q2U8qt9mDwK3vet9/Kt3f5qrGM
         P6BX1ua7QeS6s8GsfKrCJ9N99avP0BO5yw7aYUvg9EAzErnCxzgaF/g3NzZcX3req27j
         7z+wpqZNVfFUY2dL9IvbJX7yCaBT6NLw4+pLelAubJV/urWVpG0vv3XUHNSSmhftU9yT
         7Cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZnwL8yrajiu8pdnIA3dHCWWn5GKk13WNeK/MOoaqdg=;
        b=gHYTYJwHrtMu/1d+zplaMGH8Si0uyIExArlgYQ1u2gchjzCbmA4WMsYWPjVPYmIMi0
         KceFhiaEvKIkK90fO2J51UaVA1C6fC6WlNiFraVRXDp9QjRPJOelsnGSqcj547eMQTtB
         N8Z9xszbJu/ErVKOdjb+KUvu6ug5TmVVp3l9Az8shVcihig6NjVxQ7XbxAkPAFZIJ5Px
         y72l9JAn/A2eEvJkpMiS2br/VcN/A5DkLsGqXSGTeYf0LwkZwMGIuESa5WCAb+Ts4eX1
         +SEu8T82DhMi4fqQHp899Zxjk+BU8HnDA4w9PCNQMhBVPl/qeXL1xOcylLAkNr4b0lFA
         Pn3Q==
X-Gm-Message-State: AO0yUKV8s/GkPvK1izNvXVbKWZaZXQYlYAlb4camxssgsHImnVeS5Vve
	KScv0b3GtjPDfsTE6tKrkflKLdZ0lZs/S1etU7ckfeHyzZA=
X-Google-Smtp-Source: AK7set/dF7o7l3iX0RXIlqrwqc2x4Bm9JU8Fxh2rzoVCD3MLe8QCQBqlI0FqA1UrhpVGGtdhm/mjf7aMPMT3KfZVq3U=
X-Received: by 2002:a5b:683:0:b0:a09:32fb:be73 with SMTP id
 j3-20020a5b0683000000b00a0932fbbe73mr579540ybq.0.1677604826651; Tue, 28 Feb
 2023 09:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
 <CACvgo50K0kSFh_bRUz5=0oSL2W92XERiyzGZhD1SjT5u6A0cgg@mail.gmail.com>
 <09c319d0c79967377239df12fa8a857107235bca.camel@infradead.org>
 <CACvgo53kg-_htw8ecrBnJHyFqD5tx2KjmJvByvAVZtsA5gzZ9Q@mail.gmail.com>
 <c50231609fb4597a1443fbc2dec46fce4589d0eb.camel@infradead.org>
 <CACvgo52_rV-CgC4z4S2O98VOMOY-4=A011dBsGJB8+0_bdgDgg@mail.gmail.com> <e8eed009ec125ce9ab6e7bcaf64cac7e4302146a.camel@infradead.org>
In-Reply-To: <e8eed009ec125ce9ab6e7bcaf64cac7e4302146a.camel@infradead.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 28 Feb 2023 17:20:15 +0000
Message-ID: <CACvgo50RhmRKnUoos2wGWOP-Pb8oGo1BMPunfTtBQO0eX1D2Dg@mail.gmail.com>
Subject: Re: [PATCH 00/15] Misc fixes, sanity checks and xz/zstd compression
To: David Woodhouse <dwmw2@infradead.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org, 
	Adam Sampson <ats@offog.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Feb 2023 at 17:03, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-02-28 at 17:02 +0000, Emil Velikov wrote:
> > On Tue, 28 Feb 2023 at 16:48, David Woodhouse <dwmw2@infradead.org> wrote:
> > >
> > > On Tue, 2023-02-28 at 16:46 +0000, Emil Velikov wrote:
> > > >
> > > > Greetings David
> > > >
> > > > Don't think I follow - the series is completely unrelated to microcode
> > > > loading. There isn't any mention of microcode in there, so I'm not
> > > > sure what inspired the question. Perhaps it was meant for another
> > > > thread?
> > >
> > > cf. https://bugzilla.redhat.com/show_bug.cgi?id=2122271
> >
> > Nor really a RH/Fedora person, so the link is appreciated.
> >
> > On my Arch machines, only the AMD PSP firmware is included in the
> > (mkinitcpio) generated init ramdisk. And as outlined in the bug that
> > works just fine. Will have a look into this.
> > Mind you - nearly all the patches can be applied independently of one
> > another. So dropping the final patch is one option in the short term.
>
> Maybe the answer is just to have a way to exempt *certain* files from
> the compression?

Arch has been concatenating the amd ucode into a standalone initrd for
5+ years, thus making sure dracut or similar tools don't interfere.
Having some way to opt-out, would overall be beneficial. This way one
doesn't depend on distro specific solutions/hacks.

Skimming through the list - there's another set of WHENCE related
fixes [1], with a slightly better helper. Let me re-spin my series, so
things are less likely to clash.

-Emil

[1] https://lore.kernel.org/linux-firmware/20230216005602.18838-1-ats@offog.org/T/#t
