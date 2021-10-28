Return-Path: <SRS0=09Nd=PQ=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDC8C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Oct 2021 14:08:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E9B0061056; Thu, 28 Oct 2021 14:08:37 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A7C60C4B;
	Thu, 28 Oct 2021 14:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6A7C60C4B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so2880316otj.11;
        Thu, 28 Oct 2021 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TmNhoar9aHyJMl+9Gkk4TUNe/fzNb6S5mF9oBHWgn1Y=;
        b=nedHJEOgTRNKZFOZDJdwf9rVT8rGSQ90iYMIbVJPTuGczDpdOJUz73nwj9WqS2ErEI
         oYiB3SokWWVsIvCHCNz8ft34wSvCIMGk26pwMxulPxeoyakuMkSh8b7u/gO22epgODOf
         PMteAW1oo2kKB7SVeo02KXx39w6EC18BZoK9HbGJfJUQm5hIxXJVm4f/y24SpTQOIbJT
         ekfwcM7b74cw8f/mkAg74SgS+biuWrBRUHi+mVN+B7QkKhsAXesYWI41qbxFG/EmXHbn
         iX/ATdYnya6KOi/k23qObg159Mvmx3MD26AbZqCYGNo6LfkCTD8AOyJoRf3sv1YAKCys
         C7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TmNhoar9aHyJMl+9Gkk4TUNe/fzNb6S5mF9oBHWgn1Y=;
        b=wzcGcHQFkD+zXkQTufLhpaxUGhDNzHZM7BOfyRHcANVlS4Uy3NCleHh4M2lhTKDZtw
         ahDhdCymlR2Aijdn2c1j3Bo0AhMjXY6Xo3VQCHhpjRAEwEPtf9VaKWMTPWU+ZI2+qA7D
         MAHWPaEisdpIP59+Sjzdyt6wFaRiyyzasXcq+HRIj9AtSznTtmQ8wOxZMdNGIAC4CC/s
         IYlhuqvtMl1MiFfS59hnlmhFDTlOKVbeyoL+osEmaJXTbDDX8m5THlMQhSG6cXDIlR7I
         bo3lN/Ivhci4yxgDJVATEyg8u3kpQW/erSFTFqzh6XUD70p1hyjlhoBCo+XzAGDZE3PQ
         KaxA==
X-Gm-Message-State: AOAM532rESLv2nvqTDx77hXWF9LlkoBRQU/sVX2b8ow01rxyGzyLX2hV
	fVsT/jQitmA9ZAMXeMiTvr+ek0hkzwDpqz0C20sdz6Y01yw=
X-Google-Smtp-Source: ABdhPJwCF18ZRHvtdzm6Xax9NvdY4RpnjBxNTFCIxqL1Z6K0VlyiF6WUGDxoNCj9JEYt7yLj7LBffBVzpZCwd/F6b90=
X-Received: by 2002:a9d:61d9:: with SMTP id h25mr3662364otk.357.1635430116937;
 Thu, 28 Oct 2021 07:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PWupF8Np2J50OAW-fYN7yAYgqdpZhbNjxqG+aLT3HDtA@mail.gmail.com>
 <CADnq5_Pmbtuofhro_5oi_73jMEPhh+7mVDAM3bd6D4ESbSyn3Q@mail.gmail.com> <CA+5PVA5M--MpuS8k6etSh9L-N=eADPgw5-csvB=umKqxThnWuw@mail.gmail.com>
In-Reply-To: <CA+5PVA5M--MpuS8k6etSh9L-N=eADPgw5-csvB=umKqxThnWuw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 28 Oct 2021 10:08:26 -0400
Message-ID: <CADnq5_MKqAbArrETag0BEKGCeZ5CY5tM+oqVf4iTGf8zXk6ROw@mail.gmail.com>
Subject: Re: amdgpu VCN firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
Content-Type: text/plain; charset="UTF-8"

no problem. Much appreciated!

Alex

On Thu, Oct 28, 2021 at 10:08 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Thu, Oct 28, 2021 at 10:04 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Mon, Sep 27, 2021 at 2:04 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > New VCN firmwares for AMD APUs.  Please apply!
> >
> > Hi Josh, it looks like patch 0005 didn't get applied.  Re-attached
> > just in case.  Thanks!
>
> Apologies for missing that.  Applied and pushed out now.
>
> josh
