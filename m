Return-Path: <SRS0=1N/6=IU=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E78CC433C1
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Mar 2021 13:18:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4293761606; Mon, 22 Mar 2021 13:18:08 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D616191D;
	Mon, 22 Mar 2021 13:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D616191D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-oi1-f175.google.com with SMTP id i3so12976027oik.7;
        Mon, 22 Mar 2021 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NKhXqcK+QSM4IrDDKpoJcxbf+1SfYS3s1XMVWrorLLA=;
        b=TQbDrbkWgv4Aav4/w54TSmaTDMk4n4kJQ8Ysv9FazvaZNwoeXcWczSIcQR5xc3HBQ0
         Ynh+NTIgewPZKZYXX7ltrjfVLXxqHtBAvRi+5cXDf3Cs283+Ign7ViEr7bxhETOSXRRl
         qetDKCBU8SMSvHmMdpVnu6rioWQsOSK7VTqQEDoFFrQjDCjQyEnUjydouQivAie4rU8+
         nlV1p1Bsg4FnSd6rOiHQhIGAl2rk6VbpyqMRexZxOxQR4yGPi2YSzOv9G+cHLNcbISjY
         rikXRTuf1YCaaaJgLX9S8BPkROPUtNy9uVQJdm2gtxoXFj7Qt+MDAyBHIeYdm7dIGo6p
         gFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NKhXqcK+QSM4IrDDKpoJcxbf+1SfYS3s1XMVWrorLLA=;
        b=gOvlhYEQpO+/IoTki8tt/rKWT42/qKNSSZmov/o0L0ZPuonmLSNEipSxX8v1Zsnr+r
         tGURDLPaThHfC6zhdrl9puZIoZ35IhbqF8HUOWQ9gfj8uq3IuKMjiBY3yTXXTNzI8y1Z
         H9mheyuztqWgdFJMXUf0Tj6Isbq5vw+Ko2lMV/owSMSRChT0GjJjfAEXUYWRQYO72xw2
         qZqdQVB+L3TPoq1KbfGU8251cof45W1bCFKSfIXmIKRLcE5kx5mJoIgD8soHVcxHk3CP
         Ac3NcincYmizoBqEalqKpu9pP7+n5ZvS5flzojcbiLJvGnOkvuimzjX3bN8OvKGPRRhP
         Z9Gw==
X-Gm-Message-State: AOAM533nPBjWJ8JH3w7QJhXiDSl5dL1e8iBCG+JyFnhglgtP21WXPaNy
	DsBMxBQChbWV8PeXboaQaYUtq551WmQnngO9DFWRlitr
X-Google-Smtp-Source: ABdhPJzzHBVNNBrL4VPKgkFxEP6A8QLfE+rORARiDr9/Ghp6T8b8qDc4GAVQAQTGk+8HJN2uO3wHae6OHa7nfsl12bk=
X-Received: by 2002:aca:4284:: with SMTP id p126mr9770682oia.123.1616419087164;
 Mon, 22 Mar 2021 06:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_OtQTcrFh_rQgue0yL76zcZPYcPvQJJeZC+6XHr20b_GQ@mail.gmail.com>
 <CA+5PVA69MGMs1VQPipx3fV65iMmZ_GnaSUFFCCz7EiJFPS2QOQ@mail.gmail.com>
In-Reply-To: <CA+5PVA69MGMs1VQPipx3fV65iMmZ_GnaSUFFCCz7EiJFPS2QOQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Mar 2021 09:17:55 -0400
Message-ID: <CADnq5_NYZWZ-OEnfD1NUzHJYcoK-wnksFBdmfC5PSeANy5W_5A@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

Alex

On Mon, Mar 22, 2021 at 8:09 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> Applied and pushed out.
>
> josh
>
> On Thu, Mar 18, 2021 at 5:06 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated firmware for AMD GPUs.  Please apply!
> >
> > Thanks,
> >
> > Alex
