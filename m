Return-Path: <SRS0=Q6lm=2Z=globeinfo-db.com=erica.turner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C0BFA373F
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Oct 2022 15:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59BF6C433D6; Mon, 24 Oct 2022 15:43:04 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2040.outbound.protection.outlook.com [40.107.222.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03E56C43470
	for <linux-firmware@kernel.org>; Mon, 24 Oct 2022 15:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03E56C43470
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=globeinfo-db.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=globeinfo-db.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF2e2+mTrT6B//CoYyFvc3qBqogBut5U0mqaLkDh+yJRDUuKVdk0Ft0bEu2vaXaDsWmm/7W5E/m7NgA4+ZSTNLAiWJ3lmAxnc97imXw2CFap28ZERsk4JMVziH502jaPfvhdiwf1LR/Jgqm8LOCz5aumAXK+UDIzd2DnXpdDYWQt5op/omIhFtAhZHcm14yNI6PeI7dkIrnxNhKAQleTL4q/zmrnPx4aOpPLj0yrnIsdT3tO7IwXmYcw/Od9eDBQQ/D60hxawXoqPr3grylaaMyYVSUDK/77obRreoZV7nluqkRVgbkauxhEpLPVJX8fQVeVbosLTlm8lHV56jUqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Go43mQvQiQk0ifocIeR+NU/rE37t8VnLHEzKgw/iF0k=;
 b=nsN1rmXMVEGKQ3F787V9MgIBk7YBom9TsDoKbNEeRoX/fImryEhZzcCLyi68jyNm/7ZvTSUTS6V4LaZd7mIWpCXo+4topx5b4Jqn10Tx5nLHVofITsle0h1PdJ/TIiag/Q4egnnITSa6UuP3sC0Rq7J3s2rmZYMda43+a04vdGAcXiCHL6+lrhWp++87IZwuJwN0xGbqrmW7CPvDrSdWsgLiSCZwZ0MjbM4jAvOBlovFVTAoUt/ZpW9Dz1lLpd0vVb9ewNT/cYQaTDEUH0Bx1vz3w8rW+MD6Yn2mQtQLGzK9F5cfFCh55XvpNSMKeo3/J5L1KaOpF/RcuBVqnxNLqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=globeinfo-db.com; dmarc=pass action=none
 header.from=globeinfo-db.com; dkim=pass header.d=globeinfo-db.com; arc=none
Received: from BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6a::22)
 by MA0PR01MB8420.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:93::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 15:43:00 +0000
Received: from BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d04:9c5d:14ff:671c]) by BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5d04:9c5d:14ff:671c%7]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 15:43:00 +0000
From: Erica Turner <erica.turner@globeinfo-db.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Keysight Customers List
Thread-Topic: Keysight Customers List
Thread-Index: AdjnvsZJ1S57U9v9TNupfXyaqz+oBQ==
Date: Mon, 24 Oct 2022 15:40:22 +0000
Message-ID:
 <BM1PR01MB3346061FA63FB8DC1949EFF1AB2E9@BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=globeinfo-db.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BM1PR01MB3346:EE_|MA0PR01MB8420:EE_
