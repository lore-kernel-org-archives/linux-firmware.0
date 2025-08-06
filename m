Return-Path: <SRS0=U0BD=2S=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09157C87FCB
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Aug 2025 19:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC59EC4CEED; Wed,  6 Aug 2025 19:34:54 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61343C4CEE7;
	Wed,  6 Aug 2025 19:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61343C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYA/MgJYzFGRqLa9l7b1CNwgqpILAfyQN2nkFZr1I6bi08T0noZ/8Ebw+gDtg2MHFeZZLQ8+b0vkeXd1tCLolnViiw7JDuKRJtZc+ZnXVcgWcrJoMfOYnM6BfAbwCB5tzfuGhejGgMZoklUiPTHz/P+P/iXUF+/F9KjJWSESs8syzpITdVshB1xpolbsTWmSC55vHI9VgLmaGX3WqT8vjrNosqyPtgtT98p8wMPTddpla/FyDJg8s+rhOUrqsL6ZEk3RKDzneCiOUiiMa7AOBy25vKE9eTkB7wdb5Iu+rO5vGNMP5rJZVEX8hPu3jrXTXMG9tpA3aC8iU+ToaP7FDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp7ti/9Lnxc2x5PygB+QvSqpZo9jxU69D2WxPd+4v1s=;
 b=ELuqQSIynn+BvFK1XUnN1aucF8a0zU+rTWFWQd1GtZcC8xRkC46h5ijV4FYjQE9B385eiZpyaIu8ePVuZBWcucD8EroPcr7iCYGSTwU+ZDc6FWNwtaa69R3hxmEerQiNqxxne/hbAdkv+vdtpyb2Y0Owy2gcOlK6va+pnzr5s31YxFTPY1FCGG/2YrHz1EqFNXuvqw6psR4w6t31guLGsYpDd8LvVd1+0OvqRT9sWHzDTR8ItZX6317CuiNxhRVSGWobHy/H5d4XSZm5SsxY0DCTfGtMI+hrv9j2jVDgNKmeJJZ5YtLSRbo88e8raOrEoDc7vPnC64NDkQkUEcYX0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp7ti/9Lnxc2x5PygB+QvSqpZo9jxU69D2WxPd+4v1s=;
 b=CD/3wJGKxwXOzdUXNndT5lOALJyv/+qE8nskoC8vUgXCNXtAk77yrBo9rksVPSgU6macqQQTv3X+uRpKsIrghkTb36webVjze5bA4CVRx+NPrROh7vcGny6CaSa3vVoOL+WaCeVKohskyTH4s3moPJIV91dCH8wfVIHytSB4z5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV8PR12MB9270.namprd12.prod.outlook.com (2603:10b6:408:205::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 19:34:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 19:34:49 +0000
Message-ID: <66b60373-ae40-4f0b-8549-6724a607a35f@amd.com>
Date: Wed, 6 Aug 2025 14:34:46 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: Guidance on Submitting Firmware File >100MB to linux-firmware
To: Josh Boyer <jwboyer@kernel.org>,
 Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario Limonciello <superm1@gmail.com>
References: <57b6539b-b8c4-4adf-a806-d5e4a2da46b9@oss.qualcomm.com>
 <CA+5PVA76WGu2tXjxkSj9kEt_YS9zQ2BV1iYspWWmwjSraxoYGg@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CA+5PVA76WGu2tXjxkSj9kEt_YS9zQ2BV1iYspWWmwjSraxoYGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR12CA0020.namprd12.prod.outlook.com
 (2603:10b6:806:6f::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV8PR12MB9270:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ac2890-501c-4b6c-13d5-08ddd5204e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlJVeHZZcmdyTkI4V3RHd3I1Y252MllBR1RvNU1zTUt4UnFneEtJd3g1S1ZN?=
 =?utf-8?B?S1p4d0ZHenlWN1ZQUTVBWTJjWEs1bHpLMjdkYTJaUnJVc3dyNHVOWHVMWmlG?=
 =?utf-8?B?N3pJdVJteUdOUXpJa3Z3SVMzTVNLOGhlUXQ2QnpyVWk5R0Nobm0rcWppSHgw?=
 =?utf-8?B?Rnl4SCtIelAwK211aDJZVXFGQ0QzVVJrRzByOUtKdnZsbXBYWTlReVYxTzAw?=
 =?utf-8?B?MkQ2ckRKalVGQmlsb08yL0piazJyM0lqaUJNcXpCdnBodGxkMU4rQ3psY1Vt?=
 =?utf-8?B?NERsa2M0VDJnT3NUSVhtWVM3QWpPOEFuNzdZeWpyRU1ZWFVNeEJZMSs2T3N0?=
 =?utf-8?B?WC93NjdGbEZWNno1ZjlPSzVISjUzengyeDkvRVh0TDNINFpXWnhUMFAvbVlR?=
 =?utf-8?B?cEh5bklGbE11bmplK3dsVDR1TlNpcW9lS3FEVGFmcVhTRThsek80V3o4bWJ2?=
 =?utf-8?B?aEM0MkduV1NWT0ZsQkw3VDFCTnNvdk5CNVgrTlY0ekl0NUVvSko0Qm9EaXh3?=
 =?utf-8?B?TG9uTC93S0FYbVNyUlN5dTc3eFoybFRWMW1HbkZUejhyMDB3NUh4R2ZYelZS?=
 =?utf-8?B?UExBUWh4eFNUbTlvdlFBR1lzYUcxMUw4aWpnR2loZVZ1VHA2NkkyekxXSGhm?=
 =?utf-8?B?ZHRMQmdKY0dXckFnM2pKbTRzdEVQbHErN1huSnREbGxjVEpLSStDcTJNcjFE?=
 =?utf-8?B?MURuK0hLZ3Byc29wdWpGanpmbVlPQlI0Z1hQN0p0bUUwTGZTZlVzU3o5dzNj?=
 =?utf-8?B?VWlDK0ZtMll1MjdWRSt6bXRqR25DZ1ZOVHpIRUFZTjNyQ3hEREpDc2RzdUE1?=
 =?utf-8?B?d1dnVHlxZCs1ZEZDRmdxQWZuVnVqZzNxUE9MMHRnUG9SSWlaRnQ4emplNWhh?=
 =?utf-8?B?ZDhnakMrQnRBVWFpZXhWQlJ0Vm54cXFQbkdFN2JSUUNjcGZZQnNWMXhudndU?=
 =?utf-8?B?MzA5Sm5jL21CdVNPR3c3RGtKbE8wVCtFcmtYU2JYZittdTFoM0dQR2tkZlpC?=
 =?utf-8?B?WEtKb3lsT1V4ZkhVQzZmc2Q0WnZXd1krTjliQnMzZFBaRGFFYnh4eW9VZHJw?=
 =?utf-8?B?cTliMThXOFBRM0lvVUVpYkQ1Yjl2YitoTVpsMExDM08rV28wR25Ma09QV3Y2?=
 =?utf-8?B?MkN2d3Rlb0h4MXNjUTVOaFZrbVlXYkkvZjF6R1RPODRyOXBmaEw4ODZSazJX?=
 =?utf-8?B?cXpCeGM2OXNwdHNaenlMaXdpdnNWR0NNSm5SVS9FRVR1c3lnK2x4eWE0c2RN?=
 =?utf-8?B?Uy9Uc0hyNTNPWHEzU2Fwa1NRSVFtYlpmY1l0RlZlRkVySzJ6b2V3RTFiL1V3?=
 =?utf-8?B?M0JEUzdyeTNsc3cwa3RveHJ1WUZOMEw0RWxHQzh2anpPRGN5eWhKYVFLYWJv?=
 =?utf-8?B?RmlFdkFqTzE4ajJzVnd4em1oSlVBWkpGOU56WVdBa0cwSE1wMHc5d3dkVFdp?=
 =?utf-8?B?cXVvTmVVOVZiZkIyYmgrMDBtaUVMRVFzSWRxSmlwQWVZMXF1UjVWTTBMNEZl?=
 =?utf-8?B?amxZM3UwTzBwWFl2eE1RbnhnM3kzWjNsREFnYm1va3RaenNSN2w3dWFzSlVj?=
 =?utf-8?B?L2JYY1NBeTJIekhydzhtSHYzaGxjTHJ3V0J1dFFtRTNGRE1ROFROS3ZFYS9M?=
 =?utf-8?B?UXlQS2wzUXI5dkFlT3kxcytONEhhUndzRjhYVzVqYkJwQlpVRWoyTGlyYlB2?=
 =?utf-8?B?RVlqVmRHVk9MZlhxdjZ1aHAxdTZ3NkxLdkRBbFpwRUxSK2pZeE02TVBJaG5u?=
 =?utf-8?B?bXNxUmIyUk9LQUJwRmN6MmdsRldjK1lQZmxxdjhLbjdpNmZPZzFkUThNc1Zr?=
 =?utf-8?B?ZUpVT210Y2dJMUxUS2pMM0E2V0plY3d3WlFRSEN6NnU5Y2hIb01Gbis3K2Ri?=
 =?utf-8?B?dHlxcDlyYlE2YkFsVFBxUXNjNE92OGZnNlYvYlhmZjdIZ1ZLdHlNa2MxQWdl?=
 =?utf-8?Q?xu9DErWCPFc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFc1eFBicHV1czB1ZEVOTVJVQWsxdWkxbVhLUDRJOXN5QmdBRjhpdEFjYkRt?=
 =?utf-8?B?QTBBVHo1aWNqM014VWE3dzFELzdMNVVLdmd3NUJPV083dVVDQlZsVGNMRGtK?=
 =?utf-8?B?YXhMM2MxK2MxU0JWRkJPWDQva2RsL1ZIWWtwc05VZUV6QU9tdUFWMUNSWUVQ?=
 =?utf-8?B?Mnh5clA3NGFBUWZTY3BVck8xM2NJcE5vM1Q2b2JkWnZ0RmpKNTh4NTI2SkpF?=
 =?utf-8?B?bHk0ajhhQ1NmNWNWZUhHd3ZTeTdLMFJCL3ZKQmlpdCtuTkxIREp1aW5ta3M0?=
 =?utf-8?B?V0dnZzVscU42SklOcnF3RWtJSFhPbVJpVXFmUm1jZmhYcEJ6UXVoYjRSTitn?=
 =?utf-8?B?S2UwQlFVNVB5bnl3TWw5dmQ2YlVJN2pCeXRuaEpBU1pIU0ROWURDaTRaeEhX?=
 =?utf-8?B?SmdEekRBcjg4RkxxRzhkbDBBaWxCb0tTOEU1Ull0S1ZpdktpdE1YbFpNR2Zv?=
 =?utf-8?B?Rit1enV3QXRVSVpNOE0wRFN3S0MvN3pab3NVTE1FZjNUZWNUSXdCeVdSa2Vv?=
 =?utf-8?B?WEsxT05KTVBiVEVoL1pWT0R1TjA2dU1TYWZOdWwxUGRLcnFTQWkrSXVYR1Av?=
 =?utf-8?B?d2pnQU84cWFrMXNWVXVBK21NdHRDUC9jYVB6NXVyV2d4VXg0UWdIdGNVZ01i?=
 =?utf-8?B?L1QxNmpTcE5hb2l4Q2FRMndSczR1SFNzUmxVd1dqemNoclNDMS9zSVJzUlZH?=
 =?utf-8?B?VUFyeWxaRlBhc2tMclJoTGlUL2dvTmlDaVhzUnEyYUpLZHltcHdJMFhOV0hs?=
 =?utf-8?B?MGpQVlMzcHRyY0VwZ0VvVDJLTmp5c3AvTzVINERZS3BvV1pIaGlWbmVJSVpp?=
 =?utf-8?B?cnp4RktBeWZsa1JXZFVURFZJcmI3M1RkakRUaVpBWWdkcng2OStheUtyQjVy?=
 =?utf-8?B?NEtmVjQ5VVZweVc3Nks5dDFhcWgvRm9FWTVMT0FzcjV6WXloZjdvQjZPVGVi?=
 =?utf-8?B?aThsUVZma2tteEVINzRHZDE5OGo2Rk4wRHh0bmVlVjlrM2R0ZlNpUHc2c0JP?=
 =?utf-8?B?Uy9KVW9UVHo2aDlSdDIzQ2draDRhTmoraExkRnFlK0xTMjc0SnFodGFlSlV6?=
 =?utf-8?B?dGIxbXFCdGlwQ0Yxbzl5UEgwbVZLSjczK0pEdUhXc1lTM2FxWUFkM0FIWUx2?=
 =?utf-8?B?RHZXL3BGNktZck16ZXVQd3h1cXUrWE5CWWhaL0UvZGJUQk1qWmhEZ0RJbzZF?=
 =?utf-8?B?aTZpQzIyRndjVFROYmMrR2Nyd2RndFB3Y0pIclVlc3ZqNzdmNk9ZYTQ3Mzgv?=
 =?utf-8?B?NnZxKysrdE1PN0dZYm5uU1ZpOWVMOVBIbFNBZE82SkIyTUlsKzBMcjg4NkVH?=
 =?utf-8?B?RUwwOGh5SGxLQzY0d1FpczJkbURHdmF1RHJabGpDejVZTURoNVcvK2ltNHJ0?=
 =?utf-8?B?dUFia2lobVFJSThjOVhUUUpuVlgzdEhRZWROM2ZVbzNoUmZZWm5oT3ZpMmp1?=
 =?utf-8?B?WHh1cEM2QzRyUGlWdDZiYlg4R05xM0JHVDR2dktISTFFODJBdXRxSVNwMitC?=
 =?utf-8?B?YkpJalNYYzRuNnFoMGN4TkI2MG1SenlRZkZOcFZNaTRveFZDYUdJS2tzY1JZ?=
 =?utf-8?B?WjJ0YkxyVkFQOERqS0NVTmdtUTVYeTJTaUwzVFRCcmFNU0tUcGhaM0kxd0cz?=
 =?utf-8?B?cUZlSGJaQ1k3T3R0MzVxbHFBZTFBSWxlWTQra2I1WWdUbGZlTHBVVW9oVWQ1?=
 =?utf-8?B?NmhndC8rNUxjUDNSVHlSM1laM0xBR1k5b2UvSWNCcjg3QVJLWGZ0M0Vtc053?=
 =?utf-8?B?d1p2M2krOVdTUmdNMHhGN0ZBTFZwWlZ2Z20xMGF5RFRSMWN5OVBmdTgyajY5?=
 =?utf-8?B?dnRldU5PU3d6eHhiMzcxOXkwRHJQK2RLblVjTmhlQkVRN1dwY2NoK1ZLME91?=
 =?utf-8?B?TzNOeFRPS3FVbWlJTHhhOHZZY0NDUlB5M2VCVkpmc0U5eG1wN1lacCtpY0dh?=
 =?utf-8?B?cUExMk5qTWpFWVJsNStWUkh6Skp5R0RJQWdTbG1jL3pybkdSU1ZTcldaSHVO?=
 =?utf-8?B?YmxqV2Z3MGpmWmJybXIwVmkzdGZGNkkyd053UkJVNUs5dkZ0NS8xVzhJckNn?=
 =?utf-8?B?ZGZoOHRLV21GcmxFamF1dldUWFg0YXAzZ0lTMzFwc0FUQmlxZXdnd3pBbm1z?=
 =?utf-8?Q?O4YlM1D48lyeUzSHTpozkh3WC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ac2890-501c-4b6c-13d5-08ddd5204e82
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 19:34:49.1970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xm6ERpvCzSwQOiGz4S0qd/zqLacT4XtSsZThWmHjfbMJXd0vRD6NbpDTltPsoNJMNhRpcT3AGTOk8ixhUl3vrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9270

On 8/6/2025 8:21 AM, Josh Boyer wrote:
> On Sat, Aug 2, 2025 at 6:24 AM Kishore Batta
> <kishore.batta@oss.qualcomm.com> wrote:
>>
>> Hi Maintainers,
>>
>> I’m preparing a contribution to the linux-firmware repository for the QDU100 platform, which includes a firmware blob (qdsp6sw.mbn) that is ~110.88 MB in size.
> 
> Obvious question, likely with an obvious answer: why is it so big?

Yeah I guess I'd echo the same question.  Is this like a recovery image 
or something?  If the hardware takes this image and spits it out to a 
SPI chip (or similar) it would be much better to flash it with fwupd.

> 
>> Since GitHub enforces a 100 MB file size limit, I’m unable to push this file directly. I understand that the repository does not currently use Git LFS, so I wanted to ask what is the recommended approach for submitting large firmware files?
> 
> We could enable LFS on the Gitlab side, but I don't believe kernel.org
> repos allow this.  I can follow up there.  Assuming they don't, I
> don't really have a great solution off the top of my head.
> 
> Mario, any thoughts?

That's right; we asked about this before and there was no LFS support on 
git.kernel.org.  The options that come to mind to me:

0) Beg and plead for adding LFS to git.kernel.org
1) Abandon git.kernel.org for linux-firmware (move entirely to Gitlab 
and turn on LFS)
2) Come up with some mechanism to split up firmware files and let them 
get reconstructed during 'make install' time.

But all that being said; what system host architectures is this firmware 
actually intended for?  I wonder if this also pushes our need to start 
indicating which firmware goes with which architecture/which subsystem.

> 
> josh
> 
>>
>> I’d appreciate your guidance so I can align with the repository’s standards.
>>
>> Thanks,
>> Kishore Batta
> 

