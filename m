Return-Path: <SRS0=/ZMw=NC=usaleadprospect.com=isabel.nosek@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9139DC432BE
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Aug 2021 15:26:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6946060232; Wed, 11 Aug 2021 15:26:45 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (mail-eopbgr1380072.outbound.protection.outlook.com [40.107.138.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6166056B
	for <linux-firmware@kernel.org>; Wed, 11 Aug 2021 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D6166056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=usaleadprospect.com
Authentication-Results: mail.kernel.org; spf=fail smtp.mailfrom=usaleadprospect.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itOiUa2M6NGjQjr13+JGrAPG0BY30UshAuBL2vYBGQL3KFifhnbntMJFLDA9n8x1ggRCbMzmcnuzX99rYzuRYXNZw8Rd50kD5GPIHiM7p60tE1rOPp4kBLg/aW+qffYvhJV2f609jRb5dfdCHz9rAyWp+Km33G5Sdv5HitLFyeteW349Ea88/fapg5k4mKHUVFiKgK65y1Qu0UJsh/A5/NcSqf6pdiLjCqZ70FuAVgv/VIJeA6ijcu06t5eh1zynbJ1zb+euZjBSELJBeqml53AqsBqQ7DnXsyqzr0Zlks1uWlXAdbaTHqOPXXIaunVey7hpFXrcks0wg70NCYhfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7EtKTT5ASh5/45/fPjASPumVIjlgwjk8bwiTpDoyHk=;
 b=j7MOPNlfrN3D6EqYFfD9DNnwHY+zyrvH1qsyuwGSjY4MZMGsf4TtJXv/Xk2+8h5RRITvPbdYXqlv1RJQGDIVf6CPkYGaiQBCHA6/W2zq+QoMy7GfkNa9PzFCR5/gO0EzDkL0mZaIeFvoOi9KCIG2n9NwlDziZOcvItA0/BvcBrF2PfUkIYmZ9Bk5q39ODVhU8Dh0MgeO2PRRYA9qcMJV2mRFc5GLySSKt+iiX+5aN1HVJS13fcLyxm29M3S38RlNRXkJNd/pQcQDZk4vkUSOgqBtYr2hEpuJYogt12PlucrcZli5SBlmTnaU9AbP+hiomhFLO1NqOfPNopyBLh6/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=usaleadprospect.com; dmarc=pass action=none
 header.from=usaleadprospect.com; dkim=pass header.d=usaleadprospect.com;
 arc=none
Received: from BM1PR01MB4963.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:15::19)
 by BMXPR01MB2408.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 15:26:42 +0000
Received: from BM1PR01MB4963.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e0c3:6c90:44d1:6949]) by BM1PR01MB4963.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::e0c3:6c90:44d1:6949%6]) with mapi id 15.20.4394.022; Wed, 11 Aug 2021
 15:26:42 +0000
From: Isabel Nosek <isabel.nosek@usaleadprospect.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re:Flash memory summit 2021
Thread-Topic: Re:Flash memory summit 2021
Thread-Index: AdeOxTPO2HIRRTUgSVukm6Ee/mPJmQ==
Date: Wed, 11 Aug 2021 15:26:11 +0000
Message-ID:
 <BM1PR01MB49635EBEFCF2A2B831778CED80F89@BM1PR01MB4963.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=usaleadprospect.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ec09d53-37b0-4b4b-d4fe-08d95cdc6bcc
