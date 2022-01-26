Return-Path: <SRS0=fbOo=SK=nxp.com=james.cao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF85DC433EF
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Jan 2022 23:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5E9FC340E9; Wed, 26 Jan 2022 23:28:54 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150050.outbound.protection.outlook.com [40.107.15.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A958C340E6;
	Wed, 26 Jan 2022 23:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A958C340E6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etkOdmiM8hpXxQHEcwhyRomr3ZKLGbgiuiVftGcgjZ2ud11NvN2nfnhAhE9PmtOSB2b7YPKYAsdj7Dpy750ZAYH3RpDTjv4GW1Am84xNviwMynVlK5G29YEsYwRRyhWUbsetWv50LmxaTSqgnEdOGyiWY4HrJWEg+L2c/JPR6VeBu7mxg8H2fuuU5TfuGnQrCddK/78CTzrCNTKb1f5dKn8XQJkO/bU/5eswAn9u6866elHw+LJLD9MDmcU7d/daHiP+OSNEMnSJovV7M2WzxCtkCVVvOcrJr6biiv3/gNEzrmqwADvMU/80qrgDvTPbkAVH6tUoq0Hf2O2Bc/4K+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gi05xNEj9qka9guv+FanT3i13ri+iV6/xuhqqFBYcLE=;
 b=N0Oaf2xq1Cy4Rw52us81Mrc7oPH+t1viuEXBzv25Zwbqru1UsIu2x0yd0a/k48m6m+rcGkpMcnJxAq7PYluj9x3vmL4uB1PZv++iFEZ0+ULR7l5rHwY6vyHswe9CcYz3kYXowgNVHt54zkm5hvqMEhlNeVLm1n3Q8gbcaDZ625RtHUFH6IuFJVb+Sz0fTHlYKM8HBSIEi+F8oYoFafAv+wSMsrwKHyMXNx5ULIGciLgVpjE9R7KERRAxjGLKoPtVdIzNrEVsRVimRc+BxK4JltYwIv+0RynDJT3JFU3aCmBTkLYqB6QnWMdfgR5qNWF65076XwMxEmG8fEZQdxrDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gi05xNEj9qka9guv+FanT3i13ri+iV6/xuhqqFBYcLE=;
 b=DyExrKrqzTJgCB/CbaqISalbLQZ/NtaoOFZpyWEDg8kGX1RTU+ywB9UC0qRgNykoRt23zVdagrYSuyV2Lrg1uQ+YdVarGiQaMXsrSmImajXjpgdSNvGMC8t2CW8wLoQvtYkz2f0AY3wpr842JBQvt0I/kIsZLzcL/wO7xvGBskw=
Received: from AS8PR04MB8419.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::14)
 by VI1PR04MB4703.eurprd04.prod.outlook.com (2603:10a6:803:61::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 23:28:49 +0000
Received: from AS8PR04MB8419.eurprd04.prod.outlook.com
 ([fe80::78d4:2e14:7806:d9bc]) by AS8PR04MB8419.eurprd04.prod.outlook.com
 ([fe80::78d4:2e14:7806:d9bc%5]) with mapi id 15.20.4930.017; Wed, 26 Jan 2022
 23:28:49 +0000
From: James Cao <james.cao@nxp.com>
To: =?iso-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>, Prashanth Ranganathan
	<prashanthkrishnan.ranganathan@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Sharvari Harisangam <sharvari.harisangam@nxp.com>, Rakesh Parmar
	<rakesh.parmar@nxp.com>, Cathy Luo <xiaohua.luo@nxp.com>, Linux Firmware
	<linux-firmware@kernel.org>, Linux Wireless <linux-wireless@vger.kernel.org>,
	=?iso-8859-1?Q?G=E9rald_Kerma?= <gandalf@gk2.net>, Josh Boyer
	<jwboyer@kernel.org>
Subject: Re: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is
 buggy
Thread-Topic: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is
 buggy
Thread-Index:
 AQHXsjIl5WzMUpLebkOgXhaYFiPJUau2Ii8AgAHF0oCAq4QsgIAAAusAgAmU74CACavsUQ==
Date: Wed, 26 Jan 2022 23:28:48 +0000
Message-ID:
 <AS8PR04MB8419C8377C9458ADA340AC24E0209@AS8PR04MB8419.eurprd04.prod.outlook.com>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
 <20220114170051.sx2p6m2ihrv3ojzt@pali>
 <AS8PR04MB9192076DB3CB59EC049B7B9CFB549@AS8PR04MB9192.eurprd04.prod.outlook.com>
 <20220120193041.fmmmd77ingjvyqe4@pali>
In-Reply-To: <20220120193041.fmmmd77ingjvyqe4@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d1dffef-16e5-479f-21f6-08d9e1239b05
x-ms-traffictypediagnostic: VI1PR04MB4703:EE_
x-microsoft-antispam-prvs:
 <VI1PR04MB470342D404F516FF40257EB4E0209@VI1PR04MB4703.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Eh7+5gPZ1X6fTDFCNZev90T0qnMgINNnYV5zW0So1uf2liUFYNmijI2NplzlFUMPXMIq/HYHkxc9hD+axU4mzbLjY0TR+GO8wYBml8lM7QeJtOKSWSkzKot5MtRKyS7AL2mtkKR7t/DHCb9PX0XvW5f6uRvEYcf8WFULEj48JpYhnStaIny6iIBSnK8S+AWZh5yZd0f8A670TYB1QlYEBeoQscoIeAQ+8aP/jvVYk46x+my9WyrKpRVLLerGiQ3+II25tw1P45gZ6myf2KQS84NbfQ0oTj1OAqer6og/0ogZkqS/1cq6CkQ2tIMXLKEbi1nXhXHeyES4iio4ZxjnjEAZr+6WV8ON8ibEAt1wSxbURQBPA1LaA8l9xylCw5GtjxW9TdUHM8Ev0sFtzpGmbEDhEgsirhawZojdDVveVLJLranvVsBzfoOqDXreGmG+rXBdsp5r86TS1dOKIf0bBRD7tl9scj4hSnk40kZx2Ut4GxM31VdbkzXNpERQpS6TpPW699H1bHz4fbXIP3aC/+QxwCfev1e0PLfFbPrgc4O7+AkWYr9IGmqYw5H90h3CoQr+/f2kN+CbjZFcvRyel7Di0mr3bVBIRY+7py2v94BuM/rLlDcavy0qpAF8k0VzVygjgdgQkWubEoKzXX5tfsRD1j+khOFv93IZzUwSUyJbX7vmxUC//7HcEMeyklg6It4X+DHMxA+BMU+vFQNpM7XYPU9BzSpPp2+g3Xin1QsuxlBpZSJZbDI8RE5ibYJR9SIPaNZBjET2STWd+GX6f784GJo+wxgq1pc6VlvuPT8qlHrRS1GRYXeL+l3p6isB0LgJivctq+D3jHeTp/Gqeg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8419.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(166002)(55016003)(26005)(966005)(2906002)(8936002)(38070700005)(64756008)(8676002)(5660300002)(83380400001)(66946007)(66446008)(66476007)(86362001)(52536014)(4326008)(66556008)(91956017)(76116006)(186003)(44832011)(6636002)(54906003)(316002)(38100700002)(53546011)(7696005)(122000001)(66574015)(71200400001)(110136005)(19627405001)(45080400002)(33656002)(6506007)(9686003)(508600001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MKIryAYbffhQspMZI9c1A2mdCAUzwv/Nt7fwJiS4kkArB4tg3Vrq49KaOh?=
 =?iso-8859-1?Q?1DBvmsv75N8IBiohNfIACLAdU5NrQ/WT8hZqXw/VtrojarPgZRm2tFIMz/?=
 =?iso-8859-1?Q?+raqbIq4wAtpzBIcmXUrTLbCnBubY+fqF9DSbMEt7pCipdZ4yGGE+PvEXy?=
 =?iso-8859-1?Q?3Hj8kSMZbvLbA0xMSF3uWjr79P7Ff7BsP4UUvXg1FrapSw0ZpFZenNzBY0?=
 =?iso-8859-1?Q?lbbay6cHf9RoWDEJYnu8D+3slUPJ6Zo5ZsZaGxQfalZPXkdjXXhG2uPVeF?=
 =?iso-8859-1?Q?6CEdkEj5m1JBqcuoxMma54GU5NGN4qrypszGPophqJ0ub5LiW8b+sWnkzV?=
 =?iso-8859-1?Q?lfAYMl/VBTjD/Dbd0v3Ngi/GN0zkMM69qcGa4ngPGZXxe+MgVKUT02GDnc?=
 =?iso-8859-1?Q?JenFMi/ufpiJRcuiK7X/f82ork9G3MDLnR34ykoBEc1Vdi5VapuxNAvBHI?=
 =?iso-8859-1?Q?nfWmMmpijrAXT+OxiCA6k6boSmKYJMa0PQ31/GqQipZdrZNNCbZsGGIK59?=
 =?iso-8859-1?Q?DFHq/JDlnIEVNMXMqZ1rw09+ok++/EIizrjcPM4H0bLcJZa/II0k1MuXEM?=
 =?iso-8859-1?Q?+8rKvY+o2wvhzVwZDROdSwHDd203YFHHetpWZUS8GGPaIUvVsDVk0LKi8J?=
 =?iso-8859-1?Q?ZjSMp166iwtv/b8JR95I4Gk9KSOLag0ufMf5mXf9gNYKur0/VmwOYN3/6C?=
 =?iso-8859-1?Q?RiKDbSc4sPbZYy93KZWfTVNuPdr3wQBz0EBPtxM54K6kzN0Qc7JYqQ6pC8?=
 =?iso-8859-1?Q?1Qhc0wjDTQk+IZ9kuq8SrxCOqXMHFk9aqJPYUBLcBRBeVQWL0M7oFoad1q?=
 =?iso-8859-1?Q?estVtwH/8m/k66ffLcLkO7lDpWZ3ajcySNkc+YpOTwo+7wQUAxW9NXhOPV?=
 =?iso-8859-1?Q?z2vvoSCEJu8uYtKHBMT0IpOWDmfKA/qFPlXFqD9hoWmHem2LJUDVmfs321?=
 =?iso-8859-1?Q?6c9WF8+0nsCqFfX1SS65C4gAN8I0fLn0Ib/PN11mGH5Ix127fqBcW7jCd/?=
 =?iso-8859-1?Q?KQZgdOCB0gveioXB5nCIgNPPVquIFCsNDfMHtXL2KwQuLfRhH4P5x0vk/Q?=
 =?iso-8859-1?Q?ik2Rr5tU94VqRRMA5ddFKlszGNFC/hWXK+oVX6RHP17KOlRNgNknVi7hmj?=
 =?iso-8859-1?Q?W41IjbPAPdyuyWTqWOpAcmX7cclvyA2XgSSysjm6gviAi7QqZH6JPrrMqp?=
 =?iso-8859-1?Q?55srQT9vScYjYyQtteh/2doeqsFhK/rto2/9xR+3nnbusLlEubgaENQZmT?=
 =?iso-8859-1?Q?LIIF5gJ2lclxEg0qb93EM/3kmEnN6VdlmsvSrWr8ZT+LoW3VeXyc6cJJEF?=
 =?iso-8859-1?Q?B0FoedMzhLQ6vq0bhpQ3u9F0R7A3qlyZQnv3TVvUrB642XAx9G+vBCE+vd?=
 =?iso-8859-1?Q?7/awRFLLh4kCgcJ+suCn+4TMLmQwPFJEq01a5W9TJJqb2mFZek5j/3dxTZ?=
 =?iso-8859-1?Q?S3VjCPPflAibbSCEy6HRRR3mClU181D5S7ZB/BEGeSwS8i4YOGKeKY+Tcn?=
 =?iso-8859-1?Q?VOrrXTPCiochVt7i5VfBBvi25Ek6MKXILwLfPQBx0C74uRdn8bq1cQ77OY?=
 =?iso-8859-1?Q?4C8aGlpmUmWjnwTBQpik6+pl5+dLLXty4F6JkBkiChVTLjtVA1jDTuoy+1?=
 =?iso-8859-1?Q?VCpQY93bzkHLV5on6HK1QF54R7HRy7BA8C45nvhJTDzJUNeDNIh4Y2zg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR04MB8419C8377C9458ADA340AC24E0209AS8PR04MB8419eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8419.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1dffef-16e5-479f-21f6-08d9e1239b05
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 23:28:48.9764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1GzBCI6YownBapv5krG/MR2AbQZeC1Lm7qGOlgO+RNZCxoHhNYNf501xg0d6THHvFRynd9RRO9D5LoBmR8ERQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4703

--_000_AS8PR04MB8419C8377C9458ADA340AC24E0209AS8PR04MB8419eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Pali,

NXP doesn't have a plan to support mwifiex driver anymore. How should we ha=
ndle this kind of retired project in upstream?

Thanks,
James

________________________________
From: Pali Roh=E1r <pali@kernel.org>
Sent: Thursday, January 20, 2022 11:30 AM
To: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>
Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rakes=
h.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; James Cao <james.cao@nx=
p.com>; Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-w=
ireless@vger.kernel.org>; G=E9rald Kerma <gandalf@gk2.net>; Ganapathi Bhat =
<ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is b=
uggy

Caution: EXT Email

Hello Prashanth!

Thank you for reply. Did you have a time to check this issue?

G=E9rald did a great testing which shows that version W16.68.1.p195 and
higher of pcieuart8997_combo_v4.bin firmware does not work.

On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:
> Hi Pali,
> Please allow me to check this and respond ASAP.
> Best,
> Prashanth
> ________________________________
> From: Pali Roh=E1r <pali@kernel.org>
> Sent: Friday, January 14, 2022 9:00 AM
> To: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rak=
esh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; Prashanth Ranganathan=
 <prashanthkrishnan.ranganathan@nxp.com>; James Cao <james.cao@nxp.com>
> Cc: Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wir=
eless@vger.kernel.org>; G=E9rald Kerma <gandalf@gk2.net>; Ganapathi Bhat <g=
anapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is=
 buggy
>
> Caution: EXT Email
>
> NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at
> this issue? It is really serous!
>
> On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> > On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=E1r <pali@kernel.org> wrote:
> > >
> > > Hello Josh, Sharvari and other from NXP!
> > >
> > > On Saturday 25 September 2021 19:23:48 G=E9rald Kerma wrote:
> > > > Correcting old marvell address to new nxp...
> > > >
> > > > Le 25/09/2021 =E0 19:19, G=E9rald Kerma a =E9crit :
> > > > > H=E9llo All,
> > > > >
> > > > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechno=
logies,
> > > > > because of problem with the WiFi.
> > > > >
> > > > > I have done some quick tests on all the firmware of PCIEUSB-8997 =
using
> > > > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > > > >
> > > > > Here is a summary of the tests :
> > > > > - W16.68.10.p159 =3D KO
> > > > > - W16.68.1.p195 =3D KO
> > > > > - V16.68.1.p145 =3D OK
> > > > > - 16.68.1.p140 =3D OK
> > > > > - 16.68.1.p133 =3D OK
> > > > > - 16.68.1.p97 =3D OK
> > > > > - 16.68.1.p70 =3D KO
> > >
> > > From this user test result can be seen that last two versions of
> > > pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> > > official mainline linux kernel driver mwifiex were not properly teste=
d
> > > internally in NXP and are causing serious issues which make 8997 card
> > > basically unusable.
> > >
> > > Sharvari and other NXP developers: Do you have some internal testing =
of
> > > this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> > > wifi chips? Or are you aware of this issue and do you have in NXP som=
e
> > > workaround for it (e.g. at driver level)? Could you please look at th=
is
> > > serious issue and try to debug firmware and release a new version, as
> > > this is obvious fatal error in firmware itself?
> > >
> > > Josh, how you in linux-firmware repository handle such, I must say,
> > > "fatal issues"? Wait for vendor fixes or revert problematic commits? =
Or
> > > something else?
> >
> > We can revert if we need to, but I think it's not quite that simple.
> >
> > > Because when users starts upgrading linux-firmware packages in their
> > > downstream distributions then basically wifi cards on this 8997 chips
> > > with official mwifiex driver stops working.
> >
> > The first broken version was committed in Feb of 2019.  That's
> > approaching 3 years ago.  Given that this is binary firmware, I have
> > no idea what else may or may not be included in the updates in the
> > meantime.
> >
> > josh
>
> Josh, as G=E9rald wrote, current binary in linux-firmware repository is
> unusable. And there is no reply from NXP for 3 months.
>
> You are right that nobody knows what is in firmware binary, but working
> binary is at least usable than non-working binary.
>
> So I would really suggest to start reverting non-working firmware files
> if NXP does not respond in few days.
>
> G=E9rald, what is your opinion? Do you see other way how to make mainline
> linux driver work (again)?
>
> > > > > REF (and all details of tests) :
> > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;data=3D04%7C01%7Cja=
mes.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92c=
d99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=
=3D3Y6a7lP%2B%2FXwPWGZARx3c99qV3ZFundY0QtfjmC1mYn4%3D&amp;reserved=3D0
> > > > >
> > > > >
> > > > > Broken firmware :
> > > > >
> > > > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was include=
d into
> > > > > linux-firmware repository by this pull request:
> > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQ=
R9hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C0971=
4bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6=
37783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQy=
Z2prUtPOjthVewIhBCwcqdg%3D&amp;reserved=3D0
> > > > > <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUi=
QR9hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C097=
14bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C=
637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQ=
yZ2prUtPOjthVewIhBCwcqdg%3D&amp;reserved=3D0>
> > > > >
> > > > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin|=
 by
> > > > > this pull request:
> > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-=
tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp=
.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%=
7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D6wktlFLItFx=
zOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;reserved=3D0
> > > > > <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i=
-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nx=
p.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635=
%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D6wktlFLItF=
xzOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;reserved=3D0>
> > > > >
> > > > > Olders looks to works better.
> > > > >
> > > > > In quick tests, they allow more than 1 clients at a time !
> > > > >
> > > > > I am still testing the V16.68.1.p145 and report the results after=
 some
> > > > > longer use...
> > > > >
> > > > > Hopes it will help...
> > > > > Regards,
> > > > > G=E9rald Kerma
> > > > > gandalf(at)gk2(dot)net
> > > >

--_000_AS8PR04MB8419C8377C9458ADA340AC24E0209AS8PR04MB8419eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Pali,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
NXP doesn't have a plan to support mwifiex driver anymore. How should we ha=
ndle this kind of retired project in upstream?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,
<div>James</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Pali Roh=E1r &lt;pali=
@kernel.org&gt;<br>
<b>Sent:</b> Thursday, January 20, 2022 11:30 AM<br>
<b>To:</b> Prashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.com&=
gt;<br>
<b>Cc:</b> Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; Rakesh =
Parmar &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.com&gt;=
; James Cao &lt;james.cao@nxp.com&gt;; Linux Firmware &lt;linux-firmware@ke=
rnel.org&gt;; Linux Wireless &lt;linux-wireless@vger.kernel.org&gt;;
 G=E9rald Kerma &lt;gandalf@gk2.net&gt;; Ganapathi Bhat &lt;ganapathi017@gm=
ail.com&gt;; Josh Boyer &lt;jwboyer@kernel.org&gt;<br>
<b>Subject:</b> [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmwa=
re is buggy</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Caution: EXT Email<br>
<br>
Hello Prashanth!<br>
<br>
Thank you for reply. Did you have a time to check this issue?<br>
<br>
G=E9rald did a great testing which shows that version W16.68.1.p195 and<br>
higher of pcieuart8997_combo_v4.bin firmware does not work.<br>
<br>
On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:<br>
&gt; Hi Pali,<br>
&gt; Please allow me to check this and respond ASAP.<br>
&gt; Best,<br>
&gt; Prashanth<br>
&gt; ________________________________<br>
&gt; From: Pali Roh=E1r &lt;pali@kernel.org&gt;<br>
&gt; Sent: Friday, January 14, 2022 9:00 AM<br>
&gt; To: Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; Rakesh Pa=
rmar &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.com&gt;; =
Prashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.com&gt;; James =
Cao &lt;james.cao@nxp.com&gt;<br>
&gt; Cc: Linux Firmware &lt;linux-firmware@kernel.org&gt;; Linux Wireless &=
lt;linux-wireless@vger.kernel.org&gt;; G=E9rald Kerma &lt;gandalf@gk2.net&g=
t;; Ganapathi Bhat &lt;ganapathi017@gmail.com&gt;; Josh Boyer &lt;jwboyer@k=
ernel.org&gt;<br>
&gt; Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware=
 is buggy<br>
&gt;<br>
&gt; Caution: EXT Email<br>
&gt;<br>
&gt; NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at<b=
r>
&gt; this issue? It is really serous!<br>
&gt;<br>
&gt; On Monday 27 September 2021 09:47:23 Josh Boyer wrote:<br>
&gt; &gt; On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=E1r &lt;pali@kernel.org&=
gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello Josh, Sharvari and other from NXP!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Saturday 25 September 2021 19:23:48 G=E9rald Kerma wrote:=
<br>
&gt; &gt; &gt; &gt; Correcting old marvell address to new nxp...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Le 25/09/2021 =E0 19:19, G=E9rald Kerma a =E9crit :<br>
&gt; &gt; &gt; &gt; &gt; H=E9llo All,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I made some few tests on EspressoBin-Ultra from Gl=
obalScaleTechnologies,<br>
&gt; &gt; &gt; &gt; &gt; because of problem with the WiFi.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I have done some quick tests on all the firmware o=
f PCIEUSB-8997 using<br>
&gt; &gt; &gt; &gt; &gt; the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x<b=
r>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Here is a summary of the tests :<br>
&gt; &gt; &gt; &gt; &gt; - W16.68.10.p159 =3D KO<br>
&gt; &gt; &gt; &gt; &gt; - W16.68.1.p195 =3D KO<br>
&gt; &gt; &gt; &gt; &gt; - V16.68.1.p145 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p140 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p133 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p97 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p70 =3D KO<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From this user test result can be seen that last two version=
s of<br>
&gt; &gt; &gt; pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card=
 with<br>
&gt; &gt; &gt; official mainline linux kernel driver mwifiex were not prope=
rly tested<br>
&gt; &gt; &gt; internally in NXP and are causing serious issues which make =
8997 card<br>
&gt; &gt; &gt; basically unusable.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sharvari and other NXP developers: Do you have some internal=
 testing of<br>
&gt; &gt; &gt; this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant =
of 8997<br>
&gt; &gt; &gt; wifi chips? Or are you aware of this issue and do you have i=
n NXP some<br>
&gt; &gt; &gt; workaround for it (e.g. at driver level)? Could you please l=
ook at this<br>
&gt; &gt; &gt; serious issue and try to debug firmware and release a new ve=
rsion, as<br>
&gt; &gt; &gt; this is obvious fatal error in firmware itself?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Josh, how you in linux-firmware repository handle such, I mu=
st say,<br>
&gt; &gt; &gt; &quot;fatal issues&quot;? Wait for vendor fixes or revert pr=
oblematic commits? Or<br>
&gt; &gt; &gt; something else?<br>
&gt; &gt;<br>
&gt; &gt; We can revert if we need to, but I think it's not quite that simp=
le.<br>
&gt; &gt;<br>
&gt; &gt; &gt; Because when users starts upgrading linux-firmware packages =
in their<br>
&gt; &gt; &gt; downstream distributions then basically wifi cards on this 8=
997 chips<br>
&gt; &gt; &gt; with official mwifiex driver stops working.<br>
&gt; &gt;<br>
&gt; &gt; The first broken version was committed in Feb of 2019.&nbsp; That=
's<br>
&gt; &gt; approaching 3 years ago.&nbsp; Given that this is binary firmware=
, I have<br>
&gt; &gt; no idea what else may or may not be included in the updates in th=
e<br>
&gt; &gt; meantime.<br>
&gt; &gt;<br>
&gt; &gt; josh<br>
&gt;<br>
&gt; Josh, as G=E9rald wrote, current binary in linux-firmware repository i=
s<br>
&gt; unusable. And there is no reply from NXP for 3 months.<br>
&gt;<br>
&gt; You are right that nobody knows what is in firmware binary, but workin=
g<br>
&gt; binary is at least usable than non-working binary.<br>
&gt;<br>
&gt; So I would really suggest to start reverting non-working firmware file=
s<br>
&gt; if NXP does not respond in few days.<br>
&gt;<br>
&gt; G=E9rald, what is your opinion? Do you see other way how to make mainl=
ine<br>
&gt; linux driver work (again)?<br>
&gt;<br>
&gt; &gt; &gt; &gt; &gt; REF (and all details of tests) :<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2=
F1&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9d=
c4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000&amp;amp;sdata=3D3Y6a7lP%2B%2FXwPWGZARx3c99qV3ZFundY0Qtf=
jmC1mYn4%3D&amp;amp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;amp;data=3D04%7C01%7Cjames.ca=
o%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c=
301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3D=
3Y6a7lP%2B%2FXwPWGZARx3c99qV3ZFundY0QtfjmC1mYn4%3D&amp;amp;reserved=3D0</a>=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Broken firmware :<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Version |W16.68.1.p195| of |pcieusb8997_combo_v4.b=
in| was included into<br>
&gt; &gt; &gt; &gt; &gt; linux-firmware repository by this pull request:<br=
>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8=
120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C0=
1%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c=
6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;=
amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2prUtPOjthVewIhBCwcqdg%3D&amp;amp;reserv=
ed=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40=
mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302=
224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6377830=
38495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2=
prUtPOjthVewIhBCwcqdg%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"https://eur01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3va=
T7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04=
%7C01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc=
2b4c6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&=
amp;amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2prUtPOjthVewIhBCwcqdg%3D&amp;amp;re=
served=3D0">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoU=
iQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%=
7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7=
C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dnbzs6YB%2Fyj=
dp9zJR1PQyZ2prUtPOjthVewIhBCwcqdg%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; And latest version |W16.68.10.p159| of |pcieusb899=
7_combo_v4.bin| by<br>
&gt; &gt; &gt; &gt; &gt; this pull request:<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5o=
n7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;da=
ta=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686=
ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C3000&amp;amp;sdata=3D6wktlFLItFxzOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;a=
mp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-A=
mMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7=
C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C=
0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3D6wktlFLItFxzO=
dYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"https://eur01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5P=
VA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;am=
p;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7=
C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000&amp;amp;sdata=3D6wktlFLItFxzOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&a=
mp;amp;reserved=3D0">https://eur01.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThP=
xgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7C=
james.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa9=
2cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;=
sdata=3D6wktlFLItFxzOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;amp;reserved=3D0=
</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Olders looks to works better.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; In quick tests, they allow more than 1 clients at =
a time !<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I am still testing the V16.68.1.p145 and report th=
e results after some<br>
&gt; &gt; &gt; &gt; &gt; longer use...<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hopes it will help...<br>
&gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; &gt; G=E9rald Kerma<br>
&gt; &gt; &gt; &gt; &gt; gandalf(at)gk2(dot)net<br>
&gt; &gt; &gt; &gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8PR04MB8419C8377C9458ADA340AC24E0209AS8PR04MB8419eurp_--
