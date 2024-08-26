Return-Path: <SRS0=5no8=PZ=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D722C5321D
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Aug 2024 20:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17703C4AF15; Mon, 26 Aug 2024 20:01:57 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB1BFC4AF11;
	Mon, 26 Aug 2024 20:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB1BFC4AF11
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDfPUe5AywmhS10dk+5/b3Wxw/0QyDWZ/1H+iQ/nxY4i1RwrIDE4drNYfmORHKt853hmj6jsbGtKzRlaiRUl3Vffg3Vckm1TchOYL2GkceD673zzsfAJKDU40v3RD/Ni0rXMeNoIAfFam9nfFLBruTHT438ZrrnfyTVYO0TTOi+TtakwdoyNgMbrs2Meqm1ssIkMqKSGbPwRNJfxqaS8N/XfTCH/NFfaJVItlyu9+LLp/YwnsKMljflfjc4nku0grHfLBdMySOixqWxbXCnFhcPyGpyL2DLn0Y+mozWDI/8y82tLbg/FY2VDDHTrpc2mSXRlK+QjFo9+XWq4hosZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf6XCZ6rc/OgkjMrinvx+8TURcZbN2HRYWsTw1UzwX4=;
 b=dmwuiqjy5tNvVXMIirrWeAl4hkzgxL6Cs07iJPpDuUIhMqtWlhZVZ5liZU9t94ubn6lsCUsQ/IbUXYwKSabRwHmdGKungimE4R7Lp8PfqNqrO5/M1a6pzDue1QjTUJ7JkACDRBXOJByp1x8LcBBlEAtZRsmGe38M0AudXzMmdHzacqZyE+fOprs4c9pNJDPJf44bassO3A1piuRUKrU8LGX3MiDRCsVb6+gLX1x7/wU6OXJ1d3Cp4C6GlDLjpF9u6ViZ7U6vPjQ3gzVeElL3OPN9Y7ArfsX0q3WJU8BZF8A9gPSdIjwWjlOIWCHy8MGWmnTqoMlOZQDuFU1Vn029lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf6XCZ6rc/OgkjMrinvx+8TURcZbN2HRYWsTw1UzwX4=;
 b=U2kP6/n/0g22/VLREf+/5PNMUu/1gUlSm3vlKolDDqsNPMILNJeVmCsW3cuYEt/7sg5wUMVfZdyFzhENH1ZLamPT6nb8I6iRhqybXFWWADx+rF3vp6jqZkeWavY9arbM/VbZ5279qrrnTMNT9AMDVqmmypgOZleoNDJN9J07LLM=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 20:01:50 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 20:01:50 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Mohamed, Zaeem" <Zaeem.Mohamed@amd.com>, Josh Boyer <jwboyer@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: pull request: amdgpu: update DMCUB firmware to v0.0.231.0\n
Thread-Topic: pull request: amdgpu: update DMCUB firmware to v0.0.231.0\n
Thread-Index: AQHa9+8qhvsK1tWeP0auewdhZH5hg7I59azA
Date: Mon, 26 Aug 2024 20:01:50 +0000
Message-ID:
 <MN0PR12MB61019F257D99207FCA5EEB8AE28B2@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20240826193535.121596-1-zaeem.mohamed@amd.com>
