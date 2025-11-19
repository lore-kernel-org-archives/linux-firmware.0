Return-Path: <SRS0=hdyr=53=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CB9CF58C2
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 17:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1DBCC116B1; Wed, 19 Nov 2025 17:51:54 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D6FFC113D0
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 17:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D6FFC113D0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To+Dzg/9y2O7WytDLZPrZBLt84az1LMU1ixZjEE5rQhQgN2RpwzrfhayVW/R7/Om47A14MSxnnmPYuSntwDC3xilUXnabHokigyaU+5GsJdfsKlatnuhlpFcVY2xpPMoa5E4l2wKqfcryTfYbv/6d1Paw1Rr2MSUHQEmHf+Bmrgr0jMbZ7iypnZ71jdviq4npE64kLxBT/EQ84EF3ziYQB7otNHoeI13egrXTZ7t/OOuIeT1XpRxxMLchR7N9PqrQ3ua+LTjlikhqVgk63+9XKMZ3kvzRcJqGrf6WJQqfcx27+8DB7LBsL0u7er2Q+9zxE6Jf3NvLJv6ZFdl85CO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TprhwsZ7PnwMZsAwFPGUlzZCqsqJpDVyMgx4InrgUmA=;
 b=VrWaAITWIQLbkte8WSrHKBdKP2fmnd9j3DSRNfaGZ3P1aSpHLXhTqI1R7D2vVrO1403Wi50nUQdSquE1HG4twTcUGDhO3hVlcldjELBfsD5d0K7+K6lipRgYWRPcSBVlvFQI/Q2CzkCkcc3M4q7zaeuuKCIzrvGzv+xk1w7n+XOrg7ygUFukBCtF+z5HEpP9+bhWdq4IglJrZ4GLqa8k4lgeJxuT9joEAjZ4S8JMRFUfTLAeqFVfi4ZSnVx0Wl3f8zdU8eU+2oxeUF3zxcRTWtK0BuMEgH0TdPj0i6hwtmvSPUqXUZg4uWxjenCIg1aJWGVyVC9+BBEgle9c7hIv/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TprhwsZ7PnwMZsAwFPGUlzZCqsqJpDVyMgx4InrgUmA=;
 b=0Klr3qxmqZxBmnJZvIfzkbUwWgMxaZ/E7TR07MMYFiNM1QxCXUhV28MfUcsTpu8d6t7Ls2CG3YAX/UpfBJQBpmd1pPYzKmEVj6v9JHIA6Jw1zmRBqk64EhM78xf4HxqBMa3wqGXSLaEpR0QGDWys6wsQVbHDgeyq136Hz1f0lrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 17:51:51 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 17:51:50 +0000
