Return-Path: <SRS0=1BVH=UJ=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4087CC433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Mar 2022 19:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A8EFC340F0; Wed, 30 Mar 2022 19:48:04 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5829EC340EC;
	Wed, 30 Mar 2022 19:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5829EC340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-dee0378ce7so12766045fac.4;
        Wed, 30 Mar 2022 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z2EPe9j9WIesqRNLy3g2D1/P5QWwskG0td3YGDxsfPc=;
        b=gUHMJHYvnRpSEQrMSSFAf39LyF2BViZTnWZ5rxW3xkYGjyIHy3PAwfQvBLYbdowN5H
         liJj95NcO4NuX6SK3TGCQi9mYNXGiTU0rDPPN/vzXu6SEUABgmlQc74kZHouhHo8oOmt
         Rz/tEC2t6Nc0FZPY0SItfN7BCrvNe07ppYs6bfjL+Mt+wbd1ilmjmNgzbu3MEYbB1YCF
         V3OV1694DBfM+Z4PNAjFawT8/1I6jOO591MlMAQ8QrTH/+FB8nGNmjJnGYTJ7DFvmu2w
         h3W7/tj7bHVbJnMx0vQQeD97YGTqowZGybJmlHfvTTqGSkUt2D9P8NgKGvY00QyBJw2e
         Gx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z2EPe9j9WIesqRNLy3g2D1/P5QWwskG0td3YGDxsfPc=;
        b=ViGbJA80zqV0k64EMZSIL3859E5ycnZuVSUnp4KIPRnPt4jVm1RqrwHBcIQotYDbzr
         +Y8PnQUiyfmxv8SWXg3I8J+LnTnkgG6o9yB+/Nsct8tSg1DNIs8MEi5zStDI98QEYiHl
         k1cH2jnkce3FdlZCwYFCblkvB33tlhO+LoAdLSR0zdLy1HYqccoVZBNXmAkkaL+y8CY8
         4hJR9xf8xeTD8p6tOWoPDqk/Kon81rU6pODh5w0Ag/w/SmDadPRRX/G19aEuWnN0YQr5
         uPhbLMBEgE5UkXE9q0HNpVOLBPzYDHMluX5VRlg53LNmiYCxKQ+/IcU7XSCfScdoL9zR
         6NaQ==
X-Gm-Message-State: AOAM532VPnW1CLS70SJ2mOl7yCvo/qSfap6YwfC1/cS0BGqjVxnNU8Z5
	l9H1p/MMgPRYcDF5s0+2QONaIOMDxJ1TVw/IhkXDLqMh
X-Google-Smtp-Source: ABdhPJxKOoqsPVcfFXpzzkb2nVyjx7/MGouD7L5p3MQEu9ICjUzDLFzTOfrANlbd7oomqCn/FMg+mKNdJpMM82i5U9I=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr729205oap.253.1648669682363; Wed, 30 Mar
 2022 12:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Ni5nEa5s05qheqJBeFeHDDgXsPpoUjCj1CWdhyeeyx3Q@mail.gmail.com>
In-Reply-To: <CADnq5_Ni5nEa5s05qheqJBeFeHDDgXsPpoUjCj1CWdhyeeyx3Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 30 Mar 2022 15:47:51 -0400
Message-ID: <CADnq5_MpX61+uWHnPZsePD4ABZop6vGLvfBLNWWxrL+myY6tZg@mail.gmail.com>
Subject: Re: Updated amdgpu VCN firmware
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
Cc: Boyuan Zhang <boyuan.zhang@amd.com>, Deepak.Sharma@amd.com, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi, I just wanted to make sure this patch didn't get missed.  As an
aside, would it be possible to get direct commit access so I could
apply these patches myself (and help with other firmware patches that
come in)?

Thanks,

Alex

On Thu, Mar 24, 2022 at 11:01 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Updated firmware.  Please apply!
>
> Thanks,
>
> Alex
