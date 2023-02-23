Return-Path: <SRS0=Dg+q=6T=outlook.com=ijaaskelainen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61C8C61DA4
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Feb 2023 07:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91A71C433A0; Thu, 23 Feb 2023 07:38:40 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03olkn2041.outbound.protection.outlook.com [40.92.58.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D35A1C433EF
	for <linux-firmware@kernel.org>; Thu, 23 Feb 2023 07:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D35A1C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwBQwWT+zq32XoYC9QBopSsLQrXTrO3lVsoPUz9Y3hZtMzvmbX9vSG+vdIuQxihjkxXYfoDEUHtOGjBiYHq4LrgUR/gLDvRq0iWgfEnP+wY7KTGEBb2A+3Ka1ovGKsEFepjy6dhUdZvzPtONUTYyw9O3YZZ6FnyG/Uvq25FV5Fl3RG1Rh2lV6vekJlSpjowBR1NF/duLwvB/Lx4qYafiTI+n/pcluALFO+50N/lwjvpbWSVnIGSN6cOWd0sm3XlCcMq/xef1WWR1RZeW9GzNmwAxHKuBAE9+6HtrCjI18D5buk+ENjhcAf/s/kvHKtubanWvOpuAPV0n3PHA55OpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=io6LEX24DFsCOVTIpxC0/F9rN7Cedk0an532GlKxw8Y=;
 b=e+i/llzK37nGm3x7HvW2v2A7PEslgG4IMALGycgYNvqNuRWLBp9xIpDRBVHA1yqR4q02e02IixG59x0YcT24O8gA3aFY473dtZ1AOXxlR6HGHaQ6Gh6jFPhIjzVmHCGFe08n6q7RNSWLyYgzzyyglBbC+v91DKiEBv29yCISaNpJntYTJHjUdCka3fvdFrKuQT8zm+zBSsa78NNpTfnb1oq0weSHedr0N4EwF7TTV2M+z2AhMSwZroBwMTP3gfpBD/NmaaL0LuRdMVdLWdF905REPLbT5DcItRxvcdlSdE3pS/wjQbAxPRsfhJX8AYIn7c8/0PTamHOiPk4gCt5iKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=io6LEX24DFsCOVTIpxC0/F9rN7Cedk0an532GlKxw8Y=;
 b=YgCUWVCNgkkphVt9ETbaxvRuVfY/cE3mDRSwWF9RQS2XlXaJRoAYEuafX6YwjMWPSMt99nhl/9c7oiHH8Ve65DY7uJ2pS7ppyOPj9HXwHRUApXx17N062RnQqUXWCJIrCkhwKuq4jpcqOUZFGaG5EL6a3dl46RpTzQoO+G5dR9TDz1UTqYk5bYhtIcXTlFcrZMTfr0j+QgiWMbJ04W1ZjSX9AH0f/r80OZN9KzPPeFhTX8TFZwVi2v50nWET0RMJSmUIfIauBtud/OtDNjqeMnRkAlj2rw/t2tux5ZRXsNSoFva2NJtPayGqcP/IccLw8zRRZDMbNPuf1pWF02yD2A==
Received: from GV1PR10MB6241.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:93::14)
 by PAWPR10MB7895.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:366::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 07:38:36 +0000
Received: from GV1PR10MB6241.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::39f:4238:2ef8:c3b9]) by GV1PR10MB6241.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::39f:4238:2ef8:c3b9%8]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 07:38:36 +0000
From: =?iso-8859-1?Q?Ilari_J=E4=E4skel=E4inen?= <ijaaskelainen@outlook.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Can you add broadcom b43 firmware in linux-firmware.git?
Thread-Topic: Can you add broadcom b43 firmware in linux-firmware.git?
Thread-Index: AQHZR1mPmQI754W36Eqw/aBcaZwg6g==
Date: Thu, 23 Feb 2023 07:38:36 +0000
Message-ID:
 <GV1PR10MB62418A226A00A3D1BAE48A8FA3AB9@GV1PR10MB6241.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [LIRVLGX3zkDg87af11hQGOq0klRTua/5]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR10MB6241:EE_|PAWPR10MB7895:EE_