Message-ID: <3b5afa93-4fd2-4d20-b761-5e590e98ebb7@amd.com>
Date: Wed, 19 Nov 2025 11:51:46 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware updates
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20251119174111.3670202-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251119174111.3670202-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:806:125::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: d590d1b5-91fb-4e7d-e1b9-08de279450fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVZySHhqV3dHaUNicU9ZZnVocjFsWWRERU1jN2xzdW1OWXFEL1o2VGRRVnhC?=
 =?utf-8?B?MTZyVHZvQkJjaStUektTYjBLQUFlTUE5Y3l3M1hwMUxtRXdoYTRtVWFUNlhz?=
 =?utf-8?B?SklIeW5weDZ5bWxtR0pQNFlMQ1BXemxBVEY1b1FSN2s1RjlDWkh4Tm03Q1k3?=
 =?utf-8?B?TGpNQnhubll4QWRQejFWbjVSanhLY1VNNlR2ekFDWGFIUGsyUkJkL2lCYlpO?=
 =?utf-8?B?VUZPejJObStvZEhFcGRWeUxuYmhPaDhDVDJ0YW8xSkdNNXVDclhlYXV2YkIx?=
 =?utf-8?B?M3hIc0J4U2ttYUlZWmdndjgyZFdDOWFOeTJ4RERHUy91SmZBbDh0RmhSVWk0?=
 =?utf-8?B?NElyMzRhNkF4cXdCa253OWhIVzJVNHFKV0VYRGVYY2ZJaTJmVE5JM1lpV2M4?=
 =?utf-8?B?dlpJcCtqTWF2aFlJc1J0ZVZ6YzhpcnFqblhseVE2YTZqUGtOdE9IWW50a01j?=
 =?utf-8?B?U2Z4Y3Vrais4VVhGQm93ZU5NNkthaTJZTktUZUhETjEzL0ovUlovYXRHYkU0?=
 =?utf-8?B?Q1BibFUyalBrMFRONU1jWFUwRWRwU0Q2djZyQ3YwelQ4c2UyLzhxZTcyWStR?=
 =?utf-8?B?T3E3Y3AwSnI2WThyQzBnL1hxU1I0NFovMWphRksyQ0xIaHc2L1JNTjFXVGxM?=
 =?utf-8?B?RXJ4ampCVVNRdUMxamFKZW8zWHU5MmVWMTNyT0lQVjZQRXdSMjFldUErbXNh?=
 =?utf-8?B?a0dRZU5qK1VZY1p5VVBBYU9FK0tHeXZNUGVQQWpvTXZjbE5vbWxmSG00QWsx?=
 =?utf-8?B?Z2VyckhhZGFvOUVFbUhqYjRvb3diSlRaeVdwTEJ6ZU9LbHNWYjdPQklnRTly?=
 =?utf-8?B?L3lNaS9QMHVxU2xPM1NRQlloUlBXQUZDQlhuTExlK0g0Tk5LWmQzOVlJT0Jx?=
 =?utf-8?B?dzdLNlJTVitVUWRibDFkS2JzSkl3Qmg4RmtZaW9PdnFKdnNETHkydGRnZjAy?=
 =?utf-8?B?c3dxb3QxS2NIdEFreXB4TFAyRmsxVi9MNWEvYWR0NjVkdDE5b2F0U2kwWDFK?=
 =?utf-8?B?aUNualVvczlBejFEOEN6ZllKdHNsOGVWdjdtZGVnd0RLZ1NlL01ud0lOVC93?=
 =?utf-8?B?YVc1bUNNZWM5RnFpSnZCamZGTFVhNXJZZ09YSURsYllvTE1nK0RuTU1PWUhV?=
 =?utf-8?B?c2I4czlTWFViUkhjUkI5MTNjUTFqNERuQ1F3OVNoTUE2eFFvbS84LzgxM1NB?=
 =?utf-8?B?QzJ3VlFIaDNmZHBobGVub3kwOEUxYmtnT01BTndSMHRNZWlNaHBVZVZIU1c1?=
 =?utf-8?B?UE9BTEVsOUF3ZVl1WFR1NWYrWEJCRGk2M05jYW0yN09tMzdkZEgreFJJdDh5?=
 =?utf-8?B?ODN1b1l0VXFZQVYvdzU4V0x1RWRTQndvUzZrTk1aS3lvbGNzNHFQSGhhcUxS?=
 =?utf-8?B?K2VjQWxFNnNUM2szVUxPeVp3dis5b2NWcm52N0EyRG9RVzdIdnBGWkxQVlNh?=
 =?utf-8?B?WStWenJhMjlMWjE4Nm1ibEY1d3FJN1JsL2xQTFZYT3ZBdDFKbG1Qc085eE1N?=
 =?utf-8?B?blZEWUlWbUt0YWhXelZBeU5vNkhIZEJHamQySS9Vd2ppNWxQbjRRenYrQXFE?=
 =?utf-8?B?b0k5UkFWRXpKRkdSWWp6NkhRWGhtQjJLSkxJVEZESFQrS0lEaHVYci9TTU1t?=
 =?utf-8?B?MHNnK2hmWkR5N2JQTklsWEd0WW02b3c1QUxwdDNCQjY4aldra0J1SXNpZUc5?=
 =?utf-8?B?bmVDVU9kTmt5QjlTTFhhd015cm56cEdrU0JlQVVtYmxDVUtOa3F2NHpubGZU?=
 =?utf-8?B?Qm5QZ0E3eGVoemhXYWRMb3Z3V0huRldEY1hSeHo3WlRrdDVPMjVyYVQxc3BZ?=
 =?utf-8?B?eEdLL0ZHbFF6ckRGamxXMHlOV0pwdGk2cUxaY0MxSS84Vm1IU1owczY5alc5?=
 =?utf-8?B?dXpnZnIyVmVFRGxFMXZyRTc3ZDNmREtVTGVZZEh4Zk9wc0JhcnNBTVRoTzZS?=
 =?utf-8?B?WEg2R29jdjdncUlMeDFvN3BLdXM3UU5wUHdDR0w5d1FxdmkzTWdxSVA0dFFK?=
 =?utf-8?B?QWtaQnRLL05BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXFxbGtCczlQNHdISTNkdFpMZm5nRGphV2ZQM21YTndHTWI0L3JrTHlFbDJx?=
 =?utf-8?B?TEZjUXprQWRiOElGb0RKSnFibmR2WkRpazA5YzFkQTJLV2hDajRkNHFHdjBr?=
 =?utf-8?B?YkZwT0xpUDFzQUFycWtueGNZQ3hnbWtZSzhyQkpienJUVFIyaVhVQmFYalp5?=
 =?utf-8?B?MHBaRmVnU2hna1NwL3BUMFQyVUlpaWlDVU5MUmxxWTJjT3hVT3dwdE5BeUNS?=
 =?utf-8?B?RXk1SVZicm5HYXFCZ2VBSzl6dmtDUi9qNHFZVUFiUUw5c2pnUVIxZ2hqckc5?=
 =?utf-8?B?VGt0NmtYMWJkUmFjSEloNWFDNkxrcjd5RXgzUlRVOUVwNjdEbWdJYlJqemFT?=
 =?utf-8?B?a0hTRlJPOGpHUVhLNUc4Nk8rVGxURXNVRFhUQTZkREpqTnpOUmJETzFpaUJW?=
 =?utf-8?B?bStsbXJCSzJMVzlLOXFrMzFHKy9WTjlSVXhNbWRORWRwUmY5bU15d3dXcU8r?=
 =?utf-8?B?Y2xwdUtXN1E2cTl1MjNMREh3U00xZ1g5Q3k2R0RrdnVRcHdzWEozcVdpSlha?=
 =?utf-8?B?RHZYa2o0ZWlYZC9RY3IvcWM0a0dzMy9MRlpBaEpUYi9WNDc1N1U2aXB1Y0tj?=
 =?utf-8?B?Z0lXZHB0UHpObS9CMjNObmVJbk1RWWpacFBBUDJHVkpZT09wM1FWT2xDZjdY?=
 =?utf-8?B?WWtWbUZOcFV5dXdLczJSeWFYR3JicVR5U1Z6c042dnczZlBSamxCMU1OdlM2?=
 =?utf-8?B?cS84dG0vSVNEMnQxdmgxQ1k3MzhtN0cyLysvcDVkWGhtajRrNEovNTNGNDRB?=
 =?utf-8?B?SVNCbnM1dkZnc0hvWnRPc21MOGdrSXJPaVkxb0tVTUttNk9MbXgyYXRrUXM5?=
 =?utf-8?B?YTd5RHBML1plZmV3N1h6RjFJOG9vM0lMWk5vWlc0MHlyK1BPNGhJL2tvY0Vx?=
 =?utf-8?B?Z3J5M3BteVNSYkdqRWtkdnRJSTBpVjlFWTZLUitXWkNXZDVucmhHQURpYjNK?=
 =?utf-8?B?L2RzajVKbzR4SUFDUkQzWFBhUldIUkc1RnpzaFczVDZlTHFOemtJb2xobnB6?=
 =?utf-8?B?SlBJa2N0L04xZTB1NWdpay9UWTN0eHhuVUxOYjVzTExMWWVvUm9yalg3VHhQ?=
 =?utf-8?B?QTlVZmZod2lmYkVUVjVtcXpiTUJ2TThtUmwza1JnbTI1UmxGZlRFUFdlR0Vr?=
 =?utf-8?B?NkRNSTA0NG9SZFF5ckh5emNBSlIwZGRuMSsrdlhOMThpcUZLaFc2U3Q4TStx?=
 =?utf-8?B?MWxFa0V4bG11TklPdHhZYldvUk9zYWh5OWFjTlZKaWMvcERpRUtMTUVmL1h3?=
 =?utf-8?B?U1lMdVlLVW1LclFCYk5KSnM4c3VhR216eE4zYTJtWGVkZjk3L0I3SmZRd1hJ?=
 =?utf-8?B?TEMyc254VEhscFhTVTI3bUVpSUNmbWl6OHM2Tm51Y3NWUTd3Ung5Ujd3Zk8z?=
 =?utf-8?B?QUZFV3pNN0c3SXFFa1pKRXp4OGM3Vm03TUZFc0JqcmxmZ0pXUjFqRnU0WTV5?=
 =?utf-8?B?Z0F3ak9xUWE4OUpOTkhvUlJJUU50dlh6dGVHSG15K2o5cGtuRWVtemlZelhw?=
 =?utf-8?B?SzloZUUrVlJJaVFERkVlc2xjZGE1OE5PV0FtbjZTNUdNWkFGWFNaWFFDbGpN?=
 =?utf-8?B?bm8zV3JRT1VNSkdBRjVPQ0JJQ0RFOHk0bUdRZGVGSUJiUWp1aFhmMFdUdWdz?=
 =?utf-8?B?dGY5Nm5CUDhyT1drWVdzNHBDL3JrZFRKUktacUxpL2tVOGVFYnlEcDUzVFBS?=
 =?utf-8?B?anhhcnQzOUNmOFlvRkNtcGMxM2I4cW44K1JjTjFOSG9FNW43VzlLSjNmZE52?=
 =?utf-8?B?ZndqbFBrLzVXQS9tWXRJcXBFK0lKRFoxZlZ6WktTK1d2cW1sMm9PeS9qU0dr?=
 =?utf-8?B?UWtNaXF5dWFYOWwxVXJQdGhvcml6YWtheitmUjREVUpUZHYxSTVZellyT1JK?=
 =?utf-8?B?a09hc2pwbE5uRkFtNzBtS29Sa0VaM2NjS1FNN2M5NDB2cEUyem1YT2RvRHha?=
 =?utf-8?B?bWZBMUpFLzNCL0ZYRWJ6YmhIcHVhNENKYmFWNzAwSFU3cUVYN3BDMFZOMUNR?=
 =?utf-8?B?R0M2YjI0SVN1TmRXeDJDNExEcnhQSWJIc3k5OGYzMUh6dzdoWUZERmRBUnZT?=
 =?utf-8?B?ZTBNVHRpM3ZMR1FnaTkwNmZNYlV4emxiaHh4SS93d0R6dzVQVk54Umk5Y0w2?=
 =?utf-8?Q?uQwR+u9+yV2V1/MTDrzUqHwMZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d590d1b5-91fb-4e7d-e1b9-08de279450fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:51:50.1591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrU9Z47UJ0/CZIxuAk2tQSL4FgKWlHofSf18TSCIgm8pZ2rHrW1uqZJNtwmFKsUKh0H/iYa3qlfD5FlpLT3aPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

