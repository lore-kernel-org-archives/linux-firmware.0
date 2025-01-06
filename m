Return-Path: <SRS0=l6Vx=T6=sapience.com=lists@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261C3E77199
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 16:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0F30BC4CED6; Mon,  6 Jan 2025 16:43:56 +0000 (UTC)
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6F5BC4CED2;
	Mon,  6 Jan 2025 16:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6F5BC4CED2
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
	by s1.sapience.com (Postfix) with ESMTPS id A3B7C480AD1;
	Mon, 06 Jan 2025 11:43:53 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1736181833;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=+4x1hj9ps6pzwsUQq74ucPCLxi7RiZ/hFJlETxwnEk8=;
 b=ZByzaI29TxWaYAVL1zpJqzCRGF9K3qlp+684DzBAPYbRhxQMhfU/4+XlZrfXRbufheiVs
 cD9CvIdFVE6qV9vCw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1736181833;
	cv=none; b=aekjT4DKLaq2oW7+tZ8dHOnR0CklFbe/Xe5mE7teQO0zhlhBrJsPnquieRXcbxL5wzQcpV5n+jDRuu3pX8UX7txjCfd3YwGYmCRTew6ARfpnKiM/Mu5pxwM7xoIzp4hjU0W1aszH26XIxT2UuaAqEhVZRnVyk14fEEDhqtIKZsnWF1OFjLSENKBEPTGhDX26ijW5R5a1B1lw6UY/RavQI0NslvwsjsIXE0TRb0LAiFcUhJ6pnNxiPzjzjLcYAGjIlnqW6jSmrVk0uaTHLvnxW9AcHv854X4MBF1YMrcpalLyYHCYWlZRkUD9ecYQDAD34NqPW5PaOZ22H+uPjtM+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1736181833; c=relaxed/simple;
	bh=+4x1hj9ps6pzwsUQq74ucPCLxi7RiZ/hFJlETxwnEk8=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=jbooULIeOfpTE7CL3Bbvfy48WuFDXnpu0Jn4Km5gY/0/sm+8xH+x5xZUpWWknLc+mwkWTH03YPJFtzbHchQ8i4ehahsqMArgebJxe71Sag3MS3NCJ5oRPIpBNejoI7sLK3FV9K1IAH8b9jNgWaJ0KF9rDRG4IzZtFnFPVmHOaLKeINKOEYi+ZSEGVo9Lm+ZYL4UOK8BQT7L/hfNQLtzyPoTv/jcvt1eoR0kUtZDenlSmTUGCOgacSHMXqP/lC97KTkHimQ/psElVnEUt1FFGF7nbrt5WapFNN3u8alRlYfDPzuIyGE9TwGWQwXoJRQYeMB1E6urcGn6Xe3GxbQ51rg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1736181833;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=+4x1hj9ps6pzwsUQq74ucPCLxi7RiZ/hFJlETxwnEk8=;
 b=h1TIieX5Jgf/zS+eWOCC9MqO2OjryG54TnPbwW8FMJRNH4qRAz4EwLNumhI3Ekp5Ylv3r
 pXp0TXM84Qh9r9pU/ORgE83nff1dy8kqbsHEKeQV79syzex0pRVAPy/oqbyV8gqopzReCU6
 xpJKlii8oD7kmwDPJ3tZz0QNOK4DiizTGu5eJ0LwLRjyFVAgTq/DTlvmGXi2D+R/kLM3WTu
 1KeOi14f0iomBSFh+vv0RFwHpE1YEqq2cd0+dyvqpziYzhJS5UiVJteZ891BYuN8tOLuEWW
 US0GbJ63ykjlTUtRE3TGDb5zqzvCvxoh3cssrE2wH4y7sSLQovtCiG7UInfA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 63F77280011;
	Mon, 06 Jan 2025 11:43:53 -0500 (EST)
Message-ID: <9fb63a9445831ac894e061ffd2353874f546a891.camel@sapience.com>
Subject: Re: copy-firmware.sh bug in has_gnu_parallel()
From: Genes Lists <lists@sapience.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Mon, 06 Jan 2025 11:43:53 -0500
In-Reply-To: <CA+5PVA5eHh6uQM+7ecdK3QP2WQ=5Hd_qkn_GZ1By=mD7qiQqHA@mail.gmail.com>
References: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
	 <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com>
	 <d86e6e6f50afee488d17a43979be6c8564f4e296.camel@sapience.com>
	 <CA+5PVA5eHh6uQM+7ecdK3QP2WQ=5Hd_qkn_GZ1By=mD7qiQqHA@mail.gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-cysQrORlxXXgZYUoSlpA"
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0


--=-cysQrORlxXXgZYUoSlpA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-01-06 at 11:35 -0500, Josh Boyer wrote:
> > That explains why its absent in my case.
>=20
> OK, I suspected that might be the case.=C2=A0 I'll look at adjusting the
> grep soon.=C2=A0 Accounting for per distro changes to the same package is
> always fun.
>=20
> Thanks for the report.
>=20
> josh

Terrific thanks.

One alternative could be to look instead for support of =C2=A0-j, which is
what the script seems to want.

Maybe something like:

=C2=A0 =C2=A0parallel --help | grep -Fq -- '-j n'

gene



--=20
Gene


--=-cysQrORlxXXgZYUoSlpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ3wISQAKCRA5BdB0L6Ze
25dhAQCRPv2PqyTtfeyn0rK9n87xiUOMp5KbPZs0QEsyEKTd5gD/aSI89ihGyLlP
45uVzuhzFh3JLC7K2vnZAMGtpRRGmgE=
=bZUd
-----END PGP SIGNATURE-----

--=-cysQrORlxXXgZYUoSlpA--
