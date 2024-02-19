Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F41C48BC3
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 12:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D837C433F1; Mon, 19 Feb 2024 12:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5755CC43390;
	Mon, 19 Feb 2024 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347072;
	bh=+Ht3sH9T/1/41W0JOIQDVtzr2WXmCKlwt+b6CnqwX1U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=NME3yU0Apze+yFdb4+lIDyZXoN/XkcTS7Txo+E3lpJvPZ87x8tG4T/3GQ7yKq5ZXJ
	 xVzbo4i57j3VkW/1RmNUWr8y3x+05wMcYcPMA1uTjg7o7qCwpM0pQDKgMKnaJ36KUv
	 cTacgxDLPPt9jurzodzQuw3v8KYwSdLghhqYwfUg12bhCLoxsJkmGz0XkfddXx5v6C
	 8PeuVL4lgl/fgnawArsG3vt5StXfSz2ADA2FYgMKIW1Up5hWfrCLgp0gPSHBiv6BuF
	 3TBK4AC4ELT468UI/MsY+6E6WchQJ7nJSevDYGO1BMrkuxqSad29H5p49DQaCIKCZb
	 hjl+ZtoHn1q+g==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-607fc3e69adso31230987b3.0;
        Mon, 19 Feb 2024 04:51:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMhOd4/dgrc0x5V4hQDyDo8//OZSmVEDQwlti8Y5URS32Y4OjREaBqbmDUlHlLYdpl3neg+wQe+0ycrNw9bBFSFNQ=
X-Gm-Message-State: AOJu0YwBXAE5ln9Yaip/H9UvXHxZLYoFa1a11LGvOcya8NV7AwM/yB/E
	KT/e8GtOWa5QnzV9yfzt4MPhYYyXD1AcA/kPigi6iJ1OJGXBl45JLjy6Ewlkwus+XiH5RiEE7dK
	ush6QrqdTDsmVOqzGFK+iR7ssuH4=
X-Google-Smtp-Source: AGHT+IETtx0kx02YwedN54ICDgDuf7r1fpurZ/bpCFbUAOJto5bM5t4A0R9mmtfO+HI/otBIxI6ba2Jea/r72fNsS0o=
X-Received: by 2002:a81:8706:0:b0:607:dfc7:abd8 with SMTP id
 x6-20020a818706000000b00607dfc7abd8mr11341239ywf.21.1708347071434; Mon, 19
 Feb 2024 04:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20240202144102.1209374-1-juerg.haefliger@canonical.com>
In-Reply-To: <20240202144102.1209374-1-juerg.haefliger@canonical.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Feb 2024 07:51:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6rZ4UjdyWz3q0LfE+VqmqJoRSquqykD2UhgW+Gd8znPQ@mail.gmail.com>
Message-ID: <CA+5PVA6rZ4UjdyWz3q0LfE+VqmqJoRSquqykD2UhgW+Gd8znPQ@mail.gmail.com>
Subject: Re: [PATCH] check_whence: Add a check for duplicate link entries
To: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 9:41=E2=80=AFAM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> Verify that there a no duplicate 'Link:' entries in the WHENCE file.
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/146

josh

> ---
>  check_whence.py | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/check_whence.py b/check_whence.py
> index 4b5471e04a6f..fd74a56a5c5a 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -70,6 +70,7 @@ def main():
>      whence_list =3D list(list_whence())
>      whence_files =3D list(list_whence_files())
>      links_list =3D list(list_links_list())
> +    whence_links =3D list(zip(*links_list))[0]
>      known_files =3D set(name for name in whence_list if not name.endswit=
h("/")) | set(
>          [
>              ".gitignore",
> @@ -102,6 +103,10 @@ def main():
>          sys.stderr.write("E: %s listed in WHENCE twice\n" % name)
>          ret =3D 1
>
> +    for name in set(link for link in whence_links if whence_links.count(=
link) > 1):
> +        sys.stderr.write("E: %s listed in WHENCE twice\n" % name)
> +        ret =3D 1
> +
>      for name in set(link for link in whence_files if os.path.islink(link=
)):
>          sys.stderr.write("E: %s listed in WHENCE as File, but is a symli=
nk\n" % name)
>          ret =3D 1
> --
> 2.40.1
>
