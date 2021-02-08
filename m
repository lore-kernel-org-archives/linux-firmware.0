Return-Path: <SRS0=744r=HK=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D36C433E6
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Feb 2021 13:51:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A25264E60; Mon,  8 Feb 2021 13:51:11 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C2A64E54;
	Mon,  8 Feb 2021 13:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C2A64E54
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-ej1-f45.google.com with SMTP id jj19so24788534ejc.4;
        Mon, 08 Feb 2021 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GM/mfIdEK1+wifNiHIHAJFX/A2IPfG5SYlu7WdJwWsw=;
        b=H5ZY+NxM24MufALNgenwSvIZHrcGT0nyN8ulx6KtQ9aDLTGYs0FeywiTHHhJeNB5zi
         C6ceML2/N5NpL/eZGfgOf6oUVLW08qasLEuo5oCCKUoKuqD6Hs5MrtJ4yT3qy2Ss9Uyn
         1qSg0F/PHfauOfW2FUTnBCpb6bLELWyCxcCSpibjQy5rqXu3S0h0Ug6C00Ox+AmttDNm
         274+9ITlpR4iG1eD2qjIrlwc0uO63eoStsxCdwnuyAxJbFhTfyO/QcyLglI5SEqOz7EP
         7uisifvjRNCgY9b6+6IZRHpxMVphaXxEo4yE4X5SfA4w5U36Z1+dOYbKf9sus0iqsnKB
         HG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GM/mfIdEK1+wifNiHIHAJFX/A2IPfG5SYlu7WdJwWsw=;
        b=Qwnl3eP57AN1rjLBd652R7NKwm+b0GnWWnqe2ldAv0Ob3RGXX5JAlEQDZYYmLWkiQ9
         7usByRjot3BG6v2pFWUA/yt9qR7/gIkRRXhM2dceM+KtcKWPndW+8ymVWyRCakCVm+bC
         74Dc2qsBbZEzxqhJsidgZ/RmfDYFBIsaoshNgkjNzmig8OwSARR1GyLlFVMk6V86daq9
         BdJKmhTz4rWT7Kz89H4Ks4IhTS+NieBOVf8AG/HekuOX5duGCyrtyNElNJmgqg8hk0uT
         4IBVWjxUxMoYKH4TcCtAjpt9pVYDBarTHRZWPuGno0/lUf0rIdEH8zNosVKvs1WO30Aa
         qF8A==
X-Gm-Message-State: AOAM532wz+pHmvfU+DPQXvfDp1Pn1X7b1wwtVQLRQ0sF9iGABh/qeB4Z
	HdQJu6g46nOJXMydRhBjoJwqlMy1j8gJYF0Ds8vIZi7f
X-Google-Smtp-Source: ABdhPJwxklGHcU3tufufy+yi4RWOXugOCK+OB1ojuKjhyFBax4PK7V85vjAMW97C6WGL9mY85KTzr277jAy9oCOvKrk=
X-Received: by 2002:a17:906:6b1b:: with SMTP id q27mr2182283ejr.508.1612792269066;
 Mon, 08 Feb 2021 05:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20210123102625.589472-1-pbrobinson@gmail.com> <CA+5PVA7c2_mrndhqhrX5DzGcpaW4Y_-Q3HedYXtjGq5S+wO8nA@mail.gmail.com>
