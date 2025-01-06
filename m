Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A437E77188
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 13:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 341E7C4CEE2; Mon,  6 Jan 2025 13:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBB2C4CEDD
	for <linux-firmware@kernel.org>; Mon,  6 Jan 2025 13:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736168579;
	bh=XRrVH/ELptPY6RBDDOCettgwygf7CygTE3G1oknflJg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=GR3wLlyA/aiTYPG22ecowcReuR80e3HOMQJUQFjBHQt04ICe4abg6hAzivUja+GPS
	 ChXtLSqVjPPGTx0RSJCJitfYoipdZcwYgFFw2+6HdVnPlBpywoM3C9TrruUYsnc7kA
	 lKrFREZqIiZqIUSs65KWz6grRuwqcdgWVP9T1ApmzIU9RWO/SZ2Xvspw2J8V6t0wbZ
	 vonGxit6Ztxp2r2JqhHFd4/e7QJPgeGwnaQUHI0M0TTgVIGFwxkZPHFIm9qu1s5qes
	 1u0T9fDRfHbc3VN7S0ppD//k+PVQyQmr2NeZkBaUcoIHtwObNW0o2WkFrrd5vUUxUR
	 kJln6iHwTkKMg==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3fd6cd9ef7so19762813276.1
        for <linux-firmware@kernel.org>; Mon, 06 Jan 2025 05:02:59 -0800 (PST)
X-Gm-Message-State: AOJu0YwA37elet7K2qykSm6qeBWKjd+iLSh6gv0L4UzRDR0CSr8DYYnn
	GzKOnEeqRZ9L3rOqrk+H+mOIiCIPCfOIWMPcjRpz/fvrFl01E9DKNA/S9hTUetoGhiPk2GpftMS
	YuBsG3fO6H7pB4ECTd0PznR6je/Y=
X-Google-Smtp-Source: AGHT+IEhiu4QeENwA0Ead8qFu5Q6pTO0lxFtTxVHSnj+Zbfy9hygmwsSOvrB5TKv8GzEINlo7WVCta1hd2gFxZgagSU=
X-Received: by 2002:a05:690c:d8a:b0:6ea:1230:2467 with SMTP id
 00721157ae682-6f3f7dfd4ebmr363214217b3.2.1736168578295; Mon, 06 Jan 2025
 05:02:58 -0800 (PST)
MIME-Version: 1.0
References: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
In-Reply-To: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 6 Jan 2025 08:02:47 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com>
Message-ID: <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com>
Subject: Re: copy-firmware.sh bug in has_gnu_parallel()
To: Genes Lists <lists@sapience.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 6:37=E2=80=AFAM Genes Lists <lists@sapience.com> wro=
te:
>
>
> The has_gnu_parallel() function in copy-firmware.sh checks for gnu
> parallel using:
>
>     parallel --version | grep -Fq 'GNU Parallel'
>
> But this fails since the string is 'GNU parallel' (lower case p).
>
>     Should probably be 'grep -Fq 'GNU parallel'
>
> Output of "parallel --version":
>
>    GNU parallel 20241222
>    Copyright (C) 2007-2024 Ole Tange, http://ole.tange.dk and Free
> Software
> Foundation, Inc.
>    License GPLv3+: GNU GPL version 3 or later
> <https://gnu.org/licenses/gpl.html>
>    This is free software: you are free to change and redistribute it.
>    GNU parallel comes with no warranty.

You trimmed the output.  The full output is:

[jwboyer@vader ~]$ parallel --version
GNU parallel 20241222
Copyright (C) 2007-2024 Ole Tange, http://ole.tange.dk and Free Software
Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.ht=
ml>
This is free software: you are free to change and redistribute it.
GNU parallel comes with no warranty.

Web site: https://www.gnu.org/software/parallel

When using programs that use GNU Parallel to process data for publication
please cite as described in 'parallel --citation'.

which has `GNU Parallel` at the bottom.

The grep finds this.

[jwboyer@vader ~]$ parallel --version | grep -Fq 'GNU Parallel'
[jwboyer@vader ~]$ echo $?
0
[jwboyer@vader ~]$

Did you actually see a failure somewhere, or were you just looking at
the output and making an assumption?

It's arguable either case is correct and we might be able to improve
it, but there shouldn't actually be a failure that I can see.

josh
