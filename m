Return-Path: <SRS0=l6so=R6=nxp.com=prashanthkrishnan.ranganathan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB6EC433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 14 Jan 2022 17:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7E03C36AEF; Fri, 14 Jan 2022 17:11:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01EC4C36AE9;
	Fri, 14 Jan 2022 17:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01EC4C36AE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3TpGBz698Tm8kl9FS/AfmbPeBRXGNrHoJ4rw3pPPfUiq8F3z16TtxdykmFtx/KC9SS/Cb1jtUUd4wprbynK5FMB75Hh1H8CfM3LGoimqlLf5hIU1zqruMn4wARlvLOFqVEAr/jCqyyDRUeuPXDIjzOX43mMUEt912Y4V62L1bN+HcHLHdvqNM+SswSkj9oEOY9N1+oSQqhodfm3XwCAMhpVxmUeteeQkzc3SligtNxy7bMllJiTc5Au7v2B9VNNoyDa/LbA4mOsgIXmM7cxhBHMGV8KlPZ6IEbXAg2Fe+Pxjb33NBuxPTKV7Rg3mP4Rfs7B66c0rQhy7AeKyN9N0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36oCQolnKz8Dfs1J+SQCtXBkB45VSQYCy3jp4PiJXVo=;
 b=PRJQD2F+Rc56AzayidrQ/Q2B/vV1QTgrH/tNT9xuhjJpDMsHZSj9dXWHjROnIHAoMsL9UeisHPWWYFAiBjm8q8wjR5pHYX+47WAdcyiqVGr0bHOi3j/fis/sbEAFQ2W5IHV3Cb4xcYDOR2Xdoqb79pgymSB8qtx2F2p2P3LpDvB+lz6N3lET6XYV5kuUyzUgv3cDGOoXTMpIKHloK6iIOoNqpDQdkRfLPzQukTnH2j/DSRl1gdYAWu2cYtDeo6uh0XGdsbPbsfMouJmoTKMJSPWRC5DwHYiIKJjfwMqumKnUQFfSvfeiq/JDdYfnFxhHHJm+dKna/zi/k/xjRm+5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36oCQolnKz8Dfs1J+SQCtXBkB45VSQYCy3jp4PiJXVo=;
 b=h6M+Kn1RrQAkZunif45ZJc2N4u4CCkluGOXpOXY+Pu/5x43NeJTxB0P2cXg/d5TpGp3h9BidVYUTlifTdOCvWtUfQdIhewOO4EueWOSDWfKhQ0VgOYiH8OYVSlexMLY1j3VhRugumfVqYUCIR+kozzZwWCqS9DLIyLDj+r2XHBA=