x-ms-traffictypediagnostic: BMXPR01MB2408:
x-microsoft-antispam-prvs:
 <BMXPR01MB24086FA622F153BBBFA1CFD780F89@BMXPR01MB2408.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g9KeFeXvnZNiANOtyqeRIXby6jtYh99J0kbFGuHR/FMsbm0r00E23nsuP+zCaDMtPMSbragqJMN3ibRuKVaiF32gObt707ZLzzuYTvxCK5nSk2z7ohU28Dun5hdhjJIuT8hWqSQ/pt57+kYtkKc7FKpFqUL4stoAvjWrjxhXILCe5r6H5CdFoisHWLnpSbcooZgNOYV18GP4ybLISAg//obN4x8na6GduwxrKqTjqyDgXjmWEtcRJCk9Ktzf5i6oNl0LPphlyn2UdIbc6yTZeI4xQaf+Nif8oYdRJbAY13hYjIZ5TaXa25vrS0/jgTdfjMjWQHGSg/tF7Dwr0SB1Oo7c2BIQPGCkIRR3Pr8/Qy0G8S1lcjtlxBjpgCnq/ieyFDxsQP56EedQq+JGEnJo6Vsfm7xuizZ/Z0jIMrJsnMs1oZt8wdktvbuqx17EkhRWBkVoUhw8UJVnh7MZ6vU+tbfO6K1CPczHB6uLxPgYT9bSAIZsZaAZ6lIZM3q3IyrVkhbGjGSpV+X1HypJbbyrBvq880HNH8Iz7e17CC2YMGNhXHDimk2RyXM7dzSSMW7lj2N535G4FXz+aelSPQfPGfT1SRRuFs6TmPHqtnfkzaNx9dwSHKfKFfzGpBpLwQjbBI0pSTkaPX1yTEemn8hyFfSc4XmEZmMUmTWFJsk3l1CxHMvH5b79u+2lL9m/u0G0uQhaQhRXPsxmD+ZDTUjMLw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4963.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(39850400004)(366004)(346002)(64756008)(66476007)(66446008)(66556008)(316002)(55016002)(66946007)(478600001)(76116006)(7696005)(122000001)(44832011)(38100700002)(86362001)(33656002)(2906002)(6916009)(52536014)(8936002)(5660300002)(6506007)(71200400001)(186003)(7116003)(26005)(8676002)(38070700005)(6666004)(9686003)(146613001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JFrUbxrxl96mqZb5EPP+stap0iGSJYMfwFSjwV/DuEbPCZasYHQlYDNP0dBJ?=
 =?us-ascii?Q?JLzUOQ3d5v7WA1ISuYLrF9+LI1AIJL0A2UOyt+29mz8XZFCwaXmXSxPPt/Mg?=
 =?us-ascii?Q?q4UbAMEqSzjtxGCs+57mc7r3vIg+QybYJvoaT+F++dwAEfoejYv3evT7JgVW?=
 =?us-ascii?Q?HWy1dg2i6sJopVE6gO0MB3mTPVAt97fUUEnAYhGMOWGhPzv9eo20GHY9ohj9?=
 =?us-ascii?Q?KU6hrf5dIyYNvu/8V6Jwq16pzhd1HHGS7YYZgjT4YZKGr2GHYaGJCgRc8n8e?=
 =?us-ascii?Q?ZUsFE9I/bXwcM8EcdLsmWK/W2M2YnriXn9ONnZpWfsaiGcUXakKUWHMcPecT?=
 =?us-ascii?Q?m92biNZStUum6JRZpwaOKUUi4I3Xz/0u8dHdTuuw8fqANc7O3w2KsBiXxoZf?=
 =?us-ascii?Q?dVp26j1ZSu3ibyglh86YDwy07Pn9yOIxnm9woXzZBGA0ZHKC1xu7CN+fsALd?=
 =?us-ascii?Q?w4MTPoGLyU+TSVUdnEUrSEazflAule5JxCCdPs+FEoaaxUn2EoXKTShONit6?=
 =?us-ascii?Q?kP0o6PXjKofek4vmN1723H9bpJE8dte7FGa9v8zxsoiAQr9SLPQBBMXchXZr?=
 =?us-ascii?Q?bQHT8WiHSiZty3w5sG3DnxAV067CdM+6WP5sUacxpvFmJz0EbMuz/VYSjU1q?=
 =?us-ascii?Q?rsJU/pYQHx+Jf1vxFgs3SM2t6V/eYvj5xL/5aY7LiqiPU8FsV/K9qL8Qd1BK?=
 =?us-ascii?Q?VPowmh6KJnxaqi/DGNxdz9HdC31ahZzDxhQLYWtAqea4WBeIoY3/SGUCf1Oj?=
 =?us-ascii?Q?K5B6gIRG4Zp941vjoRZ+xwFKIpSZcJAJ8gBT2M1/xcJKUNUXv/0C13/8iXbA?=
 =?us-ascii?Q?au3H3IBfRqeCBgnIJU2m3pT9M/gkqFtJztMymgFAzFVKiLLBX0mDOd/rt7lf?=
 =?us-ascii?Q?sd7qS84Bwr+DS9ptda5JIpBZ/ir0dFA55JIRV+yCVdCLm6c+SovpGnvbLw83?=
 =?us-ascii?Q?wjIXntHukux0IqEeQm3XnTPmqzH2NbxiTcBWjLtuevZEWMfSvPSViWRllI5Q?=
 =?us-ascii?Q?su2rSJx72nnFJQoysfnfCN9kK86B02euFsus+IWkwjjEZcKmFtm+yrpH/r8Y?=
 =?us-ascii?Q?fxpSQv+9NHNzsk/SbCNAanBimbLE+Kkk594xuouaQFSFL5R/RgX2rySmnCJ8?=
 =?us-ascii?Q?sMlxxLrjFdt2w8gKFdPoqpGj1Sy1JuTyfJu1h531XPJ7NKtaXQLR5bNKoi3k?=
 =?us-ascii?Q?NzRslDDSZNW15yECBoiAq1WchI9mVOfoTsjV1hwuTXWSXE2qAE6zlWlnTVxO?=
 =?us-ascii?Q?REfnXKNxgeCG8xRQxc10asK9ndvF44MxD9Op4x1eUyV2MEBeW45A6w1I/l3C?=
 =?us-ascii?Q?pHI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB49635EBEFCF2A2B831778CED80F89BM1PR01MB4963INDP_"
