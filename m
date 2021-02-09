Return-Path: <SRS0=Vf9v=HL=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B35C433DB
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Feb 2021 14:22:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 982FB64E66; Tue,  9 Feb 2021 14:22:10 +0000 (UTC)
X-Greylist: delayed 377 seconds by postgrey-1.34 at mail.kernel.org; Tue, 09 Feb 2021 14:22:09 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E27C964E4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id E27C964E4F
	for <linux-firmware@kernel.org>; Tue,  9 Feb 2021 14:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id 3CD8CE7789;
	Tue,  9 Feb 2021 15:15:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10pVQf1BevEP; Tue,  9 Feb 2021 15:15:49 +0100 (CET)
Received: from photino.stro.at (unknown [194.12.158.120])
	by baikonur.stro.at (Postfix) with ESMTPSA id B33CDE0610;
	Tue,  9 Feb 2021 15:15:48 +0100 (CET)
Date: Tue, 9 Feb 2021 15:15:47 +0100
From: maximilian attems <maks@stro.at>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, 893912@bugs.debian.org
Subject: missing rtl_bt/rtl8821a_config.bin
Message-ID: <YCKZE3lhjtOdUT0i@photino.stro.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lw0PjMO7mOo0+CvD"
Content-Disposition: inline


--lw0PjMO7mOo0+CvD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear Yang,

Would it be possible to add rtl8821a_config.bin config file?

According to two bug reports, current state results in the following
failure:
--
[    2.574742] Bluetooth: hci0: rtl: loading rtl_bt/rtl8821a_config.bin
[    2.575137] bluetooth hci0: firmware: failed to load
rtl_bt/rtl8821a_config.bin (-2)
[    2.575143] bluetooth hci0: Direct firmware load for
rtl_bt/rtl8821a_config.bin failed with error -2
[    2.575145] Bluetooth: hci0: Failed to load
rtl_bt/rtl8821a_config.bin
--

According to bug reporter symlink of rtl8821c_config.bin to
rtl8821a_config.bin (
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D893912#32 )
solves the issue.
Or do you have this specific files and could push it upstream to
linux-firmware?


Thank you in advance.

--=20
maks

--lw0PjMO7mOo0+CvD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtitdpKMURvAU+NZkECUuZTqR5ScFAmAimQkACgkQECUuZTqR
5SfXjA/+M9EfgTdfrCZofPRrJRwokEDHuQbrb4XrMcnbRefeVWoGnXYYTSh5kxCR
G2HdMoPPixq0ApFy4xT0DW9grdA75SAWiieV7Lds1xDdzwDwtoX+MUPzHLXWm4I/
NAbBHv2h0ox7CzP9Pe5IH/xEFGCN/ujLBQovc01elZFGwLrgbcv1qm0H+bEUP96i
8N4cFxVJmFusmq/oT/2cSfy/m6LzufGgFC5CwyHsXxyBQRFYIgRva52gEcFenAZs
bwxjax3FVJEp7hWr9C5IFB/u3lWinET+IWKWZ7KHu3aEU2hK3zfxlrrcDc/AGpj6
GfyeXyx8u4t1f5n42NANjspTkcwCQnoDR2PYmlsP2jcsIJYJYVj2js/t4azbMLmx
ENk1gIs2VVCxWlTP74Lqnq/RXfitkdceUahRgkgZ6KKurCttixo32qKDEtdRZZXp
xY1zzWDVQ1ZojaF0jE9t1f97X5wFFOgh1nPMRA4SzRdCZyXPeLw8IkcwT1bSIkcK
dG8TdVC9ip766vvOP7E0QQSUKkXo9SNVyB9k3QdVrhelXtexzTk8JIgl/ldVrBlY
PHQcGfKp8AYVG6HBmOKvpftI2ARpvmfQRn5K/CFAQVPsji4jPvXrkmF/faw840mt
/4FCk1A31jaiJsh13HFw/sDH+4zAFIi4F9OndtWkfO57FPH+rn0=
=cmuf
-----END PGP SIGNATURE-----

--lw0PjMO7mOo0+CvD--
