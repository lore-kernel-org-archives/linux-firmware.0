Return-Path: <SRS0=oC9G=S2=denx.de=lukma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BECC433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Feb 2022 11:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1739C340EE; Fri, 11 Feb 2022 11:12:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74384C340E9;
	Fri, 11 Feb 2022 11:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74384C340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1336783881;
	Fri, 11 Feb 2022 12:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1644577951;
	bh=YFS2LYtl+H1MQj/Hedm28dLTeEdcDzfx2IYorK63Cs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pin7wQFmAeEY85EVf85k5btwa9mNNTWEYfPRyd1fTgwVPcqway18GZJl0H/DiysYT
	 OTkEofnUF1Z2HO/7+Cz7jfpy6P7HY3px5slg68IVmIdN+I1ZH/2XujQ/UKE4ViOuFl
	 s2KyzS3iQjRmNMz/KnptVWSIVDcENnjDDK/RwRlzGNVw4Gr85lrhfhi6L9+cIc2pmW
	 ZSJ98cqehyDqdnQ+ANYVTFbJngxI1Z0cMRLYj/FgQfcI4sOx8f53ruTpX+qC98x6jf
	 YAxV7tD3wR9r4dWJqVV8cQORKKGZIDps0F10WeRupoAFT4x3JHn/h8nsdgWf0SQQRJ
	 A7Zg92/Cchtfg==
Date: Fri, 11 Feb 2022 12:12:24 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>, Ganapathi Bhat
 <ganapathi.bhat@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, linux-firmware@kernel.org,
 l.majewski@majess.pl, Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20220211121224.42ea2868@ktm>
In-Reply-To: <20210524145822.5ac95365@ktm>
References: <20210507151702.4848a5b3@jawa>
	<20210508112911.aigklhaw225ftwtj@pali>
	<20210508113734.4kdyt6z6xsjtrrq2@pali>
	<20210510105402.3bbc16fe@jawa>
	<20210524145822.5ac95365@ktm>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/rfW66X5SLnj8Pm2egsrH=gI"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/rfW66X5SLnj8Pm2egsrH=gI
Content-Type: multipart/mixed; boundary="MP_/l/0lSN1u_tx0Y6giGYDOT1H"

--MP_/l/0lSN1u_tx0Y6giGYDOT1H
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dear Ganapathi and Sharvari

