Return-Path: <SRS0=51ha=A5=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978D6EFD23F
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Feb 2026 19:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68639C19421; Wed, 25 Feb 2026 19:11:46 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A388C116D0
	for <linux-firmware@kernel.org>; Wed, 25 Feb 2026 19:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A388C116D0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttPONVwTyMlMExhCTAo/8gqALnnoJoOLGqSRCQvUqSeOFNzl6ocE6F+vFdG1hfKzLUKd8fZ9VFt8FaCu/AKkOY4ynixFoW9BZ2syYXc3VNGUbmOcpe/VfcDr2tCZWFPG8d4DffisLXquHQZ73GBGY0sZ0nth5VLDbiVqTUceWu94JSG7BzJVB8BWuQ2h+Uu468MbrVYeSdJb7xfjWWBeXmi8QeBCgjOsQOchZ75vBaPYzb2dOtzdQYfFJKuUber1LqpMXAwfpzzIt46+m5nSSqtgDH3mxmzemlW4jm+nsbdOFxUaYFUFhKUS5RDWQiOoqGiAvvs0HX4D6MdQAenQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btBhE180CNyQ7mggO2Y7bcex3DVWgCQdot8lJ4/j+FE=;
 b=kV4yLDWU+Z4rLvd/PFRmXfMZtvBBcO8tkFVmKhIQFcXPDGdXjiaKjrV4PEINlBPcTvjgsvE3JOHzrsxzYOvpZFIZaPchw1AlvQnl5jaFI0ryeRTVquDFvM1iNiLcb7qbCQM5pXqKm0xr0LdkxAnG32vDC8ZZGEYlYkA0R85+50ejJX49JdJYBQbrTYB7g8PST/yyjDiM9p9dMbioCOLzuay/DvFELp4UeU2WC3eDv4W0UsOBRNh5g0udujINh2zuyAmByGQC/XxU1mtEr+k5vydFz4wGHHoH0V3TyEN9WArPPkGlZ+W4dMRNI+CbnUtKSn6pVcbQQekkb3aIc2yzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btBhE180CNyQ7mggO2Y7bcex3DVWgCQdot8lJ4/j+FE=;
 b=Vt6tqY3iZTKbc0+4RWDd2i35SSPcF0+ISRITCO4P8RKGrOQyx3B/RNTBJ/Md7PgGDHBhg6OZIPqC9tdrcMHmPpfWDJdSQPXsGKxLRhYg0ijFgBchDVC1Oj+SzmdrjjeX9eZIJfsKKKJJ6NuQvMg+9f+5fnWaILnkoIO9yegAQ3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CH1PPF189669351.namprd12.prod.outlook.com (2603:10b6:61f:fc00::608) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 19:11:36 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 19:11:33 +0000
