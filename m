Return-Path: <SRS0=weG3=DR=amd.com=Aurabindo.Pillai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E801C001E0
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Jul 2023 14:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E732DC433CA; Mon, 31 Jul 2023 14:55:41 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3A69C433C7;
	Mon, 31 Jul 2023 14:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3A69C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g93KXCxluFfzMfPNOK2RFazs5EVj6GrY0TRG6t7EHWyfMLeMsW58hYno3EPOPKPCZoUdmTKR32Wqh3MnJlQt+9oIjyDMJ5MlAQCWVlp8/hOxJ1grRnCajiQ/TqJH1RRT9IyHH7TY3Xd0xCDs3FQJaKYMDkuEjphBqNtU4ItlXL7sIaJrishtYK27bvWJ6MHpxAY7dUqj3XQu1PV0avR7vmMwBs1XEVxBsKDjWNS32/PDBPJBql9J4z58XNrWdnEF3R78iipkOmVbY64XEAGM1EVTRDL9QRHAUB5GfTJ28Bx+zo+f5GxbHsUAaMHkcpGcfkVgvLbWmSrUZLwiGdnLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKVd52kgQ/ztA9Sy+3okIwoppd2WbrYJKX8NA93ZLQ4=;
 b=WQkvTnzUrCk0OPrY953N30gubPvnDJZurJcCzle7RX/p5R4kQ4rbK9+fqLd+jeOE7exN7YEwLqZy/We5Dr1LH5dYrcAx/8BGW2TglgtZwLb4AceEjaHYj6cmwctqx51PmEo5GIFx5b2eW3JdAkxsjDW0RGNB7Ihnjm9ZRV1fp1jcKFFwEqeIXSwReWHX7ss3hWyN4TdleMFzfy+Dz5mtOtfMsypNHICDoDeZMJxHCYCTQe5meyBqeh3WGt+wgx1+UuexDMoaLI5p9AaCl6Eg4JqApuOFNsfBPtJ37zPSAL/2mYiAvLanUjDxcab7MyaqUr4qtYV/azvqwWWmE4fxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKVd52kgQ/ztA9Sy+3okIwoppd2WbrYJKX8NA93ZLQ4=;
 b=t4l+3KCiJpIxT4VmL0UArnIGiZ+nc83vbDb8tAB/pVWtY6eVmKrHVRgTEafgA/pJchIZxsABPzoNWVQi8B5w1ACdYQ0RKtyRMeTWsdLvuFSv7S9fCxwCs4XPv6tplhJBSWv2lF/w/M80fmY/mTRPNjZ52mitpSfyaqy21ur6pgg=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 14:55:37 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1322:914a:589a:7146]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::1322:914a:589a:7146%5]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 14:55:37 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, Josh Boyer
	<jwboyer@kernel.org>, Linux Firmware <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: AMDGPU DCN firmware update WW30
Thread-Topic: AMDGPU DCN firmware update WW30
Thread-Index: AQHZwZDzhqsze8+uYEqGei7zMyd44q/SsJKAgAFKOlk=
Date: Mon, 31 Jul 2023 14:55:37 +0000
Message-ID:
 <CH0PR12MB5284E5DB9043B3D5997A660F8B05A@CH0PR12MB5284.namprd12.prod.outlook.com>
References:
 <CH0PR12MB5284AF2A1EA71C470BFF7DBD8B06A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <9c20a7d3-a379-c58b-131e-ade683b93bf3@amd.com>