> Dear Ganapathi and Sharvari
>=20
> > Hi Pali,
> >  =20
> > > On Saturday 08 May 2021 13:29:11 Pali Roh=C3=A1r wrote:   =20
> > > > + Sharvari and Ganapathi
> > > >=20
> > > > To let you know about this mwifiex firmware issue. Could you
> > > > look at it?
> > > >=20
> > > > On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote:     =20
> > > > > Dear community,
> > > > >=20
> > > > > I would like to report that the version: 14.68.36.p204 of
> > > > > sd8801_uapsta.bin binary (newest, SHA1:
> > > > > ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue with
> > > > > getting channel info (HostCmd_CMD_STA_CONFIGURE command
> > > > > execution).
> > > > >=20
> > > > > As a result the module seems to be stuck and no transmission
> > > > > is performed.
> > > > >=20
> > > > > The issue is not present in 14.68.36.p146 verson of the
> > > > > firmware.  =20
> > >=20
> > > And FYI, NXP has newer version 14.76.36.p139 of this
> > > sd8801_uapsta.bin firmware in their mwifiex-firmware github
> > > repository:
> > >=20
> > > https://github.com/NXP/mwifiex-firmware/commit/c38b125a920a695d360b62=
e8b1f7fb1c4e1afd46
> > >=20
> > > I hope that Sharvari or Ganapathi brings some light in this
> > > issue...   =20
> >=20
> > Thanks for sharing this issue with NXP developers.
> >  =20
> > >=20
> > > Lukasz, meanwhile could you try to check if this new firmware
> > > version has this issue fixed?
> > >    =20
> >=20
> > It looks like the issue is still there (even new errors pops up when
> > compared to the original one):
> >=20
> > root@mx6ul:~# dmesg|grep sdio
> > [   29.025231] mwifiex_sdio mmc0:0001:1: info: FW download over,
> > size 262660 bytes [   29.310488] mwifiex_sdio mmc0:0001:1: WLAN FW
> > is active [   29.390778] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd
> > 0x242 error, result=3D0x2 [   29.398245] mwifiex_sdio mmc0:0001:1:
> > mwifiex_process_cmdresp: cmd 0x242 failed during
> > initialization [   29.707952] mwifiex_sdio mmc0:0001:1: info:
> > MWIFIEX VERSION: mwifiex 1.0 (14.76.36.p139) [   29.717360]
> > mwifiex_sdio mmc0:0001:1: driver_version =3D mwifiex 1.0
> > (14.76.36.p139)=20
> >=20
> > root@mx6ul:~# ./tst_sdio.sh=20
> > + wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > Successfully initialized wpa_supplicant
> > + sleep 3
> > [  251.425350] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> > result=3D0x2
> > + udhcpc -i mlan0
> > udhcpc: started, v1.31.1
> > udhcpc: sending discover
> > [  256.476210] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> > result=3D0x2 udhcpc: sending discover
> > udhcpc: sending discover
> > [  261.497057] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> > result=3D0x2 [  261.507859] ieee80211 phy0: sched_scan start :
> > n_ssids=3D1 n_match_sets=3D1 [  261.515872] ieee80211 phy0:
> > n_channels=3D13 interval=3D10 ie_len=3D0
> >=20
> >=20
> > Please pay attention to the new "cmd 0x107 error, result=3D0x2" issue
> > with this new FW version. =20
>=20
> Is there any update on this issue? Ganapathi and Sharvari, have you
> managed to make the STA mode working on with the newest FW for
> 88W8801 ?

It looks like there was no update on the linux-firmware repository for
sd8801_uapsta.bin binary in the official linux-firmware tree.

I can share that I've tested: 14.68.36.p160 version with mwifiex driver
on 5.4.y kernel and the STA mode works.

The used NXP soc is imx6ull, and wi-fi is SDIO connected 88W8801.

However, there is the issue with AP mode. Please find attached logs and
reproduction procedure.

Is there any schedule for releasing new FW for this wifi chip?

>=20
> Thanks in advance for sharing the knowledge.
>=20
> >  =20
> > > > > For reproduction one needs to execute:
> > > > > #! /bin/sh
> > > > > set -x
> > > > > wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > > > sleep 3
> > > > > dhclient mlan0
> > > > >=20
> > > > > exit 0
> > > > >=20
> > > > >=20
> > > > >=20
> > > > > I'm using the Azurewave AW-NM191NF module (with 88W8801 SoC).
> > > > >=20
> > > > > Best regards,
> > > > >=20
> > > > > Lukasz Majewski
> > > > >=20
> > > > > --
> > > > >=20
> > > > > DENX Software Engineering GmbH,      Managing Director:
> > > > > Wolfgang Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194
> > > > > Groebenzell, Germany Phone: (+49)-8142-66989-59 Fax:
> > > > > (+49)-8142-66989-80 Email: lukma@denx.de     =20
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

--MP_/l/0lSN1u_tx0Y6giGYDOT1H
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=AP_88W8801-issue-lukma.txt

Linux 5.4.24
Driver mwifiex (open source)
Status: STA works as expected, AP (FW issue)
hostapd v2.9
Wifi: 88W8801 (azzure)
SoC - imx6ull

cat /etc/hostapd.conf=20
interface=3Dmlan0
channel=3D1
driver=3Dnl80211
ssid=3Dimx6ullevk
auth_algs=3D1
ignore_broadcast_ssid=3D0
hw_mode=3Dg
wpa=3D2
wpa_passphrase=3Dfoofoofoo
wpa_key_mgmt=3DWPA-PSK

Logs after boot up:

[   21.334518] mwifiex_sdio mmc0:0001:1: info: FW download over, size 26018=
4 bytes
[   21.567047] mwifiex_sdio mmc0:0001:1: WLAN FW is active
[   21.610346] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x242 error, result=
=3D0x2
[   21.610495] mwifiex_sdio mmc0:0001:1: mwifiex_process_cmdresp: cmd 0x242=
 failed during       initialization
[   21.699920] mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION: mwifiex 1.0=
 (14.68.36.p160)=20
[   21.699946] mwifiex_sdio mmc0:0001:1: driver_version =3D mwifiex 1.0 (14=
.68.36.p160)=20

hostapd -d -B -i mlan0 /etc/hostapd.conf


[  127.849506] mwifiex_sdio mmc0:0001:1: mwifiex_cmd_timeout_func: Timeout =
cmd id =3D 0xb1, act =3D 0x0
[  127.849536] mwifiex_sdio mmc0:0001:1: num_data_h2c_failure =3D 0
[  127.849554] mwifiex_sdio mmc0:0001:1: num_cmd_h2c_failure =3D 0
[  127.849569] mwifiex_sdio mmc0:0001:1: is_cmd_timedout =3D 1
[  127.849582] mwifiex_sdio mmc0:0001:1: num_tx_timeout =3D 0
[  127.849598] mwifiex_sdio mmc0:0001:1: last_cmd_index =3D 4
[  127.849617] mwifiex_sdio mmc0:0001:1: last_cmd_id: 28 00 28 00 5b 00 b0 =
00 b1 00
[  127.849635] mwifiex_sdio mmc0:0001:1: last_cmd_act: 13 00 13 00 01 00 01=
 00 00 00
[  127.849650] mwifiex_sdio mmc0:0001:1: last_cmd_resp_index =3D 3
[  127.849665] mwifiex_sdio mmc0:0001:1: last_cmd_resp_id: 28 80 28 80 5b 8=
0 b0 80 28 80
[  127.849679] mwifiex_sdio mmc0:0001:1: last_event_index =3D 4
[  127.849695] mwifiex_sdio mmc0:0001:1: last_event: 00 00 0b 00 0a 00 0b 0=
0 0a 00
[  127.849709] mwifiex_sdio mmc0:0001:1: data_sent=3D0 cmd_sent=3D1
[  127.849726] mwifiex_sdio mmc0:0001:1: ps_mode=3D1 ps_state=3D0
[  127.850131] mwifiex_sdio mmc0:0001:1: Failed to start the BSS
[  127.850154] mwifiex_sdio mmc0:0001:1: Failed to start AP
[  127.851443] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  127.851470] mwifiex_sdio mmc0:0001:1: deleting the crypto keys
[  127.851980] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  127.852004] mwifiex_sdio mmc0:0001:1: deleting the crypto keys
[  127.852477] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  127.852500] mwifiex_sdio mmc0:0001:1: deleting the crypto keys
[  127.852975] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  127.852996] mwifiex_sdio mmc0:0001:1: deleting the crypto keys
[  127.865552] mwifiex_sdio mmc0:0001:1: =3D=3D=3Dmwifiex driverinfo dump s=
tart=3D=3D=3D
[  127.865593] mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION: mwifiex 1.0=
 (14.68.36.p160)
