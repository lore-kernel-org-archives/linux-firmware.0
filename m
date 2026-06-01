Return-Path: <SRS0=9ZLL=D5=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE80ACD5BD1
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Jun 2026 20:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8EAC1F00898; Mon,  1 Jun 2026 20:11:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.27
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780344679;
	b=K82qVrm1q1ENDkLQgPuqPRlfxPnKjGkZf5xLv0yPaa3/Cdtxle3GJcEZ4aCxcRwyoCas
	 /al/SbBkGELV5afMOvvrMIlN+IndptRc+HEOH6o2OqIeYr3bGDUUK0t/Z0nNXifICdWeT
	 6ibANFwRPnRWn4Fenq/EyyKnSJwCCL/+/rud2Q03BcDoBELM0e5g/8+PPfzuF3O+RwOMP
	 PtolftNP5nuV4f5eUZdMquz1J29WzchEsuZ2NpdSP3V9tykhGx6X2OOyADeYQgkz1eZCO
	 nwWj+LSZov7/G6j5VDMRyrdsicExg3aMBO9/KAiZ8p7aUx/VfjXQOJX+lekeDV7nM6g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780344679;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:List-Id:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=E5ElxmpPFolYE0ZWNPHAzADSY2VL2dzk1cdbgvAMf7g=;
	b=BTnRalRugWEGb3KBoLYizPuemxs26MYFE269SRKFUZitVBc4nYLeh1o5MIxbfLHzdc9A
	 uQYvW+lah7LiV4cDVlYWewS9cTLCYoktip2UbG8gg6SSp2GK9e6h9cz6bmXfcvkhK5Xjk
	 d6ucH3/hceSEdlHP31LUScA6sxRu9S9I/Oopk5V5NAKG1hd/6Q2PtltwLJLMBPVSRGdwl
	 SJWJUfyupNHjvF8fHy2RVThRftdTF/YmxHudoecPK8vVllXFj91amEssd77XJ/ENQWsan
	 sA3UNgradspi7MKgBNJD248WdIzSpJr/kEcKcgtkYMcVEFRgK5yHKg81hb2BY+Sk72Q==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eaVyCR2J;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.27
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D860E1F00893
	for <linux-firmware@kernel.org>; Mon,  1 Jun 2026 20:11:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eaVyCR2J
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D860E1F00893
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkRfUKRdrnIZllZ3T2L8RNI+7hxQwYUlbOfuFgagx/EkBJuaiVvF/3eYNkjQiINp2DhEXIFx84v90UrqDyraA7vhHBiCPascSX+s5vSvkkeI8G72xJnmOd5oqQvB7gQEC6KXVObpJkF6SzEGOy4AWjXWh2/u7ZxFJeiZpFdK/xcrbh/M/ogBUs6P3tLUViqT+QVr6S+LJFqvgYU0+RUEKR/53hHzBXGMCrIBo0C4CNfCGebsQWR+0eapmqkt7HbiB6pweJDUZiHTjN8dWdYSO6kCZGgFPWuo4oIf/rxq1MKe+GF4b9r6k6N9EFbwL/y1/ZEr2ZmFYWYuzRX8rQLNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5ElxmpPFolYE0ZWNPHAzADSY2VL2dzk1cdbgvAMf7g=;
 b=yjluHj/OoGOk0u76YvfJpne6SneHAVuHHTCqbMYptcfGgud+l8ycaAFJaASGPshdBs8GbeANM1eE6g/nlVjul0qzYdExRNBf8Wle4KW3vGToAGTo2kjR91wnJQ9QTkc1q5eR8MEI9jtUpxA+GCgGa+dhKtevueVym4l3JM3fCF+MPIfqA7v5SgV9LppCJ650QATQ9ztVhcfCT6EUnOTuWj+oySQYE7DwWKnV5SP/3EQf9oAUAmIhE4zKh0DArJIbkOW2QYcS2V+TlyyEoVH1MZm6IU3DXYhEJ0zI7b28eujI3WdEyO1jfUtWb0EIbKV6tBXehDjhYkh9MKKEY/hQuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5ElxmpPFolYE0ZWNPHAzADSY2VL2dzk1cdbgvAMf7g=;
 b=eaVyCR2JmEQ/hwuFFMobIuoKlbrfeme2ZRLcCyy9MNJ9p/BuE9JP+wwf2ehQ7l+bZMM8NCCIkAyo9qVqE5f2m0T0HgGORJ5j83UrT20ubcDa9KxYi/ejDTIs3ztWkRWAl6XvSB+wypZ3eT4RPqMNFuFSI2Uv4CUFMKuUWrhPGMs=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:11:15 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::699b:1fb2:73:6a33]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::699b:1fb2:73:6a33%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 20:11:15 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Subject: RE: [pull] amdgpu firmware
