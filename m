Return-Path: <SRS0=fwJh=HS=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C595C433DB
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Feb 2021 18:46:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E1E4264E41; Tue, 16 Feb 2021 18:46:24 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id 9BCC164E2B
	for <linux-firmware@kernel.org>; Tue, 16 Feb 2021 18:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BCC164E2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id 851FAE77B5;
	Tue, 16 Feb 2021 19:46:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfwFzx_oMDHq; Tue, 16 Feb 2021 19:46:22 +0100 (CET)
Received: from photino.stro.at (unknown [77.241.229.232])
	by baikonur.stro.at (Postfix) with ESMTPSA id D641EE05F3;
	Tue, 16 Feb 2021 19:46:21 +0100 (CET)
Date: Tue, 16 Feb 2021 19:46:20 +0100
From: maximilian attems <maks@stro.at>
To: 982579@bugs.debian.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bernhard <bewoern1@gmail.com>, vagrant@debian.org,
	linux-firmware@kernel.org
Subject: Re: Bug#982579: Solution for loading firmware
Message-ID: <YCwS/PcGa4uaQQsd@photino.stro.at>
References: <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <cbcb1fabd3a005142216213ca67c1a1664b7958a.camel@gmail.com>
 <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <YCtw7RaNEyod8mxb@photino.stro.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aQahmEjWV155kiEm"
Content-Disposition: inline
In-Reply-To: <YCtw7RaNEyod8mxb@photino.stro.at>


--aQahmEjWV155kiEm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > 1. Copy file brcmfmac43430-sdio.AP6212.txt from upstream to lib/firmwar=
e/brcm
>=20
> so indeed it is a bug that we don't ship this one from upstream,
> will fix this in next Debian upload.

this needs to go in the debian git, will do soonish. (:
=20
> > 2. Create symbolic link named brcmfmac43430-sdio.sinovoip.bpi-m3.txt to=
 the AP6212-file

I am confused by this, as you did *not* submit an error log that showed
a request for this file, is this to add support to another device,
please be specific.

> > 3. Create symbolic link named brcmfmac43430-sdio.sinovoip.bpi-m2-ultra.=
txt to the AP6212-file
> this should be reported upstream, so that everyone takes advantage of
> it, hence adding linux-firmware mailinglist on Cc, happy to cook up
> a patch next 24hs.

sent, to add that symlink upstream.


thank you!

--=20
maks

--aQahmEjWV155kiEm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtitdpKMURvAU+NZkECUuZTqR5ScFAmAsEucACgkQECUuZTqR
5SfM7xAApBKEmXXx07mhWLXJ1XBE8IIjIZ5gxypiN/WBaIWwdIT22zPHnt6X+8wO
0erI4y8v4uVebQVohDVKd9lkwAL6A7FbYyAoMgABOqDNQEl5U2Zcqxz8l/DbIj1z
3Dpnoqvfub6qbgX9pyurTKLg1oeUWJ5XZsPr1SYl5PhQ7mKfyaMo6mBapkde8BbI
fOcqhlWZ6l7129zrC4RUgx3A86Ljr5vXsKvYsaDjKxsth0Z2yiuFAcEtSTeVi7B+
v16p84WNOzXdkj3c7s6nn5s4k/kEhVRw7URLIDoB96xyarGdX333QPU2NT4G78zy
ENHKPe1Q8/euC2XFzNS8hHtLqKDohZIH8CvrqnudO0t0ZIYHyOMVvmYFE0PUzcyR
9SlgYkv8Q7mkWxhlAlKgqeezwdlf9RlmD1p6hz+LCGZqdfkg6J0QYeIogVK5/dlZ
r85rC+aNsAwn4J3BS3NNCMn35X8sXy3UrVBVw61IY3PDKCwET3PSeouJplZVnNPA
JaXPEB2hLUvS7LI7HXUNWG9XTx63rTiu8JMcuHor5a6q9n1IRzOUk58N1/5I7I6s
DI57gWhVuZG2qMxJtJpRue8kwfQ2GQR8ebewfpvmAAeaRLC/KIYAn1vT8GZ8jHne
aCffjIDee1OR7FUx4bLNyN4JNbyOkwym2CqYBsXr5nyGgXzafME=
=EE6G
-----END PGP SIGNATURE-----

--aQahmEjWV155kiEm--
