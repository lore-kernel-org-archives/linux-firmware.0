Return-Path: <SRS0=8CD2=S4=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DD4E74AC3
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Dec 2024 16:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ED18CC4CED6; Tue,  3 Dec 2024 16:46:16 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 733E0C4CECF
	for <linux-firmware@kernel.org>; Tue,  3 Dec 2024 16:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 733E0C4CECF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpqHoMLCVT6TrRWTUikmuiizdh66Bn6Egmq+VWJcIspAdmkMZj7tWNsiLojIzq2eGvjGhsGDOs4UUmWCuDeiORnG9jAhGiEcMAru/2AsmoSU0klMKc7yObmMG+ZMKAtFfgs9Uy0BD1O9/iVZrQag8l22GbzLpCUADPhZw7mTB371+v+X93wFEL48K7iEI14d9FboHm3ICMSD/MY24AOVi2NnoGCNCNfqsNPS6W82J+wyp5mSwgCg3MvMlRUIcEiyedFHeX3yt2yW0S92e28TPyqyH3lDTOSIZADzGYKFK6qgPKVeB7XUMSQxEljQxoE/9bnAlBn/VPw3AEEvatlF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgsf8o6KXxBjWjbdiok1zpj4UezIM+NZGGUFHvm2Syw=;
 b=FTk4+JQKHkDuLt1asytDNnQXvVxFnONNOMr4fwM/vbWeSUq6aB+xV0z0SHuFSrfLB+S5V+xXUHJCajSU7qpXHc4SfRJcuWp8eX31cezK0O/dvGS+uUZMFkg41xyUfNMcKJTnz8JPb2Bsq3Kyj8s1voTYJtPa2GjOEGFTgcBprySjyU8hXEC7/FtXZyALlUcjC+B1hip3jDEuOYM67WQ7DsTDUh2ixEXGwPGgHT1IW4hwXJ1nxTrPvL6gL+taHxo0YtH1VqH3nKeVImYVf5Jt83j+ZQ/Ei/uFU5B/jN6xPOfjGqP7uPw5aZZv4xkSwZZWZJlGiQBSTuTUuSTD0Xj83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgsf8o6KXxBjWjbdiok1zpj4UezIM+NZGGUFHvm2Syw=;
 b=xGz4IQAr3QPsO4LwfqJUaIQ1cX2mxeRD144HxH98b6kYm5g3mx1DbOHBNfHxWCh7IX+NVCFnjIvs9ADnsHwbuic6BPwbXgkN/WOdOjEx8OqU/e6MBHqGVwdT2Dt+oXcrrf7N3mYZrU2HhgfLlMh1F/tvodHbpXDiHmxKdlqtEt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Tue, 3 Dec
 2024 16:46:12 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:46:12 +0000
