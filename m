Return-Path: <SRS0=0W+W=EC=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215F6C27C7A
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Aug 2023 07:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D162BC433C8; Thu, 17 Aug 2023 07:39:32 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7202C433C7
	for <linux-firmware@kernel.org>; Thu, 17 Aug 2023 07:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7202C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 698A03F0E1
	for <linux-firmware@kernel.org>; Thu, 17 Aug 2023 07:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1692257962;
	bh=L90mSg23CaLbRLKEU2Jvw5ByZOLdN3gN6Q0ZovyGN8I=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZWyNIHRPYZmIKG+8hITcP43mYXHFASZs8SK5JtruxUqjM21z0x9NSBPk2g4qnSBIR
	 G0NsmhtWEOqL9V5higAJBzTFUhudvBnsYgjGFL6kT/gCIGp93b6p/+a7HXYtszANrY
	 f95bdK5VGpPJSThLsHvnIDeABOsexGwPRHaCfvr3tWXKuP+0dSem+a8GGFtaG/Trlx
	 BYwGZIYqoxX0lt4+eNojO5YbGVGm50KzslocjTRR51nrkuxkjtm6JNDKWptyAR2gVM
	 ngWehGz2wo8O8z9GFrHZISmS4eM+FsEEiPZvhR22mrkDQ3d6o9U9i/pTFBfrl9zGAs
	 4F5kM4kn9w+1w==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3176fe7b67bso4338467f8f.2
        for <linux-firmware@kernel.org>; Thu, 17 Aug 2023 00:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257962; x=1692862762;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L90mSg23CaLbRLKEU2Jvw5ByZOLdN3gN6Q0ZovyGN8I=;
        b=d1jCktoxYPEv7000P6MVsu2A23Jyouqrm9avSUGhGLdm8H3nFBgRpUl1AzO8CT9arh
         wunL3Ps789ouNeFmyzS2Fjn5SSgFEgVQLLoJWI21bH4fcxyYamw1xaajhWLw7EslMUur
         O8Ehr0w2XLdXXaL2AMFQPF/1AYqM6bA//iVkBZUwhyjsJufOWqK6LsTZnASCfu+9e9Mk
         WLC8ABXTl6IjqY2zwTvt0+1zrubFS1NgJGZiQ0zZFf4AOAtx702N4++sLuwkvwYgDpnd
         kp5lvmCP7vFBRPx0U1wm/N262QMXXPYjs2tPTZQmmphLZt5WGRRiVo1N7wVj6jY72+Mv
         rbQw==
X-Gm-Message-State: AOJu0YwIDmnbXNLidJTQ/5SGV+TF8wnVeO/lTglrbDWEnrugSqHVHBbB
	fGvKk278X6M1+llGI7Wu+WGTadU8nFZCdMIClMBtP/V9xk6RiiVvf0OJ9ZIJzRiCZ0YOeXB0Bfd
	2+41Rx4jRuAB3dfaov793/t2FzXFs/pnPNOhFfAREAmx1jw==
X-Received: by 2002:a5d:43ca:0:b0:317:7330:bd82 with SMTP id v10-20020a5d43ca000000b003177330bd82mr3302827wrr.8.1692257962173;
        Thu, 17 Aug 2023 00:39:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhVZpUOjHbbcP3MZ1WS8vNHUiq8E7TPhfVwCUqJ0sMX898HYniibPAxeod6N4G7JKR1n8r9w==
X-Received: by 2002:a5d:43ca:0:b0:317:7330:bd82 with SMTP id v10-20020a5d43ca000000b003177330bd82mr3302816wrr.8.1692257961864;
        Thu, 17 Aug 2023 00:39:21 -0700 (PDT)
Received: from gollum ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id j4-20020adfff84000000b003142ea7a661sm23923401wrr.21.2023.08.17.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 00:39:21 -0700 (PDT)
Date: Thu, 17 Aug 2023 09:39:19 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [RFC PATCH 0/1] copy-firmware: Introduce 'RawFile' keyword
Message-ID: <20230817093919.43580b46@gollum>
In-Reply-To: <20230809094059.595680-1-juerg.haefliger@canonical.com>
References: <20230809094059.595680-1-juerg.haefliger@canonical.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wNOhEEd6xxEQ_2sJJicW=aI";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/wNOhEEd6xxEQ_2sJJicW=aI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

> Not sure if introducing a new keyword 'RawFile' is desirable (or if it
> should be named differently) but it fixes a couple of issues as detailed
> in the commit message.

Anyone?

=20
> ...Juerg
>=20
>=20
> Juerg Haefliger (1):
>   copy-firmware: Introduce 'RawFile' keyword
>=20
>  copy-firmware.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20


--Sig_/wNOhEEd6xxEQ_2sJJicW=aI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmTdzqcACgkQD9OLCQum
Qrc4hA/9Gau3BAdoFa9DwB1XdWqmADpirGTgy+9zsV8rzPJ5/16WT9k51g36dYiQ
3VJL7OvzYofVJTOXdOW7WZahVJHFWeWr3wjd30ts3Jqyuxb1B4UlU8iSm3ZX3rto
DIKme9EqqZxcueRXTVfJKuzN77z8W5OlQVWb04SNGevX0A1g9CWpN5jIFOxbC7Dv
hIT/2IZPnaz+RkhVNyN542iS+MGRucFHmKrt7J9lJgxDDaNHKybt9dEgTL14PkYM
I3UN2c77yCILDrtKj9Y1N+Oyyhe2T6jF0DL34RBnTui4INfJQohFItFgG3vm1PcA
B2t1K/rwIS6NK4wdYKr0RriFMVQ7KDeWpiqEbu3WL8WE8YpjrNX6h9xfxcoGBvBO
lA05GFAVhczVCCMmIhkJjUtx9sJXxb3vK8ETgxXTvi/3+8ED+kJOEjOcFU/EyH6P
ZqHFWxSoLCg11hgmR8hGwJPOzfVrY/7h3vkVjXknWdDt/uclRpbw4A+EA2OF4+K1
G6PQdFwDwZLdmIM2uO9TCvUpCO3NtRaVxtd8vzduVSlNmoD8pcIPyzy9/7XS4kLK
CT2PW2F6SKHV8CRZx042UiLhb3Me8sW+BxHrURJv/81KHSQBceP5F3T7M9blrFaH
thWpDmB6Gej3Rp0DEJzusqoEdxHOfWWye4EGroeTOGFPnFfOk8E=
=7r26
-----END PGP SIGNATURE-----

--Sig_/wNOhEEd6xxEQ_2sJJicW=aI--
