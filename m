Return-Path: <SRS0=n3uJ=6M=datalistexpo.com=Jacques.Mitchel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D0C61DA4
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Feb 2023 04:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A25FC433D2; Thu, 16 Feb 2023 04:01:32 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2092.outbound.protection.outlook.com [40.107.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1318EC433EF
	for <linux-firmware@kernel.org>; Thu, 16 Feb 2023 04:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1318EC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=datalistexpo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=datalistexpo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYAxfTecrXdcUE9Jypl4VbrJ4nR1WBjDdAq550kAVoPOi+4D0AlaZGhn+A2fKoUhtuudxceMI2hNcV/cG9beIVncqPX4wA2Fo/jgvtRPVFPt8c/7W6fvvtGDmB8KPnSn2hYtDkv4dZ0NjFQPG4+cfTK4SSwbZd2PDLUXkseInBhsBlQghnTL+JdQYeK3wmILKGNnZ2TNhTlyIZmndwBwwsmPEdEp4qzuy6zfP6pf1ZiBehKe5auMj0DoijV73f0FxD3pF2D8W1QF6EWRr6rTRB6TisJa2PrjzCLE6kzHBF/raWmn4QB+klAwpP2KXtoc/dtMW1HPcSAjDmWsW4spGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH2Vy28besenK6oknImW3UxKxlzDSmHjJFRGGLZQ3T0=;
 b=PoOZJZNvCXTH/Tt9LRw2j0mNjt20lhaH5N7VQjqF1BjtNowSPAv8lgGq1CX4B8p4sZsr1VPiCZJsb4IPWlE+8vgVOIGqayhZPGVNhzsUldvltnAyh3xCcwIB98xXDcmAZgMSIfpZOJgrnuuGcTIfzJt2t3TVmlmsEqRESUuGTbTIe8LVd19n0MH0hC1n8wHD/dkka0SXJZ/l0W8oKmXQlYanA4fBCLkHuimHLlGR7sMhw8J7m/I2kElXF89tFTKYp6sEMDZqZ/AZwQfUjJhlc/8MpV1FU3SnTXxR4Chtb4Pwuq+b5KOeWSVe0qo91llQ9GgMWd3/lAtiq4werclsPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=datalistexpo.com; dmarc=pass action=none
 header.from=datalistexpo.com; dkim=pass header.d=datalistexpo.com; arc=none
Received: from BMXPR01MB2247.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:37::17)
 by MA0PR01MB7362.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Thu, 16 Feb
 2023 04:01:27 +0000
Received: from BMXPR01MB2247.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2122:92d7:7852:4980]) by BMXPR01MB2247.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2122:92d7:7852:4980%5]) with mapi id 15.20.6134.006; Thu, 16 Feb 2023
 04:01:27 +0000
From: Jacques Mitchel <Jacques.Mitchel@datalistexpo.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: International Dental Show & Expo_2023 Attendees Contacts List
Thread-Topic: International Dental Show & Expo_2023 Attendees Contacts List
Thread-Index: AdlBu1ZFGnroa01CSdqGukN+/w/J2A==
Date: Thu, 16 Feb 2023 04:01:27 +0000
Message-ID:
 <BMXPR01MB22471CA02C246E0E4472D9E383A09@BMXPR01MB2247.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=datalistexpo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BMXPR01MB2247:EE_|MA0PR01MB7362:EE_
