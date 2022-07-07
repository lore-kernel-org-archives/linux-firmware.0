Return-Path: <SRS0=/VxX=XM=denx.de=lukma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A506C43334
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Jul 2022 14:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 257A4C341C8; Thu,  7 Jul 2022 14:30:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94515C3411E;
	Thu,  7 Jul 2022 14:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94515C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 43794842DB;
	Thu,  7 Jul 2022 16:30:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1657204219;
	bh=ay9Lhisgmd4wxydgQjMKsjQdJ5j8Gej7bFe7GVoRQqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hHEgB7o3xxTbOUN818Y5tCDE12DW9bLL7UEZxBoDQwM/bLa3RqxDr35oCxI9UFdzy
	 JiV2hQ2u6C6MyLBatJtzk/ZoKfEJuEfSzU3KA3pQDNUtJ3GKkc/w80LmzoWUqbEJ78
	 1fDfEpN8PU9dUxztpuQAAqFv4LOkxpaaC0e6HNmJz+uVJNUt86lA97TZQugJVpI41S
	 ebfzn7jFzaJVg8lsWsLlb91sN1CgK64KwCH3lPpo6zCwWfh/QKJ6aW2JMc+ar7MwSw
	 6lOY4gNYKFFRZa+gUhargwBrlOCkfusstyZH5FsKh3kUgUtFBu1izx23wE3u5QJRmW
	 ZPxv6lzvBY3XQ==
Date: Thu, 7 Jul 2022 16:30:13 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Thomas Schaefer <Thomas.Schaefer@kontron.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "sharvari.harisangam@nxp.com" <sharvari.harisangam@nxp.com>,
 "ganapathi.bhat@nxp.com" <ganapathi.bhat@nxp.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "pali@kernel.org"
 <pali@kernel.org>, "marek.behun@nic.cz" <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20220707163013.0d450698@wsk>
In-Reply-To: <AM0PR10MB2082F59D505ADF9A6ECEC1F6F7839@AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB20821250660BE6D170C20694F7809@AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM>
	<20220707101026.06462dcb@wsk>
	<AM0PR10MB2082F59D505ADF9A6ECEC1F6F7839@AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sUkMmSng+iGZ4hKtxw9vOP_";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/sUkMmSng+iGZ4hKtxw9vOP_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

> Hi Lukasz,
>=20
> > Hi Thomas,
> >  =20
> > > Hi Lukasz,
> > >  =20
> > > > Dear Ganapathi and Sharvari
> > > >    =20
> > > > > Dear Ganapathi and Sharvari
> > > > >    =20
> > > > > > Hi Pali,
> > > > > >      =20
> > > > > > > On Saturday 08 May 2021 13:29:11 Pali Roh=C3=A1r wrote:      =
 =20
