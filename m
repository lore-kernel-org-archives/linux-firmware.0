Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D60BC433EF
	for <linux-firmware@archiver.kernel.org>; Mon,  2 May 2022 12:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA814C385AC; Mon,  2 May 2022 12:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFCBFC385AE
	for <linux-firmware@kernel.org>; Mon,  2 May 2022 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651494384;
	bh=Nd7lWjioNFai/y4YRniL+4T64Aqgkjv9/kU8FCl+h3o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=TqMCc9JLk79npaQEO0HkP6rKLuVC7k+DHZNdv4Xrru3hWtHqak6Kxk+nfNIRooAqV
	 G+maTKlvRz1QZHyMEUTo+YOzOXVHcB2jqDgGuFLYt+8DtiYqgPl8WXy2dfkq1qG8EM
	 A+pocfMOnBHjICwrsZjB/UU1Y3cwXPfZOGDD12kaRiEsTZfdWYG24Sv1zpS3lGJhlt
	 lKzF0WgSgXFbaPM1oQ9RgWps9drJBZ+Hi0zxeJ4S3ULwFwkMJ1LJvnjB2hDml24iN4
	 tCdgXmrE9l1xLwL7k8jeuYc1Fiy7Si7OZrp05MpqRIhrDiYf+KWk21TT3rNsny1WEB
	 hRdoW1FbtBXJg==
Received: by mail-il1-f177.google.com with SMTP id s14so1593838ild.6
        for <linux-firmware@kernel.org>; Mon, 02 May 2022 05:26:24 -0700 (PDT)
X-Gm-Message-State: AOAM530TWF8WrAGv4wxkRJWPCdSTCVkz+aLeeDHstlEqFbdOjUmIbQ7K
	f4t8djNTEGYSbMMUuHRXvqrEFCMUh/vr4fJ15fg=
X-Google-Smtp-Source: ABdhPJwFwrG8Rii0mZCz9Ix7XR4LNVv5cUVqHi12efFmE1168zHepjM6kvds55F9450x4H/h3PBFtY8yd5+psC7wVw8=
X-Received: by 2002:a92:c569:0:b0:2cc:1076:6c1c with SMTP id
 b9-20020a92c569000000b002cc10766c1cmr4652596ilj.97.1651494384013; Mon, 02 May
 2022 05:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_P65f99akcyui5K7jziE64pEDT-Cajgau8c4YUa3bVNQw@mail.gmail.com>
In-Reply-To: <CADnq5_P65f99akcyui5K7jziE64pEDT-Cajgau8c4YUa3bVNQw@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 May 2022 08:26:13 -0400
X-Gmail-Original-Message-ID: <CA+5PVA44VCZLE8-thxM+Wp1H0PNug_B=D-7O-bFGgDxhsjcdWg@mail.gmail.com>
Message-ID: <CA+5PVA44VCZLE8-thxM+Wp1H0PNug_B=D-7O-bFGgDxhsjcdWg@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Deepak.Sharma@amd.com, 
	Prike Liang <Prike.Liang@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 11:16 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated amdgpu firmwares.  Please apply!

Applied and pushed out.

josh
