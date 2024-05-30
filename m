Return-Path: <SRS0=b51/=NB=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A0AC25B74
	for <linux-firmware@archiver.kernel.org>; Thu, 30 May 2024 19:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97CE6C32781; Thu, 30 May 2024 19:28:05 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6FBDFC2BBFC;
	Thu, 30 May 2024 19:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6FBDFC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnIjjFdw4+BKmtdy1hwj2qE7EDXKXSem/hHZ9Tl3mSriaPqzZTCuqEsS4VaIWEzzQhy+F8W42MkA/OTVt4R6lGufV3FORD6iJkKutZkR0CD/YMnfUeQzJ6hIi+IBPq2YhLMilQiOk/9CnuleIdoJoy71Khv6PZyrjM/PoKtm28EfhF3eaFsaCPNcHl+7UvAG0HMeAw/ulvIgOfbYqLNMXYGcVM6I5LORQOLV3NV2mkxvErEh7BgQew6yDwXTEb7qrhdmU1ZnXbgre757O+PtK5f8KHMQyXvUme6gVRI5R0+n416vB+pJV+WN3lufFvYsEUbnBUjCX6Tt0g//SLo51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFqwIKbA2MI4BGSAGs0YnT40f55aYnttrUJQoT+v38Y=;
 b=ZeffN+GCoVSepvpBJTvmhW83a7/XT1SiYgzI5sqdV38OLSaHTjaGho5vuE+j79MX+SXx9W+7oKrJWSmhQIv6Vlc3PGZX5VK4rSROquE9ggOgn/kbaSZL+GcrbutArHMsz2eMKLe1R2VkIYrRA/MprJamfHV7ULeUDf/58y1M5jHuNchsieMxPefbCLgr+Buqh4FsvYyjRTAf3mA130VSzrPOPndkcdtgNQmcpMVyCA99iDwo80fsehRDSvXA18MXvViduoc1LfM5qERJYxVOJBCl+QMgzYdosewWfFytRZHdQqFCjmd14JohAeehBGg1WCQNN569udZg2PpF2HtCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFqwIKbA2MI4BGSAGs0YnT40f55aYnttrUJQoT+v38Y=;
 b=qy1Sc/TrgZH2rBUt8Ur7Kkm2ny10FXWxqR6rwGhzeMH4yHMj4QVEfLfvXs4Smf95jcF4AOxaex4J/RKTOPyCwEMi6r6hgddgQlJC4afuNF1V8jciGuh/MdW33APSZp9UUa2cJ8Hm2Qjv655oWpNAal6RFw1U0cx3Vmfjq28eh34=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 19:28:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 19:28:00 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "chris.lu@mediatek.com" <chris.lu@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Josh Boyer <jwboyer@kernel.org>, Linux Firmware
	<linux-firmware@kernel.org>
Subject: Mediatek firmware issue
Thread-Topic: Mediatek firmware issue
Thread-Index: Adqyx14L8BVoUudKRcCuJ5J6HmvuTg==
Date: Thu, 30 May 2024 19:28:00 +0000
Message-ID:
 <MN0PR12MB6101012CDAF72CF60F968AA7E2F32@MN0PR12MB6101.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=6cc396fe-220c-48db-adf7-087b5328ee0e;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-05-30T19:27:18Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|IA1PR12MB7592:EE_
