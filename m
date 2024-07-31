Return-Path: <SRS0=k2Mi=O7=amd.com=Pratap.Nirujogi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99982C3DA7F
	for <linux-firmware@archiver.kernel.org>; Wed, 31 Jul 2024 15:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A959C116B1; Wed, 31 Jul 2024 15:10:36 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1DECC4AF09;
	Wed, 31 Jul 2024 15:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1DECC4AF09
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ljh7pB2nYeqWBQ/pTaCItMkx8K9FhtIA37+M6wRHngXACo7tW8ufoC0PR7+fqJohNsCsmWhSujfZoJQSw7a3oSEPw5jmrMcbjeXvb6itSpybsakEaqF8L7TqJGkz9zNAUt2UPSoduUsYTax7s6lZHDTBaSdAv9/3XNyqR84fW/H+64unrTr0Um7WactNcT7RLQ2u9hiKrLibPix7KHENmCSrIsnjLtChXUwD5yh96iK8t6K7HWXWvNMNmL5JA9DjBS6dtIAraAAigUu4SZXZCuSNXpOLrdrE/SPE67zPQzkhYIrqFyGTvx+EsDa0uPdcU0tS6cN7tuUGO/QixG/HPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcQK3XnpNQp49dBI1homVlbvmsN44ISUoG/7Ro1lxOw=;
 b=r/DBzv5bOOZYlLuohehnzZpSafi37+Tysh8u/y/gYJKdZg8OGZgtoWUGGTfxYom2ItB6fc7xRO5PtymUJmXy849FlTZJj+sT0bA+Uz5oTiRwKgH3QU8d8xQZkiKEnlj40vCX85jD+rp77xtiRcphGQH0KJ/PvFe8X9PfhaimAiCKu+KpdcI0Pu38nts9Hl4pJmOdFUIMC3uhfvC5CoZQEdUdq1bLpBLMNZ0VxHIJJDCwcZA2rVM6Ji4K/Ag/lG0QbRqOhQvJjo1/lS3oMz/bH9z5xfruNosF3WQtenP1oSNOorLpHw64MmS1tT+BeHiY7MNyZiM93pwt3WK6Pbg5uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcQK3XnpNQp49dBI1homVlbvmsN44ISUoG/7Ro1lxOw=;
 b=C9qhc5j+UgwcezEOzeoYJlqP0vBKkg8S4WOdxo4Q0t0zLJ88jEe2JHjH5N003qPJ2XwimpEvcjIYHhJtWCUxmapkb6A1a0ZFjZuoleHv7UWdnWom3ZQTkCodfxeupCMgaMZTlmWPr85vylHCbPcdIO4UGa1LjoHQ8IWG/jU8tnM=
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 15:10:31 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 15:10:31 +0000
From: "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello, Mario"
	<Mario.Limonciello@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
	"Sharma, Deepak" <Deepak.Sharma@amd.com>, "Chan, Benjamin (Koon Pan)"
	<Benjamin.Chan@amd.com>, "Li, King" <King.Li@amd.com>, "Antony, Dominic"
	<Dominic.Antony@amd.com>
Subject: RE: pull request: amdgpu: Update ISP FW for isp v4.1.1
Thread-Topic: pull request: amdgpu: Update ISP FW for isp v4.1.1
Thread-Index: AQHa31BeYaBabrRnI0uJx8bd3hID+rIN2fiQgAMdWYA=
Date: Wed, 31 Jul 2024 15:10:30 +0000
Message-ID:
 <CY5PR12MB6429305FCAB027D268C80D5CFEB12@CY5PR12MB6429.namprd12.prod.outlook.com>
References: <20240725213856.115428-1-pratap.nirujogi@amd.com>
 <CA+5PVA7YT5-DT_ogTk8V=at0yE2SemCwW-t2pz=m1DSYMJ5Wtw@mail.gmail.com>
 <CY5PR12MB6429C30B38DCAE83D330C96EFEB72@CY5PR12MB6429.namprd12.prod.outlook.com>
In-Reply-To:
 <CY5PR12MB6429C30B38DCAE83D330C96EFEB72@CY5PR12MB6429.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=399c68e8-e074-495d-a980-14b1dad7cb74;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-29T15:30:53Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6429:EE_|SJ0PR12MB8140:EE_
