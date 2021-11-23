Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CFFC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Nov 2021 17:29:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACC2E60F6F; Tue, 23 Nov 2021 17:29:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96F7360F58;
	Tue, 23 Nov 2021 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637688561;
	bh=WyceQFx9V1PlTLIPU/zmSumXCjdDVXWkL8cG2NsQPZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Xeb38TDRYfX0YxT+hjtw4I0yfAklv6ioxlKDbnWiS50OCqhFGyexHZdiS50u7mWZe
	 N+0nMHoqVSya65niAc/S+hfw7ufq++1G5QqoHNTwrmzDYdUFXioljSvb643VcMbHdd
	 0F+yhDsbLH+qz/h4zc5134nxVk8Lurcg54Yb/JpDdRAhdI0hZ+7vKjj9dQvnHAcH98
	 B2TJmBplRMLrFfu1sB/BFKGkYISJBHpbDZEVBZh4sOrYUCvtdOOnU8nS/2UjKcdco9
	 ivyjFK1cgSVvtfXCe/qm4fjffXWieCZbwISEh8AGwksnaNlwH864Hkr+AXUZJKx8du
	 /M3gOVpIbz4Bg==
Received: by mail-io1-f48.google.com with SMTP id x6so7171963iol.13;
        Tue, 23 Nov 2021 09:29:21 -0800 (PST)
X-Gm-Message-State: AOAM5326gZmapbUO/n+gtNgduBCIEaa6/w32MEZjMHN3S0oKHaJUez4g
	xaEk6aon240RUfv0sF3J5NPHZuf5KRlva6n/tOk=
X-Google-Smtp-Source: ABdhPJwG87WAQLh9pOMsanwFnt10WAWiOEmzvkRC7ExfVQAcoZVxkIY2tpZCy7yRupPlLV8wAjKYK3ls+ppNshtsLSM=
X-Received: by 2002:a5d:888c:: with SMTP id d12mr6953105ioo.175.1637688561027;
 Tue, 23 Nov 2021 09:29:21 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_OCO3y0RhOTWB8yDhTKU3Ge98azCnEQx9nayDvFPR4U7g@mail.gmail.com>
In-Reply-To: <CADnq5_OCO3y0RhOTWB8yDhTKU3Ge98azCnEQx9nayDvFPR4U7g@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 23 Nov 2021 12:29:09 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6WispQ0FdMK5J1wp+7r7SvUp1aNgp5CauJELCisQa-HQ@mail.gmail.com>
Message-ID: <CA+5PVA6WispQ0FdMK5J1wp+7r7SvUp1aNgp5CauJELCisQa-HQ@mail.gmail.com>
Subject: Re: updated amdgpu firmware
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>, 
	Zhan Liu <zhan.liu@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 3:06 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated amdgpu firmware for vangogh.  Please apply!

Applied and pushed out.  Thanks.

josh
