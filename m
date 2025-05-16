Return-Path: <SRS0=IRtG=YA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DC0C3DA6D
	for <linux-firmware@archiver.kernel.org>; Fri, 16 May 2025 20:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E710C4CEEB; Fri, 16 May 2025 20:00:08 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94BF6C4CEE4
	for <linux-firmware@kernel.org>; Fri, 16 May 2025 20:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94BF6C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xK+P2lHRK+qNn3gj9zy/v3ARCz3QaDzEBDgRO7cw69lSPJKRw+vYXzeSryj2gZcHBJMXfNMwTkVNy1tw02kzhvZE93aPmvGVd8wn9STJ7d4jVYWzxAM93TLiW2tbkhPyH+M7vGIXj87vwAC1kd/mZ61XGQxf9c7bJ08HGUr3UQo3SPHd4dcgDnoHEXNuSfvr9X0Ed7u/74TYXGNH1OXALYlNNdE7toBJnlljY2X/XTMncO54FeWjnNsmO6NZ+SPn2KxlY7CcnDyS6h2I+0mHbZ9Ohph9VXB4GFV/io2RaxZ7ZzSbwDa8sb9QlDSkAjxZQcl7kDG/DlA10KG1HQgfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fBiCNr+qzEgrxV6oP6O5p33kvieMMdo01We9iPmTKc=;
 b=tYCoQViQAx5lgI9qCNXNlN+EttAmxcj7PUsRq8WmymgD3jKZKWg7X9OkHH0uxKqNxwq94qf/x4/4T9m+H6Hs6zM0JknxLwzfvLM8gvjtz4HfvSFoaixGghznHj9PV5Qd+CAOdIOhoDygXRiv1J0PmgH/wwxHxZgAXJ4gbK2zTECE8RBnoPHirWDTBT0MozuvjdF44MmO6eNpiRQ0AcsUqD6bor0pvUnDo22NCS77NFtjqTgXkVej5pojAdXLFAENo9AYiwoyV960I/Sa+OxrV2ki7kL4hYAdWN3wnmkGMdlWnx4NcUItqyaUkEEgh35nRLHoM9AcJ4gSBzkdvTMkug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fBiCNr+qzEgrxV6oP6O5p33kvieMMdo01We9iPmTKc=;
 b=VSZF1jaJrI03eeglMKzX6RPj7DVDNEZMPLuc2pvIhznUh4lQemD872yN/iXtR7oOTBHuCuMKJjc2J0Y9JzPOFXUdO5qLhzLF2KU20sQMe11W1FYf9QWmcsB09F00JWSjy9x1CNliaNEXl0qa8TziftzYFJ2g65w9jgkRGjg3Lpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6884.namprd12.prod.outlook.com (2603:10b6:510:1ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Fri, 16 May
 2025 20:00:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 20:00:01 +0000
Message-ID: <5cf13f0e-8e17-4262-9bff-aecc3744218a@amd.com>
Date: Fri, 16 May 2025 14:59:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Pull request: nvidia: add GSP-RM version 570.144 firmware images
List-Id: <linux-firmware.lore.kernel.org>
To: Timur Tabi <ttabi@nvidia.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: Ben Skeggs <bskeggs@nvidia.com>
References: <2413e7b12752e707de572ed85750032cc685d1e5.camel@nvidia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <2413e7b12752e707de572ed85750032cc685d1e5.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6884:EE_
X-MS-Office365-Filtering-Correlation-Id: 79969e87-8ffe-40df-2dc8-08dd94b43e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEVtNlFwbmN2YnAzYlNsdUxtYXYyQzJXNWEwbkg3dlRNMjFSK1F4U2krS0w4?=
 =?utf-8?B?V3hKTVhSdWx2ZnVkZXRPenZiYTQ0V1E5RGFKZ0Ztd0NnWnluY2JncE9hNkpj?=
 =?utf-8?B?OFRYMExWS0FDRisxbG5yYWtPMWZwVEVQS1RTTkVjMVkzNlBkUitpS3lUNzBr?=
 =?utf-8?B?YmMvYjl2YjM5T3o2UmRuZjh4TVB0Y2t5dGJscUs3NmhOSDUralpRQnhZNm1n?=
 =?utf-8?B?UWhUUndrZ0dacnpsUUhiMTRSWUNsdVJtWk9xYnFyblora3VHWldDb0NjQlov?=
 =?utf-8?B?UEZNR1NsdUtNYnhhbVdnOEt2K1JDamdHU1pTNzFHWnQ1WGh0bEVzQ1BadXR3?=
 =?utf-8?B?L1FKNGZDb1pqV3VUZlg0OHYydmtDdnpBL3hFdTdoVGxrVThYajd1VWgydm4w?=
 =?utf-8?B?NVZDL3lHVGxVbHdXeWlSSEVZc2ptbE12RzVqdGUxV2FlcnlmeER2R3MwRkgw?=
 =?utf-8?B?OUE4QTZxUE1yWXc1b3pReXVpRGZocERDTDFhRTJtTUk5S1dKRE1mMFFDSGQw?=
 =?utf-8?B?ZVptTkJSbUtLSlliR1RQai9ZeWppU2pHNXVMVWdvSUNBZENId1g3MVBkNXhX?=
 =?utf-8?B?OG1iRU11NW5sRjdQUktxSUZJbUJYR3YrNHZNemtjTHhhSDFYSVYzd1o3d2lY?=
 =?utf-8?B?SkNHZTlaYlBUSy9oUzV2Rmw5YldPTGpTWU9udDFHN0o0aHZWZVl2THAwTWdK?=
 =?utf-8?B?WHhqbmlHcUIwY25TU01sajBUd1RUQ0RheFlrTGF2SDFZOFZBbDBSLzBqZ3Bt?=
 =?utf-8?B?S3I2UnY3MEloa1J6N2E1YWhwOWozNVpoeExBcTF3WGNDTDVLYS9LL1R4ejlX?=
 =?utf-8?B?empQY1l6em12RG9FanVtNENMVFpXajhBMzFsSGxqdnBVU2NVZmRNWFNGTzRB?=
 =?utf-8?B?YXJDQUJOR2xnZjhKaHdUVVZUNzl5cnFPYlVwN0dKbVB3VzViQjUxdDJuYzZH?=
 =?utf-8?B?ZlRKL25WWG1vOTZVUlBSRXk4cFJxUFBtUnVsOVJPblFmd2JpOHVBL0NnaVlD?=
 =?utf-8?B?bWNrRk11YkQ0VDNGaUFNa0x4NWc3bktxaTJlRlRhR0RWcEJ5ZXNDbUtNNXow?=
 =?utf-8?B?dE1DNmo0ME1XR0F5ZjJOelpyN1Z1c1hXUFA4Z294dWJyTVdaVnNmdHRMQVVR?=
 =?utf-8?B?N1N4UWVtNUhNQkswMXJyL3lKRGdWVnVuZlhvOXlQVHREWlFBandrTVBha0RB?=
 =?utf-8?B?VEtxMFVmUm0rK3JIOUNYUEVMZlA0V1pSQ3RESU85cWo4M1h2WWV4VWV6TERm?=
 =?utf-8?B?NXQ2dFMyUDRnbS81ajYra0prTGRyTTJrVytYUVU4S2hJaDRLTkJOa01MbDd4?=
 =?utf-8?B?RkJjT2pIdldwaXJTUlR4WEEwOG4rUDgyWjIyMVVsWkQrb292c2h5TTF5S2pB?=
 =?utf-8?B?djRITXBOR2svb2RpM3orWkxQT2Z5UDZ3QW5sU3pYeUpHekFPMEhML1dKUnAy?=
 =?utf-8?B?T1pmRUY0MWFwMTJlQzhYalg5c2U4M3VTRVE0MS9UQk0vTGRGeWRHeWt1VDlH?=
 =?utf-8?B?ck5BRHJPYldaQWVlc0pGVHBzYVRpamVPYzNrRlFrcEV4VHVESnMxekRBTVQ3?=
 =?utf-8?B?TEZQenNOTFRueXR2MU9xNTdtNjhweHZxZlZPYm44K2xYVFBIdW9qUkgwYWlq?=
 =?utf-8?B?VWdBcUlWRjFYN1VpSkxXRkx4RG5xM3pzR01TRVI5dVdwVnFDQzZZVVpMNnVv?=
 =?utf-8?B?anMxZnJLV3VweWZtdkZmRzRVNXp2TWd3b0lGdHVPbVBML1NqQTFPUzdza2dQ?=
 =?utf-8?B?MCtCWHFGYnFhUGx4SzlnZ09LaXZ4dThHSU9MNGJDc1ZmWlA1QjdaTEZuam1C?=
 =?utf-8?Q?mEjDfmkNawxgt4hceGq8tTElYapdQRNK90X5I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akpMNkNyTFNmSHNOVlR2WmhSYUxtdE84bGxqS1dMZDdGVzBmOHVTMldyNlhX?=
 =?utf-8?B?U052K0dxTExLVWFKSkxUWE8ySVN1d3RKdC8weEhJM3JnQWZQenFFd1ZvMUpM?=
 =?utf-8?B?QVlLekhXcDZTbi9oSXNjWE9aMXJlVTVDNi9UU0tOcTJLRENGdmVSMGJSaW5t?=
 =?utf-8?B?R2RzZFhhQWxZQWpnRXFTR2ZseEVoSEZRR2dhclBVS0FXQ0t2MkZ2MnN3YWwv?=
 =?utf-8?B?TkVOdDQyV01ndHdxUGg5TDM1NmY5aStoVWM5blNzSGNVRy9aZC9rOXB1aWtQ?=
 =?utf-8?B?MlJCRHRocktjMWlVbTM2MWFOcGsvY253NXlzTTloaUZQdnNYcUF1MEhuR0NP?=
 =?utf-8?B?cU9jUXhHYXRUUW9JaVhCZGlENTlGY3p1bGxrbUpOc0pjTEVtNDEwNzIzWk1q?=
 =?utf-8?B?bktBY3RLaTQvM0gwUFEzUlBPcEZ6bFVQa0p4c2JFQ0h2QzY1MnRQaGx6ZHJm?=
 =?utf-8?B?R1FxMUIydkNlZVgyN1ZKZzJ3SkdvVFNaTnZXbllqTHlFd0s5dkI1MFQ0VDR6?=
 =?utf-8?B?L3Z3N29FWGdiYmp5aHhtMGVhMTBNVkE1OHYxdVBBL2RUeWZwZG05UkxYSGFq?=
 =?utf-8?B?NnZ5dnhybVdXZE5sam5KZEplQktmOHpUOE9XMUlrTkQ0cUFXaGVIQjhsaFA4?=
 =?utf-8?B?Y0t0WlVSYlZxQ1djQjYvZTZYczIvTjRqSG8wTWdna2xkNTl6VzM3WFlmN2xm?=
 =?utf-8?B?RGpvTHR0dUs0K3Y4SDJhbWtSUURFR1I4d0lDK3AvVnV3ZUdENFVQdU51ZkdP?=
 =?utf-8?B?dFBMd1lPeFlCa1RFbk1uTmE1Z1lVOUtycGxYMEVNYzRqWWpLbTZQeUYrN05X?=
 =?utf-8?B?V3NqTkdiaWJnZWJpYVFFKy9kQSt4cVN0cmdlTVJTWFc5NWJhYWM4bURVV0hw?=
 =?utf-8?B?a1BhZGViT3ZYZGp6VkJOSjBscnFRSTZlclNjRVFmSW1KOEt0cEE2SnpxK0pm?=
 =?utf-8?B?T2Y4VXJSclN0NjJpQktvc2gvQ3dBMEM1b0lkSUFEemRUcDB2MWV6UlJ2WGla?=
 =?utf-8?B?NDl5cTZWMXRpeURJSkN0bVVzaDdCT3dGRmZiS3BHUjlYdm43aEdxYkl5TGIv?=
 =?utf-8?B?ZWtkaGV6eEpINDBkQlVpVEZpdDZLT2xiQmZrbDBJekFXSncyaWV5cTNrcWJJ?=
 =?utf-8?B?ZkdobFZQa21qZzViaSs3VTc0OFltVmZmTTFnMHNBMStPRVVDS3RqcWpHN1NF?=
 =?utf-8?B?UEZ3ZExHRUJhaHVQUTdMZTF1d0tSQWxLYTRGQjZ5Wk4yUGpQLzRSbEhxRXJs?=
 =?utf-8?B?SndnY0RDNGs3NlZkaFV0RSsycGdCZlhqdmkreWp1N0lLT3R4d1R2MURsWVkv?=
 =?utf-8?B?OGFDQks0ZnlObmNZZzNsQWVQdjQvZllsS2NDOEJBSXdyN0UvRjNXaCtTZEpq?=
 =?utf-8?B?N3N2UDFqN0lGY1AveUExbDIzRHF4a0JEVFNweVhkSDdJK0FMZXBHV29GQ3I0?=
 =?utf-8?B?WDFYdWlMczlSTVhZTWtienprRHUzM0loSEhxZGcxbGhlTm5jbHg1dWRmN1FT?=
 =?utf-8?B?SlYvZDBuaGM2d1lxWWppcFBsUGk3dzJDMWQ1Y2pPdnNTSy93RFRRcGIyN3Ro?=
 =?utf-8?B?WThrdVVBRkIyeTVyWXhuQytaVWhlWElObWRvQ1NQR2xCMmJYYmJ6S1Z0Q29D?=
 =?utf-8?B?REZkWFBuSXlVRWJ3Q2pqMDFmTWZEKzFvYWVoOS9YYnJYTzRLT3gxcjkwS1ZC?=
 =?utf-8?B?ekE1eFp2OFZEUUw0dHpXUWJ6OWRlL2RZSDB6VGU4aWhBZ2NuSEUzaDIrY1FL?=
 =?utf-8?B?SnZETGxJbkszRDBCVXkvYy84TWxOeUEwRVNjREUxUEM1MlEyNWZFVllkd3hV?=
 =?utf-8?B?N1BPeDFISjcyUlZCcExOeFdZYzR5R1hGb0RpVnFwTENhOEJjZGVDOTVMVzVa?=
 =?utf-8?B?VEdpbmMwY25iY3ZhTFhjVU56cG1sNVFRQStIeExSSUdKd2xlaHdNWEEraHVX?=
 =?utf-8?B?T0I1N1dtRGU4Y2VZdHdDbDZBU2dkbTF4Nkw0Z0FGQ2lid0M2SlhuanhyR1NF?=
 =?utf-8?B?c05jd1ZCVW8ycWRWVVJRRW9oU1BmYXZhQVRDNlFhUk9JLzF4Y0xOMkY4UWpQ?=
 =?utf-8?B?RWxvcm5RQkpYYW9JcjdRMmw4QmUvREpxY1ZwbHliY0YzdnpyMkJZNnY3MW5l?=
 =?utf-8?Q?KVtgQDQFFo0hr9reSafKOy3EK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79969e87-8ffe-40df-2dc8-08dd94b43e3f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 20:00:01.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyY2Hj5N541ha78JFVidUi9YVbHnnD+6X8wUP3k66bMWr7UvjWcQSJwPkvfwBwsmA0Ql3fvwk7SIjD9O9xuK6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6884

On 5/16/2025 2:49 PM, Timur Tabi wrote:
> The following changes since commit 356f06bff1fd83d77d4969fed7d7ceb96b7e978a:
> 
>    Merge branch 'amd-staging' into 'main' (2025-05-16 18:57:37 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/NVIDIA/linux-firmware.git nvidia-staging
> 
> for you to fetch changes up to 050f0a1e3a76d671c073b59c813a4119b610b725:
> 
>    nvidia: add GSP-RM version 570.144 firmware images (2025-05-16 14:15:44 -0500)
> 
> ----------------------------------------------------------------
> Timur Tabi (1):
>        nvidia: add GSP-RM version 570.144 firmware images
> 
>   WHENCE                                     |  57 +++++++++++++++++++++++++++++++++++++++++++++++++-
> -------
>   nvidia/ad102/gsp/booter_load-570.144.bin   | Bin 0 -> 57720 bytes
>   nvidia/ad102/gsp/booter_unload-570.144.bin | Bin 0 -> 41592 bytes
>   nvidia/ad102/gsp/bootloader-570.144.bin    | Bin 0 -> 36972 bytes
>   nvidia/ad102/gsp/scrubber-570.144.bin      | Bin 0 -> 8312 bytes
>   nvidia/ga100/gsp/booter_load-570.144.bin   | Bin 0 -> 60664 bytes
>   nvidia/ga100/gsp/booter_unload-570.144.bin | Bin 0 -> 40440 bytes
>   nvidia/ga100/gsp/bootloader-570.144.bin    | Bin 0 -> 4196 bytes
>   nvidia/ga102/gsp/booter_load-570.144.bin   | Bin 0 -> 61304 bytes
>   nvidia/ga102/gsp/booter_unload-570.144.bin | Bin 0 -> 41080 bytes
>   nvidia/ga102/gsp/bootloader-570.144.bin    | Bin 0 -> 24684 bytes
>   nvidia/ga102/gsp/gsp-570.144.bin           | Bin 0 -> 63571696 bytes
>   nvidia/gb100/gsp/bootloader-570.144.bin    | Bin 0 -> 200812 bytes
>   nvidia/gb100/gsp/fmc-570.144.bin           | Bin 0 -> 198028 bytes
>   nvidia/gb202/gsp/bootloader-570.144.bin    | Bin 0 -> 200812 bytes
>   nvidia/gb202/gsp/fmc-570.144.bin           | Bin 0 -> 199820 bytes
>   nvidia/gh100/gsp/bootloader-570.144.bin    | Bin 0 -> 168044 bytes
>   nvidia/gh100/gsp/fmc-570.144.bin           | Bin 0 -> 166600 bytes
>   nvidia/tu102/gsp/booter_load-570.144.bin   | Bin 0 -> 59272 bytes
>   nvidia/tu102/gsp/booter_unload-570.144.bin | Bin 0 -> 39304 bytes
>   nvidia/tu102/gsp/bootloader-570.144.bin    | Bin 0 -> 4196 bytes
>   nvidia/tu102/gsp/gsp-570.144.bin           | Bin 0 -> 28542040 bytes
>   nvidia/tu116/gsp/booter_load-570.144.bin   | Bin 0 -> 59016 bytes
>   nvidia/tu116/gsp/booter_unload-570.144.bin | Bin 0 -> 39048 bytes
>   24 files changed, 49 insertions(+), 8 deletions(-)
>   create mode 100644 nvidia/ad102/gsp/booter_load-570.144.bin
>   create mode 100644 nvidia/ad102/gsp/booter_unload-570.144.bin
>   create mode 100644 nvidia/ad102/gsp/bootloader-570.144.bin
>   create mode 100644 nvidia/ad102/gsp/scrubber-570.144.bin
>   create mode 100644 nvidia/ga100/gsp/booter_load-570.144.bin
>   create mode 100644 nvidia/ga100/gsp/booter_unload-570.144.bin
>   create mode 100644 nvidia/ga100/gsp/bootloader-570.144.bin
>   create mode 100644 nvidia/ga102/gsp/booter_load-570.144.bin
>   create mode 100644 nvidia/ga102/gsp/booter_unload-570.144.bin
>   create mode 100644 nvidia/ga102/gsp/bootloader-570.144.bin
>   create mode 100644 nvidia/ga102/gsp/gsp-570.144.bin
>   create mode 100644 nvidia/gb100/gsp/bootloader-570.144.bin
>   create mode 100644 nvidia/gb100/gsp/fmc-570.144.bin
>   create mode 100644 nvidia/gb202/gsp/bootloader-570.144.bin
>   create mode 100644 nvidia/gb202/gsp/fmc-570.144.bin
>   create mode 100644 nvidia/gh100/gsp/bootloader-570.144.bin
>   create mode 100644 nvidia/gh100/gsp/fmc-570.144.bin
>   create mode 100644 nvidia/tu102/gsp/booter_load-570.144.bin
>   create mode 100644 nvidia/tu102/gsp/booter_unload-570.144.bin
>   create mode 100644 nvidia/tu102/gsp/bootloader-570.144.bin
>   create mode 100644 nvidia/tu102/gsp/gsp-570.144.bin
>   create mode 100644 nvidia/tu116/gsp/booter_load-570.144.bin
>   create mode 100644 nvidia/tu116/gsp/booter_unload-570.144.bin
> 

It's merged:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/551
