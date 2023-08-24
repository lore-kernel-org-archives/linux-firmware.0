Return-Path: <SRS0=9Ka1=EJ=techshow-visitors.org=skylar.butler@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4E4C27C40
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Aug 2023 01:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3BD4C433C9; Thu, 24 Aug 2023 01:23:19 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2081.outbound.protection.outlook.com [40.107.222.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24E85C433C7
	for <linux-firmware@kernel.org>; Thu, 24 Aug 2023 01:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24E85C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=techshow-visitors.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=techshow-visitors.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbhkR10xsLEqZbrcNYqbUtixsFe+9Tc1gnq38NnGKWs3GaibCsIbKN889eTNS2myiu8TJicE5xMT/FHOPitg4Xt3lxRAMdNBNgs4NPG3HaKqS0AVI96nK8a5wmBaxqCcuOTaJlzBhOgybZY9iQt+/XIMlWa+jsMMXCYnsPZXDZDI8EgQ+AdM7zUDTVcn4CAJ+V36z4MSmB6mAUXUCu3gkEaaJLfhdvmkKt8t9VDK020IaoYDsgCMuK1fWkJhyLV/BzubDwjRTn3dBw3aMYvWAcwmSx8H+nVdz8kzqULARk14oU9/nDkjpcygas+sWgLraR3VU/aGSaAjaeye9gSXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxJk7VkdeE9nxseErDa1SieVo/RqDhC0wC3jU9MR2KM=;
 b=aCd2T8Kz+q/oxul4H/aFh/tJ3mck2nc1BpEGn3oKOyz8/NOzlub7WloxHZ5Duuh7puWq9IUv0R3yDePLhgQAoP4g7VmrandxkLbO1zxhn0TUj5hkfKtmvW1gESbCIhFndWlnHd7o1lKK2UJCrb97glBCo6321YpZONk18QBPLdR67YPtcZN5xaFfnh27bQYe/N7W5vwYYsZvr35pZ1urjZ6AuS9zkBL6T32s5EhsDo6qs+hLhZnqIyX5X12A1JdYEKZJ1h2fwpo5V4EZ/TZr7WoNipl3Rl2v6rkhI0XbdKeUJWX66Ya2kDPg3qyZZGTtpsufAfhpzrE6GvyY5QMc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=techshow-visitors.org; dmarc=pass action=none
 header.from=techshow-visitors.org; dkim=pass header.d=techshow-visitors.org;
 arc=none
Received: from PN3P287MB0083.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d0::6) by
 PN3P287MB2267.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d3::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.26; Thu, 24 Aug 2023 01:23:14 +0000
