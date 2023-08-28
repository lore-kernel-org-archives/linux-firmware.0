Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C7CC83F12
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Aug 2023 11:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFC15C433C8; Mon, 28 Aug 2023 11:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76A6C433C9
	for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693221469;
	bh=ADYVdqMhXVW0KNyT9n7rE3FytkooXrEoTUoUoNC9Rwc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=p7JLSjqBqKMZJiAo0XEZJx6oEwebxYgI6xWW7mvkXMMdRwiPAHcfG8oz8ouK5jGDQ
	 iqKCt2pEBqCsUzp0JSD1SeQ9N6GaiB2il5jcLdQXRBU3bO+yU2Ziuhm2wwkjSWp+oJ
	 fD+bERSvt541snZR4FSoibYOq9V4dh4xUffFqDU9FQQBOF9ejZwTUsR4sBt6x2j5N0
	 AfMzy9lY2X5A0qFXBKKkRyzwwdktxRZ6oj98OaHIydWjd6BfW+4J13U1RMt6QmNDPP
	 327LUgAjBmgFR283yeNDBeTp7yDFJdMmwCKnWjCYu8ydfAFEWrerDDFKTQgmB0Nmdb
	 TF6Gmu20MuYUw==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d748d8cf074so5575104276.0
        for <linux-firmware@kernel.org>; Mon, 28 Aug 2023 04:17:49 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy2nbFk5N7BvytIuBaM7x+YDUXcA8rPETc7MkbBKde9OWub+K22
	ur/pLbb63albgHt2gsnlmQSN9jPo2Y2ZEjlrI5I=
X-Google-Smtp-Source: AGHT+IHKCUL4B5wp+8HaETpTKXFMdcc9qOPnec35MCISdX8ca1/kWGlOm4/krFTqcSX935JWKvaYLAMRaa/YzG5iumo=
X-Received: by 2002:a25:1005:0:b0:d7a:fb36:be68 with SMTP id
 5-20020a251005000000b00d7afb36be68mr2404164ybq.10.1693221468715; Mon, 28 Aug
 2023 04:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230809092358.575787-1-juerg.haefliger@canonical.com>
In-Reply-To: <20230809092358.575787-1-juerg.haefliger@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 28 Aug 2023 07:17:38 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6-+J4wpez79tuTsU3AteT4Ks+Ac1m3fhYQucFBYOVO6g@mail.gmail.com>
Message-ID: <CA+5PVA6-+J4wpez79tuTsU3AteT4Ks+Ac1m3fhYQucFBYOVO6g@mail.gmail.com>
Subject: Re: [PATCH] copy-firmware: Support additional compressor options
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 5:24=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> Any options following the compressor option --zstd or --xz are passed on
> to the compressor as additional options so that - for example - the
> compression level can be specified:
>
>   $ ./copy-firmware.sh --zst -19 <destdir>
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Applied and pushed out.

josh

> ---
>  copy-firmware.sh | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 148f0f199e5f..20746a47420b 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -44,6 +44,14 @@ while test $# -gt 0; do
>              shift
>              ;;
>
> +        -*)
> +            if test "$compress" =3D "cat"; then
> +                echo "ERROR: unknown command-line option: $1"
> +                exit 1
> +            fi
> +            compress=3D"$compress $1"
> +            shift
> +            ;;
>          *)
>              if test "x$destdir" !=3D "x"; then
>                  echo "ERROR: unknown command-line options: $*"
> --
> 2.39.2
>
