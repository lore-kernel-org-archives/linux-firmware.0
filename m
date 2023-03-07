Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52348C678D4
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 18:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33D7DC433AA; Tue,  7 Mar 2023 18:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF11C4339E
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 18:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678212752;
	bh=UkaYQTO2Od4JgNmWSyUZQH6M93JJPpF68KxuT2OhrNc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=XcmtQuefQUoXSpA7uai1rUQxK1qwevpvXOGSefsGOBbgbz3X7ruu1hfpSI33ajDim
	 2Cyk8a13o7cUjPZo9hxKJQIu7tlmRBnPNd9DPQQ2wquhXJGXq5ABTFqZHxBJsbMaJ0
	 0OBHzseLYwBKf/7hnP5+4QZktUFQ3Qdd6Ec1v9EzkaKHEwnCKlKmlhhrFPrhlQZw0B
	 4L2B2hkg9zOXZvoY+K91222Bufo4r6AWGcenrpnDILEsp10Y53ebrqor9rw7VffVeY
	 xB2GgN4Hj2SutNYgDv20KHrlFgjts7WTrpxD27ivaZUPkHiodJ82eKpxfhgkvFI/hZ
	 8UB7w/qOeSlsg==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536bbe5f888so259580597b3.8
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 10:12:32 -0800 (PST)
X-Gm-Message-State: AO0yUKUIib5zF+cFSBrS5ZZlKh90d38hJ306SjbOYTvY51UN8K9H75Si
	LAzajnAbqa5SCaFBWZoNGFFCaUeiYaT2Q7K9sw0=
X-Google-Smtp-Source: AK7set+1wfvsJ4kSgacu6o1IeMPdxNeBQkWOOVzc3M/2RMd121NAV5pRqEvCBHiQApk0lPsMwvdLGK2zL690pb/0hbw=
X-Received: by 2002:a81:ae10:0:b0:535:18be:4126 with SMTP id
 m16-20020a81ae10000000b0053518be4126mr9769688ywh.6.1678212751154; Tue, 07 Mar
 2023 10:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-6-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-6-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 13:12:20 -0500
X-Gmail-Original-Message-ID: <CA+5PVA45_jQYsjGPQ_HkGOd1dYYQ1aCKu_-nfyz38NRq-PF4gQ@mail.gmail.com>
Message-ID: <CA+5PVA45_jQYsjGPQ_HkGOd1dYYQ1aCKu_-nfyz38NRq-PF4gQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 06/16] check_whence: error on duplicate file entries
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
> There's little point in copying (or compressing with later patches) the
> same files multiple times. So let's error out when duplicate entries are
> present.

I like this idea, but see my reply to patch 5.  There are cases where
the same firmware file *should* be duplicated because the driver using
it is different.  That would imply this would need to build out a
dictionary that can map files to drivers.  That seems over-complicated
for the fundamental goal of this check.

> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  check_whence.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/check_whence.py b/check_whence.py
> index f347f0e..7ff21f6 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -24,6 +24,14 @@ def list_whence():
>                          yield match.group(2)
>                          continue
>
> +def list_whence_files():
> +    with open('WHENCE', encoding=3D'utf-8') as whence:
> +        for line in whence:
> +            match =3D re.match(r'File:\s*(.*)', line)
> +            if match:
> +                yield match.group(1).replace("\ ", " ")
> +                continue
> +
>  def list_git():
>      with os.popen('git ls-files') as git_files:
>          for line in git_files:
> @@ -32,12 +40,17 @@ def list_git():
>  def main():
>      ret =3D 0
>      whence_list =3D list(list_whence())
> +    whence_files =3D list(list_whence_files())
>      known_files =3D set(name for name in whence_list if not name.endswit=
h('/')) | \
>                    set(['check_whence.py', 'configure', 'Makefile',
>                         'README', 'copy-firmware.sh', 'WHENCE'])
>      known_prefixes =3D set(name for name in whence_list if name.endswith=
('/'))
>      git_files =3D set(list_git())
>
> +    for name in set(fw for fw in whence_files if whence_files.count(fw) =
> 1):
> +        sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
> +        ret =3D 1
> +

Perhaps we can add this check via a cmdline option that is run
occasionally to look for duplicates?  Then you could still keep
simpler code for anything that's operating on the files themselves.

josh

>      for name in sorted(list(known_files - git_files)):
>          sys.stderr.write('E: %s listed in WHENCE does not exist\n' % nam=
e)
>          ret =3D 1
>
> --
> 2.39.2
>
