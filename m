Return-Path: <SRS0=O61o=GW=bureaulinks.com=kate.ruda@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED96C433E6
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Jan 2021 19:32:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 33E4923108; Tue, 19 Jan 2021 19:32:21 +0000 (UTC)
Received: from IND01-MA1-obe.outbound.protection.outlook.com (mail-eopbgr1380081.outbound.protection.outlook.com [40.107.138.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB3F23109
	for <linux-firmware@kernel.org>; Tue, 19 Jan 2021 19:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB3F23109
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bureaulinks.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=kate.ruda@bureaulinks.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrZ4Sgjrt9RMZ/1YihuqRj2fNJTBQvxzhSf6CtfEYz0N+7w9vKr+5chJV6aZvE/k553uvRwlQ4i7RgaKB+MqKSBd0Z6ecvWsVQy9Titnxx7BYWrLPcpgBTI3ZDAooViwcU+k6hszx81O0D0zbL2G20kz6fTO3v6RW/YmtcAM4lYSKnh/3O84oqWq2q2tJ98y0QVSBYQBVZO41mOhX3UfT3vvpToiow9h3KXsq0AG2qtRoepk1wtZ+v38Lq/cely+lt4E2/88fdeBxv4WNalwYiT2ElagKd0W775dEAjkz3mJVw7+e5l7qHnGDkBV6wWjKi1csNC1bUF/FTQPs4oXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9siIJUvAELHWPH8sCbXNAzGRPPXqwSSiEqKzP0DO7M=;
 b=Mf8V2dGmT4Q6KfxRanEJyMt+JqrNPpCFFy5JPUDGMP3ezBQIRTEq4xaoq1R7jlriY5QNUMCdgA/EiFJLkSGV69+jr9leKW3JNXO11b+5JS77I2a9KSqRxQLF0tvAmdks98RgMyf9YkRYxHaWsgyKM3nGoJlF9EfopeJCFK+REUa0qg6hCCjkgTThH942OzxgW0YYW6zPABbqmhMoUJRwKxVFxRVJxNgGOoRkjjjB8B/vC4qE1h8UHLyYvMMG7nchWZtY6erTMR/M8aYx0A+G/OycWjvmI//0EfhsCvORfYUGoMltWhuw521n/dRJyXQJsinjiS63EJqoPDshUYX6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bureaulinks.com; dmarc=pass action=none
 header.from=bureaulinks.com; dkim=pass header.d=bureaulinks.com; arc=none
Received: from PN1PR01MB0749.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:4::7) by
 PN1PR0101MB1181.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 19:32:16 +0000
Received: from PN1PR01MB0749.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::55b5:5a43:e320:fab4]) by PN1PR01MB0749.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::55b5:5a43:e320:fab4%3]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 19:32:16 +0000
From: Kate Ruda <kate.ruda@bureaulinks.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Managed Service Providers (MSPs) Contact Info
Thread-Topic: Managed Service Providers (MSPs) Contact Info
Thread-Index: AdbumRz6QM1KWKv/Ty2ZGIyDrgYaUA==
Date: Tue, 19 Jan 2021 19:27:28 +0000
Message-ID:
 <PN1PR01MB074986166309F9D79064F20EE5A30@PN1PR01MB0749.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bureaulinks.com;
