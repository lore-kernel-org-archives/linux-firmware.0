Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3199BC4332F
	for <linux-firmware@archiver.kernel.org>; Tue, 31 May 2022 17:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED70AC341CA; Tue, 31 May 2022 17:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E85C36AE3
	for <linux-firmware@kernel.org>; Tue, 31 May 2022 17:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654016530;
	bh=HE3a6dkv7iQufqls/Hkm1B1bdjW+NVvhphTJaVAobto=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FckNjD5vhS0tf0HiMKIDz4e6iVhnqROgcgs0DDg9aFoKH74pZZxbxVaqQMgSToXB5
	 yoT8jqF2G6Ka4b0uSFEljtxdEj5zfOEAX9Og41bnxBzKxFUMSqJoS/q873NGd+t6Jc
	 EQC7ynE1gOfbP2EycpxIZq63xPenzWnAhnqG0C5FPfdEdCobK+yRQKmo/lTa+JMlD8
	 DP5QfODn6TWjlBsvuf3cTLqUHerPQcpjglP3WuCsVk1dkerR7fdb+4a7HjxkkQjf86
	 lntomsKqvwjzVFy1TrtvBqEFDYhM9pg8MtBTH20fHl7m9rlVXO7ZHBD7y9lBy96GIL
	 B/k8jmrZ2PnBg==
Received: by mail-io1-f46.google.com with SMTP id i9so1354131ioa.6
        for <linux-firmware@kernel.org>; Tue, 31 May 2022 10:02:10 -0700 (PDT)
X-Gm-Message-State: AOAM53088TITuGX67bmtLnLXK76mcQlJ4azjlhvC/fzPgSUkyH6+koCI
	bLZSkTsLVxNA+XROv+EE63t5GleIGgPN1mZHQcA=
X-Google-Smtp-Source: ABdhPJwWzQlH2ntG0AbHzCxf4vxGQnKfQy62dvnInW700nn6LivVFR9M0xIDEhN2PnVTcPgQ+V050mliJaHGI13f2Sc=
X-Received: by 2002:a05:6638:1605:b0:32e:d891:5d63 with SMTP id
 x5-20020a056638160500b0032ed8915d63mr20931875jas.144.1654016530009; Tue, 31
 May 2022 10:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <PR2PR09MB310088EA719E6D7CA5C268F1A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
In-Reply-To: <PR2PR09MB310088EA719E6D7CA5C268F1A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 31 May 2022 13:01:59 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7=T5TmkubRtFhmAVPzTHdWFnNeU3B-VH-HZJNMhLBtLg@mail.gmail.com>
Message-ID: <CA+5PVA7=T5TmkubRtFhmAVPzTHdWFnNeU3B-VH-HZJNMhLBtLg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: replace mkdir by install
To: Konrad Weihmann <kweihmann@outlook.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 6:25 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> mkdir -p creates paths that are bound to user's settings and therefore
> can lead to different file mode bits of the base paths accross different
> machines.
> Use install instead, as this tool is not prone to such behavior.
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>

Applied and pushed out.

josh

> ---
>  Makefile                      | 2 +-
>  carl9170fw/toolchain/Makefile | 4 ++--
>  copy-firmware.sh              | 6 +++---
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e1c362f..83a0ec6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -9,5 +9,5 @@ check:
>         @./check_whence.py
>
>  install:
> -       mkdir -p $(DESTDIR)$(FIRMWAREDIR)
> +       install -d $(DESTDIR)$(FIRMWAREDIR)
>         ./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
> diff --git a/carl9170fw/toolchain/Makefile b/carl9170fw/toolchain/Makefile
> index 2b25ffe..aaea8e8 100644
> --- a/carl9170fw/toolchain/Makefile
> +++ b/carl9170fw/toolchain/Makefile
> @@ -46,14 +46,14 @@ src/gcc-$(GCC_VER): src/$(GCC_TAR) src/newlib-$(NEWLIB_VER)
>         ln -s $(BASEDIR)/src/newlib-$(NEWLIB_VER)/libgloss $@
>
>  binutils: src/binutils-$(BINUTILS_VER)
> -       mkdir -p build/binutils
> +       install -d build/binutils
>         cd build/binutils; \
>         $(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst; \
>         $(MAKE) -j3; \
>         $(MAKE) install
>
>  gcc: src/gcc-$(GCC_VER) binutils
> -       mkdir -p build/gcc
> +       install -d build/gcc
>         cd build/gcc; \
>         $(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst -enable-languages=c --without-pkgversion --with-newlib; \
>         $(MAKE) -j3; \
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 9b46b63..bbacb92 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -34,7 +34,7 @@ done
>  grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
>      test -f "$f" || continue
>      $verbose "copying file $f"
> -    mkdir -p $destdir/$(dirname "$f")
> +    install -d $destdir/$(dirname "$f")
>      cp -d "$f" $destdir/"$f"
>  done
>
> @@ -42,7 +42,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
>      if test -L "$f"; then
>          test -f "$destdir/$f" && continue
>          $verbose "copying link $f"
> -        mkdir -p $destdir/$(dirname "$f")
> +        install -d $destdir/$(dirname "$f")
>          cp -d "$f" $destdir/"$f"
>
>          if test "x$d" != "x"; then
> @@ -63,7 +63,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
>          fi
>      else
>          $verbose "creating link $f -> $d"
> -        mkdir -p $destdir/$(dirname "$f")
> +        install -d $destdir/$(dirname "$f")
>          ln -sf "$d" "$destdir/$f"
>      fi
>  done
> --
> 2.25.1
>