Message-ID: <8ea0678a-6e5e-48cc-9c2c-a0b3f7e5d2ae@amd.com>
Date: Wed, 25 Feb 2026 13:11:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware updates
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20260225170257.1801514-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260225170257.1801514-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:610:e7::15) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CH1PPF189669351:EE_
X-MS-Office365-Filtering-Correlation-Id: a92b914d-18fe-4b1a-da93-08de74a1b0a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	opvJI6dn75ne26/GzObszM3jlVWis/N58R/YY1iRzxM2R78O3rOs18ir6b6D6DAwBf9zuxIzu2vHuGwZnamCvdNT9kawgHhvMsAAewjM9ztYWQ1VV7zqQnJ0SpgyXCotA6QIxm+9CEM5fQA5ayjqRZv54Kc3m/yTqKYCOCO8T8qRdfmAC5/5j5HklZs9I6pDk3ONl9HxqDy/5WhAKjqVfEPgDYSqvjGtk17t6t/m2eNWDvJ5zLoX6iXpuvoR2XK07ae+opNWUJYvona1toECzyKPyRw6D6VmF9EcXkAjdJUzhDe5C0SZzjU31sNgrEAPeMIoeLYBajWjTiGEXrZk5h3NM++LOALbdNmJxA4CLBCp80zbYx2WzckrPwOPmxcGP6+JY1nlzpvp4gYttK3VAE3ToN4oOmRSn7k1UKqpATCA5XLzUknNSnT8lzTPY81NuEqCGqjtfweKPIqkPLtIJ99x8UbsPtMfw0DbUwW3Eu4bmDMIVcuKv//d6ULzRSCWSmxJDDVJp0Alx3O2wLQsU1dA8Iqo1tol75dWjNux2zisnP0ND5CkwIsntvgEl0UKpcNFV+cgj5yvjbboiwlS0JOWKfxrRftYx5Ind9kaVv3ahz7ng9Ehg77kOyooNUnaCW3lyvch0P3cDX/vDCvlVcnGoQNqdkrPUud6DmHuZfT0JNwaD+/kyulCk0Dbn1b7yqHBOFNALalouz54HvRq6Su/Cu3j6CiGO1yYiFcTd2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGE0aXBCZzBxTUJ3M0pteklRbzZ5UVdVSlZMNCtBZUlnNlJWL3NUUWlydlAy?=
 =?utf-8?B?ZDdmRkxOK3ZSeFluMTEyZGRhMndIYlJZQVNBaGhSdHpTdHZZTmdiOXRyeEwz?=
 =?utf-8?B?Y2twVXlMb3A1bDB2YXhycmdlSVBFdi8xRERxNDA4cEdzeHNBd1kvdFU3ZGtR?=
 =?utf-8?B?eE1CQ0xYQUlJRmp3VkpJdjJCcmxsL3VYdHIzaXNuR3hGWWxwcGx1MEdNOUho?=
 =?utf-8?B?U1NmVnpNbGF4b1RPVUJPaEVJekxTWEMwMWV0OFZrdDZuSkdKU2kvTGE4ZWtu?=
 =?utf-8?B?NU9ldC9rQS84NXkyZDVLM1o0TG1WVVFzVzhIb1hUcGVpalBHNVR5bHZtZUVS?=
 =?utf-8?B?M0cwV1Z6Z2I4dSthU0hJbFlrN3JSQ1ZhN3lPTTFxRVNHTHdQYTBlT0tYY2Uy?=
 =?utf-8?B?NGFnbzIwSHNPMmlzczZZb29oZXIvNkJaSmtJd3N5Z0NwalMvbXFJblZBVzc3?=
 =?utf-8?B?aExhSlEzVXg5YkVVWW1zK3dmZFBiajVmbnBHdFE2WGwvWFpqMGtsajNmL1ZR?=
 =?utf-8?B?TlBkVFQ3RlF5OVFNQTEvQWFZSDU3YWFpNStBZ1c0bWJ2WE1OaDdpYTdDWHFn?=
 =?utf-8?B?czcxT3VZbDhDODZ3WlNtajhmbm1lUWUyRTVyL3MwcVJyWExMY0tERzhKN1hR?=
 =?utf-8?B?VE80TG9EekRKLzFIaVJ5clRYTW16dDFRWk9lOFUydGRuR1NEbVpYbFQxYXNC?=
 =?utf-8?B?RTQvVFhCbnI4MEtwR2lGSVBtKzN1dXRMai9qQzNoZlVnU0tJN2lLbFYxam1R?=
 =?utf-8?B?RllFczhkOU9ua1c5RHNpT0ZxVVRpcHBFYyszRk50d1g3K0tIeEM1SFp0cEQv?=
 =?utf-8?B?SGVDdWkyV3Q3OGxwNnBLdm9aemV4TTVkRVQzSThmSmRoKzFHTHZ4UFZKSURy?=
 =?utf-8?B?Njd0S0lHVEFkSVNsT0NVK3gvNlVrVndjTUJVL2d1WUZJZ2RxalRqdEk5MmZs?=
 =?utf-8?B?Uloyd0twekxhaVdIUUFRM0pXUW9kSHNpbkVRbVU0TVdMaFM4SzdwL0hVWFNR?=
 =?utf-8?B?L002MXkrZFBNOFAxZEYySCtyRlJta2RtRXYrNEUrNkRhL3F0SlFnUkx5Y3NS?=
 =?utf-8?B?YTZOMjB1WXVOS2ExUkhKS3gyaW9vQzY4Q253Q1VGbk0veThpenBMS2lGekpi?=
 =?utf-8?B?V3FmUnZSVHBpd1FQRzU1bUdzeG51NExpRkdpYVdmdXYyMjlZUVIzY241SGlh?=
 =?utf-8?B?YlFmOHBsb0tpVGJycHNCc3dGSUg1WkNXUTZSTE03bTY1Rnp3emdkb082T1Nk?=
 =?utf-8?B?MWNqVzROUTltV3B6NmVkVU9Qc1I3TUZ6WlZmWE1sL3grTG9teGJ5NWlTWXNa?=
 =?utf-8?B?NnBaWk8zZlVPS3JpMVhzNXM5N0k3RGkxZWJkN2NQMExVbG1KYmhoMDNQY3Na?=
 =?utf-8?B?QitSayttV0NmcVBqTUpENEltSFNVWi9TNElGb1VVYmVMZEJTN1FmVmtqN2ox?=
 =?utf-8?B?M0lmbFdUUGZJZWZJL1ljMzF5cUdMWm54ZnJ4UkEzUFZsYUlveXQ3WU5FbEpn?=
 =?utf-8?B?L25ydHkyWDFiSmlRUXg2V3dlQTZPWjkzc21GVHJ5TXp3MTMxM0xoQ3ZIek1k?=
 =?utf-8?B?eUhndWxGaC9mL3lVWXV3RjRqemwzazdsTnZBUmhrY2JYTVc1UDU3Nkdtb0hL?=
 =?utf-8?B?Zm1SMDRMUkg3RG9uaFFKR2thbUJkV1NYWmU3cTltc0EvcEM2TXVUaFJtVzA1?=
 =?utf-8?B?S0NGOXJFYmx3L2JtR0ptNVpVSnFzZTl6Nkd3Q2M5SXVyUUdOeDJGOUhBOFVj?=
 =?utf-8?B?NWhCQ1RUa2tMQk1TRVJvcHVQQjlEWGZZVXladEtpRGRQQXdmRlRlSkNpSGR4?=
 =?utf-8?B?Y1hOangxSE1YSE5meDk4bGd5UVlQVTRyb09STkdWenQ0czFKZHQweFMrQ0RB?=
 =?utf-8?B?RE1xYnhxMzJYbjgySkw3eEl6UHRCeHAyeXdHaGM3ZDFXRkU2Tnp6QVVKQ2c3?=
 =?utf-8?B?QllPLzV2M3RJQURZMlRKTTM3ekN6NEI4c2RUNDN5cjB5MVZzQWtoWkIyZmVE?=
 =?utf-8?B?Sm1BT3hoZ1VCcUJjRHpRN3BkOWdad3NUOTVnQ1djNEJkR3J6WEFPWHhFMGYz?=
 =?utf-8?B?R0pXaFoxa1Z3ZlZmeUl1N2YxeFkvS3c4VmZNUndTQUk5T1BTUmRpOENyeUVt?=
 =?utf-8?B?ejFCTk1ZUURUNW4rbU8wWkhIRmwzUUpQc1ViM3NmSnZJWEd4bGtMWEFBVmtZ?=
 =?utf-8?B?YmIzVjkwV1dTWFlCRUNKWGU5TittWEtUdXhLN1VycGhKMG4yczg3ODZKbk9x?=
 =?utf-8?B?dUNyUHJFSlh1ZG5jdVByc0E1MjBSdjV3emlvcU1iMHB6cUd5WG9pek5wQytz?=
 =?utf-8?B?dE9wM1pQSEN4bDRYemVDNFd6ajBiWk9nUk85YldhbXJ4cHBacU9Edz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92b914d-18fe-4b1a-da93-08de74a1b0a1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:11:33.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioI3BCCPAklms9oqIHbBKHrSvMr8gWpifkDMcdV8R6J0ZvCx7pPl3m2jraG/3sVzKe/aPTXhjiFKaY+bxx5cNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF189669351

