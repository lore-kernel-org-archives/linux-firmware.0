Return-Path: <SRS0=duzp=FO=insightsocean.com=christal.warren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13D2C433FE
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Dec 2020 22:22:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B38E23100; Thu, 10 Dec 2020 22:22:28 +0000 (UTC)
Received: from IND01-BO1-obe.outbound.protection.outlook.com (mail-eopbgr1390073.outbound.protection.outlook.com [40.107.139.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9456B230FF
	for <linux-firmware@kernel.org>; Thu, 10 Dec 2020 22:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9456B230FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=insightsocean.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=christal.warren@insightsocean.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWwSPFPFqZms7W+vP2zmuJR2ha0u6D8+ItPCkHxu4wLtqIBxN2hS2jOGdQfGQ0H6VLHpzrUjs1qJ5+UQKwvxpoQGyVxRrOiKtjnmK6jmn9xdlyxuettuba7TZlobc059AtyQf1bU/t3Nm2cK8acZBbtFvWM6qi/IBC4+WqRFvoaFOsUkKm+Z/mFzL6vP2WnN5MM9BVeQwhmHGSzBDCktgtJZRzkFtnS3y4JzxGZKe0v85pFZg4ej2NUyFdTITXjN4jK+SOVeOg3jHxCiPI/sLz05wk8bw4rzO7kbYYv065FL6smo9azvkOXDB4dsTvnmOYvCjMnk53hR4+PHOI3Raw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDEi+WftRg9o09eHKoou1JqjKMXB1Qy7Vqz4R4nk1Vo=;
 b=oDJQR4GDlc+7oddj3uQrdL/n2Bw5yR9rd5r0mt4IS5imCD2514ZtvTdM/dyXe2CF/FI1ShjoHLSnkzWKMfKGifEjiUxClFWN2OpobYHPwymKGmzU/LDEZRtO04vghhfH97a8jiGvXpJRJ3qxo47fCmWEtHk4FuEWphAlhSdjwzU4wOSj9Dds9G7z5reMEz0rId9zB+TyK6yNO7+4IdnTmFU5gVgq7UWCAFluG6sEx9OXB4lLN1HDeIPUZxe3aypu3IJUeF2f6yxqy+WgUw2A2oaKJfT1QfoL8mID0M8r162nT5U7mt8O2iaKnBzXBe0DUhVS0OFF18zYDiawiaGY6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=insightsocean.com; dmarc=pass action=none
 header.from=insightsocean.com; dkim=pass header.d=insightsocean.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Cyberdom.onmicrosoft.com; s=selector1-Cyberdom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDEi+WftRg9o09eHKoou1JqjKMXB1Qy7Vqz4R4nk1Vo=;
 b=Ci6j8A5IBxtzbij3bg/7UnePO2iVfCYjcTrTplw/jRAAkfZ2TLG7qL82qtlJSuyrsZHKAtTC/gZTdjT+FLHB79rYN2VnpzAN38PMRRYbVSC8pYGWLMPytfxp63KG2r2KbIPwI7+Q1JJbMpsq4MdaXUCvrJskkhCL/9u+/Z74M5E=
Received: from MAXPR01MB3423.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:62::15)
 by MA1PR01MB3674.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Thu, 10 Dec
 2020 22:22:24 +0000
Received: from MAXPR01MB3423.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::4c18:4639:bc00:bc11]) by MAXPR01MB3423.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::4c18:4639:bc00:bc11%7]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 22:22:24 +0000
From: Christal Warren <christal.warren@insightsocean.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: MSPs, MSSPs Contact Info
Thread-Topic: MSPs, MSSPs Contact Info
Thread-Index: AdbPQmlAEeR9E7opQaecqcUwvApZCQ==
Date: Thu, 10 Dec 2020 22:22:24 +0000
Message-ID:
 <MAXPR01MB3423A9F4734541E7B9B17227EFCB0@MAXPR01MB3423.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=insightsocean.com;
