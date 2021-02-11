Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D10C433DB
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Feb 2021 14:32:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C5A9164E74; Thu, 11 Feb 2021 14:32:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E4A864E77
	for <linux-firmware@kernel.org>; Thu, 11 Feb 2021 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613053920;
	bh=LIW4cLRTTA8GM+wSt1TknhD4roZW4zeLq7SaBsILFvU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Zvi3XweDrLQipCSM7H/+PwneOJ3sLQg+OEbQ9o+9s21Mq86v3BAI7Eld5SeMbtBLB
	 cTubNstrXz7e+uIujNQOE9296IiQKecqY7VSs9TszImPfo4qo9z1Iyxxqr92gdlpKB
	 o4wBczeOA/Q1fDIncDCtzjtxutzHCEZJzF8SrsATfZ9GkpjfIF45nfBiaRD/mPlgZF
	 /LWpN5uvMqC5g3aSYtL2wHHOgmaYHgYqCXXuDwa8FdwFjYR4IxzpframjEUhjQTJH6
	 zNsxUxEcp8kzeX970fzH+NRgvka/2LB1NsYmyB787yKVUrvch3i+zz5hG2+drqVHB0
	 ekRcXG2WdzHyQ==
Received: by mail-il1-f177.google.com with SMTP id d20so491123ilo.4
        for <linux-firmware@kernel.org>; Thu, 11 Feb 2021 06:32:00 -0800 (PST)
X-Gm-Message-State: AOAM531zr+qn5SaxEQSw0XUC6cXvS/5884ULZ87eQbzvEn2i69skHf8h
	BI3ULhnvvkeDwpagKKYRaZ8IaSuH17z93vy6wUI=
X-Google-Smtp-Source: ABdhPJwEd1Qqh72Y8mFbv0V1QLVYnMNvSMBbeMqlhvnYZqRXHkQWIXPaP0la3UG5m07BSOJiOfi+fSD+Nk/RO/KNpuE=
X-Received: by 2002:a05:6e02:216f:: with SMTP id s15mr6043722ilv.81.1613053920056;
 Thu, 11 Feb 2021 06:32:00 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_Mc7A60S2fyqwcJF1i6OB54VvUMo0s0dK5Ghdz8ZGKqDg@mail.gmail.com>
 <CA+5PVA4vU=7WEFie=u35Xjd05MmRBEXpBCiJ=2j2bhDRHypknA@mail.gmail.com> <CADnq5_M8XzjArK9GdUW3wOyUj03AZ660tpMzSHmq5ygmuVf1cQ@mail.gmail.com>
In-Reply-To: <CADnq5_M8XzjArK9GdUW3wOyUj03AZ660tpMzSHmq5ygmuVf1cQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 11 Feb 2021 09:31:48 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7sQB_dOFPQrT497RANxXcNwiQg554VtVzqY+-HjNETxw@mail.gmail.com>
Message-ID: <CA+5PVA7sQB_dOFPQrT497RANxXcNwiQg554VtVzqY+-HjNETxw@mail.gmail.com>
Subject: Re: Add firmware for new AMD APU
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 8:48 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Feb 11, 2021 at 8:01 AM Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Tue, Feb 9, 2021 at 11:52 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > This adds firmware for the new AMD APU "green sardine".  Please apply.
> >
> > This doesn't apply.  It seems your tree still has the typo'd names for
> > the sienna_cichlid files in WHENCE (missing the h).  I fixed this
> > upstream directly:
> >
> > commit 54c797a694d3830ef93f349ec25e1d96d4b88102
> > Author: Alex Deucher <alexander.deucher@amd.com>
> > Date:   Tue Nov 17 14:32:15 2020 -0500
> >
> >     amdgpu: add sienna cichlid firmware for 20.45
> >
> >     From internal git commit:
> >     5a088517a27d29a7424859cd9b158850a6802f07
> >
> >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >     [Fixed typo in WHENCE file - Josh Boyer <jwboyer@kernel.org>]
> >     Signed-off-by: Josh Boyer <jwboyer@kernel.org>
> >
> > Can you rebase and resubmit?
>
> Sorry about that.  Updated patch attached.  Thanks!

No worries.  Thanks for the update.  Applied and pushed out.

josh
