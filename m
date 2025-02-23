Return-Path: <SRS0=yGJz=VO=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41377C021B3
	for <linux-firmware@archiver.kernel.org>; Sun, 23 Feb 2025 17:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A566C4CEE4; Sun, 23 Feb 2025 17:26:09 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BE93C4CEDD
	for <linux-firmware@kernel.org>; Sun, 23 Feb 2025 17:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BE93C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwtJyz5D9TV7M8z7jmVB6Ka6+5mI4uOHC7EvZOsCnvtFxiRr43Tt7//tVBxoahQxf73oQQ39HCJKopFtxH+RqaugwbwyRu3V0TxDREraUI2E1yDZgHLgkPuGSeUtDbeReoTzT+D02HFGMVjnAgzR7ToSHYBuB9VBP+rGYTj0Xo1yOVgWEMlKtBnklrasA2viGUbnZ4cx6S60Gh/dGmoaHLtRvMsiJL01nUPzV4izYVlC9uYWROmUMBlHr/E2I+riyF8OGoAJUC/JxBgS3iEYGuAj5V4bxeBtGwQHFoT4Fgn4ADyQzxZmKqjGJbPstsqBe0uATgxowoCyhqE6KC+2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIbdRVnWHkMDE0LtY+4ecBb+1m/Mk6KmXQZ1nx8YWz8=;
 b=WvixbSDZ61YhMZ7cYL1JvF9A+utG7bttRo5PbTXIqFnih42oG2+g7axtIj4uQfLZHC6FztiU92lQMRId+B1NAHqsrWF0fIf8UKcoiffJkO1vikpqVp2928zPyhD0DelPURiY5EaOlT2uIVPtsVyZZYz/zMgVSLZbYfxqgv9kqYWNwCKYR5eE1JcBvQ194+hDluP+3XgzqhHcinjg+E3rcW1Gm8YCip9fiU2I8/JeJMgbpns3vsdyxih8siL6r5C6HMijbKrerIZL47Qx9A1rXmhIs5mIj0XktNtNGuaNkJVTZTcwrUH6lnQHstfx14TvsBb27VYgQE6iuxngyVrT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIbdRVnWHkMDE0LtY+4ecBb+1m/Mk6KmXQZ1nx8YWz8=;
 b=ZEP3qO5shYdVy1QhutYH6xX/2RUyd42A9btNAZFJdw43zyO/EdptRxK4ekZDs1Uqb1nyMpQJ19nei6dtkteH/HM9/VRm3eqZO2u8xSP5M5l/35NUXuKbaKZmMqurqWHyy6CHb4My0UQCk3NhPQiC94wWWItjeQJD9tN5IhrPoLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sun, 23 Feb
 2025 17:25:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 17:25:56 +0000
