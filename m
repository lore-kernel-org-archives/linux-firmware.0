Return-Path: <SRS0=ab3f=EO=techno-visitorsdbs.org=jennifer.reed@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DC5C83F14
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Aug 2023 11:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C45A2C433C8; Tue, 29 Aug 2023 11:32:05 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2063.outbound.protection.outlook.com [40.107.239.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03896C433C7
	for <linux-firmware@kernel.org>; Tue, 29 Aug 2023 11:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03896C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=techno-visitorsdbs.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=techno-visitorsdbs.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HewUHXSdg1ymJFQSHT7WzRPiHl9GS0L4KNCmFaUDTR4EOrk+cEdGyCwWDIWPVG4Zk0tgdxjfSeY1gaF+zBXL/+ll5JQnmKvPRq5gMn6UOP3+y1ZAJpNHF+kjBjSqb4PqmYJsJXspo3wFS2ZytBUrqFxYBysdFvn4LRX9boOe+d2j0zA2Ftpmpqu28J4rqL7M40weF5osdiYsnN4EnCoZDLvSHmayVcKbtsK+pllSlr4gzhlFgXtmaxFkKG3WD4KYo+VwD+RFrIG1daN3PycTPCw+DxSzeVgHjYlL6EoA1o22CS9hQVR7lFm5NQdioBj2Z8eVybZQwmn1ROCBe6aNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0di+FAIOQXnm6TBzN9+LrQlIH77otu5dQA/DN/Vv38=;
 b=NXTmRtGeT08WHXOL058mXQ+58X6GZcs+cPjSX54vdW4+/SmYNfEKCWWs+GKPH6ulOfjT1QaR203kxg2doj9F4hqDom/BsYhj2z/ayD2lpViY8GasJ2lnUbSspWmS7IT1HDmyW188E4toByeLKIfu3LM/+uilzl2UvHSPczOL5NxB0HzlPZPESiNY6h5+kiJ+Zbr0ZFGVatq4WNvB3z+/cPUR8uwVFfEdo0LZfyzgbXtgSDFfYq4N6vbKuKUkj0vISah1eXeHeD7b9FEuV5jCN4ArpIU2hcyut7ZEx3E7YuzCVN2ZPYxzVknCiUcJd98nXRCLBM42Z5skAreZrIr8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=techno-visitorsdbs.org; dmarc=pass action=none
 header.from=techno-visitorsdbs.org; dkim=pass
 header.d=techno-visitorsdbs.org; arc=none
Received: from PN2P287MB0334.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f0::9) by
 MA0P287MB0967.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e5::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Tue, 29 Aug 2023 11:32:00 +0000