On 11/19/25 11:41 AM, Alex Deucher wrote:
> Hi,
> 
> amdgpu firmware updates.
> 
> The following changes since commit 213080aee725909038628065516da521dd5a2a4e:
> 
>    amdgpu: DMCUB updates for various ASICs (2025-11-07 17:17:43 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-11-19
> 
> for you to fetch changes up to 58fbc72faa87a48a18d285da11701e8efe638cd6:
> 
>    amdgpu: update vega20 firmware (2025-11-19 12:31:42 -0500)
> 
> ----------------------------------------------------------------
> amd-2025-11-19:
> 
> Update amdgpu firmware
> 
> ----------------------------------------------------------------
> Alex Deucher (64):
>        amdgpu: add vce1 firmware
>        amdgpu: update aldebaran firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update GC 11.5.0 firmware
>        amdgpu: update PSP 14.0.0 firmware
>        amdgpu: update VCN 4.0.5 firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update GC 11.5.1 firmware
>        amdgpu: update PSP 14.0.1 firmware
>        amdgpu: update VCN 4.0.6 firmware
>        amdgpu: update GC 9.4.3 firmware
>        amdgpu: update PSP 13.0.6 firmware
>        amdgpu: update SDMA 4.4.2 firmware
>        amdgpu: update VCN 4.0.3 firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update GC 11.5.2 firmware
>        amdgpu: update PSP 14.0.4 firmware
>        amdgpu: update GC 11.5.3 firmware
>        amdgpu: update PSP 14.0.5 firmware
>        amdgpu: update GC 9.4.4 firmware
>        amdgpu: update PSP 13.0.14 firmware
>        amdgpu: update GC 9.5.0 firmware
>        amdgpu: update PSP 13.0.12 firmware
>        amdgpu: update VCN 5.0.1 firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SMU 13.0.0 firmware
>        amdgpu: update VCN 4.0.0 firmware
>        amdgpu: update PSP 13.0.0 kicker firmware
>        amdgpu: update smu 13.0.0 kicker firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update SDMA 6.0.3 firmware
>        amdgpu: update SMU 13.0.10 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update smu 13.0.7 firmware
>        amdgpu: update VCN 4.0.4 firmware
>        amdgpu: update GC 12.0.0 firmware
>        amdgpu: update PSP 14.0.2 firmware
>        amdgpu: update SMU 14.0.2 firmware
>        amdgpu: update GC 12.0.1 firmware
>        amdgpu: update PSP 14.0.3 firmware
>        amdgpu: update SMU 14.0.3 firmware
>        amdgpu: update VCN 5.0.0 firmware
>        amdgpu: update GC 10.3.6 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update VCN 3.1.2 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update renoir firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update vega10 firmware
>        amdgpu: update vega12 firmware
>        amdgpu: update vega20 firmware
> 
>   WHENCE                           |   1 +
>   amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
>   amdgpu/aldebaran_sos.bin         | Bin 446208 -> 446208 bytes
>   amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
>   amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
>   amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/beige_goby_smc.bin        | Bin 244934 -> 244934 bytes
>   amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
>   amdgpu/beige_goby_ta.bin         | Bin 251136 -> 255232 bytes
>   amdgpu/beige_goby_vcn.bin        | Bin 580112 -> 580112 bytes
>   amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
>   amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
>   amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
>   amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
>   amdgpu/dimgrey_cavefish_ta.bin   | Bin 251136 -> 255232 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580112 -> 580112 bytes
>   amdgpu/gc_10_3_6_rlc.bin         | Bin 177104 -> 177104 bytes
>   amdgpu/gc_11_0_0_mes_2.bin       | Bin 257344 -> 257344 bytes
>   amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_0_1_mes1.bin        | Bin 232816 -> 232784 bytes
>   amdgpu/gc_11_0_1_mes_2.bin       | Bin 257312 -> 257376 bytes
>   amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_rlc.bin         | Bin 157040 -> 157040 bytes
>   amdgpu/gc_11_0_2_mes_2.bin       | Bin 257344 -> 257344 bytes
>   amdgpu/gc_11_0_3_mes_2.bin       | Bin 257408 -> 257408 bytes
>   amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_4_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_0_4_mes1.bin        | Bin 232080 -> 232048 bytes
>   amdgpu/gc_11_0_4_mes_2.bin       | Bin 256704 -> 256736 bytes
>   amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_0_mes_2.bin       | Bin 257184 -> 257216 bytes
>   amdgpu/gc_11_5_1_mes_2.bin       | Bin 257440 -> 257504 bytes
>   amdgpu/gc_11_5_2_mes_2.bin       | Bin 256960 -> 257216 bytes
>   amdgpu/gc_11_5_3_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_3_mes_2.bin       | Bin 256960 -> 257216 bytes
>   amdgpu/gc_11_5_3_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_rlc.bin         | Bin 162064 -> 162064 bytes
>   amdgpu/gc_12_0_0_me.bin          | Bin 467488 -> 467712 bytes
>   amdgpu/gc_12_0_0_mec.bin         | Bin 451552 -> 451552 bytes
>   amdgpu/gc_12_0_0_pfp.bin         | Bin 352048 -> 351920 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin     | Bin 723328 -> 723648 bytes
>   amdgpu/gc_12_0_1_me.bin          | Bin 467488 -> 467712 bytes
>   amdgpu/gc_12_0_1_mec.bin         | Bin 451552 -> 451552 bytes
>   amdgpu/gc_12_0_1_pfp.bin         | Bin 352048 -> 351920 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin     | Bin 723328 -> 723648 bytes
>   amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/green_sardine_asd.bin     | Bin 201216 -> 205312 bytes
>   amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
>   amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
>   amdgpu/green_sardine_mec.bin     | Bin 268064 -> 268224 bytes
>   amdgpu/green_sardine_mec2.bin    | Bin 268064 -> 268224 bytes
>   amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
>   amdgpu/green_sardine_ta.bin      | Bin 33536 -> 37632 bytes
>   amdgpu/green_sardine_vcn.bin     | Bin 404288 -> 404544 bytes
>   amdgpu/navi10_asd.bin            | Bin 201216 -> 205312 bytes
>   amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi10_vcn.bin            | Bin 404288 -> 404544 bytes
>   amdgpu/navi12_asd.bin            | Bin 201216 -> 205312 bytes
>   amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_vcn.bin            | Bin 404288 -> 404544 bytes
>   amdgpu/navi14_asd.bin            | Bin 201216 -> 205312 bytes
>   amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_vcn.bin            | Bin 404288 -> 404544 bytes
>   amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
>   amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
>   amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
>   amdgpu/navy_flounder_smc.bin     | Bin 244902 -> 244902 bytes
>   amdgpu/navy_flounder_sos.bin     | Bin 222704 -> 218608 bytes
>   amdgpu/navy_flounder_ta.bin      | Bin 251136 -> 255232 bytes
>   amdgpu/navy_flounder_vcn.bin     | Bin 580112 -> 580112 bytes
>   amdgpu/psp_13_0_0_ta.bin         | Bin 263424 -> 267520 bytes
>   amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin        | Bin 259520 -> 263616 bytes
>   amdgpu/psp_13_0_11_ta.bin        | Bin 246784 -> 250880 bytes
>   amdgpu/psp_13_0_12_sos.bin       | Bin 410416 -> 439088 bytes
>   amdgpu/psp_13_0_14_sos.bin       | Bin 397632 -> 397632 bytes
>   amdgpu/psp_13_0_4_ta.bin         | Bin 246784 -> 250880 bytes
>   amdgpu/psp_13_0_5_asd.bin        | Bin 201216 -> 205312 bytes
>   amdgpu/psp_13_0_5_ta.bin         | Bin 238592 -> 242688 bytes
>   amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
>   amdgpu/psp_13_0_7_ta.bin         | Bin 238592 -> 242688 bytes
>   amdgpu/psp_14_0_0_ta.bin         | Bin 246784 -> 250880 bytes
>   amdgpu/psp_14_0_1_ta.bin         | Bin 246784 -> 250880 bytes
>   amdgpu/psp_14_0_2_ta.bin         | Bin 266208 -> 270304 bytes
>   amdgpu/psp_14_0_3_ta.bin         | Bin 278816 -> 282912 bytes
>   amdgpu/psp_14_0_4_ta.bin         | Bin 246784 -> 250880 bytes
>   amdgpu/psp_14_0_5_ta.bin         | Bin 246784 -> 250880 bytes
>   amdgpu/psp_14_0_5_toc.bin        | Bin 2560 -> 2560 bytes
>   amdgpu/renoir_asd.bin            | Bin 201216 -> 205312 bytes
>   amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/renoir_mec.bin            | Bin 268064 -> 268224 bytes
>   amdgpu/renoir_mec2.bin           | Bin 268064 -> 268224 bytes
>   amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/renoir_ta.bin             | Bin 46080 -> 46080 bytes
>   amdgpu/renoir_vcn.bin            | Bin 404288 -> 404544 bytes
>   amdgpu/sdma_4_4_2.bin            | Bin 34304 -> 34304 bytes
>   amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
>   amdgpu/sienna_cichlid_ta.bin     | Bin 378624 -> 382720 bytes
>   amdgpu/sienna_cichlid_vcn.bin    | Bin 580112 -> 580112 bytes
>   amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
>   amdgpu/smu_13_0_0_kicker.bin     | Bin 261888 -> 261888 bytes
>   amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
>   amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
>   amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
>   amdgpu/vangogh_asd.bin           | Bin 201216 -> 205312 bytes
>   amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
>   amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
>   amdgpu/vangogh_mec.bin           | Bin 268160 -> 268160 bytes
>   amdgpu/vangogh_mec2.bin          | Bin 268160 -> 268160 bytes
>   amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
>   amdgpu/vce_1_0_0.bin             | Bin 0 -> 48680 bytes
>   amdgpu/vcn_3_1_2.bin             | Bin 572368 -> 572368 bytes
>   amdgpu/vcn_4_0_0.bin             | Bin 403856 -> 403856 bytes
>   amdgpu/vcn_4_0_2.bin             | Bin 403856 -> 403856 bytes
>   amdgpu/vcn_4_0_3.bin             | Bin 359696 -> 359696 bytes
>   amdgpu/vcn_4_0_4.bin             | Bin 403856 -> 403856 bytes
>   amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_5_0_0.bin             | Bin 439824 -> 436048 bytes
>   amdgpu/vcn_5_0_1.bin             | Bin 211280 -> 211280 bytes
>   amdgpu/vega10_asd.bin            | Bin 201216 -> 205312 bytes
>   amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/vega10_ip_discovery.bin   | Bin 656 -> 656 bytes
>   amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/vega10_mec.bin            | Bin 268224 -> 268224 bytes
>   amdgpu/vega10_mec2.bin           | Bin 268224 -> 268224 bytes
>   amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/vega12_asd.bin            | Bin 201216 -> 205312 bytes
>   amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/vega12_ip_discovery.bin   | Bin 656 -> 656 bytes
>   amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/vega12_mec.bin            | Bin 268224 -> 268224 bytes
>   amdgpu/vega12_mec2.bin           | Bin 268224 -> 268224 bytes
>   amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/vega20_asd.bin            | Bin 201216 -> 205312 bytes
>   amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
>   amdgpu/vega20_ip_discovery.bin   | Bin 564 -> 564 bytes
>   amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
>   amdgpu/vega20_mec.bin            | Bin 268224 -> 268224 bytes
>   amdgpu/vega20_mec2.bin           | Bin 268224 -> 268224 bytes
>   amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
>   amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
>   amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
>   amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
>   amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
>   amdgpu/yellow_carp_ta.bin        | Bin 238592 -> 242688 bytes
>   amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 572368 bytes
>   168 files changed, 1 insertion(+)
>   create mode 100644 amdgpu/vce_1_0_0.bin

Merged, thanks.
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/790

