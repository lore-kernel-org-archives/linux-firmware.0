Return-Path: <SRS0=s8CI=JB=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515ACC47258
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Jan 2024 19:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BBECC433C7; Tue, 23 Jan 2024 19:33:28 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D10AC433F1;
	Tue, 23 Jan 2024 19:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D10AC433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyBP4jIabqk7GxoF5sVJARlAZ9SFfqVhIkCbtu7f55gxMzHTrHLBvD/9AnYBcOkXFVU+K5aASAsY/au2NC/C63pS3KL317I9wfvQx4spT1+dOEOj164QwgIVdxak8Fw2cuNZsgHt9DTJ9X/r1FTTVKIGCwEkn+9FPrB7JVPLb4YuA7r44a7aeYxC7jgk43N+uYee5ZJywHX93OoKWSLx/IKdap5LEkplLCDOJKcAWq2G4ogMJ21/Za+lPl0KtZwfiqlejZjnqNscgICRvyL+YJ6C+N1XVOsSYnZUBielRHiS7PGsuAB28QCUVKsFInFYbFGB3cf9rK5gXbkFUWAaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bis2aAodlI90jJv8yCuccso2dv3oDLvAubnepXdL0hU=;
 b=Ib3YErgIL1OsMYUydzH0uIqosXjfAZJyku4T6cW1ge3tZyDDxMh6SmmGAhjEea7SILYeCDALzJR1dBtUyEvwfyOniPuq7Mn85+PKaQty5fRiv2uAhoa3daY2EcrnOTjHCuzke73zmwBvPldogGE6/eWivlPYwYIp6xXRkQkA5M7bHyUkwbCz2iVGoGm738G0RQlgWYUC7iQTD2fFCm+1eJSsnoq4h+M0YA+gy40MmdEFRjrlGLW2HK8hJYJ90dkfTvhSAIdAWoTgY/DJrsX1O7QI2oxtRkmwCfFKta6aFzk+lelEDDGRFQEfzcV8wy2GRTz+9zDrsFTEy50l6SEFIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bis2aAodlI90jJv8yCuccso2dv3oDLvAubnepXdL0hU=;
 b=thOqtzdX2BDraAc6DpiaEZ1X3raqCVRiBuO+5X2+ThcZuiVtRjhezpe6aDg7qVE3u46gB0wKv7c5on2EWGC+S15tBk0r2cDCBv+cjseOLfQhHceoJw26vRqPWkDEbKEW+UTaocTYmP9o4laEnd3qAI96j4LEbCVdTTuDhq1DRP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.37; Tue, 23 Jan 2024 19:33:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.034; Tue, 23 Jan 2024
 19:33:23 +0000
Message-ID: <e1eb53fb-15fe-406a-9a76-7d7ca6d62379@amd.com>
Date: Tue, 23 Jan 2024 13:33:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware amd-2024-01-23
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org,
 jwboyer@kernel.org