Thread-Topic: [pull] amdgpu firmware
Thread-Index: AQHc8faUaA805/Pywk6ogkOIucAFebYqFcEAgAALl6A=
Date: Mon, 1 Jun 2026 20:11:15 +0000
Message-ID:
 <BL1PR12MB5144C8AEC3F2196AAC92C85EF7152@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20260601184330.3325262-1-alexander.deucher@amd.com>
 <cux4kauuuv4wpullm7bpu5h25wmq3pwckady6x4xn5wkcnusk5@tobsihffwbrh>
In-Reply-To: <cux4kauuuv4wpullm7bpu5h25wmq3pwckady6x4xn5wkcnusk5@tobsihffwbrh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Enabled=True;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SetDate=2026-06-01T20:10:10.0000000Z;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Name=AMD
 Public
 v26;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_ContentBits=3;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH0PR12MB5606:EE_
x-ms-office365-filtering-correlation-id: dc572060-a8dd-4941-2070-08dec019ef2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 gSm7GpUQiFxxGUafQ7OX52k09kkr70NAbQVt3YYlxPhDB2HgoTcjpQPLDfLnzYF87zYzzQDx7GjFk6F0XuuNDBzU/KccUMBiPJFZAkc6+IyXqrfg1ozd3XgiBEk1/lCctcJu3o2rjMDWjoQM29+vEp4VFdUsFm8idn4MHe8/IY09tbw/vo4cn7Lbu61WZ/70t8czTg7XYKscM+U7hVuj1wh8bV+JyyFaKwDXRlGOWLv3qOTJml49BABnGxfGeZeA8b4d5KC/O7l+s8bzxZ0xjR8Ki91iooI8vJkXuFfdKoGkc+cUcH3k+YCIcge5WDVx2n4JmVyjdcYlZGOeWZb5bkzsmg8Yyl5EfRNHeYOAyDWvioM5wleimqi57KkuvD6XDLiKK8GgHVLhgQ7Yggt8j9OD58/kqFStZjNN47VR+OzsuayPVE4j8blmevaMYTBShk8fi8d1qRm4XmPM/lcDUQrG3IcKZcBsi+EI/styv3TYha60h/UDsJnQ+dK+QJ9bo+VS5wjAqUjoCPVILTH1NAtZewBvJx0ZfOa1DsM/EV2wxuYefhVJGU2q22P7da1JzKnDciSHwcmzAH5hDNu+k2rqweyuIWT+Nb4LEgfImRBK4uFI/Xfy4WQ3HkomIDHXigg9ohcthS6EcEO/BzjzWOl4O9Mp8zzpJuv0j+OBRkTJCZ3x494E/Q4ygYrrhkFF9ZdYCdJDBY1reSrlQMt1IkD0/SwysbSfsP/3BY/0GVDF606QwoZg5YUs5ZlKhEKi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5144.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p4K7UglgPHAuIwgNYyEQQgzPu9fEhMNc6oAUxorv0LmM+/bAvBp3joB4jAQO?=
 =?us-ascii?Q?KJhOGOp7KcGpaxELqvJOKBDSENGuuS+N0VB7EdfBaxyt9QBVWgRYJITgbC1f?=
 =?us-ascii?Q?DAnBekDXUrLpIGI56sQfWnev/BqxdCsy6QTpnOWR5lsl5P2Y9lh71jylL/DD?=
 =?us-ascii?Q?hiPWCiSW9kcod8whotK2omxigJEaEBjpZHvEecIs7d/7oti43orPO4Hx48LT?=
 =?us-ascii?Q?3pszXsoLVTlRO1+47Rxe0P/SwGFu02ei9qSeNnzVYljOwQmOGfeRu63QwBYW?=
 =?us-ascii?Q?IBOvl/PdfQDoUuS4yzEvgVliBrZEgP3ZaNnYiF947iALselF1PJDrjgX0mOV?=
 =?us-ascii?Q?uSEi9Mslrf5IKkDaDgw2SA5QsFBiiCEtAyCF/5tJTiomS7zKn5ljQwGzyOrN?=
 =?us-ascii?Q?Za/CWQ76jfvRcEvyTFR2Bm+TFfNUalHWaKsQqMv81+ngmcrRVYpCC+Tan689?=
 =?us-ascii?Q?/4akuwPOpJr+vLOGR4jQLRxz5/BL5ApjJnVz4r1NuG7a4OCNiqSPlSyd7Bin?=
 =?us-ascii?Q?OS54VwOka1Wak4Pb6kbUmoBLnJeS1R0Qiqq4pJNPKggyTDcxapWlEHsqKXG/?=
 =?us-ascii?Q?tZ6dr8dJBU72ZyySwImwD3RV0YG3CACF8Nwze/gYdEz87t5lSCpcES9jLCzx?=
 =?us-ascii?Q?VmqKr7NxPts5TTwseWmiwPbe7oFEyg6ap07BFBOGh5Stn25FaDjeV1gLGCSn?=
 =?us-ascii?Q?IVZ/gKw6IC0MNqcSRMKC/aff4Rlngx5kyLd45LTO9XSQ4tMevcOM9Vu4v3Sq?=
 =?us-ascii?Q?vetlyaRE0CiDp4v1S0kQExbu8N1wuTF4g5zww1KRjDOtbL6mrKCJgGPm4Xlz?=
 =?us-ascii?Q?7H4FJL5LtF8laTTVpKvFPKIVqZ1lLgaNNM8uF8l1noWl1IRr11gYEGc0VGTn?=
 =?us-ascii?Q?oT2yQkMowIU+6hT3XsX6sYlQvE+4UpiiKvd8UcDjCrz0g7+7rNklGlIRoIFf?=
 =?us-ascii?Q?iCfctv68xwac1g6uNihRtCBCAdvSx6n2hKxAUYnf/eGntCMyOPhxLRWQenux?=
 =?us-ascii?Q?aIvShsG1P9M4msh8dTBJyedxiZLwhgp4lAsdccAvf1wcpcRaRVqHTy0zDVk4?=
 =?us-ascii?Q?mo6YbSai7Sl+5r8rsZZGOP0BC3yFUMiyzp6kqqlQEYikuYXCffQQVV4wL9MO?=
 =?us-ascii?Q?leczm6Pkc4+fCT65vNJ6hZ+t/6csKj1mdf2N3Gg/eox76kLyNu5MAuJRQaic?=
 =?us-ascii?Q?OxgUbEL0aMl6aqySEdcRxSf2vMRiYHZrOwF4vhQs5SH5Nkj76cU4il1mxAnz?=
 =?us-ascii?Q?rONAx+mexgkCAo2MKNwugKpEhylOUob5bNzk5yrUYMrLqAjrstkSUsjSdw3m?=
 =?us-ascii?Q?5mJCQ4vAkfu7P4TIokhu9K62tW0uaLqeYaDFuMEc3N3lBrypEKXOKSFNAMJs?=
 =?us-ascii?Q?IME7qaPyzVA01mcGkJm7I+FUoh8hgeEPR5yAj4cBVk6EtYhWh9wMqc5DlNUl?=
 =?us-ascii?Q?AJo9co7/gkZbKpve5VMDLSw4nakQsc9WET635Pu05VmFl5f86MTfKoAUc986?=
 =?us-ascii?Q?BYPmykUQlweQ3CB3VT40YeoQD1m2jqUUM6H9YGKZqkTKNV84tZQSSnq2a7VF?=
 =?us-ascii?Q?CN8G+nBwW95gDQfKQIDrEIpuw7p8ngL1tPYWKP9LYH5dgtzxAhbfhhLW7SN8?=
 =?us-ascii?Q?MpGKCdXKiuXNWPo6TlkqIrXMFxDbeqSIFKuwv1rsLvQ3pYE6NuYMyFqxVcYn?=
 =?us-ascii?Q?NlPebNOvIe72cTDWHjCUPNADyGirJToMPVZNMiDcO35W9gn+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc572060-a8dd-4941-2070-08dec019ef2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 20:11:15.2118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BL4j4PXaZkjRB/RppUnrCvW9dCDLvr0J+H6CM+WhImGUV1EjUV5PRnkztbszu7f+iZKA4GE6o8JgLPHIxBO7CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

