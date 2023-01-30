Return-Path: <SRS0=czqC=53=marketmediasales.com=mary.smith@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2505C54EED
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Jan 2023 09:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6DCD6C4339C; Mon, 30 Jan 2023 09:21:35 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2105.outbound.protection.outlook.com [40.107.255.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C29E9C433D2
	for <linux-firmware@kernel.org>; Mon, 30 Jan 2023 09:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C29E9C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=marketmediasales.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=marketmediasales.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Neptj1/kC9GXpg4fKdPA6oGvvaZIxQS6TD/6ryGQ0ErsGan0wXyRxnwSx8RMTesG5GKjmKQ3CI4x5UbdAhCQWWJIoVCesCH35k6gOzMQiIv7LGN+ZL6ylW3bUPGYinlv9dRMg25Niqo9NhQ6XAWBPOSpXDrZEYLmdAx6v7IRkOYaiz7S67lxwnJWITg1l+eTF61MY0yqglmZV3+ZbsHuTjAIQFn9mEkpRdqZnGGo4YSfEZfyQNaTo2zd09ZE2TFVw8Y7/ZDwTVWPTyFmggn2taem3qLyEYxMthWzm1TVdhl+t6w1hGzfZsO/eTp6+2gQvnEHY9GGNxXjcnDABgDd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MC5EKLgoONUcFJde3bB5ki/HFS/oQSzppMOgoo88mo8=;
 b=lj+UEEAFvPL0nbcdr3fRohDL9+nZAEnnc/Y1thhspkWSwmi+znp07QHYZqO9mQXgV2yTg3swd/1H8bGZFOWofrrImt6vrSISrU/kDS+JdiDu0o/xf0ejql9g4kCd+tgekkjZxGT3w3TokcaEquFkOPqjNTvzMOOfH3oEBoPrJ5dnepx5Wcncm1/RRbi3McWHdaVv4Dic/gOdak4eFbVNFkbr2FoQOBWnJO6skiHrWluooHtfMIdqyd0y13mohaTl3O56zsx9EnF3rb/oqzlQ5lW5aaxfc97aL2V65j9/qg7qtnpUONga99t+TEnv/9dk53PoCc39pjir8TCqcbjUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marketmediasales.com; dmarc=pass action=none
 header.from=marketmediasales.com; dkim=pass header.d=marketmediasales.com;
 arc=none
Received: from PN3P287MB0177.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d2::5) by
 PN2P287MB0674.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:159::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.30; Mon, 30 Jan 2023 09:21:31 +0000