References: <20240123184210.2753628-1-alexander.deucher@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240123184210.2753628-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0301.namprd03.prod.outlook.com (2603:10b6:8:2b::8)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0fbb6c-e424-4fb0-867d-08dc1c4a29ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SGFusZGqM1ik0tHFpmubQBQJOn7KucaWVC+RcPnnk3Lith1QamdV7x5iHG5U+sWRjKAOtOsc49RCveLK+SW5TNfs5GZ+DyAfIbumbPXBMdM5TEpbalPZWltW+ZRn0RifZKNOWM3Lrkzhs53Fn2zmzHs/+M0HFcKbipuHQgh1fLFoQqcEoc5/SjhA2Jl4I1nnOsVIQUba6umEKkx5TaEKygH9bRHiZW4SPTKxhlv6m68XH+SVlDZHjCo1nPxIU8GduQyO5HHw2zU+IvsbtosApgr1xR8vREOrwwOiO06mORHrvjKUL/SZavQfwQzDGH5hYoGnLxwv2Uv1bdVsD0pNMPOcysLwJCCbIxsO24Dou7R7Rs6TSMbNk+MrKGuqo7E/zADhLmibwvxE/rM9OG3AdvUsOyeyyDwvi41Eq1k3wnl3wQ/87TWA1VYzVa9hg017egyrHYv2fXrA2p6F4udE85eYNWge8kQ0wedv5Kfhg/YSzNaP99GkoG9baIwfTQnFv8F+ITVMErkfgw/fZYEwmuUmIP9eBnfyiyeTtyVCgK0pWIlPzOT2IeLTX/RerouK8KglTic0AtK4UAL9G068MqQJE/wPBSK149L7x/BdjCTZgtHwQWncHtgUYB8NxW1i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(83380400001)(41300700001)(36756003)(86362001)(31696002)(966005)(38100700002)(6486002)(26005)(2616005)(6512007)(30864003)(6506007)(450100002)(2906002)(66476007)(478600001)(66946007)(316002)(66556008)(53546011)(44832011)(8676002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVQ5YTlzUkVFSHp2TUZFVGg2TlFWR200TXFKV2NyVEUxZkVDYmVGRHNid1VG?=
 =?utf-8?B?bUNFZEI2WnU4SmVsY21HanJTQ3E2OElBQ1FzbjJ5L3pNMUJKcU1FY2tteTNi?=
 =?utf-8?B?NXg1aHl2ZERJUjdTQU9pNmZCblVXbWlDU0xIMWFhV3dRSFJqRUN0TnZycncw?=
 =?utf-8?B?QS96L3FaWmNERVlFZ0FUOTI5U0ZNMUFXaDNZNHZJQXZaWjdPWVMzOElLT3Vy?=
 =?utf-8?B?UDZXbVdpOUxzUkpjcTFaa1F5RFdTRkpwTFI0VUVHM3hXMlkwNFZEc3pGNmxJ?=
 =?utf-8?B?dWVvZzJlRmV0UE1LNk9Wbi81Z2N2eHRFSVQ4RENndGxPU1hFQXZSdWc1QzFJ?=
 =?utf-8?B?ZzdlT2NGTis0c0JURXd4c1FFM1ROUDFFd1IrRVFHSGtNR0NzR2gzMWNKYXVx?=
 =?utf-8?B?QzFLaHlHT2lUQkNXQWdOTlVYVFFKZXNPeUZJV0VnWnN2Y2xyNXBpbGN1c0Ft?=
 =?utf-8?B?YitXWnpZeDFFQUF1T29VTzFpdVhKOUJGUVE1TDI2R0JORm9kOG5hK2tiTXdN?=
 =?utf-8?B?dS9lcGRWdWhQdktWa3R3cmlpdUlQSm9tSzNDckhvU0hTVU9vcjIvRUU5a3Vv?=
 =?utf-8?B?VFVWZzZ4cHBEa1grTnFoaXFQQjZXcy9hZjJxb2VNWUd4a09UcGkyUE1RNVU3?=
 =?utf-8?B?dGlURVkyU2ZWTkZzVFcyQlZYUDZ1ZUFZWXZYZkk1d1FuT2phMnBsQzRCOUt6?=
 =?utf-8?B?ZFdXRDFKTmFqaTFqZmpuNDREMEU5d2Zqb3E4anFlcDVtcytPSi9IcWRvelpr?=
 =?utf-8?B?aktoWi9sbzR6QVYvcjUzV24vYXkwa0hNL1BsY09jL0VxcjNXd1IzRDdVTElF?=
 =?utf-8?B?MkdOWW5DYStPWFlHWkpvSnpEWm1uWHp1UjZsNCs5aG9nR2hvd0ZxSDBrVG5D?=
 =?utf-8?B?aktvSjRpRnV5bm9ZY25CVVJCVFZ2cHNsdHBjRWEyWlRSb0o1aUh1aUJ0RjU4?=
 =?utf-8?B?UDloTS8vZnpIbkdHcFZjVThYdXJnSWNjNmwyaFlKYTJDTmNObThkUU5LMUF6?=
 =?utf-8?B?c0prNFlQQnJNcUhycnU5REpmTlFWMUlEOERkUlJINi9pM2hORHBQbjgyRW9x?=
 =?utf-8?B?ck14bmNCZlY2S3Y1Ly8rU2V3WlRxbUJUWW5VMDRMdVBvTTRtZVdyVVp4RkIy?=
 =?utf-8?B?V1NMRS9WNlFKYW1Pd3g2bWlDNjhEOGo5RjlYUHBVZ0xuNHdHM2dCZ3A3S08y?=
 =?utf-8?B?NDRhTkV1aXJ6VmR1Mzh2WDFXSjc4TEJqcGJMQTFvOXJqUGRiMmFGRmZuWnY3?=
 =?utf-8?B?d3VIQkI0LzFocjNnRXlHbnNUZEQ3alVCS3owMEZ1YlJlVnhtdEw4WGhvTjRk?=
 =?utf-8?B?WDRTZW5WeEYwT2V2Mnh0RmpFZTVDSHE5cDZlSnJlbTk0RG9hREw3TjdxK2U2?=
 =?utf-8?B?VHd6eGZ1bmdNSGpsRVA4MzBDck05dGxpRUZYdlpaOTVQbS9oL1BsWWJOa05G?=
 =?utf-8?B?M21yUFp5a1lRUHBFQVA2ZzViMDlZYkRJajhHN1k3bXJvNWZmenhDb3RDN0pr?=
 =?utf-8?B?c0xFMkt5S04ySlZnQ2N5c3NhV3JiZEtrUFJaamxEaUhHOGpRTmNPOGJYQUFE?=
 =?utf-8?B?czlGcllSdkd3V1l4Q1BjM2lVbkp0N2N6UlBUR05tOEJMS1BNV3VUMXpKMHFQ?=
 =?utf-8?B?UmdiMzhaRG5wRWF5eThCWEwrUTN3NzZucHpIblh3dFJDK0ZYTWRYRkIrZGFy?=
 =?utf-8?B?UVBYL2ZrdEVJRzQ5RU1WYUxpNTNxekMybnEvRGZpT3VBUFVoVW90MlB6Zkx6?=
 =?utf-8?B?eHk4WGN1MlBIT1dLNkMxZHBRV1BPZEtubnpFa3ZZWXdCdDBTOHZjZHhmUFVi?=
 =?utf-8?B?a3BIK1NjQlJBQkVJYytSYTN1dmNUVlN5dUxhNXkvTWZ6cERNUFZuWUVyMXVP?=
 =?utf-8?B?Q3BFa3VpZjRSRGhCcldPbzYxSzB1c0YralJ4akpuV0tNTU1lUXM3Kys5ZVBH?=
 =?utf-8?B?bkovbFZWRkQ5RzRJenMxY3ZPUThONjk3bU9hUnhBclNzVnFGOUVtWXBDWUgz?=
 =?utf-8?B?MnZhVHkwaEQ5VkJ3ZEFvRlhMUjhIbC92YUkxOW9taUoyV0pmVkRMRm42aVFS?=
 =?utf-8?B?c1Q5dXlLeDROSFZGcGV1MEU4YitMSkw1SDlSREpNQis4ZDVqbE1FbloyYWpm?=
 =?utf-8?Q?YjQuMvWf1zJEkyfkuj4Y/dXhm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0fbb6c-e424-4fb0-867d-08dc1c4a29ae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 19:33:23.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyRc4HDUOoGPDXZ9B6y/rB0vtQeMevAiXed8F6QqIrDu8KEB/K/Vx6dhUlh/OPYtxz9IgMJD//SYn3gUYslBrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344

On 1/23/2024 12:42, Alex Deucher wrote:
> Hi,
> 
> The following changes since commit 4d8afe32753bff72f05b8eb125b401408f718a50:
> 
>    amdgpu: DMCUB updates for DCN314 (2024-01-12 14:43:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-01-23
> 
> for you to fetch changes up to 207f71b1306e8b1f2eb6003950371045537fcfdf:
> 
>    amdgpu: update raven2 firmware (2024-01-23 12:49:16 -0500)
> 
> ----------------------------------------------------------------
> amd-2024-01-23:
> 
> Updated firmares.
> 
>  From internal git commit:
> 9a5104340a1e9fe80240546cc3d0975fdeaa8e06
> 
> ----------------------------------------------------------------
> Alex Deucher (48):
>        amdgpu: update aldebaran firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update SDMA 6.0.3 firmware
>        amdgpu: update SMU 13.0.10 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update SMU 13.0.7 firmware
>        amdgpu: update VCN 4.0.4 firmware
>        amdgpu: update renoir firmware
>        amdgpu: Add GC 9.4.3 firmware
>        amdgpu: add PSP 13.0.6 firmware
>        amdgpu: add SMU 13.0.6 firmware
>        amdgpu: add SDMA 4.4.2 firmware
>        amdgpu: add VCN 4.0.3 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update arcturus firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update picasso firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update vega10 firmware
>        amdgpu: update vega12 firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SMU 13.0.0 firmware
>        amdgpu: update VCN 4.0.0 firmware
>        amdgpu: update vega20 firmware
>        amdgpu: add GC 11.0.1 rlc_1 firmware
>        amdgpu: update GC 10.3.6 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update SDMA 5.2.6 firmware
>        amdgpu: update VCN 3.1.2 firmware
>        amdgpu: update PSP 13.0.8 firmware
>        amdgpu: update SDMA 5.2.7 firmware
>        amdgpu: update raven firmware
>        amdgpu: update raven2 firmware
> 
>   WHENCE                           |   8 ++++++++
>   amdgpu/aldebaran_mec.bin         | Bin 268560 -> 268576 bytes
>   amdgpu/aldebaran_mec2.bin        | Bin 268560 -> 268576 bytes
>   amdgpu/aldebaran_sjt_mec.bin     | Bin 268560 -> 268576 bytes
>   amdgpu/aldebaran_sjt_mec2.bin    | Bin 268560 -> 268576 bytes
>   amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
>   amdgpu/aldebaran_ta.bin          | Bin 140288 -> 140288 bytes
>   amdgpu/arcturus_ta.bin           | Bin 127744 -> 127744 bytes
>   amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
>   amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268720 bytes
>   amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268720 bytes
>   amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_smc.bin        | Bin 244934 -> 244934 bytes
>   amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
>   amdgpu/beige_goby_ta.bin         | Bin 226560 -> 234752 bytes
>   amdgpu/beige_goby_vcn.bin        | Bin 579568 -> 582768 bytes
>   amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
>   amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268720 bytes
>   amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268720 bytes
>   amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_smc.bin  | Bin 244902 -> 244902 bytes
>   amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
>   amdgpu/dimgrey_cavefish_ta.bin   | Bin 226560 -> 234752 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin  | Bin 579568 -> 582768 bytes
>   amdgpu/gc_10_3_6_rlc.bin         | Bin 177088 -> 177104 bytes
>   amdgpu/gc_11_0_0_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_0_me.bin          | Bin 197216 -> 298320 bytes
>   amdgpu/gc_11_0_0_mec.bin         | Bin 407072 -> 407072 bytes
>   amdgpu/gc_11_0_0_mes1.bin        | Bin 211696 -> 216832 bytes
>   amdgpu/gc_11_0_0_mes_2.bin       | Bin 239136 -> 244144 bytes
>   amdgpu/gc_11_0_0_pfp.bin         | Bin 211104 -> 228096 bytes
>   amdgpu/gc_11_0_0_rlc.bin         | Bin 184992 -> 185248 bytes
>   amdgpu/gc_11_0_0_rlc_1.bin       | Bin 0 -> 185248 bytes
>   amdgpu/gc_11_0_1_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268640 bytes
>   amdgpu/gc_11_0_1_mes1.bin        | Bin 231344 -> 231440 bytes
>   amdgpu/gc_11_0_1_mes_2.bin       | Bin 235072 -> 244016 bytes
>   amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_rlc.bin         | Bin 160592 -> 160592 bytes
>   amdgpu/gc_11_0_2_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_2_me.bin          | Bin 197216 -> 379952 bytes
>   amdgpu/gc_11_0_2_mec.bin         | Bin 407072 -> 407072 bytes
>   amdgpu/gc_11_0_2_mes1.bin        | Bin 212048 -> 217184 bytes
>   amdgpu/gc_11_0_2_mes_2.bin       | Bin 239136 -> 244144 bytes
>   amdgpu/gc_11_0_2_pfp.bin         | Bin 211088 -> 229024 bytes
>   amdgpu/gc_11_0_2_rlc.bin         | Bin 178448 -> 178720 bytes
>   amdgpu/gc_11_0_3_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_3_me.bin          | Bin 197232 -> 379968 bytes
>   amdgpu/gc_11_0_3_mec.bin         | Bin 407072 -> 407072 bytes
>   amdgpu/gc_11_0_3_mes1.bin        | Bin 211792 -> 216928 bytes
>   amdgpu/gc_11_0_3_mes_2.bin       | Bin 239200 -> 244208 bytes
>   amdgpu/gc_11_0_3_pfp.bin         | Bin 211088 -> 229024 bytes
>   amdgpu/gc_11_0_3_rlc.bin         | Bin 178832 -> 178976 bytes
>   amdgpu/gc_11_0_4_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_4_mec.bin         | Bin 268704 -> 268704 bytes
>   amdgpu/gc_11_0_4_mes1.bin        | Bin 230640 -> 230736 bytes
>   amdgpu/gc_11_0_4_mes_2.bin       | Bin 234048 -> 242384 bytes
>   amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_4_rlc.bin         | Bin 158752 -> 158752 bytes
>   amdgpu/gc_9_4_3_mec.bin          | Bin 0 -> 269200 bytes
>   amdgpu/gc_9_4_3_rlc.bin          | Bin 0 -> 48076 bytes
>   amdgpu/green_sardine_asd.bin     | Bin 180736 -> 188928 bytes
>   amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
>   amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
>   amdgpu/green_sardine_mec.bin     | Bin 268048 -> 268048 bytes
>   amdgpu/green_sardine_mec2.bin    | Bin 268048 -> 268048 bytes
>   amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
>   amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
>   amdgpu/navi10_asd.bin            | Bin 180736 -> 188928 bytes
>   amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
>   amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_mec.bin            | Bin 268592 -> 268592 bytes
>   amdgpu/navi10_mec2.bin           | Bin 268592 -> 268592 bytes
>   amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
>   amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
>   amdgpu/navi12_asd.bin            | Bin 184832 -> 188928 bytes
>   amdgpu/navi12_sos.bin            | Bin 204656 -> 204656 bytes
>   amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
>   amdgpu/navi14_asd.bin            | Bin 180736 -> 188928 bytes
>   amdgpu/navi14_sos.bin            | Bin 184176 -> 184176 bytes
>   amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
>   amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
>   amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268720 bytes
>   amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268720 bytes
>   amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_smc.bin     | Bin 244902 -> 244902 bytes
>   amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 218608 bytes
>   amdgpu/navy_flounder_ta.bin      | Bin 226560 -> 234752 bytes
>   amdgpu/navy_flounder_vcn.bin     | Bin 579568 -> 582768 bytes
>   amdgpu/picasso_asd.bin           | Bin 180736 -> 188928 bytes
>   amdgpu/picasso_ce.bin            | Bin 9344 -> 9344 bytes
>   amdgpu/picasso_me.bin            | Bin 17536 -> 17536 bytes
>   amdgpu/picasso_mec.bin           | Bin 268064 -> 268048 bytes
>   amdgpu/picasso_mec2.bin          | Bin 268064 -> 268048 bytes
>   amdgpu/picasso_pfp.bin           | Bin 21632 -> 21632 bytes
>   amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
>   amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
>   amdgpu/psp_13_0_0_ta.bin         | Bin 242944 -> 247040 bytes
>   amdgpu/psp_13_0_10_sos.bin       | Bin 355808 -> 360352 bytes
>   amdgpu/psp_13_0_10_ta.bin        | Bin 243584 -> 235392 bytes
>   amdgpu/psp_13_0_11_ta.bin        | Bin 218560 -> 226304 bytes
>   amdgpu/psp_13_0_4_ta.bin         | Bin 218560 -> 230400 bytes
>   amdgpu/psp_13_0_5_asd.bin        | Bin 184832 -> 188928 bytes
>   amdgpu/psp_13_0_5_ta.bin         | Bin 218112 -> 222208 bytes
>   amdgpu/psp_13_0_6_sos.bin        | Bin 0 -> 385056 bytes
>   amdgpu/psp_13_0_6_ta.bin         | Bin 0 -> 63808 bytes
>   amdgpu/psp_13_0_7_sos.bin        | Bin 248496 -> 248496 bytes
>   amdgpu/psp_13_0_7_ta.bin         | Bin 218112 -> 222208 bytes
>   amdgpu/psp_13_0_8_ta.bin         | Bin 218112 -> 222208 bytes
>   amdgpu/raven2_asd.bin            | Bin 180736 -> 184832 bytes
>   amdgpu/raven2_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/raven2_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/raven2_mec.bin            | Bin 268048 -> 268048 bytes
>   amdgpu/raven2_mec2.bin           | Bin 268048 -> 268048 bytes
>   amdgpu/raven2_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/raven2_ta.bin             | Bin 33536 -> 33536 bytes
>   amdgpu/raven_asd.bin             | Bin 180736 -> 188928 bytes
>   amdgpu/raven_ce.bin              | Bin 9344 -> 9344 bytes
>   amdgpu/raven_me.bin              | Bin 17536 -> 17536 bytes
>   amdgpu/raven_mec.bin             | Bin 268064 -> 268048 bytes
>   amdgpu/raven_mec2.bin            | Bin 268064 -> 268048 bytes
>   amdgpu/raven_pfp.bin             | Bin 21632 -> 21632 bytes
>   amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
>   amdgpu/renoir_asd.bin            | Bin 180736 -> 188928 bytes
>   amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/renoir_mec.bin            | Bin 268048 -> 268048 bytes
>   amdgpu/renoir_mec2.bin           | Bin 268048 -> 268048 bytes
>   amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
>   amdgpu/sdma_4_4_2.bin            | Bin 0 -> 34304 bytes
>   amdgpu/sdma_5_2_6.bin            | Bin 34048 -> 34048 bytes
>   amdgpu/sdma_5_2_7.bin            | Bin 34048 -> 34048 bytes
>   amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
>   amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268720 bytes
>   amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268720 bytes
>   amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_smc.bin    | Bin 247396 -> 247396 bytes
>   amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
>   amdgpu/sienna_cichlid_ta.bin     | Bin 354048 -> 362240 bytes
>   amdgpu/sienna_cichlid_vcn.bin    | Bin 579568 -> 582768 bytes
>   amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
>   amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
>   amdgpu/smu_13_0_6.bin            | Bin 0 -> 2584 bytes
>   amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
>   amdgpu/vangogh_asd.bin           | Bin 184832 -> 188928 bytes
>   amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
>   amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/vangogh_mec.bin           | Bin 268720 -> 268720 bytes
>   amdgpu/vangogh_mec2.bin          | Bin 268720 -> 268720 bytes
>   amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
>   amdgpu/vcn_3_1_2.bin             | Bin 571824 -> 575792 bytes
>   amdgpu/vcn_4_0_0.bin             | Bin 385232 -> 386128 bytes
>   amdgpu/vcn_4_0_2.bin             | Bin 367136 -> 385232 bytes
>   amdgpu/vcn_4_0_3.bin             | Bin 0 -> 384720 bytes
>   amdgpu/vcn_4_0_4.bin             | Bin 385232 -> 386128 bytes
>   amdgpu/vega10_asd.bin            | Bin 180736 -> 184832 bytes
>   amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/vega10_mec.bin            | Bin 268048 -> 268048 bytes
>   amdgpu/vega10_mec2.bin           | Bin 268048 -> 268048 bytes
>   amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/vega12_asd.bin            | Bin 180736 -> 188928 bytes
>   amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/vega12_mec.bin            | Bin 268048 -> 268048 bytes
>   amdgpu/vega12_mec2.bin           | Bin 268048 -> 268048 bytes
>   amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/vega20_asd.bin            | Bin 180736 -> 184832 bytes
>   amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/vega20_mec.bin            | Bin 268048 -> 268048 bytes
>   amdgpu/vega20_mec2.bin           | Bin 268048 -> 268048 bytes
>   amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
>   amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_mec.bin       | Bin 268720 -> 268720 bytes
>   amdgpu/yellow_carp_mec2.bin      | Bin 268720 -> 268720 bytes
>   amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_ta.bin        | Bin 218112 -> 222208 bytes
>   amdgpu/yellow_carp_vcn.bin       | Bin 571824 -> 575792 bytes
>   189 files changed, 8 insertions(+)
>   create mode 100644 amdgpu/gc_11_0_0_rlc_1.bin
>   create mode 100644 amdgpu/gc_9_4_3_mec.bin
>   create mode 100644 amdgpu/gc_9_4_3_rlc.bin
>   create mode 100644 amdgpu/psp_13_0_6_sos.bin
>   create mode 100644 amdgpu/psp_13_0_6_ta.bin
>   create mode 100644 amdgpu/sdma_4_4_2.bin
>   create mode 100644 amdgpu/smu_13_0_6.bin
>   create mode 100644 amdgpu/vcn_4_0_3.bin

Merged, thanks.
