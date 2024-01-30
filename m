Return-Path: <SRS0=POTr=JI=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12011C46CD2
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jan 2024 16:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8A33C43394; Tue, 30 Jan 2024 16:02:03 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2070.outbound.protection.outlook.com [40.107.102.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98858C433C7;
	Tue, 30 Jan 2024 16:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98858C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3ovkiwCp6EkgeUkE4f6hMxdechWP/tHe+MkcPuMLvgkF9niQZ8U4F8VfXC+VPkpSi5AWpsh0v0oizP4s+gDetmKHURBBGTzlh54M9DO4eH+Pc4R0dSwRoSBi94Y2Tygxosy+7DLtk4Dw5mc8ZSke+kWALrfqXr4TH/6Ybtt+c+e3g6EwD6lVhB6G1efTPGxJTJBHOT3WDd6tv/pXYHTbekAE5hD1Xrki/H3HiRVSJ0uUlrfwpfTlqv8eeTWIh0O+s9+558cebkByUJqka81p1pfkYSdnHpTTuC25msp+SnLrm6oHIQZWEFhM+LFcNDFhX122P/L3dhJ0UXZQs80Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AX2rIPoi97IGK4UlhOxLAVsva9NK4jVvi50S5R2sZ9c=;
 b=ogJ6yOTAkHZugM4TGegk7bnURba5VGfZziI9BJHKes1onYbaZLGDJw4NNTc9VgUD2KmxkrgKdp1J0C1vJlEm89sIBmpZQN4DtVGOHNqvVje5DZhKEtovLevplcSgdr0KYeA4gbMiCaiXE0uozL6f8lE817JHQKXNKxBazCdZWun7g+MlAJuAWD3cj04bq2wgxq4qOcvrLwNvsuXEZAjl5T/l7oG18fBnic7b7e6xq+QWCLxJfwMwEr2//dW5FAXJIXzGDGTlVdU261K5emtpZpUBYUbx/l1GCC3sp9xcKGW76RHCq9dz4mAtzcdgE3fZh3//wvzwFAxXMHGWqUn23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AX2rIPoi97IGK4UlhOxLAVsva9NK4jVvi50S5R2sZ9c=;
 b=hPkFfm6vqs4kdq2rbDMxuATV7gNSUctMjS0xZxagEJqMPCp67fijFGTaEnHpj65AbN14fRdXiojpL0nS5PAMaCzMiWb1ObRNH3L+nObTCIkUMnMGw1/dbvEzuRFLUZ5FE6zt5zgWrQViJnAXXtnHjJZkMwWnye/IJgxxk8Gs2b8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 16:01:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 16:01:58 +0000
Message-ID: <fbda9ad8-2473-439c-aba8-26b2f4cf5cda@amd.com>
Date: Tue, 30 Jan 2024 10:01:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu amd-2024-01-30
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org,
 jwboyer@kernel.org, "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>
References: <20240130141251.2493810-1-alexander.deucher@amd.com>
 <95a91938-4fe5-4d17-9349-294181a53f78@amd.com>
In-Reply-To: <95a91938-4fe5-4d17-9349-294181a53f78@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c352cf3-12c6-4d96-efe4-08dc21acc986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JGlAGvH2FLPs/ojv1mYRq3/lwi0MGyB7DjgAKSCZ07FwGRRZr1ZD34N6SKQq6rJ8bZ3GyluIcOhlczlvE6M55X5ppuo3yq9Z91/wWhPNyhJEq57qYQyu8NoGJD89MIG3dsvr+UhKAITbuheIg9ZevAzCQtqYIqjiK+nUpzTnlHxEsx8vy3QgtthaEt9JK4N9kv5uutpK87+nzy6ztxNkss1uDFxtIuoUPcwWN7xRc0KTioBvkw5X7pvNS8wWQguOBZhykIjkg1cgzQzYgoWAlQAJMgKYvBRpRznrqxKUVKDscqLlp5xZ1dGEoDDWWvbMhgtoDwbY0bzkXwWR6Lja4oIfolErRA1mr+CrghZDsCnjFQwEozfPdhbJMk+0uuTD6AsN11IT5CMECFJ9Onw2s0cvcRCufXEBYX2NHg68UeI9rErNjMV7Wd+3quoZXIq4GLR4iHRkETSKvK5CRKRvYMT3P1CcP86mHWKI9lUkF25iEYZTjqhe9JOm4DcIl84BkHL+l0pECi80wj3tpU+WxeBMRLdxxJCeCUm394ImsMCcECY9vOB5cGJoTNQnjfqiN3IILg/66RX6DyDLktzz5Km+19Di7WZlTJ4jgD3QKC/rp+QwjV4kcvA1ChoIKavF3ld9K/7EhL2jpV/C7rsqMEDOvZVYqXzz+EYs68z2DK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(396003)(366004)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(2616005)(6506007)(478600001)(26005)(450100002)(8936002)(2906002)(966005)(44832011)(83380400001)(5660300002)(66946007)(31696002)(66476007)(6486002)(66556008)(6636002)(316002)(8676002)(38100700002)(53546011)(110136005)(86362001)(6512007)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXVJRDVIQUdTRWppNHpFK0VMWWhHYUdIN21vR3lFVUFNU3ZZaCtOV0RFa0E0?=
 =?utf-8?B?YWxyS0VjTlcxRUI3aDR3bkhMOE4zSXNONEJ3NzVrS2dyMFUxTk1TMHMwaDZv?=
 =?utf-8?B?OXljV2dSSExGdWVBT3U0QkhWK2E2VVc3K3JOaG5kTzFnem4vUHcyUWJwSk13?=
 =?utf-8?B?OXhhaThYcWZaUGV6VmxGczhpNHFKVG9IcllXR0ltUFJZWmRJL040NDAvUjBY?=
 =?utf-8?B?aDBYYUl0K0wvU3pUM2pjdjRkVFh4c2JjWUl6VU5Ya1dTenNGUnhJMlFDNGtW?=
 =?utf-8?B?em5IWWFncmlMbkM0WG1qVTFmbVJNTjhIK3ZaZzFRd0lwL1Jhb0MvMzQ2Ui9N?=
 =?utf-8?B?L0s4emxPVjZyWUZWWklHbmxXK0FMT0Fjc1A4eDdOeDlqUGI5UzBhOWJYcXh5?=
 =?utf-8?B?ZjErVVVnTmJTMENpNHFLQ0Zmclo0cG1lYXFnWnRUL2lGNHRVZ1F2aWVkMGhQ?=
 =?utf-8?B?MVZTdzRvSmxSUitnbmVtOTQ3M2pCbERNTjE4Um1aMThYT216a0lacmhEbUM0?=
 =?utf-8?B?cGZkTFl4LzdtYjRsUmRwWG9RNVhVbW55Y29hTE1qTG5IREhlMUdwOU9UR3d3?=
 =?utf-8?B?VmtqcU9vT2RlRzd2WXZVd3BReHZlR0ZWc3BMQUl2R25ReGxaWDNXT1FtRjc0?=
 =?utf-8?B?Mm1pRitFREl4eXlaRm1OWEM0eXlEeFhjT0F1ZHRQTVlacE5TWjJWT2xtckY4?=
 =?utf-8?B?RlluL09vOGkwUEFSd3puSzhQZ2hLV0NoS2N3VHVYeW9Nc1VJUXFnRjNZOXNv?=
 =?utf-8?B?bVo2WUlrcWdjVkJlU0FXY2g5b3RsN21LOWpGaUpQLzNoUWNHMlRtSDFXRm5a?=
 =?utf-8?B?THlnamQ0dFUxUHpzWndsc0JMR3pnQUJVNVBWejZYeUp2Z0FEanZ4Y1VHakZM?=
 =?utf-8?B?VVJTMU40a2wwNzg5dlYrMFEwSzIxeVdCQjNTZDJHWXdsYlI1alhmMmJFd0J6?=
 =?utf-8?B?ZW9VaGJJbkpreHpyNkxja01mdUV1SGlPRXBPdWsyWFhOeHVrbFFpN0Fta0Er?=
 =?utf-8?B?SjYwblpmUXA5ajYxK3U0elNnSDQ2c3R4VjlxU29nc2o2WTkyYmNrcU9qV0hT?=
 =?utf-8?B?eE1XRnV5ZE1GcGE4TjVndjhBcVBkZytob0M1VWwvNC9pSGJiNGtuZGtpZmFn?=
 =?utf-8?B?NzNzMmwzSW1WZGtYWUJ1TmQvd2NYN3pzY01kbkMvQXl6L3BtQVMrK3NaN0Rl?=
 =?utf-8?B?ZVdYVERhV1BoQ2pkR010OEJXdU9KUTZSbndvNTI4S3ZZZ1dWeDJSKzJZOXlv?=
 =?utf-8?B?WjhVTlF1SFhMKzlYYldsVGNvRWJMUkhPTFZ4MWZpL3dSdVB2Y0JDR1dLdWcv?=
 =?utf-8?B?WGdHUkUwczBpYnNoS0dzd25SS0pTK3hTSXRnRTZuWWhGWVRId3VKeFhQdzlv?=
 =?utf-8?B?RGRyL05rNkFJMzVTT3VSNHF3bU82Z0pnVkJidHFJaGpqUkJDRkozNFdRZVZ5?=
 =?utf-8?B?aHAwV3BlbVV2Z1MrZERaQ0MxakRJU0NuWWdpeUFWNytvRHk2cEtkcWZSblpM?=
 =?utf-8?B?QVBhUVdqUm45Q0gzN2QzVno3YnFValRwMWNlOUNTVitPcDhIWVRYeGtoZWlF?=
 =?utf-8?B?dXU0UE8yL3YvVXRadGJRV2sxb0FQTTRYdXd5eTdzMGYvMlRaN1YrNTdEd2VP?=
 =?utf-8?B?bkFQOFlORldBU2MzazBMUUtrMU11YmN4TUpJais1NzlBY3Y1Y2pwbFk3b2JN?=
 =?utf-8?B?ZjNPMzlFbEd2RjBZMEJobHRiUHJwSlFyaUlaVTUraWNSTkpocE5sMU9CcVF6?=
 =?utf-8?B?eER6YmQyOGlGMGlJTkg2YVZPb09sWEMrdkhxRndwRStoMlNSTG85WXUyVm1Q?=
 =?utf-8?B?dG1DYVNzeUMvbEZoeld6dktlekF2eDJnOXg5NldlMDdFTjgzWjltY2xoZjNN?=
 =?utf-8?B?czBOYXNNdGowekNQR0hTR0gvWmlNZW5EQ1l4SjVGT2U4TEU0cHdpYURxMkk4?=
 =?utf-8?B?RWk2ODBGcmhjcEpDVVFXV01qWEdmL2ZiS29veEJjV2FKOFRXWVJXSVhBcFJj?=
 =?utf-8?B?QTZHZmxVZmx5d2R2ajJXS05uNjd5aDJsYW45ZXczR0xVYUpwQ1JqUW1jUTQv?=
 =?utf-8?B?cFZRLyszT3VydXZoTVhMdVZBUU5jNnBRRUFXR1kyZThPZGxmRDd6ZjcyVnFp?=
 =?utf-8?Q?oDD6t0lUBRjQRru6W1r4loCDx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c352cf3-12c6-4d96-efe4-08dc21acc986
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:01:58.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeLfI3msseUCGWA+tjWFAB567vVhPLBvpIcUUPwn0B4fUoTnPr1DGgook9RssoqF7bjmbcYSuo6iOiAbs4+3JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578

On 1/30/2024 09:43, Mario Limonciello wrote:
> +Tom
> 
> On 1/30/2024 08:12, Alex Deucher wrote:
>> Hi,
>>
>> Updated firmwares for RX7900 to fix reported issues in gitlab.
>>
>> The following changes since commit 
>> 0982b6be090d765416e8ff7fa311fb5b177b6692:
>>
>>    amdgpu: DMCUB updates for various AMDGPU ASICs (2024-01-29 11:32:52 
>> +0800)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-01-30
>>
>> for you to fetch changes up to c8c69cb95b876c12c2bcb74fdecc5cd7f587a882:
>>
>>    amdgpu: update SMU 13.0.0 firmware (2024-01-30 08:55:15 -0500)
>>
>> ----------------------------------------------------------------
>> amd-2024-01-30:
>>
>> Updated GC, PSP, SMU firmware for RX7900.
>>
>>  From internal git commit:
>> 3c4bdae3eab9efad8922cebd5b3c6583bb84751e
>>
>> ----------------------------------------------------------------
>> Alex Deucher (3):
>>        amdgpu: update GC 11.0.0 firmware
>>        amdgpu: update PSP 13.0.0 firmware
>>        amdgpu: update SMU 13.0.0 firmware
>>
>>   amdgpu/gc_11_0_0_imu.bin   | Bin 132352 -> 132352 bytes
>>   amdgpu/gc_11_0_0_me.bin    | Bin 298320 -> 379952 bytes
>>   amdgpu/gc_11_0_0_mec.bin   | Bin 407072 -> 407072 bytes
>>   amdgpu/gc_11_0_0_mes1.bin  | Bin 216832 -> 216032 bytes
>>   amdgpu/gc_11_0_0_mes_2.bin | Bin 244144 -> 242512 bytes
>>   amdgpu/gc_11_0_0_pfp.bin   | Bin 228096 -> 229152 bytes
>>   amdgpu/gc_11_0_0_rlc.bin   | Bin 185248 -> 185248 bytes
>>   amdgpu/psp_13_0_0_sos.bin  | Bin 268304 -> 268304 bytes
>>   amdgpu/psp_13_0_0_ta.bin   | Bin 247040 -> 242944 bytes
>>   amdgpu/smu_13_0_0.bin      | Bin 292452 -> 292452 bytes
>>   10 files changed, 0 insertions(+), 0 deletions(-)
> 
> This also happens to include amd-2024-01-29 which wasn't merged.
> 
> Tom had made a mistake when he sent it, but it also caused a regression 
> so he didn't fix his mistake and re-send.  To avoid pulling in the 
> broken commit I'll revert it and make a tag and MR for it.
> 

OK; merged with the extra tag and revert.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/136

