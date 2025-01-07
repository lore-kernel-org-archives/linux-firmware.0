Return-Path: <SRS0=DMer=T7=sapience.com=lists@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D91E77197
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Jan 2025 18:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE5AEC4CED6; Tue,  7 Jan 2025 18:04:07 +0000 (UTC)
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F4FDC4CEDE;
	Tue,  7 Jan 2025 18:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F4FDC4CEDE
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
	by s1.sapience.com (Postfix) with ESMTPS id 35F9D480AAF;
	Tue, 07 Jan 2025 13:03:58 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1736273038;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=iH5V5tfL+QKatmgFOSlimk4sQJl5QsnqT7xzjM3ANGI=;
 b=XhbCpWmzOXmxNfEyleblen/wu5FcQ+AbFE2J3Dj4Xe2UqaExDusqCpeuIrhZlTLqHTUvN
 vGFGqCTKYCqGg1AAw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1736273038;
	cv=none; b=qirMZXDlX80S8UG9c0AmkHG5plhO9f9V0Cdwu6G3Ra/mClgPDRvOStW2dDAJom23l+D9ZIdBcmLGWwy6gjVLkMJ0T1APy/AjAor5Rd8ojJucb/+IwoN84b09febl/a+flDYao3316wVNFnq8pTkJlFLkwXyNZnfjy3dab/jM5BblafPYzPaAwU5UHjepe0EMWniXW1v32qTlUDSvUDeIW4Imm1bPxr7JZKWZtiPNp48r8WFkd6saG7olg/2vzZgFWNFCAihmZTDMoJvjQ1F0pwixp4SSAjTNlrYRqi2E6Y/BkLdobZCQwBkn8UtQtcyRz90LpTQJYH36uM03XARd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1736273038; c=relaxed/simple;
	bh=vp1PYC4LCiud0LK+xXkIB+cAB05OqyYcnILcVgwmAeA=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=u5CwKzjuTCoqayQRyCN61oq5knOvBHjdpKcWP6f65T+s0WU4s8BkaMtVWfDWA2YB8IpUGKm3NN6gCl3yNN50xNF9+wi4mr54plW1v7F8cSInrFHUK5z8ZEsD4NMEAuoKnRbTQS361DTugo2rEcPDZH9io4u6+eQambksNtlSupgZYnZwcWTZVrCoGcYQHWoQOXo/9TSlgSapBa2pQUYgue7PxnbZlryggwk4AebgN/1ioEVjOviyOg87r+umMv1DoAsq1C/mr02q9xAjx4BP2I6rkjLCHqj/7mGkSjSHj2AYsiORm4bFL3+k3K+r1OKIAG9FdNHoV69hEIKfrTpuLw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1736273038;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=iH5V5tfL+QKatmgFOSlimk4sQJl5QsnqT7xzjM3ANGI=;
 b=Fw8ZYQKIcXaxhjc0i+DW+urS2g0TXqfpCgfz/N+drA4Y61N6yYoBPu01HbxWq/RlM+hQ1
 A+7RUihtnQVLxKeh7MfZHeNggbBcMrjIITUtXaDV8XQ4GqDg4Y3qgG+sCO8fqXv8vEE9g/4
 FH+sSkuMDgmY9WpJk9Lh6TLPSRtsWxNUHGGgAdGOczYm52V/sDLA98wEUB24MtJP/NVg3TK
 gsWxWMvPBSCdHTNy+kiHRvjvnn2vZhBPbBwgcO1SpwYNBkN6ykgN3xYg8brJ3a+ZtTrMKsS
 C+R0hLektVz4j+11LA6voRIFapiyA3gWTlQBXBA40tE32VAnPx2Mkt5j7vCA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 03F08280063;
	Tue, 07 Jan 2025 13:03:58 -0500 (EST)
Message-ID: <67227cfb4822c46abd449d8be0033bb36af03347.camel@sapience.com>
Subject: Re: copy-firmware.sh bug in has_gnu_parallel()
From: Genes Lists <lists@sapience.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Tue, 07 Jan 2025 13:03:57 -0500
In-Reply-To: <CA+5PVA4Gv5NL=64AnDzU+fE-1HSHM=_Wazhqrige9hHMV3NqdA@mail.gmail.com>
References: <1ba69d302cffb859053c38433e2fd47bf69eb1ba.camel@sapience.com>
	 <CA+5PVA5HoXfRjPJ4kZ0_okDkOx-pvVhbMH_6QSfoJYCTQxB_3A@mail.gmail.com>
	 <d86e6e6f50afee488d17a43979be6c8564f4e296.camel@sapience.com>
	 <CA+5PVA5eHh6uQM+7ecdK3QP2WQ=5Hd_qkn_GZ1By=mD7qiQqHA@mail.gmail.com>
	 <9fb63a9445831ac894e061ffd2353874f546a891.camel@sapience.com>
	 <CA+5PVA4Gv5NL=64AnDzU+fE-1HSHM=_Wazhqrige9hHMV3NqdA@mail.gmail.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
	protocol="application/pgp-signature"; boundary="=-SAepn7WGEkgMcWtSulSc"
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0


--=-SAepn7WGEkgMcWtSulSc
Content-Type: multipart/alternative; boundary="=-+nmplOaFwa4NM403vi0C"

--=-+nmplOaFwa4NM403vi0C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-01-07 at 12:35 -0500, Josh Boyer wrote:
> > ...
> > Maybe something like:
> >=20
> > =C2=A0=C2=A0 parallel --help | grep -Fq -- '-j n'
>=20
> Initially went with something like that, but decided to keep it
> simple
> after review by just looking for 'gnu parallel' case insensitive.
>=20
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/400
>=20
> Will be in the next release.
>=20
> josh

Sounds good.

thank you.



--=20
Gene


--=-+nmplOaFwa4NM403vi0C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Tue, 2025-01-07 at 12:35 -0500, Josh Boyer wro=
te:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:=
2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>...</di=
v><div>Maybe something like:<br></div><div><br></div><div>&nbsp;&nbsp; para=
llel --help | grep -Fq -- '-j n'<br></div></blockquote><div><br></div><div>=
Initially went with something like that, but decided to keep it simple<br><=
/div><div>after review by just looking for 'gnu parallel' case insensitive.=
<br></div><div><br></div><div><a href=3D"https://gitlab.com/kernel-firmware=
/linux-firmware/-/merge_requests/400">https://gitlab.com/kernel-firmware/li=
nux-firmware/-/merge_requests/400</a><br></div><div><br></div><div>Will be =
in the next release.<br></div><div><br></div><div>josh<br></div></blockquot=
e><div><br></div><div>Sounds good.</div><div><br></div><div>thank you.</div=
><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; borde=
r-left:2px #729fcf solid;padding-left:1ex"></blockquote><div><br></div><div=
><span><pre>-- <br></pre><div><span style=3D"background-color: inherit;">Ge=
ne</span></div><div><br></div></span></div></body></html>

--=-+nmplOaFwa4NM403vi0C--

--=-SAepn7WGEkgMcWtSulSc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ31sjQAKCRA5BdB0L6Ze
23AWAQCe0RdYXNjnQaW363PCWSp8qPoSO7tHpdr1cXLO+xVKHAEAo9v2OQYpCkV2
DTz0reJBd7A/cUnu6rFn12QxTCXplgE=
=+x6D
-----END PGP SIGNATURE-----

--=-SAepn7WGEkgMcWtSulSc--