x-originating-ip: [49.207.200.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3369057c-8665-4de3-cfdc-08d8bcb0eda8
x-ms-traffictypediagnostic: PN1PR0101MB1181:
x-microsoft-antispam-prvs:
 <PN1PR0101MB1181CD8EC7F7CB633FEEBC6FE5A30@PN1PR0101MB1181.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 TQA3+2TedesYlctrA0du+BujCPlSgFZ0SPZ/qZFGALyngO4k/pwiSJbajNwsSyQs/uriBl7HvMgG4Ws0FgtHoJGVV4zJRrcexGIYbPY48jDcmTFZ7atbRYahJPBtdbnq/CHskOt+JTBvDcJPhpBfgKi8DfPGH/GLvcqGhqrrdIbvLWZKwdprgHV9F84PDMuGyKxTTExBoaHF7lIL6Y2tWvj99OGU6UwSMeOunCWgYUBie9jxRhLODIB+oqB7pUZZVr8J1hKLnyx6rc+6ckI3vblWEQoFUSED09A27dokrAIng6iCn+OyvdvQuHJINyiwCnAigzsKmFEOS0ZBX2iywDL1/IL4roMH+0cr8cwhmCoG95mZxNb+Aq2x368uURdzZ6Wq5jW8mPf4sw9xcgXKzMzksI6j1vY+xOyul5StU+9rkWyX+u7g/iRoJ/Mx5CPVMRTqjDr+9bDjQ9UlFWFneL2xd19V8yA71jIgvWWfDdIAqsfgMxwksMXnkPcVA99/HhmIZP3Xyya3yOXCCkWr+g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN1PR01MB0749.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(34096005)(366004)(39510400003)(376002)(346002)(39860400002)(136003)(448600002)(66476007)(6506007)(33656002)(186003)(44832011)(55016002)(71200400001)(52536014)(66556008)(64756008)(9326002)(83380400001)(586005)(2906002)(5660300002)(26005)(38610400001)(86362001)(66946007)(8676002)(6916009)(66446008)(76116006)(55236004)(9686003)(6666004)(7696005)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?mEMiRRdDTVJUs+oGaRNv9/ngso4RnLGfO8a19czYM/+LOMWVPaXQ0u4tNokr?=
 =?us-ascii?Q?M/50lERzWYO+y0p5zUEElBgmAGG2Xhn+q7uC6vDZgU2LuUHRuUwyQ21CX5Q0?=
 =?us-ascii?Q?RBnAiXURfKfxsTL/qpeQfN4esLrtF6GiblqKAF5NKmLiXL1mp+QBhHM8kWBU?=
 =?us-ascii?Q?STedP3lM5vR3jbcrsZhGsYZEHkU3S78junFaTS7zW8+H+o5e5jZWb7iWhjeC?=
 =?us-ascii?Q?sn94/28os54ahqejyU5jk8UonwDoiWv5nVnIGqUp+b+tqOIrX/GuU9r7Qc8M?=
 =?us-ascii?Q?fezZT49I+vlexOETJcn05/e79HklJKTleUeKcHod/6cakOOROQ1n/StoZFQd?=
 =?us-ascii?Q?k424ItqDEuoQUz7AOS2vpNGKpezPBrM9N6flSL44Z4Pp7zM+d0jfU4M9y+CS?=
 =?us-ascii?Q?zlobMcnIJrcJGfIIuQbtb2e1B5Ij8HIcVE+VhQQkc9HXL4k3GQBIqmB9srzp?=
 =?us-ascii?Q?j4WS6FKg0YITkklL3P2ny1ldKt19osaRdJ0VZVkCzP85SEnBYAKaacE0Oje9?=
 =?us-ascii?Q?n7GpbPgrpke3zbnLp11qiNbuF8sMSXoxJQQhHfnsgXWBOo27exlTstDLh1+O?=
 =?us-ascii?Q?Hf265YQxKEc3F5jI8Vo4tgCn7eAtrXdwMhx2jpDlFOLQYcdvuDDkNMSpzqoY?=
 =?us-ascii?Q?javW1ZTNhxtorVgvd8uan9FxhAfv9jjeIagSnCa41aywb3vG7hahtOKhUn0w?=
 =?us-ascii?Q?1i5d0NO7PnQwvOocJrFsI20U5NmE5NwGt7By/aI5a03munLeHGXoewTKB5nt?=
 =?us-ascii?Q?Loo0qh5CjZ1GhWTI+YC8gxkVUCZWEmkBzzoDFiRsDK1VxS6pwAtMdlUmDhPe?=
 =?us-ascii?Q?AwZT6RT9H2WkqxMQT3sUN/b3nOOF+zZxL6TZp3/uqStoWr+p9h/HVjGzluF7?=
 =?us-ascii?Q?cZi1NS+HCDSCYTbZ+QanOyjB+vuTk9+EaX1+ypiukjfsmVCmfJf1LNs5cOEE?=
 =?us-ascii?Q?J2oEgs0IwmUB+s1JdeaTkiaFiN0bekfzXYBVyKcqs/w=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_PN1PR01MB074986166309F9D79064F20EE5A30PN1PR01MB0749INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bureaulinks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN1PR01MB0749.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3369057c-8665-4de3-cfdc-08d8bcb0eda8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 19:27:28.2443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ecc9e158-2ddb-48bf-8ba1-99e5e51038e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R94aeC4nogc7NJQi0gtwtGw5POqZ8ZmrrJeSYV8KCnh9oeH8Z4dbZ8K0d+HveyaG0fnl+Ny0KauZhwvqwL3ZDvZKNeooVeyKExtWu6f5FOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1181

--_000_PN1PR01MB074986166309F9D79064F20EE5A30PN1PR01MB0749INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Are looking for a customer bases of your Competitors Installed Base which y=
ou to reach niche target and also helps you to grab new clients for your la=
test service and products?
We also have an exclusive database of:

1.       Cloud Service Providers- CSPs

2.       Independent Software Vendors- ISVs

3.       System Integrators- SIs and more

4.       Managed Service Providers- MSPs

5.       Managed Security Service Providers- MSSPs and more
Data can be customized based upon your requirement (e.g. Job title, Vertica=
ls, Geography etc.)
Data Fields we provide: Name, Company's Name, Phone Number, Fax Number, Job=
 Title, Email address, Complete Mailing Address, SIC code, Company revenue,=
 size, Web address etc.

Please feel free to get back to me with your target criteria if your criter=
ia is different from the above mentioned applications let me know we have c=
lose to 5000+ technology installations.

Thanks,

Kate Ruda

Marketing Executive

Note: This email is not expected to be a spam. It would be ideal if you ack=
nowledge our conciliatory sentiments and answer in the subject taking with =
leave off to be expelled from our Mailing list. Why not try it/us out?



--_000_PN1PR01MB074986166309F9D79064F20EE5A30PN1PR01MB0749INDP_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	mso-style-link:"No Spacing Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:.5in;
	mso-add-space:auto;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParag=
raphCxSpFirst
	{mso-style-priority:34;
	mso-style-type:export-only;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListPar=
agraphCxSpMiddle
	{mso-style-priority:34;
	mso-style-type:export-only;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagra=
phCxSpLast
	{mso-style-priority:34;
	mso-style-type:export-only;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:.5in;
	mso-add-space:auto;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.NoSpacingChar
	{mso-style-name:"No Spacing Char";
	mso-style-priority:1;
	mso-style-link:"No Spacing";}
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
/* List Definitions */
@list l0
	{mso-list-id:1032652502;
	mso-list-type:hybrid;
	mso-list-template-ids:-345314150 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F4E79">Hi,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F4E79">Are looking for a cust=
omer bases of your Competitors Installed Base which you to reach niche targ=
et and also helps you to grab new clients for your latest service and produ=
cts?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><b><u><span style=3D"colo=
r:#1F4E79">We also have an exclusive database of:<o:p></o:p></span></u></b>=
</p>
<p class=3D"MsoListParagraphCxSpFirst" style=3D"text-indent:-.25in;mso-list=
:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F4E79"><span style=3D"mso-list:=
Ignore">1.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F4E79">Cloud Service =
Providers- CSPs<o:p></o:p></span></p>
<p class=3D"MsoListParagraphCxSpMiddle" style=3D"text-indent:-.25in;mso-lis=
t:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F4E79"><span style=3D"mso-list:=
Ignore">2.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F4E79">Independent So=
ftware Vendors- ISVs<o:p></o:p></span></p>
<p class=3D"MsoListParagraphCxSpMiddle" style=3D"text-indent:-.25in;mso-lis=
t:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F4E79"><span style=3D"mso-list:=
Ignore">3.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F4E79">System Integra=
tors- SIs and more<o:p></o:p></span></p>
<p class=3D"MsoListParagraphCxSpMiddle" style=3D"text-indent:-.25in;mso-lis=
t:l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F4E79"><span style=3D"mso-list:=
Ignore">4.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F4E79">Managed Servic=
e Providers- MSPs
<o:p></o:p></span></p>
<p class=3D"MsoListParagraphCxSpLast" style=3D"text-indent:-.25in;mso-list:=
l0 level1 lfo1">
<![if !supportLists]><span style=3D"color:#1F4E79"><span style=3D"mso-list:=
Ignore">5.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F4E79">Managed Securi=
ty Service Providers- MSSPs and more<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F4E79">Data can be customized=
 based upon your requirement (e.g. Job title, Verticals, Geography etc.)<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><b><u><span style=3D"color:#1F4E79">Data Fields we p=
rovide</span></u></b><span style=3D"color:#1F4E79">: Name, Company's Name, =
Phone Number, Fax Number, Job Title, Email address, Complete Mailing Addres=
s, SIC code, Company revenue, size, Web
 address etc.</span><span style=3D"color:#1F4E79"><o:p></o:p></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"color:#1F4E79">Please feel free to=
 get back to me with your target criteria if your criteria is different fro=
m the above mentioned applications let me know we have close to 5000+ techn=
ology installations.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNoSpacing"><span style=3D"color:#1F4E79">Thanks,<o:p></o:p><=
/span></p>
<p class=3D"MsoNoSpacing"><b><span style=3D"color:#1F4E79">Kate Ruda<o:p></=
o:p></span></b></p>
<p class=3D"MsoNoSpacing"><b><span style=3D"color:#1F4E79">Marketing Execut=
ive<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;line-height:107%;font=
-family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#1F4E79">Note: This =
email is not expected to be a spam. It would be ideal if you acknowledge ou=
r conciliatory sentiments and answer in the subject taking
 with leave off to be expelled from our Mailing list. Why not try it/us out=
?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F4E79">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F4E79">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PN1PR01MB074986166309F9D79064F20EE5A30PN1PR01MB0749INDP_--