x-ms-office365-filtering-correlation-id: 581475f2-2391-4b0e-7daf-08dab5d66e22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 H5dk2+cAm02hAb8xt2l0vFFG4y8TRKn3w0QeaFCe34R/EloqZU2G6Sw9WV/AGkTuFCgn9N+KoLEXvLhanPLBdwkigiuhmT2VYLX7hjX5OZJgyKiLyNWEdsSRCy4mQQDtsHzTaAAax6OK5wtziXxdNojlI15ed7bGkrym6og/f0nHLCl1Fp+mmsGnj0Gx+MquAfZB2OH5qjXL2kYHGTChhO9CzjD9KCq6oZNhG3j85hrtVRXxyjzQHOwlQALVmH1mPq2gXQ9MuMG9feAbgRhhB4i0QkCZuM3XegQ36H1xtVTF0IlgjSA0L2jZAO9Mlogfe2EEoIXIV7EBxeBAjwKPgRLzFlThMHQfp0QcVm0bYXEdcU3TUFzYoNi1mcYn2YUEecXWfX0w1hn/bBce0sRWgbUCeVoJ6W7FTHpPtuHvHiLjVHnT90uVvxLNBqJT4ObVftUp1lEG4NouSza6Q6d8856/I8cK+wE14WqxLDMaFnCTL07C9u+shyeZorgYY6FHv+PUVMEoMFMQXalMxaQDuC/1JbT7CywIty5yqWh2LrZR0QTCQNWYyDk+Kz4phYrSJ3uwoUb4ArRTX8FFubU06xYIWes8JyYXpgiCe3vRGk3cEQPjX2kQTc3YfeS60zGvG+TE1HwdNvms3IqwZMhP6eVKEudwtOSHaklvLTXvo4L/fckWttk9MQHFgtHuoE539ODJ95ZeMCRRyvIj30hqTmXpCx5JOq5rQSPiUznGJzpZyIEYMBYy0foX3FNzwA76
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(346002)(366004)(396003)(136003)(376002)(451199015)(66899015)(71200400001)(86362001)(478600001)(64756008)(76116006)(66946007)(66556008)(66446008)(8676002)(6666004)(7116003)(6506007)(7696005)(9686003)(9326002)(52536014)(26005)(41300700001)(8936002)(5660300002)(6916009)(38100700002)(122000001)(33656002)(55016003)(2906002)(4744005)(186003)(44832011)(66476007)(3480700007)(316002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pEjy+rdro0xDN9WCmD+B1HEoj3AOHM8dm5Mn7os9KAzjCs5GpwM8CgPsMNbj?=
 =?us-ascii?Q?0/2ZRs10+VCjDcYEyLPHNNK0bdfWh5P6VPgXq5R6HmA0JfIIO5Njqsgps9q5?=
 =?us-ascii?Q?7fyvuJLvQdjl5N0GNLLd4Zhri++sJiKGCNyefkPMDc9thfK3F/Lw/losAYYU?=
 =?us-ascii?Q?bqTT1ImWketrDsznDSKcwwAdIpE3dDVu7K4WC5HDlVpZOcmRrspfjO5VIs4n?=
 =?us-ascii?Q?5HQSyRnkle5rW1A5Wx33ZWsAoJRl1rq5y9PvqKxi1MGqe4MSSxGlfwnBq3eT?=
 =?us-ascii?Q?fYkRlzpejMISQJqukN3+i+iPGYW0QJDMcsYsEi/f/zffgO+yXNllagjoqxzI?=
 =?us-ascii?Q?pix/Uq1zYnFzxpC0QSp64umt7Yq/bE5xeyaKrxutp+obGt6+9Rp9Gnn9eoVX?=
 =?us-ascii?Q?lIYvUyZO/pdo5f6mmF5islSj6uym3ewFmbVvzlGPmIqphapGmpE1Qw7V2OsP?=
 =?us-ascii?Q?fGgGmrXgaQSE4QnChedLbADCOksG9+xQk0/3auu0WRBPPjGKn3RxtG3Tey2z?=
 =?us-ascii?Q?6n1dCaQD+MBojlbdWhpIAZEPe2H62UXiNP3cGyD3vtFqmugAbQziP+odaxf1?=
 =?us-ascii?Q?vjZeDmdjYtiDdJYEgfH7ThmyN+gU5SZL5Yr1MxyFTZuyLdU6IDIyWSpzvJae?=
 =?us-ascii?Q?2/0eCLxBv/TpGokKMHfJ78SwLXb3iJ4uagdmGBcKx5qwvehgOwn5SlEN3G2Q?=
 =?us-ascii?Q?kVKhYZjVjB1jFJ6MYrUtpb9rUyc6Ex6HnIhKEJUXXOcDeqdCyUDh3kG1J+0+?=
 =?us-ascii?Q?6YHY2wrbG5ZhXyw9lF1dBBIonlvSx7BnrJGCAsmFCBeLYjZcGnTzrPVLaGK3?=
 =?us-ascii?Q?XOF00fGbWCDn0M6Tr7z2Hbr0W9eGfH7/4DUFYe8eppkAP3j9ez/KqUOVXiOz?=
 =?us-ascii?Q?AdHj5WiRKVQTwCQ1qxPHNknpK1tV//KvqfsZrVWR8n9ooeCDSNJO+whd/U/B?=
 =?us-ascii?Q?3JjNu53KMvIRG4rwc41sS3cMuYUz2l8vuDyK2ZBcJK0nwiZP0bxJXnzezMyG?=
 =?us-ascii?Q?Pup7aulzLftoOnFIJsqxN08OuS/XIjmu0E1FYokh99OybQFoDiAmBHQtiN2l?=
 =?us-ascii?Q?hG2P/fXzjPs4rmcgSV4hL6hWuO3PwSzkIJg0hTgZQK100RepPf7pSi7znFXe?=
 =?us-ascii?Q?UvdlIazE6Lspge21aY5sKgdrbcWmy8WjbJ8CsuJ1NYbMuuOCjY2K/t31j5BP?=
 =?us-ascii?Q?PGpd5KA47+9hH+I6RyzlRUJBaNh+qTR7+Do/pJVj6/pChnnDn7hMr7R7Xf5t?=
 =?us-ascii?Q?KlLQUvSwRIulxjHwlarT8E+4Uqi+DyQCQcL0vDWVskBd2GAAEW030ATyAfGk?=
 =?us-ascii?Q?GCNczvPWC3u/7Ih3CXoZp26B3EyjY1fhI7pfL/Lcja5+Bc+UyIrOuMuVmzAk?=
 =?us-ascii?Q?hKoIbsxYmgSUQ5NK4uM6whF2aGEjFtSXnTzjtRdOo40w1dZzuIcnxcsOGntT?=
 =?us-ascii?Q?SyYvSlAHgVQeLaYAvbRZ9m9YUVFlw2Z890rzGYVWwUzK50i7XYTCwZLcJlRo?=
 =?us-ascii?Q?H4ZVzORCvGQ7VUb1klPZzDL9SA5H7EkhakR1ydwydO+a5V81UVDOxPgfNVXy?=
 =?us-ascii?Q?1xAGa6SPk7Xn+w2xcos2R29MsCsAH50U1/dpAEC4QsLH06ZCro4VsJV0RdgO?=
 =?us-ascii?Q?9w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB3346061FA63FB8DC1949EFF1AB2E9BM1PR01MB3346INDP_"
MIME-Version: 1.0
X-OriginatorOrg: globeinfo-db.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB3346.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 581475f2-2391-4b0e-7daf-08dab5d66e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 15:40:22.7001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86ddcae0-ef95-4504-93e8-2ecf0a7a58a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmyIO7l0w+LjNeecl/Sp9AZw8RakaxDgNaE/wiN3bJAIv2s1zD6bIbqOALZ2cb1L9tjXumPr6tskKFl6Wpbu+6aeqRAR7gx3Md2OFlLeg+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8420

--_000_BM1PR01MB3346061FA63FB8DC1949EFF1AB2E9BM1PR01MB3346INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Hope you are doing well.

Are you looking for Keysight with email, phone and complete details?

Titles like - IT Decision Makers, CEO, CFO, IT Engineers and many more.

Let me know your geography so that I can get back with counts, pricing and =
more information on your interest.

Regards,
Erica Turner
Sales Consultant
Lead Gen Marketing LLC


To opt out, please response Outs.


--_000_BM1PR01MB3346061FA63FB8DC1949EFF1AB2E9BM1PR01MB3346INDP_
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
@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Hope you are doing well.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Are you looking for
</span><b><u><span style=3D"font-family:&quot;Cambria&quot;,serif;color:bla=
ck;background:white">Keysight</span></u></b><b><span style=3D"font-family:&=
quot;Cambria&quot;,serif;color:black;background:white">
</span></b><span style=3D"font-family:&quot;Cambria&quot;,serif">with email=
, phone and complete details?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Cambria&quot;,se=
rif">Titles like</span></b><span style=3D"font-family:&quot;Cambria&quot;,s=
erif"> - IT Decision Makers, CEO, CFO, IT Engineers and many more.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
">Let me know your geography so that I can get back with counts, pricing an=
d more information on your interest.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Cambria&quot;,serif=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><a name=3D"_Hlk109915644"><b><span style=3D"font-fam=
ily:&quot;Cambria&quot;,serif">Regards,<o:p></o:p></span></b></a></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><b><span =
style=3D"font-family:&quot;Cambria&quot;,serif">Erica Turner<o:p></o:p></sp=
an></b></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><a name=
=3D"_Hlk110529554"><b><span style=3D"font-family:&quot;Cambria&quot;,serif"=
>Sales Consultant<o:p></o:p></span></b></a></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><span sty=
le=3D"mso-bookmark:_Hlk110529554"><b><span style=3D"font-family:&quot;Cambr=
ia&quot;,serif">Lead Gen Marketing LLC<o:p></o:p></span></b></span></span><=
/p>
<span style=3D"mso-bookmark:_Hlk110529554"></span>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><b><span =
style=3D"font-family:&quot;Cambria&quot;,serif"><o:p>&nbsp;</o:p></span></b=
></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk109915644"><span sty=
le=3D"font-size:8.0pt;color:#E7E6E6">To opt out, please response Outs.<o:p>=
</o:p></span></span></p>
<span style=3D"mso-bookmark:_Hlk109915644"></span>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BM1PR01MB3346061FA63FB8DC1949EFF1AB2E9BM1PR01MB3346INDP_--
