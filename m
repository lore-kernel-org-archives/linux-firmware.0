Return-Path: <SRS0=fTxe=KC=denx.de=lukma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37086C433B4
	for <linux-firmware@archiver.kernel.org>; Fri,  7 May 2021 13:17:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 06D3561042; Fri,  7 May 2021 13:17:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05A56143F
	for <linux-firmware@kernel.org>; Fri,  7 May 2021 13:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05A56143F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lukma@denx.de
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2759482E39;
	Fri,  7 May 2021 15:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1620393424;
	bh=rES6YiN3PAxO2llsijUm6XVf2mxS8ne032ZE0oj4q6Y=;
	h=Date:From:To:Cc:Subject:From;
	b=z16yhKyL2K5XE7MHoV+2Xf2QyDFqA3G+5jApOe75qv0jL+pL6Yj54TJXeQpegvSX7
	 rpafY8XOxU+p8oIO/JZxcMmtOuQu/ZMIB2iY3FUgPQEs8LYrhDGECQKsYzV4VYYGzV
	 pfAsSVqhqC2+5oy319z1iqjlTU03B+T3d/YQ5ZETw5BQDuX0v6NdPyFi3jS0IGpvXx
	 0rtkOTnfCc5LZEUNprAPCHdwLABer2OqK4PjKbOsjGKY3CZ4NPUhk9LcZ5JodjcEWW
	 EM1MGsynXlW1Bp1Zyu2e2Y9K6N95Aq90awX/lOfqf+0B2Xs4hT3GWpRx2AFvN5MDg2
	 FH1Mn29WKz2BQ==
Date: Fri, 7 May 2021 15:17:02 +0200
From: Lukasz Majewski <lukma@denx.de>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: l.majewski@majess.pl
Subject: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20210507151702.4848a5b3@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/Fc_+5RSZ/.XAaiIm7l7fso."; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/Fc_+5RSZ/.XAaiIm7l7fso.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear community,

I would like to report that the version: 14.68.36.p204 of
sd8801_uapsta.bin binary (newest, SHA1:
ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue with getting
channel info (HostCmd_CMD_STA_CONFIGURE command execution).

As a result the module seems to be stuck and no transmission is
performed.

The issue is not present in 14.68.36.p146 verson of the firmware.

For reproduction one needs to execute:
#! /bin/sh
set -x
wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
sleep 3
dhclient mlan0

exit 0



I'm using the Azurewave AW-NM191NF module (with 88W8801 SoC).

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Fc_+5RSZ/.XAaiIm7l7fso.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmCVPc8ACgkQAR8vZIA0
zr0Negf/cl3qcb9QsWUN6FoOaBz1A52pQgcjTsS22MtaLC/LM1ye8Ca9J/jGg7u0
OuaHWdTO6t2D/UT6oNsOPzkvmGFR06A2Wpt4e0UFS3gzsvLQECshBX6JEvsJOluD
tWZrgSJcnmNZI4yN9MSiQaB3HRp+exeRAKPuaO2lYXLlOFCfXoMTuZ5M3B/A30mc
NV28kzELC3ewi6RTO/AiYfFuYFTYcRutSTHEz24P1trhY8ccZdWXu/7yFK/V+8qz
UMIpoxu9tyPLRIjHXrIryHmxg0ZfusqKvUt8/plzvswS8Rzwdm/AYbWT0KK4YNTv
kSHfvtZARStLdPXhJSBY/jGaxTPO4Q==
=vcmo
-----END PGP SIGNATURE-----

--Sig_/Fc_+5RSZ/.XAaiIm7l7fso.--
