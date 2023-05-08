Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB4EC77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  8 May 2023 12:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24205C4339C; Mon,  8 May 2023 12:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10847C433D2
	for <linux-firmware@kernel.org>; Mon,  8 May 2023 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683549722;
	bh=uKG2b7oVbfddRD+Ijh/29KVr2LqO7ne7EQtKZMj+N7w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=vAyA0jodyXtBTh7r6fj8EfuxRTnMuvQNCPUQg+STsLnW9HwKNBy+YCxErGISCc9x8
	 bOxXGnR1V+BUwZuEQp1dIbRellfYZgHRliz2k64gduZek7JNC4kS98CJ3UfEFo6m6c
	 LRWXEmeLKzQ+7mnN43jN6kbNFEDO3kCNB2u9Mo/VfHGFkdPh6K4V8XWiSXDcopGyq1
	 yO1vIpUbC+nWfqEemdy/6DDfCAlQSVekIc50qvhn5JJ//lYYG/Nt5BWUpLHCGtW5DP
	 m17fLtYahNzcgwz4WbdwQBcmUTosFQWcvXjPKeLZosH6i6hB2RoCKsHS+OxvaR5lAX
	 RMwlWgV58tjZw==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so24734602276.0
        for <linux-firmware@kernel.org>; Mon, 08 May 2023 05:42:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDwbhFsM3B/nIyh7b2XNnp6LyLAn56T727VyBMarjFgh4bu09VVf
	XBR2iQBEU0m3J2yCelZNSxY9QcFqMrSUzSyhM7E=
X-Google-Smtp-Source: ACHHUZ5DWYRAI6ZZFG2qn6feLaE2J1UDOnXY0M+a4tWYti2PhcDAfUoUF0TIrTesHweRFB43DJvxDElR/546fgAhRC8=
X-Received: by 2002:a25:4884:0:b0:b9d:88a7:dbf with SMTP id
 v126-20020a254884000000b00b9d88a70dbfmr12399579yba.4.1683549721078; Mon, 08
 May 2023 05:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-9-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-9-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 May 2023 08:41:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7yO90sE+NbwbTWiQSDg=cPMHv-W41=ehp20nGM7oRagQ@mail.gmail.com>
Message-ID: <CA+5PVA7yO90sE+NbwbTWiQSDg=cPMHv-W41=ehp20nGM7oRagQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 09/16] check_whence: error if File: is actually
 a link
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
> This allows us to remove the -d aka --no-dereference --preserve=3Dlinks
> from the copy command.

This again relies on check_whence.py doing something that the
installation script then assumes is done but there's nothing to
enforce that.  I'm inclined to be safe rather than assumptive.

josh

>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  check_whence.py  | 5 +++++
>  copy-firmware.sh | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/check_whence.py b/check_whence.py
> index 130966e..92b104e 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -56,6 +56,11 @@ def main():
>          sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
>          ret =3D 1
>
> +    for name in set(link for link in whence_files if os.path.islink(link=
)):
> +        sys.stderr.write('E: %s listed in WHENCE as File, but is a symli=
nk\n' %
> +                         name)
> +        ret =3D 1
> +
>      for name in sorted(list(known_files - git_files)):
>          sys.stderr.write('E: %s listed in WHENCE does not exist\n' % nam=
e)
>          ret =3D 1
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index 656b0ec..e3f3176 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -34,7 +34,7 @@ done
>  grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
>      $verbose "copying file $f"
>      install -d $destdir/$(dirname "$f")
> -    cp -d "$f" $destdir/"$f"
> +    cp "$f" $destdir/"$f"
>  done
>
>  grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while rea=
d f d; do
>
> --
> 2.39.2
>