x-originating-ip: [49.207.197.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f373bc2f-9a73-425c-8e5d-08d89d5a11ea
x-ms-traffictypediagnostic: MA1PR01MB3674:
x-microsoft-antispam-prvs:
 <MA1PR01MB367477B9FF2234E7AB650804EFCB0@MA1PR01MB3674.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0CCXpZYj0PFXb3bKBLOXTTwetJMgdunYo3OrOkjkG70jad5dIoTYy1axiidXAmcPd9KtOhs8KrGQF3qgXZGQy8O0tZ/w2fgM2M3B61j1JzeB6P/rNNwfrNBKNXZOc8DGjNO5HCnhKF3mO8fpt9ifsTGrlyl5bSvQKXRY7kzicdNSjxPxfBMmXSRRLtsWmbbkUJmJrq1SXNAh+a2mNxgAhfTkCjAWgD4VzTelz3b+ARWYRixYD03wxZQo+AwQjxUzH5VS5t0eKpobsQjOsUy6OOeO+F1Z9Wr5v9bbpYW8MQGuddLI1U4VTxZjERGMf6QFD8BLFtdjYMLr/6ZqltKmaw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB3423.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(136003)(39850400004)(346002)(376002)(396003)(33656002)(478600001)(52536014)(2906002)(8936002)(86362001)(71200400001)(9326002)(66946007)(66556008)(83380400001)(316002)(55236004)(7696005)(8676002)(26005)(66446008)(9686003)(6506007)(66476007)(76116006)(44832011)(4744005)(55016002)(6916009)(64756008)(5660300002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?1wbd0wbGgef4uPFFD4WygWTgQkPurF8j7Bjq8wn7dB+kzeWZ18X37cLz2get?=
 =?us-ascii?Q?etk5SJIkQH4wnqqXt7B2ADDN3DYJCDwRlebhIn0qcuDIps44Jwc5mW2Kwt8q?=
 =?us-ascii?Q?UNTXL15/UJQf+rL/xMTb1OVVwxsKn5GtcSGKtjuyMHAA4JqNKsSpsh8WsvVd?=
 =?us-ascii?Q?+zgJUzDzHilKAwwNrEiRNXUtRtGopjeAfSwjCN6MIEp/ugUJvYjPmTXH9C8C?=
 =?us-ascii?Q?4Byc0FFNWCEM/p0/gPPA1v4VE4/7e1cKEq6yyjAXAhaxg39kKFuNh16BbJVB?=
 =?us-ascii?Q?16tegIn1y6KFDlZAs0W2NLT21fxNIsfPWDp1oeP+bxsCeYWpGtY3uQ9817sg?=
 =?us-ascii?Q?Jg+MjfWtmTBrxoTW75Wa2048m+CuF7nPke/tVzjbXdetEhQ0nULGxLXcPS+0?=
 =?us-ascii?Q?wMvKqSikMC18gK85s6ZmMGZ+No1LLuwhVSqFnZTzAq14wHXZY+ZR+NbVDMFw?=
 =?us-ascii?Q?up2ysQz7YWsqQMlfWgzsWGVLVyxpVPZG2FjSfBtyigsinFvJA9rYNqq08CfO?=
 =?us-ascii?Q?SHcpHENSXOc2DmDM2BmdugAbD9/obiZQO+tD0So8XHdUqKSCTTJ+nVEe5mUj?=
 =?us-ascii?Q?AgAZckqdYxGVjRYTQAUqFHZ7UTrigCVuVt3PZ+NRBddL0g2DhBrp1oPCNst4?=
 =?us-ascii?Q?hLx4mWIsorX2Kqoty8X7waEyM0X08+xhtF9/PB7hJqdyTMMCQOAT49OIHKMV?=
 =?us-ascii?Q?iy8sv3ID9/mUNy8LM2Bz3mxP+DM909tviiU8N1IJUWZ0vRVpZGvfGD+S+PRy?=
 =?us-ascii?Q?qbMvRzTllfDuCPzVHYYxt+5rXzFK1TEo6dPhaa4dKrMpJvKWFJ3Vxr0RbS3z?=
 =?us-ascii?Q?I41dbDUW4ZAlTKg6DIrJOVs8hrPfi4qzJ2mWgjqkIjjrxriU05t6QxYROyVp?=
 =?us-ascii?Q?pRBwPvbeHlLRau3rr7fkpgLA4zZ3QrL3p2XupQqqQBVONH5D9sUxzdnZ3gcY?=
 =?us-ascii?Q?pUWIU/pXPE3Xel++uI2kpM2P7A/GIJzBQYSKYhzZSQY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB3423A9F4734541E7B9B17227EFCB0MAXPR01MB3423INDP_"
MIME-Version: 1.0
X-OriginatorOrg: insightsocean.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB3423.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f373bc2f-9a73-425c-8e5d-08d89d5a11ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 22:22:24.0980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ab3d335d-0855-4978-94c5-c7a1703fe25f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pPO8lA2ZHVxIbPpQMzsdng/As05gLsofuz/10P0V8Yntt97oUdRhIqCwlO5CYdH13mPmUCK2L8uom4j2RGOT+D2vJXSID7oAELcxGsqLwm3LRPrNiZnADz0iv3G/3xD5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB3674

--_000_MAXPR01MB3423A9F4734541E7B9B17227EFCB0MAXPR01MB3423INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,



Would you be interested in a list of Managed Service Providers (MSPs) and C=
loud Service Providers (CSPs)?



You may also be interested in database of:



1.      Managed Security Service Providers- MSSPs

2.      Value Added Resellers- VARs

3.      Independent Software Vendors- ISVs

4.      System Integrators- SIs

5.      VOIP Service Providers.



Please let me know if this is something of interest to you so that I can pr=
ovide you with further information.



Thanks,

Christal Warren

Data Generation



If see no interest please reply "No Need" in subject line.

--_000_MAXPR01MB3423A9F4734541E7B9B17227EFCB0MAXPR01MB3423INDP_
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
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:105%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:105%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">Hi,</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt">&=
nbsp;</p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">Would you be interested in a list of
<b>Managed Service Providers</b> (MSPs) and <b>Cloud Service Providers</b> =
(CSPs)?</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt">&=
nbsp;</p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">You may also be interested in database of:</sp=
an></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">&nbsp;</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Managed Secur=
ity Service Providers- MSSPs</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Value Added R=
esellers- VARs</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Independent S=
oftware Vendors- ISVs</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System Integr=
ators- SIs</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VOIP Service =
Providers.<o:p></o:p></span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">Please let me know if this is something of int=
erest to you so that I can provide you with further information.</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">&nbsp;</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"color:#1F4E79">Thanks,</span></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
b><span style=3D"color:#1F4E79">Christal Warren<o:p></o:p></span></b></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
b><span style=3D"color:#1F4E79">Data Generation</span></b></p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt">&=
nbsp;</p>
<p class=3D"xmsonormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt"><=
span style=3D"font-size:9.0pt;line-height:105%;color:#AFABAB">If see no int=
erest please reply &#8220;No Need&#8221; in subject line.</span><span style=
=3D"font-size:9.0pt;line-height:105%"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_MAXPR01MB3423A9F4734541E7B9B17227EFCB0MAXPR01MB3423INDP_--
