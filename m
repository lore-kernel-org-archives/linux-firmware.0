Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA73C6FD1B
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 18:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6743BC433B0; Tue,  7 Mar 2023 18:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BB21C433A8
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 18:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678212492;
	bh=8O5Zzwl48jbCuHOXNc/Ov5uQqWZfWkXx0oiBY4in1cA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Q/o8Scjq7eraFkmfSS89XXkPQKj3ceE0xcRa2ibt2lCOnsGOKYr6eZPxzZeZGgsjt
	 qwrhGkxrV9sf1uVWrGxAIgOIbIS72TIdTAz2w8aid7+wbbMXjz8ESKpkCkVVGlUJyK
	 ZcM2txuCqLjIMXBsp+SjZjg3lDAkE6k3yKnPhrfqHm7aj9+gbM8qz/zfe9K9Kfk9K/
	 hBYlv5gszO7xyzEuSfqqtTDkvxEUqYIiStPN0v1M48ahDN+X7wF8Unu3czNaTtlr7l
	 648o6gBhGWds8s8Qmd+uOMvYtLyHNpXexvbDhfEhNWUK3vRXFqUkyV6obkfdrM8zeK
	 oj218ueMJSKiw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-536c2a1cc07so259355197b3.5
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 10:08:12 -0800 (PST)
X-Gm-Message-State: AO0yUKWFjgNWERO1pOnccISj20nfSwCvxvUkTHiI2JeTelNwt+EFYcNP
	Bn6sLSM6riR8q71WsMwN2Vlk+c/9gOZc3eZKC5k=
X-Google-Smtp-Source: AK7set8Ow3q1YFdVWTYZa2x4I/mz4Icto93UUY+Mm0IgbZY+RXtIjCXYNtsuXp8wtTQiL1CWwmCt/iwW/ghydqiBiSI=
X-Received: by 2002:a81:ae4e:0:b0:52f:3399:ed08 with SMTP id
 g14-20020a81ae4e000000b0052f3399ed08mr9383817ywk.6.1678212491403; Tue, 07 Mar
 2023 10:08:11 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
 <20230301-fixes-and-compression-v2-5-e2b71974e842@gmail.com>
 <CA+5PVA7eOJ+y2rdSyMAqVqqcp8w4oYfZU1J8PZV7+TKqDcxqbA@mail.gmail.com> <CACvgo51yMRXgbUfK6wNfDvXEuBXH=JPZhm9=oFkhFHipVqz5oQ@mail.gmail.com>
In-Reply-To: <CACvgo51yMRXgbUfK6wNfDvXEuBXH=JPZhm9=oFkhFHipVqz5oQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 13:08:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4wGZxYjM7nVD7J4opM3fXwoK6oGW673=FBOzgeDMLwcw@mail.gmail.com>
Message-ID: <CA+5PVA4wGZxYjM7nVD7J4opM3fXwoK6oGW673=FBOzgeDMLwcw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 05/16] WHENCE: comment out duplicate MediaTek firmware
To: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 12:19=E2=80=AFPM Emil Velikov <emil.l.velikov@gmail.=
com> wrote:
>
> On Tue, 7 Mar 2023 at 15:02, Josh Boyer <jwboyer@kernel.org> wrote:
> >
> > On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
> > <devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
> > >
> > > From: Emil Velikov <emil.l.velikov@gmail.com>
> > >
> > > As mentioned in the inline comment - file is already listed further
> > > down. To prevent check_whence.py errors, comment it out.
> >
> > Why did you comment this one out instead of remove it as duplicate
> > like the previous patch?
> >
>
> In the previous patch, we had either a) duplicated within the same
> section or b) section that is no longer applicable. Aka the r8723au
> driver referenced does not existing in kernel.org
> Here we have two drivers which use different firmware sets, which
> partially overlap.

Ok.  That makes sense.

> Dropping one or the other would be misleading, but I don't have a
> strong opinion. Let me know what you prefer and I'll respin the patch.

I think this is a case where both should be listed.  If you comment
one out and the other entry gets removed, perhaps because none of the
upstream kernels support the driver any longer, then the installation
will not copy the file to disk and the driver that is still in-tree
will now have missing firmware.  I don't want to leave people without
a functioning system just because we wanted to avoid some text in
WHENCE.

josh
