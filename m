Return-Path: <SRS0=nLgf=UV=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC68C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 16:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9868C385A9; Mon, 11 Apr 2022 16:51:15 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C5B2C385A4;
	Mon, 11 Apr 2022 16:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C5B2C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id q189so16413701oia.9;
        Mon, 11 Apr 2022 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c79iJ0igXcMczluWi3ILy2rZFxGKJIEi8e1td7jcOjU=;
        b=LVbwcmGW2DDly4ZQyVZsRICxpgsr7wgHsK4grBcJdUAVYmaW8184nKDWCleq8qhGyv
         THufQTXBqMEHe5sQQXU4nG+7rsAGvw3jN9rGHq/Qdh6mVapnAvlvscmeBr1p3/6lTTTW
         ndszsdUcKM/+N3QnsSTudjeDIlS31dQAK49/mkacQI357C9i9BYSV7BRz05aLNesvH7U
         GVYhs6hCBZ2aq1cYLgFXC1PHJmER075GEFMC2JQJR3vY2DO5+1JGgwWhN5MxT/JmMJ+u
         vB4bZmq8NjeqOH85Y1mKkaxVeXEwRjx9ZUtoSwOEcRRQA7HcEHYSpq/rGf0po0eHPFMO
         q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c79iJ0igXcMczluWi3ILy2rZFxGKJIEi8e1td7jcOjU=;
        b=5zQmRFeCTYIufdzr6jOfLK2+ac3xXnUpR6j05CB+gREb/5+UpFjvXBSppHzTK0OxhN
         p8kbdcNDLnGZQrFBp7l1iHAJfc9IsItJ6CeqhNqDpiGxMmKcsTQbS78y6QX/bk3JCWst
         hPn84YJ7GAQdIiFap2FznTk2R57NY9E/QAlsbMh6OJW0TDeblT6i3QCyXqznuBNDyYW8
         n/aAF1T1lwwAqLTIrjaF8H6/frIZEgHjGOi+dvFLa5Bhyy5kClGZP2n1x+H1bTfjJrMw
         9+l4HFmX/luQz7HrEWa6vJ254VRmv6TaX3RjEdXYnHmSYoHiiwsb2mPotq/lXG4LDAbx
         sEng==
X-Gm-Message-State: AOAM531UTw+MF2VuXwFQluurvNW9HdTDc8kgQth2FXOBbu0k+IWnZ8YM
	yze6vTPYFPIhNBrvPhR2RsqmPDpcxX2a5aYnWgY3euPQ
X-Google-Smtp-Source: ABdhPJxITOx0dpP9AKpGbQ4b/nj526Jfy9E8rVtv0OVEfftOQAMhQSHKDfmN6JLjMGknFT5X+78fs9B8WGypNxN8FqI=
X-Received: by 2002:a05:6808:199e:b0:2f9:d699:6ad0 with SMTP id
 bj30-20020a056808199e00b002f9d6996ad0mr40939oib.200.1649695873305; Mon, 11
 Apr 2022 09:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Ni5nEa5s05qheqJBeFeHDDgXsPpoUjCj1CWdhyeeyx3Q@mail.gmail.com>
 <CADnq5_MpX61+uWHnPZsePD4ABZop6vGLvfBLNWWxrL+myY6tZg@mail.gmail.com> <CA+5PVA74QR+vUdYi7LJtVzyBN-qu3jXfi8r=E+FsbVjCBd9cAA@mail.gmail.com>
In-Reply-To: <CA+5PVA74QR+vUdYi7LJtVzyBN-qu3jXfi8r=E+FsbVjCBd9cAA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Apr 2022 12:51:02 -0400
Message-ID: <CADnq5_P8yD6BJ=0oCsZwv5p9E_5Nr7aQV415-9d29aSSwhoYJw@mail.gmail.com>
Subject: Re: Updated amdgpu VCN firmware
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Boyuan Zhang <boyuan.zhang@amd.com>, 
	Deepak.Sharma@amd.com, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022 at 7:06 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Mar 30, 2022 at 3:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Hi, I just wanted to make sure this patch didn't get missed.  As an
> > aside, would it be possible to get direct commit access so I could
> > apply these patches myself (and help with other firmware patches that
> > come in)?
>
> Apologies for the delay.  I was away from the keyboard for a while.
> All are applied and pushed out.
>
> I'm not opposed to taking on more maintainers, but I probably need to
> writeup a README on how to do it.  I'll send you an email once that's
> done.

Thanks, much appreciated.  Will look forward to the README.

Alex
