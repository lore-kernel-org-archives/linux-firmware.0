Return-Path: <SRS0=+QvP=KT=denx.de=lukma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1FC1C04FF3
	for <linux-firmware@archiver.kernel.org>; Mon, 24 May 2021 12:56:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C9FD1613AD; Mon, 24 May 2021 12:56:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE5D60234;
	Mon, 24 May 2021 12:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE5D60234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lukma@denx.de
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C29C282B00;
	Mon, 24 May 2021 14:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1621860985;
	bh=e7D6uNBHdkSH9UFcfcBOizeawq7A3Yhafyl/7AbHPdM=;
	h=Date:From:To:Cc:Subject:From;
	b=UHyl+pL1URIpBTDOow10OG1cLTjejpPrTcq9vL4G54vHNHvainIEYO31CvCKTzGgK
	 rxvHveBp69jOkwz239QZWgENEtJE69SSkwBGqifm0iaCKVO33yrth6RBdq+0oDqeDS
	 IM7ERQJ0FQt6i9WsEbQsAWd+LdvVNjncXmgbQV8w5oSZK9yvzHERd4MAswdyaRyviM
	 QvG+mfHxmbnxaNegw78OEqhGgvjsc0gmy0Y77M1iL9uFKp2HH+vnhR7Q/dnc7W6IPW
	 Wg/71c8NGZFAoliAOejpR6VZA13A+vffHstTYQ+4lgt4T9ssjRBCndsdIifZPs19jW
	 YcDqqo67CmczQ==
Date: Mon, 24 May 2021 14:56:17 +0200
From: Lukasz Majewski <lukma@denx.de>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, Sharvari Harisangam
 <sharvari.harisangam@nxp.com>, Ganapathi Bhat <ganapathi.bhat@nxp.com>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Marek =?UTF-8?B?QmVow7pu?=
 <marek.behun@nic.cz>, l.majewski@majess.pl
Subject: wifi: 88W8801: AP mode crash in sd8801_uapsta.bin firmware (Linux
 v5.4.yy)
Message-ID: <20210524145617.4975fe6d@ktm>
Organization: denx.de
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/_PHa2hG7KK0GmShB7GIoZxJ"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/_PHa2hG7KK0GmShB7GIoZxJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

I'm testing the 88W8801 SoC based module. I'm trying to set it to AP
mode.

Unfortunately with those verions of FW:
info: MWIFIEX VERSION: mwifiex 1.0 (14.76.36.p139) and 14.68.36.p146
the hostapd is not working (for the latter FW STA works, for former
don't - I've reported this in the other mail).


How to reproduce:
-----------------
hostapd -d -B -i mlan0 /etc/hostapd.conf

Kernel:
Kernel 5.4.24 (stable tree)


Error:
mwifiex_cmd_timeout_func: Timeout cmd id =3D 0xb1, act =3D 0x0
which corresponds to: HostCmd_CMD_UAP_BSS_START

More verbose output:

mwifiex_sdio mmc0:0001:1: mwifiex_cmd_timeout_func: Timeout cmd id =3D
0xb1, act =3D 0x0 mwifiex_sdio mmc0:0001:1: num_data_h2c_failure =3D 0
mwifiex_sdio mmc0:0001:1: num_cmd_h2c_failure =3D 0
mwifiex_sdio mmc0:0001:1: is_cmd_timedout =3D 1
mwifiex_sdio mmc0:0001:1: num_tx_timeout =3D 0
mwifiex_sdio mmc0:0001:1: last_cmd_index =3D 4
mwifiex_sdio mmc0:0001:1: last_cmd_id: 28 00 28 00 5b 00 b0 00 b1 00
mwifiex_sdio mmc0:0001:1: last_cmd_act: 13 00 13 00 01 00 01 00 00 00
mwifiex_sdio mmc0:0001:1: last_cmd_resp_index =3D 3
mwifiex_sdio mmc0:0001:1: last_cmd_resp_id: 28 80 28 80 5b 80 b0 80 28
80 mwifiex_sdio mmc0:0001:1: last_event_index =3D 4
mwifiex_sdio mmc0:0001:1: last_event: 00 00 0b 00 0a 00 0b 00 0a 00
mwifiex_sdio mmc0:0001:1: data_sent=3D0 cmd_sent=3D1
mwifiex_sdio mmc0:0001:1: ps_mode=3D1 ps_state=3D0
mwifiex_sdio mmc0:0001:1: Failed to start the BSS
mwifiex_sdio mmc0:0001:1: Failed to start AP
mwifiex_sdio mmc0:0001:1: =3D=3D=3Dmwifiex driverinfo dump start=3D=3D=3D
mwifiex_sdio mmc0:0001:1: info: MWIFIEX VERSION: mwifiex 1.0
(14.76.36.p139) mwifiex_sdio mmc0:0001:1: SDIO register dump start

Afteterward, any attempt to communicat with the module ends with:
mwifiex_sdio mmc0:0001:1: PREP_CMD: FW is in bad state
and reboot is required.


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



There a document regarding using the STA mode for 88W8801 from NXP:
"How to integrate Linux driver of 88W8801 To i.MX6ULL-EVK And
L5.4.70_2.3.0 BSP"
Written by:
NXP CAS-TIC Wireless MCU Team, Weidong Sun 05/16/2021


It uses similar FW version (p160 vs p146) - 14.68.36.p160, but only
with STA working (the AP mode is not presented as working one - it is
apparentlty not tested).
In the above document some proprietary (not mwifiex) wi-fi driver
was used for the test.

Working STA for 14.68.36.p146 (and probably p160) is what I see with
mwifiex driver.=20

I'm wondering if anybody managed to have the AP (hostapd) mode working
with this SoC with any known FW version?

Thanks in advance for sharing the knowledge.

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/_PHa2hG7KK0GmShB7GIoZxJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmCronEACgkQAR8vZIA0
zr3CaQf/Ro6JNSBT2LbzeczCiA2hPy6mTNgbdcjVhIDjja+L/tnlLW2neixD+sCK
59p6nN2O19GX/1ppSANHXa1kwwVB5aIy/RK2kg/tKR72UnK2d8m3CFuCPmhHSNrq
QbTE8+4hIIdW+AKdAZBoiPnrROMOi3QY8RFV6SAicaQvU/VM+qW1ig7oWqwhVten
K8b0hUl+LelwdauaEk9JaYIekq4KWD9rxvShEg1zSmq3gwWHGewxNRhuiMP5jJTQ
V5E//STDU842oWPipf3dFM+I/BohOjLeNFhmKufMmjJFkuFkmlbXMUC/rOakSg27
Bt8n6TDJ5t9gvthhXFlPH+GXuNgH9A==
=KUAD
-----END PGP SIGNATURE-----

--Sig_/_PHa2hG7KK0GmShB7GIoZxJ--
