Return-Path: <SRS0=mbXM=DY=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20D5EB64DD
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Aug 2023 11:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B270C433CA; Mon,  7 Aug 2023 11:32:28 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7221C433C9
	for <linux-firmware@kernel.org>; Mon,  7 Aug 2023 11:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7221C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 208913F189
	for <linux-firmware@kernel.org>; Mon,  7 Aug 2023 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691407943;
	bh=D2g8xB+JVBYLye2CuvRWRCZMyYOxK9yjpW0IumiVJjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TctF+HSHGV08kc0tuOuJp7d4nikV0f688OrPJYj9EFZ5ybot1IXIj4ckoP6c7TDoz
	 OOrMD6VXZdgYspg8JBSYavR44tYCpr2aJ7HnuVNv9pNNcF9WPZymUl6CMgXwYLle6z
	 KCsRqv810V/99IR18aXJK2seMri551Ep8X7PFO8QqUtxwbetSQizTYGRTFeRNXS+Pq
	 1ujE89qRApBqrGwghOOcPC8ixep35dtSHUTMYOPo/lSlt26m+yZYSD2u1Am4lTZVyv
	 vM94cDjHXaXoi0PGO+z/Fjnauq7aDxdQoOp5HjF9T7fmMXgvtI9G4Y55KKiJM3OHU+
	 kAMOPeEMg2SDA==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-31758708b57so2706959f8f.1
        for <linux-firmware@kernel.org>; Mon, 07 Aug 2023 04:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691407942; x=1692012742;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2g8xB+JVBYLye2CuvRWRCZMyYOxK9yjpW0IumiVJjQ=;
        b=RCjbNWvtKV8AV0mLgUMElfJD7VzvQkquYMkZKRWt9nwMqehkidt7xddgENyYfCB0Xg
         NWAs+SyB91N5WbYuHJ/FVl1RiJwSrcWrANWc7mh3UYAz/h1/gyUb6SAlK7rmslf8QSqX
         BRxa66NIUqJ5mUaTZmsJw5V73Un8fTo1zQDn0iX99ApGNJQXmmg2+Dazc4o8LF/kAsm6
         szBymIOE96wwHlc/QxkQtL4Z5jDpX5iS0TJrY5gBT+uQopfms1XkSG0cbqSdV8JkDw3B
         KluXIichee88lh8Vs0I4lnKgdrJdxOpwJxdu5bK+3AIfMI24Ptik7+8RZF2+PEh4C/+y
         1b3A==
X-Gm-Message-State: AOJu0YyzvuduKs3LfG7C2QIKD2l3Fs1E3cVJro9b/IHPm9YGyI0a5jkf
	w7vwnYvaOhk0+mzCwkQGFYwkrGRd//CPkYnB1drz5kN+sZvKFUPm3LxenO+Tg2LPSAPs3uqqY2b
	vrIh1DA6nPXxdHLzuXiJBtt7va447Zi7pn0ZGNA==
X-Received: by 2002:adf:f291:0:b0:315:9993:1caa with SMTP id k17-20020adff291000000b0031599931caamr6636888wro.12.1691407942525;
        Mon, 07 Aug 2023 04:32:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlYHgd5e/8rA93XAFgsPl78pp88Ij3oK1NrVxWcSCe3xW6Vl006VkL2fILNmP4hD/z0gFcpg==
X-Received: by 2002:adf:f291:0:b0:315:9993:1caa with SMTP id k17-20020adff291000000b0031599931caamr6636869wro.12.1691407942235;
        Mon, 07 Aug 2023 04:32:22 -0700 (PDT)
Received: from gollum ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d4acf000000b003144b50034esm10194658wrs.110.2023.08.07.04.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 04:32:21 -0700 (PDT)
Date: Mon, 7 Aug 2023 13:32:20 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: <linux-firmware@kernel.org>, <jwboyer@kernel.org>,
 <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
 <alex_lu@realsil.com.cn>, <mu_hua_chen@realtek.com>,
 <hsinyu_chang@realtek.com>, <kidman@realtek.com>, <karenhsu@realtek.com>,
 <vicamo.yang@canonical.com>, <Riley.Kao@dell.com>
Subject: Re: [PATCH v2] Revert "rtl_bt: Update RTL8852C BT USB firmware to
 0x040D_7225"
Message-ID: <20230807133220.7d5952d3@gollum>
In-Reply-To: <20230807103218.10157-1-hildawu@realtek.com>
References: <20230807103218.10157-1-hildawu@realtek.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4Kp/WDDV=5pd=AQIV+le8fb";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/4Kp/WDDV=5pd=AQIV+le8fb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Aug 2023 18:32:18 +0800
<hildawu@realtek.com> wrote:

> From: Hilda Wu <hildawu@realtek.com>
>=20
> This reverts commit 55e7448533e774824cfb34a7eaeb9604608e1a4a.
>=20
> Commit 55e7448533e7 replaced rtl_bt firmware with a v2 binary which
> is not compatible with older kernels and introduced a regression.
> Undo that and add the v2 binary later using a different filename.
>=20
> Let the rtl8852cu_fw.bin file keep the firmware format v1 and stay
> at version 0xD7B8_FABF.
> Subsequent RTL8852C BT USB firmware format v2 updates will be
> launched with rtl8852cu_fw_v2.bin
>=20
> Suggested-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
> Changes in v2:
> - Modify the commit log to make it clearer. Thanks Juerg
> ---
> ---


I don't have the HW to test this but FWIW:

Reviewed-by: Juerg Haefliger <juerg.haefliger@canonical.com>

--Sig_/4Kp/WDDV=5pd=AQIV+le8fb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmTQ1kQACgkQD9OLCQum
Qrf84A/9FINgvDGbU3Aexj+pIqIhi1HbzKJviTLhFlZTLVUt7Bd/xcHokDEjqPOo
k5lmaEtY8xFQQbwqFvSzuV2hoC6khFk1gyl3W6HUpWHvCcjK+HPMiti+lqdhxdEP
FnYxm9bIDfWInSSFy8+OPsLL/VdJmRs1TkvqrRR8GaS1Sm1yDpBXkhp6Rz5JHMsx
xV5+xrFPGNytDAFebvlTSWQT30/opemqdOdQ5etwnVLRwwdJ0vyFTeT/zDY7CDMb
82n52KYe9SNYV01LEE0Z7UayVkwY8fdtqvXhMaJlvSXJuh7UuW1kAK5iSyspC+/q
ClrfUTXZRb4g13plggQxFgJU6ggxP7eWZhhVdL4YZfLMMHmd7wLHQ1v3DW9gw9H6
iYui1wGm/gFw1rwotUk+HcGqwefjTPIil87d+qhZ2u5iRa8HU+l/s0bayiaen3YK
QrWDFA8oGccNj9GC3DIQGOkEFh0DJF4WB8vdbWXGQyVvdwWBpqqgOmfMYjDyXbun
3/SFp33ukggBKYm4iqZ2hs7Ayh8AiJDlcgQfUMR3IV0RBveqKR2Yn4B6fjTZVwEf
7RNJ4uAjO5R0kUTKR0CgXpKmC1OTsqZHX0726rMCB5Y3TT/1gCWcoPpHSTvetDZh
/XFk1P0qF0tXE89kzxKwawWiw6397lkVDQMjHckXn8nDVHaPKYo=
=qqRc
-----END PGP SIGNATURE-----

--Sig_/4Kp/WDDV=5pd=AQIV+le8fb--
