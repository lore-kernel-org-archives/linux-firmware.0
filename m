Return-Path: <SRS0=fwJh=HS=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77279C433E0
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Feb 2021 07:14:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4388E64DA3; Tue, 16 Feb 2021 07:14:59 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id B5F6D64DDA
	for <linux-firmware@kernel.org>; Tue, 16 Feb 2021 07:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5F6D64DDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id AFB1AE7680;
	Tue, 16 Feb 2021 08:14:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g43cnpFr-tN0; Tue, 16 Feb 2021 08:14:56 +0100 (CET)
Received: from photino.stro.at (217-149-169-44.nat.highway.telekom.at [217.149.169.44])
	by baikonur.stro.at (Postfix) with ESMTPSA id A30A9E0629;
	Tue, 16 Feb 2021 08:14:55 +0100 (CET)
Date: Tue, 16 Feb 2021 08:14:53 +0100
From: maximilian attems <maks@stro.at>
To: Bernhard <bewoern1@gmail.com>, 982579@bugs.debian.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: vagrant@debian.org, linux-firmware@kernel.org
Subject: Re: Bug#982579: Solution for loading firmware
Message-ID: <YCtw7RaNEyod8mxb@photino.stro.at>
References: <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <cbcb1fabd3a005142216213ca67c1a1664b7958a.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h5E+GRZFN1cQ6HXu"
Content-Disposition: inline
In-Reply-To: <cbcb1fabd3a005142216213ca67c1a1664b7958a.camel@gmail.com>


--h5E+GRZFN1cQ6HXu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear Bernhard,

Thank you very much for your clear and helpful report!

> I tested the following:
>=20
> 1. Copy file brcmfmac43430-sdio.AP6212.txt from upstream to lib/firmware/=
brcm

so indeed it is a bug that we don't ship this one from upstream,
will fix this in next Debian upload.

> 2. Create symbolic link named brcmfmac43430-sdio.sinovoip.bpi-m3.txt to t=
he AP6212-file
> 3. Create symbolic link named brcmfmac43430-sdio.sinovoip.bpi-m2-ultra.tx=
t to the AP6212-file

this should be reported upstream, so that everyone takes advantage of
it, hence adding linux-firmware mailinglist on Cc, happy to cook up
a patch next 24hs.
=20
> After that, the wlan0 interface is available and scanning of the WLAN-ESS=
IDs works.

great!

=20
> Please either do it like described above or add the files directly instea=
d of the symbolic links.

The symbolic links are better than duplicated files, but there seem to
be on the Debian side an opened can of trouble on them, see #982757
(I'll post there soonish)
=20
Thank you for the kind words, the test and your report!

--=20
maks

--h5E+GRZFN1cQ6HXu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtitdpKMURvAU+NZkECUuZTqR5ScFAmArcOUACgkQECUuZTqR
5Sc5QQ/+O/5HXo6P0s9H3RhNBLjA4jTkVVuwAvGjM1PmBZ6NDPkJXzwtW4Jw4ilF
H1ZADfp6uUTlYgFmWBDyh1s+3tQztNdPeomEjz7tQabuZAh6AzS8mNo0G/1FfIbL
p510SGaELqqLXdeh/8JM0lsDIpa36+cUSGnBnBF7+6hSNkQIZILtTTuOcSpqdSiC
XYBfSkI074mUXVsAaDt6ndDKgJj0tbtBepoTBhys1AbjfNUYYUskEQ4ajzVdS68+
qXVRtJpWVzETruB/kiULZ91M26Yyepc2BZjMUDqVeLTsWvSaLgC3uHW9Jt/CUziy
y9lorubs2YqycyiUbYTejsk1O+CJNCoqJmnivAo2FBQqNkUBHn6PjpWifl6dyI/E
ScL0Z5mrmHYLf0vv1ba3OJQmHourTmS3Fkh8phWe+RPGsfPGkARaPfPZfsfE87Ar
+LmoOCpAN4U3ZFWXHV360TA5M/Vd4H5/QZI2plvvfgY14gWooZEvLp4JhfxqWX06
pt9ZUfNSjv15TWhN/O9JQy6FfeweATGOoP4mgvliEbsWLg+f5w/NPUtnvyZM/4QM
h/2mgMMZSMp4Yo4hNjWVXzYRnyIlHU34mmel7/OG75HYUmbspqL9w7/+ms09TCdp
B7YjSIjBBQkOusbp+mE+RaVtq/8uzJHECo5R9xXCjYRdKJfH9J0=
=DFZN
-----END PGP SIGNATURE-----

--h5E+GRZFN1cQ6HXu--
