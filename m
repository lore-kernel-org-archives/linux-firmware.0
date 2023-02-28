Return-Path: <SRS0=wfpw=6Y=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5ACC64ED6
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Feb 2023 17:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10926C4339E; Tue, 28 Feb 2023 17:02:19 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C752C433D2;
	Tue, 28 Feb 2023 17:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C752C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5384ff97993so292023867b3.2;
        Tue, 28 Feb 2023 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K+NtEoJsCwEJJXR8yOrqhMqNYWNdagCh3FUOvOJvgDg=;
        b=Op3BTcHlvbMgk/rTx7Msb2P0hRTsqhUV2O1whI15ocgE5d62MmmBaOVS77pvzK/8En
         ghD511wdWEMTqq1VjrPnrSE6LifvXcDhbX20TpeqAA9oUdKCct70UyqetLGVb7hU+ePE
         lkek/J4uZ8advP8a2MfSwSLlLVsIyn+VWtTxPIET9+wP70rMh1HtWEzlFASqVwA0H9V8
         23N4jpTGV86BiCuIYV15OI2IUM2Ob+/8htsEGwkQaFL81yKOJ2YmdeO8Z3RWFan+Qqee
         uyITyuBtqT5gICdNWF8YbUU4Fnq5bdKm+GfS1fzKiwUu3kI4jsHjc7wZyJRCQ6ENnVR/
         lKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+NtEoJsCwEJJXR8yOrqhMqNYWNdagCh3FUOvOJvgDg=;
        b=n9qf2AND3pewdCZ6F2Tvd0F9ju8vUSO5YT2Df7lv67vGSSIqaSC3rSntVCKbOCweaD
         +aYmNrYLrDJ85/yPNPmQk4qtVnnQNpEvoy8FDBpRfljWZyfBgPmZ2uVI2+uwxgZKXUOj
         tOFKHcqh/TRNODf0G/Uo6+sqLPJaacxgUcbfcaOiNizBK87Zp5hLCldugZFSAVL0/69a
         Zm97cNHFMcalC3FHetKQUt1UNYLMgvp1PpXzVf+7AMvEDyoo2eQF238TwdoqtgcHNDCP
         xXvs+z/vSUBXSQh70iSROHJlQvsPdQIM9H0ZLJ9NyLthzQaVeoC+PbSx3N2C7cppOsGJ
         jRaQ==
X-Gm-Message-State: AO0yUKXxk4n5e6lFhaFqowt/BOBPmPe9w4Mi5XbKisdixTa0oBhOCtnU
	N8of8VyuqdLVDYBLjNdC+bZESWrxRcontHNI0xE=
X-Google-Smtp-Source: AK7set8EQg79MBJWvVA+D3ftlcWAT/9G61823f2GtzgPBuy8XCPEsmHpQ3Q/awu99+tjWUvPG66O+gtmOyKupjxRHbs=
X-Received: by 2002:a5b:751:0:b0:855:fe27:1ee0 with SMTP id
 s17-20020a5b0751000000b00855fe271ee0mr1590108ybq.0.1677603736878; Tue, 28 Feb
 2023 09:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
 <CACvgo50K0kSFh_bRUz5=0oSL2W92XERiyzGZhD1SjT5u6A0cgg@mail.gmail.com>
 <09c319d0c79967377239df12fa8a857107235bca.camel@infradead.org>
 <CACvgo53kg-_htw8ecrBnJHyFqD5tx2KjmJvByvAVZtsA5gzZ9Q@mail.gmail.com> <c50231609fb4597a1443fbc2dec46fce4589d0eb.camel@infradead.org>
In-Reply-To: <c50231609fb4597a1443fbc2dec46fce4589d0eb.camel@infradead.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 28 Feb 2023 17:02:05 +0000
Message-ID: <CACvgo52_rV-CgC4z4S2O98VOMOY-4=A011dBsGJB8+0_bdgDgg@mail.gmail.com>
Subject: Re: [PATCH 00/15] Misc fixes, sanity checks and xz/zstd compression
To: David Woodhouse <dwmw2@infradead.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Feb 2023 at 16:48, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-02-28 at 16:46 +0000, Emil Velikov wrote:
> >
> > Greetings David
> >
> > Don't think I follow - the series is completely unrelated to microcode
> > loading. There isn't any mention of microcode in there, so I'm not
> > sure what inspired the question. Perhaps it was meant for another
> > thread?
>
> cf. https://bugzilla.redhat.com/show_bug.cgi?id=2122271

Nor really a RH/Fedora person, so the link is appreciated.

On my Arch machines, only the AMD PSP firmware is included in the
(mkinitcpio) generated init ramdisk. And as outlined in the bug that
works just fine. Will have a look into this.
Mind you - nearly all the patches can be applied independently of one
another. So dropping the final patch is one option in the short term.

Thanks again,
Emil
