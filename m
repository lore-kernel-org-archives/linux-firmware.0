Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C33C433E0
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Jan 2021 12:58:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C91922312E; Tue, 19 Jan 2021 12:58:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A097E2312B
	for <linux-firmware@kernel.org>; Tue, 19 Jan 2021 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611061103;
	bh=QyoXovsTcd2m4sr9oSqTZUOt4ymliKS85ffl6IM59ko=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=EWAb1CnM2rG5jO/7s0ULMRyxx54V+MkIHRgv52Z07ITEBh04tRNJafnuY6CKa5ook
	 UsaHESpN3iZ7vlHQ3BTis7Yf+ABQl/+n2l0JNF2aku03b7uyadn87gC7cqxUu5ZkYM
	 7ZyTcMPfKlhFv2DNdOGo4bKTXFq2KUsfrkHc17qloJPK0opAoEfVCFZUKooJw7J3VG
	 41qmQSquWOJTLxaHy3sMGqqbDaDs04IFwCBgW7VdY+nXwEMHyexvUeSQWGGUCEEaOY
	 aBtn8a8QREB2XS1R/fEnje2iV8zHV0GU/OeoQK+1cjW8jLm1dm6lGUMF/oHLcAR7Hi
	 40XwuppkWpvMw==
Received: by mail-io1-f47.google.com with SMTP id d81so24111566iof.3
        for <linux-firmware@kernel.org>; Tue, 19 Jan 2021 04:58:23 -0800 (PST)
X-Gm-Message-State: AOAM530+CVQCpCipDE/ZnH7ZCfgQTbiHIJgs/G0xem28ZSjGNa9FbbQE
	e7tuK259wSD4zdlJVZaRZSjMon0kMHeC0b1efWY=
X-Google-Smtp-Source: ABdhPJyHTuKBjidMHmsOz30xncAlo0c23H5/NXRn90zX5K1cGIgOxBoOa6poihNxb+AiVLBi8HU4dOd2759kjMWXxus=
X-Received: by 2002:a02:d45:: with SMTP id 66mr3436784jax.120.1611061103014;
 Tue, 19 Jan 2021 04:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20210117121152.205990-1-pbrobinson@gmail.com>
In-Reply-To: <20210117121152.205990-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 19 Jan 2021 07:58:12 -0500
X-Gmail-Original-Message-ID: <CA+5PVA45nm3_yaJUNmXc1r7BCNDqhKTmiuTYXyRKsPvtH4_JfA@mail.gmail.com>
Message-ID: <CA+5PVA45nm3_yaJUNmXc1r7BCNDqhKTmiuTYXyRKsPvtH4_JfA@mail.gmail.com>
Subject: Re: [PATCH] Add support for compressing firmware in copy-firmware.sh
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 17, 2021 at 7:12 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> As of kernel 5.3 there's initial support for loading compressed firmware.
> At this stage the only supported compression methis is "xz -C crc32" but
> this option brings significant benefits.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  Makefile         |  4 ++++
>  copy-firmware.sh | 47 +++++++++++++++++++++++++++++++----------------
>  2 files changed, 35 insertions(+), 16 deletions(-)

This doesn't seem to deal with filenames with spaces properly:

[jwboyer@vader linux-firmware]$ time make
FIRMWAREDIR=/tmp/firmware/comp installcompress
mkdir -p /tmp/firmware/comp
./copy-firmware.sh -C /tmp/firmware/comp
xz: brcm/brcmfmac43430a0-sdio.ONDA-V80: No such file or directory
xz: PLUS.txt: No such file or directory
xz: brcm/brcmfmac43455-sdio.MINIX-NEO: No such file or directory
xz: Z83-4.txt: No such file or directory

real 0m3.457s
user 0m2.115s
sys 0m1.476s
[jwboyer@vader linux-firmware]$

josh

> diff --git a/Makefile b/Makefile
> index e1c362f..9a48471 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -11,3 +11,7 @@ check:
>  install:
>         mkdir -p $(DESTDIR)$(FIRMWAREDIR)
>         ./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
> +
> +installcompress:
> +       mkdir -p $(DESTDIR)$(FIRMWAREDIR)
> +       ./copy-firmware.sh -C $(DESTDIR)$(FIRMWAREDIR)
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 9b46b63..d154804 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -6,6 +6,7 @@
>
>  verbose=:
>  prune=no
> +compress=no
>
>  while test $# -gt 0; do
>      case $1 in
> @@ -19,6 +20,11 @@ while test $# -gt 0; do
>              shift
>              ;;
>
> +        -C | --compress)
> +            compress=yes
> +            shift
> +            ;;
> +
>          *)
>              if test "x$destdir" != "x"; then
>                  echo "ERROR: unknown command-line options: $@"
> @@ -31,40 +37,49 @@ while test $# -gt 0; do
>      esac
>  done
>
> +if test "x$compress" = "xyes"; then
> +    cmpxtn=.xz
> +    grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
> +       test -f "$f" || continue
> +       $verbose "compressing $f"
> +       xz -C crc32 $f
> +    done
> +fi
> +
>  grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
> -    test -f "$f" || continue
> -    $verbose "copying file $f"
> -    mkdir -p $destdir/$(dirname "$f")
> -    cp -d "$f" $destdir/"$f"
> +    test -f "$f$cmpxtn" || continue
> +    $verbose "copying file $f$cmpxtn"
> +    mkdir -p $destdir/$(dirname "$f$cmpxtn")
> +    cp -d "$f$cmpxtn" $destdir/"$f$cmpxtn"
>  done
>
>  grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
> -    if test -L "$f"; then
> -        test -f "$destdir/$f" && continue
> -        $verbose "copying link $f"
> -        mkdir -p $destdir/$(dirname "$f")
> +    if test -L "$f$cmpxtn"; then
> +        test -f "$destdir/$f$cmpxtn" && continue
> +        $verbose "copying link $f$cmpxtn"
> +        mkdir -p $destdir/$(dirname "$f$cmpxtn")
>          cp -d "$f" $destdir/"$f"
>
>          if test "x$d" != "x"; then
> -            target=`readlink "$f"`
> +            target=`readlink "$f$cmpxtn"`
>
>              if test "x$target" != "x$d"; then
>                  $verbose "WARNING: inconsistent symlink target: $target != $d"
>              else
>                  if test "x$prune" != "xyes"; then
> -                    $verbose "WARNING: unneeded symlink detected: $f"
> +                    $verbose "WARNING: unneeded symlink detected: $f$cmpxtn"
>                  else
> -                    $verbose "WARNING: pruning unneeded symlink $f"
> -                    rm -f "$f"
> +                    $verbose "WARNING: pruning unneeded symlink $f$cmpxtn"
> +                    rm -f "$f$cmpxtn"
>                  fi
>              fi
>          else
> -            $verbose "WARNING: missing target for symlink $f"
> +            $verbose "WARNING: missing target for symlink $f$cmpxtn"
>          fi
>      else
> -        $verbose "creating link $f -> $d"
> -        mkdir -p $destdir/$(dirname "$f")
> -        ln -sf "$d" "$destdir/$f"
> +        $verbose "creating link $f$cmpxtn -> $d$cmpxtn"
> +        mkdir -p $destdir/$(dirname "$f$cmpxtn")
> +        ln -sf "$d$cmpxtn" "$destdir/$f$cmpxtn"
>      fi
>  done
>
> --
> 2.29.2
>