[  127.865645] mwifiex_sdio mmc0:0001:1: SDIO register dump start
[  127.866398] mwifiex_sdio mmc0:0001:1: SDIO Func0 (0x0-0x9): 32 02 02 02 =
03 00 00 02 03 00
[  127.867807] mwifiex_sdio mmc0:0001:1: SDIO Func1 (0x0-0x9): 02 3f 03 00 =
00 00 ff 0f ad 00
[  127.868155] mwifiex_sdio mmc0:0001:1: SDIO Func1: (0x28) 00 (0x30) 08 (0=
x34) 07 (0x38) 10 (0x3c) 00
[  127.868859] mwifiex_sdio mmc0:0001:1: SDIO Func1 (0x60-0x6a): dc fe c8 0=
0 c1 02 07 47 46 00 20
[  127.907493] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  127.907737] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  127.907756] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.075589] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.075623] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.075664] mwifiex_sdio mmc0:0001:1: mlan0: changing to 2 not supported
[  128.075995] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.076286] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.076599] mwifiex_sdio mmc0:0001:1: mlan0: changing to 2 not supported
[  128.099476] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.099503] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.099732] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.099752] mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
[  128.118086] mwifiex_sdio mmc0:0001:1: SDIO Func1 (0x60-0x6a): dc fe c8 0=
0 c1 02 07 47 46 00 20
[  128.118124] mwifiex_sdio mmc0:0001:1: SDIO register dump end
[  128.118437] mwifiex_sdio mmc0:0001:1: =3D=3D=3Dmwifiex driverinfo dump e=
nd=3D=3D=3D
[  128.118465] mwifiex_sdio mmc0:0001:1: =3D=3D mwifiex dump information to=
 /sys/class/devcoredump start
[  128.122393] mwifiex_sdio mmc0:0001:1: =3D=3D mwifiex dump information to=
 /sys/class/devcoredump end
[  128.131774] mwifiex_sdio mmc0:0001:1: info: shutdown mwifiex...
[  128.167775] mwifiex_sdio mmc0:0001:1: PREP_CMD: card is removed
[  129.161305] mwifiex_sdio mmc0:0001:1: info: FW download over, size 26018=
4 bytes
[  129.399453] mwifiex_sdio mmc0:0001:1: WLAN FW is active
[  129.436070] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x242 error, result=
=3D0x2
[  129.436228] mwifiex_sdio mmc0:0001:1: mwifiex_process_cmdresp: cmd 0x242=
 failed during       initialization
[  129.517345] mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION: mwifiex 1.0=
 (14.68.36.p160)
[  129.517371] mwifiex_sdio mmc0:0001:1: driver_version =3D mwifiex 1.0 (14=
.68.36.p160)

--MP_/l/0lSN1u_tx0Y6giGYDOT1H--

--Sig_/rfW66X5SLnj8Pm2egsrH=gI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmIGRJgACgkQAR8vZIA0
zr2zcgf+L9EW5goPZL6No3qFY/FPLc8Gph5U9HvtJSpMFa+lhUwtplxbiFO9fXtb
q4VJchhdtOa0RAZUBhEkwFXUYc+1dgtmgvO34seN1hagVnM2F7IDIHvUuUNQeh2N
GMALz9VVi2PGWA+GDOGFk5sk8o+7Zi19hlwfkGSJ+uMDC17a+jsIx6/zIMm0+ZLF
37c5QqPohT+CGRy2MAHJ+Azul6sh4JWztAOO49Jve08T+XuwgEm3sACGXtswLIP5
yikUxXw3oa/yetNpA2zQr7G/GbEP5Xzs5mDoto8kdlMMMn+g/Gwje0UXHQJTWKca
ydojiSn0XaIQgJxIn85mAtsWFPp10g==
=/NEQ
-----END PGP SIGNATURE-----

--Sig_/rfW66X5SLnj8Pm2egsrH=gI--
