Return-Path: <SRS0=QJft=OS=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD0FC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Sep 2021 13:27:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2CBB61139; Tue, 28 Sep 2021 13:27:03 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D11611CB;
	Tue, 28 Sep 2021 13:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1D11611CB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so28927407ota.6;
        Tue, 28 Sep 2021 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q5EGMBd+AP0miogNtaNQ0ltdUDx3eOxGejV6GvB+Nzo=;
        b=Ze/53VR8DQjyrFXRLKxJtCUYzrU9PxcB51EeK9rL1zz/TKp2JG10QQjPgZf6C/NMHG
         cYvNlB2PxZl6iTcO6lJVrDmACithKy+lYXJZE3GlX61LfboANRBLO8AFWJKviDNdtbRu
         3HvxzVVGAxpikfK87oHuDBCRTafMA5YuSqU5Z5bkx6Ygf4lnqOMNGEytp69dcDV7qPSt
         v64u1W/9TsZ53alJMaB/dbWBrBdq2lL7HlJUg4w+SbbKSRrUqLA/R8MWUXRp22h69JYE
         DPEYyrZvOVj7N8lWhce89SFNIvxXlQysIqMklCicVsxDUBqkBcVfTnK/bd7OUc2Uda72
         geww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q5EGMBd+AP0miogNtaNQ0ltdUDx3eOxGejV6GvB+Nzo=;
        b=nZirglGthLm9GY6vIJ2LLyFatMqesV2jrVuiieDs+VkzL3fmjU9Pc6elmzsPD23wQt
         SWmD8IkOQbLpU+AFpwD5PEfGhrW3odIgv9UdrFbwJyZRHmQ81pLIGq9ewysvyyTLITvJ
         +JfIvOkZfF8EK4bEirj1AIh3WsLbzdr33aob3FgF0BXfncWCBcsnA8OLYrPcZhjkjDHW
         WD80YwAS1dJbgCFYk1qOQarnQ4JTvQpwL0Ld3ZGVbmEmmOwQzM7ePDMbqcoqKIW/9DSf
         Wth1o9WHvOLbjq85HvQD+4hNuf8O6KioUdKGIvVnQLs33CYVxxVVh5LSfbVB7EZnD4fC
         c5Yw==
X-Gm-Message-State: AOAM5328z43MTGzaWTA10ioqQDESyWmXwL629kU7TsCsl/f0iyA+LYyv
	9lJlEwb2sRdVZl1bzujGpbuWUyFGgEJjnEzkkIztshEx
X-Google-Smtp-Source: ABdhPJw5p675iu6D9IRAJViLHIiqtV7s5HMd5sIS+9CGozNnEVa7NP5yoJEH5CIK4W9d3Fy+a20JlAALRRUEXc5SAU8=
X-Received: by 2002:a05:6830:214c:: with SMTP id r12mr5256317otd.200.1632835622720;
 Tue, 28 Sep 2021 06:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PWupF8Np2J50OAW-fYN7yAYgqdpZhbNjxqG+aLT3HDtA@mail.gmail.com>
 <CADnq5_OR1sQv8=MFzxGFyXHothkFskfTb6TMJS1b7JoAP4A1dg@mail.gmail.com> <CA+5PVA444kChTvKzfXTyWy6=nVrFczodnhfdmwkn4i2x+gY0dg@mail.gmail.com>
In-Reply-To: <CA+5PVA444kChTvKzfXTyWy6=nVrFczodnhfdmwkn4i2x+gY0dg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Sep 2021 09:26:51 -0400
Message-ID: <CADnq5_NNVPR243uBSCfpjVyZQnBaq9Zhzr4C+TmKjRyH+K7V3w@mail.gmail.com>
Subject: Re: amdgpu VCN firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Tue, Sep 28, 2021 at 9:25 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> All patches applied and pushed out.  Thanks.
>
> josh
>
> On Mon, Sep 27, 2021 at 4:02 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > A few more VCN updates attached.  Please apply them as well.
> >
> > Thanks,
> >
> > Alex
> >
> > On Mon, Sep 27, 2021 at 2:04 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > New VCN firmwares for AMD APUs.  Please apply!
> > >
> > > Thanks,
> > >
> > > Alex
