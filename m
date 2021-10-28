Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B742C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 28 Oct 2021 14:08:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C31F60C4B; Thu, 28 Oct 2021 14:08:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55FFB61056
	for <linux-firmware@kernel.org>; Thu, 28 Oct 2021 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635430081;
	bh=kpbUXlSGp/2jDi9Ev6t9pTx5RYnXD3IMgw4bgZcfULs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RZLoVD82wKbCSmvufztTVotP39p6FB6Hr94LY0VaJDdYV0jnCoSnmZvdcJ9x09Qfq
	 DDGN2XIVmpBR88rxLrNRgyMLl67lzmXhw4a+QM5dmONLLsLI7Si34SNh2AXQHWZ3N2
	 SJKix2LC5rgPS9RcFcQIf1iShvfZ9HtiasPJxynJ/WnVwMscb8YMWYygrCh5g+/dtG
	 c0/aZw645CaKBv/SuRFpOSSebsX4MkH9xNlDjdireb2yw8r04iBIp0tIQrjnJyrSgk
	 Gl3ewFr2y3MEksYWLEPilD4b/pVAizUHG9gFDBO8BQgTXL582XdaPWltHNpxFVsh0R
	 YCWHkXPvd9PSw==
Received: by mail-il1-f178.google.com with SMTP id h20so6996675ila.4
        for <linux-firmware@kernel.org>; Thu, 28 Oct 2021 07:08:01 -0700 (PDT)
X-Gm-Message-State: AOAM532BHpJuEhN5UNi0wIb3Qh0IDXxhh26fWa9H/4dMcjaybumCwlDV
	eUA22YqbquouEs7eepgZKkm6eIbFpJXPqZ6esqs=
X-Google-Smtp-Source: ABdhPJwfWRZ9lpUsWeRdHsZDVlHy7PuoG7YpnLe1WAVrqj1F0QPfl/xIzfJHh4i3cVtcMXEwV2t0GIcH+ATliJlHfXs=
X-Received: by 2002:a92:d8ca:: with SMTP id l10mr1943862ilo.218.1635430080705;
 Thu, 28 Oct 2021 07:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PWupF8Np2J50OAW-fYN7yAYgqdpZhbNjxqG+aLT3HDtA@mail.gmail.com>
 <CADnq5_Pmbtuofhro_5oi_73jMEPhh+7mVDAM3bd6D4ESbSyn3Q@mail.gmail.com>
In-Reply-To: <CADnq5_Pmbtuofhro_5oi_73jMEPhh+7mVDAM3bd6D4ESbSyn3Q@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 28 Oct 2021 10:07:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5M--MpuS8k6etSh9L-N=eADPgw5-csvB=umKqxThnWuw@mail.gmail.com>
Message-ID: <CA+5PVA5M--MpuS8k6etSh9L-N=eADPgw5-csvB=umKqxThnWuw@mail.gmail.com>
Subject: Re: amdgpu VCN firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 10:04 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Sep 27, 2021 at 2:04 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > New VCN firmwares for AMD APUs.  Please apply!
>
> Hi Josh, it looks like patch 0005 didn't get applied.  Re-attached
> just in case.  Thanks!

Apologies for missing that.  Applied and pushed out now.

josh
