Return-Path: <SRS0=Xqma=SM=nxp.com=james.cao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022F2C433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 28 Jan 2022 00:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB5CAC340E8; Fri, 28 Jan 2022 00:59:05 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C587CC340E4;
	Fri, 28 Jan 2022 00:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C587CC340E4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzRpG4/0V+7O1zC7sR2tduWBmeSY3Po/0lptKWVQ9/IvuXQWT7qwl39iW/79r3P3rlRnwSF6IweuEqf6o/0ihBdP6Zrpw4w3jbkgDLywn2H6htQIKMn3gj9NVkI46yaZlfO+1CINExRv2jpQiyqhjj5SCdJDU3GenJM3e1ZU5517Xhr6OkbXbIde7rLMX1liGI0fGRh8kUguBK5Paqh54lixS8g5xhfM/3yPbjNSYFoN8h8s0jZig8V4boqO5Bq2QEEQsbF9VyTbHyEjH3/OYuGlRess6U0zDhikKLljTgSy9srmYVXdBwan+cdgpHEaC00MbVMFUM3YR2kPqM4XYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dnA14+9npNVIosXJ/GQ2iQFzpTnM7DGM0nRq01QdRw=;
 b=USGSBIuedZEEXapMCjcsNESfYJgKimDkowz7/7Kab/0+DsAQrycgkhmuHFZem1+/LtgB/tAekrDIwZg6AYlHdI1+VyTI0tqe81GBE41eGeQfZQMZ+AAbvtV8NNqtInVRoi2Jacphc9VOU+uTgh4+8iffM6HWrVEiAa9oGs2+kDP4VD78tCfxaFroxaIvqPRiOzE2UBvw1qYOAeWihEdyPijpPEJSVB93tW0LCMruK9ZfqdEAybLDv2Lqk1rETsPQasTJVmTp73FhO43UwuOev/q8a5lCoclvDwTGnbBaPwqoUtf/2g5guoLoVU+GM0miGxnqPjymeoBUCEOrsT4mLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dnA14+9npNVIosXJ/GQ2iQFzpTnM7DGM0nRq01QdRw=;
 b=jv+R7FM5HM6/A6PVic01v+VnPeQ1Swio+wizvVBuxmuIkdtwmR3FVEw+vmD5zcW20NkvLsQ1G5fpbBgvOCeIbw4H6KVtqHpsgEwrryP0rG5QWUC1GMAl3aHGwF52IYsN6LqIeZMA2ECWAEzFbmM5BCrgo/nn1eChhdKv1a5dIok=