Message-ID: <eabde17b-b5e5-456f-a499-cff132f1bf8a@amd.com>
Date: Sun, 23 Feb 2025 11:25:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION amdgpu 20241108 firmware breaks screen updating
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, mail@tteles.dev
References: <OJnZDtd----9@tteles.dev>
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
Cc: Alexander Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Xinhui Pan
 <xinhui.pan@amd.com>, Airlied <airlied@gmail.com>, Simona <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>, Tzimmermann <tzimmermann@suse.de>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Ahmad Rehman <ahmad.rehman@amd.com>, Shaoyun Liu <shaoyun.liu@amd.com>,
 Ramesh Errabolu <ramesh.errabolu@amd.com>, Jun Ma2 <jun.ma2@amd.com>,
 Amd Gfx <amd-gfx@lists.freedesktop>, Dri Devel
 <dri-devel@lists.freedesktop>, Daniel <daniel@makrotopia.org>,
 Linux Firmware <linux-firmware@kernel.org>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <OJnZDtd----9@tteles.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0056.namprd05.prod.outlook.com
 (2603:10b6:803:41::33) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e6064b-29ff-4aaa-7ebc-08dd542f21f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnpqaWtkTnJUaFRRTUVnWHZrTE1NQmtIR1JCRWRBVjJEYUNYbE1ycjVZL1pq?=
 =?utf-8?B?cjlZeW1FSnhYblFJa1pLY0NLcVNSR1dSVW0yUlFvZU9LNUhoWHJ3NW03QUt0?=
 =?utf-8?B?MGFCeURSaW1KSURRdVRGejNaVlhkYzdCbUhsZ0ZvRTVWblBadFg2dGw0bUxJ?=
 =?utf-8?B?Zm1UZHBtNEZ1bDdVdlZ1dkQvcFJvZ3RNV2p0TEJxUWVCbXhPdDdLemxXaE9a?=
 =?utf-8?B?U0x3Nkx3bHl2eWwwb0dsNjVwZXp4SFUwOE0xSW1weHV4Wk1UbFNpK0NwUmta?=
 =?utf-8?B?RjV2QTQxd3lGVjN3NjE2L052Zk8yVzdqaFQxTnRZSjdmazkxRzF2UHBvdjNC?=
 =?utf-8?B?YVNZeGl2TU5vR2ZOVlZ0T0FONUJwT05nd1MzZWVqS1ZwVFoxZzhDbERnNTRU?=
 =?utf-8?B?S001S3lNd1V5R1kyVHVYSFhFSUdNemZBN2ZWUjFiRnlCeFJZOWpWOFhGa0ww?=
 =?utf-8?B?UFZ0SFRGMUF6WTlvQnlyM0duTXdGZlZ1MGV6bWF2bWdOcCtOMG4zNjIxWVps?=
 =?utf-8?B?UTNjdnRFU3ZDMXBhQ2dwbllCd3ZLeVdySHhoYVN6bHU5SEk5OStUMXNCMThE?=
 =?utf-8?B?am9xb3ZaL0F3eUpUVjd6cTZDbTVYN2ZsK0hxeDBuQUlYWkRsWHBrVHNQRHN1?=
 =?utf-8?B?bWRlcitkLzdPS3dZVGliY2RjZkxWWFovSXZMZGhERG5FcUZVa1hjKzFST3Rr?=
 =?utf-8?B?RHBpbDUrRFR4MWhjM25uK2pKWmYxYkdlYUdmMkJBcVdyTHRkaUV2aDY0bVR0?=
 =?utf-8?B?azF1ZTV4K2J1OGNkSXowdkphWjBGb1QwTTRvYkpITWswRUQ3Wm9OZzFhNlEw?=
 =?utf-8?B?aytUSFpTaWJnRU52SExqWDlyZU1QSXUrWlQzSy9Ddnc4SUVPTEh5SnFWSVJr?=
 =?utf-8?B?aXd6QStsc2E3enB5bUFUdzFRRUR0VnNUcUtTV3prNlJsQ0tqOXBicVNmL1Jt?=
 =?utf-8?B?OVB4OFZoUkM4TEE4ejlYelJKWkJRSUN5S3RQZjEwb3pIdUl4V0hORkJJOGdI?=
 =?utf-8?B?Ni8rSXA2dyt4Y3dZRlhkUWhETGVMQjN2d3JiejJJajJ3OUZUemo3RENVdGQ3?=
 =?utf-8?B?S0VMdi92cnYzU1pBY3lrbVR3UVFTbStGSnhNSUVXNndjZmhYQ1d1WEp6RFdm?=
 =?utf-8?B?VlM1Mk9Oa0ZFS0lNelZZK0lQSHpXUHN3S0tyL3I4L3VOc2NTTDJ0M0F5Sk9E?=
 =?utf-8?B?UmJpbDlpNWtmWUJFMnAwVFdvR0tXUHFkTFRJSUN0R01XVnJZaFhrVUg4Wnpv?=
 =?utf-8?B?MXBrTE8xNUYrSTA5UCszVnI1OUoyejhONTRwWE1ScXJuZ2lyWkU0c2hjMWlF?=
 =?utf-8?B?MXNpVVVIUHYyWnlodDVVTkkvQmdkalp1UDd4NVBuanpHaW5YaHZBcXFBTCtj?=
 =?utf-8?B?dFBBUkxWbkhXaWFNWVZ5eDdEUzVoM1dNS3lUNDhHNVE2RkYvVUppb3pKLzB4?=
 =?utf-8?B?cG8vT0NqcXpGbU15SHRBR1NuZytSTi9DN0YzbUpHMzgyLzlzTDA5SXVVS1Yv?=
 =?utf-8?B?M2JsWExEejIxZ2hWV251UEZWWVM3dWhnYy9XTWxTMGo5YW9JZGRqK3ZRRlJ3?=
 =?utf-8?B?cXdpSDAyOEIyZjVJbys1UHhHNXdNbnpleGROZ1lHcnBNYWtsYVFLS2kzRXpJ?=
 =?utf-8?B?R1NJbkdnbzM3bFMzOFkrWVhJcW80aXdVZFFRTENTVVo2RWRzUGpHdUJ0Z3pJ?=
 =?utf-8?B?VlFvZS9BTUJsaUE4Yk9QMXdaUWluTDI2VVR5d3V0bm4vSDZhMmRzU21Fcmdn?=
 =?utf-8?B?czl2VGNxRU45NjM0V1hzVkora3FrYzlDZU4xcDVHbUw3cHRYTnhFejIvdDJH?=
 =?utf-8?B?R0pnS2ZWNGlNbThMdGtXUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1NNbVJQREhvditNQWpJbWlQcmVtWkE3RzNmTjJqSE5QODBRMG1HVmY5cGtL?=
 =?utf-8?B?eVVQRTBPK0xjT1pUejQrTTg2dGhOZ3AycVlIVXJFdkhKdVg1Tlc5S055VUZl?=
 =?utf-8?B?MUh1K1R6dXJHUUdHQlBMNTRTS0c0cWJ0Q05tKzZyMUtZYlpGcmhIamwydnd1?=
 =?utf-8?B?SFhxS3dkVk5vbmNxaHlXa1V5QmowcEZBYmhMMU9WYUpadHFPSkVla0dpc1Br?=
 =?utf-8?B?N1dKMG9xZ1Q0Zkk4SnVINkxSRFNsaXZsN2h4SVlzNFN3SmErbUMrMU5HakZz?=
 =?utf-8?B?aXloend5RVlXem14ZW5XRnpjK09oUnMyS3lHZDdLRDd6T0pPK2xON2ZlR0Iv?=
 =?utf-8?B?Z2tpemsxNWNTc29MTFJ3WjludDd2SG5EWHAycnVScmNzTEZ1eHpjYUZydTBR?=
 =?utf-8?B?aWFKUTZzbFBpRFZOSGxXVUdtTHRzNnNtSmNQQW1Sa2N1ZDhLa3E1cjRDRkhR?=
 =?utf-8?B?dXJCL0NibS9zQXdhUzZBaVJITmFNRkkxU3JoK3l3Vm5rMXlRZHVFM1g5MkZm?=
 =?utf-8?B?QVBOVHdLb2cyL2szNjd6VU9RSTZaRWNRMXdZYW1kQlRVMXVENStWdm9sV3Jk?=
 =?utf-8?B?SzZoaTZWeTVKRGU3QzZpWkQvajU0RU5NM1EvODJjVXl4djlqalluemFVMTRB?=
 =?utf-8?B?aWNGRFExbXlDVCs0bjBTbWRhTlN2YlJoblNKL3lTT0dVUCsvNzZvaEplTG1P?=
 =?utf-8?B?enlYRVpLelNkZy9oNTg5S1U0cmZaS25pNnYrdWJTbVZBUGlMSUU4QlRpcmg1?=
 =?utf-8?B?NHFNZUVrSUNGaGxVTjZLa3loSm1ITHd5N1hDcU5nZW52cGorSXZXNy9jeXla?=
 =?utf-8?B?bkhaUE4rS0V0RlVET0k3d1FNV1pnQ0tyMTB0NG9LdDhZYmZINHg2WGdkUUZz?=
 =?utf-8?B?cTFEc1JLUUNLMzkxQUR3b0g1Sm8xdVBUMlljNXV1ZFdUM1FGSWxTYVM2VWlX?=
 =?utf-8?B?eGUxWG1KcHR1VXE2dlV2RnVPSDVzMEZnSzFkbFZxN2NOQ3ZSck9HOHduczc1?=
 =?utf-8?B?a0g3ZmtqMnJyMFM2UFc1TXVxeFJVSWFjRnFyZ09SSjhGR0NneXpPYlB0V2lP?=
 =?utf-8?B?M3cycGx1R3ovUEVDcjZmNklkOGVoSm1QaTVEcGlkQnBBZjU3dGlmZ016bVg3?=
 =?utf-8?B?ZDNscGUwZlBXdnd1TVpwdlllOHM1Z0RHdUdRdjBNZjRWYjM5WnpFL05FOWU0?=
 =?utf-8?B?ZWNnMDhJbFowSjA2SjZOKzFLbU1USGhaQ0lvMW81MU0wWTUvelRpMGJZTUZw?=
 =?utf-8?B?TFN5dDlvWGVxSkZUTnRrbnNhQVIzL0tnTGZ0dmJtdmdzdDg2cFJnOCtiL2o5?=
 =?utf-8?B?N0RIa1orbzVSNjl2Zkp3U1ZPZElLQXJWbzJuajNhZGpqL0hoZGw2WWZpNDU2?=
 =?utf-8?B?OWdaTDN2NmpJSXhhSDk5OUxGS3hJaVhsc3k0NzZESTNLYzZEbWVqWjdzSHh4?=
 =?utf-8?B?dnVRNlRYcjBQQ2x3ZFQ1YTBIbnY0SGkxZlhyOTVOOTdpQ25VZk1zR0NCcHJ6?=
 =?utf-8?B?THNYWEd0OUI2THdTTWIrZ3VqS3ZRWExOTnZWbzhDd3lOZlllakNNMGlabUlW?=
 =?utf-8?B?cHVkdk1DUGVOTnBFNGpqY1JqUUdCOGN5REJUcHFrQzlPVVllR2hTZC9FTlFj?=
 =?utf-8?B?S20xMW56dWMydGEyb2Y2RUVRR000YWVhMU1DQVB0SGdGQW9LWktscndFTGVB?=
 =?utf-8?B?eW1WOUwxUDRSVTFZU1BuRFBSN2VhTkJJaCs0QWlPVWJ5UW5rVHo2SWpMTDhK?=
 =?utf-8?B?QUZZQmxTblM2L3c0clcvWkhLTU10cXg3a3JvdWtKV0JuV2JWVXJ0a2hUNWdp?=
 =?utf-8?B?b1FSZnprOUI2RERzWm1xdHpOZi91MXlIaEYzMXM3YU5rK0tET1Q0YXR1S0Zz?=
 =?utf-8?B?RmFyZU9qQ25xQkhQL2w5TTZiZEVHVGdxMG1uVzZkZ0xDSjB3R095VmlsTVFm?=
 =?utf-8?B?TUhEMHZhMVpXM2xNZmJTMnJNSkd2VXR5L1JYY0svVmFNR2VIVmhPeFplb0dI?=
 =?utf-8?B?QzJ0bWlPNVk5M202QWY0eGluK280NkVZSEpWYlRUQUszbXFWK0tkWC9KYmV1?=
 =?utf-8?B?dGtmY0RCc2tZeVY5c2lMMVpxK1hvTHVhVzM4aVp2WnNWcHJGVkhOcnVlV3FC?=
 =?utf-8?Q?npQNOXqCAsUiXVh95V7yWs+IW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e6064b-29ff-4aaa-7ebc-08dd542f21f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2025 17:25:56.8433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHXTDzZREbKzsd9nEc3k8dAznst3YPoqqNYfFhzrq87/SNrRgJxt6FHb58lK99jotWAnDgjrdnyaKBcdKju9bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023

