Return-Path: <SRS0=HsoS=XD=decadent.org.uk=ben@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5164C369C9
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Apr 2025 20:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95869C4CEE7; Thu, 17 Apr 2025 20:17:27 +0000 (UTC)
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CAB2C4CEE4
	for <linux-firmware@kernel.org>; Thu, 17 Apr 2025 20:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CAB2C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1u5Vfi-002Qd4-1d;
	Thu, 17 Apr 2025 20:17:17 +0000
Received: from ben by deadeye with local (Exim 4.98.1)
	(envelope-from <ben@decadent.org.uk>)
	id 1u5Vff-000000007vo-0Z9r;
	Thu, 17 Apr 2025 22:17:15 +0200
Message-ID: <96202acf52b42448fcc2af2e769612be4f970c57.camel@decadent.org.uk>
Subject: Re: ish firmware is undistributable
From: Ben Hutchings <ben@decadent.org.uk>
List-Id: <linux-firmware.lore.kernel.org>
To: "Zhang, Lixu" <lixu.zhang@intel.com>, "linux-firmware@kernel.org"
	 <linux-firmware@kernel.org>
Cc: "Wang, Selina" <selina.wang@intel.com>, "Wang, Zhifeng"
	 <zhifeng.wang@intel.com>, "Han, Hemin" <hemin.han@intel.com>, "Yue, Ling"
	 <ling.yue@intel.com>, "Ma, Michael" <michael.ma@intel.com>
Date: Thu, 17 Apr 2025 22:17:07 +0200
In-Reply-To: <DM4PR11MB599510AB7F1820354A037C0193BC2@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <91d589d2c91c4c32406d27ad280a5187ca773a8c.camel@decadent.org.uk>
	  <DM4PR11MB599510AB7F1820354A037C0193BC2@DM4PR11MB5995.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-r16dNX9Fo8PWo8KKfcsb"
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-r16dNX9Fo8PWo8KKfcsb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2025-04-17 at 03:39 +0000, Zhang, Lixu wrote:
> Hi,
>=20
> Update status.
> I have created a MR to fix the license issue.
> MR: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/51=
4

Thanks for fixing this quickly.  I plan to include the ISH firmware in
the next update to Debian's firmware packages.

Ben.

--=20
Ben Hutchings
Theory and practice are closer in theory than in practice - John Levine

--=-r16dNX9Fo8PWo8KKfcsb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmgBYcMACgkQ57/I7JWG
EQmJKA//QFGo2uEDOy/2f1s4i1IAGrn8IQrFjfB5C+yLUvyM6F/P5qq0F17oXmj6
F/6zpWmxS+Mtl5THUlaAy1igHILIIPVM9bnqjHjnsvRdNJQtcmBKofIrq07BRQqr
KW7vS7F2y+Lgf1a6FhiijL9SmHW3sI8HnmE0lOTBhrURZiAZjxuiwOUy4wRRT72V
us03PhtUGDsnOw16VpvyKIJsIe/zH96faWEoKUHdpE6GIDdDO1gCAhunAAH+PRUa
uYDIMtfHNJkaELEQwqFbD2yTIk06AzHxbDsoriBe7W2O7dU/LgP4o06FWGDdOtCh
uK10YzbEtDw1ayqku+cQ03yjLxiYJ3WWkrnTUHz+owOIJI5SkBNjDdxeDPeliNRM
RBlS4FVJKBgJmAwYJKoaUB2Ww98SLT6I65O3fj7ET3cpDFGMoPA56t1dMlhcSybt
3UEPyYRA/quuzFPFBAssZvuZkzl0jSKZUt80bn9KYIWWuQasahb11u3plZqT+QTi
gDsuElfJFKXz/wvqP+wR3q199vA0eiwA4GnKxyz9M9fSdmpA5Tv7VZOaoFRYP+Jo
YWXWwRZmXEh/WeYILfDBDHXDRiEgZU4Ze7PeYE8ks6gh30VKSskIjEP3d/fxzwsa
ehAexRUjpVawMmd/U2/hb0rw2aL+bqIpCvVQ16BHLbjCbKFXfx8=
=Pnju
-----END PGP SIGNATURE-----

--=-r16dNX9Fo8PWo8KKfcsb--
