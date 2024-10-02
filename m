Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8361DCF31B4
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Oct 2024 12:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4ACA1C4CECE; Wed,  2 Oct 2024 12:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342CDC4CECD
	for <linux-firmware@kernel.org>; Wed,  2 Oct 2024 12:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727871246;
	bh=eQObt6haSbCc8UAE4BkFEv2bQrCW2bYm6WqI7gWVZXE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Sapp68VDWifAQXwqTPBaYUENX0KQjeh5+fUt49448otxfQPm8X3Amxul+lGNl32HZ
	 mQ39W2CkTNE4CmPttfa/SJlwUqCdSmAML6mpZIlO1Co3Zjp4bFBOkM24+8eAzRCvvP
	 aiBrYzoejwxO5Q7ZTzbA47qLNR89dgyC8Kft4xN2O0d80iZKgFaiC7iYWZVAQkiKHL
	 5uJ68yvrz2oUT+euDscNZJXOCjRAyEw2tiqy3dlKz5y6PrAWX4BSKT044GVqE6BD9s
	 z3Kc5Aw/7laSxj9FNz2avcLVNK9K2fGQhPqj6UeckbNU+ZMhdqWcsHFITbzQsKEk7O
	 ZIVtvGJGSUvew==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e116d2f5f7fso623502276.1
        for <linux-firmware@kernel.org>; Wed, 02 Oct 2024 05:14:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YxSv5SEmKkavgDhQNj/VMqvcXBl5loY1T+L4PLPT0JYZTX+/sCu
	T5rDZ9Gg6m7kocIf8bocjTQp76GOI7pwM01VPEYtHSyRPKuh+DOZK8FGQh7RigZK7dPA8kJdbvZ
	0mvzIkzG605xQQE5y2hS+i/6X2ZM=
X-Google-Smtp-Source: AGHT+IG53FUqvULfZPRnQJyxWM8oKz3X7D31rZ4wbgYPmjs+/RVWTMSDmDgZqGgT0N0XlR/H3Nf6wJ0FbagiYNrmn1k=
X-Received: by 2002:a05:690c:3190:b0:6e2:41fa:9d4 with SMTP id
 00721157ae682-6e2a34ad25dmr18396017b3.15.1727871245456; Wed, 02 Oct 2024
 05:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240913092122.19523-1-tiwai@suse.de>
In-Reply-To: <20240913092122.19523-1-tiwai@suse.de>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 2 Oct 2024 08:13:54 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7QXBGG=tRjh6BVMdyU1hHj8DtOhQkVwiBOvpjtzASUmA@mail.gmail.com>
Message-ID: <CA+5PVA7QXBGG=tRjh6BVMdyU1hHj8DtOhQkVwiBOvpjtzASUmA@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] copy-firmware: Fix incorrect symlinks to
 uncompressed targets
To: Takashi Iwai <tiwai@suse.de>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 5:20=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> The script tries to make a symlink to the target with the compressed
> extension, but it ends up with a wrong symlink if the compression is
> skipped for the target (e.g. via RawFile entry).
>
> Add more checks to make a correct symlink.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>
> This fixes the installation failure with the recent change for qcom
> commit 541f96c0fa47b70e9bc13035f7a082064e5b2d4c
>
> The workaround is pretty ad hoc, so if you have a better way to manage
> it, feel free to scratch this.

Juerg came up with something slightly different:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/297

josh

>
>
>  copy-firmware.sh | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 6757c6ce03a3..fc096dd6daf0 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -136,9 +136,15 @@ grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/->=
 //g' | while read f d; do
>          if test -d "$target"; then
>              $verbose "creating link $f -> $d"
>              ln -s "$d" "$destdir/$f"
> -        else
> +        elif test -f "$target$compext"; then
>              $verbose "creating link $f$compext -> $d$compext"
>              ln -s "$d$compext" "$destdir/$f$compext"
> +        elif test -f "$target"; then
> +            $verbose "creating link $f -> $d"
> +            ln -s "$d" "$destdir/$f"
> +        else
> +            $verbose "creating link (not yet existing) $f$compext -> $d$=
compext"
> +            ln -s "$d$compext" "$destdir/$f$compext"
>          fi
>      fi
>  done
> --
> 2.43.0
>