In-Reply-To: <9c20a7d3-a379-c58b-131e-ade683b93bf3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-31T14:55:36.415Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|IA1PR12MB6210:EE_
x-ms-office365-filtering-correlation-id: 52841ac2-950d-457e-51ae-08db91d6335f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 7jR5MxW8UGgFaKEY6v4p/Vzc7Xan08H/zA+qogx7VzE6q1irZ7quzi0Y1GDQ9EGhjpm3NQ9UGS5+aguH5MbS2Df2cjuOxtbHBEO0Qo1/EXdgXtaAvCf7v0g1i1p/4rrCzW6JS7T4z9cHVDTe/LzGbcJ03C8k/E4/e2qNhZprzlIoUyheKIfWh75ty44XVstk3IpdeVzEiYXf7dVzaMouZ1I8+NVHwy8mXgjY4jXmyh02N4ILd0H7BaQQ09n0IHcpwx6iBsSRhTETxitpuvnFlttmFATElc4chfQaSFOs4qjaW+Qw1rSdTDzeXwxNWTpcLww770SoJ65Qe3WxBYHK+c0D4RIv5zIrOa7Hz51snPiwb1/EYlcdUKMgF94+pMGRn+4XHpNeMljXdyqu6rceP7FmEfj2EcyVB5OL8+L0obGJ5AiqgLNSouHpaLGR2ntHL8NbIwYBcGOyfmbefpbbE6dvsS0fDJFzd5QWPYxcGwnqUFi1qyDBrFEgLrS9D1aTdfuU/uX2VD0KV7uJ6D5LCix5DaEmVftB0Zh12nAWedrTf9cBvXOPkGm+JYxJsnpiJ+PBZajrx3XIFfYwP0KsGUh5nurIBlPQpuKFPQBGYNi7JXxgE6kOqMj1GZmpaxFU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(5660300002)(52536014)(53546011)(8936002)(6506007)(186003)(8676002)(26005)(83380400001)(316002)(478600001)(76116006)(450100002)(4326008)(66946007)(66446008)(91956017)(110136005)(66556008)(66476007)(64756008)(7696005)(71200400001)(9686003)(41300700001)(86362001)(33656002)(55016003)(38070700005)(15650500001)(2906002)(4744005)(38100700002)(122000001)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IwzU6DvnpHmvNN1LwnZ5fqM8e5/fsMno9QbrZqKzPipqSdcuh00Pu+chcd0k?=
 =?us-ascii?Q?ilzWRERVXcgevgZ9jNN8qSgiV+Ic8k57QG5OGLQ2CDT0gj4/K6a1hGqMrmIT?=
 =?us-ascii?Q?ImoO/irIW/gsZekU9by3qQQcN2lWryDg7nBY+2JVsWw2kom8qj8t29JgdOUG?=
 =?us-ascii?Q?cxmZUV1Dm8iF9sduBW7cAEgidNhnrwkrgXY5Jslt7cRV2xNSxY2apBq0dS5F?=
 =?us-ascii?Q?es/sdYCZoP62FnQ25nd1paMgVra6AQmZQnS9iBVr2gUUob9W4BX2mHOmTXDr?=
 =?us-ascii?Q?Ee5BV9QWOYZl7CEhSHWbUZXGOuPCxqgYPwZWCHeJqeL7L6000Ps7vVpvN/No?=
 =?us-ascii?Q?QjH9PPPgW2ONGQ2IpF2NEfdUTWk6RB3Cass21NWK8ZulUOSQ6AqiwPdv12pS?=
 =?us-ascii?Q?6ovuEDeQvy8lPI+HqbJXf2BdSZVq2J2AJv8OSiI/8AxvZdEuiHFvcJaZDkeB?=
 =?us-ascii?Q?ajQbdfsyAdVH7aTzEXMpeGIxwMSYl36CiMURZZDeR42JINAi74hYYRn4oINp?=
 =?us-ascii?Q?VTUAwCFLyhE+22lFkM0IwSS+YjEkunDpVQtTddueXBXkQTiZ85GVofp0KiLS?=
 =?us-ascii?Q?zyHFLNFfvovtPyhHxyWNxDflpfO/9likpGEl0VX+KDs73fMKgRUCVO6EWD01?=
 =?us-ascii?Q?ugzrxxKE2I6RdstSNpZkzORCuDSw4yU/2twfMBTumocuuvJzBVsdMPVnJogR?=
 =?us-ascii?Q?uljbncjdZZsLXImfOIte4ohO1GYs/WNxYYDRDgZN27q0PNRGPjepnrcSYIH+?=
 =?us-ascii?Q?+lh5QmxSthvw3wOnqv7z6lSGSv7/xoIJxsiaDxayiIs+/5vFvq7RCNdsfIPY?=
 =?us-ascii?Q?GFnovvaPbgQn1DBVFTCKPWkLI6vwY4gDLt88Zbp0se6K7BsRs8xTYdR4H2BE?=
 =?us-ascii?Q?6iwOL5sXJPfB/DpXbpxo2Y2UHTcQBjEWwhPCfApkGSjThnIqXyHlJ/Ou0eou?=
 =?us-ascii?Q?LgXhXxbdD2NHVeZqlUm5W0cFIe+MiKBOy008KkCDKgc9XO/C5P3Re6mQbqYQ?=
 =?us-ascii?Q?62DWRJU7cqNeGMqID/FOj1WiQbThNyMNnHo4oXP6Q+eJMRpA3OI25cSwpEtM?=
 =?us-ascii?Q?8wNBmYrfIhxMQ7LFzw5q436dl0MSBEbr4FeDCnFm+L3HP0ofiRqpXPs86HW9?=
 =?us-ascii?Q?/5XrnrqKhgO83KPRS+xdP3JgAL5+5tyuVyJkERzxMr+mTBEgIYhaqHZF4C4y?=
 =?us-ascii?Q?bwsYien738wE3BKRMD4AT5fYtxGlhK5xIKZuoHrVccTEF1KuFgJ5BD+LBAAE?=
 =?us-ascii?Q?z+cx2ILzhynvTjciiIYViHgg+sUfaaQJ1cWVmzIeE7W/r96mQvAHx8mBMSC4?=
 =?us-ascii?Q?fi2dG8XqzMvZnRucYh4qvTHmidLYWuchdmGI0lVj05Zbkumn9+zKQvqxh9I1?=
 =?us-ascii?Q?0Mt1LZ3Ktr1DrnUgmb+tf8HFrSLsnYU1UAtlSrhuWbPfAoM/neu7zae+GYpJ?=
 =?us-ascii?Q?dSn+tQKzLUsAYiMlOXD8lmRzS+ve03a47POvoTqM8xf4Kf+eqmMyqFu0m/R7?=
 =?us-ascii?Q?4j59QvgVveQPXZT4eCZbjgMNQEAh3ekGri3/ytSqQrVCsV3YqyzfEro6wIyW?=
 =?us-ascii?Q?TQLZeGIaF0qMmUgVD1s=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CH0PR12MB5284E5DB9043B3D5997A660F8B05ACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52841ac2-950d-457e-51ae-08db91d6335f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 14:55:37.3608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0AGTaXqiU+dm8c/eSMbMiOBjnrkBR/6YG306p14TxTerON2ROTeqdjAbksk1j2qJ2rpkyuBH3gPG19Wl4eTLcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6210