x-ms-office365-filtering-correlation-id: 80ff937c-79f8-4244-bb27-08dc80de9e72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?co0ZTPvrDmlsgaEPEMH/WmnW6SIMESJLNJvDCVWwVM1pDr2THEdO1L1s3VH3?=
 =?us-ascii?Q?zSa9hV46uXvLiY0wNzbjZggX7aqaRcw0C7aVWArMYMwiqWakI8+0DZrfnrjJ?=
 =?us-ascii?Q?184sFSVNBYuKtr0DoWGF5NgnLa6B8tApbQdHhrGqrmYHaV49k2Slf8eAg9fr?=
 =?us-ascii?Q?fNR+6MNrGjATEOM+1ABvshgNhe028jNUV6X9yvqyq92CD5CSiGXrUUYpKoVW?=
 =?us-ascii?Q?voN4jJ2R+bUrRhk5u0EJdV+pQHlGf0sVLQ61NUf95ICaKt46PAx139pZnU+L?=
 =?us-ascii?Q?6mV9Z3r/aCFuLkuYrW5S+4jdkLX8RuCNCAjzWgbitmoiT0RikAGk8SP+fe34?=
 =?us-ascii?Q?/2jwX2gydhonxaRPtYPl6MJNzD4H1rrNfVTPgERBNQ8x3o3s+E3EK44x7pu4?=
 =?us-ascii?Q?zpw4xLva3Ff7oHwR/qlwXfaBfGWUgyLIvIIeXalAzJWz6OIhNOBNO5pRBETE?=
 =?us-ascii?Q?0ISWxKIHVy3Tbh/MZtSmCqrBXm48jSkEPzMZBoZCjHgMTJBos0+mt5KnBoSj?=
 =?us-ascii?Q?k0udnAYJ+sS/p8yZOj4zA/sxLzWa/k6p3ERU8h7/A42nNgQ92a/UyUbq/F7J?=
 =?us-ascii?Q?oPzBBfI3TvMo/3YEj6vONCoc+pQWN93KY5JoVXHFS+4kJx0/JEyrQwR4h0a0?=
 =?us-ascii?Q?cLUhf5gy0TauPysnT+sRo7S0N3uXxR6Mn+eLAtW5RlLVQvkVLZtdo/xSV6B5?=
 =?us-ascii?Q?pJnI1cJFjvQkQoxCpdQy0ku0B7KJR++jQTdLHALaoe5aRWFKbzxLpfEfFLei?=
 =?us-ascii?Q?CTyxlrmZmtA7jVK66j8cCJayu4Z23VONawLAroVXb6E2bZNkRA8dTTHhwF3o?=
 =?us-ascii?Q?sUg5QK2mZW2WDl0WgIQZ7zrKEehQeP+lsrzjVnMZOVrryh5AvyboTJZo2WnT?=
 =?us-ascii?Q?2pH+AKmz5gbKfqIAUFc2yKyyTw/F2eEMWfU7iAYuK8srN+fogFFUg+DcaN0q?=
 =?us-ascii?Q?1F281umH5kHps2H0JAzkHZ8yR7b0yukOpTAUnvDrAmH/MrzxDQXAAC8khH//?=
 =?us-ascii?Q?iqZ4ctxXSmc4PuOF03JK4u4YLVQrjB6tbfZ/lb+BzfSGoZf5CHl4hHcrOaPu?=
 =?us-ascii?Q?OWR62M7eR8hhVKKYiXS0n4q8XzAQ3tMY9TG2D9SOk1LL3BPlqFeP2xSoaWmN?=
 =?us-ascii?Q?/f5USNHEgwrS73rYBKJ/cgGnXEdtIiOES92EGESvkm5zvSOYtXnwzcrLqGrs?=
 =?us-ascii?Q?7yKSNi++F5B68UZ4VTTs+VaIQUAvCfARtkpVUsL8du0VpFnn5UcqDEvMb7NI?=
 =?us-ascii?Q?qPWslvTBTF48n63AMy1AWfQkNS1Lsd58U9+xxpalLQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?loVBcPmNgv9wm0HUKt5sDBBOFpdASrepmuA5W6KBjaVpHMGZ1TKk2Vkiv4zr?=
 =?us-ascii?Q?5SScjsjy6/nSYWmpNgO+4G03DROQ2i/jCJaXHzCKNQGQK4Wh+vtPXB5U+N8g?=
 =?us-ascii?Q?oQHz8wBjS+tL7UhFXv1ABCMb5vEQTaT+ZSibcM/ErMagjdiAOb1maMLyAlz2?=
 =?us-ascii?Q?5vyyw+52hqQ7WVwW1vjjpCztcFTwbwwb5h2ZQZEZ8goRbCCv5AlEUxlNPbPF?=
 =?us-ascii?Q?lEPlUI2x1imZCtcnARIpzw4ZRxjOrTLRSADBVE8PncQVhlqE6proEznlYCu6?=
 =?us-ascii?Q?PXmcIQ/XB+4kf8r64lNH9cE3QrX4UGhFDcdYbVFEhEkUAJttxw4dibhQoNHm?=
 =?us-ascii?Q?ZFuQYKoObIU3kRg4HXduZPl05qqLD+BpZrTeuh5drk+sLZBQmxn+AsN3CqwD?=
 =?us-ascii?Q?ES+58v32DJCKDw2tR0gZcfpGxu4hTffdJUocxIckYhUtrrakywixMk36i2h/?=
 =?us-ascii?Q?DHjIEVsJaEwcNv2XkxG+Y7J1pcQaBJxOMuXvEylZPlomLJWI1dAVR92PQFnV?=
 =?us-ascii?Q?bg/4TZ8Dje80ZOJs2BqDXPDbRFlVVJBa/vaQTkOLrKQDg/7MqHsStAddiE0K?=
 =?us-ascii?Q?S5tVVT06b0sCmS9XLvk+QcWFVVbXNFW3TNpTQUyqbBEvWvZ/NPAdviFffrxl?=
 =?us-ascii?Q?L29jZ92uihr8z2WlNv9QlsIr5ClY+rb9bQ1NoJ7THGWqO5JLOPc9ULjVJ4X5?=
 =?us-ascii?Q?qqHhZ2D1/6EtnJvSUHYWj6Abno1y9i2pIXv5M6sPpLVOiM6zbSObubaAKWtv?=
 =?us-ascii?Q?gP5VSJclHFjhYRZiIIJ5hgeoqKB8ywGdvKTIXjoq7j+NV6ddhqZn+4WRfAnx?=
 =?us-ascii?Q?pcPYIfUAdpzw6Wku+wjI6svdpv3SnqVkatE81sQBM8s+c7aX4iiKQs9LDagr?=
 =?us-ascii?Q?9g33gJcHjQ4dit+Swf1mgroPO/8G4Dsobr2EEnJykx22/xQ0NWlChembzwd4?=
 =?us-ascii?Q?6AwVIBLOCx1SHEdJxDKBO97FX3WggIJzcv0unnp3Pa6UdWdHrhjBMyaQQm+B?=
 =?us-ascii?Q?HILJYl5XOl5fNj0K3EHxRxi+q2BydzWSfGIjkDW/wygNoHja/Cij/VTbh5hg?=
 =?us-ascii?Q?7Oy0JM6unITdNMlIL3glH3UFBhcEccytfunTmDdGGLBYR03MCAHvIoka8OWN?=
 =?us-ascii?Q?2oGY/aFNtEK6Tp9e4zBu3sFIcWHlDJbZeCIK9X3igA7WY98zW+2Nph/snpkP?=
 =?us-ascii?Q?EnMn37JCdF+UAnnILOK43A/2flFrOdMLYqKbch5beUeJMZLxvCrQ/2e5w4iI?=
 =?us-ascii?Q?hjWXzOMbcaF6H3h5iD0OprmJkaMBFeuo2IHpXnAPR+BIROZ9a8jvWDdcYteu?=
 =?us-ascii?Q?W89eHX4tlGN6Ezkau4hoifzUo0JUXQR5HQqky4DYNawqGIuELseLsqKoFua8?=
 =?us-ascii?Q?9wUrK2NpopCnYLJy/bHkwuioiSBk5ivKJyTsMNMp49fMaaWJx0f4ap1CCR+G?=
 =?us-ascii?Q?SphGxQI92+cx9+8EN7jJWPenMY6sD9zcQQWum/zfLxItblEbsmoydbrLAKDm?=
 =?us-ascii?Q?uLuCb7oU1wKuyS+XcE7FHSxKeGp9R8qQfrsu1RLLZN95eV6Q0DSBYf+H2e1J?=
 =?us-ascii?Q?24Wx1tD+7qFoASQXGXY=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MN0PR12MB6101012CDAF72CF60F968AA7E2F32MN0PR12MB6101namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ff937c-79f8-4244-bb27-08dc80de9e72
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 19:28:00.8834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3JH+v7e/nrKF716rIWIPS0sywvpwadyCquQDp/mwTYDaAq6qDLHQHBSJlWf1Lfe7cJ+6eH957I3t2KLHjIy6Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592

--_000_MN0PR12MB6101012CDAF72CF60F968AA7E2F32MN0PR12MB6101namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Hi Chris,

There have been reports of a problem with a recent firmware upload.  It see=
ms like it might be missing a symlink or binary or something.  Can you take=
 a look?

linux-firmware: update firmware for mediatek bluetooth chip (MT7921) (!173)=
 * Merge requests * kernel-firmware / Linux Firmware * GitLab<https://gitla=
b.com/kernel-firmware/linux-firmware/-/merge_requests/173#note_1929554455>

Thanks,

--_000_MN0PR12MB6101012CDAF72CF60F968AA7E2F32MN0PR12MB6101namp_
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
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
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Chris,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There have been reports of a problem with a recent f=
irmware upload.&nbsp; It seems like it might be missing a symlink or binary=
 or something.&nbsp; Can you take a look?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://gitlab.com/kernel-firmware/linux-=
firmware/-/merge_requests/173#note_1929554455">linux-firmware: update firmw=
are for mediatek bluetooth chip (MT7921) (!173) &middot; Merge requests &mi=
ddot; kernel-firmware / Linux Firmware &middot; GitLab</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_MN0PR12MB6101012CDAF72CF60F968AA7E2F32MN0PR12MB6101namp_--