Received: from PN2P287MB0334.INDP287.PROD.OUTLOOK.COM
 ([fe80::c1c4:511e:b935:eef3]) by PN2P287MB0334.INDP287.PROD.OUTLOOK.COM
 ([fe80::c1c4:511e:b935:eef3%6]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 11:32:00 +0000
From: Jennifer Reed <jennifer.reed@techno-visitorsdbs.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Fastener Fair Mexico 2023 <linux-firmware@kernel.org>
Subject: Kernel - Fastener Fair Mexico 2023
Thread-Topic: Kernel - Fastener Fair Mexico 2023
Thread-Index: AdnabHCPA+44iDJpTw+92235ziGp9Q==
Date: Tue, 29 Aug 2023 11:32:00 +0000
Message-ID:
 <PN2P287MB03345E482E05C82E1A4A89C8DDE7A@PN2P287MB0334.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=techno-visitorsdbs.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2P287MB0334:EE_|MA0P287MB0967:EE_
x-ms-office365-filtering-correlation-id: 234f1952-fabf-42b5-c885-08dba8838f5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 eWfTXLc4ujcsP24Xm3d4sqgw9I8AkDnkCeAXw592koaI7c4LHXAKIwCxkwT0ZaxU6VY2y5+dhP1LrPILdbjoQUPI6SlJ8Bke5YI9eAoHCBFZdzxmSmWWZnoXUrha9upw8sMAFiiliudNvKt2Ix/cUSy5GLML0OPuYqr8JpoWOdGr34qSXFRdyT5x27R4LE8l+QzOAoKv//cn2aWk6tSGCu+qoiWb11J93ZcmldqMb9JKz/a44xCN8ED/HgR3kOw12i7VC+aNwjuk0MesRoyMgArUtR+5dwGXPQWCDkG4BCVmNrvbAn2Z0nV12nfA92I7eq6tL10yak8sr6rDRDb3NIjn2lcAa1Zf5EzevJiCTM/MdDBZYUJVYFtaPTf/rwUBFCwRO5e73jY+h4mSiqTGrKEGT0NvV563Y9NFfCHf7f6aePCnLylhMciV5JN6kY+Qj9W59C2e9Gk89/D7CNGO9cQm726gM9TUQIh2cT0LgUFPaii90HvIlu+yc3E6Ech7QAPqdaWUuN595BX/YzjoLMc0OnrC2Lnh/ppK7becg4cIl1spRegMk4SJUVkS4csY2qT8OWzovk/bVCjTCss1rDRe+EcMChwFdRhJia3prM+Jq68SuVnbppkIjhkpMiEv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB0334.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39850400004)(186009)(1800799009)(451199024)(9686003)(6506007)(71200400001)(7696005)(83380400001)(478600001)(26005)(76116006)(4744005)(2906002)(6916009)(66446008)(64756008)(316002)(66946007)(8936002)(66476007)(52536014)(66556008)(44832011)(41300700001)(5660300002)(8676002)(33656002)(38070700005)(38100700002)(86362001)(55016003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W8CPra9wID1lVYhkDlbwHwiMQEuHH+RvFM9Px3d300z0ZYFBn/phMt/veVcA?=
 =?us-ascii?Q?Nn023LnkjDPbQM3VNV1pGK/DlzHNlIz+VGGe0WzeFZKtybd6SkfrFFtXdyH3?=
 =?us-ascii?Q?BZbRXcbzNYsX1pBdPoBj3PcAdziJ5ITmcXtV6HDntWN+VCXaB2ZH7w9WbB3N?=
 =?us-ascii?Q?8hm1RY9SODAIpAqdHQ92fK7/BUtquOpvoljm0LPm7zBr6pqxodf+AlOKKNm2?=
 =?us-ascii?Q?JcvxjY37fxNpcPvwDDXgNvwbz/4v5WES+YBpq5Yf8ox01FzeXnlFOh7Zbdrw?=
 =?us-ascii?Q?vAmX1spKyHSf13k3iQS2P9i/xShgtPOQ5jE60vfXC2GuwO0zL8GVtSr5FUwM?=
 =?us-ascii?Q?tJpUfB1jon8Qf/fIhk6twHaVU0a3UYcQVbwTNpPkzkT2JHhMNUvCouyGLk7b?=
 =?us-ascii?Q?eSNzY4fVQAH/vEIychVFx/OPwdZCxESrvDKZoMpEN15BXvmkaPyykLyDf/Xm?=
 =?us-ascii?Q?Deon4og3MX/oeSmFVCCqnu9OUzYZ666fZCHgwApYk1epZMvUneMJb/4Inyqx?=
 =?us-ascii?Q?tdiuX+XxmVG9Jbrc5RRhpU8XEmeAUJ5zc4hLX8mkPZqWXTbihqVHkN7HwE/X?=
 =?us-ascii?Q?TTkdrUC2F7sRIqiTW5RaYIQLhWklU2q8kFg1FiohOK8zuBaVgW/vW/GIabKm?=
 =?us-ascii?Q?HG5KijDZ0esMq3LusJ4j08zi190z2eWPucIJ+kscp7AUyNnMg7CmyxqvXt4C?=
 =?us-ascii?Q?WTnrVgBbay3dd6hscJIOxVsuXcXvGCkZCZxoYbf3ppzE09lpcqZrnb6cr0Uh?=
 =?us-ascii?Q?NWFILhuUMDKqu3AnXTDt2v4ZWeJc9syTwd60qz8278vK83ClBH+OaHLQ0cE5?=
 =?us-ascii?Q?KJC8DDsUr+MbketHi9jHhudcoJATEEAIYjzn1Fm2oa9yP2UrjFHUHMnxsf/6?=
 =?us-ascii?Q?7rxB3kBeDK5SZbDP6mOgeC2ZZ16NP40Fhsc2YnWIBWhIoRChsWSV+VCTcIks?=
 =?us-ascii?Q?uNayxkrX1zpMFq+IK9EE65dY5CHOjHTw735Id182gPyqTkYBPYEIIoOzSD4I?=
 =?us-ascii?Q?pt6Q9dsIbsfPeVsIuZhFuOLWs+XLhZ4dRoxcmX5T58F8eleRf9YyDoTmIsPZ?=
 =?us-ascii?Q?KrdEpbUBUDHllbK9MHGeTix5XqGJku7PNaH6yCWXjD4/KaYHXRD43NVyJN92?=
 =?us-ascii?Q?LNosOnBGhf9Q2HCN+gq7GgkpgfzaEQZyByRabnN4gDmh6z1qO6cQAxEDrE8A?=
 =?us-ascii?Q?ZfEhMeEbHJa5zdQBnY11urxmbN1DmtnmF4iq7+fGQnUap6VcvY5i2/+/CHam?=
 =?us-ascii?Q?HyyOoJ8wWsoMbAHIyS1cLxlCYrG54BZPYgGnqd1po14vpwKBEohvC5TmSQE7?=
 =?us-ascii?Q?YkhG6CAlCypdKea2mlqWEC3rI3xXQADUfM5tHlkEk+9Ei0xy2Aa3zxa+L4oz?=
 =?us-ascii?Q?byd47JfeMqDTHLLY55MYcnd9221RwigMBgEhqKo+THCjlIpioZXMErN7PZ0n?=
 =?us-ascii?Q?mPVxzLWVU8zZTt/zDeLomgUeAYH5U8be+2tb5UMZ5lZ4kDr1mm+vJ77TWAB7?=
 =?us-ascii?Q?okSeFKTuVNqKiLAwIV4mUAxRwbsEwSK2/OdxTBhPFBRLBoi2v+kehVzi+V7H?=
 =?us-ascii?Q?aEN5oFt5ugROHDQ7MziADiTAutSMAgwl4EgzcF8OLeKZXtE8JOiAQsnUya8P?=
 =?us-ascii?Q?3Q=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN2P287MB03345E482E05C82E1A4A89C8DDE7APN2P287MB0334INDP_"
MIME-Version: 1.0
X-OriginatorOrg: techno-visitorsdbs.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2P287MB0334.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 234f1952-fabf-42b5-c885-08dba8838f5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 11:32:00.2286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d44a3d4e-fb0a-499c-8121-4b47ab79f308
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b7aPiIHuR1t6QAFyLiiu9fjKSTwIMzidu6GAChBUANpMoZXqmfF8JZhpCOqliSy/rbl70yhpWuvAuHT1izx8feiQJQnrphp0u72RyJzc6o0AVdXIKwYMg4bqrJau4nXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0967

--_000_PN2P287MB03345E482E05C82E1A4A89C8DDE7APN2P287MB0334INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello & Good day to you
Don't miss out on potential attendees contact information from Fastener Fai=
r Mexico 2023 to get clean and reliable contact information of the attendee=
s with email address, phone and business information.
Let me know if this sounds interesting, I can share the counts and pricing.
Best regards,
Jennifer Reed - Senior Marketing Executive
If you do not wish to hear from us again, please respond back with "Leave O=
ut" and we will honour your request.

--_000_PN2P287MB03345E482E05C82E1A4A89C8DDE7APN2P287MB0334INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:106%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><a name=3D"_Hlk140449334"><span lang=3D"EN-GB" style=
=3D"font-size:12.0pt;line-height:106%;font-family:&quot;Times New Roman&quo=
t;,serif;color:#1F497D">Hello &amp; Good day to you<o:p></o:p></span></a></=
p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk140449334"><span lan=
g=3D"EN-GB" style=3D"font-size:12.0pt;line-height:106%;font-family:&quot;Ti=
mes New Roman&quot;,serif;color:#1F497D">Don't miss out on potential attend=
ees contact information from
<b><span style=3D"background:yellow;mso-highlight:yellow">Fastener Fair Mex=
ico 2023</span></b> to get clean and reliable contact information of the at=
tendees with email address, phone and business information.<o:p></o:p></spa=
n></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk140449334"><span lan=
g=3D"EN-GB" style=3D"font-size:12.0pt;line-height:106%;font-family:&quot;Ti=
mes New Roman&quot;,serif;color:#1F497D">Let me know if this sounds interes=
ting, I can share the counts and pricing.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk140449334"><span lan=
g=3D"EN-GB" style=3D"font-size:12.0pt;line-height:106%;font-family:&quot;Ti=
mes New Roman&quot;,serif;color:#1F497D">Best regards,<o:p></o:p></span></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk140449334"><span sty=
le=3D"font-size:12.0pt;line-height:106%;font-family:&quot;Times New Roman&q=
uot;,serif;color:#1F497D">Jennifer Reed - Senior Marketing Executive<o:p></=
o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk140449334"><span lan=
g=3D"EN-GB" style=3D"color:#BFBFBF">If you do not wish to hear from us agai=
n, please respond back with &#8220;Leave Out&#8221; and we will honour your=
 request.</span></span><span style=3D"mso-bookmark:_Hlk140449334"></span><o=
:p></o:p></p>
</div>
</body>
</html>

--_000_PN2P287MB03345E482E05C82E1A4A89C8DDE7APN2P287MB0334INDP_--
