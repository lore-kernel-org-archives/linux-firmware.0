Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7B3C433E0
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Feb 2021 13:47:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6021B64E54; Mon,  8 Feb 2021 13:47:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 369AF64DED
	for <linux-firmware@kernel.org>; Mon,  8 Feb 2021 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612792043;
	bh=Q861Z5JO5K1p9p73+Bh8rc6jiL72FQTw3L3xmnuz0ks=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=YtW6Q1XaV9rqpT/PFRSeN/Gxu0fkAF61u8gdKLtFuBKYOVq/U1PYskL8YrrcyOUto
	 kzu/3rjpnqaL++eJHWpk/Z78noyX0mYWBQZN/m7KY+SKcJogEYn/UR3L1wwtitOp3M
	 hHD/tdQ+gXkXk1YAIefCtNNtNL1aeBqitSyptMNcXWXLHWWh/mR5v3v4kPHB3CpBRu
	 L8uhkqgT7SA7a96jkH3pYX0nuR3Tg94yv+BKOjU/tnidBmh7siElzHTu/YoDy/TNW7
	 YRvXOMbCiDQJtZaF6yJyg6lYdq89B1xWE4Z49zwnFZtYmU9JlJgvCIdwtLZAt3uzkd
	 BmN93FI5K6YRA==
Received: by mail-io1-f46.google.com with SMTP id n2so14977893iom.7
        for <linux-firmware@kernel.org>; Mon, 08 Feb 2021 05:47:23 -0800 (PST)
X-Gm-Message-State: AOAM531ghg0iyotxyHatajC78zwKDP6Afxyu/t+Ian4wj7xbq9CUd+c6
	OS0qfITKnIxF8cfzMpH01m3hPbbtojQI8/fpBl0=
X-Google-Smtp-Source: ABdhPJz1+G1bpKaXUU0n9XUifXl3X8QTWuNf9wr4ykyKMgqkQeVKGDp6OyPn3xi8M1UD+qZKmpFvkCGctlqYl13tKCI=
X-Received: by 2002:a02:ce9a:: with SMTP id y26mr18311323jaq.73.1612792042513;
 Mon, 08 Feb 2021 05:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20210123102625.589472-1-pbrobinson@gmail.com>
In-Reply-To: <20210123102625.589472-1-pbrobinson@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 Feb 2021 08:47:11 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7c2_mrndhqhrX5DzGcpaW4Y_-Q3HedYXtjGq5S+wO8nA@mail.gmail.com>
Message-ID: <CA+5PVA7c2_mrndhqhrX5DzGcpaW4Y_-Q3HedYXtjGq5S+wO8nA@mail.gmail.com>
Subject: Re: [PATCH v2] Add support for compressing firmware in copy-firmware.sh
To: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 23, 2021 at 5:26 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> As of kernel 5.3 there's initial support for loading compressed firmware.
> At this stage the only supported compression methis is "xz -C crc32" but
> this option brings significant benefits.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>
> v2: quote filename for xz command

That seems fixed, I ran into another issue.

>  Makefile         |  4 ++++
>  copy-firmware.sh | 47 +++++++++++++++++++++++++++++++----------------
>  2 files changed, 35 insertions(+), 16 deletions(-)
>
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
> index 9b46b63..0dd2e5c 100755
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
> +       xz -C crc32 "$f"
> +    done
> +fi

This compresses the firmware in the local git directory.  If you ever
run this once, it'll never compress any updated files if you run it
again and instead you'll get a bunch of "xz: <file>: File exists"
errors:

https://paste.centos.org/view/75c479da

That seems counter-intuitive and leaves everyone's git tree with a ton
of untracked files.  Options I see:

1) Compress in place and copy, as-is in the patch, but then go back
and remove all the compressed files after the copy
2) Compress to a temp location, move to the destination from there
3) Use xz to directly output to the destination file instead of compress/copy

I kind of like 3.  Thoughts?

josh

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
