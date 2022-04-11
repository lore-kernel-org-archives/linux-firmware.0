Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184E3C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 11 Apr 2022 11:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 004AAC385A6; Mon, 11 Apr 2022 11:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF01AC385AA
	for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649675195;
	bh=DQ2teHgr09rL6J3rCaPhBz5XHzlngsueKW/1BbhgaSo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HtX81MlEpSfEae7V6obd/FFp2/Yxpveutvw/wgRCaZNayst6XUJ6QlwwllczhAce+
	 QRaA70UBPxduMNAvso8CW87rRZSlERExsnbBIFRgAoLawzN50E5D1ibviX8uvIKwz6
	 7p6fMA9pjp0Tt0nZxLdXMvrgImibq/YJK08yvCshX80aPoT92r0X5xlwCnGrJGxosk
	 1Hsw/LkwnYxmUGXmN0c5SlOlPztnrmvmpkkctGga1ABccSUEp+F8rnSCSlyU4zggwB
	 ApXVPY1Pis7oBV8NwW8w+UkcZvZQ4pBo7DFt5QFHrNLcaBtqiHbTKOAWpWvfhcX4YL
	 kWGhBIcCk6gcg==
Received: by mail-io1-f48.google.com with SMTP id r2so18164099iod.9
        for <linux-firmware@kernel.org>; Mon, 11 Apr 2022 04:06:35 -0700 (PDT)
X-Gm-Message-State: AOAM532l956p8DVFJAXqS5TUlRxej5w/VTrQGUPGQSOBrXxG32MpVVnQ
	31xOMiy5e1RkuzBybWa+FNRUWVIgG5Vl0vbxnMs=
X-Google-Smtp-Source: ABdhPJycFoD5NHPBNyp9l1aZbvA4VTaIHRnPaqkgQSRrbGqzu7D8HCPieO1BNI5DQ5LXykQsxeTLl+2KtIo4EQUAogA=
X-Received: by 2002:a05:6602:2c0d:b0:60f:6ac8:ad05 with SMTP id
 w13-20020a0566022c0d00b0060f6ac8ad05mr12026547iov.175.1649675195074; Mon, 11
 Apr 2022 04:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Ni5nEa5s05qheqJBeFeHDDgXsPpoUjCj1CWdhyeeyx3Q@mail.gmail.com>
 <CADnq5_MpX61+uWHnPZsePD4ABZop6vGLvfBLNWWxrL+myY6tZg@mail.gmail.com>
In-Reply-To: <CADnq5_MpX61+uWHnPZsePD4ABZop6vGLvfBLNWWxrL+myY6tZg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 11 Apr 2022 07:06:24 -0400
X-Gmail-Original-Message-ID: <CA+5PVA74QR+vUdYi7LJtVzyBN-qu3jXfi8r=E+FsbVjCBd9cAA@mail.gmail.com>
Message-ID: <CA+5PVA74QR+vUdYi7LJtVzyBN-qu3jXfi8r=E+FsbVjCBd9cAA@mail.gmail.com>
Subject: Re: Updated amdgpu VCN firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Boyuan Zhang <boyuan.zhang@amd.com>, 
	Deepak.Sharma@amd.com, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 3:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi, I just wanted to make sure this patch didn't get missed.  As an
> aside, would it be possible to get direct commit access so I could
> apply these patches myself (and help with other firmware patches that
> come in)?

Apologies for the delay.  I was away from the keyboard for a while.
All are applied and pushed out.

I'm not opposed to taking on more maintainers, but I probably need to
writeup a README on how to do it.  I'll send you an email once that's
done.

josh
