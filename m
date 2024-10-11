Return-Path: <SRS0=4teG=RH=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F98CD0D7BB
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Oct 2024 15:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FFB8C4CEC7; Fri, 11 Oct 2024 15:25:41 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19826C4CEC3
	for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 15:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19826C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwY1ys70lv/IRhhb2Ve6I2SXbbkXFffLRIDcaXIjbuZ3jJxJYSL04AEG862FOf/+uluWHHJl7KF2SILuFn0XygbIoUoZUxmvoCDUVfcRm2QPmSUDU+dEJCIK30miJyF9ONwmSxP3/+st0D6m1X4k5v41wtYBWAJd2VUUbroMh6S8va7NXHdyP6dLb/7XOUOk+ZYZIhkySzt+5NPePg7T2QmQdQnPav6y+uEl+mJfzqEnyuU0vQx7QsvvsZJ0vxogBbhOMhOzAi8e2Xc9hGQvsjeNtG1U2ovGeH4HmI5zW1X7MrCdr2DViSvNkFG+7xd2B2vah0eUuagYlL/PkqDvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDC/ZKbhnroicgFipZaEHV01ggEWG5ZnNBGgQMQH7+g=;
 b=Ri5xXJa59mYChcuBuRWzep/rSKl38iYk8jTrhxcvP9FmEmqmIs1duQY1tz6gMM+RMY60gnUaJ0iVKDyNb/+w0vJKHV27VW3a0IDxJuBl0bKSW/c336uy+t21o3KN0FE6UbPVCox06wk+RupvoZxfdYjGuRrli2QCxDmjDiTcdhVUgMbLEv3Uo3WVeb2vn3vOBa/dIEvhUj0lsNjIvVnZrpOYVc76NmDKSdvf2lL6y+1X/qpkF7dyxUMVCPU7V5hZ7ZbQSja9O4+LVIkh9afweJalSTJw5ixTC1TtjKi8dXoOLunSHDUAwgqA0QPZf8uDxpLdZ26cvcCIHVUInirlLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDC/ZKbhnroicgFipZaEHV01ggEWG5ZnNBGgQMQH7+g=;
 b=crhLR64fOiXTrEhpggmPBo3D+UKSs29ho6GJxVcg5acesA+bO1WHPwazanrAtU6iRX9sZCnbyxIxM/Pl1dBvS8xKKXAEoGyeVmFrzkrcEXkkt2Hec9tSNSbgtem/n/v6F1+GabfW2YdGYBTE8zL35ZFa9upsEvW/cd5Y/nMopU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8537.namprd12.prod.outlook.com (2603:10b6:208:453::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 15:25:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 15:25:35 +0000
Message-ID: <1508be71-8086-4551-878d-f59acc9955b9@amd.com>
Date: Fri, 11 Oct 2024 10:25:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: mtk_wed firmware 20241011
List-Id: <linux-firmware.lore.kernel.org>
To: Shayne Chen <shayne.chen@mediatek.com>,
 linux-firmware <linux-firmware@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Daniel Golle <daniel@makrotopia.org>
References: <20241011151424.30750-1-shayne.chen@mediatek.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241011151424.30750-1-shayne.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0036.namprd08.prod.outlook.com
 (2603:10b6:805:66::49) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a902f2-a872-48c7-593c-08dcea08f3be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anQrMHpMbHZ0UmhFNWR4QU5zbkNDZC9oSi92bEpOSFN0L3VpKzI3ZGdqbkUz?=
 =?utf-8?B?c2tVQXkzSWNsM3ZnMjN0QW9Ra29EY09QVGttV1Bqd1pWR2h3S1M2akhkTHQ4?=
 =?utf-8?B?TUdGcjMrdWxTd0FheGVyd2Y0WThzbDZXMU93N082UGYwNldkdFRIL1AyMGNS?=
 =?utf-8?B?OXVVaCtUOGhGMTIzck00dm1rN3g2RTVHWjl6SlVkTlR1OXU3WWExRysrMWp6?=
 =?utf-8?B?YTFiYUtjQ21QaStTK1JCMis5VzBaZVE3RVdGVWppYklLaUlVUlRQMmY5SDhF?=
 =?utf-8?B?dU1CYnpQdGZRMDRwTjFHcnJiWlRHbnc5b2ppWG5ZMkhIYVU2MU1sUEVjeHJ2?=
 =?utf-8?B?ZU1qelIweWtqcjJTb1VTcDZjd2ZZYUd4bVROVnh3Tzg5SVByaThFODV5U24x?=
 =?utf-8?B?QTdySU9nOFg5eTRRRzRPOUVUSFAzRlU4QWE3RXhyU3pwMVhwMDR3UlJXUnhp?=
 =?utf-8?B?cUtEUXgrR1pkbTcrNFkwNXlzS3cwL3hIbnNlK2JLcVVWaDZrTmMrYzR4ZEha?=
 =?utf-8?B?UFdRcDVtL3BpWkE4UCt2WmxBczQ1c0M5dlBFL0F2Sll0aTNEODBSOUd4dFdq?=
 =?utf-8?B?ZkdMMVVVVGh0QTcreVVHdGhYa0RidVp6ejEveFE5QlFXLzVVRGprbUhIeHVT?=
 =?utf-8?B?cjd1WCs3NDZ2aXAvaHRSZHRpMGxjN0VEWjFNeStSQzhKcUNTUEhaeEh6NjB3?=
 =?utf-8?B?STR5TTQ2SWloeFZzdEVFanFoK08rT3RIRzRBNGRmaC9neDVNSkZ5QzIyM1Zl?=
 =?utf-8?B?QzlYbEhRcTErM0R1SXU3aEFVYWxkWXN1RXRWVXgySVo5enJBZ0Uza2lCUjlq?=
 =?utf-8?B?QXZ1ZHRqaTRmT0krWjlxMlZ6MjRXTzhJcERuL3Y3UTgwbkJrajhKbXdHS2dR?=
 =?utf-8?B?TzArSCsyV1VybHdJMFZ5MG9VVmpsQ2o0UG4zc3h1QklnVURBK2hBdWl3TlhJ?=
 =?utf-8?B?OE9SYzd3WlRJS0h5V0tsMmRmNitERzN5M1cwbUZxeWNjckpSb01nNE4vaXN0?=
 =?utf-8?B?RVY2UkVDRDR0SHJYNkE5eDBHK0FrS3lVTjBLNDNDaS9VS3RpVy92U3ozL1JF?=
 =?utf-8?B?MEIranljTmoxeUpTeUhscGUvVXZVZzFkdnFMTkZrZC84aHo3dDZkNm9Rc1Ey?=
 =?utf-8?B?WG51VTl0NWRpU3pkckdGTlRVZnh4by9oYjlNbVBmcS9xV2hVVEVCVlEreWhQ?=
 =?utf-8?B?RExzSytUMnBIQlR6alZBUS9QRVJDcllHclNibk1Xa0hxNCtEUmd1MWtiR2NL?=
 =?utf-8?B?TzhicXFNR21TU0MvbXNDTDdjRVZkU1dKUnhySkZ4ajZqUW9wZ2dHazhuWHhS?=
 =?utf-8?B?ZGZLR211M3BQSWoyWWp6MW1zMjR6clNZWVpsdmk3YlZMVFh3ZUdIV3kvNnFT?=
 =?utf-8?B?dWNraXBsZHFucG9oTWswOUxybUc1UmlnN0pWRjJnbWJ3OTlFRExUQjFNbnFD?=
 =?utf-8?B?RlBlQktXTHZaeUtVbS8wQVhTUGpiVkRJbjMvNVBLVzJlTEcyc0ZqeHlENDVR?=
 =?utf-8?B?RUJLdmdyaWtPOGpYMUk1cW5uVGdjK0hRVXV3VXNXZ3pjeFpvL0FiNktyc09n?=
 =?utf-8?B?bEpTM2ovbDhuYXE4OHpMaDMvZFZkNFpML3N1eGxyeXhWVzZkVUpUclZzdUdj?=
 =?utf-8?B?SEJNcWVkUks0SDRKdys1eUZEbzFxdmRSVUcwR2VXRmg1Y2RnVmpGUUQ1SWFj?=
 =?utf-8?B?SlhDSVFMK2tTY1ZuTlkvc1dLc29LbkFuVC9oSXFGaGdVNlJpeCt4czV1WTVP?=
 =?utf-8?Q?m+9xrpoQHRP1BRcBUY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3Bab3AyVmtDdndnc0lBQy80aW5qSGZhQ1FtNm45aTF5VEIrTUNBR1BzTjZC?=
 =?utf-8?B?Y1IrbkkxNmNMbHp4bkRtWk8yTjhDR1hEWU0xYlNQVE9PYnJENmJYVkNiTW5l?=
 =?utf-8?B?MXF0STJzRXg1ZUpXeDFKZEtqRnE3WDNtZlZ3WjEzbkpGOWpJalRORHl3N2xt?=
 =?utf-8?B?eFk4VWxFWXY2cjBZZlJKK0s4R1VzWE5jVUw4YXVMajc0dnd5WVl2UVpOZTJC?=
 =?utf-8?B?b0NyZkJjM1FpMklwaDZPRnR4dnc1Q2tSbU9xRE9tQ2pFRGNTckdxb2lPS3JG?=
 =?utf-8?B?a2d0K0dpa2lJSU1mV2t1WlZ6WXd1ZG1KMzdPbUJFWUhPcG1iZUxpUzBCL28y?=
 =?utf-8?B?aGh0Uk1EOUJrQlNJTEdxRXFOVno5YW1DYjduR1VuWEkrR1FrK0hDMTh4Q2ND?=
 =?utf-8?B?S3lTVVloOWR2ZXJyY2JFVGI4cnBNZm84aVlJaXZjTG1mcTF5NGU4blRmanhH?=
 =?utf-8?B?d3IyNVQrb3VacXFRM3FmemJwQmZ5NlVDWHl3RGM2dUloUGlGZ3pCYTd0b1d0?=
 =?utf-8?B?TkhTdFdBSWZqU2RiM011NGVRZ2k2eVIyajFyQW9xeEdLT2JZOC9QblVWWGZ0?=
 =?utf-8?B?blZyN1RhclJoZnM1RGU5WmpHN1ZQMUpnVHIySm1UOG84YnNyZDRZNlRHNjNs?=
 =?utf-8?B?RW5ZT3l1OUdBWlhDWWVhaVBvMkdQSVJnQ3B1T1NjcjErTHV4N0NYY25UZit0?=
 =?utf-8?B?NXR5dVVpcEloRlRmMW0yR1R0a2oxQ1pDbERsZkw4cWV6N3FGU3doUW1hSkFY?=
 =?utf-8?B?RVgrME52TUtFSEQ3b0JOS1ZYS2srblMzS2NCTjB6ODFCVXpKcEF2cVMvOUJr?=
 =?utf-8?B?OXdEOW14UkVFelBLMjBHNUJudFZjemhyU0dxd0Zxd1RsMGhaSlJQamIxdGFX?=
 =?utf-8?B?T3pObzBSeXFpYmFjbmozSDczMmpmZ3N2QjdiNWYySTFNcU0waVF2OW9mbHV4?=
 =?utf-8?B?a3ZTOHJPbjhlMmV6RjJTanVLWGZsTFBUN1VOUDh3dnF3VGthd1N3dGxia003?=
 =?utf-8?B?ZjJjend3VUNXM1pCek03dThuSE1IQnQyNXZOeFZMTWhUQnpmMEVoVy9tb0dG?=
 =?utf-8?B?WjMyVUljZXB6ZS8rdDRTRlN4eVY1NDhYdFpRQUQ4WVNzRzhTZGlWQmcrNnlx?=
 =?utf-8?B?enA5VTJOaGNYNEg4NmJBS0NQU2V1THZBWVF3YncxaWIzb3pabjFlUnBWS0U2?=
 =?utf-8?B?OE1uam9pUmNXZE94VmRTZEhPZ0g2U080bVhyNVMzUzJxdGk5OERralcvdU5G?=
 =?utf-8?B?UDZPZ2FIRUtiY3VrSVAvS1RvVTF6WEI3dngwUW9WNHU2eDM5S3FvcW5qS2Ja?=
 =?utf-8?B?Y29rS0wyQ0xIV2M5SGV6QXZtSkVYczcrZ2tTMGlobU9CSktieG9OQ2x5K0o3?=
 =?utf-8?B?R3VwNHdPc1UvWW51ZURsSFJIWFIyeWZrOEQzL1NzMU9zdVpXdFpFUk1lUks0?=
 =?utf-8?B?bTAvOS9TMVUyWVZrQllRT2Vtb1VWL2xNQVpjWU5MMGdJNzE5STVwZ0ZqRTRx?=
 =?utf-8?B?ZExIRFZ2QlE0eXdrM0lYbFhsWTVVZzN4Z0ZveHBzQ0VDdldoZ2pHZHQ0T25a?=
 =?utf-8?B?eUU4bHdYM2wydjZPNEFjOGV6ODkybFIxZnV4NE1zQlpydXhsRnl3eUhxNDVK?=
 =?utf-8?B?aTB0ejJwaFcvazRjb2RhbUJsK0J2a3BoV2IzOVQrUjNhRGFLT3MveCtYam9E?=
 =?utf-8?B?S3R6OCtZaVJteTAweEsvYS9uSi9ibGR2YUhEMG9VQWlySnhGanFvN1ZKNnBX?=
 =?utf-8?B?d1ZuQmhsaTNHNk1CNlowV3NIVXZJcS8xa3NQZkpvNFVCMHowMXNVOFJHRmRG?=
 =?utf-8?B?MmRVZVpMdWZBNFVaUWEydDV2VTF1anNnVXJkYVJZSzhRekJxbHZkZXJ5aVdU?=
 =?utf-8?B?aStHQmhjSkhmTmVoVmp0Y0VhOW5reFJoMExLK2FJdVlUWTlpUWhhZ2c3eU5K?=
 =?utf-8?B?aHhjYnczYkhyNWFuenM3anR6Y1Niang2QmVEeWxXSGhNQml6bUhybmRwNnhC?=
 =?utf-8?B?SjluNGlZZDExQlF4anVQcHFlc2RieDdMU2RBMi9SbkxFTWRSY2RDNVBVb0xj?=
 =?utf-8?B?Tk1ZSFBUNFM5aVpHRkYxek5UV1d1eC82MXlnSDVLWlowbThqL1BEeStpQmRl?=
 =?utf-8?Q?KTjap2j0AW33yNzN74kharjk6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a902f2-a872-48c7-593c-08dcea08f3be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 15:25:35.0908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8n1YUqSjDdq4naRPSaP3vTx0EXTQZU8usyeRLW/04/e2eOxUaOJw7qlAbSUegNfYLPD0VsElCZX63VEMQPStyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8537

On 10/11/2024 10:14, Shayne Chen wrote:
> Hi,
> 
> Here's a pull request for adding firmware files for mt7988 Wireless
> Ethernet Dispatcher.
> 
> Please let me know if there are any problems.
> 
> Shayne
> 
> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
> 
>    Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
> 
> are available in the Git repository at:
> 
>    https://github.com/csyuanc/linux-firmware.git mtk_wed-20241011
> 
> for you to fetch changes up to 8f2f0386630da115daf11229b4543f6672d8cca5:
> 
>    mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher (2024-10-11 22:22:35 +0800)
> 
> ----------------------------------------------------------------
> Shayne Chen (1):
>        mtk_wed: add firmware for mt7988 Wireless Ethernet Dispatcher
> 
>   WHENCE                          |  28 ++++++++++++++++++++++------
>   mediatek/mt7988/mt7988_wo_0.bin | Bin 0 -> 107816 bytes
>   mediatek/mt7988/mt7988_wo_1.bin | Bin 0 -> 107752 bytes
>   3 files changed, 22 insertions(+), 6 deletions(-)
>   create mode 100644 mediatek/mt7988/mt7988_wo_0.bin
>   create mode 100644 mediatek/mt7988/mt7988_wo_1.bin
> 

Hi,

It fails CI.  Look at the details here:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/324

In the future if you can submit the PR directly to Gitlab you can force 
push in the future for any CI failures.

Thanks,
