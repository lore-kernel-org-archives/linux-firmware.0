Return-Path: <SRS0=1siG=OC=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3C7C30658
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jul 2024 19:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E1AEC4AF0A; Tue,  2 Jul 2024 19:11:51 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1583FC116B1;
	Tue,  2 Jul 2024 19:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1583FC116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBOZ8x7ucx4nMOO1+XPpu7uFoESjqohLw1qABGTmXHeGeMsl/Ba021P6W+tkLVYgb6RU/eBkxmmGMxus7OGxLPQBJIS7jCYeMBEhmufuUteXxBu0FpLKEAbKFYJrxDpyziUzZChxnKppfkKYFUMdcipUVpl94K11PC6yKOFrszEywK6wS1hqZI74QGQerJPg/EM9pZwnrjxrugxi22FN0WnA/tVWtXEAn/FW5AZQtPOsCi5ENe8OJjc4ziSlhg2dm+X99DcWappnmGNEUAz8+eV8rtH+TTIqL52EmZL6nS4nzFIkZMweGta9qb8JzIYMhHkf7qxc1iiKVnd7408bUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xu5uCJH5Mea4iojOSFAidlAeBGk/3NWRlbmLzfPVQwg=;
 b=MUZJ/Ze1Rdkbmr7Ww5WJw28wtJOpKFtYwVFke6ok0ycJtJ6q2Wm+za38fYVS/efHf65gzr+AMuS7lpbniaHhrHas5PPTj+t0ZHVwr6ryWN+UB6nGsI4R6Bd0HVEVSJzZWUFsBpzUNuwKLN0lFR2/mcgAXnzO/B5ZhFVhntsE+8KBb1Ex1n8YG4meEIlyu0bZK8dgLAOvWZ9GkoQJjqpWGmfgV5cuitxDZ0D+9Cx1ZfG/isbssXi5QlfEmBsQxy4hcASZaJc7/juntOO/IwHFHrzuseK78dyVdSu0sSvw+d2Th0Q79NXBk8WVzBQ4lnMjJYjSTyXjXVukuEEDQxLu2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xu5uCJH5Mea4iojOSFAidlAeBGk/3NWRlbmLzfPVQwg=;
 b=vIiOFTfymVRvfHDL2r0KQncrwY+E0COywiHqg/ZnqpNEIC+XIWI/jKrq6YWNvCDuFjKOhRRx+Evzcf5Yu3hGjueEGAekxLrR6hdHlp0KvlZzC1/y8QOBwTdFoQVY7+XGCe9IacwbgU4572aLt6KdKgoKZFd9NpkT4Iy3mzh3GDw=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 19:11:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 19:11:46 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Zuo, Jerry" <Jerry.Zuo@amd.com>, Josh Boyer <jwboyer@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Sharma, Deepak"
	<Deepak.Sharma@amd.com>
Subject: RE: pull request: amdgpu: update DMCUB firmware to v0.0.224.0\n
Thread-Topic: pull request: amdgpu: update DMCUB firmware to v0.0.224.0\n
Thread-Index: AQHazLMc1/bqpxUJzEygE9GUv9p7fLHjzfHg
Date: Tue, 2 Jul 2024 19:11:46 +0000
Message-ID:
 <MN0PR12MB6101A5032440582762B2097AE2DC2@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20240702190734.9472-1-Jerry.Zuo@amd.com>
