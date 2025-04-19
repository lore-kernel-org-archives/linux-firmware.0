Return-Path: <SRS0=UjWK=XF=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA9CC369CA
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Apr 2025 18:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12A84C4CEEB; Sat, 19 Apr 2025 18:17:25 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72615C4CEEC
	for <linux-firmware@kernel.org>; Sat, 19 Apr 2025 18:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72615C4CEEC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZneHZwGVzZb2xHLzJZH5Ir6fiZd3SDqYKD0dw3aP0GG1YGMaJMPEjqFQE5hR6cFSicHfHXeOofZg+RPUSRVFdkdQrueLRHnELopVqu0D/jhwarhlOWvhtFpHe6vmGJbTqFJ39ktlfv+N0ODusYbPWtD/BIVjN0dx1XEaftRMLp08bF1tzy1O25xnywy7NGitmDkg38+Vu9WRCyy9o6YyaK0xqqOYHR0W3u4YBDKTm8yER/uI1Q/+Ph5kyYygaL5s+ISWffuE0X2RnqR6Ys5y9JV0Su8QmVLtA8hnnvWEaGZzYfrbAex05B1EDCCtTM02iPJPhajfXvuMv09arectQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoCqeXMUWtWsSD5r/ksc6DQPkeEjSK41TJFNstFPfFw=;
 b=RgdAgQCG+Q7dg9j4GKmKF0TiVfcAwqbG8bl80qtE4Sb9q/2JSlZQMNw9qO1j+wzF48rq4XwOOekkZimt61NRq0Y3Kcz2kCaqxsY3AROzlhxT7C/SzpdpBCdY4OlqMFTfY+MAd3ddKPAKBMxfkYMQYC1+Y6Vjma+iIY1pj8arVuAB8nfCBWhTeSpzSQMYfm1NoRKS/QocyYt3FRs+TExHK2NlKM3WkT1bdv4RGb2fYVXZG64YNVhX3D3u37XNQRC20bz+QsXVGypu3vvmd6pEDiyNZXmZ2unX1xeXreGOiHGfDyiTLX5IAAKV2XoN48skX3aoepOfXqC1aJlUZ1bwJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoCqeXMUWtWsSD5r/ksc6DQPkeEjSK41TJFNstFPfFw=;
 b=ntFd+usinB09zAENTDRvIofYL9Cg60q4y2x3+Tr2Bt2BUL0ddm2E2gbFD5oNJKVxPGyQAkAAGjLZdHFIwXNPY1gGp/53ALciQnfNPvG+QQrZvd8eGarMp2gv2qrbQxxM6a+FSj4BkdmodetYYsuVkdHjYABETxLykO8HB+p3m58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.30; Sat, 19 Apr 2025 18:17:20 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%3]) with mapi id 15.20.8655.031; Sat, 19 Apr 2025
 18:17:20 +0000
