Return-Path: <SRS0=2miz=EU=attendees-techexpodbs.org=olivia.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE415C83F3E
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Sep 2023 22:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FE8DC433C9; Mon,  4 Sep 2023 22:18:53 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2084.outbound.protection.outlook.com [40.107.222.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90DBDC433C8
	for <linux-firmware@kernel.org>; Mon,  4 Sep 2023 22:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 90DBDC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=attendees-techexpodbs.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=attendees-techexpodbs.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OShhPvVjznzmRfxoCFuAtauPnE0IrtHGR9RSZ7fPIFoxVAmn+7sGi2ARMgOYKsEz+7Mpvtl9xbbOgsCsrIq/3rcwuT8q7K1G3kU5fWI1FYwERCh6gtiax690gOyDGWkhUEaAwkIAFRxa4ZCBrRHHwgjmKUzZbPklgR9TROQb99QoZ521eaQW7zoR3f+x7ev8NAETUG+vsAMQlOjKs/CIQXZ1o8cG4E2Kb533Xt0F6UuiKfHnNduMbixTMSoSUepaaEO9aflQ5oUDkaFqYS9fGJvWalq/8MY5CSEuVgQPw2BQM64CcoFDa8HmXRpAmwmn5uCGNE7L99OUyYZHLlYngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th0e7xZSA+4j/0JWVGwlfv+z3k/whufEtY1pGR/1/nU=;
 b=B6eESSdq3Y4uCfhQQKZOjLIJ4TebNqqc9x3UR/rX+ctMRkt2sMxpOGCHAvOiBrZDYuX4AXYQhXDN321np0pQ+XssMvmmkE4N9ahHSNIoCnUabh1T6z1Pid9MpHEKRZirM4h6dyH2s/ViT23hNLraqWax7YEl6E29IdXe459GFyXCCrrisfGqV8Zcj6H80ubnie7T3rfwelggMHOqrklPFi+oflsbUiVYijLctQr7rJQ35XWTl9eU0z5Zh5JwIqmqvLdUD8Q6a1xCeAM5KiOWg+DzdeUA5rdDaBFiNCZgN/TRYyhSoXju5bMVScDYp3a4vJ+3zz7j+5BlUz5IWKXBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=attendees-techexpodbs.org; dmarc=pass action=none
 header.from=attendees-techexpodbs.org; dkim=pass
 header.d=attendees-techexpodbs.org; arc=none
Received: from MAZP287MB0023.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:58::5) by
 PN3P287MB1773.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.33; Mon, 4 Sep 2023 22:18:47 +0000
