Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC4C4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Oct 2022 17:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5BEEC433B5; Wed, 12 Oct 2022 17:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC8BC433D6
	for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 17:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665594319;
	bh=TxGakG7SnpJtZ509BbQuUttHqXc4/liE1QK2G4a7UGo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YR3dHpc0cX5ZyPu+rfM+uQSL36zWRDyo2TTJlg3b2DQbkJ6u7m/gtQ5FRwZEROVoo
	 TK/Z3spiND8GJ2vuscxJYz3Hbp5aTA1Mx7hNtlIVCigC7AJJN7FnwDIFNWBn9ZtPA1
	 Q2Og67xJpZ/NWzE2ljWoujjtNeZ/imGsytUjm+idLtRl3y8gY25Q8CDkOa6G08yL/N
	 MW41HsVkXA3A1Jm2cvLIDQdMhykqufIXEwhz1av15mjRPj4fl+SFYm0n4v6GWCPCOW
	 F6fwqiifIlYdpSWAIUV8RiSzTur3/N9i/aQy6AFfstvJZoMMF1AqIfDE1thOX/9jEj
	 MgpwC4L+fMPmA==
Received: by mail-oi1-f174.google.com with SMTP id u15so13827442oie.2
        for <linux-firmware@kernel.org>; Wed, 12 Oct 2022 10:05:19 -0700 (PDT)
X-Gm-Message-State: ACrzQf1DUELi4ZdG+KbS8cCeTOU2qxgj8Jvxo+hdo8q/12UnOkpJCQmZ
	xpbXk/2LRP2JcIHgwuGQZ/OgIlVxjR3xkBUu0tM=
X-Google-Smtp-Source: AMsMyM7tWrkIVWSTidz4+mBXGdrX4JEJTbGp6sN0eX33u4Rf9Mk2cvUzVhuaXa8R9SGsxiSFM6ncOw+sro8NEJhYfsI=
X-Received: by 2002:a05:6808:bca:b0:350:b366:157 with SMTP id
 o10-20020a0568080bca00b00350b3660157mr2594543oik.3.1665594318920; Wed, 12 Oct
 2022 10:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <3e31775b3916b4d9300e6156564dc80f889c4b8b.camel@realtek.com>
In-Reply-To: <3e31775b3916b4d9300e6156564dc80f889c4b8b.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 12 Oct 2022 13:05:08 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6LsBLqn6CK4y+ePpcsj1cZMpZzpjQkxZ-JWwoCZ=-=-g@mail.gmail.com>
Message-ID: <CA+5PVA6LsBLqn6CK4y+ePpcsj1cZMpZzpjQkxZ-JWwoCZ=-=-g@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852c: update fw to v0.27.56.1
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Timlee <timlee@realtek.com>, 
	Kevin Yang <kevin_yang@realtek.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 7, 2022 at 6:39 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8852c firmware of rtw89 driver to v0.27.56.1
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit d2aac63b8381c0633de00476a7f3d8f436ea4bc5:
>
>   rtw89: 8852c: update fw to v0.27.56.1 (2022-10-07 18:35:47 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to d2aac63b8381c0633de00476a7f3d8f436ea4bc5:
>
>   rtw89: 8852c: update fw to v0.27.56.1 (2022-10-07 18:35:47 +0800)

Pulled and pushed out.

josh