Received: from PN3P287MB0083.INDP287.PROD.OUTLOOK.COM
 ([fe80::2afd:b610:ccf0:8788]) by PN3P287MB0083.INDP287.PROD.OUTLOOK.COM
 ([fe80::2afd:b610:ccf0:8788%3]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 01:23:14 +0000
From: Skylar Butler <skylar.butler@techshow-visitors.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Fastener Fair Mexico 2023 <linux-firmware@kernel.org>
Subject: Kernel - Fastener Fair Mexico 2023
Thread-Topic: Kernel - Fastener Fair Mexico 2023
Thread-Index: AdnWKSmVqaFuDEVPSqiaJYP+HQFvzw==
Date: Thu, 24 Aug 2023 01:23:14 +0000
Message-ID:
 <PN3P287MB0083ABF904D70A176FF571BAAD1DA@PN3P287MB0083.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=techshow-visitors.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB0083:EE_|PN3P287MB2267:EE_
x-ms-office365-filtering-correlation-id: ca2a3268-6fbf-4cd5-422a-08dba440b067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4pr44+6g0cnjenCNeLLMgsSWMWNp7dE71x+9mVDf4AqevDw1kec/JxTJZoypY9Tq8COX7aTm+o7kaERo8c6pqxkUZiWP44T6jctw1cz5jXFJGmMCrdT0hreMHJV01YpOEXCrIgY0Olci18VniAPUu+NTyncl5wu9rNSYUWh+yH22bF3eAZ5Im+IrHwgPoXS289IvTmu3p+a9zi9IBxGnHjfw9ExnqKXOiJPaz7aIsQMMCzEbB63qAP9URXXzWlkXXIcIncovdPUnl20A0v3zLrF87GbpZ7JYHLujJGkp/uRE3YL93/n3uQKN4TDel/SpORsWQ9UMCz/NmT583Zukh00q6kMkZye0kaiBCa6eylb+maMgFHwdm7hCY0vpisdroh1nOtiFuAEtPnxE+ho9HLUzAF6J3t9PzDnfOIWEgbeCLkYRK1O3hVCJnUPSGbTK/Xyu113AmXJctpgXX5rQDG2sgKrFSavUPvwi6HICqYYIhyjWhn5SskYVPJ+4oeg9vdqx4X5Gy+cSlYk9adtlwIRGld1v2StxpO9rxrXXdXRBRzw1+JR+Znb4nYVHwduKlBA/UJT570FLPqLxxAUmdnqhjsJgQ0tMT/w/Toi+iSI5YAar6Sk1NXWTdDcEWi+m
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB0083.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39850400004)(396003)(1800799009)(451199024)(186009)(38100700002)(38070700005)(64756008)(66446008)(122000001)(76116006)(66556008)(66476007)(66946007)(55016003)(9686003)(33656002)(478600001)(6506007)(7696005)(71200400001)(86362001)(26005)(8936002)(8676002)(9326002)(52536014)(5660300002)(44832011)(4744005)(41300700001)(2906002)(83380400001)(316002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UaKKpb+v59a04ZX+fFnxgyel6hm/9KR5nr5CB0E5/CeDqCf+Ac0lP4Mjdwv1?=
 =?us-ascii?Q?MxA6CkoN75kSzvC9P8OhvRnt/e7KRghlPNd9FYmDb66quPxqEkeI/zY3wfxK?=
 =?us-ascii?Q?oa0f5cp1mIScb2DXcb+6GbDh/DiAhhtR5HQH9ch9weWNs1dwrI6mUQd9vhWd?=
 =?us-ascii?Q?xOfaub/kaJ3nT2r8hdQMqcR3xW5FrcDLLY7WuLx6+TBmgEKUqk2y9E7GJyE1?=
 =?us-ascii?Q?DMVeMWYZkeg23UVGj6Ie7rtg4NLsoPt4uKdJgcfRpqNcm742Q0bCmB5xkYWa?=
 =?us-ascii?Q?ukT9YPi4etfkXH0fI52gHTj9dma0ce6v2BvzPQtdtcf9emUbFQRagj73WK5c?=
 =?us-ascii?Q?QYZf0aEKnoJKjk8gfFSvHhctoYVugczA08MXSL6R/36p70Qa3LEogK9gRO1V?=
 =?us-ascii?Q?2WkNRoCYkLee/9CKso2HlPRNy7ldSi/2WoXrj7uATgP/vC9/6KR8RamSw++2?=
 =?us-ascii?Q?f5HTQy1A1Ug/jPXzh2a6TIjtbV5OY2xNI2FuZq5rj5zj2N7UhfX/ZYN6VnMt?=
 =?us-ascii?Q?/UzKlEnAxohFQfYApXVJ1u5fya/tz3ksNtQXLUbpgjiKiqI8zboTUJH028dt?=
 =?us-ascii?Q?zQVl4+3DBJrQ6RN68KPG4N/W3XWitIPDm1RxvxLcanfun4GEKrlrbOwcpjSY?=
 =?us-ascii?Q?xKfpAx16l6UnFEDbH38V3SwVYSYQM0j+yEbcWaglLdwZxGI8BFHa7pcg21i3?=
 =?us-ascii?Q?TDB56VrIg2ZqdnUkrt9PlqwYCPz0SPs4V+aGZ4Dhkq44/JrDZygoY0j+VE7s?=
 =?us-ascii?Q?G+JcyiW/qdiz3CUZJ41/F9L684cAfjUJnEAxCC2CWxVC9+KEnIBxT88hZdsg?=
 =?us-ascii?Q?zGNtKdYdryNrK/X/vI65o1UJJ5q/blNeHxFLDMYRz3H+VOI9d670CP/NDaeS?=
 =?us-ascii?Q?gtxwKu1ZubZOiJlVnSNLHp71FqZKWeRD08waagpaSSKE6tryrwOLzhRoZe+f?=
 =?us-ascii?Q?TCDS8Um1720aa7mm79ZW1mUhN1Lgz+PyjMoXDmscZES5DLJ/0zHOziXRv7pO?=
 =?us-ascii?Q?mQ2N/4JP0iaMOzx6XFEsm67zc9LGuuutM8IOO1hcKWrh8Ul3WpoxFfVywP9l?=
 =?us-ascii?Q?hm8+XxZrviPYNJrh9dZvSdJCGTmEWWcxKJQKf+E0yu8bqtSxMqXL/TcAmwLb?=
 =?us-ascii?Q?JQug2TUVqlNtiGm2/vZ24hyL0GfDvXkKYheHgRH0GrU3v+62N4ZEhn2q9rXw?=
 =?us-ascii?Q?Ebvkz1p6e3QE5pgXDZVGRKgkW4b13OL/aoo5T6vLzUHcnHJcHpYrsIAYCJpZ?=
 =?us-ascii?Q?xhw/5PSZb4xT+Nb99nBEnTPaT9lXaACq+F1AgvwDeDxZS1gORCSwQCzhvNwp?=
 =?us-ascii?Q?d9kapMMlagrjo53qgEuQ3yrE7pQHZdgJ0LAx5hsOXEfFgDbtjHmY2QlWNn1j?=
 =?us-ascii?Q?z8abTSekURK4pPQHJNMicwTtP+YipwtJspbComyG4vdzFeNbfl/zMOkD5EZt?=
 =?us-ascii?Q?giugy77tFsNWzM+VmDC6+HsAiMi2yw+l9ChBMvD1BdmjOJkoQ7rvqiBu6pQa?=
 =?us-ascii?Q?CJAuPTiRK0O/k47ltyS+zBgtNZT/VEtO2zN0JtuO9/hP533XpaASRqnX/I48?=
 =?us-ascii?Q?PIT0CM2pSoakMOYXcAUJAdmrTcepcg8t9j4tpMG11cV007dJGs0Nx9odYrFM?=
 =?us-ascii?Q?9g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN3P287MB0083ABF904D70A176FF571BAAD1DAPN3P287MB0083INDP_"
MIME-Version: 1.0
X-OriginatorOrg: techshow-visitors.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB0083.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2a3268-6fbf-4cd5-422a-08dba440b067
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2023 01:23:14.7109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67eba99-f815-4cab-9e3a-551dd06d9bb3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RzDK5hc5xSscuuH/uUQqT95iMjnKsOMggCs3aQNBEPmyxJLMdDr3RoUbRpN1HlqqQeA06ND2MQkNmzQjl94gp/xVHZA/isqkI+MhTSGtvxAYGdRzn0M4WQDkKknf08o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2267

--_000_PN3P287MB0083ABF904D70A176FF571BAAD1DAPN3P287MB0083INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Make your Show name successful with our reliable and clean attendees contac=
t database. We have compiled a list of 2574 contacts who are attending Fast=
ener Fair Mexico 2023.
If interested, I can share the pricing and guarantees.
Waiting for your response.
Many thanks,
Skylar Butler - Tradeshow Specialist
If you do not wish to receive these messages, reply back with remove and we=
 will make sure you don't receive any more emails from our end.


--_000_PN3P287MB0083ABF904D70A176FF571BAAD1DAPN3P287MB0083INDP_
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
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
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
h3
	{mso-style-priority:9;
	mso-style-link:"Heading 3 Char";
	margin-top:2.0pt;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:0cm;
	line-height:106%;
	page-break-after:avoid;
	font-size:12.0pt;
	font-family:"Calibri Light",sans-serif;
	color:#1F3763;
	mso-fareast-language:EN-US;
	font-weight:normal;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.Heading3Char
	{mso-style-name:"Heading 3 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 3";
	font-family:"Calibri Light",sans-serif;
	color:#1F3763;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Hi=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Ma=
ke your Show name successful with our reliable and clean attendees contact =
database. We have compiled a list of
<b><span style=3D"background:yellow;mso-highlight:yellow">2574</span> </b>c=
ontacts who are attending
<b><span style=3D"background:yellow;mso-highlight:yellow">Fastener Fair Mex=
ico 2023.</span></b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">If=
 interested, I can share the pricing and guarantees.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Wa=
iting for your response.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Ma=
ny thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;line-height:106%;fon=
t-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Skylar Butler - T=
radeshow Specialist</span><span lang=3D"EN-GB" style=3D"font-size:12.0pt;li=
ne-height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D"=
><o:p></o:p></span></p>
<h3><span lang=3D"EN-GB" style=3D"color:#BFBFBF">If you do not wish to rece=
ive these messages, reply back with remove and we will make sure you don&#8=
217;t receive any more emails from our end.<o:p></o:p></span></h3>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PN3P287MB0083ABF904D70A176FF571BAAD1DAPN3P287MB0083INDP_--
