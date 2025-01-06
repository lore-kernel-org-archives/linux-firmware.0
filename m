Return-Path: <SRS0=l6Vx=T6=sapience.com=lists@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF7AE77188
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 15:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11DD1C4CEE1; Mon,  6 Jan 2025 15:20:29 +0000 (UTC)
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95F26C4CED6;
	Mon,  6 Jan 2025 15:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95F26C4CED6
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
	by s1.sapience.com (Postfix) with ESMTPS id 51889480A13;
	Mon, 06 Jan 2025 10:20:25 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1736176825;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=ZQbp4bwHEM1dNJnzvbmMLjeN2P7QqAQSAEyU8nEL+vA=;
 b=dEobOaThuePPtN/gB25/dZjzFgeBT1Y/XL29SEGQ7IG3NF4AafrwEku+kT5li2ZJWyInu
 cxnmjOyJwe32MSwDg==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1736176825;
	cv=none; b=s6/y/6+1Kq7zOHe8YoRI1NNmBU2edmSOe+0w3ojxMqmPiGK7iH2vm5in7G20HsuteD8ruI6rQievK8HFpnMLUhvpD3P5A8eLIunCW6uX2mDmexIfLMEMJ4RTZE00P4mmSD1oYsDKEEav9iianhnc6FX2ZMznj7RZ79EJGkoEe+jZXHXDOXdcIdvzGT4aZqdjCy33obtHih1nMNCUf+v6njpoN9InmWE/Z+f6zaJFoqVLGwHTWeVQIZqV94mGp7sysyH0bRJQp/jnfKT1banIwTBbwCHBehI2Bj+80RbNze719yoJ/BbY7Ai3s7HFFEqtF3vh17m9SDTpWKEG22yDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1736176825; c=relaxed/simple;
	bh=ZQbp4bwHEM1dNJnzvbmMLjeN2P7QqAQSAEyU8nEL+vA=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=o/6340lGupPL1Syu139wkPWY/koa5Xg7lGvagPWRpiiF4sxBHGc/eJr23QyHyzBRZK4CVpRhqhEcOlJ3L1IkHfge+IEH/btYzryMZUZqgs9NOnddulsvMrnWw57Xl6d82c0nMdsBATcuA7Qmi59jQqOI7bjzHIgJBFOvRxf67EWQv1AniBl3w1gEWVsoFHZPHdI/COD+5dGCA4U5r2crKz7hM9l+mf41aSKfu1rPrY/CkJzWS4WFFZ2FahV2q+H+ib19ZPGtri3RpZhO7kG2VMz0t60JzfgnToCC8hh7eEa/g4O6khaMUQvF3OE94zJWBCMkDzEi06q9TDnC0l8gJQ==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1736176825;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=ZQbp4bwHEM1dNJnzvbmMLjeN2P7QqAQSAEyU8nEL+vA=;
 b=ldkPn3vYDe+SrPu5Y277Fi+jMMQ5FYRLWhAUjloGJGoE/AmMQP2vo6yX4pczNCIl5RbMs
 m3jmm72+J286EcTDeb0qnttTsstBnmyJ+otQqXbkAIk9hod6wwWt6m3y+10mIfnxw2GtuUV
 bxBIzwW1lZNJuvTTrInz/XLEquTNE4io4Cp75ZJ6iVaw5dof8aB6vkIKhX9hIgV85RXDysN
 7dFsbNTmBXS9L5rKPvAGtC+TynbbDhzkMIUPgrglGbYQTPkLhNlOvGbE/7alkjqMCbIGs3k
 85hyadw0Og6CrR7S6C//ltVDEYRiWv0V4ysRIafn24/Kjs5pq5E5IU/t6iLQ==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 2ABCD280011;
	Mon, 06 Jan 2025 10:20:25 -0500 (EST)
Message-ID: <1a66e6ce210cfc5df2dc07fad8d7c8e926c188f7.camel@sapience.com>
Subject: Re: copy-firmware.sh bug in has_gnu_parallel()
From: Genes Lists <lists@sapience.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Mon, 06 Jan 2025 10:20:24 -0500
In-Reply-To: <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com>
References: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
	 <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-Omll2D0nG6nP6qcn0LTT"
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0


--=-Omll2D0nG6nP6qcn0LTT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-01-06 at 08:02 -0500, Josh Boyer wrote:
> On Mon, Jan 6, 2025 at 6:37=E2=80=AFAM Genes Lists <lists@sapience.com>
> wrote:
>=20
> ...

> You trimmed the output.=C2=A0 The full output is:
>=20
> [jwboyer@vader ~]$ parallel --version
> GNU parallel 20241222
> Copyright (C) 2007-2024 Ole Tange, http://ole.tange.dk=C2=A0and Free
> Software
> Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <https://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> GNU parallel comes with no warranty.
>=20
> Web site: https://www.gnu.org/software/parallel
>=20
> When using programs that use GNU Parallel to process data for
> publication
> please cite as described in 'parallel --citation'.
>=20
> which has `GNU Parallel` at the bottom.
>=20
> The grep finds this.
>=20
> [jwboyer@vader ~]$ parallel --version | grep -Fq 'GNU Parallel'
> [jwboyer@vader ~]$ echo $?
> 0
> [jwboyer@vader ~]$
>=20
> Did you actually see a failure somewhere, or were you just looking at
> the output and making an assumption?
>=20
> It's arguable either case is correct and we might be able to improve
> it, but there shouldn't actually be a failure that I can see.
>=20
> josh


Actually nope I didn't trim the output.=20
This is the full output I get on Arch Linux:

gene git]$ parallel --version
GNU parallel 20241222
Copyright (C) 2007-2024 Ole Tange, http://ole.tange.dk and Free
Software
Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later
<https://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
GNU parallel comes with no warranty.
gene git]$=20


And indeed I do get a build failure (which is how I came across the
problem):

gene git $ make -j4 DESTDIR=3D../tmp FIRMWAREDIR=3D/usr/lib/firmware
install-zst
install -d ../tmp/usr/lib/firmware
./copy-firmware.sh -j4 --zstd ../tmp/usr/lib/firmware
ERROR: the GNU parallel command is required to use -j
make: *** [Makefile:48: install-zst] Error 1



--=20
Gene


--=-Omll2D0nG6nP6qcn0LTT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ3v0uQAKCRA5BdB0L6Ze
2y2EAQCPA4OWBLtPDsMpzSx3j3lkw+gz/dWApodHIoYanHVm+gEAh354Kx3uv6sG
KSO/nzkkWeq70XP2ZpkgCI/gB0qsGQg=
=pqWO
-----END PGP SIGNATURE-----

--=-Omll2D0nG6nP6qcn0LTT--
