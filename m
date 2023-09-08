Return-Path: <SRS0=EBD0=EY=amd.com=Stylon.Wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE90DEE8014
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Sep 2023 15:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 80E44C433CC; Fri,  8 Sep 2023 15:05:07 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7E0DC433C9;
	Fri,  8 Sep 2023 15:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7E0DC433C9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKDdwosdp1Un1T/trgNy7SEJvSHxkv7knUops8KOutOh7bnVz8asEYNGAIZPjdGOlzBFchMKSA73gL7qNvWB9B6+2P5XvmARZQWcJNUXe2w2SYeYaSQm2LMpuNFsZeAJ9yFgxsxOGnYH9SpfKMIP6CgDLxFbftjhn+JtSJZAuYTDjvphQnVJfRKDzT2ALWcH52c3Rg08pYKrGuQUMr9+1Ema6KcL0DrEtJ7A8QE1ZtRy61akb2rCs63OKJP7UFEHRqXiiX+Gh7StStX6sn8/qR7mRgHZZtoC089UKcv77BidVb1uYZHU/62aduexdFUHXSwMRnKxXQYKeWZiI/GvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7nQpOJ3dkiBl9fOiva1sieL0xjLRRhLCJrs16yfsYM=;
 b=D0ThMVTAabNBThwlDH7oXDgj7MN91Qc6TBuFW7hS5Xtd11Yih+rMOoBqDOx7ibt+uLikAk/Hpd2L/cNMDKtcj51b+KdIaVJtj5MOW+G3CcMR7i1qgJQj5qzaVrALYMUNZcA+Naq/4iw+1ugzYjTFIJ96Bz2VSfHyYNegYKZJWyUhV94T8uY/oxzm30NcLdRwSr+h8iCbzGWnCLsdpnDgYg97lpA7RopUdxKuDTUY/aW0qNq6ROhBJSoQ4rRR0zRTO6cPJly6/y89Bsc6j8cOvlJRB4hh3W9RkkJOi0gpyCLCVN3ogPh/lUpnDiwuLpVLoJmNLHZY5x9z+sSVsIF6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7nQpOJ3dkiBl9fOiva1sieL0xjLRRhLCJrs16yfsYM=;
 b=fqwy/B5Ab2HqN9xtPwYiF++HcHRJ7PoNlylU5v5K2dTta8x/aUWxMuXaI2ZTJ4F64TA6wzeNfYmr2cMGBoUmmrK5j4mQ3YntREL5z+tjgRn69MU3s9KZv0CABV9Ea5HyRkSDEhEJ0XkWcGAzQqhe2mRz5TbcDNU/iqYFcq3ln5s=
