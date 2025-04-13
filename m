Return-Path: <SRS0=yDqv=W7=decadent.org.uk=ben@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A44FC3601E
	for <linux-firmware@archiver.kernel.org>; Sun, 13 Apr 2025 16:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49A82C4CEE5; Sun, 13 Apr 2025 16:00:57 +0000 (UTC)
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81F04C4CEDD
	for <linux-firmware@kernel.org>; Sun, 13 Apr 2025 16:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81F04C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=decadent.org.uk
Received: from [2a02:578:851f:1502:391e:c5f5:10e2:b9a3] (helo=deadeye)
	by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ben@decadent.org.uk>)
	id 1u3zlG-001i5m-2V;
	Sun, 13 Apr 2025 16:00:45 +0000
Received: from ben by deadeye with local (Exim 4.98.1)
	(envelope-from <ben@decadent.org.uk>)
	id 1u3zlE-00000001gEc-0fKj;
	Sun, 13 Apr 2025 18:00:44 +0200
Message-ID: <91d589d2c91c4c32406d27ad280a5187ca773a8c.camel@decadent.org.uk>
Subject: ish firmware is undistributable
From: Ben Hutchings <ben@decadent.org.uk>
List-Id: <linux-firmware.lore.kernel.org>
To: hang Lixu <lixu.zhang@intel.com>, linux-firmware@kernel.org
Date: Sun, 13 Apr 2025 18:00:29 +0200
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TPR3vW8ZB7ZJZnIwkn8S"
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1502:391e:c5f5:10e2:b9a3
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false


--=-TPR3vW8ZB7ZJZnIwkn8S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

It seems like no-one actually read LICENCE.ish, because it says:

> 3 CONFIDENTIALITY. The terms of this Agreement and the=20
> Material are Intel confidential information and subject to your=20
> valid corporate non-disclosure agreement with Intel (CNDA).=20
> Except as authorized in Section 2.1, you must not disclose this=20
> information to anyone, including the U.S. government. This=20
> Agreement will not become effective, or will automatically=20
> terminate, in the absence of a CNDA. This Agreement will take=20
> precedence in the event of a conflict with the CNDA.

So not only should the firmware not have been sent to linux-firmware
under this licence, but the licence text itself should not have been
sent either.=20

Please either fix the licence terms or remove this firmware.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-TPR3vW8ZB7ZJZnIwkn8S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmf7350ACgkQ57/I7JWG
EQkUxRAAm1yADDeMvc6SLt8Tmwh63mmCfFQ9OlC0Os59BICG1AWeV4Y4VswMLpxF
4hEKZ5m/KMMnfuNZcXRJB5lSGEIcKtCgOfBshoUDeX6t9E8hWAx2Uy24qYfMwk1d
O0jCXxKAVFB+Rftbu7s8UtGZJa99iic7LRuJ9EYUCBcRMrxiWPXLcofnyEZsMNNi
o88j/fvA0/XA0YD4TKnynh5hco7ZOBH7K0w0EmnP6vP+/wt1N1jw6Da5LSHO+ory
2zL1QzuzRM/ywOnXv2v0HdXIrFCDmXC+e8fweiFLa0nKnXfBm8UZw3DCOM9zepW8
v9rawz0lQf3ucdvJrK3EtsllUrevNSnr5dVbKnAydq0GI7+GHkKMI/Xz3VBDK471
Lud9gpwHDjzyggJwh8Nh9+P5fXB0fkRck6fCIcJ46aWtnxxQ0l5cGZzF/SEygQdG
Xfj5cIRcA38THKYDhSc8eG8CAWnPJmM9CkcnJh8EbmreJzr+9MfZjxeyo/YJXICK
WHS5XIu+M/Ufdm699CPMcC6TQSK6BaS6yislDTod1ZoeZWwAGiwLdBf7Rvi4MsU/
tDysFpMw4hcaRh/+HnABAj8KvY+WRwkS9hZIOS/4MJ2p7fByR3lFgS5Vx0/4GEFD
4Eu86oL8/gvqkIXT/52eMY5xwWBr6PvpVgbM2XQI0A6AqS14SKI=
=DQzB
-----END PGP SIGNATURE-----

--=-TPR3vW8ZB7ZJZnIwkn8S--
