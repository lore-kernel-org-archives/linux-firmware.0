Return-Path: <SRS0=0UrW=BR=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEB0C433DF
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Aug 2020 15:17:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3DE372224D; Fri,  7 Aug 2020 15:17:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C941821744;
	Fri,  7 Aug 2020 15:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRg932hK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C941821744
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wm1-f52.google.com with SMTP id x5so2055462wmi.2;
        Fri, 07 Aug 2020 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lMR9PKDAyXQ0qP9iwt9/D7Couokqqb1clpFM8xbYrME=;
        b=fRg932hKi0FBf2NzDXylntB4U1bfih7HIqhdNiMp6pa03LwlSXvgU8cmOwcj7bJnRP
         +vWjtIp47iAH7UqxY09IP+JCgXOfMccdcvYFfkirXJskwrhJDgFgxcnG6XzsXDeH3Gfo
         BrvAzFAOvIzTtQZQlV+v0XklbCm1v91UxlaPQMfymj+vSkz5/JQfEiSU/BRcIqniPHO/
         Nu7oQUBwKRH4K8BJwqGSKiVjbgUiAJT4vYQfs78k/x+bvIdMuTz7qoD9ganktyOti0QQ
         IDnfLZnOckTFpoy2h8R2wdOholJCCiEGfero5aDNYRhfEvlW+3Hp6h6xLjqb8U03y/I2
         /L+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lMR9PKDAyXQ0qP9iwt9/D7Couokqqb1clpFM8xbYrME=;
        b=XiDjX92KRJF5dqBbiP1b2v0Kx2/o2LZZHcSGEmyB0koSM6dLKkPYNqRbPktr0791pe
         K2UaG3fRJAPNrvxKPIgOyJ+4W/Z/N0FWrttfT3rlPa9G4+lGqawt/bmiNvwFVdpr/hUa
         pzLchK1IPeFiMecyc+GQotofItLU7QvGQKZJ4I2JMa3dzFrP+vGSmRficMjMxte1UN/5
         ExRWUMmero6NNccQLinae6+ZAAgggN7VLsS3jM5O9+hDUJHWBJHpXV0o0ezqA76Y+bha
         gnKjfirG2blFPXH4ijaCXbcgw9ryEzSvp2MUUSARt6JIfNdEFf++ZqtrSTrhUr2OWbCa
         RX9Q==
X-Gm-Message-State: AOAM532Tbv+x/E7yjWDpYgACXBVRzzz5bGHd/6qClYxBLUnT3QRaj1+F
	UleGJv1sYwNvj6q/cJM9Qnglkj80qNv2k6qdwI9+TA==
X-Google-Smtp-Source: ABdhPJw70LHH/ZLSl4/mE9Y1WPkgEbzwnFn/Kg7bJyYPbryEqfcx6gck4qAYGTBn/yKftzysO5MQvb3EX7NTpZaMx9I=
X-Received: by 2002:a7b:c941:: with SMTP id i1mr13034344wml.73.1596813459217;
 Fri, 07 Aug 2020 08:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_N0VEXXmsypacGsCqo9J2ZhXjX0wkUaMCiJqps9NbguJg@mail.gmail.com>
 <CA+5PVA5ZDapF_yGf_BjzUgsmM8C_xtXvU7aRKunGGoq9Vp5LPA@mail.gmail.com>
In-Reply-To: <CA+5PVA5ZDapF_yGf_BjzUgsmM8C_xtXvU7aRKunGGoq9Vp5LPA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Aug 2020 11:17:28 -0400
Message-ID: <CADnq5_P+jK6MpkraeQBGWz3W21njY63dRa-VEs3zv52v1RqdHQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Fri, Aug 7, 2020 at 8:17 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.
>
> josh
>
> On Tue, Aug 4, 2020 at 1:24 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated amdgpu firmware for radeon GPUs.  Please apply!
> >
> > Thanks,
> >
> > Alex