In-Reply-To: <CA+5PVA7c2_mrndhqhrX5DzGcpaW4Y_-Q3HedYXtjGq5S+wO8nA@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Mon, 8 Feb 2021 13:50:57 +0000
Message-ID: <CALeDE9O+uDmJVGvRLXc4sE00X-8TGkDE-8Hcxs_wDfjo7vgMuQ@mail.gmail.com>
Subject: Re: [PATCH v2] Add support for compressing firmware in copy-firmware.sh
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 8, 2021 at 1:47 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Sat, Jan 23, 2021 at 5:26 AM Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > As of kernel 5.3 there's initial support for loading compressed firmware.
> > At this stage the only supported compression methis is "xz -C crc32" but
> > this option brings significant benefits.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >
> > v2: quote filename for xz command
>
> That seems fixed, I ran into another issue.
>
> >  Makefile         |  4 ++++
> >  copy-firmware.sh | 47 +++++++++++++++++++++++++++++++----------------
> >  2 files changed, 35 insertions(+), 16 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index e1c362f..9a48471 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -11,3 +11,7 @@ check:
> >  install:
> >         mkdir -p $(DESTDIR)$(FIRMWAREDIR)
> >         ./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
> > +
> > +installcompress:
> > +       mkdir -p $(DESTDIR)$(FIRMWAREDIR)
> > +       ./copy-firmware.sh -C $(DESTDIR)$(FIRMWAREDIR)
> > diff --git a/copy-firmware.sh b/copy-firmware.sh
> > index 9b46b63..0dd2e5c 100755
> > --- a/copy-firmware.sh
> > +++ b/copy-firmware.sh
> > @@ -6,6 +6,7 @@
> >
> >  verbose=:
> >  prune=no
> > +compress=no
> >
> >  while test $# -gt 0; do
> >      case $1 in
> > @@ -19,6 +20,11 @@ while test $# -gt 0; do
> >              shift
> >              ;;
> >
> > +        -C | --compress)
> > +            compress=yes
> > +            shift
> > +            ;;
> > +
> >          *)
> >              if test "x$destdir" != "x"; then
> >                  echo "ERROR: unknown command-line options: $@"
> > @@ -31,40 +37,49 @@ while test $# -gt 0; do
> >      esac
> >  done
> >
> > +if test "x$compress" = "xyes"; then
> > +    cmpxtn=.xz
> > +    grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
> > +       test -f "$f" || continue
> > +       $verbose "compressing $f"
> > +       xz -C crc32 "$f"
> > +    done
> > +fi
>
> This compresses the firmware in the local git directory.  If you ever
> run this once, it'll never compress any updated files if you run it
> again and instead you'll get a bunch of "xz: <file>: File exists"
> errors:
>
> https://paste.centos.org/view/75c479da
>
> That seems counter-intuitive and leaves everyone's git tree with a ton
> of untracked files.  Options I see:
>
> 1) Compress in place and copy, as-is in the patch, but then go back
> and remove all the compressed files after the copy
> 2) Compress to a temp location, move to the destination from there
> 3) Use xz to directly output to the destination file instead of compress/copy
>
> I kind of like 3.  Thoughts?

Yes, I think that makes sense, I'd been looking at this from a distro
packaging perspective where it's generally run from the tarfile output
and then that is disgarded so less of an issue. Will take another pass
at it.

> josh
>
> > +
> >  grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
> > -    test -f "$f" || continue
> > -    $verbose "copying file $f"
> > -    mkdir -p $destdir/$(dirname "$f")
> > -    cp -d "$f" $destdir/"$f"
> > +    test -f "$f$cmpxtn" || continue
> > +    $verbose "copying file $f$cmpxtn"
> > +    mkdir -p $destdir/$(dirname "$f$cmpxtn")
> > +    cp -d "$f$cmpxtn" $destdir/"$f$cmpxtn"
> >  done
> >
> >  grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
> > -    if test -L "$f"; then
> > -        test -f "$destdir/$f" && continue
> > -        $verbose "copying link $f"
> > -        mkdir -p $destdir/$(dirname "$f")
> > +    if test -L "$f$cmpxtn"; then
> > +        test -f "$destdir/$f$cmpxtn" && continue
> > +        $verbose "copying link $f$cmpxtn"
> > +        mkdir -p $destdir/$(dirname "$f$cmpxtn")
> >          cp -d "$f" $destdir/"$f"
> >
> >          if test "x$d" != "x"; then
> > -            target=`readlink "$f"`
> > +            target=`readlink "$f$cmpxtn"`
> >
> >              if test "x$target" != "x$d"; then
> >                  $verbose "WARNING: inconsistent symlink target: $target != $d"
> >              else
> >                  if test "x$prune" != "xyes"; then
> > -                    $verbose "WARNING: unneeded symlink detected: $f"
> > +                    $verbose "WARNING: unneeded symlink detected: $f$cmpxtn"
> >                  else
> > -                    $verbose "WARNING: pruning unneeded symlink $f"
> > -                    rm -f "$f"
> > +                    $verbose "WARNING: pruning unneeded symlink $f$cmpxtn"
> > +                    rm -f "$f$cmpxtn"
> >                  fi
> >              fi
> >          else
> > -            $verbose "WARNING: missing target for symlink $f"
> > +            $verbose "WARNING: missing target for symlink $f$cmpxtn"
> >          fi
> >      else
> > -        $verbose "creating link $f -> $d"
> > -        mkdir -p $destdir/$(dirname "$f")
> > -        ln -sf "$d" "$destdir/$f"
> > +        $verbose "creating link $f$cmpxtn -> $d$cmpxtn"
> > +        mkdir -p $destdir/$(dirname "$f$cmpxtn")
> > +        ln -sf "$d$cmpxtn" "$destdir/$f$cmpxtn"
> >      fi
> >  done
> >
> > --
> > 2.29.2
> >
