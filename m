Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA782C77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  8 May 2023 12:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0DC2C4339E; Mon,  8 May 2023 12:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7F1C4339C
	for <linux-firmware@kernel.org>; Mon,  8 May 2023 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683550138;
	bh=zFCIL81JDmC7aV6PR1V/Ki3SUD5RDI83ylllmotVmN0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XlE/n29k7806VPEoplSsOMyYtksMYpYVHoBBOQzjxNS+JSjwKgh0Ch19pOYyEjbhP
	 9Wa6ebRhgujOVwrDbpHpSxtyNDumlgVYqwlphnamqVtT2shErA9xRdaVlPNxAY4tlN
	 O5oeFIYqELbhcqh3etJtfohqOEJa1q221qw48uXCyNdScBX3BSQAymp6+YlnDe6NGP
	 qRxZjZ2yj+QOs4hxun2Z4BLJpeQi4G5Q/yRDPamWF8zI+7EHBTQKPG1XBtIYxmwrhc
	 JhfHv97v0YmbjIofcA4prFVsM2B5+a7vDbEsqOF1Yk0YOGg70zDDQnulEJDBz7K9uJ
	 lg0IN/7Z7MUHg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-55a64f0053fso66716547b3.3
        for <linux-firmware@kernel.org>; Mon, 08 May 2023 05:48:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDwDpKeIkkbR3nFr+P4VWMvSzgX+S0Xu9agodCanmAvl4jy3Qrb0
	xhj5Hgeq8CP7zrc2deb1Eboz863BnTcR7ZnhkKE=
X-Google-Smtp-Source: ACHHUZ5gVpf+Cmxk/1yLyfHMVeGdDylq8c9B6BtasZsRUe0XCiqyAJXCHOBkN5zpJbUr3II9Xx6jnKR2xniM54NLalM=
X-Received: by 2002:a0d:d705:0:b0:55a:792:8c20 with SMTP id
 z5-20020a0dd705000000b0055a07928c20mr11154827ywd.6.1683550137739; Mon, 08 May
 2023 05:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-13-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-13-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 May 2023 08:48:46 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5WjP4OTm4n99Det1g4TSYTTjMs5365=pL2y8gr5mkxqA@mail.gmail.com>
Message-ID: <CA+5PVA5WjP4OTm4n99Det1g4TSYTTjMs5365=pL2y8gr5mkxqA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 13/16] copy-firmware: tweak sed invocation
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> Add space between the arguments and pattern and combine patterns where
> possible.

Same request here for a separate patch not dependent on the series.

josh

>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  copy-firmware.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index c6a2fe9..722227f 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -25,13 +25,13 @@ while test $# -gt 0; do
>      esac
>  done
>
> -grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
> +grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
>      $verbose "copying file $f"
>      install -d "$destdir"/$(dirname "$f")
>      cp "$f" "$destdir/$f"
>  done
>
> -grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while rea=
d f d; do
> +grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f=
 d; do
>      $verbose "creating link $f -> $d"
>      install -d "$destdir"/$(dirname "$f")
>      ln -s "$d" "$destdir/$f"
>
> --
> 2.39.2
>
