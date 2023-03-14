Return-Path: <SRS0=5hVr=7G=trade-clientele.org=myra.aaden@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4BEC6FD1F
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Mar 2023 06:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F8A2C4339B; Tue, 14 Mar 2023 06:20:44 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2079.outbound.protection.outlook.com [40.107.222.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6E44C433EF
	for <linux-firmware@kernel.org>; Tue, 14 Mar 2023 06:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6E44C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=trade-clientele.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=trade-clientele.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oE+aD7MBcogiG4z3W0JwVdu+gkcDgngv8tx7oYdXelnlsouIa984mm8azCj2tuvogIk/0kSEXQ57+atrJoh02bEroez7uAP9f8mPaIf1RUIhlFpRdCGVEz/58kWn91yE8ZBEysExLvsG7OILOO81BR0v2W4h2l9bGIUk4+Uw7rys8CY0A1r/iCRkNmQhfr/flgnJ1BG2jO//HUrro3QnrC35xoQoipIzk+U6o7/JU/zfJYEp4xu+S11aNHArSNrKOvJU4IWG746arWA5uIqRjOU5qE5sByzoAyscHwh7RaqvGmT3Vh2M3907yTBPTIF5Pifs9djeOjHteR19sD9QVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqmkegD4ZE/cAnrTaYEV5jI/1Ieqzrlg7dYPSpSIB8g=;
 b=kXFE5VVjiPibRrDuArUDb0+2Lv+FXaxx0ibGWclYte/Gdj0bpfbFn6YUm+goCKaZX6rFEnBnZAk+OYmPVd6u1A9abaAfG/w7ZongZqohv34Kc8BlVwrQsvVEipdStZWsfD4lSajPyGCyZLx/Lp48sBdnSVUjqcWHgfQU2a3ea+l6X9pn0cglyDQyrpGMHrOypVlTbMxLq0D5BFS9DMKfl8KULWiu///aQC19+vFELPPd+xyPrZQY58xsnFVhhQVeC94QA+aX5TQFSmNLphhEJmD6uPZe8mtkqMDbIsxqlM51OoWT5dLQCcp8bolYbZWUAgBj6EnlxvUFy7+sn5+6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=trade-clientele.org; dmarc=pass action=none
 header.from=trade-clientele.org; dkim=pass header.d=trade-clientele.org;
 arc=none
Received: from PN3P287MB0116.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d7::12)
 by PN2P287MB0160.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ec::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.27; Tue, 14 Mar
 2023 06:20:39 +0000
