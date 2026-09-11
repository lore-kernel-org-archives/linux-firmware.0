Return-Path: <SRS0=iMex=HD=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D93BC88E4D
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Sep 2026 16:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 258591F000FF; Fri, 11 Sep 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.20
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789144956;
	b=REa3Gv2Jxq3EDN2w4gCCzoeYKziQ1iAHNSmjsY77cmo7nOsXoKckqUcebsElD7uOYHmM
	 UtG5MOGFpfuNmmfk+RuRRQpdBVdtv3bIYgh8x2PaMUYkEhZjTRR44+y3D27ChoOjr/PA6
	 iKN+CXwnx1R40LZa8lgYRNCFt3hKl7mzX5Vco+LbBpl04qFnHLmg549Aq6NNFdDZfdOcd
	 Vd/pFwe7sj72G4R31cS9QoeFH+uUcqEp81TxsNylsDHtifubC6qjk3wyePAHqdz01TNgr
	 iPujtHMF2Enj2A+dhirbs6Qs4WFD2vSii3mVTMP9BZ7UdkYITTzztLrdANNPkWkMRYg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789144956;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:List-Id:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ya/mykI9TTV4oEiGgP3fH/QhlLcGBEiGEU+cRfwzU68=;
	b=ycSDzERDt51yKdaFGc7/P4zc5t0f01d9CdAplHX9IEHGD4EDzT4j59Bf5VH7z5lzHj7s
	 C3Le088bHnwvTSOaFblC1k5JOYicnZ/GB8DZNTCzqWKVnGmt2L+vBz9z1Atif0X8/fitP
	 KAtMTuvn+KwbVBdx4WQ4QlomA1Z4U3RixknTSIxUqMxb7xhlFNbafMHL1VEL/+ghr1ouy
	 hrhrxrm8TvX6c1mLZBZuhnQeAHaUM7gNMnjcxQbtiRPSodHWIU8/YyN/BHlpNmvOx2dj3
	 v5xm+NV7U8OPswx7IPzfO6AamDtqCOmAVEo2qRKIBuDHMkZ/zq6/LxogWseeq8Eo5Qw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Rth18xp+;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.20
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C9D21F00893
	for <linux-firmware@kernel.org>; Fri, 11 Sep 2026 16:42:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Rth18xp+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4C9D21F00893
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4bszXE1CeBj1z1p/m1moCR2bZ1G7cd+HQJDY9oQlyNEu/Agf5QLY9uj35bH1zikdxPPPL5nqid0i/lRnu+fXJCd2UJA+QN3EgSq1e9bDt46OsMsJU2rBy/GEpjgGNnCoQJFnjy6n7CLhwjcMlnKKfsR26cdjja296zA2d6rMCKiaIfm6lw9e9mvd9ZA7if1xZ6lmaazjfDnUv/jf2LsqwqTUGDasqdo8aqTyDMOly573nt3ycEF3tefX9l3NNnvhkc+ZIVUNlCd3PwLleGhxe6k5homfs/5jGEdrmyhuffdgU7yJcWwbf4IZTblG6SJzbqCaZDwZvV2NPrJcMYY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya/mykI9TTV4oEiGgP3fH/QhlLcGBEiGEU+cRfwzU68=;
 b=HLLGIqNfsoFKKZ/0G1lGNi+0T2JFHS6hou5Ll1SAEi71nUgv6QeDeiTPPECY3hUMhx4HZqsJ0O1RhzK+ThpRhaqoFLA++rdnIwV+bnsZ6bYhrb3PyU5mDmyHJ6qQZ+fAFVzVc9sb2W1cBn771fxF5VhQcD39p0tCwZ/DAJkySBAoklDcoFIB2CY6HwTGLveAuTT+YqnvjkqE90Bsfm8EfcozEraNqWcEBXBVwtkLd7ATzlhKPNg8qmr6X4W9ARoEu3zYbsT1eq2s5iYSkTeNYPSTjv/jJBGkkQ0vGai1Nx07aAONyIOSZEyz/HlwePNDdjcjMOueNcUaNRVaRPJGdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya/mykI9TTV4oEiGgP3fH/QhlLcGBEiGEU+cRfwzU68=;
 b=Rth18xp+TBsHn+x4jJCHDNwwduxE7ckk7R43gZ4UwHB/VkqjAyKfFxr5xH+UgryeaWD87L5yoD00eKTFwoMrUOgvGArA8K0BqhBz8Kl3uG3GdfXl7odQvaM6gArJSx3uP918ASBYYm1BbCh79RdF2rJXjcMn1yfW+hUTUT1ZyPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8)
 by CH9PR12MB966865.namprd12.prod.outlook.com (2603:10b6:610:315::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 16:42:33 +0000
Received: from MW4PR12MB6921.namprd12.prod.outlook.com
 ([fe80::cbf7:e2db:1d37:c83b]) by MW4PR12MB6921.namprd12.prod.outlook.com
 ([fe80::cbf7:e2db:1d37:c83b%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:42:32 +0000
Message-ID: <ad92208f-d255-4991-abd6-f5a5e32e23f0@amd.com>
Date: Fri, 11 Sep 2026 11:42:28 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [pull] update amdgpu firmware
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20260911162940.1313896-1-alexander.deucher@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260911162940.1313896-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::16) To MW4PR12MB6921.namprd12.prod.outlook.com
 (2603:10b6:303:208::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6921:EE_|CH9PR12MB966865:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c09d29-4990-4ced-6f89-08df1023acc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dGVsZ1TFhPK+xNvEAQ9VriM94c+oQ2katXrvsbucSqQnbk5Qw3VbdwID3e/C9Xl59pph+BeQD3EPtApDrTFxpjuL1UYAaS2rQqjSAQQvLnMZoN731Zllg/ltkWhIF09/mKg94EKcqaoo1A1D9nop53zy07bVVCKEjbiB8wjlaeVOKKEmWc4uckjDhrH9alK8vEVL1z8ztImq7DqGnTOy0cLUQzdczxIhqeFiP+bwEg/Qx+fwn2cTij9nxarSRmZaLGAuxB632tl/qXzzlbSi+D/RMUMXACez6XkrIYywkZNGh8bKlI30XhnfedMVxRF0fXW7H0qEszWUI92P9ZP1tWYCAb5aB1nyxzW0Si7JLZBaW8RiEXPimw5qgoDBqsjqJQBmf+usFTU+UsR1HjG0LCW1gCWqI8PRK9ObxBQa5iKB1sDlAVyRGC+an+LRTN/10goC99Q9Cg6rJZnjCmcfQ+P0A1w9A/LLPu/LOCBLdZzGUznFmOsZi4HfE+FsE9f1vSpiJ2xTsvXMjX8DN4Q7fdHTGbz25N9+0vGHSaud9sjNB8qsOoAvnqMR0GN54FRhrsdJuMVWZN1aFSl/a7/888SS/seupmiR05s0kUw7DHQAavt2kXYFECEovuhG4C+3v3Kv4GYq4Z5mg91yP6h+J334eIP4ha+E3mjzFs3uixA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6921.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmZjZWpsZXdqd2FYQThHUXkvSlRSMy9IYzVZWHJTZmttbHhpalZiZ2VuUHZN?=
 =?utf-8?B?azA2UnR5NzBScEo2WGxENUdQVDVRZDRsMFhMRFViTFUrNVhML1pMaC9pQ1o3?=
 =?utf-8?B?WWhYY1c1UGZBRVN2czk4RDNpUE1HS2R3eGt0MG9ZUkJybzN3SXhLYlp2UXdh?=
 =?utf-8?B?Rml6ck1uTnJPejRpZlNZekRxNHlkVWsydUcwQjlTL2VTQlExMlJ2QmtxWHQr?=
 =?utf-8?B?RDFPcVN3a1NtNUladnY5K0paYlh3eTkySzd6Y1ltcGlFeWxGeVBaaUxzTjdi?=
 =?utf-8?B?RG52OVBnaVRNQ0dPUHplRThYUFpNMSthS3Q2c3hWVm95MXEyUFRZcXdFMndC?=
 =?utf-8?B?dmdLNTl6S3BFSVFVdHJCTXN4WWVrMmlsakErdDJlV3ZuYVcrSFR5OENyWDBa?=
 =?utf-8?B?ZURGSmN6ZDJTdXVvWjJSYmpzNlZjNFdZZmpoMkowdFNQbFg1QkdpM3EyK21j?=
 =?utf-8?B?N3pYbStVNklCYzVSeUExelBBYUE5SFVFa0ZJRXdUQWN3anh1aW9kdURQaXJX?=
 =?utf-8?B?NFNseWd1Zmh0Rllmb2NVVFNhU1lrY2lxY1Y2TlhSeUhoNUR5cVhYYXB1bC9Y?=
 =?utf-8?B?WjZoWVpiQzZSVkNFbGdxeTY1UXBSU0t3Z1FTREFQNzRNcjBMNTNUN2tGSERr?=
 =?utf-8?B?d2tTUTZNWThNTVJlSDhTVHBxRVpYNEd2MmxBZ3V1OHlSeTNQd3RrMjBiTWFz?=
 =?utf-8?B?S0tudnExVlBhcloraDVrdmNsb0hsRERhc2ZROWhmSElpZWsrVENHQWIrL253?=
 =?utf-8?B?anBmVUpjOTRuOWV2R2sybURKbFRzVWpMVm9tdnhMQ2lmNnZTbTI1YUdoMnZZ?=
 =?utf-8?B?b29XbFkwSGRRb21jVEYxbjlEQkVZa040MHJhNEFEWTdQRWtnRTBnc1lUUWk3?=
 =?utf-8?B?aU9MN1dkQjhGblk2SncybExmVFdnS2VsbWdvMnlLSjdZclNhYllqeEg4Szg1?=
 =?utf-8?B?RUFMRHJRdkYrYlNHc3I1UDNCc2hQelF2eGtMR281N1lrQmFZZnhNa1JvdlMv?=
 =?utf-8?B?YzR4LzN6Y2NKemZnVFlLOGw5VEl3cDVPWkdXT2p1L20zUTNqeDdSdFEwdndx?=
 =?utf-8?B?TVV4Y2NWeGZqWlZNU3hxYk5rM2oxMElWVkNpTWRVdGRsS00zUzZyRDlDa0Nj?=
 =?utf-8?B?eXdZTEVxNFA5YnRQZEF5MHY0UEY1eGZBb005UkgvTmJhcGd4V1NqZXRURG9T?=
 =?utf-8?B?L25ubWo1WXlzRGZ2bmlnZXFXRnAxYTE5ZDVabWZUSkJwYnYvTHp5a3N0bXhB?=
 =?utf-8?B?ZXhYdVBBK1JaSTdCNmV5Smp4aHc3TENaYTlLYnZUQmpLakhLMTV5VEJOVUcy?=
 =?utf-8?B?TkJ1SHR3eVR5VXVpWHpVdDlsTmtqYms0WG41WXNNY1VUMkN5RTd3YjZ2WmJv?=
 =?utf-8?B?YVZ5d1c1S3VwQWpGTkhpUFFmdEQyTCtTdkhvMFp0MFVwcG1UTlJwZ2UySW90?=
 =?utf-8?B?dXZLc0dPcUl1cUpmMVg2dXZham4wTGhhNGJBeUtVTkpRVm0ycmxucGlLbXZu?=
 =?utf-8?B?RmlHSXRQQS9NMGtPck43NHdwR25PZDhtU3ZNQTJPQy9mMkRBczd6TDArWDhU?=
 =?utf-8?B?cGd5Q0tGbG5QL292ZkhzSXZscG9nSUNxT3Z1TkprcUh3M0ZObGlaNW90Ynhw?=
 =?utf-8?B?aVNWYVgrR1JRbzVoY0FObzNXKzNibGxhSEZaZWtobWV4Q0RaQTZoWjBmYkVk?=
 =?utf-8?B?Zzc0bk4yQi9ybnA0U2FJQ1JNY1RqMktzOVB2a3lnNkc0azR4THpmNC85Z21k?=
 =?utf-8?B?UjlzdjFtUS9kR25WaWhCa05GbmptclJwK0FHdnVSL0RtLzJudDZ1aU5YNVFM?=
 =?utf-8?B?YUxNekhDOUFPS05JSzVwbHJzbnNwSE1nSm9majRFWXlUUDR0RnhMamNmZ0NE?=
 =?utf-8?B?dXZRbDFTem85WEpQN3NmdHpRVitXY2ErNGkwU0xZKzU2OGdtakNyQ3k5ZmZV?=
 =?utf-8?B?ekFmaFV6Zk5zRTFQRjhmL3BEOFptRzhhTlFGWkUxZ0ZBeGlYT2I2SEZKaGRl?=
 =?utf-8?B?ZWNTdFpHektWTFQyNXpGNDJ2eEcydG1TWXFBbDhYL0RHaG93dUJrM09hWk5M?=
 =?utf-8?B?ZWZubHF4VC8yUEFnb0lESnR3eW9taXJIWm9GMnd1SmZWOCtQUFdOOGVPbDFL?=
 =?utf-8?B?b09NRTl2TzdCK1FFcUQ2czBTWVJBamUvYjNDQ05vZENNRUorUHNWaXZ0YTk0?=
 =?utf-8?B?UXcxVituU0hoVjBlUnl3bTNWQzFOVnZzSmZ0dW9ZdVVUdmc2NHIxYzhJaDJm?=
 =?utf-8?B?K0UycTdnSlpiMnhpaGlYNmpCT3ZpZ09UNHVBWWNnUW4vT2FOQTRDS3l1QW1S?=
 =?utf-8?B?Zm9PSHZiKzZuK0xlZWswQTJORHVseE1sUWpLamhVcmJ6T04wVGdOQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c09d29-4990-4ced-6f89-08df1023acc4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6921.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:42:32.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0uDbyoIeldTXMFSEy5boWG+qXOxVtwwrht+nl58WwjyQ+LMN10UBLq9zR9wYNr1dkZbayeZl8n2BaV2jVI/tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR12MB966865



On 9/11/26 11:29, Alex Deucher wrote:
> Hi,
> 
> Updated amdgpu firmware.  Please apply.
> 
> The following changes since commit 6f47eb9e53f416d52a44e8cf00da2c3bd6552a68:
> 
>    amdgpu: DMCUB updates for various ASICs (2026-09-11 14:50:56 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-09-11
> 
> for you to fetch changes up to 9b407c9718c6a2b5397836cc946093a745aa9763:
> 
>    amdgpu: update vangogh firmware (2026-09-11 12:15:55 -0400)
> 
> ----------------------------------------------------------------
> Update amdgpu firmware
> 
>  From internal commit:
> 6d0a0c41f7d659d2607fa8b85c7143935b1c2f78
> 
> ----------------------------------------------------------------
> Alex Deucher (48):
>        amdgpu: update green sardine firmware
>        amdgpu: update GC 11.5.2 firmware
>        amdgpu: update PSP 14.0.4 firmware
>        amdgpu: update VPE 6.1.3 firmware
>        amdgpu: update GC 11.5.3 firmware
>        amdgpu: update PSP 14.0.5 firmware
>        amdgpu: update GC 11.7.0 firmware
>        amdgpu: update PSP 15.0.0 firmware
>        amdgpu: update VCN 5.3.0 firmware
>        amdgpu: update GC 11.7.1 firmware
>        amdgpu: update PSP 15.0.9 firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SMU 13.0.0 firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update SMU 13.0.10 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update SMU 13.0.7 firmware
>        amdgpu: update GC 12.0.0 firmware
>        amdgpu: update PSP 14.0.2 firmware
>        amdgpu: update GC 12.0.1 firmware
>        amdgpu: update PSP 14.0.3 firmware
>        amdgpu: update SMU 14.0.3 firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update renoir firmware
>        amdgpu: update GC 11.5.0 firmware
>        amdgpu: update PSP 14.0.0 firmware
>        amdgpu: update VCN 4.0.5 firmware
>        amdgpu: update GC 11.5.1 firmware
>        amdgpu: update PSP 14.0.1 firmware
>        amdgpu: update VCN 4.0.6 firmware
>        amdgpu: update VPE 6.1.1 firmware
>        amdgpu: update vangogh firmware
> 
>   amdgpu/beige_goby_ta.bin        | Bin 259328 -> 259328 bytes
>   amdgpu/dimgrey_cavefish_ta.bin  | Bin 259328 -> 259328 bytes
>   amdgpu/gc_11_0_0_mes_2.bin      | Bin 263664 -> 263696 bytes
>   amdgpu/gc_11_0_1_mes_2.bin      | Bin 263664 -> 263696 bytes
>   amdgpu/gc_11_0_2_mes_2.bin      | Bin 263664 -> 263696 bytes
>   amdgpu/gc_11_0_3_mes_2.bin      | Bin 263728 -> 263760 bytes
>   amdgpu/gc_11_0_4_mes_2.bin      | Bin 263664 -> 263696 bytes
>   amdgpu/gc_11_5_0_mes_2.bin      | Bin 263632 -> 263632 bytes
>   amdgpu/gc_11_5_1_mes_2.bin      | Bin 263920 -> 263920 bytes
>   amdgpu/gc_11_5_2_mes_2.bin      | Bin 263632 -> 263632 bytes
>   amdgpu/gc_11_5_3_mes_2.bin      | Bin 263632 -> 263632 bytes
>   amdgpu/gc_11_7_0_rlc.bin        | Bin 162336 -> 162336 bytes
>   amdgpu/gc_11_7_1_rlc.bin        | Bin 162080 -> 162112 bytes
>   amdgpu/gc_12_0_0_me.bin         | Bin 463392 -> 463392 bytes
>   amdgpu/gc_12_0_0_mec.bin        | Bin 455648 -> 455648 bytes
>   amdgpu/gc_12_0_0_pfp.bin        | Bin 354912 -> 354912 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin    | Bin 734336 -> 734432 bytes
>   amdgpu/gc_12_0_1_me.bin         | Bin 463392 -> 463424 bytes
>   amdgpu/gc_12_0_1_mec.bin        | Bin 451552 -> 451552 bytes
>   amdgpu/gc_12_0_1_pfp.bin        | Bin 354912 -> 354912 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin    | Bin 734336 -> 734432 bytes
>   amdgpu/green_sardine_asd.bin    | Bin 209408 -> 209408 bytes
>   amdgpu/green_sardine_ta.bin     | Bin 37632 -> 37632 bytes
>   amdgpu/navi10_asd.bin           | Bin 209408 -> 209408 bytes
>   amdgpu/navi10_ta.bin            | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_asd.bin           | Bin 209408 -> 209408 bytes
>   amdgpu/navi12_ta.bin            | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_asd.bin           | Bin 209408 -> 209408 bytes
>   amdgpu/navi14_ta.bin            | Bin 37632 -> 37632 bytes
>   amdgpu/navy_flounder_ta.bin     | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_0_ta.bin        | Bin 271616 -> 271616 bytes
>   amdgpu/psp_13_0_0_ta_kicker.bin | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin       | Bin 267712 -> 267712 bytes
>   amdgpu/psp_13_0_11_ta.bin       | Bin 254976 -> 254976 bytes
>   amdgpu/psp_13_0_4_ta.bin        | Bin 254976 -> 254976 bytes
>   amdgpu/psp_13_0_5_asd.bin       | Bin 209408 -> 209408 bytes
>   amdgpu/psp_13_0_5_ta.bin        | Bin 246784 -> 246784 bytes
>   amdgpu/psp_13_0_7_ta.bin        | Bin 246784 -> 246784 bytes
>   amdgpu/psp_14_0_0_ta.bin        | Bin 254976 -> 254976 bytes
>   amdgpu/psp_14_0_1_ta.bin        | Bin 254976 -> 254976 bytes
>   amdgpu/psp_14_0_2_ta.bin        | Bin 278508 -> 274668 bytes
>   amdgpu/psp_14_0_3_ta.bin        | Bin 291116 -> 287276 bytes
>   amdgpu/psp_14_0_4_ta.bin        | Bin 254976 -> 254976 bytes
>   amdgpu/psp_14_0_5_ta.bin        | Bin 254976 -> 254976 bytes
>   amdgpu/psp_15_0_0_ta.bin        | Bin 278980 -> 278968 bytes
>   amdgpu/psp_15_0_0_toc.bin       | Bin 2816 -> 2816 bytes
>   amdgpu/psp_15_0_9_ta.bin        | Bin 278980 -> 278968 bytes
>   amdgpu/psp_15_0_9_toc.bin       | Bin 2816 -> 2816 bytes
>   amdgpu/renoir_asd.bin           | Bin 209408 -> 209408 bytes
>   amdgpu/renoir_ta.bin            | Bin 46080 -> 46080 bytes
>   amdgpu/sienna_cichlid_ta.bin    | Bin 386816 -> 386816 bytes
>   amdgpu/smu_13_0_0.bin           | Bin 292452 -> 292452 bytes
>   amdgpu/smu_13_0_0_kicker.bin    | Bin 261888 -> 261888 bytes
>   amdgpu/smu_13_0_10.bin          | Bin 271520 -> 271520 bytes
>   amdgpu/smu_13_0_7.bin           | Bin 287080 -> 287080 bytes
>   amdgpu/smu_14_0_3.bin           | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3_kicker.bin    | Bin 327424 -> 327424 bytes
>   amdgpu/vangogh_asd.bin          | Bin 209408 -> 209408 bytes
>   amdgpu/vcn_4_0_2.bin            | Bin 403856 -> 403856 bytes
>   amdgpu/vcn_4_0_5.bin            | Bin 403856 -> 403856 bytes
>   amdgpu/vcn_4_0_6.bin            | Bin 403856 -> 403856 bytes
>   amdgpu/vcn_4_0_6_1.bin          | Bin 403856 -> 403856 bytes
>   amdgpu/vcn_5_3_0.bin            | Bin 448272 -> 448528 bytes
>   amdgpu/vpe_6_1_1.bin            | Bin 25984 -> 25984 bytes
>   amdgpu/vpe_6_1_3.bin            | Bin 25984 -> 25984 bytes
>   amdgpu/yellow_carp_sdma.bin     | Bin 34048 -> 34048 bytes
>   amdgpu/yellow_carp_ta.bin       | Bin 246784 -> 246784 bytes
>   67 files changed, 0 insertions(+), 0 deletions(-)

Merged, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1237
