Return-Path: <SRS0=l6Vx=T6=sapience.com=lists@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD5CE77188
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 11:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE6FFC4CED2; Mon,  6 Jan 2025 11:37:18 +0000 (UTC)
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD486C4CEE0
	for <linux-firmware@kernel.org>; Mon,  6 Jan 2025 11:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD486C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id EE046480A13
	for <linux-firmware@kernel.org>; Mon, 06 Jan 2025 06:37:09 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1736163429;
 h=message-id : subject : from : to : date : content-type :
 mime-version : from; bh=EcFRfKLBz/jIxU+oh2aFUWJW+ILk5TvzKadxD5Zmho4=;
 b=IHRkN+imCXipZv6ADVco/Q5tpxgtkLAm7YasrT8P255imn54HwLTB40kRD2ae7mQ5T3ft
 jtiRaO5kvntMpAaBQ==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1736163429;
	cv=none; b=mpQhgmM+wqMBSrug4xb42z+8vEBN4jrb5see3dhQoGYFp2YRPB1e403Bf9rDIeAOUQKMBG+xwRJIPb8HZPoX+o2ix+WDOYJBiLxpoyFR9d48AJXH1OueVk2UoT28FrdMyoIluGVrWSnIyuNmNaFii77Zxs587buPBopa2MA3j+HtPMeycWO6zhyGAkN3zZ1ZtNObF9OM/6+T1/XUsfAS7o5mpzs29xAjvqELJliSiY3MV77dKrUuw4p9+wbwJMqCsA68CP0hNMPQEe1Ojcwr+HLlK7GE0lamhDyEiiQo7udJTIyL5VP+ttntCVu0XY+9ecwaXqfAFeoroQXPoG7O7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1736163429; c=relaxed/simple;
	bh=3ybgCGcTU9vBluGNSmpRfQemv2qWl/2MDpqcAm4VoHs=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Date:
	 Autocrypt:Content-Type:User-Agent:MIME-Version; b=SN55p0FD6vWx2Ar9ovkas7uxf4DfIlx2EAsB+z8RHMJXcXkywYFVVSmKqqbObSDSSnrym3PIWW6pizgAOjXmwCqbLy/GQNVbyl89BySvWjL7zWPvXg9BT442PAsSPyue7+Kld/AwaMCndEwOwoCR0kfdRPgOk+f47QX2NwGTy3snN7h9lOYRpvJnPPTg7RzRp+rMPY2FracMmETOF5QI4L800Wc00R/NXcOb6vNwY80LMNbR9OjKe51SeX8wArMRYMIseI9+kpANCUtp7Fqd5bIOkwqCF2HrSLYaxGcDuun0lPbPnrqTi4HJ7+4MbM/zYhrJQmWJqA9USnJyBIqpnw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1736163429;
 h=message-id : subject : from : to : date : content-type :
 mime-version : from; bh=EcFRfKLBz/jIxU+oh2aFUWJW+ILk5TvzKadxD5Zmho4=;
 b=ltUyjAy+4sSkSaMTDg02Eyinj1+tTwJf29/q08Qs1739dzosFUzOez1hsqQq5S1x+KWku
 yCUgA6DKAvPyGBQiU5TL7Qg4Lw27I0i1gIndNMg4Z4gB2GZBuotOR2ftYvTA9WOc6HaDdJN
 aM4nk0mWG1CzgbKyAJhLZ7AyCarSHvbHwLggBEuDwFzVDQRKXJy5m5EX27uS0zzroD50Vt7
 5KoAShlXCKdZzQa0qx3lpG7OWV18wuD3mEzhZVBUEUG1r1F4lGGGpePX7atYbxQL8Fc9fl0
 Z+SYpmWyMz9QmUZljfsw7CB6YRvM+ByS0w/+oZRlGUSOkRT4x7T8g+NMm8AA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id C5FCB280011
	for <linux-firmware@kernel.org>; Mon, 06 Jan 2025 06:37:09 -0500 (EST)
Message-ID: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
Subject: copy-firmware.sh bug in has_gnu_parallel()
From: Genes Lists <lists@sapience.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Date: Mon, 06 Jan 2025 06:37:08 -0500
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-8eGioVWUq3np/HmVQT22"
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0


--=-8eGioVWUq3np/HmVQT22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


The has_gnu_parallel() function in copy-firmware.sh checks for gnu
parallel using:

=C2=A0 =C2=A0=C2=A0parallel --version | grep -Fq 'GNU Parallel'

But this fails since the string is 'GNU parallel' (lower case p).

    Should probably be 'grep -Fq 'GNU parallel'

Output of "parallel --version":

   GNU parallel 20241222
   Copyright (C) 2007-2024 Ole Tange, http://ole.tange.dk and Free   =20
Software
Foundation, Inc.
   License GPLv3+: GNU GPL version 3 or later =20
<https://gnu.org/licenses/gpl.html>
   This is free software: you are free to change and redistribute it.
   GNU parallel comes with no warranty.


--=C2=A0
Gene


--=-8eGioVWUq3np/HmVQT22
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ3vAZQAKCRA5BdB0L6Ze
28KlAQDuebYXl+OLLijnirMZenuw7fKqU6nvkHOL/OyeaABItwD9F4xpVms0m/eM
skP0N3qC14rMYkfKC3CuaghbaqEpIAk=
=N8H5
-----END PGP SIGNATURE-----

--=-8eGioVWUq3np/HmVQT22--
