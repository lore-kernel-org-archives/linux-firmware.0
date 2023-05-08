Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A1FC77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  8 May 2023 12:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 028ACC433A0; Mon,  8 May 2023 12:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6B5C433EF
	for <linux-firmware@kernel.org>; Mon,  8 May 2023 12:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683549608;
	bh=Qd6+ABJ9gtM3GaFonDLEt9mJAE7JaxjxUgDHQpq8uOk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ChQHMNHpXnp4AJuAeeLa6qMkvETtsp7tv7rd8IBwDn2wE6WNa+h1QVdR66EXES9fP
	 3AvdmC0MGpP4uk8kTG5j6thkRhA4hllkPoARyfsjYv/J+GgtQeJ9p0/S8PxjWVu5TA
	 GeKhVdGSREQrfcJy+IpAUeQF8wQMdNW2pZIeoZOwUwGyxLpoBpeoykNM1ZXxky0C4t
	 3Vo5Y2SSE7Tm4a/kkTOslJoyyH1zq0wd3C6YQej8x4bFp3mClhKa9hHVeg2F05fMAv
	 bb0G15hD0mEykv7GICL9w3ywt+F1AH+Xnx+NyYam7RqdqFwgSpYKuSMfX7rCHZeREc
	 s/Ytw5WtjbtLQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a8019379fso39780907b3.0
        for <linux-firmware@kernel.org>; Mon, 08 May 2023 05:40:08 -0700 (PDT)
X-Gm-Message-State: AC+VfDx8LUsXA5Ib26hOcLxCOle2H6cTx6WGsdun/XYShDTBHTMKs7cp
	2gevvBs7iJb8GQFmTUapV973DZcVynuiZQ85T4s=
X-Google-Smtp-Source: ACHHUZ5CqZKPIRDmn1kzF6AU9b7IbAVnX5VaScR78btHE2WbOR2XpIXT7qlQYdKR9q/cLya8t4x0aVsfoGzKvpvDB9s=
X-Received: by 2002:a25:c549:0:b0:b97:4b7b:945c with SMTP id
 v70-20020a25c549000000b00b974b7b945cmr11590164ybe.57.1683549607870; Mon, 08
 May 2023 05:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-8-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-8-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 May 2023 08:39:56 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4qWPM6xO2NF=RE3-vsWwHU3aLX0tXecV0z2pwCOZutzA@mail.gmail.com>
Message-ID: <CA+5PVA4qWPM6xO2NF=RE3-vsWwHU3aLX0tXecV0z2pwCOZutzA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 08/16] copy-firmware: remove non-applicable file
 presence test
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
> The check_whence.py script already ensures that the files listed in
> WHENCE are present on-disk. Thus the extra check isn't needed.

check_whence.py isn't run during installation though.  It's really
only there as a repo validation script.  There's no harm in keeping
this test.

josh

> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  copy-firmware.sh | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 6bceef3..656b0ec 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -32,7 +32,6 @@ while test $# -gt 0; do
>  done
>
>  grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
> -    test -f "$f" || continue
>      $verbose "copying file $f"
>      install -d $destdir/$(dirname "$f")
>      cp -d "$f" $destdir/"$f"
>
> --
> 2.39.2
>
