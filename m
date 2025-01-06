Return-Path: <SRS0=l6Vx=T6=sapience.com=lists@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EB8E77188
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 16:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56941C4CEE4; Mon,  6 Jan 2025 16:00:58 +0000 (UTC)
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2509C4CED2;
	Mon,  6 Jan 2025 16:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2509C4CED2
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
	by s1.sapience.com (Postfix) with ESMTPS id C0E00480A13;
	Mon, 06 Jan 2025 11:00:54 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1736179254;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=gpAF87nXSjTBXaXiMK5rmFA3PyC+roZmbPdw+GHl+ZU=;
 b=OW3AVN1KudR2hbGZu4257AI4DXzZJPgS0JGDFb4s+lsM1Fc3HHl87Yatv9NrJxsRwgFIq
 Nmq0H4Pfr3PpWJ2CQ==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1736179254;
	cv=none; b=cbYuQrbfxj5ILDGNwn/cOafV/wPOGSMqcP9ODP1T0dJHUn4ftIb5tr/Dw1wZWJxV7gXSob9cQycDgDUTAYtm7AM7XR5lfJ2yt2/DX/9ZbfP0ACXwxOM7zUbXR9e5VCxgTBZdWJAuwMYnEUXg0DsSvubf3Za2bPvkN2wnSl85nRDEU+DgTFydmNoFVTiqmu585xE+BoACq7YSRH/x2aFAx/s5GGMX8c4Ch+IIENmnu6x5EogGVKeUiI61hP76LCqf+7VJPo5sDbO3wKc/9KoJ3b3+FA/4COxMWQGSEpiswIVVLsfJ6OmdENLcV82rUk4G4vGHo2HQSqn1yun1aDbXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1736179254; c=relaxed/simple;
	bh=gpAF87nXSjTBXaXiMK5rmFA3PyC+roZmbPdw+GHl+ZU=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
	 MIME-Version; b=yMk6LiagKEATaC7psd2GWpQSwMNtV7dHVQxIfN8hDFmdMfHgUzxlq56bJDGE+WIHA7i4tml/H7BaCQ3ClJVBPqJ671ixDh+3Lpq8oK9RGoyeDjmfvu3uludyW/F7JMEWANekJRlI/uihRysWhB7T0b8sbyVpoJFfXDrMWTXLje/n2SyUbXoeOKAeeP+tKnfh2UunaCr+2K5ElEk55DH5SuMNn8wRLDhFblNgcNMA42oTZ00FyHsLgaD8+oOE3d+T9SeXTQLl83FOco4BmFi8Ezj9kVA/1rnKcmu/PuBtUWTJLeobojU7amKadDx/3lIDuAls+a+0GxxK3MFJNKHMnA==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1736179254;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=gpAF87nXSjTBXaXiMK5rmFA3PyC+roZmbPdw+GHl+ZU=;
 b=DSQF3eQbRfD+1TlGBfnYe5x2/8DW0P+R0fP9w2xyMj/MaodrCslsOM2QH6VPLKQpSrRfD
 lyFlycxeGXOBr1DM887/GuOQD8o95H34A5gT2bhyslW4rjkG2rqUTxEjFvNX8TyFDsWlcQF
 V7rUsgs7KhU3JU3yz3Lt07W73plO8Rkx4f4TJgphioNE/f9hMuQ8X2Z8GM/V9+yS0CZSLFx
 uMhf8LBJsVv2aKfYQeqnZNtsHdu5rfS3SF70X7yTkMLIcEQB2vXKG1F6bLtiGuowrun6ytp
 o8GxlAHxoT8ARjKaqNaj0Yl8Fd31ed0YqbtHkyWp1BHkd13NFR4YmxmokmbA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by srv8.sapience.com (Postfix) with ESMTPS id 9201E280011;
	Mon, 06 Jan 2025 11:00:54 -0500 (EST)
Message-ID: <d86e6e6f50afee488d17a43979be6c8564f4e296.camel@sapience.com>
Subject: Re: copy-firmware.sh bug in has_gnu_parallel()
From: Genes Lists <lists@sapience.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Mon, 06 Jan 2025 11:00:54 -0500
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
	protocol="application/pgp-signature"; boundary="=-Cc1RnklmfqCEC7L3kx2g"
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0


--=-Cc1RnklmfqCEC7L3kx2g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-01-06 at 08:02 -0500, Josh Boyer wrote:
> When using programs that use GNU Parallel

I checked the Arch build [1] and it has a patch to remove some
"citations" =C2=A0including the text you shared.
That explains why its absent in my case.

gene


[1]=C2=A0https://gitlab.archlinux.org/archlinux/packaging/packages/parallel

--=20
Gene


--=-Cc1RnklmfqCEC7L3kx2g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ3v+NgAKCRA5BdB0L6Ze
2/F6AQCZqjGqZ4WQ1NuDZZxI/aD/HajFdOyDX6RlNXJcejmqQwD+IFq+6PL0t8P5
L083tzQULHEmX99Ormpa6JYnTPhpoQ0=
=/uv5
-----END PGP SIGNATURE-----

--=-Cc1RnklmfqCEC7L3kx2g--