Message-ID: <530659ad-6f20-46dd-8513-039ae895476e@amd.com>
Date: Tue, 3 Dec 2024 10:46:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu amd-2024-12-03
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20241203152430.2391129-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241203152430.2391129-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0105.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::13) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c219cec-2062-48cd-b1da-08dd13b9fea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUZmOWNIVCs1YlJtZGVJOVZLTEtrTEx4QWF2THZ5WjgyUWZESyswaXAwcXZN?=
 =?utf-8?B?YTdJTFpZRklFTWdCbnpNTDVjdXJ2QTdueHN5Y05IRjdBd0ZtL01NRkFnalNx?=
 =?utf-8?B?b3pod0NpZU5NMFNiSkJyYVR0bUFRVHJQbCtVdGRZSUowNVRHQ1J1bU5FaWYv?=
 =?utf-8?B?dld1VUNWVEt0RjZ4RG9yWmNjS1RYV291dUhodUo4a2FlRGdNc1lLWjRyL01T?=
 =?utf-8?B?R2twZzFmTllrTjRMWnBwZEVpYlUxZytUckRtYms2Yloza1Y4SHRLOTVablZ1?=
 =?utf-8?B?bDczR00xaHUrU1BrN3lUMFhlanJzZVczNk1lRWFEeU5WMGR0elJYc1VrTGdD?=
 =?utf-8?B?WDNJbzBKdTlGak0zNmhXQVBJb0IxNEdwTGlVenBhZzJqcDVpbGZTdkhUUUpm?=
 =?utf-8?B?bzE0VXk5Yk5mUHhKQVhyYzJ4bzNMNUtiRVFkYi8yakZPN1F3ek9zNDRjY3Fk?=
 =?utf-8?B?RFRZQVQ2emlSVlNiY2loa0RBV3h6c3VXMkN5N0VPbWtiK1Zleno1Mkkyb2RG?=
 =?utf-8?B?bXNWendrQURxU0Nhd2FGVjBUTG0wbTVWdDVwOENCOHpJVXhTUW5GZno1SFBM?=
 =?utf-8?B?a05MUS9PUlpKb1pWUzBkZTNIZGxodlBYcVQ4TDlUbzBnd1ZIYkxtenZSSTh3?=
 =?utf-8?B?Vmp2WVN6V2RUWTVTcnhnVTJjUkNSVXRzL0EvdlN2VjlZOEVEcXk3NnRQekZp?=
 =?utf-8?B?dWg2aWFxbXc3MkJEak1mMzBVVEdQVzdMeVMzVVJhQTZYRkRCZ3JFVkJIeWxu?=
 =?utf-8?B?ZitLKzMrR1pCWG43ZWJFcnl1K2s1dFlIdlV1dVIzWmJlcjd4c2hxUkRReGcx?=
 =?utf-8?B?Rk5adkxTQVRGSm83Q2t6SUNpSUl1OE9PVUtyOG1XSnVrNWFOS3NSRzJZNGxh?=
 =?utf-8?B?RXhzVmFYZExxai8rcHV4SnNYb3FZMmhZbE1QS2g1aERYT0JUN0FnKys3Ymtq?=
 =?utf-8?B?Qmd3R1pzN3VSdVVzaHpZSytVMDJNMEZHS1V0KzFXOHdGN0RPRXJDYmZtUXZu?=
 =?utf-8?B?R0xCaHlodUd6dmJEUVdKb25KVE1wR1lSUVpKbDUwL09GUGNCZTFvOU9JbSs1?=
 =?utf-8?B?N0NENHB4SE40R2s1TmIyUS9YWlN4ckxLQlZ2NXByZVMrc1FFcmt4WWxBVU91?=
 =?utf-8?B?czFGS1haOTVIb0x4bUV5Q09lSzg1ZnJFR0IzU2Exa2toNFNCZWZYblBCRm4r?=
 =?utf-8?B?N2E4WTFZWWoyQXN4YlFnRVZoYm0wSFI5cmF1RjdsNjR5VDB4bjBZak53QzlW?=
 =?utf-8?B?NUgvdHBNZmtRaXZKVWlxNmNVZG5wdEExNEU1Tk1BbCt5QUdhTklzZGNFMTkx?=
 =?utf-8?B?QjQ0VUhYR3owcDEzblBpOFRhRkhPNGdDWDFIUncvS1l6dVRtYjZBS3VDQkpZ?=
 =?utf-8?B?UzZ4dFNJc0pVV2ZhTXo0Ym1DeDBsY1oyK05hL0MwOEVpbGdGVHM5RnNHNjJH?=
 =?utf-8?B?dU91T3BYby94WDhoTzMxc0lwQjRGbmVOditJdFppQnFsek4xZk5TQ25lS3pS?=
 =?utf-8?B?WGIyOVZTZFpETTJ1dWV4WWZxeWxaTzRmREpkbHVwK0hwTVowUURkajVuVXZu?=
 =?utf-8?B?eXQ1Nnd5Zk5tWTJmMnMza2FoMlJwYlhXdXN3VmtqYVZXQlM5cDUzMno5T1Nt?=
 =?utf-8?B?dWNoSEg2YkFMNXNHSUUzaFl0ZGpCdTVrd3hXWEM3N2JZVkJhRW1aRkZodTds?=
 =?utf-8?B?cGRqVnpkZ1lib25WbzBMV0t0Z0g5MzBzRjh1b3JBVnRGWHpBa1VnQk0xaVdU?=
 =?utf-8?B?NTM0WFBxbUJ4Q3J3Z0xvTk5kMFBySHFmdzZEQSt0YWRBZklLc0ViWFJOZmVJ?=
 =?utf-8?Q?qiIsP+IF7AfJt6o7P49zxEJP9VYepHtK9xi7U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE1RVTlsdGN5YVlOL05EYXBoZDMzNk42ejFLUUErMEFwSWMxV0ZuWStQOVht?=
 =?utf-8?B?SHJtVlU0YVdtNkVramM2aVVMeGNQWnJQV0RERjZ5QXZ4NEpVM3IwRXRaRGRw?=
 =?utf-8?B?ZkVCUndNZkErRHV1aHhCY1oxZXFLZS82L09NQ0pyTjhuckVFRlJLR3k0cGdP?=
 =?utf-8?B?b2lDemVIU2FHZnQxNlpTTG10Z1Z3MzhuRnBnY3R5MGlvUjNPYS9LVmRrY3BX?=
 =?utf-8?B?Y1NQNzY0bzIxaHBaK2IvY0tyTTh4aGR0cEM2TnZYd0JDQytnK3RTNWt6OG9y?=
 =?utf-8?B?dU5HbTNBV1IvQ01paUc2WXd1OXd4ZnF3YXcrTnlmUGR3ak11bXVRa2tmbmpt?=
 =?utf-8?B?Y0VmT1htQk03QTFPSUNYMzFna0RraGJGL1QzNHFGMzBlZjFTNm9LMHNrRFFY?=
 =?utf-8?B?ejlzUVBRU1N4MGhaTzR0WXd6cmM4MU9XRzduaFdudklxSE8rSnRMLzFwL3Ba?=
 =?utf-8?B?THhPTzNYcVozTUIvbDJqaDRQR3FyRWZKdFFlcndYd3g2SWZsVUZPOGJwaTVI?=
 =?utf-8?B?WUtsZXlldGJBQjhZQmZLQzVldE92TDI3SXVqbWhjZkhOaWs2a0NIc21RWk5J?=
 =?utf-8?B?MVhTS05FcDVFelZkMXdpZGIxOHNpQnIxVTVlSENVNjZ4aWxuVkZjeCtURmdF?=
 =?utf-8?B?L0tlNStUOWQyR0RhTk5CbHhLekRod2d0bHFXZnpwY1dLNGlNTExpZFNsV2ow?=
 =?utf-8?B?b3VYSzRHMXlQeTNheG05cWVtcHFObFVYSmVDaHlMT1lDUjFGSmRHTFU5cXMy?=
 =?utf-8?B?Ykk4UXE4V1JMeUpNOFFWeGpGcmphUml4WDRWa1RSS1ZaVXNtdS9Xem56YXNu?=
 =?utf-8?B?RnI1OVNKS1pwcGhpZVNnYmdxUXpvZTRXN2RsT1JIL3FONnhWWC9PR1dBQWU2?=
 =?utf-8?B?T2lpUFUvaEx5OHY4UVVGM0Q3dHhjZVlEcEdxanZwWUxDZHgrK0VUemJXZ01G?=
 =?utf-8?B?NGdlc0c0UnBDSXV2cWkrMHhaYnZBV0FmZ3JPNDlkL2hSdlA3S1NGZFhaYXY1?=
 =?utf-8?B?Sm9Bb0RGTXliQWNlQ2hjQlc0eEdqRDVqOU1LZ09Uc2VKMXNDbFlkT2hxQjIw?=
 =?utf-8?B?NDlTcGU3SFBVNER5SnlEVVNuZHZRRHZtQVZXWExucnFGcjdRMWp4bTdLUXk5?=
 =?utf-8?B?anVJWEdQQWtwdjU0ZENHVG5hemZCci9zaytiY2lNV25LOTg4MkJyYjFIN3Qz?=
 =?utf-8?B?RFp5MkF1OVBKZncrS1lPRTIyV001YWJra0lYelZzWmt2c1BERDFtN0huV0w3?=
 =?utf-8?B?MmdWRWQ4ejRqQWM2K3ByM3RRVDd3N2UzSkp5ZGxRNytpSEdQY0xYV2Rka2Jr?=
 =?utf-8?B?bmgyOFVNZ3lFZzh6YXp4Y2ZRUnZyZ1liREZVY01PSDF6Wld1RUgwSERxMmpW?=
 =?utf-8?B?S2t6cmZCK3NMZXZiSytiM0dJd28wRithM1dMUmVCSDJqWmVkelNKd0pXUk40?=
 =?utf-8?B?eDNRZkpaWW9NcFp4VFVyOExFWEhFeWJpdTU0cHpjZnY1VjFmZkdnVjVXc0dS?=
 =?utf-8?B?QXg5b0ZScEtXWlBlejgrcVlwUmhkSEw5cDNhZms4QWZ1WjMzZTFQYzRDbFJM?=
 =?utf-8?B?YW1IZGZVaTFZV1VxVDZPMzhmdFE3VDdqQXB5VmR3eitGay9TL0dGd0QxMFJr?=
 =?utf-8?B?Ymd0VWR2NXRtMUF1MlhjWmpWMExZL3hmU3lXQlBQQlJGTWtXSzhVbkViY1N5?=
 =?utf-8?B?Nmg4NVNSbUN6RTVnczFieGxFRHA5bXpMUE12UUE3dU0vZmdHbzd2WjVGb1lL?=
 =?utf-8?B?Z0ZWWFNkamVNYnc1T0NuRUE5bXp1RnAybUw2cmNZTDVLMWNjQ28zTGNFVFZv?=
 =?utf-8?B?a2JORnYzTjJRSG42b1dTREZnN2dVbW5GY3N0NkFoN3ZGS2wycUx0TzBISEQz?=
 =?utf-8?B?b2g3YjZaMXBiVGpvdkdDdEorekdIU1BFTm5lclpMbHdwaUhGTElDZWgzV0p4?=
 =?utf-8?B?ek5aTW1PYlNVK3ZnWGttNER5UG5QbFBvODNSaUdYK1FEdlZkUGFoT1lLRjE3?=
 =?utf-8?B?anBWb3R5Z3MrbGxWNVVLM0JDVE5TcW43RzBqVEREcW5hc0dacEZHV1JQcmJm?=
 =?utf-8?B?L0d5cFpRb3NYK2toV0dOVFhocERKbVN5YkZrblp2aTVWY3VBMGVKTHZzUDl2?=
 =?utf-8?Q?6H4kPUXgpF3yEjNOeF6KQep9E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c219cec-2062-48cd-b1da-08dd13b9fea2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:46:11.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldHQh4UalarjFLeoQ21b7V8//HlWCQ2CKl4uCSVNloGNSq9l9rx+KgKMJDefg1W1isR4Z2PMX4MEo+UNgitlRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171