Received: from BN9PR12MB5145.namprd12.prod.outlook.com (2603:10b6:408:136::20)
 by CH2PR12MB4280.namprd12.prod.outlook.com (2603:10b6:610:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 15:05:03 +0000
Received: from BN9PR12MB5145.namprd12.prod.outlook.com
 ([fe80::52e4:5286:10f1:7c7c]) by BN9PR12MB5145.namprd12.prod.outlook.com
 ([fe80::52e4:5286:10f1:7c7c%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 15:05:02 +0000
From: "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, "Sharma, Deepak" <Deepak.Sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware (2023-09-08)
Thread-Topic: pull request: amdgpu: update DMCUB firmware (2023-09-08)
Thread-Index: AQHZ4mW5lyN+bu5Xk0atKE6uVOmrIA==
Date: Fri, 8 Sep 2023 15:05:02 +0000
Message-ID:
 <BN9PR12MB5145D1065DEC1C708C56AAB0FFEDA@BN9PR12MB5145.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-09-08T15:05:00.774Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5145:EE_|CH2PR12MB4280:EE_
x-ms-office365-filtering-correlation-id: 2e4d8409-f2e1-4feb-b70b-08dbb07cfa74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zVYz6tvM7eskzAgp/gUcUb6e2uB0AAh5M0bXRQNW+c+5eFYp++nR95ggCqdVumzhB1OZSk6c4USj8X8i1215tc1tKH788HgQXsDrFiOaJVW0bVjb0La0Cm312hPhtvaZlLeavrqo77Je/GxOjhNcvSrHoabqGqyobGOsJ/zg/9dm9wxqMYiZbgx3q+8aW88EZo6YBUSAZm5J9Rn1bto7nwjSSMt02wIsRyG3JCOwdxQVI/cJcB1ghszE9MvbyGNeeoy5dcXFyrQdrLJZylugx0BOs5x4sJYeKkOQBvlX4l/9bygznbQulrNNhInItVooISJkdobZ6gYmemIkuq1KDmrkWyGUnXHZtnBK0G/aeYlZJQrlxbB3uJ8rdfbLq+k0zZK+/ZZujtrOP1sE+jYbwFN6EywDbnoLskFv6MmQN1pk7BVMsz0TAJ5VN4sGKNtXC51/5m0+/pRYyIOAnzwUbG0YzPE5i0687sQ8LwRtJyzb5ALDArIvSEmnnOEEKBPCRpQ5EPRPnkcSxQBG0Xn+jDP6Rj6hi6IOoHc10XygqCrHLCIHE74EYXDDifltiEZR9MeH4wCK6yrv4LEWy6Ds8iDcWeQNY0psrRYNTeNrw6nZO+nh2Z/yK0cwCBlL77nnOz8aAyJroiMt4YJlvrz07g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5145.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(396003)(136003)(376002)(186009)(1800799009)(451199024)(38070700005)(38100700002)(122000001)(166002)(55016003)(86362001)(33656002)(478600001)(2906002)(110136005)(9686003)(71200400001)(450100002)(91956017)(6506007)(8936002)(8676002)(7696005)(4326008)(52536014)(5660300002)(76116006)(54906003)(66446008)(66556008)(66946007)(66476007)(64756008)(316002)(4744005)(15650500001)(41300700001)(19627405001)(83380400001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?MgxBkjekg8KIWIxs6P6wJ+Dc0/Tm1yObgOrk7F9bmEmAepheAHSL9u5E2V?=
 =?iso-8859-1?Q?ElLB/vVoomn0XfcaeIf4KV5q5TDFGrzBngBZJ6DUmrqdgxK0R7vNxeOOrA?=
 =?iso-8859-1?Q?zvPVorLNDOrKH8ELwuNMs06JMIDfFNBcypuhL3gjuKsSVkfbU3Y1QMlTD4?=
 =?iso-8859-1?Q?FRD+5RknUO2QjkuZPL5x8AxDGP8aJS64grwQNHhFbuSNpcouQPpgH9NDJe?=
 =?iso-8859-1?Q?zb//Fr4reAWk6MoJYBK+YWIZzQhsP4h/S/rJNKTWCA4a8TFjWHOw2FkaNs?=
 =?iso-8859-1?Q?i53wKRSLkFSeMYn0hJVh7eisONIXFwxlyr6s3hC1qZHAbsiK/iMt0dMgsG?=
 =?iso-8859-1?Q?WZ1T3NfAIXmmrxBKUFoq4pGpaUeuoSFv0rheavYW++MNFdHeeT+b5pct21?=
 =?iso-8859-1?Q?X2LzP678JgTqc57BAVrgBVbtECL6kWbY/i+eJJ0TWL2QkJwMn5itogrSna?=
 =?iso-8859-1?Q?ySDjWm6O01YCjv6IQr8zl98IM9djdgk/D9327YJHjsrBGdrnN3DW2CmgHT?=
 =?iso-8859-1?Q?72qXHTmIlF/2T/3tjybz9mkQdVeWEjZ+QSoTsOa1/XqNuP+9v4DkHPm7As?=
 =?iso-8859-1?Q?c+INqZTibiA6yXBBCJTksTcekPia/twB1GRKuRBw5OEvC8mjlN5jtHj62J?=
 =?iso-8859-1?Q?kQj2WRUr0JPkLU+5DXJCEJ4Et2MWXHZ9q0H+HMGVoMM2uP2XmzA3ObXnMl?=
 =?iso-8859-1?Q?Od4wIf0WZltqN0QatauD7cs0RT+YT8Lg+1q+x6TBg/ALt/Qu2PMQQ5+6nH?=
 =?iso-8859-1?Q?lbiLicFZ865gfvInqGvCdCxl+VePmXlFfOZQoVqhzzzAwS0M1k7wWe1FDd?=
 =?iso-8859-1?Q?70ibQdMrU355t2FvTBZnry2AYMcswRf9c6HKL0Sp+JdPFp7sR6ItenPFBa?=
 =?iso-8859-1?Q?EBOsazjX0Tyz4YwkXBSMpKnfpmzWTGWK3yh+zrVcB8Sbf9DehCAa59fo97?=
 =?iso-8859-1?Q?BGtDpM8Rhhlvrj1/22VeYgWpz/zviFDshPi7+s7cOfOSQPcXAjif4zpfaq?=
 =?iso-8859-1?Q?qtk8oVET5SbDsM22zTlvp6wydMcwiON77wk31HDj/xyuashTikcROh8/QQ?=
 =?iso-8859-1?Q?2e1PHqyYJbAt0DJPhrEBE72fdeH++XRW1oluAVFYbxEVeqHIwsin92p9en?=
 =?iso-8859-1?Q?81f/3qC8W5tYG+/YC2V96j4mjY6IgpIZstnTmwCKEsm0XuvZT3OwkPMIqh?=
 =?iso-8859-1?Q?9usbP+/7rLQnMLtu2W7n8aD9FnK4jfKTNQ+1o0wnGJOvbATYAk+8oW/8Zh?=
 =?iso-8859-1?Q?LHdTHQ7hh5xZ2AaqOwbLg4z0hUj0UnqYwhrQ1pCBlqveTT/1TJer/bGphT?=
 =?iso-8859-1?Q?aegSotx3mu9AKCFA3etu4OqGa3No/EU4PJ+1Lj7JiyMbGV5v4WRxkh53ny?=
 =?iso-8859-1?Q?gMCOIAkGG6KWWrmlR3IIriwtuAew11g8VzygoYOCeYuYke8TF7u7OP5ZPT?=
 =?iso-8859-1?Q?5V/BYgeI+BS6Fbp0yM9jPDFpsb0Yao5JzCTmjBr0tCDx7u1b4vwM5fNYuZ?=
 =?iso-8859-1?Q?p1VhLkJoanlRijX486lESZasCH1AfQDKhQnwgREsLlN3oFroTzr+eC0Cx2?=
 =?iso-8859-1?Q?DR+0N/mdKm+kc6auG8+I5AgMzw8fQs439GI6Kz9mGAg5oI4lmS5ESldSXW?=
 =?iso-8859-1?Q?eulFg6hbY859U=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BN9PR12MB5145D1065DEC1C708C56AAB0FFEDABN9PR12MB5145namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5145.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4d8409-f2e1-4feb-b70b-08dbb07cfa74
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 15:05:02.6825
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U+PupU5/o0OHYCCgbrTaLwQ5e28ft/QPqdsVVo/sDMs9qaLhkLH8VfudZzsQdzb6zL8TPtDIwtJW3pRfstYNcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4280

--_000_BN9PR12MB5145D1065DEC1C708C56AAB0FFEDABN9PR12MB5145namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

The following changes since commit 2bbca647e4aeed3813ba7776d309c4525e0ad841=
:

  amdgpu: update DMCUB to 0.0.183.0 for various AMDGPU ASICs (2023-09-08 22=
:30:18 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-09-08

for you to fetch changes up to 2bbca647e4aeed3813ba7776d309c4525e0ad841:

  amdgpu: update DMCUB to 0.0.183.0 for various AMDGPU ASICs (2023-09-08 22=
:30:18 +0800)


Regards

Stylon Wang

MTS Software Development Eng.  |  AMD
Display Solution Team

O +(886) 2-3789-3667 ext. 23667  C +(886) 921-897-142

---------------------------------------------------------------------------=
-------------------------------------------------------

6F, 3, YuanCyu St (NanKang Software Park) Taipei, Taiwan

Facebook<https://www.facebook.com/AMD> |  Twitter<https://twitter.com/AMD> =
|  amd.com<http://www.amd.com/>



--_000_BN9PR12MB5145D1065DEC1C708C56AAB0FFEDABN9PR12MB5145namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
The following changes since commit 2bbca647e4aeed3813ba7776d309c4525e0ad841=
:
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp; amdgpu: update DMCUB to 0.0.183.0 for =
various AMDGPU ASICs (2023-09-08 22:30:18 +0800)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">are available in the Git repository at: </div=
>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp; git@gitlab.freedesktop.org:drm/firmwar=
e.git tags/amd-2023-09-08</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">for you to fetch changes up to 2bbca647e4aeed=
3813ba7776d309c4525e0ad841:</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">&nbsp; amdgpu: update DMCUB to 0.0.183.0 for =
various AMDGPU ASICs (2023-09-08 22:30:18 +0800)</div>
<br>
</div>
<div class=3D"elementToProof">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 11pt; color: rgb(0, 0, 0);">
Regards</div>
<div id=3D"Signature">
<div>
<div></div>
<div></div>
<div></div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; font=
-family: Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"></p>
<p style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif; text-align: start; color: rgb(32, 31, 30); background-color: =
rgb(255, 255, 255);">
<span style=3D"margin: 0px; font-size: 9pt; font-family: Arial, sans-serif;=
 color: black;"><u><b>Stylon Wang</b></u></span></p>
<p style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif; text-align: start; color: rgb(32, 31, 30); background-color: =
rgb(255, 255, 255);">
<span style=3D"margin: 0px; font-size: 9pt; font-family: Arial, sans-serif;=
 color: black;">MTS Software Development Eng.&nbsp;&nbsp;|<b>&nbsp;&nbsp;AM=
D</b><br>
Display Solution Team</span></p>
<p style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif; text-align: start; color: rgb(32, 31, 30); background-color: =
rgb(255, 255, 255);">
<span style=3D"margin: 0px; font-size: 9pt; font-family: Arial, sans-serif;=
 color: black;"><b style=3D"font-family: Calibri, sans-serif; font-size: 14=
.6667px; color: rgb(32, 31, 30); background-color: rgb(255, 255, 255);"><sp=
an style=3D"margin: 0px; font-size: 9pt; font-family: Arial, sans-serif; co=
lor: black;">O</span></b><span style=3D"margin: 0px; font-size: 9pt; font-f=
amily: Arial, sans-serif; color: black; background-color: rgb(255, 255, 255=
);">&nbsp;+(886)
 2-3789-3667 ext. 23667&nbsp;&nbsp;<b>C</b>&nbsp;+(886) 921-897-142</span><=
br>
</span></p>
<p style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif; text-align: start; color: rgb(32, 31, 30); background-color: =
rgb(255, 255, 255);">
<b><span style=3D"margin: 0px; font-size: 9pt; letter-spacing: -1.4pt; colo=
r: rgb(242, 101, 34);">----------------------------------------------------=
---------------------------------------------------------------------------=
---</span></b><b><span style=3D"margin: 0px; font-size: 9pt; color: rgb(242=
, 101, 34);"></span></b></p>
<p style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif; text-align: start; color: rgb(32, 31, 30); background-color: =
rgb(255, 255, 255);">
<span style=3D"margin: 0px; font-size: 9pt; font-family: Arial, sans-serif;=
 color: black;"><span tabindex=3D"0" style=3D"margin:0px; padding:1px 0px; =
border-width:0px 0px 1px; border-bottom-style:dashed">6F, 3, YuanCyu St (Na=
nKang Software Park) Taipei, Taiwan</span></span></p>
<p style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif; text-align: start; color: rgb(32, 31, 30); background-color: =
rgb(255, 255, 255);">
<span style=3D"margin: 0px; font-size: 9pt; font-family: Arial, sans-serif;=
 color: black;"><a href=3D"https://www.facebook.com/AMD" target=3D"_blank" =
rel=3D"noopener noreferrer" style=3D"margin:0px"><span style=3D"margin:0px"=
>Facebook</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D"https://twitter.com/AMD" =
target=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin:0px"><span st=
yle=3D"margin:0px">Twitter</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D"http://w=
ww.amd.com/" target=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin:=
0px"><span style=3D"margin:0px">amd.com</span></a></span><span style=3D"mar=
gin: 0px; font-size: 10pt; font-family: Arial, sans-serif; color: black;">&=
nbsp;</span></p>
<p style=3D"margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri=
, sans-serif; text-align: start; color: rgb(32, 31, 30); background-color: =
rgb(255, 255, 255);">
&nbsp;</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-top:0; margin-bottom:=
0"></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BN9PR12MB5145D1065DEC1C708C56AAB0FFEDABN9PR12MB5145namp_--
