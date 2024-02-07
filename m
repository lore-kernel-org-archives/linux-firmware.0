Return-Path: <SRS0=o2Ay=JQ=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C5CC4828D
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Feb 2024 21:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A4AEC433F1; Wed,  7 Feb 2024 21:35:30 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04526C43390;
	Wed,  7 Feb 2024 21:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04526C43390
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzDS/h3qiDCk1tk9uUQ0feTMn+RfRrS1+YdgiAyVD0knCSNmONvprwUJf+8mJIzbqqNSBvxpiIxDFNy9/zdAm5V5nPzdbSkX8P2QN4OGzs/LOvkM6IYrlvQwtQa2cVuyv+ijErNkkzHagRoXsDFVa7dCdoIlMRE7qT92JDSkdPgN7kQARz2RCG0NrDXTKzMCRg6YPkJEftaclrXXPxQtWmcIq6tBbHcyslDvvNNCaRNNe9Vc79puq/pW5MFhpfAJzWNQA25JBmv81ic/EGv8pNazZJ5bMTZI+5jlCHpAiFd4xLbRNCaeO0gnHOetQozXqW3iY6IJjOUr+hepo/4itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTkzXGM/CL/xjS18jT8J3p+UIXOFLX217tMwxS06j/g=;
 b=B4/MDATbjP3VTJBE5TfyGlo4lzmoIo/Gg1EjNQSVZ7jOowUTlKnp/87l/DzQe0CbbjD6yDiQTwlGpEdZCMyel5+jmNdR8zgcvrRDBHo/QmS6qvBQ3zBt8e9eL5nEnCpPcARRNt9GFHMpxMsw3OjhKmg58nqzsfUCo9yA5uz9u2U5f0zhFUaFbA7/ZzQco928GkHcRAFmS1Pq/e656+LNKLpbBbatjpiWv9GazWhhQ8AW+uGcaSutEnqeGQ+JoMfkZ1kUHaswJ+kzna5ARcAwWvWa6S0glAaxoKaAv0JhrFXNX1YknViV26ETatjLq8j1FsbTFSG6j+bNUzU6sXPZQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTkzXGM/CL/xjS18jT8J3p+UIXOFLX217tMwxS06j/g=;
 b=iUPio9tsUxG5RbaG5+s5FljDo28Fbp9FZi/cl+6aysByTwCZaNWV0xBr5zQgqbaoZwyZYVyxHaDFEC9w+4nqe4GgB3yT5c6WqX4pMHQuBqFQmu0lbj/JvXN9dTpGK2uqVHHN2SAB6pGCTSL7+aMJPH5JCab2l88MhMJnQsAxFX8=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Wed, 7 Feb
 2024 21:35:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Wed, 7 Feb 2024
 21:35:25 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>, Josh Boyer
	<jwboyer@kernel.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: V2: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
Thread-Topic: V2: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
Thread-Index: AQHaWgyGyCnHZf6xrEaw2/Wh/0cqkrD/ZvgA
Date: Wed, 7 Feb 2024 21:35:24 +0000
Message-ID:
 <MN0PR12MB6101689C1CE47F9DD2D1E5CDE2452@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20240207212752.1614192-1-aurabindo.pillai@amd.com>
