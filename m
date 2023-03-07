Return-Path: <SRS0=y5u9=67=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEC1C678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 20:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93B06C4339B; Tue,  7 Mar 2023 20:48:35 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E2F2C433D2;
	Tue,  7 Mar 2023 20:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E2F2C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id c80so5748364ybf.5;
        Tue, 07 Mar 2023 12:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678222113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpmK3SkllA2GPzu3yNwCGLq6we77Z/1zG4eIORqEg14=;
        b=YgPe6mPARK31SMgiIXOezny0QiBgQ4lOhnUy8AAbj41yevBWW+3V1BxfAZnG6f5QJ9
         BbMJxgn+PB9I6hETqbF9cQcpSc7n9Fk6WMKBfAAxLeNQU36aOW2ADfqw1mcgKMZq1jvn
         hE3JbeTpqpbzomCVxdM08eCktgBXjyW1kvGXYlRHnwjCHm7KsjhdhxjgPpw/EYswKGiU
         mx/3Wgt0tbw45cb0oC7yP39EEq1fLQHZBA8LBC4AVyXU8oPzhW7hGrn5HZsZGQY5gTvE
         lugRy24HDfONWP/icsgu2i0trWbB7w1WKCOGZ7aN+aP5fEuiqoR0ZgkPjzkwgvYEBskA
         UKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpmK3SkllA2GPzu3yNwCGLq6we77Z/1zG4eIORqEg14=;
        b=m6Z03Xc4/peIp3ctTyj6EVCci4I0B/+LotNfh7z8amVOizV9rdJ1eDL/KZyzMNXfxT
         nCM65swo5r3zCg51iBchl904USuyYJLTqEy5nTjeiO5PSAz6QgpWbukBIOFtu/j/GsN9
         x0+o5c0CaxWEuRbsdQeMip8vmetTuChhKMv1aEDeOFOeclIF8HbEJ6LdzywspbSkwhce
         9W9aTReSeAnP51Pam+x8m2efZcXDyLfZkSaxY2HNNbgosYY3rcMqJklRaWqyO94vNNW8
         XwfzV4RrmZfjwSoyhkZC/POYyBxkm+RvEenfLvTacG83D4EP6srPHD77bsOKimebfz0m
         shtw==
X-Gm-Message-State: AO0yUKVsqJoRjA6i0cKfbXKzx6vrF4tvlBUVzHyZnBVyH9firjStYQA7
	sGV0rYH/2tgEixPSXU+b9/513+gXYhWBX1TYiPzODVgAtfE=
X-Google-Smtp-Source: AK7set+nNhTAuepK0mdcFogORkucUtr+WG+PMKHL/w8X5ncoxdsamctoUEkNlzC+ALg87IEKyfUXKms2BdiHn6G7p1Q=
X-Received: by 2002:a5b:c11:0:b0:acc:533b:9451 with SMTP id
 f17-20020a5b0c11000000b00acc533b9451mr9552912ybq.0.1678222112988; Tue, 07 Mar
 2023 12:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-3-e2b71974e842@gmail.com>
 <CA+5PVA7OGYgFxgCACKfZ67ap+Q5kXzVWKVL96MR5QAu2u_P-Tg@mail.gmail.com>
 <CACvgo52Vwm6w=RsPRuNaXRO7OKvZ5EW8Fgdnvnjta4LsuseyDQ@mail.gmail.com> <CA+5PVA4B1WN2Hc14suOVRG76ANrgLnzPcUUxMryk+pzjEhUjPQ@mail.gmail.com>
In-Reply-To: <CA+5PVA4B1WN2Hc14suOVRG76ANrgLnzPcUUxMryk+pzjEhUjPQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 7 Mar 2023 20:48:21 +0000
Message-ID: <CACvgo52=SvHghNbNy2WNZXJNqF=YMUX0ECopNB+ngYtudi8EPQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 03/16] check_whence, WHENCE, copy-firmware:
 escape filenames with spaces
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 at 18:00, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, Mar 7, 2023 at 12:30=E2=80=AFPM Emil Velikov <emil.l.velikov@gmai=
l.com> wrote:
> >
> > On Tue, 7 Mar 2023 at 14:58, Josh Boyer <jwboyer@kernel.org> wrote:
> > >
> > > On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
> > > <devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Emil Velikov <emil.l.velikov@gmail.com>
> > > >
> > > > We have a handful of instances which have space in the filename - j=
ust
> > > > escape them (like we do for the symlinks) and drop the extra re pat=
tern.
> > > >
> > > > With this we can also drop the extra sed pattern, stripping out the
> > > > quotation marks.
> > >
> > > While that is all true, why is it necessary?  I suspect patch
> > > submitters are far more likely to forget to escape the spaces than
> > > they are to just include quotes.  I see this change as making it
> > > slightly harder to submit correct patches and I'm not sure it's worth
> > > it.
> > >
> >
> > We already have properly escaped paths in WHENCE, so it only makes
> > sense to fix the outliers.
>
> That's true if we believe escaped paths are the suggested way to do
> it.  I'm questioning if we really want that.
>
> If you're a firmware submitter, which is more natural to you?
>
> File: "foo bar with spaces.bin"
>
> or
>
> File: foo\ bar\ with\ spaces.bin
>

If I'm distracted I would use the following, which would be flagged by
check_whence.py and rectified immediately by skimming through WHENCE.
File: foo bar with spaces.bin

Although if I'm careful I would first grep through WHENCE for examples.

> Based on the number of occurrences in WHENCE, quoting the filename
> seems to be more prevalent.
>
> > Would you be in favour if check_whence.py checks for quoted files and
> > produces meaningful error message?
>
> Not really.  I don't understand why we have to force only one format.
> The code already supports both.  What is the benefit of dropping that?
>

Yes, escaped files are more common. And no the code does not support both.

Look at how Link: is handled. It fails miserably if either target or
link are quoted, regardless if they have space in the name.
Fixing that is an option, although since less than 1% is "quirky" it's
not worth adding any extra code. But fixing them instead.

Plus a mismatched quotation will (currently) lead to greater chaos, or
confusion if one is so inclined, IMHO.

Does that make sense?

-Emil