x-ms-office365-filtering-correlation-id: 23b9e92e-1ad4-4d01-a6b2-08dcb172eb2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M0RFbzYvMWlQUmcyMnFTQ25pd0E2RUR3USsrVVVVcUZQUEsrb0xWRjgxTUNv?=
 =?utf-8?B?L2sxZ0F0dVk0QTVLdTNKK1V5dmpua2J3TW90dnBNdENaL0puSkpOaGt6eU5X?=
 =?utf-8?B?SHh6bWpuRmF3U2hVR3hsVlZTQ0Q3cmpUeTZjKzVpOXl4VWo0UDJaM2hVR2FZ?=
 =?utf-8?B?MmxsWTBJQ2dKL3o0MFFCcktGanl2SkxIZ1RYMFphcm03b1d6eFBPYWhnTlFP?=
 =?utf-8?B?T0JKUVBxUlk4Smd3QTRCaUVNYmZ5TFk4RVUwaENETzJsbmVwY2t0MzRmVHMy?=
 =?utf-8?B?SzBmeXR6MnNQU2paazBEd2ZadkF4dWsvUlhSN0pacXo4YXZYcHpoNnBsVEE1?=
 =?utf-8?B?Y3lITUVUYk5wNFJINU1HSGRqNU9TTi9vazI3aE94NTkzRDdMakNzVWVEZnFr?=
 =?utf-8?B?TFBuTzljc1MwQVV3UUk2dGhKT2dTY2tvcjlXSUwybEZJeWo4Yyt2V3d6SHRC?=
 =?utf-8?B?UGtPR09XTzI2a0x2bjdLNWxtMHMvTVRoZllxam5qbmp6OFl3bmx0QzEvcklM?=
 =?utf-8?B?b3VZeWZwUngvcVhDMnBGZjlYK3dzYnhKMkhhakMwZjl0a3lLUysxeVZiaXZr?=
 =?utf-8?B?bXZIamVudnJUWjkyeGJIckN4d3YxZGJ4SzJYVXN6Zk5LazRuaWM1VmhtWFFJ?=
 =?utf-8?B?eVNLSE8zMDE0QStQbm1mNTVrVmdUK0tjdURFT2ZQdjhKUHFEV0grKzR1YzhJ?=
 =?utf-8?B?OHNScHpUZlA3RUowUzdORVRFL2lTK3RjdjJMUEMwWGNvZzY1K3pVWkIvMnY4?=
 =?utf-8?B?UHp1dVQ3Sm0wa3E1VC9Wb1I0azNLL2dtdEVWNVhQQzkya3Fwby9rNW5XTEph?=
 =?utf-8?B?SjkvN2xUUHc0ZWhLSzY2RGljWDhHczM4b3VzZDhYM3VJcm1CcHFNS2R3bnVu?=
 =?utf-8?B?UGR0azBWR21pWk1ReStOZ1lLOHU1NDVYck52TEVOWjNyUkZxdzZqQUxuTDVo?=
 =?utf-8?B?SEZ3V05ydDlkbmJpOGJWbm9ESFdpTWhOYkd3NjVKUExVck42dTRUc0svRU9M?=
 =?utf-8?B?K2Y3T3hIUEdWdXV2N2psSGxOQndBVi9CUUViZUR2a05KK0pxMkZlRENEMzQ3?=
 =?utf-8?B?L2tXNDdNd2cxWWVTSGlFMnFVZzRSM3FnQk1QSUdSR0ZLcXdFKy8zb29uZTkz?=
 =?utf-8?B?aURPcGwxT0pmSExhZHh2MjlFZWN6WDNTdGd1TEFXVGpVTEpsZU95R1FZMlZ2?=
 =?utf-8?B?U2M2eVpCSWdBR2FPcDV1WFRMTkxZOTBvYS9EZ01ZQ2Z3MkQ0cjdSR1R4Nmxz?=
 =?utf-8?B?cWFId3Irbjd6OWhwV05ERUxEUXBVRFJlbnpTYnpob2MxQUVhNHBTR1B6dWh6?=
 =?utf-8?B?bXd1RmQzSjE5YWNxM3BTa09sSitJVzlZaW1qSHFnY3pGM3FIZ09rbVl0SUdq?=
 =?utf-8?B?UWRBRlhnallmdEtKVkEwcUVHL3kvRWNtZUxCbGthK0k4SHEvRnZsZlJyYSs4?=
 =?utf-8?B?Ynh5TDhxK1hmVW9LRzJZL3NsUjhYQWtBZlFBMW50KzRmZE1IREVXeVJwdGFk?=
 =?utf-8?B?Q3gvUFI1REsxSXZlRXJUL0wrOUFEWklQRE1HUDA5YWkzN2xaa2szNE40RnpK?=
 =?utf-8?B?UjI2QVNaSGUwY2xmaDNJTTJtREVDS1JVT2U3dGVmN2VwUjlqejZhaWFlYnpp?=
 =?utf-8?B?bEhQbEV4VVFuT08vZ1VFbDNEamdhUTBjd2NZVXBCa1FzbHptNnlwc09aOTJC?=
 =?utf-8?B?ZGhEcFZqWjd2S0trWHJpaUZ1M2NwTnhyVTZOME53Y0dvbmkrRkpVelo5TnU3?=
 =?utf-8?B?WmV6Z05Wb3pLSjUxN2hSYlFTMGtNV085MzBuaEM1N0VxUGxMQ25FSFVvNmZp?=
 =?utf-8?Q?V9sMVXBdbM9CBQd1AHVGt7ceWWvqFQp+PmZoE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L3k0Sm5Rc1dZVlpGZVM5Z3hqWHNxSlJ5ckQ0UVFSRWZZYU1TcmVjRjZCWDlI?=
 =?utf-8?B?cm4xWFMxM1Y0dzY3OXhubGtEUFkwZWdUZStVYkpJRldiTjRwVHluZXlqS09U?=
 =?utf-8?B?blNCL28remt0OUpjOFJGSDcrQ3E4ZDMveStHeDVZSGpFOXhsa29IcHBCNW0r?=
 =?utf-8?B?aG41VmpEWWtnOE9jdEVYQlFTZjhUaU85QmoxQVk1QzFKVFR3elNQOEQwWUR2?=
 =?utf-8?B?dVZTdFYza1hybXB0MFhpazM2d20wa25kVnVGZTJtSWhaaFVHdHVTTG4yQ0lj?=
 =?utf-8?B?MFFnRy9qZEpsajZyTU9VMVdUaGdOSWF0c3FkR3Z0QThDMVVNTnVyMlFlS0Rq?=
 =?utf-8?B?eGJFRENHL2FCaDNRdnRLaEpSMm0xb1RMQzNTR0xFc1RvQ1Q2b3RTMXIvWnBZ?=
 =?utf-8?B?MTIzN3JkQnJvNFJQdndTMmRNUytNVEYxNGN3NnNFQ1N1S01lNkhTcTdYNW1z?=
 =?utf-8?B?emlveW93ODVOU1NYRG9mTkhmOXBpTTdOdzNCQjVDYmRGWDY3QW5uNXFjamhj?=
 =?utf-8?B?Q2pBaU90b0F5TzE0bGxxaW5PbzNEb0lyWlhvOWpQVG9HWHllYkl2S0oxVnpP?=
 =?utf-8?B?YWVxNGF5TmtUWERjMWRwMWo5VU1lZ0FnVjc0WDZMRWcxVnpNOXJMRjNLZ05C?=
 =?utf-8?B?UVJFWFgrbXZkTTNCL0t4RnBHdHRMc1duTWlWUnVkL2dFdkhYRWM4MkJBQmRD?=
 =?utf-8?B?SUI2MWgzOEMzUDdVanI4YVBSQjg5b3dOcEUrQ0J5NUdLcE5qanJPSlpWS2ZP?=
 =?utf-8?B?alNPQUFhNi9DM2xvMkhZUTFVN3ZCNzIyOFlSTEF5M29PeTQranpyc0lFVE9z?=
 =?utf-8?B?VlpheHlvU21YZ3pVODJCQ0tKYmJaUHdiY1BjUWNXZS9FS2hncUhSeFV5bjA3?=
 =?utf-8?B?MTJxZDRKZ21SaUVhSitiQWJQaHJGUkxwUHpmeTdBeURPT215b3QrdkNrVlpy?=
 =?utf-8?B?RkQ3cHBwaWd3RGFGZXRxcEtrZFppbjlGNitCQ2ZKeHplYllNNHFsWE1oaW8r?=
 =?utf-8?B?ZGdRR0x0SnowZ0dMQTdrOG90ajRPOFhmRVVpL2M1VDhadFlhaXZObkVKWHJK?=
 =?utf-8?B?NXlGVmFNV3MzemVHYW5HK1pad0ZYK3E2WlJobTI4MFlOWGlmY2tYUTJiYkE3?=
 =?utf-8?B?Y0VHRFlVZ2NUZEU1c3g5OGdwa2dLSkJFZU5naUFjWHArY2xUMFZPWmtlYTQ1?=
 =?utf-8?B?cnBQeFZPUWtQZU0ybVpsc3ROMGk4N1R4d2w1emdCQ1VsUlcrVGh2ZDhUZTFs?=
 =?utf-8?B?Sk4vMHFQazNnWklEZDVXYUpkdkU5SnR1Y0V0blBLZWlUTGpkMHVrVDhQM0FI?=
 =?utf-8?B?aUx6RVRWWXhlSG1oZWVLQzJmTmt4R2NnSGQ3VE9BTlFaQmZUNFRxL2tGeUI3?=
 =?utf-8?B?M3ZBSWNRNVBBTHVJajcvVzFLNjdpV1A2SVdsdStGRlAzclpKVDZsZ1pvQVNY?=
 =?utf-8?B?NUl4bmZkZDFZR2lISlZaY1IzZ2RUN3pxbUJOTkkwSUJZSTFZV2pLYXVOWmFG?=
 =?utf-8?B?TWlNQUFVYTZ3ZEU1cUs2dUhTWTlXcFdWMjJoUmpEVlU4dm02UG5iK29ERXNy?=
 =?utf-8?B?cVRlMGdRZFVxM2ErZDRYUjY4SE5UazRYSHZMNlZNYWR4WnQyTUl4ZGQ5Z0x5?=
 =?utf-8?B?MFZEQUxwOUF1ZGxzR2FOeG9qcTRUSjlHWDl0SUFmQWhtN21DRFQ4MjFtU3FJ?=
 =?utf-8?B?MnpxaVNOWVFIUnUxODBGYXNIL2hxcitQQThVUGtTNEhKZndPY1d1NVJnbkYz?=
 =?utf-8?B?cngzeDNJYkJTUmRPMnd4SXdjQm9tSWhOY3htZEg4SXZDaTFVTUpQSWlqUlNE?=
 =?utf-8?B?TnI0aVFOQ1Z0ajVUKzdUSHduRkRFclJDSlBPOWFpUmRPNnRRN01BTE1ydHJX?=
 =?utf-8?B?Ry9vaTBudzlzWENDUDY4TmZabXJMODZ0RWE5VnBxbW5uT0hLSVVaSnVtd0Y3?=
 =?utf-8?B?RlNBdHFia005bG1hWjhwS0FPMlIvQmNYS1JiNmdqMFFxcmJrOW5GMVpLVzl6?=
 =?utf-8?B?K3lhcDFYTWhtWklNalNab25KWGJLSzhQN3Q1VTJnUVVjTXF3KzlkVDNmN2V1?=
 =?utf-8?B?aVVmNm5ZOWg5S0ZNdXBvZkJyemhpbWhGRkpxc2wrMm85TEs3Q3VKckFGNFBH?=
 =?utf-8?Q?oNQs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b9e92e-1ad4-4d01-a6b2-08dcb172eb2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 15:10:30.9382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2MxTno8pfjGCiPi1pbxiNp/dEFnNH+kBuaJcfDmlWLl0IA9Y9ZY94jd5QA86MVQrW1EAdOtZLAVoAc5a/P3ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgSm9zaCwNCg0KV2hlbiB5b3UgZ2V0IGEgY2hhbmNlLCBjYW4geW91IHBsZWFzZSBoZWxw