Received: from MAZP287MB0023.INDP287.PROD.OUTLOOK.COM
 ([fe80::bad6:11ed:c449:b33]) by MAZP287MB0023.INDP287.PROD.OUTLOOK.COM
 ([fe80::bad6:11ed:c449:b33%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 22:18:47 +0000
From: Olivia Johnson <olivia.johnson@attendees-techexpodbs.org>
List-Id: <linux-firmware.lore.kernel.org>
To: Fastener Fair Mexico 2023 <linux-firmware@kernel.org>
Subject: Kernel - Fastener Fair Mexico 2023
Thread-Topic: Kernel - Fastener Fair Mexico 2023
Thread-Index: AdnffbZVvceLdmiJTiuAOK8EDbyk9w==
Date: Mon, 4 Sep 2023 22:18:47 +0000
Message-ID:
 <MAZP287MB0023785699120C67AC6A8B7ED8E9A@MAZP287MB0023.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=attendees-techexpodbs.org;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZP287MB0023:EE_|PN3P287MB1773:EE_
x-ms-office365-filtering-correlation-id: 3bd6565e-b671-42f1-d444-08dbad94e88d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Lh33JVfg27R6AJ+b0Dird2hk3Hx2n3ui0MclH+5CTE8CCoPN40HdVfplmd+mGN+08Tuu5Bf3KM8Pqgfn7zeyGquwVEpgQRwzRzZjk+UspeWskAOHSAV6npZOQbTarvpxd00mAPUFbiSVygn6l9Ove8R9KgOB+jTUD7yNIpjpWk+Q8I+SQEtpZitNbeonxFOpi8WmB+fcmpgQvFewEPwqFvFpy8OiNNRWcKyxy6ZSz7Qy19kU72tCzcZh3s4V0JOF8TlaSEGpGa9jqjfD+CWheylToyjQx5ZhLhrbKymFgcSamSaw0U8LMLIOGQiG3yA3GoMJRr14qoELzRAhZkR83/CvA1dEcjsJnddTQK4ifHTHqRkFq0dtgOS3npmI0Q58Dgc3lAGF/l/yBPL9qP75+eAQ0OKp5IYM/rkMVABW/NFttEyKUeOdbB2LVG1ul6xtYcEp96xM/9GVAiDQRSmCNw6jv9/PgTfZnDBya+Wb7fDMIy9qHAHrHRhdpAeMZv06S40b+m5JancQd9Q490bOcTzRQybJz2U4RQn+0DiCmA+tLFzHG3tQB6udm8mxDke9RRAHNfFs5dAqi30TdO+zA8rt5+5Xp3b3UlMzXZte/dTYrtM8DhWXt3Q7RZgd20jy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAZP287MB0023.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(186009)(1800799009)(451199024)(4744005)(2906002)(33656002)(38100700002)(38070700005)(86362001)(122000001)(55016003)(9686003)(41300700001)(6506007)(7696005)(316002)(6916009)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(8676002)(52536014)(8936002)(478600001)(71200400001)(44832011)(5660300002)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+ZhZjv5CDSaSSQkuigkHuRA7urWOUAypCN6b9DiyLQT0S1ghedi8JgJyWAut?=
 =?us-ascii?Q?wokHn46U5VtgNlIfxozFyqzmFTjiOFbhfseIKxxVJqFLrFlmzgz/xyAEM1me?=
 =?us-ascii?Q?XVScIKCD+f4llh4cqMBbZcYYh8GTrSSWQ1CfV2P7tj5LHmhbBdAJItzTQOmP?=
 =?us-ascii?Q?B4+/qTkNhZlAvOIzM2s6WzARzi896tDzM0o6dL/uD6o62SGA/qKQ4Y+83Kk5?=
 =?us-ascii?Q?7zXL7C449bX764IQrmfEtmOj2WhgfNkJ12Xj1MZBhbJZcyr2p0XJHgemiyA1?=
 =?us-ascii?Q?YxYT2qPPcJQoXe5zWFsKVIj8pIVj9BswhQ90RUNbCXQ6VvM+YTYeBgTOgZVU?=
 =?us-ascii?Q?58vjRCtDDOBTeLjnp0wvmcDfPpGdba5Pljq/GEXl1qoYsS6kOyCdgUyEirqG?=
 =?us-ascii?Q?Sp1nB5IvMBeBWT+3xhqR39yuCv6v16uH89pvqXW1F1if9kSDRb6exKUQoLqK?=
 =?us-ascii?Q?DV0utOUVohiWxnUohrdM+1e5N4CoAQko/CGtQGmccfFBiCadhsUi0nnceiu3?=
 =?us-ascii?Q?Yleb5FUA7kgqzjiZxlQHOMBDD3vFWWL2XAuKmigs+5ReRnSo5cBwImo48OU7?=
 =?us-ascii?Q?WX10TJFCWtci/3H8huvQmEcecNa1zuDkPkJrJUVsXClbwVDOah6xeckguZG6?=
 =?us-ascii?Q?dvtkvH7DbmLNMK90b1qeV/SajtTzxUhyoazNU1ZKTdVQvpogCwAFUwLEnmU8?=
 =?us-ascii?Q?hC4qd8iQInBlZ/7DHVLhi1rvfVQzbXzZR0wIuzklqsv+Hjtwy4z2DfO35Cz7?=
 =?us-ascii?Q?fA1rMKMGKRAu0OPbA2bg3I2O/50TzjhGE8mjlb1VlClTTMiZoPesakbzCmus?=
 =?us-ascii?Q?t4VzPvv6uTyxYBjn8f0EZF3biMH/8FC8UbBVUiAgjGgLcaDQnaQD8z0qs7Gj?=
 =?us-ascii?Q?Y/Lydb65B/wIKZilbT0i0Tf7Qe1+azEmkCk/uomL6Mp/idcxxuCuv1Sf6Mm8?=
 =?us-ascii?Q?OjWMGS8n1rJbGpM6Ug6hS1Qum09N1XUAzEnvJjmf0leh8tPq/N/lX05ndFHx?=
 =?us-ascii?Q?OAlKkAzqe/BZjkJpMNODd+vMEMzvWj6c9CokqcBhTECbfF8eOXQyZAYlSdVs?=
 =?us-ascii?Q?WkvdnK8a3hFl4lwqHDEO52SN87mqt+4ISArip57+wY1NZxMA5j42gEzGbOFu?=
 =?us-ascii?Q?QfnXKQ7WZMlWV+oE0XTtgS1kf+aL52BYxJeBuzYXKmbN7mWnH2jT3Dh+gTvJ?=
 =?us-ascii?Q?+DU9mxcG8FgOaKaC8MfJzsC7/dn5b/Ztqrcl3ztGWVZxrjkv8NFy3BzKAj34?=
 =?us-ascii?Q?hg6sr1dlRcIXti/vfOBS8UIucEIum9AMc59pZGBRpChslprwTt+SiY7QSiw+?=
 =?us-ascii?Q?RkWYT4g5WNNS19saLvsb1xYwd6TzW1zp0UA0C07E97WCzW1CT3+diYSHlPeg?=
 =?us-ascii?Q?uqY6KvlYiOSiDv5QON0eFpbd2Kmfummv52xWJaC2GKCJ9KxXBkDyjIOFKIZ5?=
 =?us-ascii?Q?M9pFN5EJdolHN/ATuLGXsmBHDWURfALyar/rC+/1eFM3+hcYtBmpADj0Z95v?=
 =?us-ascii?Q?ryA3stHxzi7Uu2/XNjo9/ZA9YtdOlu5ZX0ltz0z/RHqfVykvH5x/w2pVRAJ0?=
 =?us-ascii?Q?Nsi6F4aT1uejMNuNaycR74D5Ry4giXIF9X2JTYRmozPnkP5pWMl3Dt4q971W?=
 =?us-ascii?Q?Lc8a/nt9WVuBCGIQn4a9C1E=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAZP287MB0023785699120C67AC6A8B7ED8E9AMAZP287MB0023INDP_"
MIME-Version: 1.0
X-OriginatorOrg: attendees-techexpodbs.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZP287MB0023.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd6565e-b671-42f1-d444-08dbad94e88d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 22:18:47.1307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 68936634-4f7d-4432-90c2-2d9cb864a66d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lal+RdZ7uwylp60/mi+jRQSBJQ1JmVumCppzC9ehxCNGFXt77oxxbN/mgp0P+dawBnt1ISM1zHT8MQ2WfGr+kYv7SNFHtffZHGyFH6FrnEtTcG8HVPtCfVgY5+6O/YmmWUK72c6ufXf33ZqUrQXxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1773

--_000_MAZP287MB0023785699120C67AC6A8B7ED8E9AMAZP287MB0023INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there,
Reach your target audience and maximize your sales/revenue with our clean a=
nd reliable contact database. We have compiled a list of 2574 contacts who =
are attending Fastener Fair Mexico 2023
If interested, I can share the pricing and guarantees.
Looking for your response.
Kind Regards,
Olivia Johnson - B2B Marketing & Tradeshow Specialist
If you do not wish to receive these messages, reply back with remove and we=
 will make sure you don't receive any more emails from our end.


--_000_MAZP287MB0023785699120C67AC6A8B7ED8E9AMAZP287MB0023INDP_
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
 there,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Re=
ach your target audience and maximize your sales/revenue with our clean and=
 reliable contact database. We have compiled a list
 of <b><span style=3D"background:yellow;mso-highlight:yellow">2574</span> <=
/b>contacts who are attending
<b><span style=3D"background:yellow;mso-highlight:yellow">Fastener Fair Mex=
ico 2023</span></b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">If=
 interested, I can share the pricing and guarantees.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Lo=
oking for your response.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB" style=3D"font-size:12.0pt;line-=
height:106%;font-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Ki=
nd Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;line-height:106%;fon=
t-family:&quot;Times New Roman&quot;,serif;color:#1F497D">Olivia Johnson - =
B2B Marketing &amp; Tradeshow Specialist</span><span lang=3D"EN-GB" style=
=3D"font-size:12.0pt;line-height:106%;font-family:&quot;Times New Roman&quo=
t;,serif;color:#1F497D"><o:p></o:p></span></p>
<h3><span lang=3D"EN-GB" style=3D"color:#BFBFBF">If you do not wish to rece=
ive these messages, reply back with remove and we will make sure you don&#8=
217;t receive any more emails from our end.<o:p></o:p></span></h3>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MAZP287MB0023785699120C67AC6A8B7ED8E9AMAZP287MB0023INDP_--
