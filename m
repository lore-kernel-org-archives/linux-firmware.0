Return-Path: <SRS0=IuJ6=KF=denx.de=lukma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC501C43460
	for <linux-firmware@archiver.kernel.org>; Mon, 10 May 2021 08:54:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8F859614A7; Mon, 10 May 2021 08:54:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E686147E;
	Mon, 10 May 2021 08:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E686147E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lukma@denx.de
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 325A882B41;
	Mon, 10 May 2021 10:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1620636844;
	bh=7DRFjEUx4W7FqsZ7QYUqRFzQy1j6rTwzTG9J4h+6U38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ltG4+lZWMiBdOGLDmxMz0q/kh4epqcx4NM2s6mEVL4cfTzCAivhMkIsncEXpI+z+P
	 V9xUEbd6u8P+u6r0bwuzGph5xhNxVNOWbo+IzDyTkkWNTeI9m9utIFifkHGp0Z796i
	 6nhJmJnzJR0sdZJ8Fecs69RIn9teec29shx+BnS4YCNbm5qZIswV5e76eKOEMWPE/q
	 5WBDQCCSCtOLnc/giinECtXn7BW6FheLd6Q2XOwqp8GWdBRx4ZTPgu1L/fxDRIdN+Q
	 NEpFB3zaJtemuJ1o4zDcWZPFPlcAqL19ydT/1LRZgVfQbm8PIEUvwZKIzBvxpaEyEX
	 2cWry5HvWVzwQ==
Date: Mon, 10 May 2021 10:54:02 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, l.majewski@majess.pl, Sharvari Harisangam
 <sharvari.harisangam@nxp.com>, Ganapathi Bhat <ganapathi.bhat@nxp.com>,
 Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20210510105402.3bbc16fe@jawa>
In-Reply-To: <20210508113734.4kdyt6z6xsjtrrq2@pali>
References: <20210507151702.4848a5b3@jawa>
	<20210508112911.aigklhaw225ftwtj@pali>
	<20210508113734.4kdyt6z6xsjtrrq2@pali>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/_ztp6ME_P97gyU_cHJk96v7"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/_ztp6ME_P97gyU_cHJk96v7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Pali,

> On Saturday 08 May 2021 13:29:11 Pali Roh=C3=A1r wrote:
> > + Sharvari and Ganapathi
> >=20
> > To let you know about this mwifiex firmware issue. Could you look
> > at it?
> >=20
> > On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote: =20
> > > Dear community,
> > >=20
> > > I would like to report that the version: 14.68.36.p204 of
> > > sd8801_uapsta.bin binary (newest, SHA1:
> > > ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue with
> > > getting channel info (HostCmd_CMD_STA_CONFIGURE command
> > > execution).
> > >=20
> > > As a result the module seems to be stuck and no transmission is
> > > performed.
> > >=20
> > > The issue is not present in 14.68.36.p146 verson of the firmware.
> > > =20
>=20
> And FYI, NXP has newer version 14.76.36.p139 of this sd8801_uapsta.bin
> firmware in their mwifiex-firmware github repository:
>=20
> https://github.com/NXP/mwifiex-firmware/commit/c38b125a920a695d360b62e8b1=
f7fb1c4e1afd46
>=20
> I hope that Sharvari or Ganapathi brings some light in this issue...

Thanks for sharing this issue with NXP developers.

>=20
> Lukasz, meanwhile could you try to check if this new firmware version
> has this issue fixed?
>=20

It looks like the issue is still there (even new errors pops up when
compared to the original one):

root@mx6ul:~# dmesg|grep sdio
[   29.025231] mwifiex_sdio mmc0:0001:1: info: FW download over, size 26266=
0 bytes
[   29.310488] mwifiex_sdio mmc0:0001:1: WLAN FW is active
[   29.390778] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x242 error, result=
=3D0x2
[   29.398245] mwifiex_sdio mmc0:0001:1: mwifiex_process_cmdresp: cmd 0x242=
=20
					 failed during       initialization
[   29.707952] mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION: mwifiex 1.0=
 (14.76.36.p139)=20
[   29.717360] mwifiex_sdio mmc0:0001:1: driver_version =3D mwifiex 1.0 (14=
.76.36.p139)=20

root@mx6ul:~# ./tst_sdio.sh=20
+ wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
Successfully initialized wpa_supplicant
+ sleep 3
[  251.425350] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error, result=
=3D0x2
+ udhcpc -i mlan0
udhcpc: started, v1.31.1
udhcpc: sending discover
[  256.476210] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error, result=
=3D0x2
udhcpc: sending discover
udhcpc: sending discover
[  261.497057] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error, result=
=3D0x2
[  261.507859] ieee80211 phy0: sched_scan start : n_ssids=3D1 n_match_sets=
=3D1=20
[  261.515872] ieee80211 phy0: n_channels=3D13 interval=3D10 ie_len=3D0


Please pay attention to the new "cmd 0x107 error, result=3D0x2" issue with
this new FW version.

> > > For reproduction one needs to execute:
> > > #! /bin/sh
> > > set -x
> > > wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > sleep 3
> > > dhclient mlan0
> > >=20
> > > exit 0
> > >=20
> > >=20
> > >=20
> > > I'm using the Azurewave AW-NM191NF module (with 88W8801 SoC).
> > >=20
> > > Best regards,
> > >=20
> > > Lukasz Majewski
> > >=20
> > > --
> > >=20
> > > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194
> > > Groebenzell, Germany Phone: (+49)-8142-66989-59 Fax:
> > > (+49)-8142-66989-80 Email: lukma@denx.de =20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/_ztp6ME_P97gyU_cHJk96v7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmCY9KoACgkQAR8vZIA0
zr1LhggAixxAr5r41/DEk+4tI8H8LhDBtRvlNN5Ftd6sVLU6utqIh/xJIRnBvvW/
R2+rSFd1U/gv21fnZfWt+wZJh2Gs7V2qQq3McxH0oPn3NJAPdg4LWjyBuG37d7C4
0k8UjoyR+zUECVsVYNhcG3uIvd/TVpfWB5Q0C2TsptCh/XxvzGobejLKyJre/lQH
gww8IWknht4x27UQB5EusxOEbMuRqvNSRii1MsNY/1EBTFtL1j/XqKzzT/F2Dkog
RPYGp/HwNDjZWmjk1CoL3y0YKbXLcry5IwqaqdJNHtbSGCBWjWGizl4rT6mKwzkr
Kt67llla14IWLKFNVpcXImQ7ViBoZA==
=O328
-----END PGP SIGNATURE-----

--Sig_/_ztp6ME_P97gyU_cHJk96v7--
