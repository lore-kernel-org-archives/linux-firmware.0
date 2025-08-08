Return-Path: <SRS0=sE22=2U=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDF0C87FCB
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Aug 2025 16:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06B2DC4CEF4; Fri,  8 Aug 2025 16:22:22 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50B63C4CEED
	for <linux-firmware@kernel.org>; Fri,  8 Aug 2025 16:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50B63C4CEED
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tdADWq+O4OqxoDOds++0JYJNUDe3wpK7B6oyfcrblZhCFdCJYRbV56Jw8BK4MyOdRK2VZUBIBIRS/Mb8rPlb1OqMdMKOBoVts0lJUzzQb9BKrIiEVBs/VyOQtZ0FvqFAW7xqgKEeWC1I5sJxR0Vnw+P8ApZVREHBt+n8ec3+FChhkgFNW17ea6eryooTdIffxfKeL9HekKJao5MflNpfB3/MIT8VlkMHzDJy4kza0IHUY+/nxW8sa9RHdR//osPjurzgYmGa+y/sn2gw+zpPybO2SYrJJraqIoKlx2Rzzf3BLTCyp5fFLi8g1pyCSfYNnW4M8cnctkkAzgGD/u2wEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCfj/1J+bxaNjFmQdcvf4N2KFF7LZUbyjGFTeHkHrao=;
 b=E2BZOudLSZuXLgyssK78XH5c4xw29Mnc3z6vRHF24XQnDr71Oc5ZYhPsZfWKka3NepnYCGMurV9dm+e0qthn/4M2xduF/642q7Yi2Gt6ZnNMPmU5hhlxGvdD4pKwotoJH6Hvv12ZZnN29LYd8WO3GQWoyKgawetjw/9ZDJof6hr34Z96w7hqiGIUxwlUNqEIf7p1jZqpA/l0vfqohbkF4OZKfy2vdxJHoS6/a+4f0uomcspJF0dsdf3nJB0y1lrsDdI/FsCvBuYucFKPEQp7CH4fEmjGyvsb1sqkjSruvYg5yr/KaO6FrYwEAXOkLaBOCt2onF5JiXP1R8TXErviKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCfj/1J+bxaNjFmQdcvf4N2KFF7LZUbyjGFTeHkHrao=;
 b=SonRWuFTz/qUpuVRF9FHdeqOhhbKvOXoHuHmY1ziJwalZet4eGTN2IfCcYesGrf0/aNMDmD+AAM96xeqWgOa5TLt3PlKQIPFzDkHtXOBV7JmT+3aCYcDr1Okb1YyyBppQbxohZTDr41UBDZi7DmgW5X21jHKC4+P7lBfVUBs19U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8858.namprd12.prod.outlook.com (2603:10b6:806:385::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 16:22:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 16:22:16 +0000
Message-ID: <857b9888-734f-4050-a760-5621e1969ee8@amd.com>
Date: Fri, 8 Aug 2025 11:22:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amd-2025-08-07
List-Id: <linux-firmware.lore.kernel.org>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: <20250807162515.1560892-1-alexander.deucher@amd.com>
 <dc1923f7-b174-4262-87b4-892937c05fe2@amd.com>
 <BL1PR12MB5144CACB04E3720F4D015FDCF72FA@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <BL1PR12MB5144CACB04E3720F4D015FDCF72FA@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0119.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::18) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 6efe9b48-abff-4f8b-33a8-08ddd697bd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eG5jb3kwZTdFaGwzQXowa3QzYVFlZjBOWURUb01OY1FBcmZCdTBkZVZ3QmIw?=
 =?utf-8?B?dWVXZnNJNDJwVWlZWXBvRWgxUmpCQkdMdHF5QnhXMUpNakdZZE9reEI2TVJj?=
 =?utf-8?B?RW9UbkJmdyt1VU11OVovZnRsbGNrOUtBRklMUjNkMk43VUExamVSb0duQVho?=
 =?utf-8?B?QVFoeFErT25KMmt5YU10cVZMOWFEUEFJcEFFZU1vTlh1V0c1M0FKUHVLZDgw?=
 =?utf-8?B?NGRsZGxIMktJb2h5WnRpeTZ1eHBRY3FYRjBGS05XZEJ0S0s2bGNEUi9CbWZX?=
 =?utf-8?B?bU8yT0YrOU5yTERGdmJyaWlpdFByUk01MDhJWnhidzV6MmtDUTliOHQ2dTdX?=
 =?utf-8?B?QUN4Mi9UM01ORVo2ZElWdHBpR05DekdZWlJsSldEbmdLNEpxL3lIUTZqMmJj?=
 =?utf-8?B?MzFGUW84dFBlcmh6bmRtS0JNaTR6bXVDTDNOVnhFUlI0dXZXajJBbHRLKzJi?=
 =?utf-8?B?c2tnbEoyQUJGcHhzNEVia0p5N3BWN1FTdHZ3K0REdHN4dFpLTlM2WXFEV2FX?=
 =?utf-8?B?ZUkxWHhRN1dGWkhRNHJGcWRibmE3Z0NJU2NoRGJ6ZzJvM1krSTNSTW9iT0ts?=
 =?utf-8?B?Z1RpZDJvL21RdVFBS295T1NKMTVxRTU0cjdpcWgzaEVsNCtaOEY4dlJFU0ti?=
 =?utf-8?B?ZlN2TVBkUURkeHZNRnNERjd3bk5CNnhGakIyZXIzVnVvZGVEMjFVZFRPcGV0?=
 =?utf-8?B?bmRSY2J0dk5NMXY3QWNzTWdjWi9kSU14OHhOdVN3MTBBZGIvN3hWUUJ5Wjh6?=
 =?utf-8?B?WG1qYXlweUlOUm5WSHdQTDJ5bytWYUtFczJ3akxKcjVNRnViU1p5cGtSUzI4?=
 =?utf-8?B?ZTJQMFpQWGNGUFRmV2JHbFVRVFhiN2JpMEJzM0NkV20zemJDZkttTUkxdzBF?=
 =?utf-8?B?R292STRaZ3RVWExVNUhYWVR0UUliMm9CdHFBSVIybmxEa1o4b0F3VUpsakk1?=
 =?utf-8?B?dkJVTXdjOFRuQzZMSnJTU0VvQ1VnWi9vQStENk0rb3VhdkpPVGtmd3FHRjZP?=
 =?utf-8?B?TXFDMTg4QzRYMTdTalZ6N2dZY1QvZGd1VlBLRkd6SmlqSmZwODdNQnRxOHpr?=
 =?utf-8?B?UlE2ajQ3ZEkwUmczZ3llQ1FUcTZ3d2VQb0xhRTB5Y1g2UXd4ZXpWaUtHVDBW?=
 =?utf-8?B?RjBManN3L3ZHNGU4WHVQdjlSVVo5YVBpNExuM0gxT1JPTXljSWtHRTBqZUVk?=
 =?utf-8?B?c041aFN1dlVTUWNGaVVVcHcvZVprU2t6SUVoMjRKVytaaFEzamJkUGZlbTdj?=
 =?utf-8?B?Q0NGY0l1REd6cXFickUzREFUR3p0cGxQNlBOSzY2Y05vemJETDBJMXY4OHRE?=
 =?utf-8?B?MXdmOTN0WDdJNUY5RThYVHc1ZDVmTGhIZU5ORUxxdEVaTWZNb1Izd2w0ZWZv?=
 =?utf-8?B?Vkx5WnNCVUpzeVNOK3RuNEZ0OTd3a25nWEtVTU5pVllaajdZcnVnSHNFQlkv?=
 =?utf-8?B?c3M4TURhTXNnZ3k5K3hOMUp5U2VKWWdTRFFjMUFkRzB6S0t1UTBTVkFETmhK?=
 =?utf-8?B?NFU4Z2E1MUh4TU1SVHpXTU95bk9WcHgzZUY3c1U2R0gvSDFiRCtPVkpNa0FY?=
 =?utf-8?B?Qi9kOGxKT2Z3K1FqRWI4eTUxemhJbjkybFdnZ21NN2lsdXlpVWhEeFlzUFlD?=
 =?utf-8?B?bS90K0VodDdwRWdaYW1DMm1XeGhsNGVNTFBuYlBsc1BRUTN5aVRLcXhpUDBR?=
 =?utf-8?B?NEZLUXdrVlNOZko2SkEzcGNqMUdyQXdSWWJsSnVRd2txR3ZMQmJKOGNVNHIw?=
 =?utf-8?B?QnF2ODVSVEJaOUFnbUI2cmZXeU5EVm5rRVVnNlQrS2dtQXlwd0RWYjQ1ck9w?=
 =?utf-8?B?VEZ5U1MyMkpPOThkNzB2UHkwbkdWZkl5anBsNGZxMHhWRW53azh2Q25QTGhk?=
 =?utf-8?B?azNKNXVicEc4cXpnNUtHT1lXSFJDV2Q0enZPR0xxL1lQTWZEYm4yVEJvYnhz?=
 =?utf-8?Q?cpVGmLetmJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3JyQkhQL1ljYWZvRGN4bFBlS2NyekRyTXYvWkY5YUZHczd1SmtHbHUyUEtq?=
 =?utf-8?B?RDdCckIvcm4xVHUxNkpqbFVzd0RsS0l3RGFLSTV4c0xma1piem5HdXovVGFa?=
 =?utf-8?B?NEJsVmY0T2dMZUhlOVcwRkdiZjFPaGE2YXdsOW1FSHB5eDZ5TmhBWW5SM0dM?=
 =?utf-8?B?TzlCS3ZlNk45Z3hXUVFDWXpmRFcwRTUzS29TT1hBQU10UXppZ0tLSVQ2NGRJ?=
 =?utf-8?B?VnNSN3BMYWsyZFpGZlpNNnAvZ0hPTFZRLzFRbCsxM01HRkg3ay9sdWc1ckVX?=
 =?utf-8?B?YmdRMXV6a0w3RGdkZjIyc2xFbFVqT2hpSVJmRWxsMVBRbEd6Y3YrTWFKcGdN?=
 =?utf-8?B?bkZ5WXNxaGNReVBTSkcrd3V4UjF2M1pJaGZhK1poVFk0RlZVaEY2cERQYk1o?=
 =?utf-8?B?YUhUZ2VkcXZwS2hLTkYrbFdIdWtJNXdEQWVrVVJCMkFnYjl5dnBIWVgvRVZQ?=
 =?utf-8?B?c2xKSTdjZHllVk5QUlZXL1plNlRhcytRUWRESmxSMm9qbnB1UElKU1NuZ2tF?=
 =?utf-8?B?WG1xVnFtOE96T001bGdsbnZoTkoxSUpnYTFCbGNwQytxcGxRS2R3ZnJZeVA3?=
 =?utf-8?B?RjBPK2wzYk54SmJqRlN5ZWFDdGVURll0UXUvOVJPZmR0cEF4VXlGR2pVZ2RV?=
 =?utf-8?B?RTkxZXUzb1hwQ0c5UVpHUUNaZTlMNGtnMXlBa3MzT3d3cXJQZjJwOExJK1F6?=
 =?utf-8?B?RFFXSmxJVlF3eVljdmJncGVzaXF0aFV1eU84VTZic1JkOEZaaGJiL1ZhZnZR?=
 =?utf-8?B?Q29wYWZaRUp4N0xwNzk3WitDWVdFRllzY2d0dXNpcmlQQlZyR1Q2eStKaHRu?=
 =?utf-8?B?SEdBRndYR1V4UmplZWZIWGE3WUpXd3VwcWxWekVvTW5FTllVa0JEZHoveUNE?=
 =?utf-8?B?UDFhL01BZUhiUEZHR2FxWWx6aVhSVzF1Q2FTSytvZmRpbEJNRy9Id04yYlQx?=
 =?utf-8?B?bytNNGRKcTBsZDFBK1h4MlQ2cG5kWVJtTUI2WWtUeSs4Q3dYaURBak1kTk5D?=
 =?utf-8?B?c0h4QlRMUW1tVlZ6MXgzT3N3VGpPbGpUeEx3SjdTSzlSSlE2MFgzbWk4L29V?=
 =?utf-8?B?ZHJXanlOcCt1VFhvM2xqVVEvUENGMm1RdVFRWTgrMmVjYnozT0J5VFF2Z2VV?=
 =?utf-8?B?K1ZZS0xtYktmQk1mbWE4V3NOUjJrdTA1ODR2YllBMk9nWjdPMWVxaGVvbHhK?=
 =?utf-8?B?VkR5aHA2UGIrdlFtMmFrMWdRRWgvTjROYzM4M2hadVF2QUhvWTFGazdHcXZk?=
 =?utf-8?B?V200aHhUMVFzaExaUUQ5QTFaQmRNYThxZVhKL09senZMNTQweGxvZVI4T1Qw?=
 =?utf-8?B?R1l4MkhPYlFTSmF6dG1HdzA1dFpwZ3FZQXdsRXR1TDdZT25FR2VQQkkyUWJI?=
 =?utf-8?B?b1RCdVpURUVybC8zU05mcWloYlFYMkpnVVZDZGhRZHFlMEdhYU9qTEFxVUxt?=
 =?utf-8?B?bFN4aU9SazdJaEhtSHhQeTl5VktvKzhPVTR5MUxEczJJbnFrS2wxcUxtNFVR?=
 =?utf-8?B?UTJPeE5ZQmtwZFRLdktsYmhWMkdLNXlHa2MxRDZ2K21WS0pCVmtJRTVLeVBU?=
 =?utf-8?B?aGRyZWFieVFYeDFjT2luYVpxcEswd2l6T3MrRlZ4SXQ5ejBuQTBKbGM1SFJM?=
 =?utf-8?B?UldpTTh5a2RUWjl6WkR1elZuL2tRaVNhZXp6dCs1MUVwbmJpRE14QjhweGln?=
 =?utf-8?B?dER3MVI1ZGJkRGtXN2NuNjdnb3ZEajE2SHgxaE9LbHgvUjVDRHlILzl0Q0d4?=
 =?utf-8?B?Y0NEckoyWTYyT0p4dy9KTTlIY3RLRFJFWUtvZG9QL2Y1Q2s0TExpSEdSMjd1?=
 =?utf-8?B?a2lOZHBYRDlaQ3ZPbFNrR1lzWWI5WStVdEdkUkxOVDBTbFExU2Jkbm5HSm1T?=
 =?utf-8?B?NHBnLzZ5cTlnSGVhSDE5ek5sTDd0Z2MzQTNZUy96aXpQMFY2dWxpOWFQWGVT?=
 =?utf-8?B?bFV3SnNMRGhFVVNsZW9MdGdaeE8xSXp3R3NkNE44cFNHdVVYam9kNWlUT1NE?=
 =?utf-8?B?T3FwSWNURzVCUi9mdFhnK1FzK2xLTUwyMjJ4YjdMRXRuR1NxZm0yVHBHVzZP?=
 =?utf-8?B?c1dOUXNEUkt0NTZ2VldKdHJnTEoxVTM5Z01MRW1TVE1UeVZ2dXpJMjlPQSs1?=
 =?utf-8?Q?lPt95qd59ZG2ZJJzS1jaUVmk6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efe9b48-abff-4f8b-33a8-08ddd697bd6b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 16:22:16.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhDbanhemtm/eGvdt+GY0iX/V2rJ3Ix4A/cuSjgOROeu7mywwjXKkbCPzCOE2VvfmDEirSFKmXVkkHUMS6DfeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8858