Received: from PN3P287MB0116.INDP287.PROD.OUTLOOK.COM
 ([fe80::b839:d5f4:d75a:4a81]) by PN3P287MB0116.INDP287.PROD.OUTLOOK.COM
 ([fe80::b839:d5f4:d75a:4a81%3]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 06:20:39 +0000
From: Myra Aaden <myra.aaden@trade-clientele.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Feicon South America 2023 <linux-firmware@kernel.org>
Subject: Kernel - Feicon South America 2023
Thread-Topic: Kernel - Feicon South America 2023
Thread-Index: AdlWPQ8y7MR0LyG2S6KW54tZCFSblw==
Date: Tue, 14 Mar 2023 06:20:39 +0000
Message-ID:
 <PN3P287MB0116FF2CF4129F10DA85529CD6BE9@PN3P287MB0116.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=trade-clientele.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB0116:EE_|PN2P287MB0160:EE_
x-ms-office365-filtering-correlation-id: ee81d165-68bb-4a7b-3818-08db24543b8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YSOik7l0XuFDSSC7GZ0hJkJHEMy9pQ2HU8qAiSSoHZU0aLFADMwRfZvLtXJkRDxuLXAvYdX+zEJpPkp4aAyvKlz3+BzmvFU19gmV4P2+UwHlurNwFo+h7iMIZXwZ1+I4WVTwVSSHd4HUpG6wc32R8GZ2couSxaY55mGm8mFBhPBPSIXXqX3qnU4ybhQzGZpsn28dHFovo4N+t/bQEw7l5+OiVgv/+SqSWew7idNvi6EfScN8/mHObOawm3AIxjRud84nNdV66YbMEFchnlFcGFYq93oSPgr+zjUfDKf5K9KEGfcyrEzFa4LA2Ls1T24eXPdecgdgUESvWATa9z83hiuNQqK8hDieaRSkiYLLEayL+yyWTUNX+YTvrDTPe9nZ5ZZC3CGHV/TcLxmUTMtOKQFniQwQoIhTkeKxyibcACDoiITL9O8EROeDmVz121KKOmUYryWuWA6hwTaE3rvY0Pnh9h+BkjpzUtDGNEKxRDdAKfyfkpUBb297azXaKl8HJ63tvLdaTG4U4lvCi2jnHxq04WFDwkXtLIS3yKNMaaTcGv3nL83maYqYZ6EFjbDsBrxZKfkcRat2z+ZZfNG1O+PsbXIWlHScay/5RfYzJY4FJnvig2uAiME4hF6kanUvxV8Pi8nfpisNoLKMg2zilo4vKwR8HW6Iinq4fLcVDjILOjbbEa+g/R8js8bEAbdC
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB0116.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39850400004)(346002)(396003)(376002)(451199018)(33656002)(316002)(55016003)(86362001)(38100700002)(122000001)(83380400001)(55236004)(186003)(6506007)(9686003)(26005)(38070700005)(71200400001)(52536014)(7696005)(5660300002)(478600001)(41300700001)(6916009)(8676002)(4744005)(2906002)(8936002)(44832011)(64756008)(66946007)(66556008)(66446008)(76116006)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nr23S0Na4MdZFIldDy/Ht0eaFZiJE2lb67nfsz6ua9uxJ7qN+VIfXNKMQ6qF?=
 =?us-ascii?Q?LI7shE61LRLJeBui79cq3z+mM4z8xkVOrygbSs8fP77EQowK3PnApJsUSuMt?=
 =?us-ascii?Q?lHuaFjEEJWIfVDML8fXg7MYX0RCDy6fo7tXVYvhv/VKaaw3oymj2nK2YT6tu?=
 =?us-ascii?Q?5eVdWHtEFyPCkKP5GeBuzBRFlFgw4ET1b888PfzFLHdua9PkSfRjUODfym0e?=
 =?us-ascii?Q?g57x3YiYaYhLa0hzNrwYCSKXa6Jw5rk/7cGfqmhHOuwqoUNwMQdtLKhsQdiF?=
 =?us-ascii?Q?K5bs+kMT/xpZphH+H4BXJ3RXpMS4+9KHs3IHDb8iPwjAOTfR7ybNpZxv9Cio?=
 =?us-ascii?Q?rrsbVpWb42VA9butYLcUJnO9wqqrt/JCD40AZ6CwiKJiBvJNapZZokQmTUSZ?=
 =?us-ascii?Q?m6/qTHLuCo9F35vig2Ns5kyJptidAqwUf98r6jkRT1MgVWSjfRB9b5siHTeT?=
 =?us-ascii?Q?WW2BQt1TlkqYgwwE7KPjru3xUbtLBeF9oke+4Mxdz5SeiQ4xjL6crDfuLAMa?=
 =?us-ascii?Q?8AZGVwJI+YdG67hPzs/Ym+xalYNIltsjqIv68gsaRwcIk7mk5lnxnNTVRCfi?=
 =?us-ascii?Q?ljqSXkfiEzgsL39E8FVCfJsP1DE1BxIenFs3beLyg5++F4apt6GiyOM9XBcf?=
 =?us-ascii?Q?Dn0wf+zMnFwtjqCyYNDkVHBorLKEpvCK6MV3QWuo8hwKpvDtQ5wsECz9ujou?=
 =?us-ascii?Q?LQPB5noy5uU8e/HiLIyNsa78zOevZaU55IDrRvkfhp9azx0aSnx9nlT4rLfM?=
 =?us-ascii?Q?4I1jaJCW1Mkhj+66rrrIqOtC3loepCU4AlJOa5DuCdOVeSyYYScwO5oXNK33?=
 =?us-ascii?Q?Qe8nzYrCnpd1P5QG6HPhWyixn4QqciKB5PcYxKQIgOB1iaOLNUMQoPCScuTW?=
 =?us-ascii?Q?CfFHVV52B9kEayKPxA69GtHTHlHK9kEfzjALpL8n3/0Y53+I5X0mFnMZkxUo?=
 =?us-ascii?Q?68zmuONUesyawXh3UBieCv3v/8yd/5OFPbptqdF9KR0BizRqC/mfC1AfLhnu?=
 =?us-ascii?Q?8EOpk5FGhY4TLL7BIIyvN4Gd1Rq5k2DTwhRti0REtzb79UfT1q8LgfBR27Yz?=
 =?us-ascii?Q?S4ldkZ+HJR6W8UNMBNRDYemOpwmg6DunMh17tWWaQfIe925L1Diiw1VE6zd2?=
 =?us-ascii?Q?tIoeNjdk1dXW1QbK0KjmnD7sAwKcJN0CXllY6lwlDn7RLZhUe3gv7MA8bsXg?=
 =?us-ascii?Q?1FNyvBwGUgbk1hIo3Ef4VBc6M7Sf8Hh2oQ2tXY/eUWykEtPUQYiQ6pU/voJh?=
 =?us-ascii?Q?P3A/+rK+hrq2VPIaV2nySCm4dlHiXSYIEZdVg2gOj9Fx11JgOxbMyN2Mk+d7?=
 =?us-ascii?Q?NKopt935gOFFgNAvPhgYfN8LJ7M9wwkKq08RDiuKraboUNI24d1Sm4PjrcqO?=
 =?us-ascii?Q?DLeYNEg3GyP29EQHy3FQOgadyvE5Nx5X//W3Hs2vabkF/nG8549zEzj9ewpK?=
 =?us-ascii?Q?9FCcBS2uMhEUEhDh9dfLYoH1QcfiTooJxXd3ym9Bj3Efe6tkGxCP83oT+y0j?=
 =?us-ascii?Q?IyVboSIBBhWHn1d9sYcwUEUdZ6zhJZ9+D2r2lefBNDOAVcsdaqSG6FPVdOke?=
 =?us-ascii?Q?mCMHvB72PXQMKsCituRCOUDen9bkRGd0RfxEwacdC5JsugD+ouI2vDpkOt+k?=
 =?us-ascii?Q?2Q=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN3P287MB0116FF2CF4129F10DA85529CD6BE9PN3P287MB0116INDP_"