In-Reply-To: <20240207212752.1614192-1-aurabindo.pillai@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=05e3c4d6-6086-4aaf-8369-ef562358d3da;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-02-07T21:35:13Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SA1PR12MB8841:EE_
x-ms-office365-filtering-correlation-id: 6ea18079-b7a1-4766-8995-08dc2824b209
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nFtMocp6XRnXBetYJZr/PgVVmrcVAEcS5KGEmlJTrG/YNRRCvAiuIhXySPF5T0qaoOYxBI/M+bRkBBJor7v6Y4BofWuNt5Wm+df0PJcgfY8dYGlBzYIJCY/pdYkO/8DdFTQjIYh8vMBv8BJjBp+57m726RdQKDpF0XTfbMwp+PeKYGTeVYO4VWpHhInRz4yxl+2zndYnRHDjKBziFZdW8/VbfWHcTMtJT93jFD5bcnN4KMFu83h0qaZfjsggPG9jDqji7/D0SQpx3vOA+7UlSZdIiJU0xXOWzaKDLZY5B6htZd0YDhuP5ZlJfq88pMgZXwAKCc/joye1k5PkH7Am1cmjmY1qVpua5zMoGBsj5/KR0lA2UNMWAp7mZ/gybyS4set2oGFhg7fcEAIQpC7sq0V/SHRJYHc9E8720JA2a2RKu73Ni5PC7t13/j7f0OZnSQNAUqJVUAzq5vcfrdwhjYYdWr066qQ61oJ/xB1hpVeVAVSf6GNVQ23TIhDOO5hVQx48YyxkdFC/crnaH8mwntcNG5gWHVL6Obu3WEjxFOa1flzrKOtUsylGzj04DJukc5PYayfiXUbUhU/LDpX4vE9b31ow3Mzrr2PVGJeWH5d5MFsWZxinJCQ2yv1kBpWY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(366004)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(110136005)(83380400001)(316002)(71200400001)(2906002)(66556008)(122000001)(450100002)(66946007)(54906003)(26005)(6506007)(7696005)(64756008)(86362001)(53546011)(33656002)(15650500001)(8676002)(76116006)(66446008)(38100700002)(52536014)(8936002)(66476007)(38070700009)(5660300002)(41300700001)(9686003)(478600001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eInI4+eCVhftvyv79WJy2Dgn//B3XcSlv7RPSA4Tl+G9gKGIOJAw/r8ybmZk?=
 =?us-ascii?Q?OQJLXLrs1zJLqzIgRSXOEg74mPa60rJIvjHHdT955zYGZ/eLnpq5ntvspzIb?=
 =?us-ascii?Q?+5Hv3P/4pB902D2a0Yy7scC7iJCKWL5p3qYQCqHvDCD/KUyaO/XiPdb1MW0B?=
 =?us-ascii?Q?MCfvcCGqR2T2JWBLSMjPVAdK9X27UO959R1FXGdNDuDeM/TuvCZR0lX2v6qp?=
 =?us-ascii?Q?gwJUE/hTLTaLzXXwDfioN34tzeFqE8xhUOL0W0pZigcia6gjhj1xOwe1He3A?=
 =?us-ascii?Q?msNaKSrxpBx4hU26hG/vY9i5LmrmMz7ex26ZW/pzhbOgYqjMQkUch8QbvwAs?=
 =?us-ascii?Q?R79gIqW5cI56qrHNgW0SVz2UTofkE/y0ObwP6DTShwLJXGzHadumqfFqMv/h?=
 =?us-ascii?Q?axgT5Q+KPGiq7Fk36scaOS6eOvotkf11F/YOovnC/HpBAaim4A3RIkqckAOP?=
 =?us-ascii?Q?nVqjUvfrkDUC7SLDM+66l1+W9A0YhlsQBpv24ME4EKfQ0gPIXIA53kOzMtm7?=
 =?us-ascii?Q?dvFoU64Eqh+DB9bfbDg5HTJXP1FXHopRgmxoEffvobC1zi7UxApTnMoR1EPB?=
 =?us-ascii?Q?dHCDBQNvM+ANEBSE45piEAuIeQB0LeAUawP59PtBpFKhZNHOnQbLrhv0PXXZ?=
 =?us-ascii?Q?xC47PJy52dckCPUW/d5WXYjVb5hJFsa1LLCdxCyeyVnCpO7Vi2IcSHnMbsjW?=
 =?us-ascii?Q?Y2Zv/najZBXb0hqJCKZElBtJyr0RGWovuvhlX8RExq+0pO7KMp7N7XqcMuUJ?=
 =?us-ascii?Q?Wwe9ZYkVLYRrS427h71Sm9SynlVnzqKL9ihfrlOdrNwiDEQpFJLj8slrboOo?=
 =?us-ascii?Q?Bf7MrUFmv5uXAIidXMGNgcM8mBEutwlUohFp0MJAfWCuhaj1Aj315q5qTV6M?=
 =?us-ascii?Q?t71wbOVH3pDWNGK+q4i5LnneUCpeyK6r1ZwAov0SSAX8jHPhZlo6VyU7BNYB?=
 =?us-ascii?Q?cWJHBTkKQLvOuaUXk3yTJRfDHnNh6w0Xnw54YiVW6TMHHekU0v0w2O4JLnyq?=
 =?us-ascii?Q?RcNjRhlKZxaLzMvyOqLvtAfJCOI4tYdm3hvuLorSsOJavr57mp6q+z4kUWNa?=
 =?us-ascii?Q?BFPQqWj6rwVHbO/5cLboM/e3ecGbLb++acxcZGrixT2WRr21oueC0p5a5JS0?=
 =?us-ascii?Q?8EZXhlQHK4O51LXhksA1jR4XkofM0OuZyJoOuC0pgIFBxy1iNPwk/m1LkEjz?=
 =?us-ascii?Q?n2nswulAa2GZqFeTMChdWsxqTzpwP0+MyulnD07fkO7cAA+rnOHdgb6oK5ax?=
 =?us-ascii?Q?slNZaUg+n0ZjkfHBfa+6+k7cV0biUEXNuihm5tWHpiC7+r14K1K6+L9/lts+?=
 =?us-ascii?Q?Hp4+vG/84X/0rJ2gRRFM1eYcqfpVc9HVK7KCXt9oZ9/VBqLldP8bompT9AjN?=
 =?us-ascii?Q?i89/zKSHS2ntDIm+non67O04PXTzZFCsFWmcTq6ZaxhPBdEs9xehRvpJ7aN/?=
 =?us-ascii?Q?5YL6Xj3iSvSSjLbe3eab5KL3RP6ZsPHA6UmaBjlNql6N3KOEEZzDXEOsR/Z6?=
 =?us-ascii?Q?Ld2uwICk8pH+VjOGxyJbsu4x8z7ZlosU2gGxjT66iJNMKFf95txXc2jQB76N?=
 =?us-ascii?Q?pOv/RVeZlfe1+2oEmug=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea18079-b7a1-4766-8995-08dc2824b209
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2024 21:35:25.0047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbdxsoLUw0UbqEjc+8MX6XRLuVqGK/JB5PvQy4mFeYTt9L+XfGqT9wxjhz/495xrU0wcGFl0jDLRFMHUj64cCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841

[AMD Official Use Only - General]

> -----Original Message-----
> From: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Sent: Wednesday, February 7, 2024 15:28
> To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>
> Subject: V2: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
>
> The following changes since commit
> bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:
>
>   amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-
> 02 16:58:17 -0500)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-02-07
>
> for you to fetch changes up to
> e34e1e5078b8020c789c7f11e0176c86630f4d3f:
>
>   amdgpu: DMCUB Updates for DCN321: 7.0.38.0 (2024-02-07 16:13:19 -
> 0500)
>
> V1 PR had a wrong path for the files, which has been fixed in this V2.
>
> ----------------------------------------------------------------
> Aurabindo Pillai (2):
>       amdgpu: DMCUB updates for Yellow Carp: 4.0.68.0
>       amdgpu: DMCUB Updates for DCN321: 7.0.38.0
>
>  amdgpu/dcn_3_2_1_dmcub.bin   | Bin 232224 -> 232224 bytes
>  amdgpu/yellow_carp_dmcub.bin | Bin 234768 -> 234768 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/amdgpu/dcn_3_2_1_dmcub.bin
> b/amdgpu/dcn_3_2_1_dmcub.bin
> index 42790cd8..e463012b 100644
> Binary files a/amdgpu/dcn_3_2_1_dmcub.bin and
> b/amdgpu/dcn_3_2_1_dmcub.bin differ
> diff --git a/amdgpu/yellow_carp_dmcub.bin
> b/amdgpu/yellow_carp_dmcub.bin
> index a72743bc..5b634a72 100644
> Binary files a/amdgpu/yellow_carp_dmcub.bin and
> b/amdgpu/yellow_carp_dmcub.bin differ

Merged, thanks.
