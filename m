Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699A1C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Sep 2021 13:25:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4DAB6611BD; Tue, 28 Sep 2021 13:25:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 380C0611CA
	for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 13:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632835546;
	bh=GScXnmV8j2rAtqwNerakvuz4e7oreNB0aFEKx7ZzRok=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=i1ew8qyeoWehsASZQjkSKy6csVOFUWzbbd7/1NQU03quWYkWRm1jxYpZzr6AxA+IO
	 RfZfu0asb0Z9Ab0ylIxq6kQZhL8C5UIYrZkFXrkYYqej8mJEDvde9jNLIxGIPO4bbT
	 YFw3dIEjAUBPoD48+5DCPpHk78acH3IpUHkVTW3jlIj1O6X0pAJUg2Al9n8ZkVY+mK
	 GsOImpLnG66rjpH+2QVS7gDpRK7lr/83yy31Z/aLNvuF58e2b6HzI+sUc6atwD8Bu7
	 sYBwXcEkZnz9ra9ZY65Xx0CHZOaISsm+EdcWVCPiarlODeJMoRYS2dVUQpuYEgIAxt
	 PylLkIbzU0kVg==
Received: by mail-il1-f179.google.com with SMTP id y15so2182193ilu.12
        for <linux-firmware@kernel.org>; Tue, 28 Sep 2021 06:25:46 -0700 (PDT)
X-Gm-Message-State: AOAM533PMcUkEwjMnfrhdg9cIQlReAZlErttnEnfAlwujrRPlNLQOUYW
	Hn255FkUWZapIoiX/ejot3cb/hRifupJK42KOm0=
X-Google-Smtp-Source: ABdhPJwyDUo1ilKvPjqsx3arEPMzsLzkhFyTumBpkTakmki87sA6/3iNbmKtyJ+fPRwLfzpnPgl2nTs+/6edH5Dxg1M=
X-Received: by 2002:a05:6e02:20c2:: with SMTP id 2mr4826946ilq.97.1632835545080;
 Tue, 28 Sep 2021 06:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_PWupF8Np2J50OAW-fYN7yAYgqdpZhbNjxqG+aLT3HDtA@mail.gmail.com>
 <CADnq5_OR1sQv8=MFzxGFyXHothkFskfTb6TMJS1b7JoAP4A1dg@mail.gmail.com>
In-Reply-To: <CADnq5_OR1sQv8=MFzxGFyXHothkFskfTb6TMJS1b7JoAP4A1dg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 28 Sep 2021 09:25:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA444kChTvKzfXTyWy6=nVrFczodnhfdmwkn4i2x+gY0dg@mail.gmail.com>
Message-ID: <CA+5PVA444kChTvKzfXTyWy6=nVrFczodnhfdmwkn4i2x+gY0dg@mail.gmail.com>
Subject: Re: amdgpu VCN firmware updates
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Veerabadhran Gopalakrishnan <veerabadhran.gopalakrishnan@amd.com>
Content-Type: text/plain; charset="UTF-8"

All patches applied and pushed out.  Thanks.

josh

On Mon, Sep 27, 2021 at 4:02 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> A few more VCN updates attached.  Please apply them as well.
>
> Thanks,
>
> Alex
>
> On Mon, Sep 27, 2021 at 2:04 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > New VCN firmwares for AMD APUs.  Please apply!
> >
> > Thanks,
> >
> > Alex