> > > > > > > > + Sharvari and Ganapathi
> > > > > > > >=20
> > > > > > > > To let you know about this mwifiex firmware issue.
> > > > > > > > Could you look at it?
> > > > > > > >=20
> > > > > > > > On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote:
> > > > > > > >   =20
> > > > > > > > > Dear community,
> > > > > > > > >=20
> > > > > > > > > I would like to report that the version:
> > > > > > > > > 14.68.36.p204 of sd8801_uapsta.bin binary (newest,
> > > > > > > > > SHA1: ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has
> > > > > > > > > the issue with getting channel info
> > > > > > > > > (HostCmd_CMD_STA_CONFIGURE command execution).
> > > > > > > > >=20
> > > > > > > > > As a result the module seems to be stuck and no=20
> > > > > > > > > transmission is performed.
> > > > > > > > >=20
> > > > > > > > > The issue is not present in 14.68.36.p146 verson of
> > > > > > > > > the firmware.      =20
> > > > > > >=20
> > > > > > > And FYI, NXP has newer version 14.76.36.p139 of this=20
> > > > > > > sd8801_uapsta.bin firmware in their mwifiex-firmware
> > > > > > > github repository:
> > > > > > >=20
> > > > > > > https://github.com/NXP/mwifiex-firmware/commit/c38b125a920a695
> > > > > > > d360b62e8b1f7fb1c4e1afd46
> > > > > > >=20
> > > > > > > I hope that Sharvari or Ganapathi brings some light in
> > > > > > > this issue...       =20
> > > > > >=20
> > > > > > Thanks for sharing this issue with NXP developers.
> > > > > >      =20
> > > > > > >=20
> > > > > > > Lukasz, meanwhile could you try to check if this new
> > > > > > > firmware version has this issue fixed?
> > > > > > >        =20
> > > > > >=20
> > > > > > It looks like the issue is still there (even new errors
> > > > > > pops up when compared to the original one):
> > > > > >=20
> > > > > > root@mx6ul:~# dmesg|grep sdio
> > > > > > [   29.025231] mwifiex_sdio mmc0:0001:1: info: FW download
> > > > > > over, size 262660 bytes [   29.310488] mwifiex_sdio
> > > > > > mmc0:0001:1: WLAN FW is active [   29.390778] mwifiex_sdio
> > > > > > mmc0:0001:1: CMD_RESP: cmd 0x242 error, result=3D0x2 [
> > > > > > 29.398245] mwifiex_sdio mmc0:0001:1:
> > > > > > mwifiex_process_cmdresp: cmd 0x242 failed during
> > > > > > initialization [   29.707952] mwifiex_sdio mmc0:0001:1:
> > > > > > info: MWIFIEX VERSION: mwifiex 1.0 (14.76.36.p139) [
> > > > > > 29.717360] mwifiex_sdio mmc0:0001:1: driver_version =3D
> > > > > > mwifiex 1.0 (14.76.36.p139)
> > > > > >=20
> > > > > > root@mx6ul:~# ./tst_sdio.sh
> > > > > > + wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > > > > Successfully initialized wpa_supplicant
> > > > > > + sleep 3
> > > > > > [  251.425350] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd
> > > > > > 0x107 error, result=3D0x2
> > > > > > + udhcpc -i mlan0
> > > > > > udhcpc: started, v1.31.1
> > > > > > udhcpc: sending discover
> > > > > > [  256.476210] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd
> > > > > > 0x107 error, result=3D0x2 udhcpc: sending discover
> > > > > > udhcpc: sending discover
> > > > > > [  261.497057] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd
> > > > > > 0x107 error, result=3D0x2 [  261.507859] ieee80211 phy0:
> > > > > > sched_scan start : n_ssids=3D1 n_match_sets=3D1 [  261.515872]
> > > > > > ieee80211 phy0: n_channels=3D13 interval=3D10 ie_len=3D0
> > > > > >=20
> > > > > >=20
> > > > > > Please pay attention to the new "cmd 0x107 error,
> > > > > > result=3D0x2" issue with this new FW version.     =20
> > > > >=20
> > > > > Is there any update on this issue? Ganapathi and Sharvari,
> > > > > have you managed to make the STA mode working on with the
> > > > > newest FW for 88W8801 ?   =20
> > > >=20
> > > > It looks like there was no update on the linux-firmware
> > > > repository for sd8801_uapsta.bin binary in the official
> > > > linux-firmware tree.
> > > >=20
> > > > I can share that I've tested: 14.68.36.p160 version with
> > > > mwifiex driver on 5.4.y kernel and the STA mode works.
> > > >=20
> > > > The used NXP soc is imx6ull, and wi-fi is SDIO connected
> > > > 88W8801.
> > > >=20
> > > > However, there is the issue with AP mode. Please find attached
> > > > logs and reproduction procedure.
> > > >=20
> > > > Is there any schedule for releasing new FW for this wifi chip?
> > > >    =20
> > >=20
> > > I'm facing similar problems with i.MX8MN EVK and u-blox wireless
> > > SDIO module with 88W8801 SoC and mwifiex_sdio driver for linux
> > > 5.15.28 kernel. I tried firmware 14.68.36.p204 and 14.68.36.p60.
> > > I'm not able to establish a WPA protected link using
> > > wpa_supplicant.=20
> >=20
> > My impression is that those FWs from mwifiex-firmware repo just
> > don't work.=20
> > > You mentioned that you have tested with 14.68.36.p160 and
> > > 14.68.36.p146 firmware versions without having issues in STA mode.
> > > Where did you get these firmware versions?
> > >  =20
> >=20
> > I think that:
> > 1. 14.68.36.p160 I got from the archive:
> > SD-UAPSTA-8801-U16-MMC-W14.68.36.p160-C4X14687_R0-MGPL.zip
> >  =20
>=20
> I also found the hint to this zip file in NXPs WiFi_BT_Integration
> document for the 88W8801
> (https://community.nxp.com/t5/Wireless-Connectivity-Knowledge/WiFi-BT-Int=
egretion-88W8801-To-iMX6ULL-EVK-L5-4-70-2-3-0/ta-p/1277202),
> but the link herein seems to be no longer available...
>=20
> > (I think it has been received by my customer from NXP's FAE).
> >=20
> > 2. The other one - IIRC I got from NXP's support.nxp.com page when
> > I filled question regarding this issue.=20
> > > I was not able to find them neither in linux-firmware,=20
> > > mwifiex-firmware nor imx-firmware repositories.
> > >  =20
> >=20
> > Maybe NXP could upload one of those to the aforementioned
> > repositories? Last but not least if you would like to use this chip
> > as AP - /usr/sbin/iw phy phy0 interface add uap0 type __ap
> > otherwise it will not work.=20
>=20
> OK, we will go on with 14.68.36.p60 which is reported to work better
> in STA mode compared to p204 for now until an updated version from
> NXP will be available.
>=20
> Anyway, it seems that we are facing also some signal integrity
> problems in our setup when adapting from EVK uSD connector to wide
> SDIO connector of the WiFi module. Adapter connection seems to be
> quite unstable, so we will continue to investigate in this direction.
>=20

I had some issues with the 8801 reset and power supply application. It
is unclear on the datascheet.

>=20
> Thanks,
> Thomas
>=20
> > > > >=20
> > > > > Thanks in advance for sharing the knowledge.
> > > > >    =20
> > > > > >      =20
> > > > > > > > > For reproduction one needs to execute:
> > > > > > > > > #! /bin/sh
> > > > > > > > > set -x
> > > > > > > > > wpa_supplicant -B -i mlan0 -c
> > > > > > > > > /etc/wpa_supplicant.conf sleep 3 dhclient mlan0
> > > > > > > > >=20
> > > > > > > > > exit 0
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > > I'm using the Azurewave AW-NM191NF module (with
> > > > > > > > > 88W8801 SoC).
> > > > > > > > >=20
> > > > > > > > > Best regards,
> > > > > > > > >=20
> > > > > > > > > Lukasz Majewski
> > > > > > > > >=20
> > > > > > > > > --
> > > > > > > > >=20
> > > > > > > > > DENX Software Engineering GmbH,      Managing
> > > > > > > > > Director: Wolfgang Denk HRB 165235 Munich, Office:
> > > > > > > > > Kirchenstr.5, D-82194 Groebenzell, Germany Phone:
> > > > > > > > > (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > > > > > > > > lukma@denx.de         =20
> > > > > >=20
> > > > > > Best regards,
> > > > > >=20
> > > > > > Lukasz Majewski
> > > > > >=20
> > > > > > --
> > > > > >=20
> > > > > > DENX Software Engineering GmbH,      Managing Director:
> > > > > > Wolfgang Denk HRB 165235 Munich, Office: Kirchenstr.5,
> > > > > > D-82194 Groebenzell, Germany Phone: (+49)-8142-66989-59 Fax:
> > > > > > (+49)-8142-66989-80 Email: lukma@denx.de     =20
> > > > >=20
> > > > > Best regards,
> > > > >=20
> > > > > Lukasz Majewski
> > > > >=20
> > > > > --
> > > > >=20
> > > > > DENX Software Engineering GmbH,      Managing Director:
> > > > > Wolfgang Denk HRB 165235 Munich, Office: Kirchenstr.5,
> > > > > D-82194 Groebenzell, Germany Phone: (+49)-8142-66989-59 Fax:
> > > > > (+49)-8142-66989-80 Email: lukma@denx.de =20
> > > >=20
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
> > > > (+49)-8142-66989-80 Email: lukma@denx.de =20
> > >=20
> > > Best regards,
> > > Thomas
> > >=20
> > >=20
> > > Thomas Sch=C3=A4fer
> > > SW Design Engineer
> > >=20
> > > Kontron Europe GmbH
> > > Heinrich-Barth-Stra=C3=9Fe 1-1a | 66115 Saarbr=C3=BCcken | Germany=20
> > > thomas.schaefer@kontron.com
> > >=20
> > > Kontron | Member of the S&T Group
> > >=20
> > > Please find our mandatory legal statement=20
> > > https://www.kontron.com/en/imprint Please find our mandatory
> > > privacy statement https://www.kontron.com/en/privacy-statement
> > >  =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang
> > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/sUkMmSng+iGZ4hKtxw9vOP_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmLG7fUACgkQAR8vZIA0
zr3SVggAqEeqEvZwiv0f/AoV3vswD0iZS529uNLLMnE7ujoLIYPN8w9KS8sOSeni
20RaPKa8r1c7qFDq49APXnzplL5TOvcueBh0SE3QCA9VxSg54fGrs+SvOx+8znhT
JfscMEHEq5QZhe5t1k9t2aFIN1QEaqIa3BfEB2fXvcyxvBhhxDUt0J/FNWEieV5j
xojr27++oviX/KbrGcFVdvPc4Hvi7x8QBWwzcXvKFrW1C1MSJ3R65OsAuXWPD3Md
3jJK8to87NynQYsDEz/465VYDaeUIEU8WvD925X3qvQ5qr/PxgC8ZsghjFL9pyPj
Kxn2kKlptMSXnEPKE3hPonnQsIZN/g==
=YX4V
-----END PGP SIGNATURE-----

--Sig_/sUkMmSng+iGZ4hKtxw9vOP_--
