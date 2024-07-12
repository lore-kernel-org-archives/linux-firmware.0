Return-Path: <SRS0=1/ZP=OM=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE53CC2BD09
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Jul 2024 19:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CA9FC4AF09; Fri, 12 Jul 2024 19:18:01 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 349D9C32782;
	Fri, 12 Jul 2024 19:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 349D9C32782
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=axbmG0OFYAoIG6NZHNTARNEHZ+vStgsk8I9G6RqvlbdB/ixp9OA5YXD2MCKVOdDW+0LEPeoAehWvB0i7v+vGhX31y88qkDwTgN7binkBv210chsVbOH+uqfSfFAChdHXu3KLkvv8TAjBDjBjODofiiu+69ObjRk1BZx96nkw0VdE6FWNz98uI0wpba8YTvyE3ANbCL4dsv/k4JW2hw/QCu865qMfJGKhCLxFHXtZIU9F8odUncF/84mYOTFhGkf7LdaRRqD9hXe0uN8tRVLNIEu9nXSyTmsSo8NvTUXL8xMtYqxij4FNKQdg3AapOnMJ5g6E2K3GRQPmAPOlvCtMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJx0TgsZns04brkpUS6WDRsalQHtycS97EJY2LDhmlk=;
 b=r3aqtAOS1CxLRhdDkae5SwRHl+E5icZPAKHRyexQyTFNLyrrTeNaFYJNkUglcQCwRWwoMzl4z5WiefpDszUE/RsPi0M24wmkzEqXGpLQv1jVk6xSgbhlVcfilzjh0y8BbyXe/kwRW8rBEFoF4MPBCodnjmJBon2ZBTSuXoQN49iNQhlfRfSW7LR/HGQCLXmALYuCe2CDnHyQCxu0VdoLt+bowGRcaNiRLaFtj7Jm2jtYc0gvtyHIEWZNa1CvfVyTvabsRtj5IYhrwEo6Hex387zWTsHs46T6dsYRP/rcoLXgcsXrnNuIqG0jdXlKk/TtRnHJxR2aaEsXtiwinYA0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJx0TgsZns04brkpUS6WDRsalQHtycS97EJY2LDhmlk=;
 b=l3918GsXPYuSqfo45GKI2t+WFLHjE1wkbUFLXHJPc4QjSmpRJ3C6we43OeZyehugl3WWB0QfgfLoGs7yHMPMCiBO9JpWr2p9lpawA0jhp5wySzVJcGx6YP5ZtW1k1EvjG9JrREWG5vCdFNri4zCFGuK5/wVefRfR+/FbRdQNjQw=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB6080.namprd12.prod.outlook.com (2603:10b6:208:3c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 19:17:57 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7741.033; Fri, 12 Jul 2024
 19:17:56 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, Josh Boyer <jwboyer@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: pull request: amdgpu: update DMCUB firmware to vv0.0.225.0\n
Thread-Topic: pull request: amdgpu: update DMCUB firmware to vv0.0.225.0\n
Thread-Index: AQHa1I3PZZJF8QhHAEC1ttjST0OivrHzd0Ow
Date: Fri, 12 Jul 2024 19:17:56 +0000
Message-ID:
 <MN0PR12MB6101D754CDA26CAD53E79389E2A62@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20240712190039.200992-1-Jerry.Zuo@amd.com>
In-Reply-To: <20240712190039.200992-1-Jerry.Zuo@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=dce78901-76e7-48b9-b881-452003e4090e;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-12T19:17:49Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|MN0PR12MB6080:EE_
x-ms-office365-filtering-correlation-id: 7c469085-533c-4ffd-5e35-08dca2a7561d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sq35ew6E3yKO06KssqIYlEDknzik1aRd/F9cuCT5xwwWBbVdmWSbBjCDFwEB?=
 =?us-ascii?Q?A8fWydCtlX2AtQgo8yRA38fZf9F+vOKzzKbjR+zEMvBGSNd30s+65V+utMCE?=
 =?us-ascii?Q?WOx5OWeh8ZuqmjFUCMJZ3yEYF7Oq52qD6LOlqCVi+rawV0dkG3OsWqUZIao9?=
 =?us-ascii?Q?yZrT8bUg+GNTMk9c90Kg/cMhAh8NCoIwjbVRo5MW1sdRZE9qPJo4zqIyLzs1?=
 =?us-ascii?Q?HCIhQPqLp1hEM5iiu8KEnym+rcRxPzBxmySS0JxdcWss/IMgvgdO0ljXV64Y?=
 =?us-ascii?Q?WCKh7p6HKGJsvm4SaTEb9zW7uq7SJ/FLRUsd2G3Ky/vGfv1DnLsIEOT/aW6O?=
 =?us-ascii?Q?7ANoxobon2eyvm1WoyR39YL8JZkEjYdfHKa3hPHpxHcVzhv6i8n01zQnIx7V?=
 =?us-ascii?Q?flbafZCh5+X4U7zlpENf7H7ZWFq3ooKQgzi31ybnf1N43+dFgXkEkiQgsaO6?=
 =?us-ascii?Q?kXQlfKBlmhvOuGMWYFVPgNnRJqKq74sY/wy8T/kILQAjKMfahECcQgTPXWp6?=
 =?us-ascii?Q?+BSATvf3d5IIGhiicyFPY21GLss3ukrTlLfOzxGxUD0NFECDrCR9SecscWea?=
 =?us-ascii?Q?9xY6pE0cmfp8Nw50eRezCOqsHtWkBrtjCdZqYEeRlkZrSa+8GDPxmi5/hpIT?=
 =?us-ascii?Q?IynO896CuLAPSQ0lRvc28WVnE6XAFXNtRgAk1C2ECqvjkkGZ+RkDh1BQMHe4?=
 =?us-ascii?Q?B3fiHGLr//gR4MKgxFPGa1UG2g+TGDD5ECbC3yPTupenRtz1giiMxu8YSILl?=
 =?us-ascii?Q?ZICNJwpkSxzS8IelFDKdDBT/uvSz36O4JNpOUuEt59JHNe5lM4N94R5tNuvY?=
 =?us-ascii?Q?frQRi4CJjJVFOJgQtP8h/4N61kh9ceu/hf3mnitvouIYYxoixAJBigASPzmT?=
 =?us-ascii?Q?ntBNwUKIH7qFzDtzOdhV6MO9uLbJs33sLhnPMZxSTeYtWjekJQDQxn4z5Sk7?=
 =?us-ascii?Q?gmAi7GlCSm1ttGYnqEOV0w4LCs5b/G8ctDFKltcf44hJm4zBKugtCXU6725B?=
 =?us-ascii?Q?ydxzqKNfn2oPmbYhoSHe92ODv6HWozCabbZpXShQb4d6+s+I/xuHmfbrzu+N?=
 =?us-ascii?Q?ldwrX6oY1NopZe056G05baqoEJCi6hojNdGQ05gW25gBQz5j/VMfbzKgGHUD?=
 =?us-ascii?Q?xxsleGy5Iw9b8ifIMfa5M3Ginh7pxibmuiqO1Taq2Ekf0y2O3phpc1LldVA+?=
 =?us-ascii?Q?hKGnqBlxJXeBgwc4FqnoiMWKOdp/S76LOt0OaJLnuHsUHf0XFBwpid0FjKU1?=
 =?us-ascii?Q?DrVk5sysJUkN4SwT66h19uxIW467T/bsEyIqkysXxzTqlQVGOqD/BmvWUi/Y?=
 =?us-ascii?Q?TZ1oJRmnuQyiqtln8sD9Hc2I+rF4kd9DbTa91iHwpBj+U40mIuRg7xQSEEbZ?=
 =?us-ascii?Q?bLlF5TCUlBKcmov/H1FylJ5srTHM0MxVH03sDgU7ejOO/afv4w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/7kJC04TS3NdAXT7CXycdREftBnVpf8cFikTyERXef+8cGTB6Hi5yQvDDO5E?=
 =?us-ascii?Q?XQcmQv5BTl4ExiA4wmTOLRJZ3jr/bLSrjUFtMJQpVE0joaS6n+tqOfoOtybs?=
 =?us-ascii?Q?JJjChAh5E64/HxlP0CpVGj6bXrLD0naGbO58fOvMa79/Ol8cKs8FoCdyKNsL?=
 =?us-ascii?Q?5MnFEuk6sWpmTHL9To1SAK1ITalAm/J2Bw2cFjxWbAwfDnIL7Vlhya+KXfq8?=
 =?us-ascii?Q?uWpe1oBceqmhRxXQBas8ivGhQiRgjjNzSIy2ShDXIOw1CPmgU6BPCk20FYwL?=
 =?us-ascii?Q?Ka92ZtUYBtJUYfg3k0rEGNYL+cL54E/c/3pDPmRYx6mYrvcFdleM6svvP7ns?=
 =?us-ascii?Q?sqAmUhAztrxyHh7dxLn0McJfqtLPRa4IvKmfFnormj3/8YBhNljdeH+PKrkl?=
 =?us-ascii?Q?tC4LOG10it2s2vkVrM4G/ap1HV7ZUS4a4VGrhI9Qe8GE17wxNKeIeQ3+rMdu?=
 =?us-ascii?Q?veX59S9t2U2w/Afa5MpiCCHnMOXvTuYr83IsMEP7Nlr371E1OfHoowkU+rQk?=
 =?us-ascii?Q?ihKR7L7cX84QOEPPzbIw0GhyhXtRZVaQzzobkDM7InMGu1UH+XNXhdByh4q7?=
 =?us-ascii?Q?YLFJ9Ge7Uce7RjrwtZ28iwz72gZl+FkvqXmCtSFVt8GHIjKIQFABkkWPxZfx?=
 =?us-ascii?Q?BUEGE3YFCfNCyzug8ktUzbO1SIB0Zn6l9e3THzBzPlYlvl+28vJ316FZoJbv?=
 =?us-ascii?Q?xtFCZg70+ray9aKBMspJpUilo5V5aM/bCs7mjGSNYVt+qJos7FlkhoJlpI6I?=
 =?us-ascii?Q?OXarqzMZbkXofwGv/szOCzYsZoNF0d9xtCdK7KzDdDIjfWkBNV8elMTMdV5Q?=
 =?us-ascii?Q?2XyNoPJ1eae052+MegNGIgVW/BfY/Qu4Kh9uAB8TjO0xSTBhhDMxmVXU/7J4?=
 =?us-ascii?Q?CTqZxw9NpBEwDU0f4nIqmk/StZTOHL33454wWcdg7D/1r1EqhznIgViRv1Nf?=
 =?us-ascii?Q?TWNkheDX/C8/W14M/gBCmnV16ZaRy5SmbMsqvMGgg1SwnoTqstgvUSCSmYYV?=
 =?us-ascii?Q?jC1E/bqQiknPaiIN7gXnf4HnX/WHJi8wvDPI7toW/XZpXPlnzD5rvrIkZa9S?=
 =?us-ascii?Q?xiAm6kjY/0OyDUCZCUrpd3S5diOiM3xBbm/2LSTuitzdP80URovr0ScQ2Rtt?=
 =?us-ascii?Q?eXKrwGLret68FjBIoa1Byc+RSNZUOxXBR2x4nkgMJjEEyiB1AqOD5A5K+lEO?=
 =?us-ascii?Q?/jBDEFb0XBCGe5mViazLPwJFobwcg+leXXHyuIeHaZs+O6gbCS2moghIQ7Am?=
 =?us-ascii?Q?frx5pY4/UciXxiOkTuhzuMGuz7gQJsI40XhS6WhYs/h4xFQlshofbizZNHBG?=
 =?us-ascii?Q?4e4lyw8yMw4kmmSbUuuYDmri0cTNYAp7Ph8lXSXVAUh82wH8+W7kvlbmw8wG?=
 =?us-ascii?Q?XoX+5UTYKr6stHk8c4LO9wJZSwAuEhFaD3NFRbvDyLs5rM7Ege+KVOVExnai?=
 =?us-ascii?Q?e6yY8YK9hOdg8PBkjQ0RGsMYYKkOzW9aQvMbzVZqgK9o8scEKBemU3lDKv2F?=
 =?us-ascii?Q?DDultZ53wYwFDOYa+vEGggP0CdwZxz9xbd97lTS9QfsOmCv4nBr5nnvDBI+p?=
 =?us-ascii?Q?3iSvHMeM/bwDHCjoek0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c469085-533c-4ffd-5e35-08dca2a7561d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 19:17:56.7407
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wUGt4mTcEwoclPBl1xUX/jb1Kohzbxvxgtr8IeziP/vmzSzXOSjbrYvuD68mow7JTf1ha7tIRISNdoGvRxQf8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6080

[AMD Official Use Only - AMD Internal Distribution Only]

Merged, thanks!

> -----Original Message-----
> From: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Sent: Friday, July 12, 2024 14:01
> To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>
> Subject: pull request: amdgpu: update DMCUB firmware to vv0.0.225.0\n
>
>   amdgpu: update DMCUB to v0.0.225.0 for Various AMDGPU Asics (2024-
> 07-12 14:35:30 -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-07-12
>
> for you to fetch changes up to
> 96447dfe5542b8576c32ddab07e8cf604f4d0903:
>
>   amdgpu: update DMCUB to v0.0.225.0 for Various AMDGPU Asics (2024-
> 07-12 14:35:30 -0400)
>
> ----------------------------------------------------------------
