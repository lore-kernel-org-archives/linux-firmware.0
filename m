Return-Path: <SRS0=4huJ=JM=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD88BC4828D
	for <linux-firmware@archiver.kernel.org>; Sat,  3 Feb 2024 05:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A3E5C43390; Sat,  3 Feb 2024 05:14:32 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 472B4C433C7;
	Sat,  3 Feb 2024 05:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 472B4C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awYiOFRMK/dvjZPmPlADCOyyjdP/g8mV8FLTAB1/TQ04RNsrauSzQG5scbkA/S2qslkajBRjAVtoY+cPrlWpGvXyj3WV6n9RQCvz7QvaB7GC0NKnsqsa/sXqJea8mIgCru2j/BAJqr0e+tD2EFdt4DJXZgQMDd9ThTzDlkwSLSEpmtyX+4CznCIihIXlFR53xC9Qefnd1Qbym/XM6xJPHRyfoaJRa7seGSSmMTFMds6LRzy/CNTjqA0ytEhgWDpc/KOrtqscFTLB7r25S5qsOTyXZu73GYaz4rcmdwZTAjTdZAKlftiu9DfLdFuSPptquO/Bu3mibKvtj0/EyUsecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DpEMOHaT3/wRZFMXuQshhH2g8H+t+K5OET+q3wOIS+0=;
 b=WfYfQn9737NElrg5SB0XB++ONoNOGxGof4tU7xhO646VlsM55e/rLzeBaYmNKEVyWViO/uEzYZ2+EkPxG+iEhQ/8M4SIy2UCdOkZtgB86MA5cFC75E2AzK2327JEF9H7UkL/zU5spxK2kMiMJ94Xiki4CPBABtC9C1HRHSRHRvZUY53YLpLp8Lvy5A482wiPpXQLGocmYJbphLUY1dXUgT0qGCny8PfMVT6RTghPsdjcRcqbTNzsOGkbuBYAxjdB3db3O3yTJ1L/pTdPMWXSI2axRs6qFkxohuTlANKYPsgdtCu79/5oX9XToCd9N4hle8cjxIv9OjtOwWAIpxDdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpEMOHaT3/wRZFMXuQshhH2g8H+t+K5OET+q3wOIS+0=;
 b=WTf8NH1yWYSDVIGz/39aeV8rb9nITXwvAs3jUlXfOwAa+Z+pnEfZkYKOHoW6nAipqrPpGaT5aFmBQf2R42SV/C1bQwecCUEA1f7iizacH2GZQOnNnyO62+PAUbIGI13GOSMgLzBCIgX/ylNBYsRjCtX3oH+UEZ2nWIa3dvlRpXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB5057.namprd12.prod.outlook.com (2603:10b6:610:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Sat, 3 Feb
 2024 05:14:27 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7249.024; Sat, 3 Feb 2024
 05:14:27 +0000
Message-ID: <07ae9599-fca9-4080-8d24-c88092a1f9cf@amd.com>
Date: Fri, 2 Feb 2024 23:14:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: pull request: amdgpu: update DMCUB firmware to v0.0.203.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, Josh Boyer <jwboyer@kernel.org>,
 linux-firmware@kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Deepak Sharma <deepak.sharma@amd.com>
References: <20240202220041.138919-1-hamza.mahfooz@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240202220041.138919-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecdf41e-c327-4ae9-7884-08dc2476fe5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8/PQCxSqgrGiY/Klb6I3zGgqVIWg0+XcfIRhzUggFMFAc087XUmEYtDMH1WgbbWFoYIGiqVI/kmIlMHi6+uGlvnUkjI06Fw4rgDLfveMqx5ZuGlM00cOdTVDafhpSApwrhjsroYrXP7GbNhny0d6JNCxrnB3R7dGyAXk8gBUvA2fU3ALICBW8Xhk4RQad0Fe9js4SaJQxqvCFLZakJHQD2Bj9ZOUOmqtZAkJCZjqN/l1PSuXGQRKB7s9X6RCP/pc+wv7BtjKW7/46D2GTGwUBNgK+pk+upCet32hdwVR/JS+ohHs8O2jMzqpN+FUVUSLr8H2KJ/gXpxmPCFU30p8hPHFzYjilFFl4xzG/NQy3Qs8HdTiqDooYCjTydXg48kBLNn1bI8creyLWCa0ZlBUrXaKxL5s5NY96ZJCfTByv+wMfXXJI/z34Shmt0aeg15NdVxIMAX8khxu5T9AMseMTJsCD15YqnFpMdIjlxWE4S7LPHEEMrEE+s9QVVgpz9DHJBu5JrDd88Gd95YwzoAyVvGiVFAIshoT6xSvK0GHSrzUaGzdSIbs7dYHE02hCck+l+s9AY1vb7ikPBbVu+yYhABiSww364U5e6rnZfukio8Pln9riQ6L0SubtEwux+AQ7yUPMTSKfODElgjVWAR1FA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(6512007)(2616005)(2906002)(26005)(38100700002)(478600001)(6506007)(316002)(66556008)(4744005)(66946007)(54906003)(8936002)(66476007)(4326008)(8676002)(15650500001)(44832011)(6486002)(450100002)(110136005)(5660300002)(53546011)(86362001)(31696002)(41300700001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0V4OEx5SmhIeHNxRUViOEhOWkw2aFpjUnlQR2F4djA2d2psZi9ZaCswdkdu?=
 =?utf-8?B?TlF0MHg2SUVMcUduY0cxeldJT3NNZGVyL3liaFJWZ0xFTGV5VytCTDZSSlp6?=
 =?utf-8?B?OCtiQnJ2ck5Tay83ZEtBK29GQTl0Nk4zTTE3SDFNeVIzOFhoZ2NLMjhNdjN2?=
 =?utf-8?B?UFJsVVBTVTgvemJrS3RmM3ExK2M3NHp0ZHpHY0FDR1lkMUxBTjhOdFE3b0lz?=
 =?utf-8?B?a0VZVEdDRjEzaTNNSDZ3eHU1RUtkWGZPcVozOEZWRXU2T3R2Vnd6bUdPWENv?=
 =?utf-8?B?OTJmS3Axc0xCc3NISEQweXplWTY5eW1GcTk5U2hWWUxyVERRUjV2MktwQmpr?=
 =?utf-8?B?eElvaHV2eEpNblZwUkh5SW5NSUlrakdwaVFQeHNOaklLWkpSM0oxa2JQbnUx?=
 =?utf-8?B?bm5aZjU3Zisxam03ZlAweTBab0pONVRVcTJTTEZQYTF2SzRLK2RCVUI3UzB1?=
 =?utf-8?B?NEZzOWhRcCtqS29ITWQreXJTZ2tVWE12ZU00bzVMRUVsUklaY05WTHIvSHVO?=
 =?utf-8?B?TlZJVFBvaERUWmdoYjU2Rkt4aDBpYWdWNS9UYkZqWEVHNkV6UTZPK3dyekxh?=
 =?utf-8?B?WmIyR0tVbm5ySy9PcWF0NmFJcDIrV0VVZDlxMmZibnZhMWtkUmJIekJYd1FL?=
 =?utf-8?B?bDNYUnZpUTlMalROelBjTW9HRlkvdlZucGdwQXU0V2lnZ3hzY085VlRyem00?=
 =?utf-8?B?Wmw5K3N4azhNekt5dk9icUVHa1d4a1F3YWIwNStER0ZXeWlYTWRuZDd2ME1r?=
 =?utf-8?B?UDZOQXVLYUxxaTdJWnA2S1FBTlhqMzYxRk82M1h1eW15djhha081QnhWaHFq?=
 =?utf-8?B?OFAwQ2ZDUUJsOUFFMU9aTzliVE5EeSs5VG1hUmZmVG1PaFF2cG0zbnVDZmtr?=
 =?utf-8?B?Wk11NmRMRHNMbEFMcGptYVhSSUs5blkzQXZXRDlWRHl1VnhuVU04Umkrd3Bu?=
 =?utf-8?B?K0VqMWRFYmN3M2JsSkdqMG5ybEdtbk9KWmNZNC9ZaU5icGZ3TlJ0d0Q1b0NK?=
 =?utf-8?B?Yno0WnNjQy9qWTNITmhhOVBJSHZ5NmpNdDRUdjByWktmeFk0S2dMcExkT2xu?=
 =?utf-8?B?Y0ZTdTdhNWI2SE0rQVBIYXl5OW52eS9BdnZpcGdpR00xWXp2bkNrTGtPcElw?=
 =?utf-8?B?WDFONzZ5Q0lGUjVBaEhvVXc2TkhWNTZoNE5iZlYvN3grOHU2bDllU0ROaVNS?=
 =?utf-8?B?NmEzRktEQzBEUE9kbE5Qa25saTFqWkI2cnRtVUZnczdkbFJrcm12S1hwcSt3?=
 =?utf-8?B?OVBEcmZ1QSs0WmtuTmdERjB2LzBWWW0xUmFtVWR5SGtJK2ROQmpPL2pvc3hO?=
 =?utf-8?B?eEowMjdWRFZQQndGakZKM3lXMWtKRE95NHQweFBUWHVmTm1sMWFDR1V6dnpn?=
 =?utf-8?B?SnQ0S0NySDRLUWsvWnl5V1I1Sk1QNkRURkw3N0RUMnl5Z0RnY0RhaWNXK0pD?=
 =?utf-8?B?dzZua2tpWGp4N3N3ZllzanB3SkU5YkN6d2o4alFSMi9kWXlYQkREaVZoN1ZV?=
 =?utf-8?B?RzZOWmV4eFVTOTE0V0dCN00xMFArdGZieXdkVXg5YmFxN2pwdHNKRXVoOWh2?=
 =?utf-8?B?LzdOR1puenNFY0VLRDFzT25JMytoOFVPN0VNWXpJbTVKKzRhVzVZaVJXQ2p6?=
 =?utf-8?B?ZnRlVDFBbG4xTlNCUk9vRHJTeE12OTN3RVBtaUxSc0U3b3RicGFRUWY3N2Mz?=
 =?utf-8?B?Z0F0cSt2Y09iSkRrVmliZW0zc3ZUVTNrL2pvQSs3ZENvTWErNUE1U0kyY0ow?=
 =?utf-8?B?N1h3Q0ZCS2ZuVUFVeVo0NWJwQktsWnlvNklweTgwenNhOUQyejExOUdlZ25P?=
 =?utf-8?B?aExZWTdOMTZUOHpTN1c5bU1zcVBqemFpN2MwdDMxYTJzNmdBcTg4bVJsZlJD?=
 =?utf-8?B?dXJwTXdJekMrMWlxM1BqUzUzbTdPdnV4NGljM284ckdKOWY0aGUrUGJnQ055?=
 =?utf-8?B?UVpXd0ZxOXNQNm1HdFRXcncxUnlJcDRyNzVOandsNHdLREMzeXh0WWF0cXcv?=
 =?utf-8?B?cm4zaWIrZE5uS1d5OFpRaGxDeGhJaDZOTWNvbVlWQncwdDhmNDFEeDU2UWFi?=
 =?utf-8?B?a1lCeTVLOHYzQWpKdFFBMUhHL3VDZDVkZitQQ2pjVGkrQ2FicUorNjJFZFFs?=
 =?utf-8?Q?oijuJoFJbBAVBJXUkGwtC6QKt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecdf41e-c327-4ae9-7884-08dc2476fe5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2024 05:14:27.3988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6CcRf6teTcgol5qw2EThnfZEgLLH82rcrGe8O/ou71xWZvRiEBHldFJEerLCcUYo3aZtYsxuDdtJSYn/PpwLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5057

On 2/2/2024 16:00, Hamza Mahfooz wrote:
> The following changes since commit bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:
> 
>    amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-02 16:58:17 -0500)
> 
> are available in the Git repository at:
> 
>    git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-02-02
> 
> for you to fetch changes up to bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:
> 
>    amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-02 16:58:17 -0500)
> 
> ----------------------------------------------------------------

Merged, thanks.
