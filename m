Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D96C4167B
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Nov 2023 13:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2755C433C7; Mon, 27 Nov 2023 13:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66BEC433C8
	for <linux-firmware@kernel.org>; Mon, 27 Nov 2023 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701092571;
	bh=gToEA8ZZ68rdk9uZ1K8zNw6j+HWJmyWOHcySsfSgS2o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ICp5ZaeHv76KsjOaZ/kVTOj0w2jDP/xFxs8sGE09jU4x5S1Bmhd0OLoN6aHC9RqzP
	 D+rMQIJYxvz/ssEOVlVO6OTx+UIVXLNw0yvRKYsZAcwRhJjI7TNZxJhNikfwDWOkwu
	 4RUq8fQvffiYTnHjkCA9whB9jOu+Lk3GD1fulBu3PWY8oGR/LUbcB6dxtdZMwpMY04
	 Va1cBv19GTduMKEHJEdBQL09IxyCegi7xAD7I9McAUlWC7cyINOV7Hw2bLUn9imOi2
	 sYycJ4ccQamegIBWpoJdldmcHSz2vuX15+5q7uMeJzXyn0mcsy9ytzOwo9M8eNZSaE
	 tUar9l0UnK+Ow==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d12bf5d9b4so786757b3.3
        for <linux-firmware@kernel.org>; Mon, 27 Nov 2023 05:42:51 -0800 (PST)
X-Gm-Message-State: AOJu0YyAOo7K5W92Vqyd0IOSMwnLeFglkAE4+68aeZhzNxh0CO1PijcW
	QdyBe/e+LFmauuHY/Xz5qoWfYqq/lPiO/Ig6FeA=
X-Google-Smtp-Source: AGHT+IGQLBKaxYxn24EefWXlTnZiX0DlOXUf7AYLIE9pilHx8wkxgjg3IQ2sp6iEHPGOCrjTJJseh0lm4xfuX4uH+Y4=
X-Received: by 2002:a05:690c:408c:b0:5ce:eba2:90df with SMTP id
 gb12-20020a05690c408c00b005ceeba290dfmr6213134ywb.3.1701092570892; Mon, 27
 Nov 2023 05:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20231126170207.1309537-1-eschwartz93@gmail.com>
In-Reply-To: <20231126170207.1309537-1-eschwartz93@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 27 Nov 2023 08:42:40 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7pzYi3SYrwA4K1vSMk994Pw1NuDTdYkQFNoWbw5rwdxg@mail.gmail.com>
Message-ID: <CA+5PVA7pzYi3SYrwA4K1vSMk994Pw1NuDTdYkQFNoWbw5rwdxg@mail.gmail.com>
Subject: Re: [PATCH] Makefile, copy-firmware: Use portable "command -v" to
 detect installed programs
To: Eli Schwartz <eschwartz93@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 12:02=E2=80=AFPM Eli Schwartz <eschwartz93@gmail.co=
m> wrote:
>
> The "which" utility is not guaranteed to be installed either, and if it
> is, its behavior is not portable either. This means that when rdfind /
> pre-commit are installed, the `which` check will report a fatal error
> because the which tool did not exist and the shell returned a nonzero
> status when attempting to fork+exec. If it did exist, it might not be an
> implementation of `which` that returns nonzero when commands do not
> exist.
>
> Conversely, the "command -v" shell builtin is required to exist in all
> POSIX 2008 compliant shells, and is thus guaranteed to work everywhere.
>
> For some in-depth discussions on the topic, see:
> - https://mywiki.wooledge.org/BashFAQ/081
> - https://unix.stackexchange.com/questions/85249/why-not-use-which-what-t=
o-use-then/85250#85250
>
> Examples of open-source shells likely to be installed as /bin/sh on
> Linux, which implement the 15-year-old standard: ash, bash, busybox,
> dash, ksh, mksh and zsh.
>
> A side benefit of using the POSIX portable option is that it requires
> neither an external disk executable, nor (because unlike "which", the
> exit code is reliable) a subshell fork. This therefore represents a mild
> speedup.
>
> Signed-off-by: Eli Schwartz <eschwartz93@gmail.com>

Applied and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/79

josh

> ---
>  Makefile         | 2 +-
>  copy-firmware.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1d28d8a..f7e6323 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -6,7 +6,7 @@ FIRMWAREDIR =3D /lib/firmware
>  all:
>
>  check:
> -       @if ! which pre-commit >/dev/null; then \
> +       @if ! command -v pre-commit >/dev/null; then \
>                 echo "Install pre-commit to check files"; \
>                 exit 1; \
>         fi
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index f9b1f0f..6f2268b 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -69,7 +69,7 @@ if [ -z "$destdir" ]; then
>         exit 1
>  fi
>
> -if ! which rdfind 2>/dev/null >/dev/null; then
> +if ! command -v rdfind >/dev/null; then
>         echo "ERROR: rdfind is not installed"
>         exit 1
>  fi
> --
> 2.41.0
>
