Return-Path: <SRS0=y5u9=67=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CA5C678D4
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 17:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DE87C433D2; Tue,  7 Mar 2023 17:30:19 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75A56C433EF;
	Tue,  7 Mar 2023 17:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75A56C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536af432ee5so258607747b3.0;
        Tue, 07 Mar 2023 09:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678210217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9omN8AXeDTLJTGyII4IERYnRH57k8mySPPeUCx5bE94=;
        b=Ft42/73Nofh9yelryLYNb0v76xUcnBNfgKqSFHfeTjvwHbHn57XbZS7I8QUhsxzFtm
         tRMp5fBtlYFcdKsAayzXtIbL6As7zXF95Wx5Xaw3aDgMt3kprdejLaKC44IMAw7x3eB1
         NHKuGHAA7snyjiWcMhg28x3U1uTcUBPAezxNH6gi2/yKOIeMv6Du7M/O1KMcXcSHJJhl
         yRQ9jdQOF0wH97Mz+VdUHwTWK9RbFw3qMDx6BrQ6UoKqw7KyOsROLBZRDPDQrvXZ+5R6
         XJDcvfY4z3g9CLEgeE8cjuMPotWEUQEJ5EAkf3EfO//ki50OPskNtAIao8ugNmvSxzQR
         Bz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9omN8AXeDTLJTGyII4IERYnRH57k8mySPPeUCx5bE94=;
        b=IBAmNA8LmK25Dxu7PVFNJzinSuJ5rKOBPvtR9GkrNPY8BIUSDSESjQr2gVtEI2Hvgy
         d8ibsMM9k0u0wzLZWurn31geH+6Ri8zd1wGr8uNcJEaM/95C1SaQ9tCRscExUikld0Wk
         ZpXFMhdIfDm2J73W2h3uLgaJOYpBImFoS39jpVmtLzDb9cdu7R6zIYFt+IkWBhg0XJ96
         53zVKCwHUEIgCNFc1mbc4qYVRfG9RCoBc05KGYRNnbqs+ODIz7NjDZvyP3+XDO/UqXa+
         N7G8Lk6dXjtUstnJyQ5B9WZIRUbAtUbgjOMhc86g5TIkhLfPpFFcgI1HilsBTsmjufDK
         fRXA==
X-Gm-Message-State: AO0yUKUiWdin4p+WwgiRVz4Z8cWZD0ObVOlVY0365vN47fFe+BNgrLVc
	dxDHqzOmyr7dAk2kEvLKlH5+K2CmroAwAcZKNEIguA+0qaM=
X-Google-Smtp-Source: AK7set/XHgHxvtN1ascjhzFn6Cy/WXv7oXXFbF+kJzBrSgdDP7n9DJjaBq2RQ5a1PvFjXfV+TsB6JEYdyDM1WxdgwiY=
X-Received: by 2002:a81:a9c8:0:b0:533:8f19:4576 with SMTP id
 g191-20020a81a9c8000000b005338f194576mr9835921ywh.0.1678210216944; Tue, 07
 Mar 2023 09:30:16 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-3-e2b71974e842@gmail.com> <CA+5PVA7OGYgFxgCACKfZ67ap+Q5kXzVWKVL96MR5QAu2u_P-Tg@mail.gmail.com>
In-Reply-To: <CA+5PVA7OGYgFxgCACKfZ67ap+Q5kXzVWKVL96MR5QAu2u_P-Tg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 7 Mar 2023 17:30:05 +0000
Message-ID: <CACvgo52Vwm6w=RsPRuNaXRO7OKvZ5EW8Fgdnvnjta4LsuseyDQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 03/16] check_whence, WHENCE, copy-firmware:
 escape filenames with spaces
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 7 Mar 2023 at 14:58, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
> <devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
> >
> > From: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > We have a handful of instances which have space in the filename - just
> > escape them (like we do for the symlinks) and drop the extra re pattern=
.
> >
> > With this we can also drop the extra sed pattern, stripping out the
> > quotation marks.
>
> While that is all true, why is it necessary?  I suspect patch
> submitters are far more likely to forget to escape the spaces than
> they are to just include quotes.  I see this change as making it
> slightly harder to submit correct patches and I'm not sure it's worth
> it.
>

We already have properly escaped paths in WHENCE, so it only makes
sense to fix the outliers.
Would you be in favour if check_whence.py checks for quoted files and
produces meaningful error message?

Thanks
Emil