Pulled, thanks!

On 12/3/2024 09:24, Alex Deucher wrote:
> Updated amdgpu firmware.
> 
> The following changes since commit dc44789e901d30a70b9d9ff7bcc8a38fbc201e52:
> 
>    amdgpu: update smu 13.0.10 firmware (2024-11-26 10:11:36 -0500)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2024-12-03
> 
> for you to fetch changes up to 9c1252813011ac54d1cde67464625488476fa36e:
> 
>    amdgpu: update raven firmware (2024-12-03 10:18:48 -0500)
> 
> ----------------------------------------------------------------
> amdgpu: update GPU firmware
> 
> from internal git commit:
> 1057d7713554894b50e2d00f550c4b7e9eeda84e
> 
> ----------------------------------------------------------------
> Alex Deucher (41):
>        amdgpu: update aldebaran firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update gc 11.0.2 firmware
>        amdgpu: update vcn 4.0.4 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update psp 13.0.6 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: add gc 12.0.0 firmware
>        amdgpu: add psp 14.0.2 firmware
>        amdgpu: add sdma 7.0.0 firmware
>        amdgpu: add smu 14.0.2 firmware
>        amdgpu: update renoir firmware
>        amdgpu: update navi14 firmware
>        amdgpu: add gc 12.0.1 firmware
>        amdgpu: add psp 14.0.3 firmware
>        amdgpu: add sdma 7.0.1 firmware
>        amdgpu: add smu 14.0.3 firmware
>        amdgpu: add vcn 5.0.0 firmware
>        amdgpu: update psp 14.0.0 firmware
>        amdgpu: update vcn 4.0.5 firmware
>        amdgpu: update gc 11.5.1 firmware
>        amdgpu: update vcn 4.0.6 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update gc 11.0.1 firmware
>        amdgpu: update vcn 4.0.2 firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update gc 11.0.4 firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update picasso firmware
>        amdgpu: update gc 11.0.0 firmware
>        amdgpu: update vcn 4.0.0 firmware
>        amdgpu: update gc 11.5.2 firmware
>        amdgpu: update psp 14.0.4 firmware
>        amdgpu: update vpe 6.1.3 firmware
>        amdgpu: update vcn 3.1.2 firmware
>        amdgpu: update psp 13.0.14 firmware
>        amdgpu: update gc 11.0.3 firmware
>        amdgpu: update raven firmware
> 
>   WHENCE                          |  27 +++++++++++++++++++++++++++
>   amdgpu/aldebaran_mec.bin        | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_mec2.bin       | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_sjt_mec.bin    | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_sjt_mec2.bin   | Bin 268736 -> 268736 bytes
>   amdgpu/beige_goby_vcn.bin       | Bin 579312 -> 579184 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin | Bin 579312 -> 579184 bytes
>   amdgpu/gc_11_0_0_mes1.bin       | Bin 217408 -> 217408 bytes
>   amdgpu/gc_11_0_0_mes_2.bin      | Bin 256208 -> 256528 bytes
>   amdgpu/gc_11_0_1_mes_2.bin      | Bin 254912 -> 256064 bytes
>   amdgpu/gc_11_0_1_rlc.bin        | Bin 157040 -> 157040 bytes
>   amdgpu/gc_11_0_2_mes1.bin       | Bin 217760 -> 217760 bytes
>   amdgpu/gc_11_0_2_mes_2.bin      | Bin 256208 -> 256528 bytes
>   amdgpu/gc_11_0_3_mes1.bin       | Bin 217472 -> 217472 bytes
>   amdgpu/gc_11_0_3_mes_2.bin      | Bin 256272 -> 256592 bytes
>   amdgpu/gc_11_0_4_mes_2.bin      | Bin 255744 -> 256064 bytes
>   amdgpu/gc_11_0_4_rlc.bin        | Bin 159152 -> 159152 bytes
>   amdgpu/gc_11_5_1_imu.bin        | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_5_1_mes_2.bin      | Bin 256128 -> 256416 bytes
>   amdgpu/gc_11_5_2_rlc.bin        | Bin 162096 -> 162096 bytes
>   amdgpu/gc_12_0_0_imu.bin        | Bin 0 -> 132352 bytes
>   amdgpu/gc_12_0_0_me.bin         | Bin 0 -> 403984 bytes
>   amdgpu/gc_12_0_0_mec.bin        | Bin 0 -> 447456 bytes
>   amdgpu/gc_12_0_0_mes.bin        | Bin 0 -> 636048 bytes
>   amdgpu/gc_12_0_0_mes1.bin       | Bin 0 -> 609840 bytes
>   amdgpu/gc_12_0_0_pfp.bin        | Bin 0 -> 349264 bytes
>   amdgpu/gc_12_0_0_rlc.bin        | Bin 0 -> 150704 bytes
>   amdgpu/gc_12_0_0_toc.bin        | Bin 0 -> 2048 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin    | Bin 0 -> 711264 bytes
>   amdgpu/gc_12_0_1_imu.bin        | Bin 0 -> 132352 bytes
>   amdgpu/gc_12_0_1_me.bin         | Bin 0 -> 404048 bytes
>   amdgpu/gc_12_0_1_mec.bin        | Bin 0 -> 443360 bytes
>   amdgpu/gc_12_0_1_mes.bin        | Bin 0 -> 643536 bytes
>   amdgpu/gc_12_0_1_mes1.bin       | Bin 0 -> 611920 bytes
>   amdgpu/gc_12_0_1_pfp.bin        | Bin 0 -> 348672 bytes
>   amdgpu/gc_12_0_1_rlc.bin        | Bin 0 -> 150848 bytes
>   amdgpu/gc_12_0_1_toc.bin        | Bin 0 -> 2048 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin    | Bin 0 -> 711264 bytes
>   amdgpu/green_sardine_ta.bin     | Bin 33536 -> 33536 bytes
>   amdgpu/green_sardine_vcn.bin    | Bin 403904 -> 403904 bytes
>   amdgpu/navi10_ce.bin            | Bin 263296 -> 263296 bytes
>   amdgpu/navi10_me.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_mec.bin           | Bin 268720 -> 268592 bytes
>   amdgpu/navi10_mec2.bin          | Bin 268720 -> 268592 bytes
>   amdgpu/navi10_pfp.bin           | Bin 263424 -> 263424 bytes
>   amdgpu/navi10_vcn.bin           | Bin 403904 -> 403904 bytes
>   amdgpu/navi12_ce.bin            | Bin 263296 -> 263296 bytes
>   amdgpu/navi12_me.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/navi12_mec.bin           | Bin 268720 -> 268592 bytes
>   amdgpu/navi12_mec2.bin          | Bin 268720 -> 268592 bytes
>   amdgpu/navi12_pfp.bin           | Bin 263424 -> 263424 bytes
>   amdgpu/navi12_vcn.bin           | Bin 403904 -> 403904 bytes
>   amdgpu/navi14_vcn.bin           | Bin 403904 -> 403904 bytes
>   amdgpu/navy_flounder_vcn.bin    | Bin 579312 -> 579184 bytes
>   amdgpu/picasso_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/picasso_ta.bin           | Bin 41984 -> 41984 bytes
>   amdgpu/psp_13_0_14_ta.bin       | Bin 67904 -> 67904 bytes
>   amdgpu/psp_13_0_6_ta.bin        | Bin 88960 -> 88960 bytes
>   amdgpu/psp_14_0_0_ta.bin        | Bin 234496 -> 234496 bytes
>   amdgpu/psp_14_0_2_sos.bin       | Bin 0 -> 417120 bytes
>   amdgpu/psp_14_0_2_ta.bin        | Bin 0 -> 253920 bytes
>   amdgpu/psp_14_0_3_sos.bin       | Bin 0 -> 417120 bytes
>   amdgpu/psp_14_0_3_ta.bin        | Bin 0 -> 253920 bytes
>   amdgpu/psp_14_0_4_ta.bin        | Bin 234496 -> 234496 bytes
>   amdgpu/psp_14_0_4_toc.bin       | Bin 2560 -> 2560 bytes
>   amdgpu/raven_asd.bin            | Bin 193024 -> 193024 bytes
>   amdgpu/raven_ta.bin             | Bin 33536 -> 33536 bytes
>   amdgpu/renoir_asd.bin           | Bin 193024 -> 193024 bytes
>   amdgpu/renoir_vcn.bin           | Bin 403904 -> 403904 bytes
>   amdgpu/sdma_7_0_0.bin           | Bin 0 -> 45824 bytes
>   amdgpu/sdma_7_0_1.bin           | Bin 0 -> 45824 bytes
>   amdgpu/sienna_cichlid_vcn.bin   | Bin 579312 -> 579184 bytes
>   amdgpu/smu_14_0_2.bin           | Bin 0 -> 333236 bytes
>   amdgpu/smu_14_0_3.bin           | Bin 0 -> 333236 bytes
>   amdgpu/vangogh_asd.bin          | Bin 193024 -> 193024 bytes
>   amdgpu/vangogh_ce.bin           | Bin 263296 -> 263296 bytes
>   amdgpu/vangogh_me.bin           | Bin 263424 -> 263424 bytes
>   amdgpu/vangogh_mec.bin          | Bin 268160 -> 268160 bytes
>   amdgpu/vangogh_mec2.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/vangogh_pfp.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/vcn_3_1_2.bin            | Bin 571568 -> 571440 bytes
>   amdgpu/vcn_4_0_0.bin            | Bin 393200 -> 393200 bytes
>   amdgpu/vcn_4_0_2.bin            | Bin 393200 -> 393200 bytes
>   amdgpu/vcn_4_0_4.bin            | Bin 392688 -> 393200 bytes
>   amdgpu/vcn_4_0_5.bin            | Bin 392432 -> 392432 bytes
>   amdgpu/vcn_4_0_6.bin            | Bin 392432 -> 392432 bytes
>   amdgpu/vcn_4_0_6_1.bin          | Bin 392432 -> 392432 bytes
>   amdgpu/vcn_5_0_0.bin            | Bin 0 -> 438608 bytes
>   amdgpu/vpe_6_1_3.bin            | Bin 25984 -> 25984 bytes
>   amdgpu/yellow_carp_ce.bin       | Bin 263296 -> 263296 bytes
>   amdgpu/yellow_carp_me.bin       | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_mec.bin      | Bin 268720 -> 268160 bytes
>   amdgpu/yellow_carp_mec2.bin     | Bin 268720 -> 268160 bytes
>   amdgpu/yellow_carp_pfp.bin      | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_vcn.bin      | Bin 579504 -> 571440 bytes
>   95 files changed, 27 insertions(+)
>   create mode 100644 amdgpu/gc_12_0_0_imu.bin
>   create mode 100644 amdgpu/gc_12_0_0_me.bin
>   create mode 100644 amdgpu/gc_12_0_0_mec.bin
>   create mode 100644 amdgpu/gc_12_0_0_mes.bin
>   create mode 100644 amdgpu/gc_12_0_0_mes1.bin
>   create mode 100644 amdgpu/gc_12_0_0_pfp.bin
>   create mode 100644 amdgpu/gc_12_0_0_rlc.bin
>   create mode 100644 amdgpu/gc_12_0_0_toc.bin
>   create mode 100644 amdgpu/gc_12_0_0_uni_mes.bin
>   create mode 100644 amdgpu/gc_12_0_1_imu.bin
>   create mode 100644 amdgpu/gc_12_0_1_me.bin
>   create mode 100644 amdgpu/gc_12_0_1_mec.bin
>   create mode 100644 amdgpu/gc_12_0_1_mes.bin
>   create mode 100644 amdgpu/gc_12_0_1_mes1.bin
>   create mode 100644 amdgpu/gc_12_0_1_pfp.bin
>   create mode 100644 amdgpu/gc_12_0_1_rlc.bin
>   create mode 100644 amdgpu/gc_12_0_1_toc.bin
>   create mode 100644 amdgpu/gc_12_0_1_uni_mes.bin
>   create mode 100644 amdgpu/psp_14_0_2_sos.bin
>   create mode 100644 amdgpu/psp_14_0_2_ta.bin
>   create mode 100644 amdgpu/psp_14_0_3_sos.bin
>   create mode 100644 amdgpu/psp_14_0_3_ta.bin
>   create mode 100644 amdgpu/sdma_7_0_0.bin
>   create mode 100644 amdgpu/sdma_7_0_1.bin
>   create mode 100644 amdgpu/smu_14_0_2.bin
>   create mode 100644 amdgpu/smu_14_0_3.bin
>   create mode 100644 amdgpu/vcn_5_0_0.bin

