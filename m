Return-Path: <SRS0=lz8g=27=ionos.com=jinpu.wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39637CA0EE6
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 12:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E9C7C4CEF1; Tue, 19 Aug 2025 12:16:45 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5AFFC113D0
	for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 12:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5AFFC113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ionos.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso243200a12.0
        for <linux-firmware@kernel.org>; Tue, 19 Aug 2025 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1755605801; x=1756210601; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMlwZjg+BwGuKg1s6kTEEYqgJZl+nDMkdFkULY+5kpU=;
        b=AGhAms/QRY4OvzEIU1K1Io8JfKuDo0bYx+1pEa6Nt9SfoeT8yndryYGY/lmQN/yDFi
         PNKJc1STCMLRFOmZ8VoLLRzn1/UFV+ZRF4YVsASTpRFHD4swghHhfOB16oSaD4PPoMqa
         OiV3kJqpjFUoI0AjMy7cSo/WQIGMaU1X4JLJOXuw2C63mwu0sXxKUB2yuxqrHccs/hxU
         9OUEX3X18afmDZnqyNrcPeoFI/SmuXq39RnT/Bn+yDYr8OndEy8XZBN5W1jJcfvcFbNF
         iNAF6FkJGf+HfYv8j66TBU2pbA4rcElylh9dkNA5QISg/pZ/d+NDRfymdU9XsIXjIGWW
         qxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605801; x=1756210601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMlwZjg+BwGuKg1s6kTEEYqgJZl+nDMkdFkULY+5kpU=;
        b=Dx13s5ajIzMjBxD+TEnZTdE3fwemDjwJD6aMljbCk3lWikCjVe0jIN5IiUighPhNnN
         TyiJBnkvND6DjoCqIJBaKjUNAPBgn+97fr6cYLn+swrKcCIyXcUZuxcHO1+8EIuzi1CD
         o1geohJrU2WuHNx0ftLdJN6mKXUKn8F8YFgKzQmQm6+dSuNRexpQHWksin+3/knVfQAw
         OMfYfitPvajpOH8TMNgPH08RUdaMnsJd2DDe/cv+2mRN4QKe7hrWHtdozLTHW0NKkenK
         Y8DzO54gP04EFZ3Tell7st4ZGkswz/Wsljo9JB9yfrTNZef2eMVGbDNqy3YHyjdZIl8s
         zSvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4PU+a5O3azLJ2jKBaxTrS9vlMPrSGZD+03OmsvbyEeQKlNrZ5+akgxhNTuzlx8Fhz7nMwXub8LkjX4vRAYQ==@kernel.org
X-Gm-Message-State: AOJu0YzVyywjYZzdGArPIXsp1vfOQVfJl4X0M6X413jd0LR0iCow4qFM
	6wBxyMlN5EXPFKvSFiWw3rLY+T/EUlN18NmzgRMLSF9z6QQM17W+x0spUPf8FidTfc/q4UuwGad
	f59F45zmXUPFCxPDo+3wykoD6Y3RbWa/vq6GQUSneBw==
X-Gm-Gg: ASbGnctzFQ2lOm2fjvgJMsw3LS3KjB7Yx9Su8hxhiWCwacpz7HEWEH8krLqadgaeR+K
	mI48RtUXhUgL0Mi2b7yVyGAIN+C3XIunJEmVcqaBCLfzFjhdJkE4vB3kae9kVviYasYkV4u31aC
	t8uYxgxugz/xsQrBVO1NrLbo0GJaYWAzFLFdasFlETM8uste89Xm1LOLZQoBn61TNPQCYDzgTli
	bE+lIWzsG7+nTZpWg==
X-Google-Smtp-Source: AGHT+IFVPOJnpawqYW7dgmQm05ygm+o8VCZKwSKrOr4m0ElqSL/2bgxkgUBv9mgR5/NbA+QU7vlP8i/6O4WJ8B7wxWE=
X-Received: by 2002:a05:6402:13c7:b0:618:1835:faa4 with SMTP id
 4fb4d7f45d1cf-61a7e7431a0mr952736a12.3.1755605800879; Tue, 19 Aug 2025
 05:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMGffEmFm8wvgiw+s0ZpOhRxBLOz3dQiS=sQCkgJLD6qC3VwJg@mail.gmail.com>
 <20250819105527.GCaKRYH9VnQaVdl7gQ@fat_crate.local>
In-Reply-To: <20250819105527.GCaKRYH9VnQaVdl7gQ@fat_crate.local>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 19 Aug 2025 14:16:29 +0200
X-Gm-Features: Ac12FXyi5L7sFVX4UCj_Ji2kWikgHR5CHKMJy4pq_iRmfKf7TcnG4_KynvPZ4bc
Message-ID: <CAMGffE=+hhf6EXCVYo+tvdUKN8B=uEtjkTpo1R9PXN3HycXG-Q@mail.gmail.com>
Subject: Re: [BUG] amd-ucode 20250808: "No sha256 digest for patch ID:
 0xa0011de" on Linux 6.12.37
To: Borislav Petkov <bp@alien8.de>
List-Id: <linux-firmware.lore.kernel.org>
Cc: x86@kernel.org, linux-firmware@kernel.org, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Boris,

Thank you for the quick help and for clarifying the situation. I
apologize for overlooking the information in the `amd-ucode/README`
file regarding the required minimum base microcode version.

Thanks,
Jinpu

On Tue, Aug 19, 2025 at 12:55=E2=80=AFPM Borislav Petkov <bp@alien8.de> wro=
te:
>
> On Tue, Aug 19, 2025 at 08:14:50AM +0200, Jinpu Wang wrote:
> > Upon boot, the following error is reported in dmesg:
> > `microcode: No sha256 digest for patch ID: 0xa0011de found`
>
> [boris@zn: ~/kernel/firmware-linux> less amd-ucode/README
>
> ...
>
>   Family=3D0x19 Model=3D0x01 Stepping=3D0x01: Patch=3D0x0a0011de Length=
=3D5568 bytes
>     Minimum base ucode version for loading: 0x0a0011d9
>
> So you need to update your BIOS in order to be able to load 11de.
>
> HTH.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