In-Reply-To: <20240702190734.9472-1-Jerry.Zuo@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=72bd4347-e3c3-408b-a104-3060d2dcea3b;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-02T19:11:41Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DM6PR12MB4219:EE_
x-ms-office365-filtering-correlation-id: ab1c5046-9551-4def-4c34-08dc9acad182
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5GrtXwsadORWqHV/fOqi64ormrARkXDDx/7wncPxEyBV9xCaQM2sVea3mMin?=
 =?us-ascii?Q?eOI5GuvALdmEEIsKHemARR7y8SZJQk2UCCotnmPit/a9A0nUqhNmeNRIxMd2?=
 =?us-ascii?Q?DgaprSzCY26ug09jw40jaZrl84MhOe3ZA0lZTWTcOBmjzQ6C6BqVE13ee7m2?=
 =?us-ascii?Q?jkAUcwEQXJVCKLm9Zy9GiB5BR5Baun8WXIgmTX0JLY4WIAKeMI+bTxlMRhC6?=
 =?us-ascii?Q?6bkiPcIckiESJvdHHvG1yHFQTrSiO3/Rz+RD8B3DfYT5hcNKzeR9wTy8LgTh?=
 =?us-ascii?Q?52MoD74LvyjWirr9PhZ7pt4eiIo4SpiHujJjyFe24by3GMYW7jwv3oq+A9s8?=
 =?us-ascii?Q?h/SsPCLd1uSOPa8b16HMErtDeua6WaoCJR7t9cuwJBKSlZ2Dhx4gvQT3+af6?=
 =?us-ascii?Q?ydY4twTqS2KD4S45ykZCljwAPww5OHiYRT2aDYFU4oa4+fZ3ui7+oeW2Z2vz?=
 =?us-ascii?Q?+rWy+Npl2FE2qyX/THJ3xCf/eZ1Nv2XYFP67gHgoDRk+7/hdS8I0VWSLrNVz?=
 =?us-ascii?Q?Dg1vJoI66nZMDZ735Rhih6CxaK6g5OhiC5liS4QmkAuMjjvj83p5SBFc/++o?=
 =?us-ascii?Q?7Zb45asi1yNopueYvygEfSPawWYzKNEtmdE68WTuczLUMUiw7ZukC7WlgKKJ?=
 =?us-ascii?Q?2R3NUR85ykI2lXp8nQNxz1r77/41n0AKTWMXxit0PBV7cjbFm3812blRzh93?=
 =?us-ascii?Q?ra9HJzN6rZYZQYz4BuhDoiO3Tt7fnk3iMjWy1LJkg5TWo5CqZcwt6ark0XQZ?=
 =?us-ascii?Q?xiZeweon8HPNERM/h6jpmkKn2B4oswszOl+5PVQT1yBtLw7e7ISnzlnh4MR3?=
 =?us-ascii?Q?bSA0VWZwJgXqLS0qNzPDKF3CNG7SqiedQTmis0SpUB6UD/BiXqcYUfbj5kkr?=
 =?us-ascii?Q?aaBccQ0WgYU0Sx6PUCYuVCJSTScP46deyqxssiBRH1wJaFr5x6fUm+pj6o5f?=
 =?us-ascii?Q?8rGu3vAQ+DoA2iMm8eGkEliyyfAuUDa8I3xO3oaoe5qnpJQc/4eQHd9MucLR?=
 =?us-ascii?Q?5sUfNE4+4PQ37xvoHSoetbIlwwxsZxY0rsjGZ8UTGgG40NslLjjyQWb6Wdbq?=
 =?us-ascii?Q?djHjsAa2PrrP0bD8DGByq67C0Dc6LtOYC+2uHHKJ9P2t2imCEM64JT4z8xeL?=
 =?us-ascii?Q?1Sj4Pe8CnB2GrmJ0QpTDyA9/oiJEgEl0GD2g7+ad0iKKW3KfYWe6xHYjgVIF?=
 =?us-ascii?Q?a1QTQSWSPVVr3KzjbwWQDCybsEGxAH9eN3LneIB4Ln/6FrRbIgLuK6UGFHe+?=
 =?us-ascii?Q?X7DlWvwgdt2hhZjd/BfsDjtYBUtUSN81unycPHbrsjMHq1EpN8zeT8EWEU4n?=
 =?us-ascii?Q?NpO3uTomi0CzP2wNfqSxK4Di2bLU0ZF1H4t5s3GPAIZppqIoPMLAKXlrcCkN?=
 =?us-ascii?Q?D4Ae4sk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Lyy11FqmCk5JLWP+/aqc1RKZccNZSqwPR3VktKoQal+KCwFgL8k7ZNPSBw+n?=
 =?us-ascii?Q?8bwrXksHUHQxdlFiniQbL/rwz4601+chynLO4ihCgz9cwEY17LpVLfqCnTzn?=
 =?us-ascii?Q?s4X4EIVKRqEn8fJy6s2tqahjvy2+0Go7iqDtYVeB6w3m2Dn13lj8z0A0G5Nw?=
 =?us-ascii?Q?LelUnesOrf0MyobbjIuJa5jH/YkgxQWsO2PNC4qmoggd/MidkoANq9f9ojSs?=
 =?us-ascii?Q?GJq6U2slOI00lPDXpjNl2qgsFbl+EtLA2G8x0sQrjM8eWrE3jaYVz9N9vxjx?=
 =?us-ascii?Q?tVqdOnDrw/aoKNwL+3RNnTkAXfsHBJJrot5Prw9SWpliKbKe5kEGAmeODbaz?=
 =?us-ascii?Q?e/QiQ2rfUqZPcJOPS3Rvn99gj1AzMNWGNO5ftJoVj5HiB2N68gvj4DBVeR8Q?=
 =?us-ascii?Q?6PvBKkeUXzHghosRZXZ4BMEX2MtpgdYwOMg9M/vFsf044RXcsVtgpJBhAvYC?=
 =?us-ascii?Q?sJuTtAMGRL6hdiGK85Iqsf9ZBwdFRFUS+FceXXR4yZfH2Y17xHaP4VuGnQCE?=
 =?us-ascii?Q?tLEVQq2MBwPYZ+6yQwK5y69LDM5zN3x5S1wLpg8xD5pq06IdYzjjTwBI4Izq?=
 =?us-ascii?Q?d0CvVDeqifZDE4jSIgiRG+nijSokLogp4Jt6mbyK0skJNoNl5PFrNf21sYPC?=
 =?us-ascii?Q?RZgumERhinqxYSwAC1GsKqNwHroZSqWw068HmnQl8IxjSuCuFKDpZLl2JfMu?=
 =?us-ascii?Q?QFOqdt7mCbjQQdzJnByTvxdlt5FOR+f2CL3phcO9a3vcypF+FfTaAE4e2ShG?=
 =?us-ascii?Q?T1mnpHoe8JgOpt7W2RB/Q9Wo6shZiVFwGdPv/Z1VDQ+e4I4jzuGF1qu0tYPM?=
 =?us-ascii?Q?wXfH3/IXF8TTV9jVnWykjjGfLjeyuuVAz3bca1ramWLcJpF6LvfVf8NRxF7X?=
 =?us-ascii?Q?TYy1qnoBBHPXNbencZgNTwMvNryyu9zRNejydcW2deyFPMgjyIxFOWmd/Ix8?=
 =?us-ascii?Q?jKAOgp3u+UT//F+zLXwPSanujOpw22DJ+SXbrFcGVsMm8n3NoA2C2OD8Upjh?=
 =?us-ascii?Q?w8gfgmBKM1ZVxPOKasBVroNdbgQlW+V4e1ficpxwmEBBnGNXmLn9qeov6/7i?=
 =?us-ascii?Q?ME1i+lprrURd3YeGKYwfNkbe/+clOO8nXN5MVNl7NDr2aidu759KK7p7WQCM?=
 =?us-ascii?Q?4ZtaApuFqaC6At7Sd6h0Yy+Jfk2J6E8UIeWCBzHh8jLWIQgMVRtPV5AdG0Vn?=
 =?us-ascii?Q?R6F6DTYm5FL21g37j+ccEBgJyxHTJcMzG6M42j3nvHzsm4NBDzpSNLXghmVM?=
 =?us-ascii?Q?NojWmxco9UynZsbmRDAzpdVG/7yqLp7Q6K/sUC6En3zku3PoaJ0QX2C2HuAH?=
 =?us-ascii?Q?4fnTazNAymSltxtlYYIJBMc2Q2s+Wd++YMUTrW12K2h9117DulalRLOyBVuF?=
 =?us-ascii?Q?Q4jjvC+6WUsfaoY5eW6er6Zi4Npqul8qEQAXpS50WNQWMYOs82Xpy9I5IRIo?=
 =?us-ascii?Q?TucqAqH7dmf7Iy6D57AV+VkD9tiSArUd9VPXlQMlWlHCKlae0TNjxLwI1eXQ?=
 =?us-ascii?Q?XXDL2Vb+tWkAmtr3x0Kt8q9pp3L7h8xaUatlwSb8WEK2HNCysQxCf5ptu50H?=
 =?us-ascii?Q?EdTpIkTAgwgF8HaKiG4DnEfo6EBh2uSoalvH/AerXvl9C0Fcq0ngfrMrl5LP?=
 =?us-ascii?Q?RYYS83R0D2daI0ULbBrH8vAs/9HVXI0S3KlDODNAzvQ5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1c5046-9551-4def-4c34-08dc9acad182
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 19:11:46.8477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+RcM7Dbrt3G2LxfYAWkTj6fnGZGLvOZLSmChOqAA/B/m4RpV3h61n+f/ovvh1vS8Z5WxNFyStiFPGEo+NGxJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

[AMD Official Use Only - AMD Internal Distribution Only]

Merged, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/commit/e8b09280fa5f5658=
b9eb2aee4b129b8776e57e30

> -----Original Message-----
> From: Fangzhi Zuo <Jerry.Zuo@amd.com>
> Sent: Tuesday, July 2, 2024 14:08
> To: Josh Boyer <jwboyer@kernel.org>; linux-firmware@kernel.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Sharma, Deepak
> <Deepak.Sharma@amd.com>
> Subject: pull request: amdgpu: update DMCUB firmware to v0.0.224.0\n
>
>   amdgpu: update DMCUB to v0.0.224.0 for Various AMDGPU Asics (2024-
> 06-28 15:23:55 -0400)
>
> are available in the Git repository at:
>
>   git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-06-28
>
> for you to fetch changes up to 6ae2bb3fcc9c093efa62cc7c27357ff7fc3d83e4:
>
>   amdgpu: update DMCUB to v0.0.224.0 for Various AMDGPU Asics (2024-
> 06-28 15:23:55 -0400)
>
> ----------------------------------------------------------------
