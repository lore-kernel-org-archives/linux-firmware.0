Return-Path: <SRS0=+QvP=KT=denx.de=lukma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3AFC04FF3
	for <linux-firmware@archiver.kernel.org>; Mon, 24 May 2021 12:58:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6435B613B0; Mon, 24 May 2021 12:58:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE7D611CE;
	Mon, 24 May 2021 12:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE7D611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lukma@denx.de
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1889082E91;
	Mon, 24 May 2021 14:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1621861103;
	bh=/y4uPeHVIdugTOvG0cA9UMwNjcF6UnMUJzAyN+oGERM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QeOg0HSW6bmAAmTTtuycaB07bddFzikuGnB3pUDfGVLnJaDnnGt3C644jjk4+eYY1
	 9ppmhKZXZ948LJVT5DDlncFMZP+mhKPp4171y183xS1OzpLGIS0FIX3f16bJbLYM9K
	 8zMXXl+PFxfe3ku30tIvw5zeN1iVb0iM2oVqDyPM82ds9TBZGwksbx5scyhXJJkEWZ
	 5bPuhJani6DwfqWYOA12jbj0BshrRx64axtodwH/xxXY8fimUBOmJtmxJaH36wnC8A
	 /yP7P6ZhhsO/QrPWhVmBWpvaZFm94lb8DC5a1+QK37UkVXKwWKVOdoEMFwWH7izz0N
	 6zi9ylb9odV2w==
Date: Mon, 24 May 2021 14:58:22 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>, Ganapathi Bhat
 <ganapathi.bhat@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, linux-firmware@kernel.org,
 l.majewski@majess.pl, Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20210524145822.5ac95365@ktm>
In-Reply-To: <20210510105402.3bbc16fe@jawa>
References: <20210507151702.4848a5b3@jawa>
	<20210508112911.aigklhaw225ftwtj@pali>
	<20210508113734.4kdyt6z6xsjtrrq2@pali>
	<20210510105402.3bbc16fe@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/bhF0.esFXNFn.GevDR0_y2n"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/bhF0.esFXNFn.GevDR0_y2n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dear Ganapathi and Sharvari

> Hi Pali,
>=20
> > On Saturday 08 May 2021 13:29:11 Pali Roh=C3=A1r wrote: =20
> > > + Sharvari and Ganapathi
> > >=20
> > > To let you know about this mwifiex firmware issue. Could you look
> > > at it?
> > >=20
> > > On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote:   =20
> > > > Dear community,
> > > >=20
> > > > I would like to report that the version: 14.68.36.p204 of
> > > > sd8801_uapsta.bin binary (newest, SHA1:
> > > > ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue with
> > > > getting channel info (HostCmd_CMD_STA_CONFIGURE command
> > > > execution).
> > > >=20
> > > > As a result the module seems to be stuck and no transmission is
> > > > performed.
> > > >=20
> > > > The issue is not present in 14.68.36.p146 verson of the
> > > > firmware.=20
> >=20
> > And FYI, NXP has newer version 14.76.36.p139 of this
> > sd8801_uapsta.bin firmware in their mwifiex-firmware github
> > repository:
> >=20
> > https://github.com/NXP/mwifiex-firmware/commit/c38b125a920a695d360b62e8=
b1f7fb1c4e1afd46
> >=20
> > I hope that Sharvari or Ganapathi brings some light in this
> > issue... =20
>=20
> Thanks for sharing this issue with NXP developers.
>=20
> >=20
> > Lukasz, meanwhile could you try to check if this new firmware
> > version has this issue fixed?
> >  =20
>=20
> It looks like the issue is still there (even new errors pops up when
> compared to the original one):
>=20
> root@mx6ul:~# dmesg|grep sdio
> [   29.025231] mwifiex_sdio mmc0:0001:1: info: FW download over, size
> 262660 bytes [   29.310488] mwifiex_sdio mmc0:0001:1: WLAN FW is
> active [   29.390778] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x242
> error, result=3D0x2 [   29.398245] mwifiex_sdio mmc0:0001:1:
> mwifiex_process_cmdresp: cmd 0x242 failed during       initialization
> [   29.707952] mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION:
> mwifiex 1.0 (14.76.36.p139) [   29.717360] mwifiex_sdio mmc0:0001:1:
> driver_version =3D mwifiex 1.0 (14.76.36.p139)=20
>=20
> root@mx6ul:~# ./tst_sdio.sh=20
> + wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> Successfully initialized wpa_supplicant
> + sleep 3
> [  251.425350] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> result=3D0x2
> + udhcpc -i mlan0
> udhcpc: started, v1.31.1
> udhcpc: sending discover
> [  256.476210] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> result=3D0x2 udhcpc: sending discover
> udhcpc: sending discover
> [  261.497057] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> result=3D0x2 [  261.507859] ieee80211 phy0: sched_scan start :
> n_ssids=3D1 n_match_sets=3D1 [  261.515872] ieee80211 phy0: n_channels=3D=
13
> interval=3D10 ie_len=3D0
>=20
>=20
> Please pay attention to the new "cmd 0x107 error, result=3D0x2" issue
> with this new FW version.

Is there any update on this issue? Ganapathi and Sharvari, have you
managed to make the STA mode working on with the newest FW for 88W8801 ?

Thanks in advance for sharing the knowledge.

>=20
> > > > For reproduction one needs to execute:
> > > > #! /bin/sh
> > > > set -x
> > > > wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > > sleep 3
> > > > dhclient mlan0
> > > >=20
> > > > exit 0
> > > >=20
> > > >=20
> > > >=20
> > > > I'm using the Azurewave AW-NM191NF module (with 88W8801 SoC).
> > > >=20
> > > > Best regards,
> > > >=20
> > > > Lukasz Majewski
> > > >=20
> > > > --
> > > >=20
> > > > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > > > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194
> > > > Groebenzell, Germany Phone: (+49)-8142-66989-59 Fax:
> > > > (+49)-8142-66989-80 Email: lukma@denx.de   =20
>=20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/bhF0.esFXNFn.GevDR0_y2n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmCrou4ACgkQAR8vZIA0
zr1/+wgAqCupdEHs7Dv7qhVV24x5kCUDzMkJt6fOr8MFtsChPJhhUZTGGp1WZBZw
pnqWL4Mg/AojBaiejaiZLrVjDdR/Kgyk0XPr4SYAuWN/nvHbCWsfyPYzrFv0k2NQ
dNaaqJNgHXaPniuAJk4K694AwBvr4QJlf30gd/L1nEYjElGD3wdDgzw1shhpB0F1
CQotu+M7ADx71QVvrJwiqjE7hFplbGQVRe6rdD4PbH3edXybZVQnAEmu/Aqp96+D
xva1BBvJSDTPnUr4FCJb6yzPSaxaRlUgE5Je0LI8YHGGlpS0dewFLgSWKavdyK9v
Tv6Il5Apon2X0ExJPL/ke7ZQbk8D8g==
=mDAt
-----END PGP SIGNATURE-----

--Sig_/bhF0.esFXNFn.GevDR0_y2n--
