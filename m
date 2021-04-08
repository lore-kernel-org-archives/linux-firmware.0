Return-Path: <SRS0=0Sh3=JF=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF4BC433ED
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Apr 2021 16:01:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5DACB60FF1; Thu,  8 Apr 2021 16:01:27 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id D2B5B610F8
	for <linux-firmware@kernel.org>; Thu,  8 Apr 2021 16:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2B5B610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id 00FC8E78F3
	for <linux-firmware@kernel.org>; Thu,  8 Apr 2021 18:01:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmQVMfNl1OZp for <linux-firmware@kernel.org>;
	Thu,  8 Apr 2021 18:01:23 +0200 (CEST)
Received: from photino.stro.at (217-149-172-158.nat.highway.telekom.at [217.149.172.158])
	by baikonur.stro.at (Postfix) with ESMTPSA id 5A1DAE0630
	for <linux-firmware@kernel.org>; Thu,  8 Apr 2021 18:01:23 +0200 (CEST)
Date: Thu, 8 Apr 2021 18:01:21 +0200
From: maximilian attems <maks@stro.at>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: simple fix for missing rtl8821a config file
Message-ID: <YG8o0cMVPS113OuK@photino.stro.at>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Lzk7JIfLh9BAkQo"
Content-Disposition: inline


--3Lzk7JIfLh9BAkQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Please pull from main for single commit

gitolite.kernel.org:pub/scm/linux/kernel/git/maks/linux-firmware.git
  =20

with minimal fix concerning the aformentioned rtl8821a bug:
https://lore.kernel.org/linux-firmware/YCKZE3lhjtOdUT0i@photino.stro.at/T/#u



=46rom 4374e10e2605957f7b1ae711c665914e70853a46 Mon Sep 17 00:00:00 2001
=46rom: maximilian attems <maks@stro.at>
Date: Sun, 14 Mar 2021 17:46:46 +0100
Subject: [PATCH] WHENCE: link to similar config file for rtl8821a support

linux-firmware ships no config file for rtl8821a, as it seems
quite similar to rtl8821c add symlink to that config file
see https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1784835
(Maintainers may replace with proper file).

fixes: https://bugs.debian.org/893912

-- error
[    2.574742] Bluetooth: hci0: rtl: loading rtl_bt/rtl8821a_config.bin
[    2.575137] bluetooth hci0: firmware: failed to load
rtl_bt/rtl8821a_config.bin (-2)
[    2.575143] bluetooth hci0: Direct firmware load for
rtl_bt/rtl8821a_config.bin failed with error -2
[    2.575145] Bluetooth: hci0: Failed to load rtl_bt/rtl8821a_config.bin
--

-- with config file
[   26.389532] Bluetooth: hci0: RTL: rtl: examining hci_ver=3D06
hci_rev=3D000a lmp_ver=3D06 lmp_subver=3D8821

[   26.390623] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D1

[   26.390624] Bluetooth: hci0: RTL: rtl: loading rtl_bt/rtl8821a_fw.bin

[   26.392597] bluetooth hci0: firmware: direct-loading firmware
rtl_bt/rtl8821a_fw.bin
[   26.392605] Bluetooth: hci0: RTL: rtl: loading rtl_bt/rtl8821a_config.bin

[   26.392748] bluetooth hci0: firmware: direct-loading firmware
rtl_bt/rtl8821a_config.bin
[   26.392757] Bluetooth: hci0: RTL: cfg_sz 10, total sz 17438
--

Cc: Max Chou <max.chou@realtek.com>
Reported-by: Kate Komi <katahipo@gmail.com>
Signed-off-by: maximilian attems <maks@stro.at>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index f279af1..ea89177 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3680,6 +3680,7 @@ File: rtl_bt/rtl8723bs_config-OBDA8723.bin
 File: rtl_bt/rtl8761a_fw.bin
 File: rtl_bt/rtl8812ae_fw.bin
 File: rtl_bt/rtl8821a_fw.bin
+Link: rtl_bt/rtl8821a_config.bin -> rtl8821c_config.bin
 File: rtl_bt/rtl8822b_fw.bin
 File: rtl_bt/rtl8822b_config.bin
 File: rtl_bt/rtl8723d_fw.bin
--=20
2.30.2



--3Lzk7JIfLh9BAkQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtitdpKMURvAU+NZkECUuZTqR5ScFAmBvKMkACgkQECUuZTqR
5SdnSA/+IQ5OXAMlrtkwcNupnsunzriNYsvVWxpmiq3xPzQDvJSbS2FjUja+JR81
Y+EerXYCRYFrlCWDx/rFe1qUu9XDyVq7Q5xwKtltGuqTaiXmPztY6M5WInnDM7KB
MrD8JAcuXA1uTfXuAdjlsg2MgRt7WihhpoYs4LsxS3z/OpR4nJGLEq1fgxH0GN5C
wBZ/sT800difrm7nFcYsZ/wqwIOQZFPAae+BN795e0Mg55p4h8FG7vwMonKfJE/0
acd0C2BU2Dv1zyQ/adewcYXmD/ls71XQsHvwkuhHTE+/5i6Q7prZ7AHBf63Em/rZ
jkoPNaqtCGP5dcal8Jv+IBF7yorfE36knmrbokOjgucVoIQcscm4Y2lv5wOCZ7uM
Jzpj+s1KS2Ob57brtOx1h4FyyG8nvdDKqcEALGrdF6RhIfTDFiHUOGkOYEI4FxWV
JNICV4FtFZrf5jILc2AjwFNKYEuCvSDcZuKA98QUBjJxiuQeSQQtcydLWVONZ+8m
cdYQJTUPNcFq9qQokBcU1awdlt/Lu33N8P4YTeyD4UDcAuBK3Zj1lOYYPoTwHWHn
s1jcLNvMlBK1JArswPXvBIyCsGgti0Sbjrtz4c0PSvZmdkOpFcp6mrpkV1+DtkcY
BWnRyad+BpPZtuz2LZ0rFqryHwVIyjCQzxi3CdUkzIgR3DuarWo=
=MMpF
-----END PGP SIGNATURE-----

--3Lzk7JIfLh9BAkQo--
