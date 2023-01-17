Return-Path: <SRS0=7YS3=5O=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6046C3DA78
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jan 2023 12:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD27CC433F0; Tue, 17 Jan 2023 12:56:52 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C393C433EF
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 12:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C393C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-4d59d518505so251558977b3.1
        for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 04:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zCTcrqoGODrZdrYq2nwHaoVZBnxuGnQWSz71hkSZO8Y=;
        b=IYy4b1y/R5YFPkCKyYjQZR4ezCW+4iuj7fwF1zB4qj+VDvSUo+bjdMwhxEwYPrnmml
         oqiorZNFkxHvdPGd6jHS8BWlKeQ0xKiTH+Lr7ko4QrkzcxtkCIsJZbHqCKLRBPXv7Rfb
         vzhqt2DNqwBeuV75sRnO8kBNRilrG74ctuQWNMah6+5cR9uRFuFoZIwuBMNk1yoUWO9j
         9wEEb3R/QGxKbYGkexCd+qrLzP06qLnqvejr3bTE+HpwODI04Y+EXtjyWZMX9X79qPJP
         xpMu6uWqRpRESD861Jv961xYpLGvg+gFmaHRkncWVbsv+MuqfXCjgPwRpBsON32zGvtB
         1lXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCTcrqoGODrZdrYq2nwHaoVZBnxuGnQWSz71hkSZO8Y=;
        b=hgR7n7T6GFtVInkvyaVXCmzn2wf9Y7lYJ91jP8PpcZL2lSzPzzGSPsdWgn6iQp9uRP
         Bu7VV1uzFpUmxV3I3R7SCIezHU64FBOPfXkMDUgYEnTEmPVGJ4dghclsLXGzZYyDkK4A
         +S6saIAQKadUKdsKPhidYVQVJYO+buS2dsgCycmJqm9Ya/xR5cdXEczQZPWmRhNLkYxa
         Rp36MzZagAYIwHvPlE+haWXeygP88lTsRzhBP2h5zLakDZT7oxkXIT/ooYH7yTt675+Z
         oAhwRoZW0/vcVw8K1JDS9du76rHa/WgXyzdhtB7TVd4FOi0UX9lQnHGd4OK8fWaw4RjX
         8DIg==
X-Gm-Message-State: AFqh2kopzYIQcebRflfyJbaHbPFDviLptXdq8srKatcE4poVdEf57Pha
	0mCfuErpkju0YFvW8Y1CopIdcObOMqoQhj601BmIQg==
X-Google-Smtp-Source: AMrXdXv3kCWc+l64rPcp06Ox/i/C0EXE0JNSiXFn3Fv+xjfqq9lfaW2uXsDCkYPhWHDl+RVIF/VReYMAXixkrk4swm0=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr412735ywc.132.1673960210481; Tue, 17
 Jan 2023 04:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20230102131443.905304-1-dmitry.baryshkov@linaro.org>
 <CA+5PVA5ZXLZM=iVvr9tMSGeRbRLgzuODt4bkt+ZvMnzF50MU3w@mail.gmail.com>
 <d6aa1de2-55c5-c9cd-76f6-d94e91ca4e84@linaro.org> <CA+5PVA6HTmkaOxcK3ZP7GWtj9tNs74teygfb_pvc3=OJ8=R4nQ@mail.gmail.com>
In-Reply-To: <CA+5PVA6HTmkaOxcK3ZP7GWtj9tNs74teygfb_pvc3=OJ8=R4nQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Jan 2023 14:56:39 +0200
Message-ID: <CAA8EJpoCo=LEW2=gevVeaiRE9ThoFVwt6cUBA8iehE5zR2qnZw@mail.gmail.com>
Subject: Re: [PATCH] qcom: add firmware files for Adreno A200
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robdclark@gmail.com>, 
	Jonathan Marek <jonathan@marek.ca>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jan 2023 at 14:55, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Wed, Jan 11, 2023 at 10:17 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 11/01/2023 14:51, Josh Boyer wrote:
> > > On Mon, Jan 2, 2023 at 8:14 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > >>
> > >> Add firmware files for Adreno A20x (codenamed yamato), found in
> > >> Freescale i.MX51/i.MX53 and in some prehistoric Qualcomm Snapdragon
> > >> SoCs.
> > >>
> > >> The firmware were generated from the header files from EfikaMX kernel
> > >> sources ([1]), which bear copyright by QUALCOMM Incorporated and have
> > >> BSD-3-Clause licence.
> > >
> > > How did you generate it?
> >
> > I hope you don't mind putting the program here.
>
> Not at all.  Thanks.  Patch applied and pushed out.

Thank you!

-- 
With best wishes
Dmitry
