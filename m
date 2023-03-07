Return-Path: <SRS0=Nx3F=67=oceanedigitaldata.com=victoria.duncan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF99DC6FD1A
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 17:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B470C4339B; Tue,  7 Mar 2023 17:02:29 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01hn2213.outbound.protection.outlook.com [52.100.219.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7B42C433A7
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 17:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7B42C433A7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=oceanedigitaldata.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oceanedigitaldata.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/CpG5jNWQjxCO/2vj3x8+09yoRa8Z8UJWbQ6Y12P8fFbVR1d5I5Zg4yRHgKwTz3ZC6QMycz+Us+N/6bLjQSCL4DJjOvhL5cFiUXLI1hyVAKpcodMVUNOYmn+6hz4PI2L/15rCtr8wvxBR28j6uh5S3HESN0ibBdHjGJnACxzj+efLDl3cTImPRe10TY5mD2kftJHXCZCiXPkqJP1zJXfIF2G95xGHN9riipBqgqyZbhb3LUMy7tkjqwN2efgKj4WuutQYklThNCbkuvGdXEtIxiLSpGFsONniGZ8OR3K7n2AcezMnGzZoW9oOREWngQrhGDoN5aXg1hwA/vIFnxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOa7CKVNSg+lV3eJnIv9pn6I47DWvaLZbGS/TtKUL7I=;
 b=QLOAPvzg1Oqc1VeWKUsKMmcXQzo8Z5mvGR5PJSwvNulFHhXZlGDfqQWlq/ntfgw4lENoNHouMj5k9Vfu1Q0TyaE9nKKh7mwWVorq35OSm+QIFp8b0Mqz2su5UK+XWG/QxplzYTB0kcE8K+mSu0UMR7SweexqpgYcPBXOLx6tslGxxYJc3+3gZsoi4LvHaW4EnUeuMS7HYYK0ojjofuafQnVEPGAB3aJS9i/CinQSTpJ1a1dXnGdD1+8bayhxmWSgk7bopEu3v3ejb2eIhR21KepGdjw+WnhDe5WxpRTrpBgF3WV7VVoFqAwVsqGahNyNxbfJBpbLspNiiS5WkEAJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oceanedigitaldata.com; dmarc=pass action=none
 header.from=oceanedigitaldata.com; dkim=pass header.d=oceanedigitaldata.com;
 arc=none
Received: from MAZP287MB0406.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d5::16)
 by PN0P287MB0742.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:10a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Tue, 7 Mar
 2023 17:02:24 +0000