Hello,

This sounds like to me a problem with PSR-SU.  There have been a variety 
of these being reported the past few months.  Enough so that the policy 
to enable it by default is being rolled back for now.

https://lore.kernel.org/amd-gfx/20250221160145.1730752-3-zaeem.mohamed@amd.com/T/#u

To confirm that's the root cause you can disable it with 
amdgpu.dcdebugmask=0x200.

Thanks,

On 2/23/2025 10:08, mail@tteles.dev wrote:
> Greetings,
> 
> I wish to report a regression in amdgpu firmware introduced in commit c99eeb4d0e13f5831ae77f7ec521162594385d5f, the problem persists until git HEAD, and reverting to the previous commit fixes the issues with no further changes to the environment.
> 
> The issue appears on a Lenovo IdeaPad Pro 5, with a Ryzen 8845HS processor, using the 780M iGPU (1002:1900 I believe). The screen on this laptop is 120Hz 2800x1800, supporting HDR.
> This was tested on Archlinux 6.13.3.arch1-1, with amdgpu drivers, on both Wayland (Gnome and Hyprland) and Xorg (i3wm). I'm using amd-pstate-epp scaling driver, tested with both performance and powersave governers, to the same effect.
> 
> I will list the symptoms and attempt to guess at what the issue may be.
> 
> - The screen stops updating if no mouse input is given while watching low resolution video (wherever it is, Brave and mpv, regardless of software or hw decoding).
>    Low resolution matters here, I can play 4k video fine, 1080p with mild stutters, but lower becomes very bad.
>    Here is an example using mpv with 360p sample video, recorded on my phone as to not disturb the environment its running in. (https://youtu.be/kYHqBjPxM2s You can tell it is very choppy, the original video https://www.youtube.com/watch?v=1HrXwe6s4W8 is not choppy)
>    mpv did not report any dropped frames despite there obviously being a huge amount.
> 
> - In some programs, text does not get displayed instantly from when typing it, having to type 5 or 6 characters for the previous to finally show.
>    All these new characters show up at the same time. This was extremely noticeable with gnome's default "Console", it also happened in Brave Browser's search bar, and Signal, it does not seem to happen with Ghostty.
> 
> Constantly waving my cursor fixes all these issues. Connecting a secondary display seems to fix the issue on all displays.
> 
>  From my limited knowledge this seems like a bug in damage detection for eDP + power management, where low enough power levels don't trigger redraws.
> 
> I am confident the issue was introduced in that commit since I bisected linux-firmware commits affecting amdgpu until the issue was no longer found.
> 
> 
> Extra info:
> # dmesg | grep amd
> [    0.414396] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
> [    1.875492] [drm] amdgpu kernel modesetting enabled.
> [    1.878563] amdgpu: Virtual CRAT table created for CPU
> [    1.878573] amdgpu: Topology: Add CPU node
> [    1.882607] amdgpu 0000:63:00.0: amdgpu: Fetched VBIOS from VFCT
> [    1.882610] amdgpu: ATOM BIOS: 113-PHXGENERIC-001
> [    1.909536] amdgpu 0000:63:00.0: vgaarb: deactivate vga console
> [    1.909542] amdgpu 0000:63:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
> [    1.909612] amdgpu 0000:63:00.0: amdgpu: VRAM: 4096M 0x0000008000000000 - 0x00000080FFFFFFFF (4096M used)
> [    1.909614] amdgpu 0000:63:00.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
> [    1.909829] [drm] amdgpu: 4096M of VRAM memory ready
> [    1.909832] [drm] amdgpu: 13932M of GTT memory ready.
> [    1.935030] amdgpu 0000:63:00.0: amdgpu: reserve 0x4000000 from 0x80f8000000 for PSP TMR
> [    2.482626] amdgpu 0000:63:00.0: amdgpu: RAS: optional ras ta ucode is not available
> [    2.491068] amdgpu 0000:63:00.0: amdgpu: RAP: optional rap ta ucode is not available
> [    2.491071] amdgpu 0000:63:00.0: amdgpu: SECUREDISPLAY: securedisplay ta ucode is not available
> [    2.521960] amdgpu 0000:63:00.0: amdgpu: SMU is initialized successfully!
> [    2.601611] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
> [    2.601628] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
> [    2.602048] amdgpu: Virtual CRAT table created for GPU
> [    2.602191] amdgpu: Topology: Add dGPU node [0x1900:0x1002]
> [    2.602193] kfd kfd: amdgpu: added device 1002:1900
> [    2.602206] amdgpu 0000:63:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 6, active_cu_number 12
> [    2.602212] amdgpu 0000:63:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
> [    2.602215] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
> [    2.602216] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
> [    2.602217] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
> [    2.602219] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
> [    2.602220] amdgpu 0000:63:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
> [    2.602221] amdgpu 0000:63:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
> [    2.602222] amdgpu 0000:63:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
> [    2.602223] amdgpu 0000:63:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
> [    2.602224] amdgpu 0000:63:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
> [    2.602225] amdgpu 0000:63:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
> [    2.602226] amdgpu 0000:63:00.0: amdgpu: ring jpeg_dec uses VM inv eng 1 on hub 8
> [    2.602227] amdgpu 0000:63:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
> [    2.609481] amdgpu 0000:63:00.0: amdgpu: Runtime PM not available
> [    2.610787] [drm] Initialized amdgpu 3.60.0 for 0000:63:00.0 on minor 1
> [    2.617618] fbcon: amdgpudrmfb (fb0) is primary device
> [    3.788332] amdgpu 0000:63:00.0: [drm] fb0: amdgpudrmfb frame buffer device
> [    5.120419] kvm_amd: TSC scaling supported
> [    5.120426] kvm_amd: Nested Virtualization enabled
> [    5.120428] kvm_amd: Nested Paging enabled
> [    5.120430] kvm_amd: LBR virtualization supported
> [    5.120443] kvm_amd: Virtual GIF supported
> [    5.120444] kvm_amd: Virtual NMI enabled
> [    5.170720] snd_hda_intel 0000:63:00.1: bound 0000:63:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> [    5.191443] amd_atl: AMD Address Translation Library initialized
> 
> 
> Thank you for your time,
> Tiago Teles
> 