x-ms-office365-filtering-correlation-id: 114bfd89-39cf-4bb0-75cc-08db1570f931
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /f7AN5ubPX5rrfWjVrtKMExs49LlgVF6JbGBocp3Nwypuj0UMAnfx7qH4YvPme13h/lDs4vU3ggY2uzEiA3nIREoBB2c+co2DuL2bmAQKkwjkIRZ3eIQjzqCh75al5xCqejSxcVA+mjVx0HXSZp2vYgAHLfVmbTcgkAViAyV2NuI0RkLEtx8QD3q0s3QbWxatmxEsThbzgZd6f/Bsa6htzPDY5vLtBvudwCOOIPXR3e2JWwzd1ioix77xlbJi4HviXaaVxTjGZMdZCOZiMWo6UEE+5egyCqpcdZklfUZcRhqQ+nCF6gh65sFAm5lCsebwqSJ8T0L97+c9ujgMzYHK/wz0zVC5n60XZUpszedA5pOG7+1f0qb3JPbD59e05qK6YfJxXFoZ5ENMfg7PUBcTYodHTckFqz1Lhzr1RHdARxsA0Wsr8ocR6bud7jip5kDiABXsOoUrY0gDNjhS2n+AcpUiXUBJ5pXFLFM5GcNDShNuA0Er10pB7l6ONfftwk7IfYJ06E1ZyCHuwm0GmYFLUASP9g410b+YSvA2ZsSeFtqS0IDAb7cojJXqRJQ9VSVg5BK0wYvzoT+0hnzTVC9fIUBjPK/8h3r7GkZb8Y7sBI=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d6DIRBA4+EiDvPEhaH7Msg+pOIjOJkDqF60+Hu2NZh5J7Rb/P7nLOuc8Bs?=
 =?iso-8859-1?Q?W2R0UGELUXJpqijlG7EzZy5G146qBJb0aWYfu3+DgwfvH9Aa/4hgxKpoZZ?=
 =?iso-8859-1?Q?sBrIfM37h3/j2i9VXuhEd/AeFZMBbY81lhEm8+pl0+bq4//jaiAdRSg0sv?=
 =?iso-8859-1?Q?h4P1nC582zwXKEweXugMOoi8EY222CTY5im0RmxXyNofi0ZDzn5Lt0JB34?=
 =?iso-8859-1?Q?Au5M8mHPjEtvurKuT2l7yBGmEyJP7utpizR6zcgPtxAGi8s6eRl2NS4AGL?=
 =?iso-8859-1?Q?3Tp0ww558DnvVkA3ACSZ2JotsBKY89KdWyXxmA1ZQJBfOSmRzIfAvtoD1t?=
 =?iso-8859-1?Q?tmP5dXAHRPGKTSZnSfoa+61tjSJ33w+/rMc9lLa4FqjzBhxQv7Fb1lxEoO?=
 =?iso-8859-1?Q?8b5+av/Ww3/x81qgiq6xgXzCYkMNJq7mL8I8GM2q8+12cAiPWV1UlelAt9?=
 =?iso-8859-1?Q?GLyONJq7/xa2gusz+2EmUF4xP9d0nj+UYe6cMZkahwKhUBz54B8aOXdfHC?=
 =?iso-8859-1?Q?SSckyAR+NMzQD/w9xztX+mUq+bHHgncP6IHujVaDsFfmJtgzF2divIcb3j?=
 =?iso-8859-1?Q?LrBXGLdkhocob4lEgc6EcJjy90NOPr+kniCd8vV4icDrpkPchkDPglPNry?=
 =?iso-8859-1?Q?0AA4lLbJd7FVRYaTEXMTvST3ZBRKpJYAbI2pcYDxnlwfHBAbUC+ZwPXmlY?=
 =?iso-8859-1?Q?OKUXBhEzpOsONRJ16CyOORAuEH/iEmQdYHHNxWvTj8lGo6jlXY+5SACjTK?=
 =?iso-8859-1?Q?YSN7W0Liz1W99vcL/eF6RHwrvpDEhSQ3GAzSfuhGVjBU+5uUOgPlS6UW8h?=
 =?iso-8859-1?Q?hrzp6MicvdhMA93EdzizYW3O63rXKaE3NqmMSmxkkz5u5R2xmx9iCz9JFu?=
 =?iso-8859-1?Q?aEOEtuH+WFBdJBW9F65lummFmRZeDpso/uQvoF0xKrTAlOeMGrNy+B+3I8?=
 =?iso-8859-1?Q?MPEphwjzx8J6x8ts3vihCFk9x3cVQ5nPXqHWNlauwdM48+sObHDKgdF9jy?=
 =?iso-8859-1?Q?/5/Ux3Xxxm4fJjUHNwpxuKgOtFB9FU1LDJvtC0wamdhPtb5p35HcJPD1qP?=
 =?iso-8859-1?Q?3uye+7s1RFPZQiB/mI/WiVflw3CvrmpXIdFLMsqBHPcHydami6sKDp1vg0?=
 =?iso-8859-1?Q?kd228rd0iQ68oHPpfwCZEAEtkAOcs1r3QFQJQcU0v9NA8B7RAfY3fxCK9t?=
 =?iso-8859-1?Q?adBJYO0Ri32+M0c/2AiXC4x42e0x7RV4lIM0Vhgrq0S0mBQ/9Uc6QVGCXt?=
 =?iso-8859-1?Q?t3reBz9kaimREktg9qdfOSwPwhenaMyr8ZpdUn2pGUmiM7I6yCo2p71VhC?=
 =?iso-8859-1?Q?oyAiTrdliIqnDhMbed3BGvooKPqsWOb0FdUgc/e9neLURpw=3D?=
Content-Type: multipart/alternative;
	boundary="_000_GV1PR10MB62418A226A00A3D1BAE48A8FA3AB9GV1PR10MB6241EURP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR10MB6241.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 114bfd89-39cf-4bb0-75cc-08db1570f931
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 07:38:36.4033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7895

--_000_GV1PR10MB62418A226A00A3D1BAE48A8FA3AB9GV1PR10MB6241EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Can you add broadcom b43 firmware in linux-firmware.git?

--_000_GV1PR10MB62418A226A00A3D1BAE48A8FA3AB9GV1PR10MB6241EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"FI" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:break-=
word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Can you add broadcom b43 firmware in linux-firmware.=
git?</p>
</div>
</body>
</html>

--_000_GV1PR10MB62418A226A00A3D1BAE48A8FA3AB9GV1PR10MB6241EURP_--