Received: from MAZP287MB0406.INDP287.PROD.OUTLOOK.COM
 ([fe80::a0fc:906d:2f59:8f17]) by MAZP287MB0406.INDP287.PROD.OUTLOOK.COM
 ([fe80::a0fc:906d:2f59:8f17%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 17:02:24 +0000
From: Victoria Duncan <victoria.duncan@oceanedigitaldata.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: =?iso-8859-1?Q?Attendees_List_-_IDS=A02023_?=
Thread-Topic: =?iso-8859-1?Q?Attendees_List_-_IDS=A02023_?=
Thread-Index: AdlRFocUiOHnXDQMTGyi51mkcOFwBQ==
Date: Tue, 7 Mar 2023 17:01:57 +0000
Message-ID:
 <MAZP287MB04069A232AAA800F721FC29FFCB79@MAZP287MB0406.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oceanedigitaldata.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZP287MB0406:EE_|PN0P287MB0742:EE_
x-ms-office365-filtering-correlation-id: 93cd9c17-86e2-4353-b793-08db1f2db927
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tfmHIqh/+F7qhkWJF1EDf22Li63UuKpN1CjcH8yvpQoDw0zigsrl4M8XbV?=
 =?iso-8859-1?Q?MCl+RJjLhNwYGqrY+AuPF0yJzexB2nL1KRL5ehXZ2UtNzfXewIxVjqXOwn?=
 =?iso-8859-1?Q?gkuI/xgBbIuDBBj3wxnXz6Lu/TBuB8zvh2dkGof1CwATdzulAKbozytVtr?=
 =?iso-8859-1?Q?oRNY8YjQEofR/2qY/cdWQgjZp5cNzN8LZ4OzoP7WO3aIk0uzkym6cTons6?=
 =?iso-8859-1?Q?HyInJHYjIxt89/FzOeZ0kqSNV9hvsutIGSwlwsKR1qaTqDp5yiZiIje5VA?=
 =?iso-8859-1?Q?sYYJuE4oUECzpxLZdQYFclssI+7YDo8Vi5k6PGBqJh1FPda9wgffeKhKwY?=
 =?iso-8859-1?Q?N6t+5FpxzO1o7wsflRk+1cfaHqVlyDREd5vIQuw5OvSDlhXFT42yuZFT06?=
 =?iso-8859-1?Q?k8Xef7+o8/x0UqDrLFquQcY5LnzaKWGdfemms2MIR2TB5D6IG3ZtQhm1K9?=
 =?iso-8859-1?Q?0pioqxxfgigiSM06/yzBFrcKEIHbrbGDum6eZ46d3McfJ2uDlshHvHQMBz?=
 =?iso-8859-1?Q?JVUP0Yri2fFwR/nKxcQzQf9MKf53qHJ7vsZvPxMefP1S8uY6ULtd32zgd9?=
 =?iso-8859-1?Q?USHHtvNi+JyVvCAMy1CP0y/KCvlVFJUCz9gI939Kj4VXKU32y9fa2cUtgi?=
 =?iso-8859-1?Q?QsGp4zg69gQM2ZVOqCOQsamZgQc55USJwTzkF8Xb+4QonKrTJMcZT9tNFf?=
 =?iso-8859-1?Q?AtV3DFe6nyjM8nrsb9L4UVtQEgsihaQlkthJo/jNjUOTwlepJvroawuYWK?=
 =?iso-8859-1?Q?cNxEx2SDvr5QKoDUBsJ74hdk0QAzvPjT0H+U6qBtV6YD3J3YSATLQHUR08?=
 =?iso-8859-1?Q?9THGHbsFVWgemjgUwftUnkGANCrHm22dbzwGRKYKvCSohpbcF9VIRAKMr1?=
 =?iso-8859-1?Q?fP3sOMPNqx/21cVPJQPEQkcXfhypuyB+8+GjO/18EFg+o2cbxqYm7yJavZ?=
 =?iso-8859-1?Q?sbCSpXFOnrvxiB7K541gLXfgpb1TZh/3XDyJjhtWwokP/D4tzlgPnsArUu?=
 =?iso-8859-1?Q?fI8HaY55+H3tvIJsE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:MAZP287MB0406.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:OSPM;SFS:(13230025)(366004)(396003)(346002)(136003)(34096005)(39850400004)(376002)(448600002)(451199018)(38070700005)(41300700001)(5660300002)(44832011)(52536014)(8936002)(2906002)(38100700002)(76116006)(66556008)(66946007)(6666004)(64756008)(66476007)(6916009)(66446008)(122000001)(4744005)(71200400001)(586005)(7696005)(33656002)(83380400001)(38610400001)(86362001)(55016003)(26005)(9686003)(186003)(4743002)(6506007)(131650200001);DIR:OUT;SFP:1501;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fzvtm+bjrnbFbaI9wBWYH1yslYpP5SywuXnvcHNF8+4SdrF18BzoKLNgvx?=
 =?iso-8859-1?Q?1foJpj0/M4egVUEZ3l+rZOCQ2syyOZhTnlDD0W8zQJj17U0wfpdrCxvIu6?=
 =?iso-8859-1?Q?L9dkjf4G/cOK5U2WMAtvCS6MP1u0Hhy6nVWX6FMmZJFa/5HicXLrPtjRSB?=
 =?iso-8859-1?Q?0xUPJYnAJrHmHAShTG2Qx6ni01pyCyQsCVgU8aP2WvKWYGJptn5cVk6QjQ?=
 =?iso-8859-1?Q?8HcjYnMZlutXjpoP8PoFXHjG5B3JMSdNgEhrAkIgOfytJqIqLlikcjUcT8?=
 =?iso-8859-1?Q?9pLkhqbuHNvhu9i4eU6giG+i4G+P9/4Em3CV1wrMLcYmSabtIBOrtBL9Mh?=
 =?iso-8859-1?Q?jsZHR1LUOkk+NBuPmuhxE7beeAvIxuijWAGWnwXH8a+Dbf1HzoPCkxg4fj?=
 =?iso-8859-1?Q?Id6cHQWSPyRlGZ0beldjPwRp5JmUu36nGyj6qnV0f+ezTbQqlGZTJHVBiF?=
 =?iso-8859-1?Q?V1zGQI43eh1QRiWnBq3ASZXFmrADASFhmK3cj0Nfqn9p5kjF0KZtHBdfWm?=
 =?iso-8859-1?Q?ftYUJYN6TzAOACetUYolbAT4/VfO1vKbtGaW9AjSaeg4fJoDTLM0Fv60O3?=
 =?iso-8859-1?Q?KxUfd7UOO6rDcC7n47Zis7HjYhHhcD031rINRtfZT23+ZkW3tkPGZQlAMK?=
 =?iso-8859-1?Q?Mi9pz1T38EhDn6FgLARNPQxEm35h8v15HwK1QBcR278Jv3NB3S8a4QdYqk?=
 =?iso-8859-1?Q?1hhiy9hn+juvwJC5R+7Cbq5+1xf2e6yIemq1OxkVz1eklrjO8If4cclHOm?=
 =?iso-8859-1?Q?iqwsXU8+Wxn8uTcDnCjXgaEmjhKTewNwOjsobYszw8uLAi3yK009IB1RX+?=
 =?iso-8859-1?Q?67Zb8klNG+ZqmkzknyB6EUSc8ZjLcJIVKpTtUO1YAxwxSSn6+4sMjQsFso?=
 =?iso-8859-1?Q?vQ4+temaLN1SHGOhPF1/DKnErNtZrwdzAdg+YPX0d7OoCHAdAQhlbxKHef?=
 =?iso-8859-1?Q?bmEO4gghBI3UsJZwB/h/i6T10J7tV5m2LPVY3YJqgTv2bumpfJYcAzzYmj?=
 =?iso-8859-1?Q?0BlE1GnN4I8cW2IzEklR7hGeTKakcobZ0UoDseHX5ApgSt/IuiP/kadHo1?=
 =?iso-8859-1?Q?lenJgBG6IBv0aieb2pcQIhkLlVsehVt1qt0MXfNuQB0om8plEJ6r9x0/DF?=
 =?iso-8859-1?Q?UhBc8o3o1Q96WYEbTmijZqS2zzw7sj74i9Z3sXa0bseuDHz41rl38nxd3w?=
 =?iso-8859-1?Q?aGZIfYqsOMBJkORIfKAyHOnBv66euClClYGNAt4kk8KUWOygSfHEqErIK4?=
 =?iso-8859-1?Q?DUvtmWMUsoEbd1mqiWPeAkF9nE8L7lW/mhRUGsYgS9lUBa4b3GuE+Fc7OK?=
 =?iso-8859-1?Q?+MWY0XYbqlyb8k0lO7zYvtw4hy2TLi4A509+o2uxofz7AxCn+n+4+YH/l3?=
 =?iso-8859-1?Q?lwEdhqQuwa/xkG2FVMYAr5GHfU7kLGeJ3ckoT+eNx0/4gJ8dtb8rkRf1v6?=
 =?iso-8859-1?Q?qXsr1iJhsUuKwQt/jGfvczqMjP29YUjGT4SrQF7bupfIqbuz2w+EQARD+t?=
 =?iso-8859-1?Q?Y96eQ/LVWBv3o+QvS0ijVLaCenpuu6AmV7BLNbUMVrkAWI7s8dxf3TvbYA?=
 =?iso-8859-1?Q?3949AD5/m5f8bV/hSBG7lsO/yxTrn4oHs1HbLVjC0EPGz8Km39Hf2YGOCx?=
 =?iso-8859-1?Q?9f4Q6p0WhUA6xm1I5jYphgTukO/QmIK+pvttLuV5kjqtnBUjVLs7BWVHvL?=
 =?iso-8859-1?Q?B/O/0HAlx0lwlF98vw4=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAZP287MB04069A232AAA800F721FC29FFCB79MAZP287MB0406INDP_"
MIME-Version: 1.0
X-OriginatorOrg: oceanedigitaldata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZP287MB0406.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cd9c17-86e2-4353-b793-08db1f2db927
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 17:01:57.7027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c39565e3-c296-42a5-9ff8-51ed60581af8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVMLCZ7x+afhqHOGiJhTC24+Nxg781I0F6VGGWIVgnX2s+KSEUaKEO/0tizGi3KR6ETp/+TDZmwh9irr3n2DGwfJD9UzJyt3oss34sm3fWseFLJV83u3moFE2A1SumOB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0742

--_000_MAZP287MB04069A232AAA800F721FC29FFCB79MAZP287MB0406INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I hope you are the right person to discuss about "IDS 2023?"
Our data consists of: First Name, Last Name, Company Name, Web Address, Job=
 Title, Phone Number, Address, SIC Code and Most Importantly verified email=
 address.
Number of Contacts: - 59,450
Cost: - $390
List will be provided for unlimited usage.
Interested? Email me back, I'd love to provide more information on the list=
. Good luck with your booth at this year.
Thank you.
Regards,
Victoria Duncan
Marketing Executive.
If you do not wish to receive future emails from us, please reply as "Leave=
 out.


--_000_MAZP287MB04069A232AAA800F721FC29FFCB79MAZP287MB0406INDP_
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
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:105%;
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
<p class=3D"MsoNormal"><a name=3D"_Hlk126695658"><span lang=3D"EN-US" style=
=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Arial&quot;,sans-se=
rif">Hi,<o:p></o:p></span></a></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif">I hope you are the right person to discuss about
<b><span style=3D"color:#C45911">&#8220;IDS&nbsp;2023?&#8221;</span></b></s=
pan></span><span style=3D"mso-bookmark:_Hlk126695658"><span lang=3D"EN-US">
</span></span><span style=3D"mso-bookmark:_Hlk126695658"><span lang=3D"EN-U=
S" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Arial&quot;=
,sans-serif;color:#C45911"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#17365D;background:yellow">Our data consists of:=
 First Name, Last Name, Company Name, Web Address,
 Job Title, Phone Number, Address, SIC Code and Most Importantly verified e=
mail address.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#833C0B">Number of Contacts: - 59,450
<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#833C0B">Cost: - $390<o:p></o:p></span></span></=
p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif">List will be provided for unlimited usage.<o:p></o:p>=
</span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif">Interested? Email me back, I&#8217;d love to provide =
more information on the list. Good luck with your booth
 at this year.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif">Thank you.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif">Regards,<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><a name=
=3D"_Hlk129120427"><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-h=
eight:105%;font-family:&quot;Arial&quot;,sans-serif;color:#C45911">Victoria=
 Duncan<o:p></o:p></span></b></a></span></p>
<span style=3D"mso-bookmark:_Hlk129120427"></span>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif">Marketing Executive.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk126695658"><span lan=
g=3D"EN-US" style=3D"font-size:10.0pt;line-height:105%;font-family:&quot;Ar=
ial&quot;,sans-serif;color:#F2F2F2">If you do not wish to receive future em=
ails from us, please reply as &#8220;Leave out.</span></span><span style=3D=
"mso-bookmark:_Hlk126695658"><span lang=3D"EN-US" style=3D"font-size:10.0pt=
;line-height:105%;color:#F2F2F2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span lang=3D"EN-US" style=3D"font-size:10.0pt;line-height:10=
5%;color:#F2F2F2"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_MAZP287MB04069A232AAA800F721FC29FFCB79MAZP287MB0406INDP_--
