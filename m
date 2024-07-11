Return-Path: <SRS0=h/4H=OL=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3A5C3DA42
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jul 2024 02:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E825C32786; Thu, 11 Jul 2024 02:16:47 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 630F5C32781;
	Thu, 11 Jul 2024 02:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 630F5C32781
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPneCLf9kP6psgtZ/I80wj/mSVzrqYtE0KDF7q0rN6jvnsNmDYYkU9UZrVZJbTgaSq2j6iLBRUBk4XdGpU3p1tdCslDgpece5NaDN2Ln1288hq45OzldvFkonmqoHUe71yfB839TfJiXIXyHnrLTLob0tpcXu66erEJQd+EV28FDxxtGSGCv7RHcaEY2OvDN+pwvUizGEyDU72aI5rdBdWkSHga86U61Fus0AUPucxRq/V7BZ4akbHnbh2Bo8IfHu29OVMF5F3qYXciRicH48xuyBxc9qDuTUvVGaitI5cCTdurN2SMWeBpSkj3AC1iPq8RrBS8bnXMxU5cpN+7zkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9vlWpB6z2hvcZYfQJUCfntX78I90r4bsjiPrwaUvv4=;
 b=ghYtjsBhHEIwzKvroxFXFJOvm6cgoDZLUFX12xV4vAUGNWjUuyVoaAcvcfwyaKD5LOaafnq6xi0tSNZArowZkBXIhyDhjwYMf6o2YPGqq4jrqL9AEcgAjZIV9Td0cnTmVLxgRPK8vForOnkZxZGTBFAia5mvawWjyfS0DT4lXfFvRqYsIshCAyfzWkFPe+G1cZDpzVV18xirNUtbPnQOK4Cf0hAu6CAAxEipESVZIAQaG+b8BqgZU1ACtfjRVym83vYabYN8IIFw/Z8XSZMr87YcnUaErDX9btij7A4nsqk/nbczP2WRUfeCH3zmDmgaScsANcAsnc7wVdtYBn+nwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9vlWpB6z2hvcZYfQJUCfntX78I90r4bsjiPrwaUvv4=;
 b=1fJh5164c2zi/VhnrEwhhpHrtuB7yjYkEP+0NB+JkJjZFtmg6OGthya11YgIPTiO9A5EDwmo0GRyhJoZhbI+Rq9EcrpIcMeOsuc7xEFFvWvws/rkkvHSyUDDy4ntcimRLt9NXCMGH1xRhB4K1zbBOezTeRiYtxTSfPwcCIJW1JA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB6675.namprd12.prod.outlook.com (2603:10b6:510:1c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Thu, 11 Jul
 2024 02:16:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 02:16:41 +0000
Message-ID: <5dc4c313-b148-4fea-916c-8820fd21b5f7@amd.com>
Date: Wed, 10 Jul 2024 21:16:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu amd-2024-07-10
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org,
 jwboyer@kernel.org
References: <20240710213016.3908123-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240710213016.3908123-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0071.namprd05.prod.outlook.com
 (2603:10b6:803:41::48) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 352af09b-c4f4-493f-5fe8-08dca14f80c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk1BTWlwZXVkL0I0eHdvS2VlaklaOTZ5VlZNSHZsUHdkK1p4eG1SV3RrRU5S?=
 =?utf-8?B?OGJheTY3dHdZV1BYR1ZlazN1Y3hxRjJwb2lrV3BZWUo2TFRIcFlONjlrczM5?=
 =?utf-8?B?SE1PdklMT3E0V1hVVU15LzJwd2tXVzcvMHg1Rm9PNFZwdHFIMkhoRGtRZW93?=
 =?utf-8?B?VCt4SForL1BUTFRha01nNU52OHFhdEV1anRVcVk1bWtqSURwYUo5ZW5qYWpS?=
 =?utf-8?B?bjhFaE1FampXSzhVWHAxWDVWeU8zYTBnSVZNNHhxQkQ1ZnlRcUUwVUVlS1hY?=
 =?utf-8?B?SkpEV3M4SmNCK01TV0FJVkt6Qzk2dThaOHJCcHFFaVFNSkJXdDEyeTE1NEZz?=
 =?utf-8?B?VHNaK0N0RnhkcGFodXJIMVRva1p1N25aa2J2dlhFRmlxU1ZZQUFiL0ZMZWhX?=
 =?utf-8?B?NDRwU2kxYm1Va2duc1ZLTUpVUldtcC9RZEh2SGpFUGFkclFHbDRmM2lKbTd5?=
 =?utf-8?B?TlNxcnkxRDhaOXFjM3hkN3lMSGZzclNobUZId3BqK25IRmdqTHREN25yRFBC?=
 =?utf-8?B?d1VkOHlRMUtjYWtDck1aK2YyVm5YU2dOc1J0U0FnM3dpMWd0WHBWUXQ3WlZG?=
 =?utf-8?B?TlM2L05WZWloMlRTbjdOVFBDUkdqa0dFUUhKaWszejdXelpEZkZHMDQ4bVFV?=
 =?utf-8?B?SE1tVzA4QjNxQzdBb1gxSWNCR0EwYi92RXNqYlBBWVBhenFFL1dsZWV5eE1D?=
 =?utf-8?B?ejltMFJmc1ZxTExXSWVzOWRiOGdDRzdEMU9wMGtRRUFjLzhDYTlKY0x6R3lp?=
 =?utf-8?B?TktnNmViT2lMdmNhVTRUZVYyWFlxZXVHOGRDcU9GQ0ZlR1BzMFRhNzBwdFJw?=
 =?utf-8?B?NCtRWmlMcEhIV05RK3Q2UHBPN3NKaXhDZkxuQm5SbHFwOGNHTFlRdE42ZXBG?=
 =?utf-8?B?aWxQWGpVaks4QzFEaFV4amNkWHpEUkJuWWJWcUdwYnUwYVhTYmVLQjFKTTIr?=
 =?utf-8?B?TzJoUVZrTjE1YXdNWnF2c2d1eTJwb0psQXJRejQzb0VPaWlFdjhxdE1DVjAx?=
 =?utf-8?B?dGtSNUZaU1JZRmZYYURPdUhiVDZqT29QYTZPZnlQeW01UHAxZ3JTWnFMRlV3?=
 =?utf-8?B?MmNzYWZjRm43OCtaZ0hVc1FMNUFzcHlmODZDVzhvRVAxQjBoUmhNczRTWVda?=
 =?utf-8?B?QnZONHJNRDJnVEYvWk02VDVVbXZ6Rnd2a1ZoNEZwSGFRMmZwekd6T3luTE8y?=
 =?utf-8?B?VmJwTEs5S0NKZlhIdUwxMkVtYU5pTFllTC95VWJQRjFIbVFkdU9QMTdHMUxl?=
 =?utf-8?B?NnZ3SU55WmJSdEtGNCsyeUZhM0hvZVRoUjczZlJEWmlkSzRlU1U2aE5BRXBQ?=
 =?utf-8?B?S2FWcDc0NktCZVpYVkRnajl2b2pjRWtqbXRXUHpiakZXbFhhQU9FRHFzb3gy?=
 =?utf-8?B?d2wxaDVnSmhkWm5QZUpEZCt1K25MMXMvemF4SnY1SHNuOE8zNURoNVRkeWlH?=
 =?utf-8?B?L2RYWFBDc3dJcC9hWnBmR0RzQm12a3NGeXVrOUVBSzBha2p5YmkyMFluQWlH?=
 =?utf-8?B?aUxzdHYrOVQvSFcyTGNNSnprY2RCUWRtaGNvVkp6Q3c1YlRSa3FzQXphSk12?=
 =?utf-8?B?R0xLVDAzYTNHYWd6WUV3My9SdzlPTFVvdDR1eE1RcGYwUytHelNTVTVCWDg1?=
 =?utf-8?B?cWNWak5nZ3FldExuUjRrUXNPTFFUV1hXY25hbHM5aXhwY3lQVlRXMmk0cmU3?=
 =?utf-8?B?c0dneVJxUG81aUt3cmVVc2JONTFHLzdJc2ZYMVRHcWIrZnNUTER5TnJCNjJ2?=
 =?utf-8?Q?BxE63kh9wL6HfL6q8o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NStrRTNoQ2Z5NkhMQVZWZDVzc3NRQzhsMENWNkhVeTYrYzJTV0hOQXBhTCtr?=
 =?utf-8?B?Tlc2Y3FpRXRwQ3pWMXhqMFErd3lwbHQ1bGZuaVF5SFlZR0ZTak9rd0E2RmtB?=
 =?utf-8?B?a2VOdVd1ME5UVUpzZkFhZ3JSUDhsQjZsVER3blY2bSticlRXRUw0ZW4rMloy?=
 =?utf-8?B?RmlQU3ZGemhXMW5wMDdOYW9CenJPWFpLSGU0ZkZYR3BMQWRkUU9QMlkzcS9F?=
 =?utf-8?B?NnFQWVBoM3NyYTZiQ1RldGtzOXU0b2hVRzN0bkFPbk9CVVo4TXBKdmhOTzFC?=
 =?utf-8?B?TE9yV0dJM1YydVVVT1k2ZEpKaFlPZVhSS0NUVU9kL1lQdU53WWYzUjFINjlM?=
 =?utf-8?B?SmQ4UWpWbVhZejVSMTcwQW1lbU1uLzVrY0grOXVFYVNBL1ZOeFYraFBXTUJQ?=
 =?utf-8?B?SlpuU2k2T1Z4elV2TE01TEFvNWNtdkEvcUprRHBoaHpNdGphd0phWmFWMzRI?=
 =?utf-8?B?d00xSG1oMHlUVTBSN3A1THNmdDE1UDU0c2xtQmo0dENaeWVVOFRhTjA3VDlB?=
 =?utf-8?B?WllLTEFnYkpWV2pra0Vxd0craU1KVFFZRFZTeGxhVHpyZUtEZWlsbGQ4a08w?=
 =?utf-8?B?T0h3bmZycmI4STFNa05kY2h4dyt5U3BTZ0pjU2NmNjcyOGdIQnoyT0JQVGxi?=
 =?utf-8?B?UnVxWVFISUhqZkRhSlpDejY4QWlmM0xIS0FmaXZwT2Zzb01HemJZYXlyWjFF?=
 =?utf-8?B?U0E1OHVlc2lBdWtHUnc3cEUzV2NoNEIvbHRId1p1Ti9wV093MmtIZlQrQm1I?=
 =?utf-8?B?eXVOY2pUMmxya2M1cDVSNEp5OTJRNjdKZTI3V2JwMzJBUFBqU3ZkTWFhSXVV?=
 =?utf-8?B?cDlDL2diN1RBVDhMamR0YzBXdFFRMjFRUW1ra3dkejR2b3l0L200YVZyQlZT?=
 =?utf-8?B?cEp2OWljUlFDNzJ2cmkzZ0FrRjRFaXdSVDUzRDRyRWphVWV1RjBaeVhveldp?=
 =?utf-8?B?ajdQeTFCNFdoT3cxS1dxbkpDL0JzWWFuWGRvTjZ2b0JVTzNGNWZJQnJRaTEz?=
 =?utf-8?B?YzFxMC9PUDhHMVo0K1hBYmg5VFlIMU5LaDVzYWdsOTdUaERQVDczeWRiYmdG?=
 =?utf-8?B?RUdjbmZhcDRkOGhYNUlxY0pkN0NWTVZQcjE2bUIxNGZjanc5SHR4Nk5BdE05?=
 =?utf-8?B?aFQ3SSsvbkY0UHFWWmtvV3FROEt2ekd0b0hGRkhyVU1GZFovYzRwSVNGZDRk?=
 =?utf-8?B?MFkrZUVxZUR5YllPQmRYMHhNeEo2SCtOamkzMVFCc2NYSEpFTnA2OEZVLzVT?=
 =?utf-8?B?dGxaLzBtUHUwVDdlaENzSkZTanVRUW1WZVhXY0QxWGd4cEcxbENWbjR4ZnIv?=
 =?utf-8?B?RDhsd3lkTmJsTHlzeEZVK2Z3N0UycnpoSGx0bnlHVU5BcTVZQSsrNkprNXlv?=
 =?utf-8?B?L1Y1Qy9OMzBWRERYbjZ6OGRVMHJpNFE1Z2hERUdxelg0YVR6ZVhuM0U5bW5P?=
 =?utf-8?B?YkUrVE5CVWFwaEFRdDl6WW9CeW1JaDJrTHBIRHJQZm8wWkRaZUZuTzM1ZnhN?=
 =?utf-8?B?akpSN2w0bmJoVFpCTWdxZXJnNFkvTUV1VUgxL3BmUDBTQ0hwRk1MdlRyZ01K?=
 =?utf-8?B?OEJEdmRNNkl3cDdmWDZFcnhSay9wcWNFRSswVFVXcTg4ZXhuZWZabEcyQzl6?=
 =?utf-8?B?YWpPUEk2UWM5VkJkRDBDRGpuQTkxbXZueXpHRC9ZT1ZUY0I3cDdsdWxTRjhx?=
 =?utf-8?B?NTVnMHVjSHNDajFxMGJiWWhhZnFLQmx0cnZtWStZWStHbkY0d3JMVndicFZx?=
 =?utf-8?B?TlVnc1hpQnozYk9pd2liWURzZTdBNEVqNCs0MEo3VzNSM3NFeEZhZ3pjekpH?=
 =?utf-8?B?RW9oaWVnSjFCaDMyaGY5Q0QybDZRZ0F2LzlTT0prMTVaOTlMczM1d2I1WG9s?=
 =?utf-8?B?Vm5BMXROSzR0VEJNbDRyaEVBWTBRQVM1RWhpUTBQS0FjMDBHTTg3VDZENVdX?=
 =?utf-8?B?ZDI5MzkxeVVGWTdvaGNsRll1S1RnNkNlc2NNaVFxbndoWFlQSjN2bzcyOWhP?=
 =?utf-8?B?V3JrRzZxKzgxdkFOMDZoRExUTkFxZjFYU2hOcENjWHRZaWdEOWdXNDFidi9O?=
 =?utf-8?B?RUZvcFVGcHVNRjlySnZUeDdMTVc4TUdEYVI5MFNkSHRqUkMxOW9DNDZRMlpV?=
 =?utf-8?Q?Jxy5tzg6LWFn9Yw5+NhRaibc3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352af09b-c4f4-493f-5fe8-08dca14f80c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 02:16:41.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkfAAxyEOwFpmHbMQ9zZ0+ILIS3oOEaa3D4vMs+DuNH3JMGu1o9vOTp9MgpzWDk4UCRk93isXJYZe+xudAxzRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6675

Pulled, thanks.

On 7/10/2024 16:30, Alex Deucher wrote:
> Hi,
> 
> Updated firmware for AMD GPUs.
> 
> The following changes since commit 6ae2bb3fcc9c093efa62cc7c27357ff7fc3d83e4:
> 
>    amdgpu: update DMCUB to v0.0.224.0 for Various AMDGPU Asics (2024-06-28 15:23:55 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-07-10
> 
> for you to fetch changes up to 309310cb422ea8ebe5776b7b7256cdf304df7c0e:
> 
>    amdgpu: update raven firmware (2024-07-10 17:14:31 -0400)
> 
> ----------------------------------------------------------------
> amd-2024-07-10:
> 
> Updated amdgpu firmware.
> 
> ----------------------------------------------------------------
> Alex Deucher (50):
>        amdgpu: update aldebaran firmware
>        amdgpu: update raven2 firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update SDMA 6.0.2 firmware
>        amdgpu: update SMU 13.0.7 firmware
>        amdgpu: update VCN 4.0.4 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update GC 9.4.3 firmware
>        amdgpu: update PSP 13.0.6 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update renoir firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update GC 11.5.0 firmware
>        amdgpu: update PSP 14.0.0 firmware
>        amdgpu: update SDMA 6.1.0 firmware
>        amdgpu: update VCN 4.0.5 firmware
>        amdgpu: update GC 11.5.1 firmware
>        amdgpu: update PSP 14.0.1 firmware
>        amdgpu: update SDMA 6.1.1 firmware
>        amdgpu: update VCN 4.0.6 firmware
>        amdgpu: update VPE 6.1.1 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update SDMA 6.0.1 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update picasso firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SDMA 6.0.0 firmware
>        amdgpu: update VCN 4.0.0 firmware
>        amdgpu: update vega10 firmware
>        amdgpu: update vega12 firmware
>        amdgpu: update PSP 13.0.8 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update vega20 firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update SDMA 6.0.3 firmware
>        amdgpu: update SMU 13.0.10 firmware
>        amdgpu: update raven firmware
> 
>   amdgpu/aldebaran_sos.bin       | Bin 442080 -> 442080 bytes
>   amdgpu/beige_goby_sos.bin      | Bin 205984 -> 205984 bytes
>   amdgpu/beige_goby_ta.bin       | Bin 238848 -> 238848 bytes
>   amdgpu/dimgrey_cavefish_ta.bin | Bin 238848 -> 238848 bytes
>   amdgpu/gc_11_0_0_me.bin        | Bin 310768 -> 310784 bytes
>   amdgpu/gc_11_0_0_mec.bin       | Bin 407072 -> 406528 bytes
>   amdgpu/gc_11_0_0_mes1.bin      | Bin 217088 -> 217184 bytes
>   amdgpu/gc_11_0_0_mes_2.bin     | Bin 251552 -> 253360 bytes
>   amdgpu/gc_11_0_0_pfp.bin       | Bin 229296 -> 229328 bytes
>   amdgpu/gc_11_0_0_rlc.bin       | Bin 185248 -> 185376 bytes
>   amdgpu/gc_11_0_0_rlc_1.bin     | Bin 185248 -> 185248 bytes
>   amdgpu/gc_11_0_1_mes_2.bin     | Bin 251200 -> 252800 bytes
>   amdgpu/gc_11_0_1_rlc.bin       | Bin 160368 -> 157040 bytes
>   amdgpu/gc_11_0_2_me.bin        | Bin 310768 -> 310784 bytes
>   amdgpu/gc_11_0_2_mec.bin       | Bin 407072 -> 406528 bytes
>   amdgpu/gc_11_0_2_mes1.bin      | Bin 217440 -> 217536 bytes
>   amdgpu/gc_11_0_2_mes_2.bin     | Bin 251648 -> 253264 bytes
>   amdgpu/gc_11_0_2_pfp.bin       | Bin 229296 -> 229312 bytes
>   amdgpu/gc_11_0_2_rlc.bin       | Bin 178720 -> 178720 bytes
>   amdgpu/gc_11_0_3_imu.bin       | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_3_me.bin        | Bin 310784 -> 310800 bytes
>   amdgpu/gc_11_0_3_mec.bin       | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_3_mes1.bin      | Bin 217152 -> 217280 bytes
>   amdgpu/gc_11_0_3_mes_2.bin     | Bin 251616 -> 253424 bytes
>   amdgpu/gc_11_0_3_pfp.bin       | Bin 229280 -> 229312 bytes
>   amdgpu/gc_11_0_3_rlc.bin       | Bin 178976 -> 179104 bytes
>   amdgpu/gc_11_0_4_mes_2.bin     | Bin 250528 -> 252928 bytes
>   amdgpu/gc_11_5_0_imu.bin       | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_5_0_mes1.bin      | Bin 233744 -> 233776 bytes
>   amdgpu/gc_11_5_0_mes_2.bin     | Bin 251104 -> 252992 bytes
>   amdgpu/gc_11_5_0_rlc.bin       | Bin 166528 -> 166528 bytes
>   amdgpu/gc_11_5_1_imu.bin       | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_5_1_mes1.bin      | Bin 233840 -> 233936 bytes
>   amdgpu/gc_11_5_1_mes_2.bin     | Bin 250784 -> 253280 bytes
>   amdgpu/gc_11_5_1_rlc.bin       | Bin 160912 -> 161040 bytes
>   amdgpu/gc_9_4_3_mec.bin        | Bin 269200 -> 269200 bytes
>   amdgpu/gc_9_4_3_rlc.bin        | Bin 48076 -> 48076 bytes
>   amdgpu/green_sardine_asd.bin   | Bin 193024 -> 193024 bytes
>   amdgpu/green_sardine_ta.bin    | Bin 33536 -> 33536 bytes
>   amdgpu/navi10_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/navi10_ta.bin           | Bin 33536 -> 33536 bytes
>   amdgpu/navi12_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/navi12_ta.bin           | Bin 33536 -> 33536 bytes
>   amdgpu/navi14_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/navi14_ta.bin           | Bin 33536 -> 33536 bytes
>   amdgpu/navy_flounder_ta.bin    | Bin 238848 -> 238848 bytes
>   amdgpu/picasso_asd.bin         | Bin 193024 -> 193024 bytes
>   amdgpu/picasso_ta.bin          | Bin 41984 -> 41984 bytes
>   amdgpu/psp_13_0_0_ta.bin       | Bin 251136 -> 251136 bytes
>   amdgpu/psp_13_0_10_ta.bin      | Bin 247232 -> 247232 bytes
>   amdgpu/psp_13_0_11_ta.bin      | Bin 234496 -> 234496 bytes
>   amdgpu/psp_13_0_4_ta.bin       | Bin 234496 -> 234496 bytes
>   amdgpu/psp_13_0_5_asd.bin      | Bin 193024 -> 193024 bytes
>   amdgpu/psp_13_0_5_ta.bin       | Bin 226304 -> 226304 bytes
>   amdgpu/psp_13_0_6_sos.bin      | Bin 385312 -> 385312 bytes
>   amdgpu/psp_13_0_7_ta.bin       | Bin 226304 -> 226304 bytes
>   amdgpu/psp_13_0_8_ta.bin       | Bin 226304 -> 226304 bytes
>   amdgpu/psp_14_0_0_ta.bin       | Bin 234496 -> 234496 bytes
>   amdgpu/psp_14_0_0_toc.bin      | Bin 2560 -> 2560 bytes
>   amdgpu/psp_14_0_1_ta.bin       | Bin 234496 -> 234496 bytes
>   amdgpu/psp_14_0_1_toc.bin      | Bin 2560 -> 2560 bytes
>   amdgpu/raven2_ta.bin           | Bin 33536 -> 33536 bytes
>   amdgpu/raven_asd.bin           | Bin 193024 -> 193024 bytes
>   amdgpu/raven_ta.bin            | Bin 33536 -> 33536 bytes
>   amdgpu/renoir_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/sdma_6_0_0.bin          | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_0_1.bin          | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_0_2.bin          | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_0_3.bin          | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_0.bin          | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_1.bin          | Bin 34560 -> 34560 bytes
>   amdgpu/sienna_cichlid_ta.bin   | Bin 366336 -> 366336 bytes
>   amdgpu/smu_13_0_10.bin         | Bin 271520 -> 271520 bytes
>   amdgpu/smu_13_0_7.bin          | Bin 287080 -> 287080 bytes
>   amdgpu/vangogh_asd.bin         | Bin 193024 -> 193024 bytes
>   amdgpu/vcn_4_0_0.bin           | Bin 390352 -> 391888 bytes
>   amdgpu/vcn_4_0_2.bin           | Bin 391504 -> 391888 bytes
>   amdgpu/vcn_4_0_4.bin           | Bin 391376 -> 391888 bytes
>   amdgpu/vcn_4_0_5.bin           | Bin 389712 -> 391120 bytes
>   amdgpu/vcn_4_0_6.bin           | Bin 389584 -> 391120 bytes
>   amdgpu/vcn_4_0_6_1.bin         | Bin 389584 -> 391120 bytes
>   amdgpu/vega10_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/vega12_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/vega20_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/vpe_6_1_1.bin           | Bin 25984 -> 25984 bytes
>   amdgpu/yellow_carp_ta.bin      | Bin 226304 -> 226304 bytes
>   86 files changed, 0 insertions(+), 0 deletions(-)

