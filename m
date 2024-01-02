Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4E3C46CD2
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jan 2024 13:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1AD71C433C9; Tue,  2 Jan 2024 13:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0521DC433C8
	for <linux-firmware@kernel.org>; Tue,  2 Jan 2024 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704201115;
	bh=97CqFaZzLI3GxGeAiK3wu4yQE0IQg7zVUltInSTbfFU=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
	b=uuT7K4FT86pmjzb3kQ0ZZWwA/G1Oja9eHQiyfSiMZoznH3hrv2aIvxn0NkjGlVFpH
	 5xMPRnwXmtjmLmKVcqJ+PbN/j7imF8HKO5XZUFiEvdhMA91uL8ZiF437kkDGyEDklO
	 5BiOStDg2eWyboWm5F4Et94RIKMVuYBLhL2xo1LTUeDzC7enntTo9Ga4asnwKzi+rB
	 4uKL4icR407kIqDW3Y8DsGeRQ7HcfXn7W40HnHrrZk8JrE76t6Vl7BIvhtBFdyvFA3
	 IX/szh52ZWCT5wUJfgVLEl7iyfzyQBh5GFFBL/viUfzw9yrxRG6RKj1L1Zud88K/vu
	 iJBBboQJLcuhA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5e76948cda7so59616647b3.3
        for <linux-firmware@kernel.org>; Tue, 02 Jan 2024 05:11:54 -0800 (PST)
X-Gm-Message-State: AOJu0Yy2xcBIk8zvMuftR4M6UG7gaUDHJxGYfsn9ULphg+c3r82IABoU
	HcpHhnvRcmhi+Gc1cxUe8MjurLYgCrIt8FVG5Vs=
X-Google-Smtp-Source: AGHT+IFjVUUnjdvUVBcJdQ1o7Cq3sXkkdttGDIIL+VGRdpYj8MdMNJLGUGH943FsMVTQcNITkVnNPejIgXmlSb2NIHo=
X-Received: by 2002:a81:a782:0:b0:5f3:10fa:a8b2 with SMTP id
 e124-20020a81a782000000b005f310faa8b2mr961784ywh.6.1704201114139; Tue, 02 Jan
 2024 05:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20231113215300.Fw2CJ%steffen@sdaoden.eu> <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
 <20231117011925.PPRKHhpq@steffen%sdaoden.eu> <20231117014630.lO5xbFXr@steffen%sdaoden.eu>
 <20231216223619.nRgZNdqv@steffen%sdaoden.eu>
In-Reply-To: <20231216223619.nRgZNdqv@steffen%sdaoden.eu>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 2 Jan 2024 08:11:43 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=6WmHo76LZsBRe3gvt5og@mail.gmail.com>
Message-ID: <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=6WmHo76LZsBRe3gvt5og@mail.gmail.com>
Subject: Re: Question: v20231111 adds rdfind dependency: why not at ball build time?
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, Steffen Nurpmeso <steffen@sdaoden.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 16, 2023 at 5:36=E2=80=AFPM Steffen Nurpmeso <steffen@sdaoden.e=
u> wrote:
>
> Thank you very much for making rdfind an optional thing!
>
> I still have not understood why this complicated mechanism is
> applied twice, for both creating a distribution tarball and then
> again on the user box, instead of maybe (if it really has to be
> done that hard) doing a final find(1) run during tarball creation,
> and creating a schedule what to cp(1) and what to ln(1) -s (and
> where to, of course), however.

The tarball is created automatically by kernel.org infrastructure
based on a signed git tag.  The maintainers do not have access to the
backend that creates the tarball, so we can't run rdfind during
creation.

> But i wanted to say thank you, and then i was wondering why the
> Linux kernel uses --ultra -22 for zstd(1), whereas Linux-firmware
> uses a very, very low number.  Also note that zstd(1) -T0 works
> regardless of whether SMP is compiled in or not, last time
> i looked, it is simply ignored without.  And it is very helpful,
> especially with --ultra -22 and on a modern box.

I'm honestly not sure.  You'd have to ask the author of the commit
that introduced zstd support as to why they chose those numbers.

josh
