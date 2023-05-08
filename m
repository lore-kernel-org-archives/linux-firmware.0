Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FAAC77B7F
	for <linux-firmware@archiver.kernel.org>; Mon,  8 May 2023 12:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 304F2C4339C; Mon,  8 May 2023 12:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B448C433A0
	for <linux-firmware@kernel.org>; Mon,  8 May 2023 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683549938;
	bh=ueL/2/M45rlu4L6Z1gkRy2ZuBvYZrKyvPCvqmkbMEZs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Hz40+5NwSSS7tAU7OshP+e8KKUQGNDPhlZ755yG4AmbrkLYzKe5Alx1e3+NTzGFzM
	 HV/mAU6D0trjrmmS92ruIEIfMf1UCofLVYR+E+gK6DpT1BCaZss+Y2TLpSZ7PJFW1L
	 veh+Dt9BSSGYmvLx2K0pMfW7LKYrITfo9tupJUMPgZkEL+spUD6VdN6Bv1PWiysen7
	 9bihuedIEx5AU2DUcmMXJOUuID/5tQDQE8WOguixop7gaNGfo7JeEPLGVJ/Jafs57R
	 Kqa51hAMWt02GkGlaBMFHHUbo+q7ntLpajUbkEffwEKgjWvH+P1YwK/pyrAVa/ApUH
	 gqNKGIxQK+htA==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-b9a824c3a95so5900312276.1
        for <linux-firmware@kernel.org>; Mon, 08 May 2023 05:45:38 -0700 (PDT)
X-Gm-Message-State: AC+VfDxfNAtFrTT5HdEBnL188eO6oiO0pNB7sojBZhk8xQRQBPLqHD1h
	/Msi6MQf+1Ase7Y+vPMiW9QbYLGvw2uxJ+ipKR0=
X-Google-Smtp-Source: ACHHUZ74wRB7xE38TPTAPBGt1ubtpWcw2gXS3DK80nJVvQcPyDyTgXFisRa/Lz77ACT3jqO0VYnm+nMawhdxtG3CGk8=
X-Received: by 2002:a25:d616:0:b0:b9e:6537:4f3f with SMTP id
 n22-20020a25d616000000b00b9e65374f3fmr10250325ybg.61.1683549937136; Mon, 08
 May 2023 05:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-10-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-10-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 8 May 2023 08:45:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5+DZatH6xgjQgq4B54k6mTRa0ATvMG=97AkJVCtE-GrQ@mail.gmail.com>
Message-ID: <CA+5PVA5+DZatH6xgjQgq4B54k6mTRa0ATvMG=97AkJVCtE-GrQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/16] check_whence: error if symlinks are in-tree
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
> Currently we have no symlinks in-tree. Add a simple check, ensuring they
> don't get added in the future.
>
> This allows us to remove the clunky symlink checking code in
> copy-firmware.sh

I like the addition to check_whence, but this no longer applies
cleanly and I don't think we should remove checks from
copy-firmware.sh

josh

>
> v2:
>  - tweak helper to produce link and target (based off Adam's patch)
>
> Cc: Adam Sampson <ats@offog.org>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> Adam, you should be able to use this helper with your fixes.
>
> Note that symlinks should not point to another symlink, so you might
> want to tweak your patch to check and error out in such cases.
>
> HTH o/
> ---
>  check_whence.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/check_whence.py b/check_whence.py
> index 92b104e..f94037d 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -32,6 +32,23 @@ def list_whence_files():
>                  yield match.group(1).replace("\ ", " ")
>                  continue
>
> +def list_links_list():
> +    with open('WHENCE', encoding=3D'utf-8') as whence:
> +        for line in whence:
> +            match =3D re.match(r'Link:\s*(.*)', line)
> +            if match:
> +                linkname, target =3D match.group(1).split("->")
> +
> +                linkname =3D linkname.strip().replace("\ ", " ")
> +                target =3D target.strip().replace("\ ", " ")
> +
> +                # Link target is relative to the link
> +                target =3D os.path.join(os.path.dirname(linkname), targe=
t)
> +                target =3D os.path.normpath(target)
> +
> +                yield (linkname, target)
> +                continue
> +
>  def list_git():
>      with os.popen('git ls-files') as git_files:
>          for line in git_files:
> @@ -41,6 +58,7 @@ def main():
>      ret =3D 0
>      whence_list =3D list(list_whence())
>      whence_files =3D list(list_whence_files())
> +    links_list =3D list(list_links_list())
>      known_files =3D set(name for name in whence_list if not name.endswit=
h('/')) | \
>                    set(['check_whence.py', 'configure', 'Makefile',
>                         'README', 'copy-firmware.sh', 'WHENCE'])
> @@ -61,6 +79,10 @@ def main():
>                           name)
>          ret =3D 1
>
> +    for name in set(link[0] for link in links_list if os.path.islink(lin=
k[0])):
> +        sys.stderr.write('E: %s listed in WHENCE as Link, is in tree\n' =
% name)
> +        ret =3D 1
> +
>      for name in sorted(list(known_files - git_files)):
>          sys.stderr.write('E: %s listed in WHENCE does not exist\n' % nam=
e)
>          ret =3D 1
>
> --
> 2.39.2
>
