Return-Path: <sean.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D2FDEE31
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 17:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1C34C2BCB7; Thu, 23 Apr 2026 17:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB31EC4AF0C
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965782;
	bh=xwtw0OJvGLE/Lum++zazpkBN2D4nXALffdNH3wQw0YE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ohamrm1o8Z1E/xgWjSFDxDlknSNleOgeQbCp0ATK1BPeF44XQbhwrJICaj7SFv9cj
	 3CzPKG5ainaRsFAh5IVcfIaf46kshsY0xVwwwMQJL3AX3q2UKjVSQp7uphRp9REPzJ
	 hYaV5yRWHViuGNLdmscQsSWOjDndZu1trId3yOnVBUdLJAvPOyv1gUhy1NO0k9Jk0p
	 KyVNYyKjDjQ/zU/uF6y6QLNHKy802D61Qgc0B41SRDkKq02t+UUNoNY0vyyxxqS1XO
	 jzrZe7NUfWBH23BblQEuJ4TBcLm722QeX6jy4sSAEY3ijJceMVjT4Fqrtuv0qPBElf
	 C4Smh79HoY17A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38ccde812ecso68133151fa.0
        for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 10:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rqyJrp/zCMPUFxFT15nw9VJ6GT3PAJyzAZAoQD/s+CZ4FsuqpEnLL1UaOVrZy1A+sGNHJVqh/TsWzEtyf2g==@kernel.org
X-Gm-Message-State: AOJu0Yx0X0THl3hwGH4tBXMVyWCH4s5kEtwadTF77onrAoqF+Fz/o3Zi
	8tdYic3imsDMTa8ZDqp1T4pF3cKttSj0KxiPqkaOJ2Y7Xrezys2KyoxU5I7ErAxtkNNkoD0Sd7b
	dBb3yyt+b6eBaV1DO5Bnav6MoLcGGSx0=
X-Received: by 2002:a2e:878c:0:b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-38ec8ff15fdmr59864981fa.7.1776965781090; Thu, 23 Apr 2026
 10:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAKHmtrSaDR4fBxN0mvEzYPHoOwr2rrtnOJW6fsrxzsBAeHTjQg@mail.gmail.com>
In-Reply-To: <CAKHmtrSaDR4fBxN0mvEzYPHoOwr2rrtnOJW6fsrxzsBAeHTjQg@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 23 Apr 2026 12:36:09 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpG3QXdHxy_E-9mCat9bTDDNSnz_vMHYgSNiVzwF3dkrg@mail.gmail.com>
X-Gm-Features: AQROBzCAd4x1at669eIVKMLAV0sDSHEHFBd8wCOhg12KB7-ZuJ4KwsllBKzDQDA
Message-ID: <CAGp9LzpG3QXdHxy_E-9mCat9bTDDNSnz_vMHYgSNiVzwF3dkrg@mail.gmail.com>
Subject: Re: [PATCH v1] mediatek MT7925: update bluetooth firmware to 20260414153243
To: David Ruth <druth@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <chris.lu@mediatek.com>, 
	ben@decadent.org.uk, dwmw2@infradead.org, johan.hedberg@gmail.com, 
	jwboyer@kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, marcel@holtmann.org, 
	ss.wu@mediatek.com, steve.lee@mediatek.com, will-cy.Lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 5:19=E2=80=AFPM David Ruth <druth@chromium.org> wro=
te:
>
> Tested-by: David Ruth <druth@chromium.org>
>

Merged
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1015
