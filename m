Return-Path: <SRS0=JoT4=AK=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD28C433E0
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2020 19:54:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 76B3620702; Mon, 29 Jun 2020 19:54:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11ADC20674;
	Mon, 29 Jun 2020 19:54:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhKlM4l+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11ADC20674
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wr1-f42.google.com with SMTP id f7so14806113wrw.1;
        Mon, 29 Jun 2020 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BA1fOPCo0LdwEmgKrcLlZvKQQaKyWzqqjxn4Ia2LJWI=;
        b=LhKlM4l+WxcMrZRQnW8Fg8X9JukUQNWDDstyKWsfsFFD2HAsNND3eh0i6DbrutOeuY
         u71hCO+mJq+iatw3fSyjxEmNPPeFcD1JBA1afviJwSN7n8Qk8H0V55962X26UUHlF+45
         OTpwahj4wHexxE44cSAzLtiMj74ReQ6sw5lzbtlJ8S5wKmA7MRFlknAnJZ+2buBUxt9q
         d4AUWIxQDkJSXuA9SA3Y3GdiZzThZ4Z4G7VOXjS6s6F24HEDhOM5HlGVpreyJP1aWJYJ
         wp60lTEXy4aTcaM3wAJ0QXuHc23pFDUZYcz3fBcjVMC8A5eoSr0/JsnDrLekRZHGYSoX
         skmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BA1fOPCo0LdwEmgKrcLlZvKQQaKyWzqqjxn4Ia2LJWI=;
        b=rMlJwv/QM1ol6J8El8ZHOi9FgmQtYfWOQz2WZonhQn21+2ed0rEHSjekE7sdwrg3Iu
         E/rEvLAsE1qUpgwL6OaoeVBxi1Yb5z04qBHbFIQpkjiPT4pLmUQODy5w8hX8K1i8zeD8
         T00NDn6OlsIKlP8ruq/N8HCK9xS4QjXObuRKZ8m7u5uAszRC9pWWFTPAl5X8CaX7uCIv
         HcVs0AkJpoyBbQCvF9uzuWE88LTbdO2tHcgY1f/NYkuInHmgrdTqN8CGA9hafsyXAX11
         SHMivt7FXTNOZFQxsZPXvxFCtsdv0zpemsjWjl93AVjph1B3pCNZyml4lNi6YMCclgZ3
         d3AA==
X-Gm-Message-State: AOAM530L9aqBcMkoLKDvx9oEQWZoOh3UD/sbzkyUEx8hzOetzRiezWcV
	6i1NxHA26oSv2P3QHJw3Z5UT49e12NgtjwxhXfRzWw==
X-Google-Smtp-Source: ABdhPJyGDdxvlTLZHXuOF+0AaJzrZWeqv99csu3TvYg0RN9qNRKk6uyDl0nmZWH1Lt13r9aFZ0NRfYwbY7UfTumLOJc=
X-Received: by 2002:adf:ef89:: with SMTP id d9mr19730281wro.124.1593460444376;
 Mon, 29 Jun 2020 12:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_MsOdHrb46f9tcxminQUc_Uqw=zgHHhzLsYdjaW_nFN+g@mail.gmail.com>
 <CA+5PVA4BwVKJQbPMwH05ZXa7Xr-a3AKX-kY-pmLd=OfVVyTKuA@mail.gmail.com>
In-Reply-To: <CA+5PVA4BwVKJQbPMwH05ZXa7Xr-a3AKX-kY-pmLd=OfVVyTKuA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Jun 2020 15:53:53 -0400
Message-ID: <CADnq5_MbzbL3P-sjq=JUJnuTC1yJ=npDtyu7K544Vc2FvMsP+g@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Mon, Jun 29, 2020 at 3:12 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Mon, Jun 29, 2020 at 12:55 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > The attached patch adds UVD firmware for SI asics.  Please apply!
>
> Applied and pushed out.
>
> josh