Received: from AS8PR04MB9192.eurprd04.prod.outlook.com (2603:10a6:20b:44f::17)
 by PAXPR04MB8670.eurprd04.prod.outlook.com (2603:10a6:102:21d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 17:11:18 +0000
Received: from AS8PR04MB9192.eurprd04.prod.outlook.com
 ([fe80::e554:c5e:d0ae:ad5]) by AS8PR04MB9192.eurprd04.prod.outlook.com
 ([fe80::e554:c5e:d0ae:ad5%4]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 17:11:18 +0000
From: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>
To: =?iso-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>, Sharvari Harisangam
	<sharvari.harisangam@nxp.com>, Rakesh Parmar <rakesh.parmar@nxp.com>, Cathy
 Luo <xiaohua.luo@nxp.com>, James Cao <james.cao@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Linux Firmware <linux-firmware@kernel.org>, Linux Wireless
	<linux-wireless@vger.kernel.org>, =?iso-8859-1?Q?G=E9rald_Kerma?=
	<gandalf@gk2.net>, Ganapathi Bhat <ganapathi017@gmail.com>, Josh Boyer
	<jwboyer@kernel.org>
Subject: Re: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is
 buggy
Thread-Topic: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is
 buggy
Thread-Index: AQHXsjIkrH+c5d+NGkGF4Z68ViIA3qu2Ii8AgAHF0oCAq4QsgIAAAsiC
Date: Fri, 14 Jan 2022 17:11:18 +0000
Message-ID:
 <AS8PR04MB9192076DB3CB59EC049B7B9CFB549@AS8PR04MB9192.eurprd04.prod.outlook.com>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
 <20220114170051.sx2p6m2ihrv3ojzt@pali>
In-Reply-To: <20220114170051.sx2p6m2ihrv3ojzt@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16c11278-061d-407a-0959-08d9d780e14c
x-ms-traffictypediagnostic: PAXPR04MB8670:EE_
x-microsoft-antispam-prvs:
 <PAXPR04MB86705A0263B8D037E27019E2FB549@PAXPR04MB8670.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3+VZxnKmTHB3xZpV6Hx9ED1529OSnw/Wc24JOV5Wnysc86sP4FcKW64NZdWjBWKIEBOHIpxLavSom4P4LbVNb27Gd6Ga7OPAunmRx+VltKFo4d3404PXKqMvZ2P7vX7U4h3GjlyvXGUso/5QdSpHIE6GoxuJf7mQIQf0RWMBN/uxmh7OZ4Aa9OAwYHFXBeuS3vIJo3sR2AI9PTGkAZqg9H/qpfy7Kr9pWGLaD6qtHwGl5M00V1CrZc9P2kaltPDHAOmWaG/TchATqfuhkYsO/bD2nDbzyrVy7NXtb/Hg9Cb7KL36GUJUjykDtbFtxor8Zza1VqIavY9Lzo4trZ9ePVcU1Ya5/iCs/nvJI+i4ZhVqTg3HCLAtpdp7UKaJK2FUpmRZyPkXRDjyKBVPza4t4hYDehAcIJ14DpnbDp64YiKBR+5XysMpVSg23IXAN/l7MQfwJ//+s0V9V12ZYWyhP0nt0opxJY8IdCZ3FKWPZL7c/CCq+sE1EU77eiPd5cqBpiF1iO0jmSehhuzVdsKr5uiAyiq0DTVjWNKqy6ImjJCupLR9gVxAjGy+bTDaL1C7JKmycMCBOaGZt+bz7s2rQY+Dg1jOqrjJ6vui9MwxMjVfbnsGTrMPXWDpb26ifX6xbcTN/mmVI0X/+73JS6jOxPQ6zNskeAbu8jbk6ywynUOiJNnVL3r64+LqiIsvqkb6YcHFCJC/ZSCW2kozEX7eCmk51/wQ8XiI+Sj1ZptVkuEQyqRyIf+Rct2Ok0Y2brnTQt3pEBOVL0zZCPhJq5HwtU7gVfWosQRa9hmIXlipGK6g8gHADOD8+YPosmBtEyG5kMcdRAAJO4m/jloyexaKwg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9192.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(52536014)(66556008)(91956017)(45080400002)(122000001)(2906002)(66446008)(9686003)(38100700002)(83380400001)(76116006)(66574015)(54906003)(38070700005)(66476007)(316002)(64756008)(55016003)(8936002)(508600001)(8676002)(33656002)(53546011)(6506007)(66946007)(966005)(86362001)(5660300002)(110136005)(186003)(4326008)(6636002)(7696005)(166002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6ifdP4rWnjOhE4xk5TbbVVa2Rg4tIl+obb3knQGqBjtoWW9i2pumhDoZe1?=
 =?iso-8859-1?Q?8RC7Ii7VwA5T/NCpFhnsL22I41BfTJN0zIwrBh4uckcX1QrN78MMnkhpJG?=
 =?iso-8859-1?Q?cu2TVMghgHrmnk4O6JdoScrFPj3lUbeXg3sDx+mcJw1Fg9RCTxwnwCQbq8?=
 =?iso-8859-1?Q?PMn1xt7XohwABzjupNoPoY1+NUBUowUViHJdkcQiY+SzJd8Vbty21O1S7r?=
 =?iso-8859-1?Q?T9ySsQ/4w1d8jtddG6Tl9B54n7inzOXiHJ3IJ9AEULgGRVxhhckrXO/PrL?=
 =?iso-8859-1?Q?+FH7mWyxPAo+rlAWDEBAOsESrD/NvqE5rfHncgNmIbmPDikDQU4kKr1vRC?=
 =?iso-8859-1?Q?yYt8CjOmJ6fYjxOGF8XjNjW36DTDqrLw1YA3f55BNGmfj8SJ/LQ4fd24w0?=
 =?iso-8859-1?Q?cbjy/lY9ApaS+CfXdNFS1Li49WRe2CgpvbfVZi5cgTSSipMbBsJBVWi8Gm?=
 =?iso-8859-1?Q?miLoY1+ususl7xvBE0e8pdn2A3R89glSTokFw9BJ8i5Vxf843vpbEbp4eL?=
 =?iso-8859-1?Q?FKC/Fe2l//P+nmUwnD0IwjT7FzxWdUykDL78kNp/ypwxsJ2LcdVzfu4651?=
 =?iso-8859-1?Q?7E4PMapZidjMhV65To3lOOWr7uIjIz4zH2eALzWUSy+fwJdcZ7AwjZsjgW?=
 =?iso-8859-1?Q?tSAAENzJrZR2GeIxW38YsYPbaDYN8mHV1/apP6pRole5o2UR9Y5jRz/ZhP?=
 =?iso-8859-1?Q?D5ZJBI5vw1GXZ7OPWlEBjd2E6zC7p4EMDRssG5Z8iLlOWM9freek4FwWuA?=
 =?iso-8859-1?Q?a0HvrDux2+0F3JhnKXIJHgk7aCXycDKGOacoSxB7Cx5y28hdBBZAWT+GbZ?=
 =?iso-8859-1?Q?QNlCW9QtOBeiakrc0Pb/KfVmIWDu71mEjirE7rxRo6rnTnazZ2YQOm8dZ5?=
 =?iso-8859-1?Q?heQdCRTD0R6C7Uy7MTmMN9BjCyiENAlc7u2cqqSf1BNm9FadT7eHRSmZGc?=
 =?iso-8859-1?Q?KCjeaAjxQi4GAliECoi1u/s0+QcZwxxSV3YXre88V4Gw1pBiEG8Ls8/FkM?=
 =?iso-8859-1?Q?lytIckkfbyX88fGDQK088E8iSU7P+mONicWd/4ICEBV4GUysSXyhl4p3Jb?=
 =?iso-8859-1?Q?da+D0zgcBtzeef41CsTyHchQIFgVnCEHjryspYjGV0oMan2qC4W1/2emEY?=
 =?iso-8859-1?Q?8Jg7cO2BlFvTmD6x+9c4zBA3p+HH+rjC3rQZB7obQqVDw5sxxFso0GZ61R?=
 =?iso-8859-1?Q?T8/0hIILYpMK4Z1Gj228a898uewyewOGZKr+ibxGv7C3P8Qnx/H8b9I9Xt?=
 =?iso-8859-1?Q?VGTC+1qHw326717JstkHU2BQjyCHuajbjFH6t1mu2DFKWuAk8LRLHc9bLN?=
 =?iso-8859-1?Q?l1Asr4aZKAzMjxBuKdpOU70kY5ZOVHOWuOLJ1vMHSlhSMRs6iSf84wp6Ad?=
 =?iso-8859-1?Q?o+4wKbySj2EJfQSo7X9YlkHsf8ADeh4qMfckvNgPcFYgAeePEvCp23lmXO?=
 =?iso-8859-1?Q?MqRjQLPHz9T653oVqvpLRDDIYJPbk4sKRY5D9i9ilGrMv5TeP+cpxu5sug?=
 =?iso-8859-1?Q?8tWcAbQ5xNJb/TG8iKo4sftoiDoX1BqpdM5RviPPqcspveZ27vq0EI9uPP?=
 =?iso-8859-1?Q?jYaBri2m1rnrirccGqojoN0y6W/3h6MDC0rS3il+mOnyVlb4zxrAEqNah5?=
 =?iso-8859-1?Q?nquYyUgiCrVfefN33C9yQXnr6g/UATL4cHFpa8ge5nxwEbXN+589Iyjxu3?=
 =?iso-8859-1?Q?kST7G7aM621AzlJRJn2pLkligg8GNCj5CdaVNYHJDzWaqd1p/tFfleCwNE?=
 =?iso-8859-1?Q?a1tlqev+rNEY5O07Xuw6cQDlioSBDzXXSWJJStwMfU9oa13M39fWvily1K?=
 =?iso-8859-1?Q?5UAgQeSfAPbMkNYlWLJQ6yX1gXFJXEIFskudwg3DL0Brfq8kTZIq?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR04MB9192076DB3CB59EC049B7B9CFB549AS8PR04MB9192eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9192.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c11278-061d-407a-0959-08d9d780e14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2022 17:11:18.4341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: avQuioRBOo1jxm+SrjuEuIPgYYmykei2LH61/jVIM4GK0TG98pGLDpmPJTxMvzWz/84zXDHUzIPSA4MXF0ZZ9GczpCO7rm/cixnrJH1v/XpiM8xLFXJOBXp1VWsFTFj9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8670

--_000_AS8PR04MB9192076DB3CB59EC049B7B9CFB549AS8PR04MB9192eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Pali,
Please allow me to check this and respond ASAP.
Best,
Prashanth
________________________________
From: Pali Roh=E1r <pali@kernel.org>
Sent: Friday, January 14, 2022 9:00 AM
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rakes=
h.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; Prashanth Ranganathan <=
prashanthkrishnan.ranganathan@nxp.com>; James Cao <james.cao@nxp.com>
Cc: Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wirel=
ess@vger.kernel.org>; G=E9rald Kerma <gandalf@gk2.net>; Ganapathi Bhat <gan=
apathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is b=
uggy

Caution: EXT Email

NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at
this issue? It is really serous!

On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=E1r <pali@kernel.org> wrote:
> >
> > Hello Josh, Sharvari and other from NXP!
> >
> > On Saturday 25 September 2021 19:23:48 G=E9rald Kerma wrote:
> > > Correcting old marvell address to new nxp...
> > >
> > > Le 25/09/2021 =E0 19:19, G=E9rald Kerma a =E9crit :
> > > > H=E9llo All,
> > > >
> > > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechnolo=
gies,
> > > > because of problem with the WiFi.
> > > >
> > > > I have done some quick tests on all the firmware of PCIEUSB-8997 us=
ing
> > > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > > >
> > > > Here is a summary of the tests :
> > > > - W16.68.10.p159 =3D KO
> > > > - W16.68.1.p195 =3D KO
> > > > - V16.68.1.p145 =3D OK
> > > > - 16.68.1.p140 =3D OK
> > > > - 16.68.1.p133 =3D OK
> > > > - 16.68.1.p97 =3D OK
> > > > - 16.68.1.p70 =3D KO
> >
> > From this user test result can be seen that last two versions of
> > pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> > official mainline linux kernel driver mwifiex were not properly tested
> > internally in NXP and are causing serious issues which make 8997 card
> > basically unusable.
> >
> > Sharvari and other NXP developers: Do you have some internal testing of
> > this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> > wifi chips? Or are you aware of this issue and do you have in NXP some
> > workaround for it (e.g. at driver level)? Could you please look at this
> > serious issue and try to debug firmware and release a new version, as
> > this is obvious fatal error in firmware itself?
> >
> > Josh, how you in linux-firmware repository handle such, I must say,
> > "fatal issues"? Wait for vendor fixes or revert problematic commits? Or
> > something else?
>
> We can revert if we need to, but I think it's not quite that simple.
>
> > Because when users starts upgrading linux-firmware packages in their
> > downstream distributions then basically wifi cards on this 8997 chips
> > with official mwifiex driver stops working.
>
> The first broken version was committed in Feb of 2019.  That's
> approaching 3 years ago.  Given that this is binary firmware, I have
> no idea what else may or may not be included in the updates in the
> meantime.
>
> josh

Josh, as G=E9rald wrote, current binary in linux-firmware repository is
unusable. And there is no reply from NXP for 3 months.

You are right that nobody knows what is in firmware binary, but working
binary is at least usable than non-working binary.

So I would really suggest to start reverting non-working firmware files
if NXP does not respond in few days.

G=E9rald, what is your opinion? Do you see other way how to make mainline
linux driver work (again)?

> > > > REF (and all details of tests) :
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;data=3D04%7C01%7Cpras=
hanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C68=
6ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C3000&amp;sdata=3DDt9GPodlLhnKXOvovRMHabvd5DLiEQ3We4%2FsMBDfMQw%3D&amp;re=
served=3D0
> > > >
> > > >
> > > > Broken firmware :
> > > >
> > > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included =
into
> > > > linux-firmware repository by this pull request:
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9=
hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cprashanthkrishnan.ranganatha=
n%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c=
301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dvr9a=
9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%3D&amp;reserved=3D0
> > > > <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR=
9hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cprashanthkrishnan.ranganath=
an%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5=
c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dvr9=
a9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%3D&amp;reserved=3D0>
> > > >
> > > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| b=
y
> > > > this pull request:
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tE=
Xm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cprashanthkrishnan=
.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6=
fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;s=
data=3DV2pZdm8AMwhdFUa%2FMyodXk8BW6hJEiTvguxqFBQgEpI%3D&amp;reserved=3D0
> > > > <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-t=
EXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cprashanthkrishna=
n.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c=
6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;=
sdata=3DV2pZdm8AMwhdFUa%2FMyodXk8BW6hJEiTvguxqFBQgEpI%3D&amp;reserved=3D0>
> > > >
> > > > Olders looks to works better.
> > > >
> > > > In quick tests, they allow more than 1 clients at a time !
> > > >
> > > > I am still testing the V16.68.1.p145 and report the results after s=
ome
> > > > longer use...
> > > >
> > > > Hopes it will help...
> > > > Regards,
> > > > G=E9rald Kerma
> > > > gandalf(at)gk2(dot)net
> > >

--_000_AS8PR04MB9192076DB3CB59EC049B7B9CFB549AS8PR04MB9192eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div>Hi Pali,</div>
<div>Please allow me to check this and respond ASAP.</div>
<div>Best,</div>
<div>Prashanth&nbsp;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Pali Roh=E1r &lt;pali=
@kernel.org&gt;<br>
<b>Sent:</b> Friday, January 14, 2022 9:00 AM<br>
<b>To:</b> Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; Rakesh =
Parmar &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.com&gt;=
; Prashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.com&gt;; Jame=
s Cao &lt;james.cao@nxp.com&gt;<br>
<b>Cc:</b> Linux Firmware &lt;linux-firmware@kernel.org&gt;; Linux Wireless=
 &lt;linux-wireless@vger.kernel.org&gt;; G=E9rald Kerma &lt;gandalf@gk2.net=
&gt;; Ganapathi Bhat &lt;ganapathi017@gmail.com&gt;; Josh Boyer &lt;jwboyer=
@kernel.org&gt;<br>
<b>Subject:</b> [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmwa=
re is buggy</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: EXT Email<br>
<br>
NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at<br>
this issue? It is really serous!<br>
<br>
On Monday 27 September 2021 09:47:23 Josh Boyer wrote:<br>
&gt; On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=E1r &lt;pali@kernel.org&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; Hello Josh, Sharvari and other from NXP!<br>
&gt; &gt;<br>
&gt; &gt; On Saturday 25 September 2021 19:23:48 G=E9rald Kerma wrote:<br>
&gt; &gt; &gt; Correcting old marvell address to new nxp...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Le 25/09/2021 =E0 19:19, G=E9rald Kerma a =E9crit :<br>
&gt; &gt; &gt; &gt; H=E9llo All,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I made some few tests on EspressoBin-Ultra from GlobalS=
caleTechnologies,<br>
&gt; &gt; &gt; &gt; because of problem with the WiFi.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I have done some quick tests on all the firmware of PCI=
EUSB-8997 using<br>
&gt; &gt; &gt; &gt; the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Here is a summary of the tests :<br>
&gt; &gt; &gt; &gt; - W16.68.10.p159 =3D KO<br>
&gt; &gt; &gt; &gt; - W16.68.1.p195 =3D KO<br>
&gt; &gt; &gt; &gt; - V16.68.1.p145 =3D OK<br>
&gt; &gt; &gt; &gt; - 16.68.1.p140 =3D OK<br>
&gt; &gt; &gt; &gt; - 16.68.1.p133 =3D OK<br>
&gt; &gt; &gt; &gt; - 16.68.1.p97 =3D OK<br>
&gt; &gt; &gt; &gt; - 16.68.1.p70 =3D KO<br>
&gt; &gt;<br>
&gt; &gt; From this user test result can be seen that last two versions of<=
br>
&gt; &gt; pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with=
<br>
&gt; &gt; official mainline linux kernel driver mwifiex were not properly t=
ested<br>
&gt; &gt; internally in NXP and are causing serious issues which make 8997 =
card<br>
&gt; &gt; basically unusable.<br>
&gt; &gt;<br>
&gt; &gt; Sharvari and other NXP developers: Do you have some internal test=
ing of<br>
&gt; &gt; this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 89=
97<br>
&gt; &gt; wifi chips? Or are you aware of this issue and do you have in NXP=
 some<br>
&gt; &gt; workaround for it (e.g. at driver level)? Could you please look a=
t this<br>
&gt; &gt; serious issue and try to debug firmware and release a new version=
, as<br>
&gt; &gt; this is obvious fatal error in firmware itself?<br>
&gt; &gt;<br>
&gt; &gt; Josh, how you in linux-firmware repository handle such, I must sa=
y,<br>
&gt; &gt; &quot;fatal issues&quot;? Wait for vendor fixes or revert problem=
atic commits? Or<br>
&gt; &gt; something else?<br>
&gt;<br>
&gt; We can revert if we need to, but I think it's not quite that simple.<b=
r>
&gt;<br>
&gt; &gt; Because when users starts upgrading linux-firmware packages in th=
eir<br>
&gt; &gt; downstream distributions then basically wifi cards on this 8997 c=
hips<br>
&gt; &gt; with official mwifiex driver stops working.<br>
&gt;<br>
&gt; The first broken version was committed in Feb of 2019.&nbsp; That's<br=
>
&gt; approaching 3 years ago.&nbsp; Given that this is binary firmware, I h=
ave<br>
&gt; no idea what else may or may not be included in the updates in the<br>
&gt; meantime.<br>
&gt;<br>
&gt; josh<br>
<br>
Josh, as G=E9rald wrote, current binary in linux-firmware repository is<br>
unusable. And there is no reply from NXP for 3 months.<br>
<br>
You are right that nobody knows what is in firmware binary, but working<br>
binary is at least usable than non-working binary.<br>
<br>
So I would really suggest to start reverting non-working firmware files<br>
if NXP does not respond in few days.<br>
<br>
G=E9rald, what is your opinion? Do you see other way how to make mainline<b=
r>
linux driver work (again)?<br>
<br>
&gt; &gt; &gt; &gt; REF (and all details of tests) :<br>
&gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&am=
p;amp;data=3D04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248=
544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377777=
64622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DDt9GPodlLhnKXOvovRMHabvd=
5DLiEQ3We4%2FsMBDfMQw%3D&amp;amp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;amp;data=3D04%7C01%7Cprashant=
hkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1=
d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3=
000&amp;amp;sdata=3DDt9GPodlLhnKXOvovRMHabvd5DLiEQ3We4%2FsMBDfMQw%3D&amp;am=
p;reserved=3D0</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Broken firmware :<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| w=
as included into<br>
&gt; &gt; &gt; &gt; linux-firmware repository by this pull request:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6=
ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cp=
rashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7=
C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000&amp;amp;sdata=3Dvr9a9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%3D&a=
mp;amp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40=
mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cprashanthkrishnan.ranganathan%40=
nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c3016=
35%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dvr9a=
9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"https://eur01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F81=
20B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C01=
%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70=
ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000&amp;amp;sdata=3Dvr9a9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%=
3D&amp;amp;reserved=3D0">https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%=
2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cprashan=
thkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea=
1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000&amp;amp;sdata=3Dvr9a9ZEDsOPqNyafaEbAJ69CU9RgpXIvzpYMvhRv5GE%3D&amp;amp=
;reserved=3D0</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; And latest version |W16.68.10.p159| of |pcieusb8997_com=
bo_v4.bin| by<br>
&gt; &gt; &gt; &gt; this pull request:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2B=
CRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D=
04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02d08d=
9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637777764622094175%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DV2pZdm8AMwhdFUa%2FMyodXk8BW6hJEiTvgux=
qFBQgEpI%3D&amp;amp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-A=
mMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cprashanthkrishnan.ran=
ganathan%40nxp.com%7C1af6972248544d58a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92=
cd99c5c301635%7C0%7C0%7C637777764622094175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;s=
data=3DV2pZdm8AMwhdFUa%2FMyodXk8BW6hJEiTvguxqFBQgEpI%3D&amp;amp;reserved=3D=
0</a><br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"https://eur01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on=
7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;dat=
a=3D04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58a02=
d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377777646220941=
75%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DV2pZdm8AMwhdFUa%2FMyodXk8BW6hJEiT=
vguxqFBQgEpI%3D&amp;amp;reserved=3D0">https://eur01.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA=
5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;=
data=3D04%7C01%7Cprashanthkrishnan.ranganathan%40nxp.com%7C1af6972248544d58=
a02d08d9d77f70ac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377777646220=
94175%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I=
k1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DV2pZdm8AMwhdFUa%2FMyodXk8BW6hJ=
EiTvguxqFBQgEpI%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Olders looks to works better.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; In quick tests, they allow more than 1 clients at a tim=
e !<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I am still testing the V16.68.1.p145 and report the res=
ults after some<br>
&gt; &gt; &gt; &gt; longer use...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hopes it will help...<br>
&gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; G=E9rald Kerma<br>
&gt; &gt; &gt; &gt; gandalf(at)gk2(dot)net<br>
&gt; &gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8PR04MB9192076DB3CB59EC049B7B9CFB549AS8PR04MB9192eurp_--
