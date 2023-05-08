Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A689C77B7F
	for <linux-firmware@archiver.kernel.org>; Mon,  8 May 2023 12:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 482B9C4339C; Mon,  8 May 2023 12:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4CCC433D2
	for <linux-firmware@kernel.org>; Mon,  8 May 2023 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683550276;
	bh=HtGILw76owSFs1AsVapAB68ZvsP0EnwPTmV369eVXUE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BRChfo/ov52xtGu19n89/YBdMvMbe9SIcfseaGXBpCC7w9aClzKG0882vUAMYVsy2
	 a0YaWnSf8qN/RhtAtvvqKMU/rnR0+atT7NBPYLFctG+h/Dj5/uy3KfxUXKn+W0TwQK
	 774hL8q4/gV32/C7au6UqyQvmXkK2ZeXKtEBM8Gx9gvFLxRAzBIDkMSm5HO17FqRWA
	 0cqaC2vJ7Oos2ZrrqgCLz9M57DQH/ToyrYv8ZRkVWU+cnYu6pCJPNWYYV6H6pXj3K5
	 Ad2fFtSkXj78nrz/ivabi2buULzp11vWDEnDvtylSBu5/0WWzhcNUe/L1QcjT17VoC
	 uao6WXFJLjY5g==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-559debdedb5so66971647b3.0
        for <linux-firmware@kernel.org>; Mon, 08 May 2023 05:51:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDwPTjE0Tjo9zrnGN9NLBI9gBlQ9rWHK6UXdJWK47mb28cQfbjGn
	+n5qavUkuTpRtMfn+DwVNu/+Ex/7XNt/oxLMeok=
X-Google-Smtp-Source: ACHHUZ6VW9P3qKLQxQg2Owrne9PVMrZjjPEWwWVjOZazos8YniztnICS2VKS2gNeeOI1PRyKH9ORfBhhmBgJ/kVpjaQ=
X-Received: by 2002:a25:d6d5:0:b0:b95:99be:b8c with SMTP id
 n204-20020a25d6d5000000b00b9599be0b8cmr8782237ybg.64.1683550275201; Mon, 08
 May 2023 05:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 May 2023 08:51:04 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7HxxrO+_SM7K-bcZA_98_Qo6VsLezjAjJAu8H-SkX6dA@mail.gmail.com>
Message-ID: <CA+5PVA7HxxrO+_SM7K-bcZA_98_Qo6VsLezjAjJAu8H-SkX6dA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/16] Misc fixes, sanity checks and xz/zstd compression
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I applied a few more of the patches, but generally speaking some of
the changes conflate check_whence.py and copy-firmware.sh.  I think
they should remain independent scripts and not make assumptions that
one is doing something on behalf of the other.

josh

On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> Hey everyone,
>
> Here's an updated series which fixes some outstanding issues, enhances
> the check_whence checks and adds xz/zstd firmware support.
>
> v2:
>  - Commend out duplicated MediaTek firmware
>  - Tweak list_links_list() after Adam's approach
>  - Skip compression of amd ucode
>
> Link to v1: https://lore.kernel.org/linux-firmware/CACvgo50RhmRKnUoos2wGW=
OP-Pb8oGo1BMPunfTtBQO0eX1D2Dg@mail.gmail.com/T/
>
> Josh, others, kindly let me know if you'd prefer a PR or if there is
> anything I can do to move this forward. Be that as a whole, or chunks of
> it.
>
> Thanks
> Emil
>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Emil Velikov (16):
>       WHENCE: remove trailing white space
>       WHENCE: remove unnecessary filename quotation
>       check_whence, WHENCE, copy-firmware: escape filenames with spaces
>       WHENCE: remove duplicate File entries
>       WHENCE: comment out duplicate MediaTek firmware
>       check_whence: error on duplicate file entries
>       check_whence: error on directory listed as File
>       copy-firmware: remove non-applicable file presence test
>       check_whence: error if File: is actually a link
>       check_whence: error if symlinks are in-tree
>       copy-firmware: remove unreachable symlink workarounds
>       copy-firmware: quote deskdir to prevent word splitting
>       copy-firmware: tweak sed invocation
>       copy-firmware: quote the output of dirname
>       copy-firmware: silence the last shellcheck warnings
>       Makefile, copy-firmware: support xz/zstd compressed firmware
>
>  Makefile         |   8 +++++
>  WHENCE           | 107 ++++++++++++++++++++++++-------------------------=
------
>  check_whence.py  |  53 +++++++++++++++++++++++----
>  copy-firmware.sh |  76 ++++++++++++++++++++-------------------
>  4 files changed, 141 insertions(+), 103 deletions(-)
> ---
> base-commit: 60971a6485ee604c47cc905ff77c583ae001f9df
> change-id: 20230301-fixes-and-compression-7247407cab21
>
> Best regards,
> --
> Emil Velikov <emil.l.velikov@gmail.com>
>
