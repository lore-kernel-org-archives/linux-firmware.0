Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC86C77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  8 May 2023 12:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7862DC4339E; Mon,  8 May 2023 12:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63509C433D2
	for <linux-firmware@kernel.org>; Mon,  8 May 2023 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683550068;
	bh=nB15FX+S0JwSPoKDhKQV9Rh2Ra9RlPeuRvV5feBbRaM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Bea0GXwNhdL6fLfrqnnbleaOIRsL7Rv9jCRc8e7BQc1Z3ggTmW/yZo5gb+VNQlMSA
	 +gBVeSwqVUQR5lHsrjKVv1PJ1Sp/nnF+VjiUGwIg21rvxoBni2dN2gY5vk3ZzUyUZZ
	 UTGBrXVPG+vm+eCRDdYOfJPadErXiKh5i+d17ZfUOkZfg6xR4L5wlTVCnVhK3Cwtup
	 LW6+6cA85RR0e3KjNW86rTV4wR+ajnY2EStAeNaHd81FO8CH3LcfoNVHHKeJ9/dtS+
	 0hrpM6U0zByCgLmROMr4HCdFbspu7W0raV+btKuO+Ucq8rkU9kzjTUTWlLoEC2xOfR
	 MLyDa+tJ6xw2w==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-55a8e9e2c53so41066387b3.1
        for <linux-firmware@kernel.org>; Mon, 08 May 2023 05:47:48 -0700 (PDT)
X-Gm-Message-State: AC+VfDwe5FFcNcw+b0VFJQJSqZ/h0o8mM7ninjrSV5uNZgOHzkaAW/JP
	tSDiO1DgWp4cd9WGHbyMAHjnNrVDxHRCUpE1yno=
X-Google-Smtp-Source: ACHHUZ7RYBxSFnx+emhV41NGZfvx9bS95FVSjaMcbkFWjKkOaWwvj2EEjL0+XDEIUUsGCT4cI6sp4eKum2lcEk/AOkE=
X-Received: by 2002:a0d:f6c6:0:b0:54f:aa40:d9df with SMTP id
 g189-20020a0df6c6000000b0054faa40d9dfmr11067892ywf.21.1683550067433; Mon, 08
 May 2023 05:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-12-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-12-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 May 2023 08:47:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4UuZPmiXG6bo9ZM3APPaPHcO5oYsPNJmoOH158tpVwug@mail.gmail.com>
Message-ID: <CA+5PVA4UuZPmiXG6bo9ZM3APPaPHcO5oYsPNJmoOH158tpVwug@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 12/16] copy-firmware: quote deskdir to prevent
 word splitting
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
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>

Can you send this separately?  It doesn't apply cleanly because of
some of the other changes made in the series.

josh

> ---
>  copy-firmware.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 0132244..c6a2fe9 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -27,13 +27,13 @@ done
>
>  grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
>      $verbose "copying file $f"
> -    install -d $destdir/$(dirname "$f")
> -    cp "$f" $destdir/"$f"
> +    install -d "$destdir"/$(dirname "$f")
> +    cp "$f" "$destdir/$f"
>  done
>
>  grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while rea=
d f d; do
>      $verbose "creating link $f -> $d"
> -    install -d $destdir/$(dirname "$f")
> +    install -d "$destdir"/$(dirname "$f")
>      ln -s "$d" "$destdir/$f"
>  done
>
>
> --
> 2.39.2
>