Received: from PN3P287MB0177.INDP287.PROD.OUTLOOK.COM
 ([fe80::3df3:c79a:59f6:664f]) by PN3P287MB0177.INDP287.PROD.OUTLOOK.COM
 ([fe80::3df3:c79a:59f6:664f%4]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:21:31 +0000
From: Mary Smith <mary.smith@marketmediasales.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: =?iso-8859-1?Q?Attendees_List_-_IDS=A02023_?=
Thread-Topic: =?iso-8859-1?Q?Attendees_List_-_IDS=A02023_?=
Thread-Index: Adk0jCvp8SkfefOjR4CNaUWaxA/j2A==
Date: Mon, 30 Jan 2023 09:21:03 +0000
Message-ID:
 <PN3P287MB01775840C3574ED1D0C0D365FFD39@PN3P287MB0177.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=marketmediasales.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB0177:EE_|PN2P287MB0674:EE_
x-ms-office365-filtering-correlation-id: 9a3d07ed-61ec-4d36-acee-08db02a35fda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SmhxLVt+mBjM/ntsS2PL6GVUjq/MJa5thHf0YCOSS/tFA5DumUO0eD9wnBLfIdgeg3xKSHixUXaeTH9TaY7WPMegTkzmRjXVBc6CPOA7JQ54NCm0APCMnu+VnC34jt/G5bE6rtv2AUB9QlwaA9GBK+OT7uG/jiTDd1M2EwU/mLQwV0sDFCWoPCT3j0BhIXxCqFT4BgiUM/N1oPBkkepvg9K7tNl1h7R290vnlSBkdsKwb1biGnXepFuVhnupIaDBpi+OspZio0FEjTHb+AgPnDvC7swdz6n7wu+hko5l2oxIhmGAx8JmKOIIueJyVg/k4zy82nsv7Jrt6iPdCdiR1u2QrZ9f3pB9+mvlMjsN+VeT3CvCCyLl8rO3Z8Alompv8flcvW0ktoM0htz7IChNawhpABDEn2FuSL14EI+4RllgPz+wk8Mr7++8+Qkb8dTyLWKZF9HdI28sBJWCwyGJAav3E4/+bWI2CZ7gRdVGzBOcbLicVMCoKugaIm6nKrxOUYNWlB2GQKsOxzQ5GV2ZotX8lmIWcd2oO9DdkPD0tLQUQvXZ8sLAqhljOOGuvfj8PtJlfTt3avTcNeyM65WIbn+Ki2Gsdj2oRQ3jr0wfTuUM6buCu7xTcKjX+AB4aUWnTKqb8Xp38b8w7sXApIPSSSmUtAKU2AnqotAE/3lJLKl6HImwIDQvdYvIVvWlqXrFE+w9Kjo63cGFOmKbYmp9jomaNRnTiKu74fbtrsJVjQ0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB0177.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(366004)(136003)(39850400004)(376002)(451199018)(316002)(41300700001)(8936002)(76116006)(52536014)(66556008)(66476007)(66946007)(66446008)(83380400001)(64756008)(6666004)(6916009)(6506007)(478600001)(9686003)(186003)(4743002)(71200400001)(7696005)(26005)(38070700005)(86362001)(33656002)(38100700002)(5660300002)(2906002)(4744005)(44832011)(122000001)(55016003)(130980200001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bzq5La1R4olMzgYa0KQzn40VxN/b9VHOS7Ol8TqkhzkarsnEhYlScA8wID?=
 =?iso-8859-1?Q?SRUh/um815Mg/U/KASj+G2/YiB3aOlRKNM6GXprwCgzePGWJmiSfy3wMCj?=
 =?iso-8859-1?Q?7+WnMb5J6vXsB57N0esNXXaX2I4xf5NuDlbDP9GzjPNHsRZYrtMAW9B+2l?=
 =?iso-8859-1?Q?+YKB/HeiOHZAT3I1GmJUFX5rzkEyL8fnRY3V4vVwLhmJehzTOMpGi90vbO?=
 =?iso-8859-1?Q?DiQI/XpKE4FTvBCBfRWyj2hy5X5lLV0vwlo6HOsPmnV4xcotG6hq1oymVb?=
 =?iso-8859-1?Q?WNOeI7mT0GdW99kcJy86HZTRX7VCbu0YxnAtlQ59eIZI1ZjHMTY2JbCN1T?=
 =?iso-8859-1?Q?CpIztUlUn9cxr4Om3yWQVSemQZIzm2eNBKYUkQj1P7+tex7xZbGaErMj+K?=
 =?iso-8859-1?Q?gdmvfO10ilSdc34jNbMXoPyGD9xHmLjjacGCUOoTFguz9jJFjK2CifDKLL?=
 =?iso-8859-1?Q?xINlBlcYLR4BFhuItVbdAa18yTgOH+zuo6makTRc94HHulij/o75y/Glmu?=
 =?iso-8859-1?Q?na+/4a8yZN6tQEurhvIJVypUl2BB7InCM3VpdKNjK5fr8e6d0Q7Ka0nmCs?=
 =?iso-8859-1?Q?8iUJKykVQtSPEqEJAYx3pQTHCmyEOWqFlns0D5KMIbHu0JwJjd6DdfSEwm?=
 =?iso-8859-1?Q?fqJnv02hc08QVES+XoNpOQOegFwTJBe1X6ySocsxEkjdeMPOWADBhyqAOm?=
 =?iso-8859-1?Q?nL2tNL8lboDRWUlv1gbdu/Y0RJ2pokV8bqHt/RT28gJTi8YfmmFk5G0eGW?=
 =?iso-8859-1?Q?xKPT+KtJrZ/TMAs0gfzhbT9KhDDgG2Rv135bFRIvdrO3RJyLA7tvcfaz1l?=
 =?iso-8859-1?Q?/NaDHE59qOcsMpkmKF1ibjgtthcc8D08ZWCVwuaaHU40radte/aDBNHYNk?=
 =?iso-8859-1?Q?QJ4CsM3Vc76dsjzxMBByd+02jouUqHVGYbVR+nutrOlFPNhSkxaKpfb5pj?=
 =?iso-8859-1?Q?bFIFSrMnjBqTpYHpB+qHdrEq+8Li/DB7BX82lHikkXEG1x80RuuuIEGujB?=
 =?iso-8859-1?Q?Tj/KGOgoCTpJ/boFj9LI/TkBc4Xeil8Zw7SYXKIk7rPmrhhEIbPNulAQ+T?=
 =?iso-8859-1?Q?W5UH3LzE7v51uFnZGeD2yUD6DiaLszauGlAmkdqVKSzuaWbwN8MGhUHm8S?=
 =?iso-8859-1?Q?ra3s4UZEi918RHwcKf0K+/t7XfZju1ILoT+3Q61xhFpEkjdieEcg9A3bIC?=
 =?iso-8859-1?Q?pkQXEqsSqxe4dk4Ay0gqpMffdzCOkC/5EQJ1IndgYOuY7EqyAPWasnaMYV?=
 =?iso-8859-1?Q?roB63rfwRAC5WCKsEd4onxm9nJr0ei6q1LdszZt1ylKken8+Kn74mLU1U1?=
 =?iso-8859-1?Q?kgEfRon+gxHrMifdcqmPUlQPjpzwRfxOqguOYZx9EiOSqq8O+MX8YCXz8/?=
 =?iso-8859-1?Q?5ICB7uK9xdQ3WX4XNc75A6FG4ZKdZzn0e9W81gMAnn+4yYQCjfBJuElAMH?=
 =?iso-8859-1?Q?dRLtTCKMe/2nby62DfLbaU9Gt1z49cjHbjUtoJO4CmSi0N+GipVhTlFlei?=
 =?iso-8859-1?Q?D8g3MsBoYyCS7ZG8cNhktqghP+F+aRPLd6iiJR/8Mk+SRQi3zSCQiIjO25?=
 =?iso-8859-1?Q?tQfji89LBs0GH4erjqKnux31OycAKOXDeZuYLLng6AgOpBiuwl/AikRSM0?=
 =?iso-8859-1?Q?tVGDep+ezPdqIk7UeYsyRYeYd+uqhswIt3sz/HhwwcrwOqtZRBhG1JtQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN3P287MB01775840C3574ED1D0C0D365FFD39PN3P287MB0177INDP_"
MIME-Version: 1.0
X-OriginatorOrg: marketmediasales.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB0177.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3d07ed-61ec-4d36-acee-08db02a35fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2023 09:21:03.1910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e124ac6b-96bf-43d5-ab2e-98a77c61079b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzbZTTyRaQOe591AkkfZNcjqOq3K408IIqd//spXbVuNAhGQ2ibALltw2YstktzDf68hEAnUGPobDh2UVdj+hdY7jmM/47/5O7KS3tt5O7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0674

--_000_PN3P287MB01775840C3574ED1D0C0D365FFD39PN3P287MB0177INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear,



I just wanted to check if you are interested in Attendee/Company list of ID=
S 2023 (International trade show for medicine, dental medicine, medicine te=
chnology, ophthalmic optics, health, pharmacy and many more.) to reach wide=
 range client/industry leaders to promote your product/services at global m=
arket.



Date:  14-18 March 2023

Venue: Koelnmesse GmbH, Cologne, Germany
Counts: 40,250

Information Provided: - Company name, URL, Contact name, Job title, Phone n=
umber, fax number, physical address, Industry, Company size, Email address.



Kindly confirm and let me know if I can share Proposal for your approval.



Best Regards,

Mary Smith

Tradeshow Specialist



If you do not wish to hear from us again, please respond back with "Leave O=
ut" and we will honour your request.


--_000_PN3P287MB01775840C3574ED1D0C0D365FFD39PN3P287MB0177INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-IN;}
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
<p class=3D"MsoPlainText"><a name=3D"_Hlk62697465"></a><a name=3D"_Hlk56720=
330"></a><a name=3D"_Hlk114064815"><span style=3D"mso-bookmark:_Hlk56720330=
"><span style=3D"mso-bookmark:_Hlk62697465"><i><span lang=3D"EN-US" style=
=3D"color:black">Dear,</span></i><span style=3D"color:black"><o:p></o:p></s=
pan></span></span></a></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><b><i><span lang=3D"EN-US" style=3D"color:black"><o:p>&nbsp;</o:p></span=
></i></b></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><i><span lang=3D"EN-US" style=3D"color:black">I just wanted to check if =
you are interested in Attendee/Company list
 of</span></i></span></span></span><span style=3D"mso-bookmark:_Hlk11406481=
5"><span style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_H=
lk62697465"><span lang=3D"EN-US" style=3D"color:black">
<b><i><span style=3D"background:yellow;mso-highlight:yellow">IDS&nbsp;2023 =
(International trade show for medicine, dental medicine, medicine technolog=
y, ophthalmic optics, health, pharmacy and many more.)</span>
</i></b><i>to reach wide range client/industry leaders to promote your prod=
uct/services at global market.</i></span><span style=3D"color:black"><o:p><=
/o:p></span></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><i><span lang=3D"EN-US" style=3D"color:black">&nbsp;<o:p></o:p></span></=
i></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><a name=3D"_Hlk116467512"><i><span style=3D"color:black">Date: &nbsp;14-=
18 March 2023&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;
<o:p></o:p></span></i></a></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><span style=3D"mso-bookmark:_Hlk116467512"><i><span style=3D"color:black=
">Venue: Koelnmesse GmbH,&nbsp;Cologne,&nbsp;Germany<o:p></o:p></span></i><=
/span></span></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk114064815"><span sty=
le=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk62697465">=
<span style=3D"mso-bookmark:_Hlk116467512"><i><span lang=3D"EN-US" style=3D=
"color:black">Counts: 40,250&nbsp;</span></i></span></span></span></span><s=
pan style=3D"mso-bookmark:_Hlk114064815"><span style=3D"mso-bookmark:_Hlk56=
720330"><span style=3D"mso-bookmark:_Hlk62697465"><span style=3D"mso-bookma=
rk:_Hlk116467512"><i><span style=3D"color:black;mso-fareast-language:EN-IN"=
><o:p></o:p></span></i></span></span></span></span></p>
<span style=3D"mso-bookmark:_Hlk116467512"></span>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><b><i><span lang=3D"EN-US" style=3D"color:black">Information Provided: -=
 Company name, URL, Contact name, Job title,
 Phone number, fax number, physical address, Industry, Company size, Email =
address.<o:p></o:p></span></i></b></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><b><i><span lang=3D"EN-US" style=3D"color:black">&nbsp;<o:p></o:p></span=
></i></b></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><b><i><span lang=3D"EN-US" style=3D"color:black">Kindly confirm and let =
me know if I can share Proposal for your approval.<o:p></o:p></span></i></b=
></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><span style=3D"color:black"><o:p>&nbsp;</o:p></span></span></span></span=
></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><i><span lang=3D"EN-US" style=3D"color:black">Best Regards,</span></i><s=
pan style=3D"color:black"><o:p></o:p></span></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><span style=3D"color:black">Mary Smith<o:p></o:p></span></span></span></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><i><span lang=3D"EN-US" style=3D"color:black">Tradeshow Specialist</span=
></i><span style=3D"color:black"><o:p></o:p></span></span></span></span></p=
>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><i><span lang=3D"EN-US" style=3D"color:black">&nbsp;</span></i><span sty=
le=3D"color:black"><o:p></o:p></span></span></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk114064815"><span =
style=3D"mso-bookmark:_Hlk56720330"><span style=3D"mso-bookmark:_Hlk6269746=
5"><i><span lang=3D"EN-US" style=3D"color:black">If you do not wish to hear=
 from us again, please respond back with &#8220;Leave
 Out&#8221; and we will honour your request.</span></i></span></span></span=
><span style=3D"color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PN3P287MB01775840C3574ED1D0C0D365FFD39PN3P287MB0177INDP_--