Updated, thanks!

On 2/25/2026 11:02 AM, Alex Deucher wrote:
> Hi,
> 
> amdgpu firmware updates.
> 
> The following changes since commit 1db833e68de88cd3f7f6612a5552b3e671e36ef0:
> 
>    Merge branch 'remove-obsolete-lenovo-fw' into 'main' (2026-02-21 15:51:25 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-02-25
> 
> for you to fetch changes up to 3bdab876ee3508f78ec896e5e04a4e8ebdadb309:
> 
>    amdgpu: update PSP 13.0.14 firmware (2026-02-25 11:43:31 -0500)
> 
> ----------------------------------------------------------------
> amd-2026-02-25:
> 
> Update firmware
> 
>  From internal git commit:
> e093aa5296eb2cb1af74a5214bec1aaf97113225
> 
> ----------------------------------------------------------------
> Alex Deucher (59):
>        amdgpu: update GC 9.5.0 firmware
>        amdgpu: update PSP 13.0.12 firmware
>        amdgpu: update VCN 5.0.1 firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update GC 9.4.3 firmware
>        amdgpu: update PSP 13.0.6 firmware
>        amdgpu: update VCN 4.0.3 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update SDMA 6.0.2 firmware
>        amdgpu: update VCN 4.0.4 firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update renoir firmware
>        amdgpu: update GC 12.0.0 firmware
>        amdgpu: update PSP 14.0.2 firmware
>        amdgpu: update SMU 14.0.2 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update GC 11.5.0 firmware
>        amdgpu: update PSP 14.0.0 firmware
>        amdgpu: update SDMA 6.1.0 firmware
>        amdgpu: update VCN 4.0.5 firmware
>        amdgpu: update VPE 6.1.0 firmware
>        amdgpu: update GC 12.0.1 firmware
>        amdgpu: update PSP 14.0.3 firmware
>        amdgpu: update SMU 14.0.3 firmware
>        amdgpu: update VCN 5.0.0 firmware
>        amdgpu: update GC 11.5.1 firmware
>        amdgpu: update PSP 14.0.1 firmware
>        amdgpu: update SDMA 6.1.1 firmware
>        amdgpu: update VCN 4.0.6 firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update SDMA 6.0.1 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update GC 11.5.2 firmware
>        amdgpu: update PSP 14.0.4 firmware
>        amdgpu: update SDMA 6.1.2 firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update GC 11.5.3 firmware
>        amdgpu: update PSP 14.0.5 firmware
>        amdgpu: update SDMA 6.1.3 firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update VCN 4.0.0 firmware
>        amdgpu: update PSP 13.0.0 kicker firmware
>        amdgpu: update GC 10.3.6 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update GC 9.4.4 firmware
>        amdgpu: update PSP 13.0.14 firmware
> 
>   amdgpu/beige_goby_ta.bin        | Bin 255232 -> 255232 bytes
>   amdgpu/dimgrey_cavefish_smc.bin | Bin 244902 -> 244902 bytes
>   amdgpu/dimgrey_cavefish_ta.bin  | Bin 255232 -> 255232 bytes
>   amdgpu/gc_10_3_6_ce.bin         | Bin 263296 -> 263296 bytes
>   amdgpu/gc_10_3_6_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_10_3_6_mec.bin        | Bin 268592 -> 268592 bytes
>   amdgpu/gc_10_3_6_mec2.bin       | Bin 268592 -> 268592 bytes
>   amdgpu/gc_10_3_6_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_0_me.bin         | Bin 314512 -> 315120 bytes
>   amdgpu/gc_11_0_0_mec.bin        | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_0_mes_2.bin      | Bin 257344 -> 259568 bytes
>   amdgpu/gc_11_0_0_pfp.bin        | Bin 231008 -> 232096 bytes
>   amdgpu/gc_11_0_1_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_0_1_mes1.bin       | Bin 232816 -> 235344 bytes
>   amdgpu/gc_11_0_1_mes_2.bin      | Bin 257312 -> 257312 bytes
>   amdgpu/gc_11_0_1_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_rlc.bin        | Bin 157040 -> 157040 bytes
>   amdgpu/gc_11_0_2_me.bin         | Bin 314496 -> 315120 bytes
>   amdgpu/gc_11_0_2_mec.bin        | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_2_mes_2.bin      | Bin 257344 -> 259568 bytes
>   amdgpu/gc_11_0_2_pfp.bin        | Bin 231008 -> 232112 bytes
>   amdgpu/gc_11_0_3_me.bin         | Bin 314512 -> 315136 bytes
>   amdgpu/gc_11_0_3_mec.bin        | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_3_mes1.bin       | Bin 218336 -> 220544 bytes
>   amdgpu/gc_11_0_3_mes_2.bin      | Bin 257408 -> 259632 bytes
>   amdgpu/gc_11_0_3_pfp.bin        | Bin 231008 -> 232112 bytes
>   amdgpu/gc_11_0_4_mes1.bin       | Bin 232048 -> 234640 bytes
>   amdgpu/gc_11_0_4_mes_2.bin      | Bin 256736 -> 256704 bytes
>   amdgpu/gc_11_0_4_rlc.bin        | Bin 159152 -> 159152 bytes
>   amdgpu/gc_11_5_0_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_0_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_0_mes1.bin       | Bin 235664 -> 238128 bytes
>   amdgpu/gc_11_5_0_mes_2.bin      | Bin 257184 -> 257184 bytes
>   amdgpu/gc_11_5_0_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_0_rlc.bin        | Bin 166528 -> 166528 bytes
>   amdgpu/gc_11_5_1_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_1_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_1_mes1.bin       | Bin 235856 -> 238320 bytes
>   amdgpu/gc_11_5_1_mes_2.bin      | Bin 257440 -> 257440 bytes
>   amdgpu/gc_11_5_1_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_2_mes1.bin       | Bin 234992 -> 237776 bytes
>   amdgpu/gc_11_5_2_mes_2.bin      | Bin 257216 -> 259504 bytes
>   amdgpu/gc_11_5_2_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_rlc.bin        | Bin 162096 -> 162096 bytes
>   amdgpu/gc_11_5_3_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_3_mes1.bin       | Bin 234992 -> 237776 bytes
>   amdgpu/gc_11_5_3_mes_2.bin      | Bin 257216 -> 259504 bytes
>   amdgpu/gc_11_5_3_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/gc_12_0_0_me.bin         | Bin 467712 -> 467424 bytes
>   amdgpu/gc_12_0_0_mec.bin        | Bin 451552 -> 451552 bytes
>   amdgpu/gc_12_0_0_pfp.bin        | Bin 351920 -> 352336 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin    | Bin 723648 -> 725216 bytes
>   amdgpu/gc_12_0_1_me.bin         | Bin 467712 -> 463712 bytes
>   amdgpu/gc_12_0_1_mec.bin        | Bin 451552 -> 451552 bytes
>   amdgpu/gc_12_0_1_pfp.bin        | Bin 351920 -> 353712 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin    | Bin 723648 -> 725216 bytes
>   amdgpu/gc_9_4_3_mec.bin         | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_3_sjt_mec.bin     | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_mec.bin         | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_sjt_mec.bin     | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_mec.bin         | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_sjt_mec.bin     | Bin 268736 -> 268736 bytes
>   amdgpu/green_sardine_asd.bin    | Bin 205312 -> 205312 bytes
>   amdgpu/green_sardine_ce.bin     | Bin 36608 -> 36608 bytes
>   amdgpu/green_sardine_me.bin     | Bin 69376 -> 69376 bytes
>   amdgpu/green_sardine_mec.bin    | Bin 268224 -> 268224 bytes
>   amdgpu/green_sardine_mec2.bin   | Bin 268224 -> 268224 bytes
>   amdgpu/green_sardine_pfp.bin    | Bin 85760 -> 85760 bytes
>   amdgpu/green_sardine_ta.bin     | Bin 37632 -> 37632 bytes
>   amdgpu/navi10_asd.bin           | Bin 205312 -> 205312 bytes
>   amdgpu/navi10_ta.bin            | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_asd.bin           | Bin 205312 -> 205312 bytes
>   amdgpu/navi12_ta.bin            | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_asd.bin           | Bin 205312 -> 205312 bytes
>   amdgpu/navi14_ce_wks.bin        | Bin 263296 -> 263296 bytes
>   amdgpu/navi14_me_wks.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_mec2_wks.bin      | Bin 268592 -> 268160 bytes
>   amdgpu/navi14_mec_wks.bin       | Bin 268592 -> 268160 bytes
>   amdgpu/navi14_pfp_wks.bin       | Bin 263424 -> 263424 bytes
>   amdgpu/navi14_smc.bin           | Bin 264586 -> 264586 bytes
>   amdgpu/navi14_ta.bin            | Bin 37632 -> 37632 bytes
>   amdgpu/navy_flounder_ta.bin     | Bin 255232 -> 255232 bytes
>   amdgpu/psp_13_0_0_ta.bin        | Bin 267520 -> 267520 bytes
>   amdgpu/psp_13_0_0_ta_kicker.bin | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin       | Bin 263616 -> 263616 bytes
>   amdgpu/psp_13_0_11_ta.bin       | Bin 250880 -> 250880 bytes
>   amdgpu/psp_13_0_12_sos.bin      | Bin 439088 -> 439088 bytes
>   amdgpu/psp_13_0_14_sos.bin      | Bin 397632 -> 405824 bytes
>   amdgpu/psp_13_0_14_ta.bin       | Bin 67904 -> 67904 bytes
>   amdgpu/psp_13_0_4_ta.bin        | Bin 250880 -> 250880 bytes
>   amdgpu/psp_13_0_5_asd.bin       | Bin 205312 -> 205312 bytes
>   amdgpu/psp_13_0_5_ta.bin        | Bin 242688 -> 242688 bytes
>   amdgpu/psp_13_0_6_ta.bin        | Bin 88960 -> 88960 bytes
>   amdgpu/psp_13_0_7_sos.bin       | Bin 248496 -> 248496 bytes
>   amdgpu/psp_13_0_7_ta.bin        | Bin 242688 -> 242688 bytes
>   amdgpu/psp_14_0_0_ta.bin        | Bin 250880 -> 250880 bytes
>   amdgpu/psp_14_0_1_ta.bin        | Bin 250880 -> 250880 bytes
>   amdgpu/psp_14_0_2_ta.bin        | Bin 270304 -> 270304 bytes
>   amdgpu/psp_14_0_3_ta.bin        | Bin 282912 -> 282912 bytes
>   amdgpu/psp_14_0_4_ta.bin        | Bin 250880 -> 250880 bytes
>   amdgpu/psp_14_0_4_toc.bin       | Bin 2560 -> 2560 bytes
>   amdgpu/psp_14_0_5_ta.bin        | Bin 250880 -> 250880 bytes
>   amdgpu/renoir_asd.bin           | Bin 205312 -> 205312 bytes
>   amdgpu/renoir_ce.bin            | Bin 9344 -> 9344 bytes
>   amdgpu/renoir_me.bin            | Bin 17536 -> 17536 bytes
>   amdgpu/renoir_mec.bin           | Bin 268224 -> 268224 bytes
>   amdgpu/renoir_mec2.bin          | Bin 268224 -> 268224 bytes
>   amdgpu/renoir_pfp.bin           | Bin 21632 -> 21632 bytes
>   amdgpu/renoir_ta.bin            | Bin 46080 -> 46080 bytes
>   amdgpu/sdma_6_0_1.bin           | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_0_2.bin           | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_0.bin           | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_1.bin           | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_2.bin           | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_3.bin           | Bin 34560 -> 34560 bytes
>   amdgpu/sienna_cichlid_ce.bin    | Bin 263296 -> 263296 bytes
>   amdgpu/sienna_cichlid_me.bin    | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_mec.bin   | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_mec2.bin  | Bin 268160 -> 268160 bytes
>   amdgpu/sienna_cichlid_pfp.bin   | Bin 263424 -> 263424 bytes
>   amdgpu/sienna_cichlid_smc.bin   | Bin 247396 -> 247396 bytes
>   amdgpu/sienna_cichlid_ta.bin    | Bin 382720 -> 382720 bytes
>   amdgpu/smu_14_0_2.bin           | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3.bin           | Bin 333236 -> 333236 bytes
>   amdgpu/vangogh_asd.bin          | Bin 205312 -> 205312 bytes
>   amdgpu/vcn_4_0_0.bin            | Bin 403856 -> 395664 bytes
>   amdgpu/vcn_4_0_2.bin            | Bin 403856 -> 395664 bytes
>   amdgpu/vcn_4_0_3.bin            | Bin 359696 -> 359696 bytes
>   amdgpu/vcn_4_0_4.bin            | Bin 403856 -> 395664 bytes
>   amdgpu/vcn_4_0_5.bin            | Bin 403856 -> 395664 bytes
>   amdgpu/vcn_4_0_6.bin            | Bin 403856 -> 395664 bytes
>   amdgpu/vcn_4_0_6_1.bin          | Bin 403856 -> 395664 bytes
>   amdgpu/vcn_5_0_0.bin            | Bin 436048 -> 437712 bytes
>   amdgpu/vcn_5_0_1.bin            | Bin 211280 -> 219472 bytes
>   amdgpu/vpe_6_1_0.bin            | Bin 25984 -> 25984 bytes
>   amdgpu/yellow_carp_ta.bin       | Bin 242688 -> 242688 bytes
>   140 files changed, 0 insertions(+), 0 deletions(-)