Message-ID: <7eb631ef-19d4-4b74-960c-3b40c2a6ecaf@amd.com>
Date: Sat, 19 Apr 2025 13:17:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware amd-2025-04-18
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20250418134134.2457259-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250418134134.2457259-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0055.namprd16.prod.outlook.com
 (2603:10b6:805:ca::32) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c7102c-44cf-4538-27bb-08dd7f6e6c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0NkNjUzMDhHWjgrSXNqclhUUVF5OWZST1dtcjRheURJQVBQQy82ZkVNYnZk?=
 =?utf-8?B?V01PL0RYSE8rRHIrcWdXdU9Za0lEa0NvSHhIMXRlNGduZFBIdEZENEE4aEpD?=
 =?utf-8?B?V09Zam4xSlF3TGJCQzlYdGRDUER4VTJXT2lYeDlZK25DZWdITld0S3FhMWlQ?=
 =?utf-8?B?bG5GYnMzQWhFRkszN1BMSXloQ1dXdEhNSHdEQ05NYXYvSXRheEZPTHJhVVJs?=
 =?utf-8?B?M2hXK0xFNzZuZkFMd1d1YjdmVHVrMjBaVnV0c2tLSzhpT3VVa3lJazIyZktF?=
 =?utf-8?B?ZVU4a1VsNXhqOFV0RnI1RlZEZy9TVFZCRWRCclBqVEVJL1lsUy9KeCtYZzNm?=
 =?utf-8?B?RmNVOU1kOWhTT1VQSmVlVnBoZUtVTlhjWWNZTlZYcVg0Q1Y2VFNuR2ZINEVG?=
 =?utf-8?B?QURWY3h3c3pzMmFybCtwNTdFSXZPaENIRFA0eW9qTCtxWEZ5NHQ4a0FPdk94?=
 =?utf-8?B?RUZIdDFDSDVQQW8rL0dNUVp1WTd4aGlZV2U4RHd2cUVDNUVtdUNWWnVKNEtq?=
 =?utf-8?B?OFhKOWRDTnczMTNyQWQ3SW9JcUZxUWZ5d0xWeTBJQmFtZXFyNTVhZlJld1Er?=
 =?utf-8?B?RGYyUWE0SDhpUUZRWjFWSlhMV2VXc05pNy95OGZuOGtweHhpYTRBcGpCT2lt?=
 =?utf-8?B?UkcxYW95K2JUZk95WjA4cUhzVWtERU9xQjNveVlUeTFmcmtKMjlQMEplQlRR?=
 =?utf-8?B?VDA3emVtOE84VUFiQU13d3RhTk5YMmd3b3Q3ZXJHQlpLTTZFQU12T1M2S1R0?=
 =?utf-8?B?Y3N1aXpWOVY1ZHROd3dnWXVRMjJxUC85S0liS1RVck55NXpZYm5qWjlna1pv?=
 =?utf-8?B?b0w4N3E5dU1IUC9qTzhERSt5Nk1nN3JxWm9FSVA5N0ExL0dxNDNCTE55ZnlL?=
 =?utf-8?B?d0x6TFdRemtGaXdGaUI3T1YxZ1k2bFpwYzAvWVRUR1BNb0tWdkMwWHRVZXlq?=
 =?utf-8?B?S0xaaFE2dnpKUkJsYnd4cTJwTFpmR3BIN1daSVZJZUdkWTBTeG1URHJ3RHJW?=
 =?utf-8?B?TzFBYTlDNE94ZUVXUFI3VmRQemNnRGthOXZGemdjRHZ4L0dVaHRlRHo3eFpk?=
 =?utf-8?B?S2pTMFptT0lzZG9CQTBVZG5Yb0RKL2xmMFJaVDBLamNmRzhrbUZZYndnTFdj?=
 =?utf-8?B?SmkxWXpZVGtIU3N2bGdnbXMyeUV5ajJjWVduaWxDTU1MbnRicEJmZ0RaOXV3?=
 =?utf-8?B?RGRDQ3lYb0VobkRUUHIrekF5Qm5BaUxTVmpjWW56Tlkva2p2QXJiL2xXWTJ2?=
 =?utf-8?B?Sy9wOHQ3Mno3cFVYajdFcGIybFhrYWQvK0dvd2ZxUXEzUDVQb2ZHZTI3V0dY?=
 =?utf-8?B?dC93L3JCN2NPT3VVUy9PZ3IwMUVuL2o0NlpLam8reW9SdFhxU0Jzb0R2U0Qz?=
 =?utf-8?B?M3JTNFJEVGRhaVVCQktCcW9pM29oaTdGRk0rWmxMVGR6V2M4bHpYOE1GNnJL?=
 =?utf-8?B?bXh2Wks0T05FcmsydTU3dFJDaFhzemhjaVErUmxwUU5sdkdPb2xzOGo0MU1Q?=
 =?utf-8?B?QTk4R0tjZXdzc0w4eENsUEFXWHd6ZWl3NnJCRXZsOG52QkxaMXdrTnZ3MXdG?=
 =?utf-8?B?N0JRcTdIbE1LK0FZWHNXZ091TSthU1NSVXhEMTI0SUorSi9wQmUvTTZSRCsw?=
 =?utf-8?B?M0I2QnR6d0FmU1B4S2dOK05aZm1tbTNZVUJralNuSjFjOWU4ZDd3dkJMMTY5?=
 =?utf-8?B?TVBITnJYVitDWUFtOWJOSUJvZUVPN1lJR3NJOUQxTGVzQzhvczk2M2g5US9i?=
 =?utf-8?B?cElWMjNnb29IVVhmTkhEUWNQTnZMMUd2bFNWd3hKRCtocElwYjZka3NVRnJW?=
 =?utf-8?B?RTBBaDN0aUhxSjN1YUdkR2Uxazd5STdUTEN3dmNkRGJsVHhmNExGbHBrREZ6?=
 =?utf-8?B?cFMrTGRrR3hDeFFMUmJzOWQ2YnM5Z2FDTGRTSVFjcTgxbDQ4WnVlNEVwNTNo?=
 =?utf-8?Q?3ObhQ3IZySG+FQs/uYviXgCYcdW9LT8o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzVoNG5OU1d4WjV4YmtjYTlBUDRhZmFOOGh3TXJhTzN6S2VPd3dxSHRGeDNZ?=
 =?utf-8?B?bVVDR2NvOGhaNTRIeFZhZzlCd3ZDZjRjSlJyeHNSVWFiSjNOV2tyV05UV2JW?=
 =?utf-8?B?cVhFSEw1c2xWeVljVkFINjhMd1YybTlZcko1VEpwZG82aHQxKzBJcmxzS1g5?=
 =?utf-8?B?VG8vdFk0KzJReE9WcGkzR05OOGFuSmwyb1NUWm14U1k2QnR1ZUxzY0g5QWYw?=
 =?utf-8?B?RGpUTk04anVweDNVVnVtZjNCMWNqa0FlMEVvSkJKbkFtQUJTZkdreEk0eWNE?=
 =?utf-8?B?MWlrMzRBWGVsQWZNTmtQc2I0MTlVNlpuVVlHdUJhaGJlLzI5MTgvOFdPOE1z?=
 =?utf-8?B?UFZ6WVBsVkllSnFUREJDMzJPUEkxY1NPN2VvTkF3TW1KaWY3TFVqbE9KVW1a?=
 =?utf-8?B?aG5GY2lvd0YvTnJJWE5xMFRUdmdrVW1XVk5ENW5ZNytJdHhJSC9wNXZlQ1l5?=
 =?utf-8?B?dDlUaWgxRGdzUXVzL3ROdEU0VVFKUUwxQXBzMmNWQ2Y3aFo2bDJURldiMjF2?=
 =?utf-8?B?M1BEVUtuekU3d1g5VmRyaUwvMGpyOVJGOVI1d1dVVTJrODczK2JvaTFGWW8w?=
 =?utf-8?B?WnhBamQ2aHVyMVI1NndnZHJJemh1akI3OHlJQk1OMTJLKy9GWFdUMVE2LzB3?=
 =?utf-8?B?NDJyNXZDMkFIdERGRDFvc2FJcU9VVEE1bzd3ckhMeGtOU3dRdExOWlRNMW5S?=
 =?utf-8?B?RU8yTUZhRG5XbjIxSWpGZGJVaytqaHZXYTdnMUtUQ2lCUEREc1dkcTFlSGNQ?=
 =?utf-8?B?aWdTNWxUWmZFeFkwbG1tTzh1MTZjOG93Q1hZY2lsMTIyTDY5SXRLSE9VODh4?=
 =?utf-8?B?d0N2a2FmOEtINktKOXIvbkQ0VmpkMzlYSVFQazJLLzZaaHRrSGZja1I5ekho?=
 =?utf-8?B?VVl5RDJ0WUdrVitUWXFFcTNibThXMHc0OTdsYi9uZFdTdUJVdjYyOXhPWDFK?=
 =?utf-8?B?YUJ4YnpIb3o0L1A2Y0VCYXJHOGxhcEpuYXBNaW83dEZFSE13ZTdBZW8vUHVa?=
 =?utf-8?B?Q3hCTmFSWHRZZjcvUmhYeUFBK1NaOWZuQ3ZVcTdVQTRTNXFyeStUTVNNRmhS?=
 =?utf-8?B?V2gzQk9PbzlwcUhMVHp6d1VzN3FvbVlrbGxWcXdCcnNFRWZZNTBxckdWQWNy?=
 =?utf-8?B?M2RxS2orUHJoaWorR1JuSElOKzRPUEpDQ3JidU9KK2FTZUY5M20yOVZ5Tmha?=
 =?utf-8?B?NUtEd20yMU4zbS8rakJYR3dneWFhemcxNEp2UXVHV2orYWZneHZQcEtmdnQw?=
 =?utf-8?B?bllqOWNTdnk5aVFER3huaGUraDg2QUxEUkFRdFQ4YzNqWnhibVRNZ2JVVnJy?=
 =?utf-8?B?UlVYbFprVlNrSGc3Q3lxYXhHb1dNKzFkcEpIUVVPaFd2TWFOOEQxc2xnNmdD?=
 =?utf-8?B?WHBabWU4TGFoL3NkbHN0UUN2eEMwMnRaUDNUeVZyVVVDRXZzN0ZLMlREMTR3?=
 =?utf-8?B?dmZZVGw1dVNaaHY2ZjlkTHU0RzFpMURvRnBsekVCeEpYdWJXTjhpK0hUbjBi?=
 =?utf-8?B?dUlVNlZzaTNkbFdiZ1FoR2JnSk9HcEQ3Q0FLMklPMUlVZDVKcmdEcnBOVy94?=
 =?utf-8?B?bng0NkFVb2Fxc0o0VlFlY0x4eERpUW53cUVtZ2I0dVQ5cnhSWGh0UjdNZkVM?=
 =?utf-8?B?MTlFU0pkQlB0SzlUdWRQVmNaSlVWOTlsL1dSb0NjMElXRUFRcm5NYS9ZRFN5?=
 =?utf-8?B?Z09jdDllajJDOTN0REM1bUwxVlNNRk1mMm9TbUZKYU9leWw5NGxGTDdVckNV?=
 =?utf-8?B?UWV2L2N4ZitTME1qUEZncFpLTi9nT2N0Q1ZPUi9oY2NTWXk4WStqcGR6Sjgy?=
 =?utf-8?B?QUoxVlNITE5jUTE0RjZ0T3ZGblVIUkJnNUx3NmxITGlzUC9tV1F4c2ozUXFW?=
 =?utf-8?B?WXpOYzlGVEhoMHphMGFSV1VKbGZSMk1qVjBUQ3R5eVlLdWdsbXZVMzRSSWZp?=
 =?utf-8?B?QkRtcitpeENVTW1QMndrZktONVZ0THhjTW9OWk54eklZamV6MmpZeit3N3Fy?=
 =?utf-8?B?Wk1EckdYVEpWNjUweCs5VWlqNlRsN1B2cUZZK0xlRzZ2a0VYZGY2NkJPT2xY?=
 =?utf-8?B?YmdhUmJKVUQxeFpGVW5za2R2clhseml6RGhCWUJKTUsrKzF0eFVPMnNwZVFn?=
 =?utf-8?Q?P4uq0EXdEsMUKpACvjKROY/qc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c7102c-44cf-4538-27bb-08dd7f6e6c9e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2025 18:17:20.4135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGh3+tKyzKAm/qHmxA9WwN1zS/lJuaxmANsZflSxP39xNAtVjEwUK3mY7YHoTV4t7ZdBpqckBfGbc+EapS6YwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336

