Return-Path: <SRS0=Z5Lq=PN=nxp.com=florinel.iordache@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5449C433F5
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Oct 2021 08:51:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A3B8560FBF; Mon, 25 Oct 2021 08:51:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F07D60F46;
	Mon, 25 Oct 2021 08:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F07D60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQVYo13Lja+MNlGBIgcbsjvf863YwXlFEC3t4uXnk1kWCrCoZtIk3Cr3o0ggVXy9gScVnoqbbSsUAGF19igtPFkOn2YquHqA9LRJQTw4mH2X3rcHWHq+jkaSGf94zXlOrPpDAhI4rJnZc3Se6Dee5Yube6O2GlvFFvP1S1SKUYwXVtHM0fUzpWMdSMoq/xd1rOio3jqzhZ1vKEg1P6lmb3KRjrob+mhTWT3v45RF/1m9aB3lS1IpdaDGzWxHii3VNmb8xyjgQMMmnCHv5BilEkFC63uhKnWfy1rTwc8kVKti3sXlH8vTgPiRLyQVPqmsRHylO9sNis/mI10FN2Xurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVKcLfInPbL7qakG9C+yzX0sdE+f6qY9pvg5CpoTMTs=;
 b=Rjmv+uTeThMKWxPXnYwyVawjNg6Vs/GStOH+giYwAvmpUWf+ECiKKlK7rFfR60+LLJS3sez0NQ2woVjduQYV3GF1Uk7P2VFDWenTJ9kQDuiXrsySbKno/M/XcpU2n5626WVaU0ojmfKNpuoWWwzGE9V7zyhs+oeD00qL5aCfgkwuldmOTuzVmfBWWO1ejbBP9TpvJF6kFNBH8BxevQ7nXk7Y/l+WI19jKU0+ZmY7KQINBKHIHiH2DYmbx8yFQkOoGQaJ/kTrDSV6BLBRYAtYJPMrwqwZhtdcjDNZgm54A6xu5UDx24xvxVw7X05FOPn64lSAyzhQstX3Yh3ERVdSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVKcLfInPbL7qakG9C+yzX0sdE+f6qY9pvg5CpoTMTs=;
 b=Z5n0VzC1V17NTPSzFIPHCx2bqJGqT6IN/A1AgK3Tot3Pscqzd1pchVAbbJvHZ7PVfcpPjWdt9rCHH8jEvOl+yfFqHnTW3v1gk3SkSkG6q93B+ElidJJpb8FxSGQeQ0+50gWc84cKPiHxCuC8RquVQyaC9yn+SdScAdqqNYNN+ok=
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com (2603:10a6:20b:242::13)
 by AM0PR04MB5364.eurprd04.prod.outlook.com (2603:10a6:208:11f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 08:51:39 +0000
Received: from AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::a435:74ba:7176:2643]) by AM8PR04MB8036.eurprd04.prod.outlook.com
 ([fe80::a435:74ba:7176:2643%7]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 08:51:39 +0000
From: Florinel Iordache <florinel.iordache@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "jwboyer@kernel.org" <jwboyer@kernel.org>
Subject: pull request: updated MC firmware for NXP DPAA2 SoCs to version
 10.28.1
Thread-Topic: pull request: updated MC firmware for NXP DPAA2 SoCs to version
 10.28.1
Thread-Index: AdfJfLeg6Qo+cZr+RZ2XuwKrxjRY+Q==
Date: Mon, 25 Oct 2021 08:51:39 +0000
Message-ID:
 <AM8PR04MB8036F9757CB52BC241CFAED6FB839@AM8PR04MB8036.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d690d332-bb8f-4669-84f3-08d99794a912
x-ms-traffictypediagnostic: AM0PR04MB5364:
x-microsoft-antispam-prvs:
 <AM0PR04MB536419E9A19D0E97908765CBFB839@AM0PR04MB5364.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dUtNRPgzs4J72VxjFUf41jP/8TnIcpLbQNRu21FktKCNE1/5+bB94F1tm2kXD6v2+FiutFms+yiFQwEOMJOTrOgDVp7UWIejAE/9ZEr0ep5IwgkC8oWD47os/yMM5NleoVmTLJRF/2j0TK5GV2bcutLQYtzcpbtPPxUKmQecio0EM4lTKKUbeXncL3vv/Dnc+uZW9j0aoiR8d+qPTw44LII5SUZVvkdW6Gqd9aulegbG7ca7Udxc4spsoik0sI6mF9F1He7v9dHa7E5G9ZMsCrik4OB8I+HE+jUce/JD62739jM3fLsz1LMvBR8Y+o2vtJbMMH0DCvNhTZDmFLrDJVF8TFNuson/Dqn6nORm+02EqIpvikvJYIti1lQb8H0JVkHhtw6nKbKTyyM3IUAefyLKjOukuRWHDNznqxCpqMdIFtS7YqZvpS+3HgZtfnv/DWyZIdIhvLqOBarXO5qUw/rd2zD+Qrxfy0ilow//URo1H0tTW7MSBgBdEBR/NhkzPTTh8Uhic27y38BjxVQDws3zb8Fush77akxRdKrpXXg6mvg6l4DIS3yD9qHTf8qFWUF4wcJGmhwkaaSDPwxsUb+zKrd9RGJJk/YMKe49i3zvON7ZG1L/KX/ozYf9mDHe0ztwNZODEIRXCkrld03IbIaPHA9ti3os6Jhrd2yZiA2VAS4frieZA6jVcJDSORJbicCsA8AkZbBRAPGiAjMq6W1LF/VG1cQ6CpRDuOmcUP803xDoT9YTvTFAmq9Jr8pLJay9+HzbcKZFRlF9mg4U6+mcVy+3gUwjApDFmX3B8Ko=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB8036.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(366004)(4326008)(186003)(5660300002)(26005)(71200400001)(316002)(15650500001)(8676002)(122000001)(4001150100001)(8936002)(6506007)(38070700005)(38100700002)(66946007)(76116006)(966005)(6916009)(2906002)(508600001)(86362001)(166002)(83380400001)(44832011)(64756008)(66476007)(66446008)(450100002)(66556008)(52536014)(9686003)(55016002)(7696005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fK6hO4oxxlb2VvtAnJrrK7pYJhKEL6YtrmDpCMPrxp+b1WVPtlThtvwh4pAO?=
 =?us-ascii?Q?kopIav2CNh4cjTqXWrLR50Y9DcawxIP61iAwFuPG6FaBcPohf6CHDjeND8S5?=
 =?us-ascii?Q?O7QkJvLdk8byo45PUrqVE4kaEATb75dMp2vzBKI6rnAJVRsKQfEnzi4EptJz?=
 =?us-ascii?Q?HUN88yCrghy1cYiqxJW+kLzcUxN6pW1mps/FjtOF2pJy7t96oDlKNA4vP1hq?=
 =?us-ascii?Q?N6AupAuQtnN552/79loR3AmQl4QrpBYyfnz4pSn8rxLGiUe7V4CghXqqulF0?=
 =?us-ascii?Q?cBy8STIv+C5sVsPsmTJ2cjeGNeTaQJM6B5cpx1iJ+h/G2Gl3aAXBvG2AE0cT?=
 =?us-ascii?Q?q1KFr2Tky3wq/pg9RovCdxGkLJOIQIc68JtuVaEqlwnOGW+WcnG9Tnq74RfG?=
 =?us-ascii?Q?Inyq422wyRiCfBk2qx/nNevmBJztApTtPnsDy+mFH3ttsQSstHt0u5x3cUGm?=
 =?us-ascii?Q?dA3TiarZTRH8zVm30bcgo7L2OE3ltQPj1LUDjn2k42C1pnn2+FT52K2CA9AV?=
 =?us-ascii?Q?9do116EwYcuGmV+v9701W27qzPfAfMyF4rro7u3wng1I1Gs3o/RaFd6hBw5/?=
 =?us-ascii?Q?ZmrHJ5Ab7Mh+rfbAxPZY7Zc49iFd0Fak2/lHbq5e85JhyKntKsQikTj83Vlc?=
 =?us-ascii?Q?/QyJG+Jb69cG83pgLW3/3aILfTZYJI8ykpoG/n8ubcIf3dYUv9RfiNkO7ufM?=
 =?us-ascii?Q?5OfjmDWfuGOtaC/x6WG91IUN+tK7GB7Gmsd9oSiQGI2ZseXp4f+aZJwuQyAp?=
 =?us-ascii?Q?nwCYdSRz7i3uH84Z1kOEH0hn+uxgKy4w3C99NwdOcQnc5ZyV7o6sikJEse5O?=
 =?us-ascii?Q?noby4qlg4pU1NWTnjRdWxy2Y9FR6Xk3kAy9/A+CczEL0UrKg0fzp3UQmjRqC?=
 =?us-ascii?Q?C3RpMi81mS8ASuhh8qAYnVZgtPIAyWk+JY50d8dD/mYYvHLPIsp8FEaWmOpw?=
 =?us-ascii?Q?8o5CuyP3eP0VLsgFEpwwdawM6xyHePA58WD9MwFOWmm8Ow8gqPjP+mvd4Cho?=
 =?us-ascii?Q?HDVpvnVYUUVzPfHWprPlbUOmI9c3pG8wqlLA4R68O0kgkC48IG0P6Cj/aVP8?=
 =?us-ascii?Q?Dw2jAGkDicCP9w5qZ5whmdiNtC5S9ZrbE+f8c+mwS1Cb4bC/D+sRcuhoZ44H?=
 =?us-ascii?Q?DR8gvHgutLh6T/N0XKfXvIvTGn5MDzrBy40gqbm6ibjfreabqAV7NGN9KhFD?=
 =?us-ascii?Q?uxnT8PuAi2jroK5bXqx6bOtg3exxKPi0yVjOOJ8PGZUXVDIT5/vd5cmKxjI1?=
 =?us-ascii?Q?d7o3CAZ5iCHoHU2iGYnqhP2o0GuHoJGIbBCOO9gmbff9b//Pbo/TqguPtS+8?=
 =?us-ascii?Q?/dxa6hDXXpNWXWv/mucV1kVD+x0g1DbFWI2JNMYh5WLJO+jkn5eO/LSghZ/U?=
 =?us-ascii?Q?kdFNvUxwptNI4gMSAFmExvZPmjllXA3Xr6TZOZEaxYlhZiLIAKVjfe1C8lD2?=
 =?us-ascii?Q?qKl39oOFMcAkJ/My7nOjXBTvmGi0j/qr+yHfuGl7JfeQx7RdfNjYADSQb/Af?=
 =?us-ascii?Q?Euvv0bmsPiuymnxjaTNkDVH+588WVrmXkdwuU+nZPCvMTIMrv01Zp1sHDxZV?=
 =?us-ascii?Q?BCWniKrX1s82L/MXgcYxLcIZhFisiQOkYuP46ZNPpehFXk9aFnpVYm8NCDKt?=
 =?us-ascii?Q?achi+rU6gjaDcuAr2sktmnlP+7F80DV5QlquI7opv7SwSILaQrC5nOiZ60yW?=
 =?us-ascii?Q?I1MUzQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AM8PR04MB8036F9757CB52BC241CFAED6FB839AM8PR04MB8036eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB8036.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d690d332-bb8f-4669-84f3-08d99794a912
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 08:51:39.6187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5iuQHJ4Vrt6WJZTOkOFy6Bo7smsyK6VSo5d94v0WYROJtTrkP+Rn1DRvp8kI9ZwObM9QGHKvUy3wHq2fKlh0Yd6fuByPHyFt8BWMI6/BTKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5364

--_000_AM8PR04MB8036F9757CB52BC241CFAED6FB839AM8PR04MB8036eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Updated Management Complex firmware for NXP DPAA2 SoCs to version 10.28.1.
Please pull or let me know of any issues.

Thanks!

The following changes since commit d34196f55db16f2344483f94718c2b2263a5489e=
:

  linux-firmware: update firmware for MT7921 WiFi device (2021-10-18 09:23:=
18 -0400)

are available in the Git repository at:

  https://github.com/NXP/linux-firmware.git nxp_mc

for you to fetch changes up to dd298a8cfb2fb8503289e16321815e5a02883555:

  linux-firmware: Update NXP Management Complex firmware to version 10.28.1=
 (2021-10-22 16:23:42 +0300)

----------------------------------------------------------------
Florinel Iordache (1):
      linux-firmware: Update NXP Management Complex firmware to version 10.=
28.1

WHENCE                          |   3 +++
dpaa2/mc/mc_10.28.1_ls1088a.itb | Bin 0 -> 1029568 bytes
dpaa2/mc/mc_10.28.1_ls2088a.itb | Bin 0 -> 1166192 bytes
dpaa2/mc/mc_10.28.1_lx2160a.itb | Bin 0 -> 1169584 bytes
4 files changed, 3 insertions(+)
create mode 100644 dpaa2/mc/mc_10.28.1_ls1088a.itb
create mode 100644 dpaa2/mc/mc_10.28.1_ls2088a.itb
create mode 100644 dpaa2/mc/mc_10.28.1_lx2160a.itb

--_000_AM8PR04MB8036F9757CB52BC241CFAED6FB839AM8PR04MB8036eurp_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
<p class=3D"MsoNormal">Updated Management Complex firmware for NXP DPAA2 So=
Cs to version 10.28.1.<o:p></o:p></p>
<p class=3D"MsoNormal">Please pull or let me know of any issues.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks!<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The following changes since commit d34196f55db16f234=
4483f94718c2b2263a5489e:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; linux-firmware: update firmware for MT7921 Wi=
Fi device (2021-10-18 09:23:18 -0400)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">are available in the Git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"https://github.com/NXP/linux-firmw=
are.git">https://github.com/NXP/linux-firmware.git</a> nxp_mc<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to dd298a8cfb2fb8503289e=
16321815e5a02883555:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; linux-firmware: Update NXP Management Complex=
 firmware to version 10.28.1 (2021-10-22 16:23:42 +0300)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<o:p></o:p></p>
<p class=3D"MsoNormal">Florinel Iordache (1):<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linux-firmware: Updat=
e NXP Management Complex firmware to version 10.28.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +++<o:p></o:p></p>
<p class=3D"MsoNormal">dpaa2/mc/mc_10.28.1_ls1088a.itb | Bin 0 -&gt; 102956=
8 bytes<o:p></o:p></p>
<p class=3D"MsoNormal">dpaa2/mc/mc_10.28.1_ls2088a.itb | Bin 0 -&gt; 116619=
2 bytes<o:p></o:p></p>
<p class=3D"MsoNormal">dpaa2/mc/mc_10.28.1_lx2160a.itb | Bin 0 -&gt; 116958=
4 bytes<o:p></o:p></p>
<p class=3D"MsoNormal">4 files changed, 3 insertions(+)<o:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 dpaa2/mc/mc_10.28.1_ls1088a.itb<o=
:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 dpaa2/mc/mc_10.28.1_ls2088a.itb<o=
:p></o:p></p>
<p class=3D"MsoNormal">create mode 100644 dpaa2/mc/mc_10.28.1_lx2160a.itb<o=
:p></o:p></p>
</div>
</body>
</html>

--_000_AM8PR04MB8036F9757CB52BC241CFAED6FB839AM8PR04MB8036eurp_--
