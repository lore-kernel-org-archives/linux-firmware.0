Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B5FC43334
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Jul 2022 10:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BCCAEC341CB; Tue, 19 Jul 2022 10:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7728C341CE
	for <linux-firmware@kernel.org>; Tue, 19 Jul 2022 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658227495;
	bh=nkiOpQrFjTwEqKC3Go3BQ7913AldxNFFHCq4MeLedec=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bxZs7xwPLqutDBzCediV4THnxRE1VHn/WuEUih43kdSaGdRUNvAAXAwjDcTKgiGYj
	 Z/Ey6cQ808dtIoQTxm6gZnk1uv5h9WGOVCNLKQTTFyrQizI981iypEI2NMiauLaFR6
	 lNoMwJso0BX4b6dSAgOGTBE03gvi895alMK9k4tHKj1ZeKmxjKSTgjEObfW8vb76qs
	 v1Cw1DFWuWgbTK030qVGijaeRmnfqTA6aagbAYeeMBoy0Fy6Vx+ZuOt8PJo1HnG4SS
	 aTGBeLc+S6YBTpQMuR3f6CrVo5D5k9Uh65scgPVsXSFdFzTCgAEXCOOOA/bGITA7Wx
	 oN9Et2sPCmD8w==
Received: by mail-il1-f171.google.com with SMTP id i5so33761ila.6
        for <linux-firmware@kernel.org>; Tue, 19 Jul 2022 03:44:55 -0700 (PDT)
X-Gm-Message-State: AJIora+xxqd1sRBlAK8Uh170BGPVzNnQVA1VPgs4oBVoRqoOBWCIqX62
	8XrY9Z5VJqhFMwAr6IR75OzyRPmb7xivFoMUWYc=
X-Google-Smtp-Source: AGRyM1tjRR6M0OWgru4MXMAzcnwef4d19f8+nTxl7XxA97NZDYhtvQvQm+c7b3Bf5hFqWQYJMVisIqTNQo1IcEXDpw8=
X-Received: by 2002:a05:6e02:1b89:b0:2dc:9e66:e98e with SMTP id
 h9-20020a056e021b8900b002dc9e66e98emr15447451ili.218.1658227494747; Tue, 19
 Jul 2022 03:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_M8qck27Rm9WWO+dQY4s9z6qH9Yindc-hmqyS9=vKVpFg@mail.gmail.com>
In-Reply-To: <CADnq5_M8qck27Rm9WWO+dQY4s9z6qH9Yindc-hmqyS9=vKVpFg@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Jul 2022 06:44:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA74wYdpWbHNrT2Sb=8VdCV-s6eH3PcdNX+n1B-=rXr3-Q@mail.gmail.com>
Message-ID: <CA+5PVA74wYdpWbHNrT2Sb=8VdCV-s6eH3PcdNX+n1B-=rXr3-Q@mail.gmail.com>
Subject: Re: amdgpu firmware updates for 22.20
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

All applied and pushed out.  Thanks.

josh

On Mon, Jul 18, 2022 at 2:35 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated amdgpu firmware.  Please apply.
>
> Thanks,
>
> Alex
