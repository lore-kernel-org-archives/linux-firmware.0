Return-Path: <SRS0=/VxX=XM=denx.de=lukma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E2C433EF
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Jul 2022 08:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F2BDC341C0; Thu,  7 Jul 2022 08:10:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 143BDC3411E;
	Thu,  7 Jul 2022 08:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 143BDC3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 351C484507;
	Thu,  7 Jul 2022 10:10:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1657181433;
	bh=F02RWdPOKtlEMnwd49Dna7d23ap6EWEjSyahzXwaoCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=enL96hgCTQrEgHQmnZrBVMZ1E8x+axDZDAahDa4zeC6ZXTzaPugIVkkXC3MDVaTA+
	 VOQg0TKxCElarMrnVd20e0q986WHR1cLBAToG+5qFaNnhrScxHgniHW5M2sAJorpNV
	 +n8UorG5TJA5353HW3x1QbsIJr1ZbGWvRDXfE/2Up2Doj8/joZ6iS6qT2qpmJ4JaAc
	 q2gIs1FNj1U/Vs3bqU/WjqHwHDzvxyh8QKPO5yvVsAD+CzH1wN2VI0Be7GAmfXJfNU
	 93/ZEzKiVMswhIvoefnKyzlVeF7NTpUzYBUQLSCMks9Zw8Hku9SVSGSgRFDBQAOtsH
	 3VSooRY30K0Ww==
Date: Thu, 7 Jul 2022 10:10:26 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Thomas Schaefer <Thomas.Schaefer@kontron.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "sharvari.harisangam@nxp.com" <sharvari.harisangam@nxp.com>,
 "ganapathi.bhat@nxp.com" <ganapathi.bhat@nxp.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "pali@kernel.org"
 <pali@kernel.org>, "marek.behun@nic.cz" <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Message-ID: <20220707101026.06462dcb@wsk>
In-Reply-To: <AM0PR10MB20821250660BE6D170C20694F7809@AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB20821250660BE6D170C20694F7809@AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ATXev9HRkHN0EA8/t3.OmeI";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/ATXev9HRkHN0EA8/t3.OmeI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