In-Reply-To: <20240826193535.121596-1-zaeem.mohamed@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=70ae1e6d-5f70-48a7-8944-47cf181a8062;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-26T20:01:42Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB6859:EE_
x-ms-office365-filtering-correlation-id: 6093a419-8325-4c54-0c90-08dcc609ec5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?avLjhYyDVQ12EFqEO52gzZaAxHTm9bOpz3eego461Kl2quxadK73RySZ2NFv?=
 =?us-ascii?Q?6x7b1mYP8F+zi/QAwRZIHS/7QA0Ng76/ubco5PomaIjIgyh1iQMA+pVKzRYY?=
 =?us-ascii?Q?PMW++xW/AiYX3N+NPruBrJFqKrlcJkewS5WsUcGQkG3hb6YNaXKnNs6A3vd/?=
 =?us-ascii?Q?HQcZLUbLzRbmxwQXhgadK9xw6rOneP6sVgLorhjkq8bG73lLit8SyAmczsJN?=
 =?us-ascii?Q?WjtxgLsM0lJTygPu1XAun2wRo+YJsTv7Fd1A3GEtLaaQqtkZWky63fGDI+yP?=
 =?us-ascii?Q?QV0wmqbLiID6tIdaf3OLryxIN1b172/v14SFxj+dTl1dyKRJ5aicGqfn/wIU?=
 =?us-ascii?Q?DKWGV06AvuxpLQMyeKYBtewyifhBApy6dPygtSPKVOdvJKWYRDpAhfNnvanA?=
 =?us-ascii?Q?Vgj5Z5R0qVl4YLZeeqMsuWzl/3JaXtbHA9aBkVDL+Qc9FkVrK+iI0yAFxC3o?=
 =?us-ascii?Q?kP5aOUkHu0ptCgdEBxOxWuEI7aUEhxRmYruxFcZa4Aoft4nLaVkWMa0GIfaT?=
 =?us-ascii?Q?bq0C/qwUa9kFDR11GjuGV95Eksjl7gDMPUEdk3kYtpPDy70n/9wE6OHiZLuV?=
 =?us-ascii?Q?tTNsK5Sbejiq8QfgU80tYGCeTFf8huhgi2fQEJway3Bu3mFN+5SJPcdiB9pw?=
 =?us-ascii?Q?7cMSRh8AjxPAcIM/3ljGzLSQ/nX3XZv6ETdt3jHbhZv9y/exXvAupFQooF7V?=
 =?us-ascii?Q?uGnmcwOu2NuGNrh+n6fllPrnt5wTBgBKt2RK5yASp9oQvd8yE1ZxDmtgJbm2?=
 =?us-ascii?Q?wzhSxt/+rzZ+4CYe6N1LTQWOm1O6wGX6h8JQoAT1Go3xkGzjAiZGz87kfibF?=
 =?us-ascii?Q?B212fVcHp1lsTHLUErx/HUGUmfL7SD3sbnks81dXfo2TorDnoZZHUUWeINoT?=
 =?us-ascii?Q?8buDgwV0PGLCP0Tkh5TJxAGtRlaaqEZ58t+17lN+RBpvtJbpC1SeQY2wnz/0?=
 =?us-ascii?Q?ZVQA/yvYze7bpHb/tIncC+Q87icvM0PVyNrJMhWx4m2IfT1PlKqu2zKROVDN?=
 =?us-ascii?Q?ZDokBPgT2T4JLB1Gp4ouMMLxLVEyynUpShjCmnhoo3MrMF9kTzVrRYyf/lXH?=
 =?us-ascii?Q?o16Zp6V1bW1X4vVzAvSNAQy4aO6YRwwL+NlwG7HhWobQhHUjBpklTagl/+AF?=
 =?us-ascii?Q?HX1OkVeMIQZVI8+e3DJ64rhJZNUB+DbYl2Q43vsj0mQb3LtZCP3+f0wl0Y0N?=
 =?us-ascii?Q?NMF+M513ypxbYGG0wbK7ugC3g4JLzLybVpluF9RxY7y7IVvcUoqwyxPSkSQN?=
 =?us-ascii?Q?NOcXdiRYQP2qVsbcfF905xvnH3hrsKJmnx4xXNLWvEOadgaAgFgygmzZVEfR?=
 =?us-ascii?Q?v8lJOx5KaBjM/ETr+HtIkmo38jICNUuJbRqsp0pNbaeLHrFvRrAxCBv8jg4S?=
 =?us-ascii?Q?43RMl1lp0gIYa8mdBh1+DGzkrEsW7UEVeEkV2LRZcu86nG+b+g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JWlFhJBZ1t9KH1jNRXmUkA6n2+6LrfjY3uYrZEFuqSG6hQY0xLOgs1PKegDF?=
 =?us-ascii?Q?FpofvL6y8GWKmDJ4W1u6rECu9X1hVFjrPV83qe9p5GyDfboEOJN9p/wSfeA8?=
 =?us-ascii?Q?QmgdgnCYq43cTPLjvf0RZweaARZB9bblpTmI6AXPEVGOBmXKl/lbFcVq3Uos?=
 =?us-ascii?Q?c/XQBSQO1+SNnIrwR7x4+cPn7bC8j0wuNdL6eD90i0LyD3aZ1ixu3zuX3N6f?=
 =?us-ascii?Q?QG88YeaAezLq/dA9jVfSOC0Ohf/zdTOCDdhyEsf1tkZD1xaZqYEpBWO5jq9/?=
 =?us-ascii?Q?1RsORsxJkQZdleUoBfUhadmiELDwSVyrB24dcpWbwJJvO9guVm3Bt43RR+Wz?=
 =?us-ascii?Q?xwIWm6CPlRoG5QwDwr/iKgj5rWQ+X7s+YsSBmD6G1+xoZIxavPoXVzNTd3oI?=
 =?us-ascii?Q?lcZ/9T8QT0bgen/OepndVFJbMC7xcdih0sLNm2D6rV/IHQQtcbH3hzqd0aaW?=
 =?us-ascii?Q?hg2bYAMHK97mf+ypoUQ9Wrgc5Dz+QNLkDRuUqyh2+CWzSyhbO9KaYnr9U3XU?=
 =?us-ascii?Q?p+fEz+pQ9hRJNLrsK7mIASLjdV2ITVMWElatOioNS8AnRH3M2hns6YOBmgEJ?=
 =?us-ascii?Q?NUNAv8FVC2CndGj8jaQsu/9Ma5Ys5YClqJE4dZ6a+j6xAAcnTi6As4U3J6MJ?=
 =?us-ascii?Q?hUvWaAdGMGQ/RUQtKNnQq9Y9NJ4g+HXdEwub8Az6rj5qqAyOhErataLlhx/m?=
 =?us-ascii?Q?9jEKmDDsLrLo1ZMWrUO1uwjZ0zG9CTni6Z9mdY4/Co48lhoLmh+zgKts925T?=
 =?us-ascii?Q?8EwgJM6LmC+gDhFGTfwu2GpSmbAQUr6U0j+cArJhNZxBupHq04LigUbidKZs?=
 =?us-ascii?Q?3thZZg8Rm0K9ud8RdPA+0NMIgLqgothoMKVh5FCXWooYErqW6njh3NHh6xvo?=
 =?us-ascii?Q?upP7B2q38KeN42sEIL57n6yzboXh7O59QrYG8DFzGDrVkDo0In1xRBQfyOKy?=
 =?us-ascii?Q?M28vg/f4gv3T2B/ij/uKmiPFSUDokU+G39b4XEYt8zTfUbUvgJTpvmPa/sE/?=
 =?us-ascii?Q?zeLq1mRlKRiWeMnQTYKxQmra4aLI5PWhe2Gi5uUY3pfTeIZvAmePVBKtrxzk?=
 =?us-ascii?Q?yXa8acorJqqnDkxG+jwHhzCauERNsiO6Q73ppLg4UkaQJflOSrQyre3Tcsed?=
 =?us-ascii?Q?TV2x+BES6DJZWwkOs/whoEuJmFvsnPZN194ernicr6jTsgsd5Zjm7a025jzO?=
 =?us-ascii?Q?5zxXZxpY9HPLqwKNkTmqcG/bXuOgoxswt0pvZBPR6BaaoKro3we2B1uEdMnp?=
 =?us-ascii?Q?Eu8zwzP5V7co1YFPrPu/R8pSD5tAeEwm3PZuM4z5InmTIpxxO2LOPYbEAEi+?=
 =?us-ascii?Q?xaFkJjtW8RwMFMMilPZ6qo5w+X1yEIIm4l7GWOCuQb7TvA0hvH09qhIBAWkQ?=
 =?us-ascii?Q?JFMwlDW1lsw5kOSLmaXYseOKekR5k1Nvt7UpkCwp5ER6NHChyfK7F/71l9Nq?=
 =?us-ascii?Q?Ehm5YKaqJgwuB7lWODwTnGeh5nTVvPUSdxZS++KrgaDv/yYDqBewgBjgHNVj?=
 =?us-ascii?Q?Dx2ZG+Vnmd2oppZbf+e5EnEZ0Yd9uk36DmvOkzzBnJE/fPRtWXroEH5vExnf?=
 =?us-ascii?Q?UV3Jvey82NB7b/49r/4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6093a419-8325-4c54-0c90-08dcc609ec5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 20:01:50.1958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EwEdGt0CHZbw+44kcBI5OjhwWf1o/a11Fam9IyD3Fi0UFl7R++WiwU8RtwQv/Yz/jVMG4vzrjZ7JmCf24NS6PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859

[AMD Official Use Only - AMD Internal Distribution Only]

Merged, thanks.


> -----Original Message-----
> From: Mohamed, Zaeem <Zaeem.Mohamed@amd.com>
> Sent: Monday, August 26, 2024 14:36
> To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>
> Subject: pull request: amdgpu: update DMCUB firmware to v0.0.231.0\n
>
>   amdgpu: DMCUB updates forvarious AMDGPU ASICs (2024-08-26 09:47:24
> -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-08-20
>
> for you to fetch changes up to
> 3bddf4ddcaacdb4737fe2e59903a21556dc2eada:
>
>   amdgpu: DMCUB updates forvarious AMDGPU ASICs (2024-08-26 09:47:24
> -0400)
>
> ----------------------------------------------------------------