MIME-Version: 1.0
X-OriginatorOrg: usaleadprospect.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4963.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec09d53-37b0-4b4b-d4fe-08d95cdc6bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 15:26:11.9482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 96c7c07b-5d7c-4fbf-aae5-88b4bdc816ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tnwVgMn1/P5OmBCZho0Oicy9DJKAwO2bn1yGfcU9FtEiMEaP9kZIsEOp6tPapzC+CjUVzt/NgNeWNGHuAs1DP+/AbbuHiNxBfjHbmsxbZyOfhrOuEY/glmBXJ7BpwnVe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2408

--_000_BM1PR01MB49635EBEFCF2A2B831778CED80F89BM1PR01MB4963INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there,

I'm contacting you to learn if you would be interested in purchasing the Fl=
ash memory summit 2021 professionals contacts for your sales, marketing, an=
d promotional activities.

The List Contains: Name, Company's Name, Phone Number, Fax Number, Title, E=
mail address, Complete Mailing Address, Company revenue, size, Web address,=
 etc.

Contacts include:  Key decision-makers


?  Hardware and software designers, embedded system designers

?  Storage specialists, Systems engineers

?  Consumer electronics designers, engineering managers

?  Data center/computer/network managers, Solution providers and consultant=
s

?  Storage engineers, VARs, OEMs, system integrators

?  Communications engineers, Marketing and product managers

?  Venture capitalists, Market and financial analysts

If this sounds of any value please specify your requirement in detail so th=
at I can share a few Business contacts just for your review.

I look forward to hearing from you soon.

Kind Regards
Isabel Nosek
Demand Generation Specialist

    If you do not wish to receive future emails from us, please reply as "o=
pt-out"


--_000_BM1PR01MB49635EBEFCF2A2B831778CED80F89BM1PR01MB4963INDP_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:8.0pt;
	line-height:107%;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1251887106;
	mso-list-type:hybrid;
	mso-list-template-ids:1263196778 67698699 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" style=3D"word-wrap:break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Hi there,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">I&#8217;m contacting you to lea=
rn if you would be interested in purchasing the
<b><u>Flash memory summit 2021</u> </b>professionals contacts for your sale=
s, marketing, and promotional activities.<b><u><o:p></o:p></u></b></span></=
p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-AU" style=3D"color:#0D0D0D">&nbs=
p;</span></b><o:p></o:p></p>
<p class=3D"MsoNormal"><b><u><span lang=3D"EN-AU" style=3D"color:#0D0D0D">T=
he List Contains:</span></u></b><span lang=3D"EN-AU" style=3D"color:#0D0D0D=
">&nbsp;Name, Company's Name, Phone Number, Fax Number, Title, Email addres=
s, Complete Mailing Address, Company revenue, size,
 Web address, etc.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU" style=3D"color:#0D0D0D">&nbsp;<=
/span><o:p></o:p></p>
<p class=3D"MsoNormal"><b><u><span lang=3D"EN-AU" style=3D"color:#0D0D0D">C=
ontacts include:&nbsp; Key decision-makers &nbsp;<o:p></o:p></span></u></b>=
</p>
<p class=3D"MsoNormal"><b><u><span lang=3D"EN-AU" style=3D"color:#0D0D0D"><=
o:p><span style=3D"text-decoration:none">&nbsp;</span></o:p></span></u></b>=
</p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Win=
gdings;color:black"><span style=3D"mso-list:Ignore">&Oslash;<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:black">H=
ardware and software designers, embedded system designers<o:p></o:p></span>=
</p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Win=
gdings;color:black"><span style=3D"mso-list:Ignore">&Oslash;<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:black">S=
torage specialists, Systems engineers<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Win=
gdings;color:black"><span style=3D"mso-list:Ignore">&Oslash;<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:black">C=
onsumer electronics designers, engineering managers<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Win=
gdings;color:black"><span style=3D"mso-list:Ignore">&Oslash;<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:black">D=
ata center/computer/network managers, Solution providers and consultants<o:=
p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Win=
gdings;color:black"><span style=3D"mso-list:Ignore">&Oslash;<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:black">S=
torage engineers, VARs, OEMs, system integrators<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Win=
gdings;color:black"><span style=3D"mso-list:Ignore">&Oslash;<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:black">C=
ommunications engineers, Marketing and product managers<o:p></o:p></span></=
p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:Win=
gdings;color:black"><span style=3D"mso-list:Ignore">&Oslash;<span style=3D"=
font:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"color:black">V=
enture capitalists, Market and financial analysts<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:105%"><span lang=3D"EN-US" styl=
e=3D"color:black;mso-fareast-language:EN-IN">If this sounds of any value pl=
ease specify your requirement in detail so that I can share a few
<b>Business contacts </b>just for your review.</span><span lang=3D"EN-AU" s=
tyle=3D"mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">I look forward to hearing from =
you soon.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Kind Regards</span><o:p></o:p><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Isabel Nosek &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><o=
:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">Demand Generation Specialist</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-AU" style=3D"font-size:8.0pt">&nbsp=
;&nbsp;&nbsp;&nbsp;If you do not wish to receive future emails from us, ple=
ase reply as &#8220;opt-out&#8221;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_BM1PR01MB49635EBEFCF2A2B831778CED80F89BM1PR01MB4963INDP_--