x-ms-office365-filtering-correlation-id: cdcf6bb0-1aca-48aa-e1f6-08db0fd27a88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fGb6fKgs4ApkQmUIpsrjALUv6Z22+OyTPO4c5YC25dLtcHSeOuoJPXF5PZyDnTsq3qzr4Mb78pEOVsnWed+N2hsnZ5rX/Xp/kf9wOMOOAdvjk4RCLsVuQmp67iSBITlKvMKhe+Q9tvFG5EOSucwhO9qfeoSG1VWf8g7QW4cx7lVK5BWBcFwO+5jNVFeXFc+O3I3CfY1faifhmftINkp08AU/RqzC59bq1KmCYeyfdnsg/z2qRsjKQBx5EE9LAXX0laPu9pnVtvBIWg/0uptW9VhLv5irP+h59MmU04SYwX6qXm0KSy6XnS7gX40VBia9ftxv3hiQoygWb/nQ1adqyJMIc9X8ayVfITcfDnfchQn7xaq9Igl/RKl/1F9g55ACTAwhpYlYE1eixYzB65mDGxCBVtANAtAUUF9qLkdu9DJtdyKCN2/HuxYJ3x5zHiFGav/OXOVyuYWU9Aji2eDTrOt/HlayMA46jsMH1ULK5ZYu4hZuQ7Lei24stmxraaXu0971aNU6goK1+6iUVUJv36/zgTGIIafHYPPVSI1JbpgikHJ/0AhEsyeLNXQ/8adVJ8UG1BZkItnJ3Lf2iLLdqeCbIskaELUAVltRiAvKLd6/d2zQ8rWPig+M7UD15TPkwleS0BAf0GDtY+CRyyZbiFSAcPbon9ii7+5SzGSonL/LSJJrejWPCpYwtWTWvKPE/H+raoWkjVzhXs+iR4MbhsiKhVr2jB1IUQq5d02XMnWYVUdIJTp9Svri8PfnFRH/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2247.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(39850400004)(366004)(376002)(136003)(451199018)(4744005)(5660300002)(2906002)(66899018)(8936002)(9326002)(52536014)(41300700001)(66946007)(66446008)(76116006)(8676002)(6916009)(66476007)(64756008)(66556008)(186003)(71200400001)(9686003)(6506007)(478600001)(33656002)(7696005)(38100700002)(38070700005)(86362001)(55016003)(316002)(122000001)(26710200004)(130980200001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GSPP8xykqpp/5D7C8ITVUZ6rfRVixHalnxWfndZ/vBMZWwcd4VY7JSn2n/w2?=
 =?us-ascii?Q?ZZj36sXYNWBxFHSdNr+k1coYI7KCth09PVVFyobCcow3Rhh1NrbTvcipCxiX?=
 =?us-ascii?Q?7nQHbn6yfT7e/aa8Ahi+fdbzj5VDTQR5/64j2Gt2Cs5+w0T+f5vtWnn/XFUq?=
 =?us-ascii?Q?3jczqiWr5kc51MuLGIInMBWjj6MTk2NjSWkO4FW/i2xAAGxRdrGCGTFcPKKz?=
 =?us-ascii?Q?09e8wT7CgExmHImskKb8bW+XrH4yhGeFaZYnX+TgWOh4hFmNS2hKQcBYLjHf?=
 =?us-ascii?Q?aXoLm7DgcVGxGXjwbMBfILZ3qw+AY7cV9ziq8EbhaQV0qkpqFF6zyw8YieBl?=
 =?us-ascii?Q?c9Ldgbons3wXKtxmGGv1+4syIfpsNFSTw8yySctHdemZ3dnor5mK8svMMxld?=
 =?us-ascii?Q?MS8WJ7HQYiK9FBEN1yrHFTqC2gO2Mn0d8ZLxm0bws1YGim6i3UaOABdkrdCQ?=
 =?us-ascii?Q?xiU8haOSQmYHFGxM32ww5PPQQOVO9qNLLiT3E+Ke3O5138ae8QTAPXFSsRuf?=
 =?us-ascii?Q?cjOVIhXJH7N6zr8Qgx3YAsxcLBynOBv49gAJ327Rj5NU0Qv3kuTRxD8eMjot?=
 =?us-ascii?Q?q0IlAxireo0jGCAoinOwsc/Tt0uZ0pGKtnNthJpXw2SOMKAZJpKrI0BJdwvt?=
 =?us-ascii?Q?gVQwrfSbJW2ZqDhLRo1d6p1inlDM32zdJyjdySjWWfBWQyCae6/nuMIRhVHS?=
 =?us-ascii?Q?hFTxNLV4MFte82ywNAGxoc0iZMfbmgOtU/IEOVnjPt5OxS1nErql1AWHm7Lk?=
 =?us-ascii?Q?709FFMxxD79wZ1DsZOW50bd+yg8QUPP+3dBkbOnItgR8oy/q3i4pz3gT0Ame?=
 =?us-ascii?Q?iMLYtsOl/Fs2eiEx8Nspv4UZmZqKrAL9IHf/m/4iAxc6rHihSxMU+hwy60lH?=
 =?us-ascii?Q?dkvw1NmM2rqqpLIexw4qCoGrdY10tDpXwsOe/CVFkeGqkZs3MdUVwpZfS9Z5?=
 =?us-ascii?Q?7ItgnA+2v7+8psVePKUA1NgRnnE02Nn3biryw+N6sb0oXb+MhPnFPftXbhbt?=
 =?us-ascii?Q?T1FkaoR2f/EVuvT9c7r/kzzi90nwg17KG/3N9OJrYcaTCHsOQlHSKxSrDhkS?=
 =?us-ascii?Q?YUDuBsvHogqERQ1qDcqSu0seiUk4nNLLxYnZGzcfUhdsXYdV2XlA/y7EZqnd?=
 =?us-ascii?Q?Oti14uxAuu4z398FLho/A3Wv1PMa6I45tz7iUR4QbKw4BbJuRpD6uqKSvjSx?=
 =?us-ascii?Q?bpEvVSpiE8sxSvAAcyQp7HCv2+kKv3WPyiP3u+bZHN25q30gRIklt1CvNqK4?=
 =?us-ascii?Q?5PDUHVDVNRyYBjJFGjHe4gVE7zNDcDPBcJvTHlC62AwI1ZSwhGHnDZdGDOWu?=
 =?us-ascii?Q?JsDTUZ+aE5iyXLWxTPgRo4W/XlLrWylcb4+Gql+DmdmD/9v9WAcKqfzazmz/?=
 =?us-ascii?Q?WUuBbXV3E8SJx3VXIBdwxWHD7WUvanLf+YN6vGPlB+IRkyF7xVHUjnvXBmXY?=
 =?us-ascii?Q?9fRKk0ldo7dQ3ko8JeSz9RHHS2DHr4/kFCvW7N5FZ1KRmIlNnq7n+XuLnt/v?=
 =?us-ascii?Q?5LzoUPQFehkod4k+36CKmL/Ly9JkR/6dtAzxu90+Pc1RnihFKIywCdBGvRd9?=
 =?us-ascii?Q?RGyz/+zwBLLepDfaoUMSXEMT/61dAMpW4MjdpwqZwmeI8rQDKRGphN5x3tjA?=
 =?us-ascii?Q?lGUf96c2sxQNypnc/CfJ6OVxLqreHeZTpCtv47h7zS6Z7O0g4JgqnFh8nUxS?=
 =?us-ascii?Q?4qDlMQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB22471CA02C246E0E4472D9E383A09BMXPR01MB2247INDP_"
MIME-Version: 1.0
X-OriginatorOrg: datalistexpo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2247.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcf6bb0-1aca-48aa-e1f6-08db0fd27a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 04:01:27.6240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7c0e2bfa-510d-44ee-9688-8b7cfba4844e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhqiEreqh3Uql0BgnbKfzdBt3zi2/jo8KeKW8nNIfxyPr0ci8Zisq5qIQmbPkznQP2kg6RnTV64suFJjKBTAjqsAs7bY8CsYqLWpz2nyRXoOUYSaHeODEDs9lerNtsNe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7362

--_000_BMXPR01MB22471CA02C246E0E4472D9E383A09BMXPR01MB2247INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Hope you are doing well.

We are just following up to if you would be interested in acquiring the Att=
endees/Visitors list of

International Dental Show

Koelnmesse GmbH, Cologne, Germany

14 - 18 Mar 2023

Visitors =3D 32556

Our company provides the following details regarding your attendees: Client=
 Name, Title, Email address, Phone number, Website, Zip code & Cities.

If you are interested in the attendees list, let us know your thoughts so w=
e will send you the discounted cost and additional information.

Jacques

--_000_BMXPR01MB22471CA02C246E0E4472D9E383A09BMXPR01MB2247INDP_
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
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hope you are doing well.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are just following up to if you would be interest=
ed in acquiring the Attendees/Visitors list of<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;background:yellow=
;mso-highlight:yellow">International Dental Show<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;background:yellow=
;mso-highlight:yellow"><o:p>&nbsp;</o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;background:yellow=
;mso-highlight:yellow">Koelnmesse GmbH, Cologne, Germany<o:p></o:p></span><=
/b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;background:yellow=
;mso-highlight:yellow"><o:p>&nbsp;</o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;background:yellow=
;mso-highlight:yellow">14 - 18 Mar 2023<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;background:yellow=
;mso-highlight:yellow"><o:p>&nbsp;</o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt;background:yellow=
;mso-highlight:yellow">Visitors =3D 32556</span></b><b><span style=3D"font-=
size:12.0pt"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Our company provides the following details regarding=
 your attendees:
<b>Client Name, Title, Email address, Phone number, Website, Zip code &amp;=
 Cities</b>.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If you are interested in the attendees list, let us =
know your thoughts so we will send you the discounted cost and additional i=
nformation.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Jacques<o:p></o:p></p>
</div>
</body>
</html>

--_000_BMXPR01MB22471CA02C246E0E4472D9E383A09BMXPR01MB2247INDP_--