On 8/8/2025 8:56 AM, Deucher, Alexander wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Limonciello, Mario <Mario.Limonciello@amd.com>
>> Sent: Thursday, August 7, 2025 12:59 PM
>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; linux-
>> firmware@kernel.org
>> Subject: Re: [pull] amd-2025-08-07
>>
>> On 8/7/25 11:25 AM, Deucher, Alexander wrote:
>>> Hi,
>>>
>>> Updated AMD GPU firmware.  Please apply.
>>>
>>> The following changes since commit
>> ba2549fc973076ac1500a9ba5adf8864c130e7f5:
>>>
>>>     amdgpu: Update GCN 4.0.5 microcode (2025-08-05 13:35:36 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.com/kernel-firmware/drm-firmware.git
>>> tags/amd-2025-08-07
>>>
>>> for you to fetch changes up to 4bc7421189c99138355ac1378a1cb60ff34af516:
>>>
>>>     amdgpu: update renoir firmware (2025-08-07 12:07:15 -0400)
>>>
>>> ----------------------------------------------------------------
>>> amd-2025-08-07:
>>>
>>> Update to latest GPU firmware
>>> Add new kicker firmwares.
>>>
>>> ----------------------------------------------------------------
>>> Alex Deucher (63):
>>>         amdgpu: update aldebaran firmware
>>>         amdgpu: update dimgrey_cavefish firmware
>>>         amdgpu: update GC 11.0.1 firmware
>>>         amdgpu: update PSP 13.0.4 firmware
>>>         amdgpu: update SDMA 6.0.1 firmware
>>>         amdgpu: update VCN 4.0.2 firmware
>>>         amdgpu: update GC 11.5.0 firmware
>>>         amdgpu: update PSP 14.0.0 firmware
>>>         amdgpu: update VCN 4.0.5 firmware
>>>         amdgpu: update GC 10.3.7 firmware
>>>         amdgpu: update PSP 13.0.8 firmware
>>>         amdgpu: update beige goby firmware
>>>         amdgpu: update GC 11.0.4 firmware
>>>         amdgpu: update PSP 13.0.11 firmware
>>>         amdgpu: update GC 11.5.1 firmware
>>>         amdgpu: update PSP 14.0.1 firmware
>>>         amdgpu: update SDMA 6.1.1 firmware
>>>         amdgpu: update VCN 4.0.6 firmware
>>>         amdgpu: update vpe 6.1.1 firmware
>>>         amdgpu: update GC 9.4.3 firmware
>>>         amdgpu: update PSP 13.0.6 firmware
>>>         amdgpu: update PSP 13.0.14 firmware
>>>         amdgpu: update GC 11.0.0 firmware
>>>         amdgpu: update SDMA 6.0.0 firmware
>>>         amdgpu: update VCN 4.0.0 firmware
>>>         amdgpu: update GC 9.5.0 firmware
>>>         amdgpu: update PSP 13.0.12 firmware
>>>         amdgpu: update VCN 5.0.1 firmware
>>>         amdgpu: update PSP 13.0.0 kicker firmware
>>>         amdgpu: update navi10 firmware
>>>         amdgpu: update vangogh firmware
>>>         amdgpu: update navi12 firmware
>>>         amdgpu: update GC 11.0.3 firmware
>>>         amdgpu: update PSP 13.0.10 firmware
>>>         amdgpu: update SDMA 6.0.3 firmware
>>>         amdgpu: update navi14 firmware
>>>         amdgpu: update GC 11.0.2 firmware
>>>         amdgpu: update PSP 13.0.7 firmware
>>>         amdgpu: update SDMA 6.0.2 firmware
>>>         amdgpu: update VCN 4.0.4 firmware
>>>         amdgpu: update GC 10.3.6 firmware
>>>         amdgpu: update PSP 13.0.5 firmware
>>>         amdgpu: update VCN 3.1.2 firmware
>>>         amdgpu: update vega10 firmware
>>>         amdgpu: update vega12 firmware
>>>         amdgpu: update GC 12.0.0 firmware
>>>         amdgpu: update PSP 14.0.2 firmware
>>>         amdgpu: update SDMA 7.0.0 firmware
>>>         amdgpu: update vega20 firmware
>>>         amdgpu: update sienna cichlid firmware
>>>         amdgpu: update GC 12.0.1 firmware
>>>         amdgpu: update PSP 14.0.3 firmware
>>>         amdgpu: update SDMA 7.0.1 firmware
>>>         amdgpu: update VCN 5.0.0 firmware
>>>         amdgpu: update yellow carp firmware
>>>         amdgpu: update GC 11.5.2 firmware
>>>         amdgpu: update PSP 14.0.4 firmware
>>>         amdgpu: update SDMA 6.1.2 firmware
>>>         amdgpu: update navy flounder firmware
>>>         amdgpu: add GC 12.0.1 kicker firmware
>>>         amdgpu: add PSP 14.0.3 firmware
>>>         amdgpu: add SMU 14.0.3 kicker firmware
>>>         amdgpu: update renoir firmware
>>>
>>>    WHENCE                           |   5 +++++
>>>    amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
>>>    amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
>>>    amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
>>>    amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
>>>    amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
>>>    amdgpu/beige_goby_ta.bin         | Bin 247040 -> 247040 bytes
>>>    amdgpu/beige_goby_vcn.bin        | Bin 580080 -> 580080 bytes
>>>    amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
>>>    amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 247040 bytes
>>>    amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580080 -> 580080 bytes
>>>    amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
>>>    amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
>>>    amdgpu/gc_10_3_6_mec.bin         | Bin 268160 -> 268592 bytes
>>>    amdgpu/gc_10_3_6_mec2.bin        | Bin 268160 -> 268592 bytes
>>>    amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
>>>    amdgpu/gc_10_3_7_ce.bin          | Bin 263296 -> 263296 bytes
>>>    amdgpu/gc_10_3_7_me.bin          | Bin 263424 -> 263424 bytes
>>>    amdgpu/gc_10_3_7_mec.bin         | Bin 268160 -> 268160 bytes
>>>    amdgpu/gc_10_3_7_mec2.bin        | Bin 268160 -> 268160 bytes
>>>    amdgpu/gc_10_3_7_pfp.bin         | Bin 263424 -> 263424 bytes
>>>    amdgpu/gc_11_0_0_me.bin          | Bin 314512 -> 314512 bytes
>>>    amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
>>>    amdgpu/gc_11_0_0_mes1.bin        | Bin 218144 -> 218240 bytes
>>>    amdgpu/gc_11_0_0_mes_2.bin       | Bin 257072 -> 257056 bytes
>>>    amdgpu/gc_11_0_0_pfp.bin         | Bin 230480 -> 230976 bytes
>>>    amdgpu/gc_11_0_1_mes_2.bin       | Bin 256544 -> 256448 bytes
>>>    amdgpu/gc_11_0_2_me.bin          | Bin 314496 -> 314496 bytes
>>>    amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
>>>    amdgpu/gc_11_0_2_mes1.bin        | Bin 218464 -> 218560 bytes
>>>    amdgpu/gc_11_0_2_mes_2.bin       | Bin 257072 -> 257056 bytes
>>>    amdgpu/gc_11_0_2_pfp.bin         | Bin 230480 -> 230992 bytes
>>>    amdgpu/gc_11_0_3_me.bin          | Bin 314512 -> 314512 bytes
>>>    amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
>>>    amdgpu/gc_11_0_3_mes1.bin        | Bin 218208 -> 218336 bytes
>>>    amdgpu/gc_11_0_3_mes_2.bin       | Bin 257136 -> 257120 bytes
>>>    amdgpu/gc_11_0_3_pfp.bin         | Bin 230480 -> 230992 bytes
>>>    amdgpu/gc_11_0_3_rlc.bin         | Bin 179104 -> 179104 bytes
>>>    amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
>>>    amdgpu/gc_11_0_4_mec.bin         | Bin 268640 -> 268640 bytes
>>>    amdgpu/gc_11_0_4_mes_2.bin       | Bin 256544 -> 256448 bytes
>>>    amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
>>>    amdgpu/gc_11_5_0_mes_2.bin       | Bin 256608 -> 256512 bytes
>>>    amdgpu/gc_11_5_0_rlc.bin         | Bin 166528 -> 166528 bytes
>>>    amdgpu/gc_11_5_1_mes_2.bin       | Bin 256896 -> 256800 bytes
>>>    amdgpu/gc_11_5_1_rlc.bin         | Bin 161040 -> 161040 bytes
>>>    amdgpu/gc_11_5_2_imu.bin         | Bin 132352 -> 132352 bytes
>>>    amdgpu/gc_11_5_2_mes_2.bin       | Bin 256080 -> 256704 bytes
>>>    amdgpu/gc_11_5_2_rlc.bin         | Bin 162096 -> 162096 bytes
>>>    amdgpu/gc_12_0_0_me.bin          | Bin 419776 -> 466592 bytes
>>>    amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 447456 bytes
>>>    amdgpu/gc_12_0_0_pfp.bin         | Bin 352016 -> 351984 bytes
>>>    amdgpu/gc_12_0_0_uni_mes.bin     | Bin 721312 -> 721824 bytes
>>>    amdgpu/gc_12_0_1_imu_kicker.bin  | Bin 0 -> 132352 bytes
>>>    amdgpu/gc_12_0_1_me.bin          | Bin 419776 -> 466592 bytes
>>>    amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 447456 bytes
>>>    amdgpu/gc_12_0_1_pfp.bin         | Bin 352016 -> 351984 bytes
>>>    amdgpu/gc_12_0_1_rlc_kicker.bin  | Bin 0 -> 150848 bytes
>>>    amdgpu/gc_12_0_1_uni_mes.bin     | Bin 721312 -> 721824 bytes
>>>    amdgpu/gc_9_4_3_rlc.bin          | Bin 38708 -> 38708 bytes
>>>    amdgpu/gc_9_5_0_mec.bin          | Bin 269200 -> 268736 bytes
>>>    amdgpu/gc_9_5_0_rlc.bin          | Bin 38700 -> 38700 bytes
>>>    amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 269200 -> 268736 bytes
>>>    amdgpu/navi10_asd.bin            | Bin 197120 -> 197120 bytes
>>>    amdgpu/navi12_asd.bin            | Bin 197120 -> 197120 bytes
>>>    amdgpu/navi12_sos.bin            | Bin 204656 -> 204656 bytes
>>>    amdgpu/navi14_asd.bin            | Bin 197120 -> 197120 bytes
>>>    amdgpu/navi14_sos.bin            | Bin 184176 -> 184176 bytes
>>>    amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 222704 bytes
>>>    amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 247040 bytes
>>>    amdgpu/navy_flounder_vcn.bin     | Bin 580080 -> 580080 bytes
>>>    amdgpu/psp_13_0_0_sos_kicker.bin | Bin 268976 -> 268976 bytes
>>>    amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
>>>    amdgpu/psp_13_0_10_ta.bin        | Bin 251328 -> 353728 bytes
>>>    amdgpu/psp_13_0_11_ta.bin        | Bin 238592 -> 340992 bytes
>>>    amdgpu/psp_13_0_12_ta.bin        | Bin 66880 -> 70976 bytes
>>>    amdgpu/psp_13_0_14_ta.bin        | Bin 67904 -> 67904 bytes
>>>    amdgpu/psp_13_0_4_ta.bin         | Bin 238592 -> 340992 bytes
>>>    amdgpu/psp_13_0_5_asd.bin        | Bin 197120 -> 197120 bytes
>>>    amdgpu/psp_13_0_5_ta.bin         | Bin 234496 -> 234496 bytes
>>>    amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
>>>    amdgpu/psp_13_0_7_sos.bin        | Bin 248496 -> 248496 bytes
>>>    amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 234496 bytes
>>>    amdgpu/psp_13_0_8_ta.bin         | Bin 234496 -> 234496 bytes
>>>    amdgpu/psp_14_0_0_ta.bin         | Bin 238592 -> 238592 bytes
>>>    amdgpu/psp_14_0_1_ta.bin         | Bin 238592 -> 340992 bytes
>>>    amdgpu/psp_14_0_1_toc.bin        | Bin 2560 -> 2560 bytes
>>>    amdgpu/psp_14_0_2_sos.bin        | Bin 421216 -> 421216 bytes
>>>    amdgpu/psp_14_0_2_ta.bin         | Bin 258016 -> 372816 bytes
>>>    amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
>>>    amdgpu/psp_14_0_3_sos_kicker.bin | Bin 0 -> 435968 bytes
>>>    amdgpu/psp_14_0_3_ta.bin         | Bin 270624 -> 385424 bytes
>>>    amdgpu/psp_14_0_3_ta_kicker.bin  | Bin 0 -> 270624 bytes
>>>    amdgpu/psp_14_0_4_ta.bin         | Bin 238592 -> 340992 bytes
>>>    amdgpu/psp_14_0_4_toc.bin        | Bin 2560 -> 2560 bytes
>>>    amdgpu/renoir_vcn.bin            | Bin 403904 -> 404288 bytes
>>>    amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
>>>    amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
>>>    amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
>>>    amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
>>>    amdgpu/sdma_6_1_1.bin            | Bin 34560 -> 34560 bytes
>>>    amdgpu/sdma_6_1_2.bin            | Bin 34560 -> 34560 bytes
>>>    amdgpu/sdma_7_0_0.bin            | Bin 47872 -> 47872 bytes
>>>    amdgpu/sdma_7_0_1.bin            | Bin 47104 -> 47104 bytes
>>>    amdgpu/sienna_cichlid_sdma.bin   | Bin 34048 -> 34048 bytes
>>>    amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
>>>    amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 374528 bytes
>>>    amdgpu/sienna_cichlid_vcn.bin    | Bin 580080 -> 580080 bytes
>>>    amdgpu/smu_14_0_3_kicker.bin     | Bin 0 -> 327424 bytes
>>>    amdgpu/vangogh_vcn.bin           | Bin 579568 -> 572368 bytes
>>>    amdgpu/vcn_3_1_2.bin             | Bin 571952 -> 572368 bytes
>>>    amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 395664 bytes
>>>    amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 395664 bytes
>>>    amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 395664 bytes
>>>    amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 395664 bytes
>>>    amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 395664 bytes
>>>    amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 395664 bytes
>>>    amdgpu/vcn_5_0_0.bin             | Bin 433552 -> 434768 bytes
>>>    amdgpu/vcn_5_0_1.bin             | Bin 207440 -> 208144 bytes
>>>    amdgpu/vega10_asd.bin            | Bin 197120 -> 197120 bytes
>>>    amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
>>>    amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
>>>    amdgpu/vega10_mec.bin            | Bin 268064 -> 268224 bytes
>>>    amdgpu/vega10_mec2.bin           | Bin 268064 -> 268224 bytes
>>>    amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
>>>    amdgpu/vega12_asd.bin            | Bin 197120 -> 197120 bytes
>>>    amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
>>>    amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
>>>    amdgpu/vega12_mec.bin            | Bin 268064 -> 268224 bytes
>>>    amdgpu/vega12_mec2.bin           | Bin 268064 -> 268224 bytes
>>>    amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
>>>    amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
>>>    amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
>>>    amdgpu/vega20_mec.bin            | Bin 268064 -> 268224 bytes
>>>    amdgpu/vega20_mec2.bin           | Bin 268064 -> 268224 bytes
>>>    amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
>>>    amdgpu/vpe_6_1_1.bin             | Bin 25984 -> 25984 bytes
>>>    amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
>>>    amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
>>>    amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
>>>    amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
>>>    amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
>>>    amdgpu/yellow_carp_rlc.bin       | Bin 178128 -> 178128 bytes
>>>    amdgpu/yellow_carp_ta.bin        | Bin 234496 -> 234496 bytes
>>>    amdgpu/yellow_carp_vcn.bin       | Bin 571440 -> 572368 bytes
>>>    145 files changed, 5 insertions(+)
>>>    create mode 100644 amdgpu/gc_12_0_1_imu_kicker.bin
>>>    create mode 100644 amdgpu/gc_12_0_1_rlc_kicker.bin
>>>    create mode 100644 amdgpu/psp_14_0_3_sos_kicker.bin
>>>    create mode 100644 amdgpu/psp_14_0_3_ta_kicker.bin
>>>    create mode 100644 amdgpu/smu_14_0_3_kicker.bin
>>
>> Alex,
>>
>> It seems that CI isn't passing, I think some things were missed from WHENCE.
>>
>> E: amdgpu/gc_12_0_0_imu_kicker.bin listed in WHENCE does not exist
>> E: amdgpu/gc_12_0_0_rlc_kicker.bin listed in WHENCE does not exist
>> E: amdgpu/gc_12_0_1_imu_kicker.bin not listed in WHENCE
>> E: amdgpu/gc_12_0_1_rlc_kicker.bin not listed in WHENCE
>>
>> Could you fixup those commits and force push the branch?  Hopefully it will refresh
>> the PR once you do.
>> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/636#
>>
>> If not ping me and I'll refresh it.
> 
> Pushed.
> 
> Thanks.
> 
> Alex
> 

Merged now, thanks.