> Hi Lukasz,
>=20
> > Dear Ganapathi and Sharvari
> >  =20
> > > Dear Ganapathi and Sharvari
> > >  =20
> > > > Hi Pali,
> > > >    =20
> > > > > On Saturday 08 May 2021 13:29:11 Pali Roh=C3=A1r wrote:     =20
> > > > > > + Sharvari and Ganapathi
> > > > > >=20
> > > > > > To let you know about this mwifiex firmware issue. Could you
> > > > > > look at it?
> > > > > >=20
> > > > > > On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote:
> > > > > > =20
> > > > > > > Dear community,
> > > > > > >=20
> > > > > > > I would like to report that the version: 14.68.36.p204 of
> > > > > > > sd8801_uapsta.bin binary (newest, SHA1:
> > > > > > > ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue
> > > > > > > with getting channel info (HostCmd_CMD_STA_CONFIGURE
> > > > > > > command execution).
> > > > > > >=20
> > > > > > > As a result the module seems to be stuck and no
> > > > > > > transmission is performed.
> > > > > > >=20
> > > > > > > The issue is not present in 14.68.36.p146 verson of the
> > > > > > > firmware.    =20
> > > > >=20
> > > > > And FYI, NXP has newer version 14.76.36.p139 of this
> > > > > sd8801_uapsta.bin firmware in their mwifiex-firmware github
> > > > > repository:
> > > > >=20
> > > > > https://github.com/NXP/mwifiex-firmware/commit/c38b125a920a695d36=
0b62e8b1f7fb1c4e1afd46
> > > > >=20
> > > > > I hope that Sharvari or Ganapathi brings some light in this
> > > > > issue...     =20
> > > >=20
> > > > Thanks for sharing this issue with NXP developers.
> > > >    =20
> > > > >=20
> > > > > Lukasz, meanwhile could you try to check if this new firmware
> > > > > version has this issue fixed?
> > > > >      =20
> > > >=20
> > > > It looks like the issue is still there (even new errors pops up
> > > > when compared to the original one):
> > > >=20
> > > > root@mx6ul:~# dmesg|grep sdio
> > > > [   29.025231] mwifiex_sdio mmc0:0001:1: info: FW download over,
> > > > size 262660 bytes [   29.310488] mwifiex_sdio mmc0:0001:1: WLAN
> > > > FW is active [   29.390778] mwifiex_sdio mmc0:0001:1: CMD_RESP:
> > > > cmd 0x242 error, result=3D0x2 [   29.398245] mwifiex_sdio
> > > > mmc0:0001:1: mwifiex_process_cmdresp: cmd 0x242 failed during
> > > > initialization [   29.707952] mwifiex_sdio mmc0:0001:1: info:
> > > > MWIFIEX VERSION: mwifiex 1.0 (14.76.36.p139) [   29.717360]
> > > > mwifiex_sdio mmc0:0001:1: driver_version =3D mwifiex 1.0
> > > > (14.76.36.p139)=20
> > > >=20
> > > > root@mx6ul:~# ./tst_sdio.sh=20
> > > > + wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > > Successfully initialized wpa_supplicant
> > > > + sleep 3
> > > > [  251.425350] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107
> > > > error, result=3D0x2
> > > > + udhcpc -i mlan0
> > > > udhcpc: started, v1.31.1
> > > > udhcpc: sending discover
> > > > [  256.476210] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107
> > > > error, result=3D0x2 udhcpc: sending discover
> > > > udhcpc: sending discover
> > > > [  261.497057] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107
> > > > error, result=3D0x2 [  261.507859] ieee80211 phy0: sched_scan
> > > > start : n_ssids=3D1 n_match_sets=3D1 [  261.515872] ieee80211 phy0:
> > > > n_channels=3D13 interval=3D10 ie_len=3D0
> > > >=20
> > > >=20
> > > > Please pay attention to the new "cmd 0x107 error, result=3D0x2"
> > > > issue with this new FW version.   =20
> > >=20
> > > Is there any update on this issue? Ganapathi and Sharvari, have
> > > you managed to make the STA mode working on with the newest FW for
> > > 88W8801 ? =20
> >=20
> > It looks like there was no update on the linux-firmware repository
> > for sd8801_uapsta.bin binary in the official linux-firmware tree.
> >=20
> > I can share that I've tested: 14.68.36.p160 version with mwifiex
> > driver on 5.4.y kernel and the STA mode works.
> >=20
> > The used NXP soc is imx6ull, and wi-fi is SDIO connected 88W8801.
> >=20
> > However, there is the issue with AP mode. Please find attached logs
> > and reproduction procedure.
> >=20
> > Is there any schedule for releasing new FW for this wifi chip?
> >  =20
>=20
> I'm facing similar problems with i.MX8MN EVK and u-blox wireless SDIO
> module with 88W8801 SoC and mwifiex_sdio driver for linux 5.15.28
> kernel. I tried firmware 14.68.36.p204 and 14.68.36.p60. I'm not able
> to establish a WPA protected link using wpa_supplicant.
>=20

My impression is that those FWs from mwifiex-firmware repo just don't
work.

> You mentioned that you have tested with 14.68.36.p160 and
> 14.68.36.p146 firmware versions without having issues in STA mode.
> Where did you get these firmware versions?
>=20

I think that:
1. 14.68.36.p160 I got from the archive:
SD-UAPSTA-8801-U16-MMC-W14.68.36.p160-C4X14687_R0-MGPL.zip

(I think it has been received by my customer from NXP's FAE).

2. The other one - IIRC I got from NXP's support.nxp.com page when I
filled question regarding this issue.

> I was not able to find them neither in linux-firmware,
> mwifiex-firmware nor imx-firmware repositories.
>=20

Maybe NXP could upload one of those to the aforementioned repositories?

Last but not least if you would like to use this chip as AP -=20
/usr/sbin/iw phy phy0 interface add uap0 type __ap

otherwise it will not work.

> > >=20
> > > Thanks in advance for sharing the knowledge.
> > >  =20
> > > >    =20
> > > > > > > For reproduction one needs to execute:
> > > > > > > #! /bin/sh
> > > > > > > set -x
> > > > > > > wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > > > > > sleep 3
> > > > > > > dhclient mlan0
> > > > > > >=20
> > > > > > > exit 0
> > > > > > >=20
> > > > > > >=20
> > > > > > >=20
> > > > > > > I'm using the Azurewave AW-NM191NF module (with 88W8801
> > > > > > > SoC).
> > > > > > >=20
> > > > > > > Best regards,
> > > > > > >=20
> > > > > > > Lukasz Majewski
> > > > > > >=20
> > > > > > > --
> > > > > > >=20
> > > > > > > DENX Software Engineering GmbH,      Managing Director:
> > > > > > > Wolfgang Denk HRB 165235 Munich, Office: Kirchenstr.5,
> > > > > > > D-82194 Groebenzell, Germany Phone: (+49)-8142-66989-59
> > > > > > > Fax: (+49)-8142-66989-80 Email: lukma@denx.de       =20
> > > >=20
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
> > > > (+49)-8142-66989-80 Email: lukma@denx.de   =20
> > >=20
> > >=20
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
> Best regards,
> Thomas
>=20
>=20
> Thomas Sch=C3=A4fer
> SW Design Engineer
>=20
> Kontron Europe GmbH
> Heinrich-Barth-Stra=C3=9Fe 1-1a | 66115 Saarbr=C3=BCcken | Germany
> thomas.schaefer@kontron.com
>=20
> Kontron | Member of the S&T Group
>=20
> Please find our mandatory legal statement
> https://www.kontron.com/en/imprint Please find our mandatory privacy
> statement https://www.kontron.com/en/privacy-statement
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ATXev9HRkHN0EA8/t3.OmeI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmLGlPIACgkQAR8vZIA0
zr1+gwf/Xu7bc1VVEYh+1DgTGfX876dowz1n5E0Vv8W0a5/w+U+l9BOnkneBEzBk
Pymu3zXch2NtImjxo+uiNpcsEScCZA1wc5UgVBKgSGoJu1RkeulSoRZAWvxWCjm+
BOIB+jLLkL2B4dK6iT66WGz4KGv3alVZdlFDp5q/k5e3ESUoubNiSM9tvTectAni
o//65uxkPS9kEIxhyOc0kpacIqJZtyaAkhPt+iqvtWz+Auu8/9Om4gGaXkoHvsXp
h5UuiYhBexQNhzuDibv0tySrtJB6HrxnVo6swC2Dn+LzW1Zvh36uAEhsJUPKpiGe
JLLo8/uEnnNTbScnz5yimiMKjI1HJA==
=ZOHp
-----END PGP SIGNATURE-----

--Sig_/ATXev9HRkHN0EA8/t3.OmeI--
