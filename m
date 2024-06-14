Return-Path: <SRS0=yqFJ=NQ=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B8C27C6E
	for <linux-firmware@archiver.kernel.org>; Fri, 14 Jun 2024 19:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D663DC4AF1A; Fri, 14 Jun 2024 19:47:41 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6D76C2BD10;
	Fri, 14 Jun 2024 19:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6D76C2BD10
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAVgaT1Wp16xsvvv6zUhrb8qdifHKGHX8k4rhAxlhr4kGYaHRY1YQSJa5S0BRNoWcCF1a8VBOsU/fx1p664/4NCcS5NYtrKALmqEbDam/zazHTh1vM+Lr+dtu8j5upzbykz5DFbeprO5kOb2wg0Eo4p3lDEdlzilQsMXSOr12ROtUkduYrk941WHtX71Eu9d96ohNsa4gdww3K03czUGJVdd/l97/BJdFcyElxP7kJL33OW4yPjk5XOV/uQcINU7Exd9AY0Z6TPNgb5GD9gnOV4Qi7nLhYTz7UAVej0H+YbnGQ7WukENTDoUi7OBgiJDrr+tzpCXzxQvH+cCd3iGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJzgbWWEEGHjW88wVgFB8FKiDB5AoxmCF0bDxax3J/w=;
 b=hnilfYTjgN50g0IDffsrQcE0VDFu+4wyd3V1pYi1g2WbiM1l1a7D27EVbGR0nIq0QhcvJAAJHL8oHEHaNytRVzDieI1PD06iSVCp7SRUMSEATiFF1J3zo/5bHV+pw++QtHBdndTcSEBAeRuLfQsMkWpx2eyDs+U9smqG+n1VPYIbyc+v2m54uTDoJLNvi46uE+S4gMj1M8kC4JNterK0uFdwNLUQaTdwAcLhoh5vuJY0hXXoQx4ZrObYdGQ/PBIBsTPwKOCytlfEz0yo8Y/y2v73QKbwsfTE3Wgka07K6Yj78i1ssJVGf4NfnFB8lQCadqAjmDCzKt8rHb2VGBfhyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJzgbWWEEGHjW88wVgFB8FKiDB5AoxmCF0bDxax3J/w=;
 b=FTAbk4jvz/rHdOjOrOjxZgdrfhR81I5Wo89GuHR2uHC4qUbapxoiKAgVkLJq3fpXc7A+08wrGApRsWIME66w9cqTg0Ol8sXyHO9nrxrcypMjUlRypSczeiGEEbdx9Lwuek3xCmnQicqTPwRhLE5SaoIPAaKjaN4cPmu80Sd90oU=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH0PR12MB7981.namprd12.prod.outlook.com (2603:10b6:510:26c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Fri, 14 Jun
 2024 19:47:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 19:47:37 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, Josh Boyer <jwboyer@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: pull request: amdgpu: update DMCUB firmware to v0.0.222.0
Thread-Topic: pull request: amdgpu: update DMCUB firmware to v0.0.222.0
Thread-Index: AQHavo0J94JawAyAwkGwYEViUPIyi7HHqkmw
Date: Fri, 14 Jun 2024 19:47:37 +0000
Message-ID:
 <MN0PR12MB61014DE520124F70F2FAB03FE2C22@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20240614185936.249658-1-hamza.mahfooz@amd.com>
In-Reply-To: <20240614185936.249658-1-hamza.mahfooz@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=cf38e662-1819-4eec-8529-e8eeb93e3fd1;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-06-14T19:47:31Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH0PR12MB7981:EE_
x-ms-office365-filtering-correlation-id: 8c8b75f5-11ac-483a-76c8-08dc8caad80b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ncLSrQySgIGKVYM5l6lDd90BfuVlHtq3qgbF3YShRsIRiuew33Gip5kbKc8t?=
 =?us-ascii?Q?v6ZVjkzFA3IwmasH2G/0ckxsUlRPFaiBDcukkOYZ4uicG9NJxbYPDcn61jOX?=
 =?us-ascii?Q?T0bNOg2PxW+NLBCrKvc+B3GtIm593XD/NY3+TyvYW7+clStFyqt95yQCGUiF?=
 =?us-ascii?Q?T2YU/R3cxJpGRH+xtPE4WxncMZXQY1tKzE8++joiMLlwjBXNL7WvC768cm99?=
 =?us-ascii?Q?doLA52pz3/sqYFJHthpoc/juSChP4PJqgO8dkSlfm2pwhE/22Ri7u9E+YhaS?=
 =?us-ascii?Q?7kovm3eix9oEz9Eh5OjqdpyMIOArGyajsrpFvv14FGU3F7gz7/V9/6gow7Ts?=
 =?us-ascii?Q?tXkCKLi2HGvY/9u4appLV10KnCVr14OEsb4Qcu/S4K+oYItO3g5598aQ8AAX?=
 =?us-ascii?Q?SGW1OqOk7OOasKX0xqj3gzr20uNTmbH3uPSChSmifdu16JXjSSZVRMypLc9M?=
 =?us-ascii?Q?I7QWzB4vY1ZhSHKuNhmFVrbSGvlvtczzXAvl6TzNeiQaAHhlmILHOolgQ7W5?=
 =?us-ascii?Q?XjHi2MZe8mIgQho6JaFtNmhJkjXUdTt/vT4rWprm9ADhx/KUHsPDBp+SWc9J?=
 =?us-ascii?Q?hWZ4D7kkCBUGZg9nMKVPFPiXZr55GWpvzGMa4/+yvaHoJ5UTK3KSdEREE54y?=
 =?us-ascii?Q?L+RlfnTy5oZCxDZuozqkTE5hZdx17vfRu09vLDhB46zZ+uRyHQ7g5Q34PgU7?=
 =?us-ascii?Q?5S34iE6/AJrR3FJ/8yLQpc+8gnBkufmZySZgEwnsdziVZDG7UcjFpqVlgNKo?=
 =?us-ascii?Q?Vuuh5QmzesEQVevqjewjxGhJfiSTJc7NLZgiV2NApLxqRgPXBjR8lkyv6zGS?=
 =?us-ascii?Q?xA1Nzm53Su9PJDK4EICN/0HjjZT6U3oglqIvqAJgl+lTT8x348POTLOorMDT?=
 =?us-ascii?Q?94i+Rd2LEf96CCR7UkN/PBqRANyxSoF9PDHoU5ligCtf6dqdiY2cDvlvVGVh?=
 =?us-ascii?Q?n1xJ95fXGfDI37JR4LZv/a6rvXQRLAXcpXOuytOSeb6IJ9z7X/ZejvNYTarv?=
 =?us-ascii?Q?OKLznRN6gssAS5ywv3NFrikcu2LufCXhpKya089TbNd2F8uxITkbSAuQZ6hc?=
 =?us-ascii?Q?/Xt6WOQl9EXkCe/dOPY1W/FbKgqwRlEWLMDRWPpDS2K9GYjqjTImjAiEiPte?=
 =?us-ascii?Q?qnQYHiEpXsAbVMGbUFUX+20qFnYShYtItpxNN1pvWwjd4EOE9W8wEZk9NivR?=
 =?us-ascii?Q?vC1+9t3NB9CI/eMRO4N5hmvtHfSH6r6G/FNBsdas6rv31Qc2OqGiq7pEFUve?=
 =?us-ascii?Q?z6eU133nXGyEBN+MIDaZcAw2kTQjHlUn3ZUQFMEM0okmSVHvCVCFOeEjTDrF?=
 =?us-ascii?Q?4SD8TLOlv6BUrffEGoenQdC5dDvXx/t0ka6SKBfuGVUheR87+H4dBDhoGw0k?=
 =?us-ascii?Q?OSoZuJw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GEeYP076Ci7Q9eLdkE/SuK7AjO1tnxr6jhOzafGIlvzC23BzlcXuMdagkHhb?=
 =?us-ascii?Q?WjzAcnZ2Q2nBODZajKqD7863Bbl5honbuvfFyaMAKThD6IIMewdiblrSFrTt?=
 =?us-ascii?Q?THapHFA7pA6gliFBglm36XS1/EwS6u2L8JAsPqhATzTzUXSl5mNmmocVUizy?=
 =?us-ascii?Q?J798VSnlk50KzydS0UBHzB0IwbnOnH+0PYyVQ6ApbWSGQAp37OxPbo7ukSDH?=
 =?us-ascii?Q?wrJu/eC8PoQrAWNU7BgK6pGDBMsIhq3XF/1ubryQZOxy7+XPASE3K0ByFzeK?=
 =?us-ascii?Q?X0GBKGrY+ZvE1zv+GlgUaMl9go+FEFk/hJRa4b9M5ZJjBRRE6+C5veN3pTzK?=
 =?us-ascii?Q?Ro7aGJBh52U93B7vE/nvuSQ2cR8fxgEE13d3WTF3ujB7I6DYDzW9y7GTPodL?=
 =?us-ascii?Q?8RC7s2HUURwrSPCmmc7VvPvxK1C0w8ku1Wfr3sVBb6gipQ4cQppXYQbkJDkl?=
 =?us-ascii?Q?I+NoJBan/b+rV8nylmZcdsEWosVe/jhJ9OKlpfUiO3FAlT05+LDo3AtAMq1K?=
 =?us-ascii?Q?fW0M94fk5MZAke2nt6wKi7rfdVHHP9LqQeE6zkEA6FI5oHZvve8mFXQvC3U0?=
 =?us-ascii?Q?mVW1LxNCXM2Vnlb5Vu7PRVScX9wW2i42JGVZuZRJiuy7Q2w12gfbCbv95aYH?=
 =?us-ascii?Q?WzINWUVRYM5HLs213jmzBZBdRxpA4CchsCW1kHlAain0mKvxjQcXY5tM89ga?=
 =?us-ascii?Q?eu+kKtnLgGeg9WkfXbh+IMYvZQpw7D0Lb8QGny+vForTwHGEcEWJO91kCg1D?=
 =?us-ascii?Q?Bz1LkAXiohDYMTeOU0K4Iw1dd46rOvULDjFF2H61vsqv/4QpnslrNxM4t8RH?=
 =?us-ascii?Q?381aqqOxFx8osjUNHWopulj+lwUfzRkPEtCjDk2enrprS0X7SIPEDnr8hoKu?=
 =?us-ascii?Q?Ep9lWHhn/41htqQDq66ckG/myAk7j1N0q6H1uvGoAePN1UMJsxAyHVh4eAHB?=
 =?us-ascii?Q?D2qfgz5KdfYJzDdD/LlO1xs6xWLlS8KsW+exMVRe+cw0yvoSogz6i771JokP?=
 =?us-ascii?Q?gvbXvGysmChHAeqIYC7C6IKHtmFkmyraIwXSXi5TU/K6L6HcxphakuxWW+aI?=
 =?us-ascii?Q?M6lVDVF+PhFpbADlMUIgZyAhNlr8un7I5oICfq//a0n39CWvQCpnlYbWjf5p?=
 =?us-ascii?Q?93S35AY/uSUw/GPcID9ekaJJeney6xPdW9dOWgwjYmsiNVd+ioNqoMu4rr2g?=
 =?us-ascii?Q?CcoJzBkPhGfBib950qdImSe0kMGQResNgxcmXiv+FUuhCC0xXPXltELYZCmd?=
 =?us-ascii?Q?Eqaka9Q6O8lTpV0XDbVjodNPUMkdIJcDRyIMvEN71Eqk3uAmuDRsM4dfnEl0?=
 =?us-ascii?Q?MvifjUjtK+ML0U/jymbbEVbbtccoQNWgfv03s/XrLRlnz61jm7O1w6tQe33P?=
 =?us-ascii?Q?5uaVzxWZP0VprLi1Pgw38A5wdn+k3YEDYblNuGb3m5DvoVGbfso/KG08JJ+t?=
 =?us-ascii?Q?LCy5ICiJZXaZAiXyZB+8M9eszZARmknziLr9FBXTPvgAXywsL2kxG0GCyGZg?=
 =?us-ascii?Q?j37vHrpFq3yO/8bqcjm8Pq8h5va9hclu4Ovznfjyfcrp/PxEPhN1ghIVFilg?=
 =?us-ascii?Q?U7AMyGLJ5/hnep4CJPA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8b75f5-11ac-483a-76c8-08dc8caad80b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 19:47:37.6214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zjHJ+Dm1v5cNvEmZn3pismjt/8fP9nqWQ659lgEE3JCKMoLjeJHPtsxkFdZFmEcX9QmfFro8rdWl5+eaEj0JOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7981

[AMD Official Use Only - AMD Internal Distribution Only]

Merged, thanks!

> -----Original Message-----
> From: Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
> Sent: Friday, June 14, 2024 14:00
> To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>
> Subject: pull request: amdgpu: update DMCUB firmware to v0.0.222.0
>
> The following changes since commit
> 51372fc19e8e3d0cded8d96f1708030b3d51a7e8:
>
>   amdgpu: update DMCUB to v0.0.222.0 for DCN314 (2024-06-14 14:48:52 -
> 0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-06-14
>
> for you to fetch changes up to
> 51372fc19e8e3d0cded8d96f1708030b3d51a7e8:
>
>   amdgpu: update DMCUB to v0.0.222.0 for DCN314 (2024-06-14 14:48:52 -
> 0400)
>
> ----------------------------------------------------------------
