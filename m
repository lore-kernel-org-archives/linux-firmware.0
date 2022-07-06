Return-Path: <SRS0=6vHF=XL=kontron.com=Thomas.Schaefer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FF6C43334
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Jul 2022 12:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0619C341CB; Wed,  6 Jul 2022 12:35:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60100.outbound.protection.outlook.com [40.107.6.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B909DC3411C;
	Wed,  6 Jul 2022 12:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B909DC3411C
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kontron.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSBw3GpU4k+9lD7CYWsM5reved5sShAoLuh8bqamEwIQqcosQ73lpF7oYgI5F96qj+p18IOsTGkk/jGUf/2TLNVYqY/OwV6tRpltA4UmNBvNp8Va/4ineXqRWRiOqV/HAeAr1kHWV9og8rVZbZhKqExS9+b2RtnNIwLA9QwBiv2D1GC7oYBRK5iO3zlNU3XBctk1JVxxYm1aAwqRkyMs2HmFTt1mGrVUEu4hhrzIJxbhaCK8U8zfGBtvB5aYOUgNLxRzZejbjCHKgfieDSG+Z06fFkji6YmDZs3zzbzuv4vjjI/utAutjzSIsJ3+ZM/LG7xrs1JnyleiAPQfTdZZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwrUsytyUV32DY5FYyyVHjDTy63u8jOzNewY9SDqgHA=;
 b=dlhlQmJIPOreP2+eYasEhtvcoSZWsyKEa3LMlwBIfHIeKBPhK0xY18/eRD9x27mlGE3baedhNW34YhGcRtAl16ImG64QXzI2lPPilglY26NC0qqUUP/N8fVoZF5nB9ggP/3KRQBZyMEI24wg+gkUk0tNuk1Vs1bQGpf94lfIsCL1psDwnLTC2Q78dTdtk52OS6WSmyyKPgQYjOHmNZx/j8res9woRYrGv3oeT9BwLin7R8qEQyJDAnJGlIpzm8I89gGW4KF70lLdcO5hY8oHIgqzgg5uHhpnDLTfgJpiNmEP+f8sSgz4I37DV9SsA4fEL789Vx5rt2hENax0W7QSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.com; dmarc=pass action=none header.from=kontron.com;
 dkim=pass header.d=kontron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwrUsytyUV32DY5FYyyVHjDTy63u8jOzNewY9SDqgHA=;
 b=ZAIp9oOVF+K030yU81IyFbD9f4PC9n5ONraI71nNRMH/SKVet5l6o+BkzNf3TM/QG6lVtmzIvYDDvqqXFu4IS4qxEdY3lMu5vGzNel9QezZH6Lb51GcDzq7ubu54Bg5z3+UJWkZltZzM+l17v8pgVHMRPzCp/fYWDrRYltSUJb4=
Received: from AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:46::22)
 by PR3PR10MB3802.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 12:35:20 +0000
Received: from AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acac:2:cfd2:84f5]) by AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acac:2:cfd2:84f5%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 12:35:19 +0000
From: Thomas Schaefer <Thomas.Schaefer@kontron.com>
To: "lukma@denx.de" <lukma@denx.de>
List-Id: <linux-firmware.lore.kernel.org>
CC: "sharvari.harisangam@nxp.com" <sharvari.harisangam@nxp.com>,
	"ganapathi.bhat@nxp.com" <ganapathi.bhat@nxp.com>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "pali@kernel.org"
	<pali@kernel.org>, "marek.behun@nic.cz" <marek.behun@nic.cz>
Subject: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Thread-Topic: Re: wifi: 88W8801: Newest firmware for sd8801_uapsta.bin bug
Thread-Index: AdiRNLG6ni465ikTR/OgdzzK3FoROQ==
Date: Wed, 6 Jul 2022 12:35:19 +0000
Message-ID:
 <AM0PR10MB20821250660BE6D170C20694F7809@AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1d4cf96-483c-4bf8-9d01-08da5f4bfcee