On 4/18/2025 8:41 AM, Alex Deucher wrote:
> amdgpu firmware updates.
> 
> The following changes since commit a9b5100f0f73e023aeb4372e02e39fd493b05daa:
> 
>    amdgpu: update dcn 4.01 frmware to 0.1.6.0 (2025-04-17 15:35:27 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-04-18
> 
> for you to fetch changes up to 3b81fc1785548f73d2f75395801551866c911f77:
> 
>    amdgpu: update vcn 4.0.5 firmware (2025-04-17 23:02:32 -0400)
> 
> ----------------------------------------------------------------
> amd-2025-04-18:
> 
> amdgpu firmware updates.
> 
> ----------------------------------------------------------------
> Alex Deucher (48):
>        amdgpu: update aldebaran firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update gc 11.0.4 firmware
>        amdgpu: update psp 13.0.11 firmware
>        amdgpu: update gc 11.5.1 firmware
>        amdgpu: update psp 14.0.1 firmware
>        amdgpu: update psp 13.0.8 firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update gc 9.4.3 firmware
>        amdgpu: update psp 13.0.6 firmware
>        amdgpu: update arcturus firmware
>        amdgpu: update gc 9.4.4 firmware
>        amdgpu: update psp 13.0.14 firmware
>        amdgpu: update gc 11.0.0 firmware
>        amdgpu: update psp 13.0.0 firmware
>        amdgpu: update vcn 4.0.0 firmware
>        amdgpu: update picasso firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update gc 11.0.3 firmware
>        amdgpu: update psp 13.0.10 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update psp 13.0.5 firmware
>        amdgpu: update vega10 firmware
>        amdgpu: update gc 11.0.2 firmware
>        amdgpu: update psp 13.0.7 firmware
>        amdgpu: update smu 13.0.7 firmware
>        amdgpu: update vcn 4.0.4 firmware
>        amdgpu: update vega12 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update vega20 firmware
>        amdgpu: update gc 12.0.0 firmware
>        amdgpu: update psp 14.0.2 firmware
>        amdgpu: update smu 14.0.2 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update gc 12.0.1 firmware
>        amdgpu: update psp 14.0.3 firmware
>        amdgpu: update smu 14.0.3 firmware
>        amdgpu: update vcn 5.0.0 firmware
>        amdgpu: update gc 11.5.2 firmware
>        amdgpu: update psp 14.0.4 firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update gc 11.0.1 firmware
>        amdgpu: update psp 13.0.4 firmware
>        amdgpu: update vcn 4.0.2 firmware
>        amdgpu: update psp 14.0.0 firmware
>        amdgpu: update vcn 4.0.5 firmware
> 
>   amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
>   amdgpu/aldebaran_sos.bin         | Bin 446176 -> 446176 bytes
>   amdgpu/aldebaran_ta.bin          | Bin 140288 -> 140288 bytes
>   amdgpu/arcturus_smc.bin          | Bin 270698 -> 270698 bytes
>   amdgpu/arcturus_sos.bin          | Bin 199248 -> 199248 bytes
>   amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
>   amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_ta.bin         | Bin 247040 -> 247040 bytes
>   amdgpu/beige_goby_vcn.bin        | Bin 579696 -> 579824 bytes
>   amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
>   amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 247040 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin  | Bin 579696 -> 579824 bytes
>   amdgpu/gc_11_0_0_me.bin          | Bin 314528 -> 314512 bytes
>   amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_0_mes1.bin        | Bin 218080 -> 218144 bytes
>   amdgpu/gc_11_0_0_mes_2.bin       | Bin 256288 -> 256624 bytes
>   amdgpu/gc_11_0_0_pfp.bin         | Bin 230496 -> 230480 bytes
>   amdgpu/gc_11_0_1_mes_2.bin       | Bin 255824 -> 256688 bytes
>   amdgpu/gc_11_0_2_me.bin          | Bin 314512 -> 314496 bytes
>   amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_2_mes1.bin        | Bin 218400 -> 218464 bytes
>   amdgpu/gc_11_0_2_mes_2.bin       | Bin 256288 -> 256624 bytes
>   amdgpu/gc_11_0_2_pfp.bin         | Bin 230496 -> 230480 bytes
>   amdgpu/gc_11_0_3_me.bin          | Bin 314528 -> 314512 bytes
>   amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_3_mes1.bin        | Bin 218144 -> 218208 bytes
>   amdgpu/gc_11_0_3_mes_2.bin       | Bin 256352 -> 256688 bytes
>   amdgpu/gc_11_0_3_pfp.bin         | Bin 230496 -> 230480 bytes
>   amdgpu/gc_11_0_4_mes_2.bin       | Bin 256080 -> 256688 bytes
>   amdgpu/gc_11_5_1_mes_2.bin       | Bin 256416 -> 257104 bytes
>   amdgpu/gc_11_5_2_rlc.bin         | Bin 162096 -> 162096 bytes
>   amdgpu/gc_12_0_0_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_12_0_0_me.bin          | Bin 422656 -> 422592 bytes
>   amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 447456 bytes
>   amdgpu/gc_12_0_0_pfp.bin         | Bin 351696 -> 352304 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin     | Bin 711488 -> 712656 bytes
>   amdgpu/gc_12_0_1_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_12_0_1_me.bin          | Bin 422656 -> 422592 bytes
>   amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 447456 bytes
>   amdgpu/gc_12_0_1_pfp.bin         | Bin 351696 -> 352304 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin     | Bin 711488 -> 712656 bytes
>   amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/navi10_asd.bin            | Bin 197120 -> 197120 bytes
>   amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi10_vcn.bin            | Bin 403904 -> 404032 bytes
>   amdgpu/navi12_asd.bin            | Bin 197120 -> 197120 bytes
>   amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_vcn.bin            | Bin 403904 -> 404032 bytes
>   amdgpu/navi14_asd.bin            | Bin 197120 -> 197120 bytes
>   amdgpu/navi14_ce.bin             | Bin 263296 -> 263296 bytes
>   amdgpu/navi14_me.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_mec.bin            | Bin 268592 -> 268160 bytes
>   amdgpu/navi14_mec2.bin           | Bin 268592 -> 268160 bytes
>   amdgpu/navi14_pfp.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_vcn.bin            | Bin 403904 -> 404032 bytes
>   amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
>   amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 247040 bytes
>   amdgpu/navy_flounder_vcn.bin     | Bin 579696 -> 579824 bytes
>   amdgpu/picasso_asd.bin           | Bin 197120 -> 197120 bytes
>   amdgpu/picasso_ta.bin            | Bin 46080 -> 46080 bytes
>   amdgpu/psp_13_0_0_ta.bin         | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
>   amdgpu/psp_13_0_10_ta.bin        | Bin 251328 -> 251328 bytes
>   amdgpu/psp_13_0_11_ta.bin        | Bin 238592 -> 238592 bytes
>   amdgpu/psp_13_0_14_sos.bin       | Bin 389408 -> 397632 bytes
>   amdgpu/psp_13_0_14_ta.bin        | Bin 67904 -> 67904 bytes
>   amdgpu/psp_13_0_4_ta.bin         | Bin 238592 -> 238592 bytes
>   amdgpu/psp_13_0_5_asd.bin        | Bin 197120 -> 197120 bytes
>   amdgpu/psp_13_0_5_ta.bin         | Bin 234496 -> 234496 bytes
>   amdgpu/psp_13_0_6_sos.bin        | Bin 782944 -> 787040 bytes
>   amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
>   amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 234496 bytes
>   amdgpu/psp_13_0_8_ta.bin         | Bin 234496 -> 234496 bytes
>   amdgpu/psp_14_0_0_ta.bin         | Bin 238592 -> 238592 bytes
>   amdgpu/psp_14_0_1_ta.bin         | Bin 234496 -> 238592 bytes
>   amdgpu/psp_14_0_2_ta.bin         | Bin 258016 -> 258016 bytes
>   amdgpu/psp_14_0_3_ta.bin         | Bin 270624 -> 270624 bytes
>   amdgpu/psp_14_0_4_ta.bin         | Bin 234496 -> 238592 bytes
>   amdgpu/psp_14_0_4_toc.bin        | Bin 2560 -> 2560 bytes
>   amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
>   amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_mec.bin    | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_mec2.bin   | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 374528 bytes
>   amdgpu/sienna_cichlid_vcn.bin    | Bin 579696 -> 579824 bytes
>   amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
>   amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
>   amdgpu/vangogh_asd.bin           | Bin 197120 -> 197120 bytes
>   amdgpu/vcn_4_0_0.bin             | Bin 395632 -> 395664 bytes
>   amdgpu/vcn_4_0_2.bin             | Bin 395632 -> 395632 bytes
>   amdgpu/vcn_4_0_4.bin             | Bin 395632 -> 395664 bytes
>   amdgpu/vcn_4_0_5.bin             | Bin 395632 -> 395632 bytes
>   amdgpu/vcn_5_0_0.bin             | Bin 440848 -> 440848 bytes
>   amdgpu/vega10_asd.bin            | Bin 197120 -> 197120 bytes
>   amdgpu/vega12_asd.bin            | Bin 197120 -> 197120 bytes
>   amdgpu/vega20_asd.bin            | Bin 197120 -> 197120 bytes
>   amdgpu/yellow_carp_ta.bin        | Bin 234496 -> 234496 bytes
>   114 files changed, 0 insertions(+), 0 deletions(-)

Merged, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/515