MIME-Version: 1.0
X-OriginatorOrg: trade-clientele.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB0116.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ee81d165-68bb-4a7b-3818-08db24543b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 06:20:39.7420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67eba99-f815-4cab-9e3a-551dd06d9bb3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANfBznJdBtqdSDND15wpQ2l6+lXErqpf/5ocD5nCixxacksBEQo5EKiYX/SjH3AI27rA2XJ6aoGm3IKXw9fVusnhus5rEsLyLBeV031spFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0160

--_000_PN3P287MB0116FF2CF4129F10DA85529CD6BE9PN3P287MB0116INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,



Good morning.



Just wanted to check if you are interested in Attendee/Company list of Feic=
on South America 2023 with Counts 12471 to reach wide range client/industry=
 leaders to promote your product/services at global market.



Information Provided: - Company name, URL, Contact name, Job title, Phone n=
umber, fax number, physical address, Industry, Company size, Email address =
etc.



Please confirm and feel free to reach me out for any questions. Have a grea=
t day!



Awaiting your response!!



Best Regards,

Myra Aaden

Tradeshow Specialist


If you do not wish to hear from us again, please respond back with "Leave O=
ut" and we will honor your request.

--_000_PN3P287MB0116FF2CF4129F10DA85529CD6BE9PN3P287MB0116INDP_
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
	{font-family:Magneto;
	panose-1:4 3 8 5 5 8 2 2 13 2;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:8.0pt;
	margin-left:0in;
	line-height:106%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
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
	mso-ligatures:none;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<p class=3D"MsoPlainText"><a name=3D"_Hlk129394487"><span style=3D"color:#1=
F4E79">Hi,<o:p></o:p></span></a></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">Good morning.<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">Just wanted to check if you are interested in Atten=
dee/Company list of
<b><span style=3D"background:yellow;mso-highlight:yellow">Feicon South Amer=
ica 2023</span>
</b>with<b> <span style=3D"background:yellow;mso-highlight:yellow">Counts 1=
2471</span>
</b>to reach wide range client/industry leaders to promote your product/ser=
vices at global market.<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">Information Provided: - Company name, URL, Contact =
name, Job title, Phone number, fax number, physical address, Industry, Comp=
any size, Email address etc.<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">Please confirm and feel free to reach me out for an=
y questions. Have a great day!<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">Awaiting your response!!<o:p></o:p></span></span></=
p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">Best Regards,<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"font-size:14.0pt;font-family:Magneto;color:#1F4E79">Myra Aaden</sp=
an><span style=3D"color:#1F3864">
<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79">Tradeshow Specialist<o:p></o:p></span></span></p>
<p class=3D"MsoPlainText"><span style=3D"mso-bookmark:_Hlk129394487"><span =
style=3D"color:#1F4E79"><o:p>&nbsp;</o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-bookmark:_Hlk129394487"><span lan=
g=3D"EN-IN" style=3D"color:#D9D9D9">If you do not wish to hear from us agai=
n, please respond back with &#8220;Leave Out&#8221; and we will honor your =
request.</span></span><span style=3D"mso-bookmark:_Hlk129394487"></span><o:=
p></o:p></p>
</div>
</body>
</html>

--_000_PN3P287MB0116FF2CF4129F10DA85529CD6BE9PN3P287MB0116INDP_--