x-ms-traffictypediagnostic: PR3PR10MB3802:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SPYEl7HHFxspe+fNwumYOHVwOmjYTi3Cl8tZGK0i9aMNrXgqmwJlF5RjUJHzn5Xs615USfh6rCg00YXM8sp17PwcvBYUzdIr8t5pAfeUCoMqK0Rqlt++fDPf+IGyY7Zny6etiLQiTWe9RtsB9bE7tdayPSiV4PUck+AQQ7pl9lT8HqrEOak0BBNJ+HXBi3c046/SSXll1hlA4q7I6oItUZJf5Ap1Az6Cxmky5JvXl/OuKIDQ5PXBDH7PujCN2fUQ/wYwkxySfV/kFQPbaOf5iV5jMoiCwye1j2JefGVrIE6LTBhSB8PjBy+LNVNwIcyWngBxTaM3wMKtBl1ysp9f132rnpVZVJF1ZgWK9oObLOxPywu1uI/2u4L7pvGP79nZOAelFXG/pdpvRBRRLKiTtb61UBlu+JtXcDR2hlgs9m5VYE60GYBW+ZmYYNuiL7rNuq8IfvXZxXjKq97UaBgixbiytbgcXnIbjiJMkrY8dM+AYrus9SAHbYdTwbRIvxGS0+HNoK7nqkOY7hNZzNgLevt2Ex881AoN1N3oF1795fJ7RD1EvzrArHCOOVEjqQdq+VnRlE2oMPjNrU9HKUrdp7KGVytoLomNRpValwDyncMvVhR7aLmvtEjbdPU8bogHOMJvAJbUjsPayKmJPtBOo3wHnigj5RfbRLHjirZ8hX/DeaZcqNbulfXdiKfXIlsooZQAIIfUM5Qmm5FfFStvkPmpUw/v+yOAZcXSzfKOq+gtESmRBU1rZfFMpmIlX3WqnRGDUuM1jLs+etpQ8X/cA5jn3/9vYby+jhKVndqMJhvhdAcYGel5DikmCnNaUgFG5jOcUgWq73hPzhmAX40SZ/1GB3pNNtKij5xtcv3fsIflkNM2aaGEP3ZM7N9qi+4s
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(41300700001)(966005)(8936002)(478600001)(52536014)(26005)(2906002)(6506007)(66574015)(83380400001)(7696005)(9686003)(186003)(5660300002)(66946007)(76116006)(66476007)(66446008)(4326008)(64756008)(54906003)(8676002)(66556008)(33656002)(38100700002)(122000001)(55016003)(6916009)(38070700005)(71200400001)(316002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LmfuBKv+ywhFLOld6PA5NavVdUxSpWcYQECluREjwIZdqNzrxG2n4WLvQ+?=
 =?iso-8859-1?Q?dEWsJEsaB1f83VkrSh3OMMUbQNz3XIWNReZ9ZswbKIF7sWMRKYf8rKlfKo?=
 =?iso-8859-1?Q?jZepgNA7LxEzeJOOUgCwFFXfdzNdH6Kg4c1Iu37Z6SEJ1oviVyWc0Rz0JK?=
 =?iso-8859-1?Q?Wvd6xHW8PPdBRy9JBFoDxpJH7eNEKawRS+iUXfRJfObrZb9m7k9tlopsEv?=
 =?iso-8859-1?Q?JWO9gylgNMDTVZD6l0yyG9T9c9M3bTqAclv+9zIll22im7yLhQCAKCccWb?=
 =?iso-8859-1?Q?PNezgkUkZSoXukR0kZT6fpfN7bIVryLxW/qbs1X+wnR0+W86tlDzEUs8tC?=
 =?iso-8859-1?Q?xKoqYk5sPFS42lET9+yp4NLiSJYEIk8j77N1sbKBFTzOEmItO9ISURGOyJ?=
 =?iso-8859-1?Q?actZJniR3helSWuRMg+IwGwM2eRQFLAYDgAoJnfetJeveRcUSVjN7PqJmt?=
 =?iso-8859-1?Q?yh2aQWiA+i7XjXNYiGA0c7ORH6mwqA0JHX1vh9mtF9WkUwK+Fr9WACVxzd?=
 =?iso-8859-1?Q?aHjXpqCI+qR7jINEgSYKEMkPPApW+/B/zyhueIaDd4gi6KJeObLXskII7o?=
 =?iso-8859-1?Q?WKK42tbNQETynelVLCKbEru7rKVSCFO1rjy8Y86BPQBBDujVouYbEvT6lk?=
 =?iso-8859-1?Q?cdAnmeJ/XG21gMDP+891qHi01nEGtY7Cx+VcE9Iq7dTrTf8Rc7OZNamq9l?=
 =?iso-8859-1?Q?9w9pEUvPb4gnr7c5HwDQ4Lyp+eANitKUeb9Y9kQwQ7ro6lhC46ISYl7U0K?=
 =?iso-8859-1?Q?w7Ll/Z/Vj0NWse6giy0YfG8LuIXgSND7ao6uL1YZ02syu5/dMVLSDqELdP?=
 =?iso-8859-1?Q?Nqnmn4XBNkRvWHI9hNQF0I/dI6OKPCoFho42/DV7wiLKM7SgE3o7ispUsa?=
 =?iso-8859-1?Q?j5JbWXwna0KaHkvfnwEbgR4tTIW3GoNC2NG02DUbadRbq67cXSIFm0zOCi?=
 =?iso-8859-1?Q?K40yzrUA0wXcVV6i5Fcn7QyPLBDH7No+8W40cNVVT+T+DdaB7FBSy22vwU?=
 =?iso-8859-1?Q?npScfBDJjTuINvCsVJa6DmWCYedym9nfW/hw739Y5SyLs6P3y7QTSBe6vJ?=
 =?iso-8859-1?Q?gL+1kjg8rZPQcXAsEhMVt9Hr3cRTPCzBEzynxm/HQDKaJYPLotCd41X03G?=
 =?iso-8859-1?Q?V/EHp1TIZgmtcSg9GsZZvpCiDebqE2VvB8SESAXl2JbGFY8TNZGz0H7ncx?=
 =?iso-8859-1?Q?g1gJ4fDYmLB27Vd5pFk2sO4OUMIYqM2UPQYLb2x3gMdLXYnIAg2oyLwRma?=
 =?iso-8859-1?Q?u7AycLy317Jvx6HDg97zNF9c4ofBHGcHo62YnAnlN7Ot0M3jdoq2Esl/40?=
 =?iso-8859-1?Q?XwQmX+kDZ3qZunfu3ZSA1liRJiTsnMpLgS+fzAv8GABhPxxP38JjYm7PRo?=
 =?iso-8859-1?Q?BPpjXtEnbg7f+S2UTsNbYD6KxIIvRo+gUMAm7FGgkqx0qqL7BE0uxrpJMB?=
 =?iso-8859-1?Q?EcBOhXGoNfagl/SlGMxNRj0sIb6g6/L4/Z/j3ACU6Zjn/PVMS89guinoYG?=
 =?iso-8859-1?Q?KZxGBLqNf3txA3WzSOKtwLuJy7snfq+9irG9GrXGpG1mQKgBb62/OPDnFk?=
 =?iso-8859-1?Q?GHOnexmxoHSXI4hhZCVOALsQNJUIZAk7cJ/RjOLBkbUi6wWGX2m6ucyAta?=
 =?iso-8859-1?Q?lIpit+PwjN/gMs5/GWcNSLEe6DwSrWMed6sJ5iVXzixuO0u4wgBrIDTA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: kontron.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2082.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d4cf96-483c-4bf8-9d01-08da5f4bfcee
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 12:35:19.6716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObEUD3EeeIe3SgFON/6c03U6zMXPtQqEm1FwkvqgPEfiPTXVOxtLbTR1wf9sOASfVsgz5J2iB+xLogoKVXoTdiyYNDwviJTzKBNBhoizqo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3802

Hi Lukasz,

> Dear Ganapathi and Sharvari
>=20
> > Dear Ganapathi and Sharvari
> >=20
> > > Hi Pali,
> > >  =20
> > > > On Saturday 08 May 2021 13:29:11 Pali Roh=E1r wrote:   =20
> > > > > + Sharvari and Ganapathi
> > > > >=20
> > > > > To let you know about this mwifiex firmware issue. Could you
> > > > > look at it?
> > > > >=20
> > > > > On Friday 07 May 2021 15:17:02 Lukasz Majewski wrote:     =20
> > > > > > Dear community,
> > > > > >=20
> > > > > > I would like to report that the version: 14.68.36.p204 of
> > > > > > sd8801_uapsta.bin binary (newest, SHA1:
> > > > > > ecdfcf8e2ca15f5682ab94fd30ba29fb869b24a7) has the issue with
> > > > > > getting channel info (HostCmd_CMD_STA_CONFIGURE command
> > > > > > execution).
> > > > > >=20
> > > > > > As a result the module seems to be stuck and no transmission
> > > > > > is performed.
> > > > > >=20
> > > > > > The issue is not present in 14.68.36.p146 verson of the
> > > > > > firmware.  =20
> > > >=20
> > > > And FYI, NXP has newer version 14.76.36.p139 of this
> > > > sd8801_uapsta.bin firmware in their mwifiex-firmware github
> > > > repository:
> > > >=20
> > > > https://github.com/NXP/mwifiex-firmware/commit/c38b125a920a695d360b=
62e8b1f7fb1c4e1afd46
> > > >=20
> > > > I hope that Sharvari or Ganapathi brings some light in this
> > > > issue...   =20
> > >=20
> > > Thanks for sharing this issue with NXP developers.
> > >  =20
> > > >=20
> > > > Lukasz, meanwhile could you try to check if this new firmware
> > > > version has this issue fixed?
> > > >    =20
> > >=20
> > > It looks like the issue is still there (even new errors pops up when
> > > compared to the original one):
> > >=20
> > > root@mx6ul:~# dmesg|grep sdio
> > > [   29.025231] mwifiex_sdio mmc0:0001:1: info: FW download over,
> > > size 262660 bytes [   29.310488] mwifiex_sdio mmc0:0001:1: WLAN FW
> > > is active [   29.390778] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd
> > > 0x242 error, result=3D0x2 [   29.398245] mwifiex_sdio mmc0:0001:1:
> > > mwifiex_process_cmdresp: cmd 0x242 failed during
> > > initialization [   29.707952] mwifiex_sdio mmc0:0001:1: info:
> > > MWIFIEX VERSION: mwifiex 1.0 (14.76.36.p139) [   29.717360]
> > > mwifiex_sdio mmc0:0001:1: driver_version =3D mwifiex 1.0
> > > (14.76.36.p139)=20
> > >=20
> > > root@mx6ul:~# ./tst_sdio.sh=20
> > > + wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > Successfully initialized wpa_supplicant
> > > + sleep 3
> > > [  251.425350] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> > > result=3D0x2
> > > + udhcpc -i mlan0
> > > udhcpc: started, v1.31.1
> > > udhcpc: sending discover
> > > [  256.476210] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> > > result=3D0x2 udhcpc: sending discover
> > > udhcpc: sending discover
> > > [  261.497057] mwifiex_sdio mmc0:0001:1: CMD_RESP: cmd 0x107 error,
> > > result=3D0x2 [  261.507859] ieee80211 phy0: sched_scan start :
> > > n_ssids=3D1 n_match_sets=3D1 [  261.515872] ieee80211 phy0:
> > > n_channels=3D13 interval=3D10 ie_len=3D0
> > >=20
> > >=20
> > > Please pay attention to the new "cmd 0x107 error, result=3D0x2" issue
> > > with this new FW version. =20
> >=20
> > Is there any update on this issue? Ganapathi and Sharvari, have you
> > managed to make the STA mode working on with the newest FW for
> > 88W8801 ?
>=20
> It looks like there was no update on the linux-firmware repository for
> sd8801_uapsta.bin binary in the official linux-firmware tree.
>=20
> I can share that I've tested: 14.68.36.p160 version with mwifiex driver
> on 5.4.y kernel and the STA mode works.
>=20
> The used NXP soc is imx6ull, and wi-fi is SDIO connected 88W8801.
>=20
> However, there is the issue with AP mode. Please find attached logs and
> reproduction procedure.
>=20
> Is there any schedule for releasing new FW for this wifi chip?
>=20

I'm facing similar problems with i.MX8MN EVK and u-blox wireless SDIO
module with 88W8801 SoC and mwifiex_sdio driver for linux 5.15.28 kernel.
I tried firmware 14.68.36.p204 and 14.68.36.p60. I'm not able to establish
a WPA protected link using wpa_supplicant.

You mentioned that you have tested with 14.68.36.p160 and 14.68.36.p146
firmware versions without having issues in STA mode. Where did you get
these firmware versions?

I was not able to find them neither in linux-firmware, mwifiex-firmware
nor imx-firmware repositories.

> >=20
> > Thanks in advance for sharing the knowledge.
> >=20
> > >  =20
> > > > > > For reproduction one needs to execute:
> > > > > > #! /bin/sh
> > > > > > set -x
> > > > > > wpa_supplicant -B -i mlan0 -c /etc/wpa_supplicant.conf
> > > > > > sleep 3
> > > > > > dhclient mlan0
> > > > > >=20
> > > > > > exit 0
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > I'm using the Azurewave AW-NM191NF module (with 88W8801 SoC).
> > > > > >=20
> > > > > > Best regards,
> > > > > >=20
> > > > > > Lukasz Majewski
> > > > > >=20
> > > > > > --
> > > > > >=20
> > > > > > DENX Software Engineering GmbH,      Managing Director:
> > > > > > Wolfgang Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194
> > > > > > Groebenzell, Germany Phone: (+49)-8142-66989-59 Fax:
> > > > > > (+49)-8142-66989-80 Email: lukma@denx.de     =20
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
> > > Denk HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > > lukma@denx.de =20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> > Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de
>=20
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
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

Best regards,
Thomas


Thomas Sch=E4fer
SW Design Engineer

Kontron Europe GmbH
Heinrich-Barth-Stra=DFe 1-1a | 66115 Saarbr=FCcken | Germany
thomas.schaefer@kontron.com

Kontron | Member of the S&T Group

Please find our mandatory legal statement https://www.kontron.com/en/imprin=
t
Please find our mandatory privacy statement https://www.kontron.com/en/priv=
acy-statement

