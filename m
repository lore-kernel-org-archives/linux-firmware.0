Return-Path: <SRS0=OoOx=BJ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40142C77B7F
	for <linux-firmware@archiver.kernel.org>; Sat, 20 May 2023 11:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04FBFC4339C; Sat, 20 May 2023 11:05:21 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 214FBC433D2;
	Sat, 20 May 2023 11:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 214FBC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-561e919d355so43085737b3.0;
        Sat, 20 May 2023 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684580718; x=1687172718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0DF7o27myUzDizl+iv4EHDnQU2xB9udcZTcNhDXIXH0=;
        b=emXXIOEbxVPPUIwbhfjUJke1ZRySTaYekE7Jit9ula93QCfnwrLDiC3n4FbDdhJzg0
         OvhSG+3ro9ww9RPfFTPC4Hq5HBbCKD+S9pIk8B/4KF4HwKlKMCFla3fh44zygtfgxBMO
         vG5sZz+G8kZwQ9FcZ16jl6HfJEX05YE9/xBO3+QuWUdPBKDv4lw4YqepDlomKn2I2tkZ
         TU5wd8Hwp2PPWrGhW/VPriiwx4u7AraFIyLD9gFHiOP8ttw8/oaAnmz2ySQqXj2LzEMQ
         NL4J2ObH0ZrQDYf5cSQKYwNY3hdDjyrK7XR8UhskmzGeyjnz1x0IKfxiZZlcb1QnygYF
         DtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684580718; x=1687172718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DF7o27myUzDizl+iv4EHDnQU2xB9udcZTcNhDXIXH0=;
        b=mBx0FIChejV4odK5etoZhPAG9vwLCO2ft8hxTpJr88pFWTfkpDkjzQD1rZbfgNGNCz
         wwxGO9D/WBawMaS/0YiGushz03DX64QOMG8Smmr7o63BiVchyhqkGLjdl4HNpRiMyPap
         4TkBxbIEylhFK2D6dH29aVkAAK/FpPSlEiQkyI9OjP9j87a2YkQ9slnZaRiclX0KP17J
         TanV3hSGwoxvzrIEG15Cqmiq/WTtN+hTtm1jyT0mPHAC4boBTAaygq1+m/BLLCmhSNNc
         G3QBL0LQaVV2JcQu66jQwPVGUgitLKyFVsbES3sLsYK1GE9AyzW/QPzHvyodgx2/e7JD
         7lWQ==
X-Gm-Message-State: AC+VfDwrGdshU/dX0i1z0xeh2Fzfy4YUttXRBNwX6APVb9DXrcDejQul
	99rA9LtGLD03L6OWFc1nqlnbj7lXnI+jXECRJQJWExW5ges=
X-Google-Smtp-Source: ACHHUZ58huZOjCRrb/qQFe3J7gVzqOMSe+1Rw45TbwlBqMuPluwoqicdxO2oO6VTVZ85AVtICpoKvw56AyEkjcFxPXk=
X-Received: by 2002:a81:4813:0:b0:55a:84c9:e952 with SMTP id
 v19-20020a814813000000b0055a84c9e952mr4849985ywa.17.1684580718341; Sat, 20
 May 2023 04:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <CA+5PVA7HxxrO+_SM7K-bcZA_98_Qo6VsLezjAjJAu8H-SkX6dA@mail.gmail.com>
In-Reply-To: <CA+5PVA7HxxrO+_SM7K-bcZA_98_Qo6VsLezjAjJAu8H-SkX6dA@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sat, 20 May 2023 12:05:06 +0100
Message-ID: <CACvgo52CK-sJjx26tEz=ec2PqqFz0bWuUMgUNjtZEjGm8f7mig@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/16] Misc fixes, sanity checks and xz/zstd compression
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Welcome back Josh,

On Mon, 8 May 2023 at 13:51, Josh Boyer <jwboyer@kernel.org> wrote:
>
> I applied a few more of the patches, but generally speaking some of
> the changes conflate check_whence.py and copy-firmware.sh.  I think
> they should remain independent scripts and not make assumptions that
> one is doing something on behalf of the other.
>

Thank you. Must admit that I got worried there for a bit, seeing you
drop off for a few months.

Indeed It's quite likely that I'm conflating the two scripts.

While working on the series, I had a long hard look at the in-tree
README and ML to figure out the line there ... Although the docs are
quite barebone. Do you mind adding enhancing the README to cover this?

Alternatively I can come up with something, time permitting...
Speaking of which, next week I'll try to scrape some time to
split/respin the remaining patches.

Thanks again,
Emil