Public

> -----Original Message-----
> From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Sent: Monday, June 1, 2026 3:29 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: linux-firmware@kernel.org; Limonciello, Mario
> <Mario.Limonciello@amd.com>
> Subject: Re: [pull] amdgpu firmware
>
> On Mon, Jun 01, 2026 at 02:43:30PM -0400, Alex Deucher wrote:
> > Hi,
> >
> > amdgpu firmware update.  Revert some recent VCN firwmares to fix a
> regression.
> >
> > The following changes since commit
> c8c796dcdd3b8d1ec71de2c7a71d3d7b1c8f7a68:
> >
> >   amdgpu: DMCUB updates for various ASICs (2026-05-29 07:50:47 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/kernel-firmware/drm-firmware.git
> > tags/amd-2026-06-01
> >
> > for you to fetch changes up to
> 475f6f6d19ba253c5e03b8b51adf78bb704cddd8:
> >
> >   amdgpu: revert yellow carp VCN firmware (2026-06-01 14:29:02 -0400)
> >
> > ----------------------------------------------------------------
> > amd-2026-06-01:
> >
> > Revert certain VCN firmwares due to regressions.
>
> None of the commit messages mentions a regression. Could we please help
> distribution by pointing to the bug report?

It came from an internal ticket.  I don't think I've seen a public report r=
egarding this yet.

Alex

>
> >
> > ----------------------------------------------------------------
> > Alex Deucher (6):
> >       amdgpu: revert beige_goby VCN firmware
> >       amdgpu: revert dimgrey cavefish VCN firmware
> >       amdgpu: revert navy flounder VCN firmware
> >       amdgpu: revert sienna cichlid VCN firmware
> >       amdgpu: revert vangogh VCN firmware
> >       amdgpu: revert yellow carp VCN firmware
> >
> >  amdgpu/beige_goby_vcn.bin       | Bin 580240 -> 580112 bytes
> >  amdgpu/dimgrey_cavefish_vcn.bin | Bin 580240 -> 580112 bytes
> >  amdgpu/navy_flounder_vcn.bin    | Bin 580240 -> 580112 bytes
> >  amdgpu/sienna_cichlid_vcn.bin   | Bin 580240 -> 580112 bytes
> >  amdgpu/vangogh_vcn.bin          | Bin 572368 -> 572368 bytes
> >  amdgpu/yellow_carp_vcn.bin      | Bin 572496 -> 572368 bytes
> >  6 files changed, 0 insertions(+), 0 deletions(-)
>
> --
> With best wishes
> Dmitry
