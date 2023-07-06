Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D32EB64D9
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Jul 2023 19:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4384C433C9; Thu,  6 Jul 2023 19:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75B6C433CA
	for <linux-firmware@kernel.org>; Thu,  6 Jul 2023 19:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688672179;
	bh=DCr29ncmtjEyknt5VMcGX8hArp0nJat4p6ITXSYysa0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ke8YPNdsce+wacXKMwb1EVgLM9bnU5duGopcZFEJIIA3ARjVG2kn9riZoNgBbVjYZ
	 DrnDR9x/MxDECkB8y/jLD7JrdOlkVi3intfjm/GHYUsway/ptXzcBaxE+FG46Xy0WX
	 ejNS7cByT1q0bFUPbKUYtEe8s5QiohjDyU8L1pyTrabJ3Y4satB9vQ8yC75dyvpTy5
	 G0GxCu377xnKMCxVqcbXVLFO9SdxkfgnttTMFaH9iBw5oLH9/e0BAcTSk3SUDTQsQx
	 fbhwCfxRNrYmrABP673fGH5SsJvAjmwt+PEwu4jQ+21C02PWuPvp4s4c9ZCbVXZBkT
	 demIblPffRKtw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-57023c9be80so13947067b3.3
        for <linux-firmware@kernel.org>; Thu, 06 Jul 2023 12:36:19 -0700 (PDT)
X-Gm-Message-State: ABy/qLYFE0JHMDVtNPe4vSO9BcRxYdYEbIlFToGe6pv+fp3jUxx0XFIS
	HBRTn/WIsKzQjcHgU9UKFbguEerIeDWR+ckxWFI=
X-Google-Smtp-Source: APBJJlFXNhCio0huyHNYScRfwlJKmYfeALrGK9SRXL6BaqgJ1kGsTKH1ElarGpEpMye/rsO3U0h8CvmfWHLRHJinnsQ=
X-Received: by 2002:a0d:de82:0:b0:57a:504a:e019 with SMTP id
 h124-20020a0dde82000000b0057a504ae019mr2077865ywe.20.1688672178589; Thu, 06
 Jul 2023 12:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230626150833.27414-1-ats@offog.org>
In-Reply-To: <20230626150833.27414-1-ats@offog.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 6 Jul 2023 15:36:07 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5C-Y7xqhh-c3S0dp650+e_vDmajdRYZO0_c9wtdJ4Xkw@mail.gmail.com>
Message-ID: <CA+5PVA5C-Y7xqhh-c3S0dp650+e_vDmajdRYZO0_c9wtdJ4Xkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] check_whence: Check link targets are valid
To: Adam Sampson <ats@offog.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Mon, Jun 26, 2023 at 11:08=E2=80=AFAM Adam Sampson <ats@offog.org> wrote=
:
>
> This should catch a couple of common errors: reversing the two arguments
> to Link, and not making the second argument relative to the first.
>
> Signed-off-by: Adam Sampson <ats@offog.org>
> ---
> v2: rebase, as Emil's recent patches merged part of v1 anyway
>
>  check_whence.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/check_whence.py b/check_whence.py
> index 2e6950a8..d45d90f8 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -91,6 +91,24 @@ def main():
>          sys.stderr.write('E: %s listed in WHENCE does not exist\n' % nam=
e)
>          ret =3D 1
>
> +    # A link can point to another link, or to a file...
> +    valid_targets =3D set(link[0] for link in links_list) | git_files
> +
> +    # ... or to a directory
> +    for target in set(valid_targets):
> +        dirname =3D target
> +        while True:
> +            dirname =3D os.path.dirname(dirname)
> +            if dirname =3D=3D '':
> +                break
> +            valid_targets.add(dirname)
> +
> +    for name, target in sorted(links_list):
> +        if target not in valid_targets:
> +            sys.stderr.write('E: target %s of link %s in WHENCE'
> +                             ' does not exist\n' % (target, name))
> +            ret =3D 1
> +
>      for name in sorted(list(git_files - known_files)):
>          # Ignore subdirectory changelogs and GPG detached signatures
>          if (name.endswith('/ChangeLog') or
> --
> 2.41.0
>
