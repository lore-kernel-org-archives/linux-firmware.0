Return-Path: <SRS0=1YVd=2V=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C7CC433FE
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Oct 2022 18:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08472C43470; Thu, 20 Oct 2022 18:01:02 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0B42C433C1
	for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 18:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0B42C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id o70so499662yba.7
        for <linux-firmware@kernel.org>; Thu, 20 Oct 2022 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GtB92fhNQxO6gg8nNI9VqRIiHgvlqGny+IoHGO4TzI=;
        b=HgTG3NrpDGlnxqPryUhPpOUkuGhg3qqWDz8wmPz60FqJoHuDlwPC+IKivWNll4Cie+
         N14ZryT3xAtcx8AbieEOXjxAZ8aBiQcd6FeyX+4Yc57VrywflvmPUjBrbZw8QX49OHr4
         B7Y0fVvEv73JS+taHFsdYfwJtDymXGeh4nSzpZlZ81fH9Arlh9jYOAJGPUcVAr6ZAeFN
         QYZGNzGbIXP44+tOSWLqW839qFdsbQMEOGJzauhR4u0Ol8XPZUMDExccFixSUpdpoaTJ
         Q2z92W/R+xO2AXXe/jeTh4DLlILlpqKbkxpWrxYSDukMwp5yKPr7Ta0QnS5j10bR9ddR
         1fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GtB92fhNQxO6gg8nNI9VqRIiHgvlqGny+IoHGO4TzI=;
        b=GnCEJaB+Y+HHBQdW8HdVpFyEhj6YdM0Vrdv9F1o4XJSjDx5IETdHombEQQWOqcsWj2
         HIjmN0DFjJZofIBzSPrM32v0ZYHL2iX/c9zfPmKeCqn6fi9+9kjV07kbb+mFmLqQ7/2P
         Oj+1OgiipnGpMR8obuUax+ekWo3vlo/GMCCqqJCK2aNajFoOU9jX99NcVpbHHrouotmI
         GkuBTF+SAw/2lQ/l2FRSQdcHgf95/cYTeJ9W/3V6LMNckpYu+FLwYtZWlrZRv59p9Hjs
         u+qKG11HIZcCFyzgYjd+ETwOPnQp9AEvCyGbWxr5c97wXbL9otIvTorn018dqhV/wJKY
         DKRA==
X-Gm-Message-State: ACrzQf2KwJxqMouuhOfYdlDer6vY6gVt1y2ksVRjcCDcEq7XYRMFt7Gf
	EH7DfmErCiUPMcrve1F5zmr5gld8y2ZsJl8ksygIpg==
X-Google-Smtp-Source: AMsMyM5jTcg02fgT3GlmDVIlkrXlzFnypPS2TfFZ5OGrRUPLtRTSerYmXsJUifgvfx/RvZXK3D7ttGATLZikC4QA3Js=
X-Received: by 2002:a25:dad2:0:b0:6c4:716:b273 with SMTP id
 n201-20020a25dad2000000b006c40716b273mr13041944ybf.275.1666288859697; Thu, 20
 Oct 2022 11:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhG-aoOBgTzirGu-1uqCFUJd+AnenMSkoUqnG3mhraCRfw@mail.gmail.com>
 <CAF6AEGvvsx+6OSxOaqjoUO=J4tO_J5ZSidenx9EXdz34_myBqQ@mail.gmail.com>
 <CAF6AEGtsw5GTB+MzvA7mE8y=m6qDFtQNFnnAVtuFSxnDAT0YuA@mail.gmail.com>
 <DM8PR02MB8169E5D5C972BE45207F70C2F32B9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
In-Reply-To: <CANHAJhG2PM-KS9GVHOE0xh+5KpKy5qjFBqteRGqNONiasjprBg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Oct 2022 21:00:48 +0300
Message-ID: <CAA8EJprUPw8NChfOferwXEmahkhOHrQvRxpVOhpNJUoZgexHkQ@mail.gmail.com>
Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
To: Nathan Hebert <nhebert@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Vikash Garodia <vgarodia@qti.qualcomm.com>, Rob Clark <robdclark@gmail.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>, Fritz Koenig <frkoenig@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 20 Oct 2022 at 19:52, Nathan Hebert <nhebert@chromium.org> wrote:
>
> On Wed, Oct 19, 2022 at 10:09 AM Vikash Garodia
> <vgarodia@qti.qualcomm.com> wrote:
> >
> > Hi Rob,
> >
> > > -----Original Message-----
> > > From: Rob Clark <robdclark@gmail.com>
> > > Sent: Wednesday, October 19, 2022 9:32 PM
> > > To: Nathan Hebert <nhebert@chromium.org>
> > > Cc: linux-firmware@kernel.org; linux-arm-msm@vger.kernel.org; Vikash
> > > Garodia (QUIC) <quic_vgarodia@quicinc.com>; Fritz Koenig
> > > <frkoenig@chromium.org>; Bjorn Andersson <andersson@kernel.org>
> > > Subject: Re: [PULL]: qcom: SC7180 and SC7280 venus firmware updates
> > >
> > > WARNING: This email originated from outside of Qualcomm. Please be wary of
> > > any links or attachments, and do not enable macros.
> > >
> > > Actually, isn't the .mbn the joined fw?  If so all you need to do is remove the
> > > other files?
> > .mbn is the complete firmware image. We have migrated to .mbn for sc7280, while the
> > Initial days of sc7280 was with .mdt binaries (split ones). So to support the boards which
> > Have not upgraded the driver, we are retaining all binaries.
> >
>
> Thanks for the feedback (on and off-list). I will push a V2 of the pull request
> with the following changes:
>
> 1. Update both split and non-split binaries for venus-5.4 (SC7180). Also,
> update the version in WHENCE. We can remove the legacy split images in a later
> commit if it is feasible to do so.

The mdt loader doesn't care about the file extension, the mdt loader
will determine the type of the file based on the file contents. Thus
I'd suggest adding only mbn files and adding a compat symlinks
pointing from venus.mdt to venus.mbn

> 2. Remove the split firmware images for vpu-2.0 (SC7280). There is no released
> device that uses the older firmware loader. I have tested to make sure the
> non-split image can be loaded and that the venus media functions work on a
> SC7280 device using a ChromeOS kernel based on 5.15.
> 3. Update the VPU-2.0 non-split binaries to the latest version and update the
> version in the WHENCE file.


-- 
With best wishes
Dmitry