IHRvIG1lcmdlIHRoZSBsYXRlc3QgcHVsbC1yZXF1ZXN0IHNlbnQuIFBsZWFzZSBsZXQgbWUga25v
dyBpZiBhbnkgaXNzdWVzIHdpdGggdGhlIHBhdGNoIHRoYXQgSSBzaG91bGQgaW52ZXN0aWdhdGUu
DQoNClRoYW5rcywNClByYXRhcA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
TmlydWpvZ2ksIFByYXRhcA0KU2VudDogTW9uZGF5LCBKdWx5IDI5LCAyMDI0IDExOjM0IEFNDQpU
bzogSm9zaCBCb3llciA8andib3llckBrZXJuZWwub3JnPg0KQ2M6IGxpbnV4LWZpcm13YXJlQGtl
cm5lbC5vcmc7IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47
IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNvbT47IFNpcXVlaXJh
LCBSb2RyaWdvIDxSb2RyaWdvLlNpcXVlaXJhQGFtZC5jb20+OyBTaGFybWEsIERlZXBhayA8RGVl
cGFrLlNoYXJtYUBhbWQuY29tPjsgQ2hhbiwgQmVuamFtaW4gKEtvb24gUGFuKSA8QmVuamFtaW4u
Q2hhbkBhbWQuY29tPjsgTGksIEtpbmcgPEtpbmcuTGlAYW1kLmNvbT4NClN1YmplY3Q6IFJFOiBw
dWxsIHJlcXVlc3Q6IGFtZGdwdTogVXBkYXRlIElTUCBGVyBmb3IgaXNwIHY0LjEuMQ0KDQpUaGFu
a3MgSm9zaC4gSSByZXNvbHZlZCB0aGUgbWVyZ2UgY29uZmxpY3RzIGFuZCBzZW50IHYxIFBSIGZv
ciByZXZpZXcsIGNhbiB5b3UgcGxlYXNlIGNoZWNrLiBTb3JyeSBpdCB0b29rIHNvbWUgdGltZSB0
byB1bmRlcnN0YW5kIHRoZSBicmFuY2hlcyBhbmQgcmVzb2x2ZSB0aGUgY29uZmxpY3RzLg0KDQpU
aGFua3MsDQpQcmF0YXANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEpvc2gg
Qm95ZXIgPGp3Ym95ZXJAa2VybmVsLm9yZz4NClNlbnQ6IEZyaWRheSwgSnVseSAyNiwgMjAyNCA3
OjM5IEFNDQpUbzogTmlydWpvZ2ksIFByYXRhcCA8UHJhdGFwLk5pcnVqb2dpQGFtZC5jb20+DQpD
YzogbGludXgtZmlybXdhcmVAa2VybmVsLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPjsgTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxs
b0BhbWQuY29tPjsgU2lxdWVpcmEsIFJvZHJpZ28gPFJvZHJpZ28uU2lxdWVpcmFAYW1kLmNvbT47
IFNoYXJtYSwgRGVlcGFrIDxEZWVwYWsuU2hhcm1hQGFtZC5jb20+OyBDaGFuLCBCZW5qYW1pbiAo
S29vbiBQYW4pIDxCZW5qYW1pbi5DaGFuQGFtZC5jb20+OyBMaSwgS2luZyA8S2luZy5MaUBhbWQu
Y29tPg0KU3ViamVjdDogUmU6IHB1bGwgcmVxdWVzdDogYW1kZ3B1OiBVcGRhdGUgSVNQIEZXIGZv
ciBpc3AgdjQuMS4xDQoNCkNhdXRpb246IFRoaXMgbWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4g
RXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24gd2hlbiBvcGVuaW5nIGF0dGFjaG1l
bnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCg0KDQpPbiBUaHUsIEp1bCAyNSwg
MjAyNCBhdCA1OjM54oCvUE0gUHJhdGFwIE5pcnVqb2dpIDxwcmF0YXAubmlydWpvZ2lAYW1kLmNv
bT4gd3JvdGU6DQo+DQo+ICAgYW1kZ3B1OiBVcGRhdGUgSVNQIEZXIGZvciBpc3AgdjQuMS4xICgy
MDI0LTA3LTI0IDE3OjMzOjE3IC0wNDAwKQ0KPg0KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoNCj4NCj4gICBnaXRAZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZzpkcm0vZmly
bXdhcmUuZ2l0IGFtZC1pc3Atc3RhZ2luZw0KDQpJIGRvbid0IGhhdmUgYSBmcmVlZGVza3RvcCBn
aXQgYWNjb3VudCwgc28gdGhpcyBkb2Vzbid0IHdvcmsuICBJIGZvdW5kIHRoZSBodHRwcyBlcXVp
dmFsZW50LCBidXQgdGhlcmUgYXJlIG1lcmdlIGNvbmZsaWN0cy4NCg0KW2p3Ym95ZXJAdmFkZXIg
bGludXgtZmlybXdhcmVdJCBnaXQgZmV0Y2ggaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9maXJtd2FyZS5naXQgYW1kLWlzcC1zdGFnaW5nDQpyZW1vdGU6IEVudW1lcmF0aW5nIG9i
amVjdHM6IDE3LCBkb25lLg0KcmVtb3RlOiBDb3VudGluZyBvYmplY3RzOiAxMDAlICgxNy8xNyks
IGRvbmUuDQpyZW1vdGU6IENvbXByZXNzaW5nIG9iamVjdHM6IDEwMCUgKDEzLzEzKSwgZG9uZS4N
CnJlbW90ZTogVG90YWwgMTQgKGRlbHRhIDkpLCByZXVzZWQgMiAoZGVsdGEgMSksIHBhY2stcmV1
c2VkIDAgKGZyb20gMCkgVW5wYWNraW5nIG9iamVjdHM6IDEwMCUgKDE0LzE0KSwgMy4xNSBNaUIg
fCA4LjUyIE1pQi9zLCBkb25lLg0KRnJvbSBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2Zpcm13YXJlDQogKiBicmFuY2ggICAgICAgICAgICAgIGFtZC1pc3Atc3RhZ2luZyAtPiBG
RVRDSF9IRUFEDQpbandib3llckB2YWRlciBsaW51eC1maXJtd2FyZV0kIGdpdCBtZXJnZSAtLW5v
LWdwZy1zaWduIC0tc2lnbm9mZiBGRVRDSF9IRUFEIEF1dG8tbWVyZ2luZyBXSEVOQ0UgQ09ORkxJ
Q1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbiBXSEVOQ0UNCndhcm5pbmc6IENhbm5vdCBt
ZXJnZSBiaW5hcnkgZmlsZXM6IGFtZGdwdS9pc3BfNF8xXzEuYmluIChIRUFEIHZzLg0KMjMxYmMx
MzE2ZGE2MDhlOTVjZWM5MTlmYmJhYmY3YzU4N2I5M2I0NykNCkF1dG8tbWVyZ2luZyBhbWRncHUv
aXNwXzRfMV8xLmJpbg0KQ09ORkxJQ1QgKGFkZC9hZGQpOiBNZXJnZSBjb25mbGljdCBpbiBhbWRn
cHUvaXNwXzRfMV8xLmJpbiBBdXRvbWF0aWMgbWVyZ2UgZmFpbGVkOyBmaXggY29uZmxpY3RzIGFu
ZCB0aGVuIGNvbW1pdCB0aGUgcmVzdWx0Lg0KW2p3Ym95ZXJAdmFkZXIgbGludXgtZmlybXdhcmVd
JA0KDQoNClRoZSBsYXN0IGNvbW1pdCBmcm9tIHlvdSBoZXJlIHdhczoNCg0KW2p3Ym95ZXJAdmFk
ZXIgbGludXgtZmlybXdhcmVdJCBnaXQgbG9nIGFtZGdwdS9pc3BfNF8xXzEuYmluIGNvbW1pdCAz
M2E5NTA4MjhjODc2NDZjODJiNmI3MTVlZDk3MGJiMzk5YWZhMWI0DQpBdXRob3I6IFByYXRhcCBO
aXJ1am9naSA8cHJhdGFwLm5pcnVqb2dpQGFtZC5jb20+DQpEYXRlOiAgIFdlZCBKdW4gMjYgMTE6
MzY6NDggMjAyNCAtMDQwMA0KDQogICAgYW1kZ3B1OiBVcGRhdGUgSVNQIEZXIGZvciBpc3AgdjQu
MS4xDQoNCiAgICBGcm9tIGludGVybmFsIGdpdCBjb21taXQ6DQogICAgZWQ3MDBkMWM5MjlhOGQ2
NGZlNTY5ZTkwMWJhZGE5NTY2OGUyMWJjMw0KDQogICAgU2lnbmVkLW9mZi1ieTogUHJhdGFwIE5p
cnVqb2dpIDxwcmF0YXAubmlydWpvZ2lAYW1kLmNvbT4NCg0Kam9zaA0KDQo+DQo+IGZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyMzFiYzEzMTZkYTYwOGU5NWNlYzkxOWZiYmFiZjdjNTg3
YjkzYjQ3Og0KPg0KPiAgIGFtZGdwdTogVXBkYXRlIElTUCBGVyBmb3IgaXNwIHY0LjEuMSAoMjAy
NC0wNy0yNCAxNzozMzoxNyAtMDQwMCkNCj4NCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