--_000_CH0PR12MB5284E5DB9043B3D5997A660F8B05ACH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Done.


--

Regards,
Jay
________________________________
From: Limonciello, Mario <Mario.Limonciello@amd.com>
Sent: Sunday, July 30, 2023 3:12 PM
To: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Josh Boyer <jwboyer@kerne=
l.org>; Linux Firmware <linux-firmware@kernel.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: AMDGPU DCN firmware update WW30

Jay,

Usually these are sent as .PATCH files relative to linux-firmware.git so th=
at Josh can just apply them.
The other alternative would be to make a branch on a git repo and let Josh =
pull from that.

Can you re-send them as such?

Thanks,

On 7/28/23 15:31, Pillai, Aurabindo wrote:

[AMD Official Use Only - General]

Hi Josh,

Please pull in DMCUB fw updates for DCN314 and Yellow Carp from the attache=
d files.

Release 8.0.30.0 for DCN314
Contains fixes for ABM, Z10, PSR-SU, TBT

Release 4.0.62.0 for Yellow Carp
 Fixes a randon screen freeze for a vendor specific TCON


--

Regards,
Jay


--_000_CH0PR12MB5284E5DB9043B3D5997A660F8B05ACH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Done.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Limonciello, Mario &l=
t;Mario.Limonciello@amd.com&gt;<br>
<b>Sent:</b> Sunday, July 30, 2023 3:12 PM<br>
<b>To:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Josh Boyer &=
lt;jwboyer@kernel.org&gt;; Linux Firmware &lt;linux-firmware@kernel.org&gt;=
<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: AMDGPU DCN firmware update WW30</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">Jay,<br>
<br>
Usually these are sent as .PATCH files relative to linux-firmware.git so th=
at Josh can just apply them.<br>
The other alternative would be to make a branch on a git repo and let Josh =
pull from that.<br>
<br>
Can you re-send them as such?&nbsp; <br>
<br>
Thanks,<br>
<br>
On 7/28/23 15:31, Pillai, Aurabindo wrote:<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<p align=3D"Left" style=3D"font-family:Arial; font-size:10pt; color:#0000FF=
; margin:5pt; font-style:normal; font-weight:normal; text-decoration:none">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Hi Josh,</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Please pull in DMCUB fw updates for DCN314 and Yellow Carp from the attache=
d files.
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof">Release 8.0.30.0 for DCN314<br>
</div>
<div>Contains fixes for ABM, Z10, PSR-SU, TBT</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof x_ContentPasted2" style=3D"font-family:Calib=
ri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Release 4.0.62.0 for Yellow Carp</div>
<div class=3D"x_elementToProof x_ContentPasted2 x_ContentPasted3" style=3D"=
font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0=
,0,0)">
&nbsp;Fixes a randon screen freeze for a vendor specific TCON<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof">
<div id=3D"x_Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
--</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Jay<br>
</div>
</div>
</div>
</div>
</div>
</blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_CH0PR12MB5284E5DB9043B3D5997A660F8B05ACH0PR12MB5284namp_--