Received: from AS8PR04MB8419.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::14)
 by AM4PR0401MB2402.eurprd04.prod.outlook.com (2603:10a6:200:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Fri, 28 Jan
 2022 00:58:59 +0000
Received: from AS8PR04MB8419.eurprd04.prod.outlook.com
 ([fe80::78d4:2e14:7806:d9bc]) by AS8PR04MB8419.eurprd04.prod.outlook.com
 ([fe80::78d4:2e14:7806:d9bc%5]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 00:58:59 +0000
From: James Cao <james.cao@nxp.com>
To: =?Windows-1252?Q?G=E9rald_Kerma?= <gandalf@gk2.net>,
	=?Windows-1252?Q?Pali_Roh=E1r?= <pali@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>, Sharvari
 Harisangam <sharvari.harisangam@nxp.com>, Rakesh Parmar
	<rakesh.parmar@nxp.com>, Cathy Luo <xiaohua.luo@nxp.com>, Linux Firmware
	<linux-firmware@kernel.org>, Linux Wireless <linux-wireless@vger.kernel.org>,
	Josh Boyer <jwboyer@kernel.org>
Subject: Re: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is
 buggy
Thread-Topic: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is
 buggy
Thread-Index:
 AQHXsjIl5WzMUpLebkOgXhaYFiPJUau2Ii8AgAHF0oCAq4QsgIAAAusAgAmU74CACavsUYAA2rwAgAAraACAAGR5+A==
Date: Fri, 28 Jan 2022 00:58:59 +0000
Message-ID:
 <AS8PR04MB8419A1473C69E9869471EC17E0219@AS8PR04MB8419.eurprd04.prod.outlook.com>
References: <edeb34bc-7c85-7f1d-79e4-e3e21df86334@gk2.net>
 <fe75e8f2-6f12-052a-81ed-38122b87f1f6@gk2.net>
 <20210926104306.xocctztsuspx6oji@pali>
 <CA+5PVA4AGa09+X2A4zPU2MKWburCtiddb3cpSJh9H-JTO=fJKg@mail.gmail.com>
 <20220114170051.sx2p6m2ihrv3ojzt@pali>
 <AS8PR04MB9192076DB3CB59EC049B7B9CFB549@AS8PR04MB9192.eurprd04.prod.outlook.com>
 <20220120193041.fmmmd77ingjvyqe4@pali>
 <AS8PR04MB8419C8377C9458ADA340AC24E0209@AS8PR04MB8419.eurprd04.prod.outlook.com>
 <20220127121514.daptjsxkgrt5zlov@pali>
 <849ea3f2-a6c1-8814-3713-4d8b14db5029@gk2.net>
In-Reply-To: <849ea3f2-a6c1-8814-3713-4d8b14db5029@gk2.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d28275b-627d-45e0-e399-08d9e1f95e4f
x-ms-traffictypediagnostic: AM4PR0401MB2402:EE_
x-microsoft-antispam-prvs:
 <AM4PR0401MB2402A8AAAC73DE025178279EE0229@AM4PR0401MB2402.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dyR6UA2D20gd2nSUXUVjlumgD0dyjuMcn3OlY3Df9etYYK6rKjmUmgkvbGIdnhvuBplfFZl3Lj9Eq5pP2FfE2PsukkjSYCOCRmdGiFaUIy05PhuvqxTRvRQ8skZQaxnwtsHTVlNPx7pUGt0n+lOrHcITv/lP8qm8VnW+PULXM7sogpB2/RychFx+P1Z8RNDvfvz8YxDbeEy/dHw8WSbiW8yjpX8CYVhEt+c6Ta2fE2ZT+VWb6zCwhIrUVZCOGqKv2KSALgTvQzCh1wzz09AfGdLl8gSxy2Y2xfnf2xl95RH8BH4Zv1b54hA9BISqLoe3129RrjlmNFu5m8/7zNhaHNiKohI1bb1JIkHhRRRUWXWJKqD8TS9HtMPV3YMdObRgKnx1iGcQo8JnMxas8gW6spx1wyny++BV2MWBoBuBPRRVeO6DlOHo4HDA9NsD85YmPBwNVTehFaxOVqIlRFYA6b9r/3ISV3mySu+/zZWNZMHk/3V/48C3ist34wvtZa/7j6FnC5w4r4HYLb2SHAfIrPJ7r09a/qEFTwsVxYlZuuDeqTK1zevvZbvK64PBXwuzgT8ElAIHGfkI0Htu3bYutCLXU3+3BIrhHdujFvngH/x5bMwfDhRa6IR6ZbGD9M5bDccVqfNO21UfoV2wuKd7uOXdTMOxMfBHZTvuDCkcXQhPToRR8ozFPIpTTOI27oZRuQ4GCuJ9vcjrMuwDJUBJnDGkjlgjzHPtNOavYRAcQYMT9nAJbDIhP8AwzuzXtS2sI4ymp4QUcWuJQ2vfOFs3xwYuwTQNvUdAKrNmWLMNK8+PPlLe0uDH5IO8XU8Kn/lQjSwIqapX2OIGookj6U+mzg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8419.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(66574015)(38070700005)(966005)(83380400001)(7696005)(53546011)(6506007)(508600001)(71200400001)(86362001)(45080400002)(186003)(26005)(33656002)(54906003)(110136005)(9686003)(55016003)(19627405001)(2906002)(166002)(122000001)(52536014)(44832011)(5660300002)(30864003)(38100700002)(76116006)(4326008)(66946007)(64756008)(66446008)(66476007)(8936002)(66556008)(91956017)(8676002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?PuFf8gUnF8CsYZ6iPJePBaSUe5PX56zfr55L0P5Nx6fBKB1Bo89b+kgO?=
 =?Windows-1252?Q?38dY3s5y+JDTJa8D10jiRck4DWvcU9kRBxcX1av9vYVec7jEZe2A4xpW?=
 =?Windows-1252?Q?gBoqk5BbdfRwnb1PHD+pLfBFHXlLz3QVMlX/nJbv++OpM0jW6usyf9tV?=
 =?Windows-1252?Q?yuhD0n87UBn5bOcn4l/zubLrc5iqx+PfhsbVeC2JFU3DsVXV+SFKhRmT?=
 =?Windows-1252?Q?Q+Uq1bXIiarSUr4wrcNOECXi1lEGCZdznfNAevdH562vKY595tI6uCGD?=
 =?Windows-1252?Q?4YfKrE04/KIlZGcxloDXdTl7RUYvu9cJfWof2Oitn2q5Vz/FMh5T9OcN?=
 =?Windows-1252?Q?bJZu0UD0G0dLFQnHm4HsM3uU+jTsOGYRLvo3huBJsST95vn9hzfQs94x?=
 =?Windows-1252?Q?2ADTT34Bn5nFm+Mbw/q87VhCLq7Er3Q+JR92/iFsSkw/FrZXiHTu9jyw?=
 =?Windows-1252?Q?Yu0Pf56GfdnGtrtPLO+nMX50UJ8vPt2VblrxmatEArrocyDRLNO6DYmw?=
 =?Windows-1252?Q?aLiviW9oZXgtXDlRBzdcRzEg5krDMmGl8XlilH7Rxzy9oirw0jAuHnku?=
 =?Windows-1252?Q?Gjdj9firW38WqKqSBx//YJfXDsd+WXlmeJX1wBKJ4nr5ZX++axmZa/B9?=
 =?Windows-1252?Q?65uqA1mrE4SBFNXP1a7X7jrydd9x7BUEJsbe3wybr1bxC88ZnJKxE4m8?=
 =?Windows-1252?Q?uA4/h1ihlqZi5pkordYcVgfzRTkEnYHd3qV65wnwGTQf3qtMrihwwdgZ?=
 =?Windows-1252?Q?9es5Shw3wc1XYBkxaihjKJtRlzzs/LgoUraEnS/UWwprDabOsLbUioAv?=
 =?Windows-1252?Q?BgH677ddr+5RBhvHSHnfhOkDLDdApOR8zWtt8VDQwhPiVh/7E85TZ2MV?=
 =?Windows-1252?Q?L+KvC3lY5tNI0sDhv7a0h6EbSML6Jrs13UcLFmv037z0p1ZlJ/fqdioo?=
 =?Windows-1252?Q?JAn4iTh0EeIb1B3KH8Z3CrlGlmyWhMZrktzqIgJg/rpBjU2zof2vB0W7?=
 =?Windows-1252?Q?jAZq11DiOuUOwsEvZ/RwbbczyKrkm3bVMo02ATXfLe1IqXca6yafjLYx?=
 =?Windows-1252?Q?aaR0+laD99ypfpmED+4TmMc73ScGSrXo7x9rvf4V2O649CilNogZcEuf?=
 =?Windows-1252?Q?QB7P3Uo7I4H8XDRIk6cWGvxNZRQHnwkFYRrNIrNs3+nLhS2G1e7KxGo6?=
 =?Windows-1252?Q?8e56d7DupsC76eO3zsOYIdKaZfv2C1NmIu47YmMVgasKMUPtVp6FfkgK?=
 =?Windows-1252?Q?1mARRkmJNhJsS5eyN/S7ZybuEMMvFBDSmuSXRMnu6HTWrxJFj7UeETCm?=
 =?Windows-1252?Q?9hoQvm3FDFk0Y8Y//Vy2f+kGSc0F+mZro6nMapTInteSSKhbSk8FzOek?=
 =?Windows-1252?Q?JmC+roI9ocp3AhC1hPTvpmBfOq/cuDOTZfynnVInrOpR+kN+vvILsBqL?=
 =?Windows-1252?Q?syHWeQ2DSwgQpoPlvOXekmzCrraQvNi9LCrDDBNeOWYs7e4wBxKzNwc/?=
 =?Windows-1252?Q?nHVXly3ED1qEyUqkVtSJJeYfeHIM8SS8htaZZGr+RCXHeUClr8mw3Sqa?=
 =?Windows-1252?Q?7uNTGzDqjuPetmPvGj4o2ki+lk7wgh/UV03CYdQec+khny9+AdFn6zjZ?=
 =?Windows-1252?Q?APIvr4nxZqtIRRuibFqYnte63VmbfR8UtnvlY6ITLu4+Pk0csw3U5O7k?=
 =?Windows-1252?Q?bX7xdVYpqS7Naghj+JEDlaQIGukHj7lhNY8WCCz1cs/mul/9hoSTOQ?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AS8PR04MB8419A1473C69E9869471EC17E0219AS8PR04MB8419eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8419.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d28275b-627d-45e0-e399-08d9e1f95e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 00:58:59.4099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JpgPx4XAQfaVnIq8LKd4UkwZu3iuiyghUJ8waf6YGD48MPGJCGv3sg09YOONWR+5igBD4/+Whs2Z5hiWY2vRuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2402

--_000_AS8PR04MB8419A1473C69E9869471EC17E0219AS8PR04MB8419eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi G=E9rald, Pali,

For NXP Wi-Fi/BT FW, we only have binary release, which is under proprietar=
y license.

Regarding the issue, which kind of adapter (PCIe-USB or PCIe-UART) did you =
use? Suppose PCIe-USB/PCIe-UART FW may not work on PCIe-UART/PCIe-USB board=
. What's the failure symptom?

Thanks,
James

________________________________
From: G=E9rald Kerma <gandalf@gk2.net>
Sent: Thursday, January 27, 2022 6:50 AM
To: Pali Roh=E1r <pali@kernel.org>; James Cao <james.cao@nxp.com>
Cc: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>; Sharvari=
 Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rakesh.parmar@nxp=
.com>; Cathy Luo <xiaohua.luo@nxp.com>; Linux Firmware <linux-firmware@kern=
el.org>; Linux Wireless <linux-wireless@vger.kernel.org>; Josh Boyer <jwboy=
er@kernel.org>
Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is b=
uggy

Caution: EXT Email

H=E9llo James,

As Pali wrote, if fimrware requires signing NDA, I can propose my own
collaboration to NXP !

I am still okay to help, in anyway, with testing or more...
Please, feel free to contact me.

G=E9rald Kerma
CyberMind.FR
gandalf(at)gk2(dot)net
00.33.651.27.66.88

PS: I add my answer which was lost for some of the CC... (sorry)...


Le 27/01/2022 =E0 13:15, Pali Roh=E1r a =E9crit :
> Hello James!
>
> Thank you for reply, but this is something which we did not want to hear =
:-(
>
> There is an issue in the latest pcieuart8997_combo_v4.bin firmware file
> which NXP sent to linux-firmware repository and it is really needed to
> fix this issue. It was sent by NXP, so it is expected that NXP do it.
> And because it is binary-only file, people outside of NXP cannot do it.
>
> Would you be able to look at this firmware issue as the last thing?
>
> Or as G=E9rald wrote, could NXP provide source code of that firmware? So
> people outside of NXP could look at it? If firmware requires signing NDA
> (either individually or via company), then some professional skilled
> kernel developers can do it.
Le 27/01/2022 =E0 02:13, G=E9rald Kerma a =E9crit :
 > H=E9llo James,
 >
 > Was it only ever supported ?
 >
 > May be NXP can free and share the firmware source to the community,
and let anyone who care try to debug it ?
 >
 > As far as my tests shown, the mwifiex driver never has work
correctly, and none version is sufficiently stable to be state as working.
 >
 > Please, NXP, take cares of your end clients !
 > Be simple, be smart, be respectuous, give us the source=85
 >
 > Thanks in advance,
 > G=E9rald Kerma
 >
 > [%]<\@~{
> On Wednesday 26 January 2022 23:28:48 James Cao wrote:
>> Hi Pali,
>>
>> NXP doesn't have a plan to support mwifiex driver anymore. How should we=
 handle this kind of retired project in upstream?
>>
>> Thanks,
>> James
>>
>> ________________________________
>> From: Pali Roh=E1r <pali@kernel.org>
>> Sent: Thursday, January 20, 2022 11:30 AM
>> To: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>
>> Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <ra=
kesh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; James Cao <james.cao=
@nxp.com>; Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linu=
x-wireless@vger.kernel.org>; G=E9rald Kerma <gandalf@gk2.net>; Ganapathi Bh=
at <ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
>> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware i=
s buggy
>>
>> Caution: EXT Email
>>
>> Hello Prashanth!
>>
>> Thank you for reply. Did you have a time to check this issue?
>>
>> G=E9rald did a great testing which shows that version W16.68.1.p195 and
>> higher of pcieuart8997_combo_v4.bin firmware does not work.
>>
>> On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:
>>> Hi Pali,
>>> Please allow me to check this and respond ASAP.
>>> Best,
>>> Prashanth
>>> ________________________________
>>> From: Pali Roh=E1r <pali@kernel.org>
>>> Sent: Friday, January 14, 2022 9:00 AM
>>> To: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <r=
akesh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; Prashanth Ranganath=
an <prashanthkrishnan.ranganathan@nxp.com>; James Cao <james.cao@nxp.com>
>>> Cc: Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-w=
ireless@vger.kernel.org>; G=E9rald Kerma <gandalf@gk2.net>; Ganapathi Bhat =
<ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
>>> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware =
is buggy
>>>
>>> Caution: EXT Email
>>>
>>> NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at
>>> this issue? It is really serous!
>>>
>>> On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
>>>> On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=E1r <pali@kernel.org> wrote:
>>>>> Hello Josh, Sharvari and other from NXP!
>>>>>
>>>>> On Saturday 25 September 2021 19:23:48 G=E9rald Kerma wrote:
>>>>>> Correcting old marvell address to new nxp...
>>>>>>
>>>>>> Le 25/09/2021 =E0 19:19, G=E9rald Kerma a =E9crit :
>>>>>>> H=E9llo All,
>>>>>>>
>>>>>>> I made some few tests on EspressoBin-Ultra from GlobalScaleTechnolo=
gies,
>>>>>>> because of problem with the WiFi.
>>>>>>>
>>>>>>> I have done some quick tests on all the firmware of PCIEUSB-8997 us=
ing
>>>>>>> the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
>>>>>>>
>>>>>>> Here is a summary of the tests :
>>>>>>> - W16.68.10.p159 =3D KO
>>>>>>> - W16.68.1.p195 =3D KO
>>>>>>> - V16.68.1.p145 =3D OK
>>>>>>> - 16.68.1.p140 =3D OK
>>>>>>> - 16.68.1.p133 =3D OK
>>>>>>> - 16.68.1.p97 =3D OK
>>>>>>> - 16.68.1.p70 =3D KO
>>>>>  From this user test result can be seen that last two versions of
>>>>> pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
>>>>> official mainline linux kernel driver mwifiex were not properly teste=
d
>>>>> internally in NXP and are causing serious issues which make 8997 card
>>>>> basically unusable.
>>>>>
>>>>> Sharvari and other NXP developers: Do you have some internal testing =
of
>>>>> this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
>>>>> wifi chips? Or are you aware of this issue and do you have in NXP som=
e
>>>>> workaround for it (e.g. at driver level)? Could you please look at th=
is
>>>>> serious issue and try to debug firmware and release a new version, as
>>>>> this is obvious fatal error in firmware itself?
>>>>>
>>>>> Josh, how you in linux-firmware repository handle such, I must say,
>>>>> "fatal issues"? Wait for vendor fixes or revert problematic commits? =
Or
>>>>> something else?
>>>> We can revert if we need to, but I think it's not quite that simple.
>>>>
>>>>> Because when users starts upgrading linux-firmware packages in their
>>>>> downstream distributions then basically wifi cards on this 8997 chips
>>>>> with official mwifiex driver stops working.
>>>> The first broken version was committed in Feb of 2019.  That's
>>>> approaching 3 years ago.  Given that this is binary firmware, I have
>>>> no idea what else may or may not be included in the updates in the
>>>> meantime.
>>>>
>>>> josh
>>> Josh, as G=E9rald wrote, current binary in linux-firmware repository is
>>> unusable. And there is no reply from NXP for 3 months.
>>>
>>> You are right that nobody knows what is in firmware binary, but working
>>> binary is at least usable than non-working binary.
>>>
>>> So I would really suggest to start reverting non-working firmware files
>>> if NXP does not respond in few days.
>>>
>>> G=E9rald, what is your opinion? Do you see other way how to make mainli=
ne
>>> linux driver work (again)?
>>>
>>>>>>> REF (and all details of tests) :
>>>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;data=3D04%7C01%7Cjame=
s.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd9=
9c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D=
jeHkO95c2IlIftGxZGaTDOj5em2dU%2FCiIcSPM4NitUk%3D&amp;reserved=3D0
>>>>>>>
>>>>>>>
>>>>>>> Broken firmware :
>>>>>>>
>>>>>>> Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was included =
into
>>>>>>> linux-firmware repository by this pull request:
>>>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9=
hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C3e471c=
7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637=
788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DtTxWzBFlt0tg1sRwXSapYPdG=
61BME5f%2B3K7dwSUHRZo%3D&amp;reserved=3D0
>>>>>>> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR=
9hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C3e471=
c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63=
7788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DtTxWzBFlt0tg1sRwXSapYPd=
G61BME5f%2B3K7dwSUHRZo%3D&amp;reserved=3D0>
>>>>>>>
>>>>>>> And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin| b=
y
>>>>>>> this pull request:
>>>>>>> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tE=
Xm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.c=
om%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C=
0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DLNx2xSp39whIN=
LxyrkgoyNeb53YjX6s1QjyonB5iJUE%3D&amp;reserved=3D0
>>>>>>> <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-t=
EXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.=
com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7=
C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DLNx2xSp39whI=
NLxyrkgoyNeb53YjX6s1QjyonB5iJUE%3D&amp;reserved=3D0>
>>>>>>>
>>>>>>> Olders looks to works better.
>>>>>>>
>>>>>>> In quick tests, they allow more than 1 clients at a time !
>>>>>>>
>>>>>>> I am still testing the V16.68.1.p145 and report the results after s=
ome
>>>>>>> longer use...
>>>>>>>
>>>>>>> Hopes it will help...
>>>>>>> Regards,
>>>>>>> G=E9rald Kerma
>>>>>>> gandalf(at)gk2(dot)net


--_000_AS8PR04MB8419A1473C69E9869471EC17E0219AS8PR04MB8419eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi&nbsp;<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web=
 (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystem=
Font, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;ba=
ckground-color:rgb(255, 255, 255);display:inline !important">G=E9rald, Pali=
,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">For NXP Wi-Fi/BT FW,
 we only have binary release, which is under proprietary license.</span></d=
iv>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important">Regarding the issue,
 which kind of adapter (PCIe-USB or PCIe-UART) did you use? Suppose PCIe-US=
B/PCIe-UART FW may not work on PCIe-UART/PCIe-USB board. What's the failure=
 symptom?</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;background=
-color:rgb(255, 255, 255);display:inline !important"><br>
</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 14.6667px;">T=
hanks,</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
James<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (W=
est European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFon=
t, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;backg=
round-color:rgb(255, 255, 255);display:inline !important"><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> G=E9rald Kerma &lt;ga=
ndalf@gk2.net&gt;<br>
<b>Sent:</b> Thursday, January 27, 2022 6:50 AM<br>
<b>To:</b> Pali Roh=E1r &lt;pali@kernel.org&gt;; James Cao &lt;james.cao@nx=
p.com&gt;<br>
<b>Cc:</b> Prashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.com&=
gt;; Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; Rakesh Parmar=
 &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.com&gt;; Linu=
x Firmware &lt;linux-firmware@kernel.org&gt;; Linux Wireless &lt;linux-wire=
less@vger.kernel.org&gt;;
 Josh Boyer &lt;jwboyer@kernel.org&gt;<br>
<b>Subject:</b> [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmwa=
re is buggy</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Caution: EXT Email<br>
<br>
H=E9llo James,<br>
<br>
As Pali wrote, if fimrware requires signing NDA, I can propose my own<br>
collaboration to NXP !<br>
<br>
I am still okay to help, in anyway, with testing or more...<br>
Please, feel free to contact me.<br>
<br>
G=E9rald Kerma<br>
CyberMind.FR<br>
gandalf(at)gk2(dot)net<br>
00.33.651.27.66.88<br>
<br>
PS: I add my answer which was lost for some of the CC... (sorry)...<br>
<br>
<br>
Le 27/01/2022 =E0 13:15, Pali Roh=E1r a =E9crit :<br>
&gt; Hello James!<br>
&gt;<br>
&gt; Thank you for reply, but this is something which we did not want to he=
ar :-(<br>
&gt;<br>
&gt; There is an issue in the latest pcieuart8997_combo_v4.bin firmware fil=
e<br>
&gt; which NXP sent to linux-firmware repository and it is really needed to=
<br>
&gt; fix this issue. It was sent by NXP, so it is expected that NXP do it.<=
br>
&gt; And because it is binary-only file, people outside of NXP cannot do it=
.<br>
&gt;<br>
&gt; Would you be able to look at this firmware issue as the last thing?<br=
>
&gt;<br>
&gt; Or as G=E9rald wrote, could NXP provide source code of that firmware? =
So<br>
&gt; people outside of NXP could look at it? If firmware requires signing N=
DA<br>
&gt; (either individually or via company), then some professional skilled<b=
r>
&gt; kernel developers can do it.<br>
Le 27/01/2022 =E0 02:13, G=E9rald Kerma a =E9crit :<br>
&nbsp;&gt; H=E9llo James,<br>
&nbsp;&gt;<br>
&nbsp;&gt; Was it only ever supported ?<br>
&nbsp;&gt;<br>
&nbsp;&gt; May be NXP can free and share the firmware source to the communi=
ty,<br>
and let anyone who care try to debug it ?<br>
&nbsp;&gt;<br>
&nbsp;&gt; As far as my tests shown, the mwifiex driver never has work<br>
correctly, and none version is sufficiently stable to be state as working.<=
br>
&nbsp;&gt;<br>
&nbsp;&gt; Please, NXP, take cares of your end clients !<br>
&nbsp;&gt; Be simple, be smart, be respectuous, give us the source=85<br>
&nbsp;&gt;<br>
&nbsp;&gt; Thanks in advance,<br>
&nbsp;&gt; G=E9rald Kerma<br>
&nbsp;&gt;<br>
&nbsp;&gt; [%]&lt;\@~{<br>
&gt; On Wednesday 26 January 2022 23:28:48 James Cao wrote:<br>
&gt;&gt; Hi Pali,<br>
&gt;&gt;<br>
&gt;&gt; NXP doesn't have a plan to support mwifiex driver anymore. How sho=
uld we handle this kind of retired project in upstream?<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; James<br>
&gt;&gt;<br>
&gt;&gt; ________________________________<br>
&gt;&gt; From: Pali Roh=E1r &lt;pali@kernel.org&gt;<br>
&gt;&gt; Sent: Thursday, January 20, 2022 11:30 AM<br>
&gt;&gt; To: Prashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.co=
m&gt;<br>
&gt;&gt; Cc: Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; Rakes=
h Parmar &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.com&g=
t;; James Cao &lt;james.cao@nxp.com&gt;; Linux Firmware &lt;linux-firmware@=
kernel.org&gt;; Linux Wireless &lt;linux-wireless@vger.kernel.org&gt;; G=E9=
rald
 Kerma &lt;gandalf@gk2.net&gt;; Ganapathi Bhat &lt;ganapathi017@gmail.com&g=
t;; Josh Boyer &lt;jwboyer@kernel.org&gt;<br>
&gt;&gt; Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firm=
ware is buggy<br>
&gt;&gt;<br>
&gt;&gt; Caution: EXT Email<br>
&gt;&gt;<br>
&gt;&gt; Hello Prashanth!<br>
&gt;&gt;<br>
&gt;&gt; Thank you for reply. Did you have a time to check this issue?<br>
&gt;&gt;<br>
&gt;&gt; G=E9rald did a great testing which shows that version W16.68.1.p19=
5 and<br>
&gt;&gt; higher of pcieuart8997_combo_v4.bin firmware does not work.<br>
&gt;&gt;<br>
&gt;&gt; On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:<br=
>
&gt;&gt;&gt; Hi Pali,<br>
&gt;&gt;&gt; Please allow me to check this and respond ASAP.<br>
&gt;&gt;&gt; Best,<br>
&gt;&gt;&gt; Prashanth<br>
&gt;&gt;&gt; ________________________________<br>
&gt;&gt;&gt; From: Pali Roh=E1r &lt;pali@kernel.org&gt;<br>
&gt;&gt;&gt; Sent: Friday, January 14, 2022 9:00 AM<br>
&gt;&gt;&gt; To: Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; R=
akesh Parmar &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.c=
om&gt;; Prashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.com&gt;=
; James Cao &lt;james.cao@nxp.com&gt;<br>
&gt;&gt;&gt; Cc: Linux Firmware &lt;linux-firmware@kernel.org&gt;; Linux Wi=
reless &lt;linux-wireless@vger.kernel.org&gt;; G=E9rald Kerma &lt;gandalf@g=
k2.net&gt;; Ganapathi Bhat &lt;ganapathi017@gmail.com&gt;; Josh Boyer &lt;j=
wboyer@kernel.org&gt;<br>
&gt;&gt;&gt; Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 =
firmware is buggy<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Caution: EXT Email<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please l=
ook at<br>
&gt;&gt;&gt; this issue? It is really serous!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Monday 27 September 2021 09:47:23 Josh Boyer wrote:<br>
&gt;&gt;&gt;&gt; On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=E1r &lt;pali@kern=
el.org&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; Hello Josh, Sharvari and other from NXP!<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Saturday 25 September 2021 19:23:48 G=E9rald Kerma =
wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Correcting old marvell address to new nxp...<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Le 25/09/2021 =E0 19:19, G=E9rald Kerma a =E9crit =
:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; H=E9llo All,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I made some few tests on EspressoBin-Ultra fro=
m GlobalScaleTechnologies,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; because of problem with the WiFi.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I have done some quick tests on all the firmwa=
re of PCIEUSB-8997 using<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; the pcieuart8997_combo_v4.bin on OpenWrt 21.02=
.x<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Here is a summary of the tests :<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - W16.68.10.p159 =3D KO<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - W16.68.1.p195 =3D KO<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - V16.68.1.p145 =3D OK<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - 16.68.1.p140 =3D OK<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - 16.68.1.p133 =3D OK<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - 16.68.1.p97 =3D OK<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - 16.68.1.p70 =3D KO<br>
&gt;&gt;&gt;&gt;&gt;&nbsp; From this user test result can be seen that last=
 two versions of<br>
&gt;&gt;&gt;&gt;&gt; pcieusb8997_combo_v4.bin firmware file for 8997 wifi+b=
t card with<br>
&gt;&gt;&gt;&gt;&gt; official mainline linux kernel driver mwifiex were not=
 properly tested<br>
&gt;&gt;&gt;&gt;&gt; internally in NXP and are causing serious issues which=
 make 8997 card<br>
&gt;&gt;&gt;&gt;&gt; basically unusable.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Sharvari and other NXP developers: Do you have some in=
ternal testing of<br>
&gt;&gt;&gt;&gt;&gt; this pcieusb8997_combo_v4.bin firmware for PCIe+USB va=
riant of 8997<br>
&gt;&gt;&gt;&gt;&gt; wifi chips? Or are you aware of this issue and do you =
have in NXP some<br>
&gt;&gt;&gt;&gt;&gt; workaround for it (e.g. at driver level)? Could you pl=
ease look at this<br>
&gt;&gt;&gt;&gt;&gt; serious issue and try to debug firmware and release a =
new version, as<br>
&gt;&gt;&gt;&gt;&gt; this is obvious fatal error in firmware itself?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Josh, how you in linux-firmware repository handle such=
, I must say,<br>
&gt;&gt;&gt;&gt;&gt; &quot;fatal issues&quot;? Wait for vendor fixes or rev=
ert problematic commits? Or<br>
&gt;&gt;&gt;&gt;&gt; something else?<br>
&gt;&gt;&gt;&gt; We can revert if we need to, but I think it's not quite th=
at simple.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Because when users starts upgrading linux-firmware pac=
kages in their<br>
&gt;&gt;&gt;&gt;&gt; downstream distributions then basically wifi cards on =
this 8997 chips<br>
&gt;&gt;&gt;&gt;&gt; with official mwifiex driver stops working.<br>
&gt;&gt;&gt;&gt; The first broken version was committed in Feb of 2019.&nbs=
p; That's<br>
&gt;&gt;&gt;&gt; approaching 3 years ago.&nbsp; Given that this is binary f=
irmware, I have<br>
&gt;&gt;&gt;&gt; no idea what else may or may not be included in the update=
s in the<br>
&gt;&gt;&gt;&gt; meantime.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; josh<br>
&gt;&gt;&gt; Josh, as G=E9rald wrote, current binary in linux-firmware repo=
sitory is<br>
&gt;&gt;&gt; unusable. And there is no reply from NXP for 3 months.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; You are right that nobody knows what is in firmware binary, bu=
t working<br>
&gt;&gt;&gt; binary is at least usable than non-working binary.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; So I would really suggest to start reverting non-working firmw=
are files<br>
&gt;&gt;&gt; if NXP does not respond in few days.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; G=E9rald, what is your opinion? Do you see other way how to ma=
ke mainline<br>
&gt;&gt;&gt; linux driver work (again)?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; REF (and all details of tests) :<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://eur01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissu=
es%2F1&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd0=
8d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DjeHkO95c2IlIftGxZGaTDOj5em2dU%2FCiI=
cSPM4NitUk%3D&amp;amp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;amp;data=3D04%7C01%7Cjames.ca=
o%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c=
301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3D=
jeHkO95c2IlIftGxZGaTDOj5em2dU%2FCiIcSPM4NitUk%3D&amp;amp;reserved=3D0</a><b=
r>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Broken firmware :<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Version |W16.68.1.p195| of |pcieusb8997_combo_=
v4.bin| was included into<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; linux-firmware repository by this pull request=
:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://eur01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3va=
T7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04=
%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc=
2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&=
amp;amp;sdata=3DtTxWzBFlt0tg1sRwXSapYPdG61BME5f%2B3K7dwSUHRZo%3D&amp;amp;re=
served=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40=
mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71=
b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C6377889=
18532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DtTxWzBFlt0tg1sRwXSapYPdG=
61BME5f%2B3K7dwSUHRZo%3D&amp;amp;reserved=3D0</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbj=
g3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=
=3D04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea=
1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000&amp;amp;sdata=3DtTxWzBFlt0tg1sRwXSapYPdG61BME5f%2B3K7dwSUHRZo%3D&amp;a=
mp;reserved=3D0">https://eur01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OW=
t0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp=
.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%=
7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DtTxWzBF=
lt0tg1sRwXSapYPdG61BME5f%2B3K7dwSUHRZo%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; And latest version |W16.68.10.p159| of |pcieus=
b8997_combo_v4.bin| by<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; this pull request:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://eur01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5P=
VA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;am=
p;data=3D04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7=
C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C3000&amp;amp;sdata=3DLNx2xSp39whINLxyrkgoyNeb53YjX6s1QjyonB5iJUE%3D&a=
mp;amp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-A=
mMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7=
C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C=
1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3DLNx2xSp39whIN=
LxyrkgoyNeb53YjX6s1QjyonB5iJUE%3D&amp;amp;reserved=3D0</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%=
2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&am=
p;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a468=
9d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000&amp;amp;sdata=3DLNx2xSp39whINLxyrkgoyNeb53YjX6s1QjyonB5iJUE%=
3D&amp;amp;reserved=3D0">https://eur01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7=
tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D04%7C0=
1%7Cjames.cao%40nxp.com%7C3e471c7a71b14e82d4bd08d9e1a4689d%7C686ea1d3bc2b4c=
6fa92cd99c5c301635%7C0%7C1%7C637788918532760222%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;=
amp;sdata=3DLNx2xSp39whINLxyrkgoyNeb53YjX6s1QjyonB5iJUE%3D&amp;amp;reserved=
=3D0</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Olders looks to works better.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; In quick tests, they allow more than 1 clients=
 at a time !<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; I am still testing the V16.68.1.p145 and repor=
t the results after some<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; longer use...<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hopes it will help...<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; G=E9rald Kerma<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; gandalf(at)gk2(dot)net<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8PR04MB8419A1473C69E9869471EC17E0219AS8PR04MB8419eurp_--
