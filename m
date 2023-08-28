Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AC5C83F11
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 11:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E3E8C433C7; Mon, 28 Aug 2023 11:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BB4C433C9
	for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693221545;
	bh=+mgF2yn94MEk5yly+62CQ7mQANTfkpa055E68oWX6RI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=R2JlWEiTTtVsQPY3T2tpZxLS86XW6bhMZelDlfRQ0B6WU9mZW70UbCN6J/rxy1eap
	 tAjcBneFRF+D/Ffo2UpG44nSM+yWgkZS8SG9fadXjsOvNfB8T5ETBwwczIfRxG3Btk
	 ApfhZAgreVVM4LCNQAjhC9DF091B2z87JizeMDB16sLYll90ZcDUUsKnxVy3AlpW9g
	 7JtLfaF+eBAEDQPeilIdYnWdFxMXvpp80Sgbsm/UYPkfeJH2xnwgjpAsz2AcDUdoXc
	 o90kyR2ffcn0B4r29zLbpNrYPpnmTevJSPoRCcXAcOQ8uFOEg9AHwp/hubhiSWy4hd
	 /lEH0kEvE8WzA==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5920efd91c7so35308347b3.2
        for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 04:19:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxn6Dv1O5ILAbZJHcGO/FTADKCziV9q3ppUIaaOMx/tRfipxqLZ
	xVdd+QdAOvQ8+KLqqxn0GmnIwf0arf8n/wbTSqM=
X-Google-Smtp-Source: AGHT+IGDXp5lSzGL25dJgiyyX4xzyjAp7ZIyFKIu7SePXrJ5cm4nOpLDf9DQLCGS7IEOQU9zZIH6XYbEEALZ7MQyxRc=
X-Received: by 2002:a25:ae01:0:b0:d63:1d3b:9416 with SMTP id
 a1-20020a25ae01000000b00d631d3b9416mr26124370ybj.2.1693221544128; Mon, 28 Aug
 2023 04:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230809094059.595680-1-juerg.haefliger@canonical.com> <20230809094059.595680-2-juerg.haefliger@canonical.com>
In-Reply-To: <20230809094059.595680-2-juerg.haefliger@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Aug 2023 07:18:53 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5BiBTHFKL8O=Z3Mi0w6e==9rs22tBG9DAfYcWb1AOWqw@mail.gmail.com>
Message-ID: <CA+5PVA5BiBTHFKL8O=Z3Mi0w6e==9rs22tBG9DAfYcWb1AOWqw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] copy-firmware: Introduce 'RawFile' keyword
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 5:41=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> Currently, 'Raw: <filename>' needs to be added to WHENCE for files that
> must not be compressed. This means that such files need to be listed
> twice ('File: <filename>' and 'Raw: <filename>') which is not pretty and
> error prone. Also, the current implementation is broken for filenames
> that contain quotes (") and it also requires grep'ing of WHENCE for every
> processed line which slows things down.
>
> Fix all of the above by introducing a new keyword 'RawFile' so that such
> files are listed only once, quotes are handled correctly and grep is no
> longer needed.
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Applied and pushed out.

josh

> ---
>  copy-firmware.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 20746a47420b..1ae1e37c37e5 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -65,11 +65,11 @@ while test $# -gt 0; do
>  done
>
>  # shellcheck disable=3DSC2162 # file/folder name can include escaped sym=
bols
> -grep '^File:' WHENCE | sed -e 's/^File: *//g;s/"//g' | while read f; do
> +grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /=
;s/"//g' | while read k f; do
>      test -f "$f" || continue
>      install -d "$destdir/$(dirname "$f")"
>      $verbose "copying/compressing file $f$compext"
> -    if test "$compress" !=3D "cat" && grep -q "^Raw: $f\$" WHENCE; then
> +    if test "$compress" !=3D "cat" && test "$k" =3D "RawFile"; then
>          $verbose "compression will be skipped for file $f"
>          cat "$f" > "$destdir/$f"
>      else
> --
> 2.39.2
>
