Return-Path: <SRS0=JRQ+=33=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4E2CAC598
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Sep 2025 21:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C24F2C4CEF7; Tue, 16 Sep 2025 21:24:18 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D7ABC4CEF0
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 21:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D7ABC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsuWRZSpvHujwjwPfhAunJE1GZQSjGze5rYyp05WlcpqeboFr1QfkHQ0YZ7DAc5l0qRyYOZqdx+v0R/lYxxaihsHhLCN87VyLlpWOahvQM0+wGbQk3LEnjR9w6UYEidYOApt31/Dw4LKHD2nhnJiytJCGRJCYg0W0lilvgA4OA1yQg/Wz7NVKRitXxaoPK4H9yEbl9DUtF7Xju92KOeZ32ntLr3FmQG+NAlFSYb5D5+/uKuqBU7vVgjV8rPCLmG2heKgFXT2YAp6mqMLGPS0E/TmdKdic3bwWWAvUY3I5ztgRAeIv93bmOVjrFp0+ombPaxmayaiVG1E7vpeXp4HHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rsd4HcdHrTs9PQiT9I8jOdhmea0kig2BKoZrkrHCXPs=;
 b=OMgC72hRWSNTRAnqhV2fLPLMKo36erIkhRGbLKp+6rIUPXQlZcFIxTVWRJ4u04uZmzJubpgMAV9K0spMdDiaj2wawpSYZPq19Wu2YW78cShSXYCzkNdKJB2ftSAZmE2ysRMy/NbxbvM2Sp/dbNzEO79Q91lWas+fgS2g0HdExzm7Xsjefuk65DC/XeIKsNEVMr/J8Xz5eioG9ykAEY/Ml2BxRQtdyazYaNmvJue70jFz5Qm7DTAVH+O8yjNnMvtZdKz0BxrJ62+aKs5dIuw/GHhsww7dPTj/Mg5S8bqOs2jiU9pJlcfSbUh52hl9eBzVqEyuJh4lg1ESA3QqxjLnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rsd4HcdHrTs9PQiT9I8jOdhmea0kig2BKoZrkrHCXPs=;
 b=viJe4oYh00yEkbBpdCVH+7Ae/8yXVXHmS1f/ncJ5RD657QYYvTUcAX5Z+AlDY+VTnsk8PR1YHZAWfSct9lr0e8YdC0OUb+qK4T+y6nk4qOYazvdr1YOaklF+b3D8pB/YjnoKx0iE90GOYr0Xl0CMxGjLsBniHOkl/RCMKQrR0dM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 21:24:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 21:24:13 +0000
Message-ID: <5a32863e-c2ce-487a-a33f-8de23848873d@amd.com>
Date: Tue, 16 Sep 2025 16:24:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware update
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20250916211926.946502-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250916211926.946502-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P220CA0062.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed7fdb3-bf52-4c6b-463c-08ddf5676231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUk4SFdTdjNYWUtkUTI5NHF5SlljRFZ1U3BEb1ZQUkVNT1UyWFA1eDhVaWJP?=
 =?utf-8?B?RG5lNU9HK0p6VlBVeEwza1J3bHM1aGdIVGRQS2U2bUwwTVZ2UitrbW8rL2Vs?=
 =?utf-8?B?Y2JkTHZyTkdxMU12ZExiQUpLbHV5Q1J3eEZJUUVRRFh6QkxWekpwczhyK2lU?=
 =?utf-8?B?NkROdSt1ZFNUa1JId1BacytZSFZNNnZlZzU5K1poMEY1WWRpMmNybUxFbU5E?=
 =?utf-8?B?TEduUFlHOFh3TUlVYUpFT2Yrd09uNjBzVUxmWWVEU1VwbWJwOE15eWd5UzlH?=
 =?utf-8?B?R3pmNjdhamFwV0s5SG1uQ052ZjNjOFJoS1ZzZng0c2ptSTB3MjQ0aXdoMW5U?=
 =?utf-8?B?QWwya0NFK2RtZVJlV2ZMa0lpYlBTeThGNitlU1hZYnhOSGtTdjI5Y0lOYVZQ?=
 =?utf-8?B?eEtrc3ZXREdPWGpQODRuR1M1b3A0amtlVjk2SGZnZmxXTW82WUZSNlVBNGk5?=
 =?utf-8?B?RXBDWGxWZW0yYjlHcUZoQmJtZEE0NS93d3dhSTA2YkluM0lYRVhqTkxlbERV?=
 =?utf-8?B?UXVKam5QekU3ZXVpNlB1QkJENTk3NFRzTlNWeS82SnozSXZLM0dBU1doUGJz?=
 =?utf-8?B?U01aK0U3U0Z6MVc5anlEYUxObXY4Z0lkQnNlaXp1MTR1aWQ0aGVOZkJwa0s3?=
 =?utf-8?B?VXZjcVpQc0pRNWNwaE1hYU56QTAxdk9uc1NDbXhCZmNsSGRVYmc5dlk4emJX?=
 =?utf-8?B?cWwxUVpSRzl2WnU2aWtieCtPdkdXTXpzcGRCTzd1V0cvQTIvdGtLbjZvQ3Zs?=
 =?utf-8?B?N1VmZld3anN4YU1hQmw4dWV2blFiRlVqeEJ0U0JNOFJwTUJ5MW5kUXE1SUNX?=
 =?utf-8?B?T0lENFc3cWNrZWVWcnNFYmpIYXNNcDJoNllCRHo3WGwxQnN5djhkYXpBNm5j?=
 =?utf-8?B?UXRja2RCWXpJbzgxN3lUb2FQU3pqTWtJNnBoOHZtK3NyM3hYaTFWNGRxT3Vp?=
 =?utf-8?B?a2h0Vk5JQUxKRmlmNDU5aVNNU1R2NHdyYkt6TnFWcUlDOEF5S1JKRDl5ZlpT?=
 =?utf-8?B?ZDJoTzlaa1c3RlB6QzVrS0FuWFpBbVE0dnZsWTU3RFhLRzNhTjIzVThpQktw?=
 =?utf-8?B?dnhpVk56bGkvd2Z0WHNORGR2SWhJMTRwdzRMckZHNEYwcVpuT1pxV0hEekhz?=
 =?utf-8?B?aWNwc0syVmpKS2tPaFdCRUFjM1dUTjh4bHFIUmMyZnpLTVZXdWhpVXh0MVJI?=
 =?utf-8?B?c2pLcHFuNHdGWnpWaDBtZGRZVWFURnlWMkVOSTRsd05ueTRidncwMzdsclFH?=
 =?utf-8?B?MzlURWFTTmhYL2ZibXhqNnRMVy9ZQXRjL1laaCtla0RmQnV4eW82WVRRTTAr?=
 =?utf-8?B?UllHdUhWdi9WVDlvdmxob05TUHhOSmNweFlSUkdUWTR3bzZnRmxBbms5ZktE?=
 =?utf-8?B?TjZkdDlUMWZlb09iMXlXM2RGamNIbDFEeE9FSTR5S2licmIxZWdGcXdjbnFL?=
 =?utf-8?B?Q2czcjRSUlNub2xNNzZZSVdxT0p3M25ZMlM5a0FPcXNFbU41Q01LZE5RTXlk?=
 =?utf-8?B?TklrL1U3S3p4RmFCV05WZFc3cVpKeFlZeFM5UE5TU0F2em9vY083VWY3RzBF?=
 =?utf-8?B?U2lGMmFKbGlJUkIwdGw5TjBCVDFsNjNpYTFXMkJVZEoremFOaGdSNUVmTUg2?=
 =?utf-8?B?bnJhUzVma2pKb29jamZxYlJBZFNjV2xFQWRZMnlTblg1UmdweXBZb201WktG?=
 =?utf-8?B?L2lIbEc3MVhTRlpLSTFFSGpwVzRzUmNNV3pERi8rRUZTS2NLOGNESlBkaWpU?=
 =?utf-8?B?ZjBXY3BmVnVmSTRicDBxdThQMHZSN0RWUkk0TXpidmo1cTg5UVR5SEdwOUpy?=
 =?utf-8?B?dUdTRzJaS0xWbmgwR3dveDE2bjVkMnQwWE9KbDd4TGFKQktqNkRVb2ljaktS?=
 =?utf-8?B?R3VGQmRFNEpuYzFwSGdKOGc4Yk9oS2JGSERUWHluek9FbGMxUnZZekNCWG5T?=
 =?utf-8?Q?kGstFkTyHpI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnRISURrQ2JRaEdUTUc5S2w3MlhGUU1pbDIyUTJaZVRKby9hQmJtWnUwcnV1?=
 =?utf-8?B?VzhraG9VZWd1RkxoYVZsM2JkWDhKSnlvMmZldFpXYVFUT216MVVxVWt4WTNh?=
 =?utf-8?B?RlZIQkFhUUU3bnVsTGtSSDZ3QnJTTkd2Sy9rc0JaNTRKNVg0Y0xvQVYrb3k4?=
 =?utf-8?B?VGJpL3gzbVJHZHYzaEtidWpjZURIVnpmU2h0WE51RlRWUkJZNEorc0FCMzdG?=
 =?utf-8?B?ai8rc0dsblRNUStYRWtQOHh1dkxFd3pyWFplSXp2ZnhXa0NMOUtkT2hTTzBm?=
 =?utf-8?B?ZmQ2R1B4S0J6T1VZK0pscitmc2pxSHA3SC9LR2d1R0RFb3dtc1k5NCt2d252?=
 =?utf-8?B?MUVuZXJHQzl2SHd6YUhVM1pjTU50SFlhbGVpWnYxUE10MHMybEdkRWNRY0JZ?=
 =?utf-8?B?WWhYWENrV2ROajFIV3dXcnlGTGttWnNyUTN4aWZGUHJ1a2NsK0tWOGkwL2FP?=
 =?utf-8?B?MXpMeVM3blI0OTlEcy9DSjIrWC9xSm43c3dBeFZzY3hPNTFIblNabTRuS3BT?=
 =?utf-8?B?OEVhYkhwZ1BJZ2g2TFlzR1B5Z1NKbFprdmtsNk9LZDFIUUtpUFNNRm1hY3hm?=
 =?utf-8?B?MWJLaWtFQXVVdk1LcW1GNWZhVndDbFpKejNlWTRMWitpZDUyUHg5VkR1K09U?=
 =?utf-8?B?WWY5ZXlQbGEvTkVmTUdtaThUd3pNY3B0VTducHZRNjhNUTRrbHVoQ2pEMERt?=
 =?utf-8?B?bnNKVkYydE1MdHpzbkFvT1dhdFREcFBNUXozeDFHYldMUE16SDB2VkVLZ0Ft?=
 =?utf-8?B?MlVBVnJRUm5EL1dGaWVDbDUwR0lXNHZlNlhRcytONGpRbzlBTzZKcjBBRjZ5?=
 =?utf-8?B?Um0rKzg4YWRJdGg3R1BSSnQrZTFBZjA2ZXhra1NFMzd6L1QzYzJPT3ppVExI?=
 =?utf-8?B?NkJEWmNBdnFOSlRLSUZkdFVjYzlFdW9nME1kN0tpKzRPaytSdnNucDFLNnpV?=
 =?utf-8?B?cUhVUVVRR1hGZmg1WTg0cFFIeTh1eEIxOE5GNkpyYk1WRkl6ZkFIQVU3YkR3?=
 =?utf-8?B?ZFpzTk1uQ1BhYWRvNTV1enIvSi94dzFPU0x3c2FETEljSnBacndJQk4xamRP?=
 =?utf-8?B?bWJKenNKeDF0RzRRWnFzV1E5TkNxQXZIRG9NbmZXWlpIQXQvdDhFaGUvb0ZG?=
 =?utf-8?B?QkhGWmp4OHJnbk5BSXFRMGI4Y1hCNkdDMDVERnllVTYwMWcrLzlEdDZMNzRB?=
 =?utf-8?B?MElReWROSWpsdGEzbFgrV01kd2RmQlpNZml3b3dreFU1V09JTDhiTEptK1Jt?=
 =?utf-8?B?OHJrY2NaYTk1K1JVQzZmbUdLdHp1MzhObmw1N05Rb0pUdWJKK0hJckpqbnpt?=
 =?utf-8?B?bzlqbllZUlVPVUV5NTJVTkU3RGRYNkFwcU9BQnVSakw4MTVxS3N2WUZLb2d5?=
 =?utf-8?B?RU5jeFdsVUZvdzVNRHA2YzNSQTE0NkJyckpnbEcxWURtVFBJTitxMGgzbERD?=
 =?utf-8?B?eFFtQkk1WVdjOSt1dWR3ZFRVT3J0N095MjZHcG9RRlZWMFpxa01VY0tZQ0NW?=
 =?utf-8?B?YTFac3BtVVNwUndTVWpNMVgvck1hSzhJNVdvWGhWNEZRZDhrU09HakJQVFds?=
 =?utf-8?B?STQ1OXlpMERNcVhSbXc2ZHlvNXM1MXJ5UFJ5NzZhMWx6N3FoWEtWc3VjWS9o?=
 =?utf-8?B?NUdaakpERExmT2lpOXFHRVF0eUZ4aG9HNzREL3FUdkxLVVJJTU5WZlc4RitM?=
 =?utf-8?B?SHhVUWxvLzVnRERIUitMeHNObkV2RVVwZW93TFFRV2IzcXNmblBIVjlvK2M4?=
 =?utf-8?B?MHNGNzY4aDFiVVBEeDVUUlZTMFBYYkVZcDBndnlpZG9nNWlSQVVXcFJuVHdB?=
 =?utf-8?B?dERWNTF0ZnViT3dEdTNqL3h3SjYyR2x1WU0zM0M4bXlIcHkvT3pUazBOaE5I?=
 =?utf-8?B?bFIrQTJIdjBzaTN0SVlnMjJOTXV1M1pUNnZWbkxRVFlSZW5XelJ4RUFJTnRz?=
 =?utf-8?B?NzRFalorRTVpL3RkK1FNWXc2Z2NLWG1SWE5sS2NDWnJYWmJnU0t0MGFrUFkr?=
 =?utf-8?B?S0NJbVh4cjhqamw2SmhXam1zSVJzMzloRzlub21ERlpPS0hHaE1tSzVNb0Jk?=
 =?utf-8?B?TVNhT0VtS0FNdys0MUdPcnpiRklSdjhBMDVjaWZMbDNydHNwWERSQkhuWEZZ?=
 =?utf-8?Q?8yCBQzdYmTaps188PsT5zI8VD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed7fdb3-bf52-4c6b-463c-08ddf5676231
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 21:24:13.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqqZZu+841F7qFdDpwdDjNf0bfFmcZID+o+cF3TgYy8nBGIxmv2sQ1wtZKCc1KluQm/7PhxgEGB/7rooRU1tzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710

On 9/16/25 4:19 PM, Alex Deucher wrote:
> Hi,
> 
> Updated amdgpu firmware.
> 
> The following changes since commit ba7d706f9cf6e65e9956e65ac44906a78a790a02:
> 
>    amdgpu: DMCUB updates for various ASICs (2025-09-12 10:26:04 +0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-09-16-2
> 
> for you to fetch changes up to e3f70d8475399faae930b8180f88bde4d404b451:
> 
>    amdgpu: update PSP 14.0.3 kicker firmware (2025-09-16 17:12:48 -0400)
> 
> ----------------------------------------------------------------
> amd-2025-09-16-2:
> 
> Update amdgpu firmware.
> 
> ----------------------------------------------------------------
> Alex Deucher (63):
>        amdgpu: update GC 9.4.3 firmware
>        amdgpu: update PSP 13.0.6 firmware
>        amdgpu: update VCN 4.0.3 firmware
>        amdgpu: update green sardine firmware
>        amdgpu: update GC 11.5.2 firmware
>        amdgpu: update PSP 14.0.4 firmware
>        amdgpu: update VPE 6.1.3 firmware
>        amdgpu: update GC 11.5.3 firmware
>        amdgpu: update PSP 14.0.5 firmware
>        amdgpu: update SDMA 6.1.3 firmware
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
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update GC 11.0.0 firmware
>        amdgpu: update PSP 13.0.0 firmware
>        amdgpu: update SMU 13.0.0 firmware
>        amdgpu: update SDMA 6.0.0 firmware
>        amdgpu: update VCN 4.0.0 firmware
>        amdgpu: update PSP 13.0.0 kicker firmware
>        amdgpu: update SMU 13.0.0 kicker firmware
>        amdgpu: update GC 11.0.3 firmware
>        amdgpu: update PSP 13.0.10 firmware
>        amdgpu: update SMU 13.0.10 firmware
>        amdgpu: update GC 11.0.2 firmware
>        amdgpu: update PSP 13.0.7 firmware
>        amdgpu: update VCN 4.0.4 firmware
>        amdgpu: update GC 12.0.0 firmware
>        amdgpu: update PSP 14.0.2 firmware
>        amdgpu: update SMU 14.0.2 firmware
>        amdgpu: update GC 12.0.1 firmware
>        amdgpu: update PSP 14.0.3 firmware
>        amdgpu: update VCN 5.0.0 firmware
>        amdgpu: update GC 11.0.1 firmware
>        amdgpu: update PSP 13.0.4 firmware
>        amdgpu: update VCN 4.0.2 firmware
>        amdgpu: update GC 11.0.4 firmware
>        amdgpu: update PSP 13.0.11 firmware
>        amdgpu: update GC 10.3.6 firmware
>        amdgpu: update PSP 13.0.5 firmware
>        amdgpu: update VCN 3.1.2 firmware
>        amdgpu: update yellow carp firmware
>        amdgpu: update renoir firmware
>        amdgpu: update GC 11.5.0 firmware
>        amdgpu: update PSP 14.0.0 firmware
>        amdgpu: update VPE 6.1.0 firmware
>        amdgpu: update VCN 4.0.5 firmware
>        amdgpu: update GC 11.5.1 firmware
>        amdgpu: update PSP 14.0.1 firmware
>        amdgpu: update VCN 4.0.6 firmware
>        amdgpu: update vangogh firmware
>        amdgpu: update vega10 firmware
>        amdgpu: update vega12 firmware
>        amdgpu: update vega20 firmware
>        amdgpu: update PSP 14.0.3 kicker firmware
> 
>   amdgpu/beige_goby_ta.bin         | Bin 247040 -> 251136 bytes
>   amdgpu/beige_goby_vcn.bin        | Bin 580080 -> 580112 bytes
>   amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 251136 bytes
>   amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580080 -> 580112 bytes
>   amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
>   amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_10_3_6_mec.bin         | Bin 268592 -> 268592 bytes
>   amdgpu/gc_10_3_6_mec2.bin        | Bin 268592 -> 268592 bytes
>   amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_0_me.bin          | Bin 314512 -> 314512 bytes
>   amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_0_mes1.bin        | Bin 218240 -> 218240 bytes
>   amdgpu/gc_11_0_0_mes_2.bin       | Bin 257056 -> 257344 bytes
>   amdgpu/gc_11_0_0_pfp.bin         | Bin 230976 -> 231008 bytes
>   amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_mec.bin         | Bin 268640 -> 268160 bytes
>   amdgpu/gc_11_0_1_mes1.bin        | Bin 231440 -> 232816 bytes
>   amdgpu/gc_11_0_1_mes_2.bin       | Bin 256448 -> 257312 bytes
>   amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_1_rlc.bin         | Bin 157040 -> 157040 bytes
>   amdgpu/gc_11_0_2_me.bin          | Bin 314496 -> 314496 bytes
>   amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_2_mes1.bin        | Bin 218560 -> 218560 bytes
>   amdgpu/gc_11_0_2_mes_2.bin       | Bin 257056 -> 257344 bytes
>   amdgpu/gc_11_0_2_pfp.bin         | Bin 230992 -> 231008 bytes
>   amdgpu/gc_11_0_3_me.bin          | Bin 314512 -> 314512 bytes
>   amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
>   amdgpu/gc_11_0_3_mes1.bin        | Bin 218336 -> 218336 bytes
>   amdgpu/gc_11_0_3_mes_2.bin       | Bin 257120 -> 257408 bytes
>   amdgpu/gc_11_0_3_pfp.bin         | Bin 230992 -> 231008 bytes
>   amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_4_mec.bin         | Bin 268640 -> 268160 bytes
>   amdgpu/gc_11_0_4_mes1.bin        | Bin 230736 -> 232080 bytes
>   amdgpu/gc_11_0_4_mes_2.bin       | Bin 256448 -> 256704 bytes
>   amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_0_4_rlc.bin         | Bin 159152 -> 159152 bytes
>   amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_0_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_0_mes1.bin        | Bin 233776 -> 235664 bytes
>   amdgpu/gc_11_5_0_mes_2.bin       | Bin 256512 -> 257184 bytes
>   amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_1_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_1_mes1.bin        | Bin 233936 -> 235856 bytes
>   amdgpu/gc_11_5_1_mes_2.bin       | Bin 256800 -> 257440 bytes
>   amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_2_mec.bin         | Bin 268160 -> 268160 bytes
>   amdgpu/gc_11_5_2_mes1.bin        | Bin 234288 -> 234992 bytes
>   amdgpu/gc_11_5_2_mes_2.bin       | Bin 256704 -> 256960 bytes
>   amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
>   amdgpu/gc_11_5_3_imu.bin         | Bin 132352 -> 132352 bytes
>   amdgpu/gc_11_5_3_mes1.bin        | Bin 234288 -> 234992 bytes
>   amdgpu/gc_11_5_3_mes_2.bin       | Bin 256000 -> 256960 bytes
>   amdgpu/gc_11_5_3_rlc.bin         | Bin 162064 -> 162064 bytes
>   amdgpu/gc_12_0_0_me.bin          | Bin 466592 -> 467488 bytes
>   amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 451552 bytes
>   amdgpu/gc_12_0_0_pfp.bin         | Bin 351984 -> 352048 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin     | Bin 721824 -> 723328 bytes
>   amdgpu/gc_12_0_1_me.bin          | Bin 466592 -> 467488 bytes
>   amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 451552 bytes
>   amdgpu/gc_12_0_1_pfp.bin         | Bin 351984 -> 352048 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin     | Bin 721824 -> 723328 bytes
>   amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
>   amdgpu/gc_9_5_0_rlc.bin          | Bin 38700 -> 38700 bytes
>   amdgpu/green_sardine_asd.bin     | Bin 193024 -> 201216 bytes
>   amdgpu/green_sardine_vcn.bin     | Bin 403904 -> 404288 bytes
>   amdgpu/navi10_asd.bin            | Bin 197120 -> 201216 bytes
>   amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
>   amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi12_asd.bin            | Bin 197120 -> 201216 bytes
>   amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navi14_asd.bin            | Bin 197120 -> 201216 bytes
>   amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
>   amdgpu/navy_flounder_sos.bin     | Bin 222704 -> 222704 bytes
>   amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 251136 bytes
>   amdgpu/navy_flounder_vcn.bin     | Bin 580080 -> 580112 bytes
>   amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
>   amdgpu/psp_13_0_0_ta.bin         | Bin 259328 -> 263424 bytes
>   amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin        | Bin 353728 -> 259520 bytes
>   amdgpu/psp_13_0_11_ta.bin        | Bin 340992 -> 246784 bytes
>   amdgpu/psp_13_0_12_sos.bin       | Bin 410416 -> 410416 bytes
>   amdgpu/psp_13_0_14_ta.bin        | Bin 67904 -> 67904 bytes
>   amdgpu/psp_13_0_4_ta.bin         | Bin 340992 -> 246784 bytes
>   amdgpu/psp_13_0_5_asd.bin        | Bin 197120 -> 201216 bytes
>   amdgpu/psp_13_0_5_ta.bin         | Bin 234496 -> 238592 bytes
>   amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
>   amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
>   amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 238592 bytes
>   amdgpu/psp_14_0_0_ta.bin         | Bin 238592 -> 246784 bytes
>   amdgpu/psp_14_0_1_ta.bin         | Bin 340992 -> 246784 bytes
>   amdgpu/psp_14_0_2_sos.bin        | Bin 421216 -> 421216 bytes
>   amdgpu/psp_14_0_2_ta.bin         | Bin 372816 -> 266208 bytes
>   amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
>   amdgpu/psp_14_0_3_sos_kicker.bin | Bin 435968 -> 435968 bytes
>   amdgpu/psp_14_0_3_ta.bin         | Bin 385424 -> 278816 bytes
>   amdgpu/psp_14_0_4_ta.bin         | Bin 340992 -> 246784 bytes
>   amdgpu/psp_14_0_5_ta.bin         | Bin 238592 -> 246784 bytes
>   amdgpu/psp_14_0_5_toc.bin        | Bin 2560 -> 2560 bytes
>   amdgpu/renoir_asd.bin            | Bin 197120 -> 201216 bytes
>   amdgpu/renoir_ta.bin             | Bin 41984 -> 46080 bytes
>   amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sdma_6_1_3.bin            | Bin 34560 -> 34560 bytes
>   amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 378624 bytes
>   amdgpu/sienna_cichlid_vcn.bin    | Bin 580080 -> 580112 bytes
>   amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
>   amdgpu/smu_13_0_0_kicker.bin     | Bin 261888 -> 261888 bytes
>   amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
>   amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
>   amdgpu/vangogh_asd.bin           | Bin 197120 -> 201216 bytes
>   amdgpu/vcn_3_1_2.bin             | Bin 572368 -> 572368 bytes
>   amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_3.bin             | Bin 359760 -> 359696 bytes
>   amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 403856 bytes
>   amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 395664 bytes
>   amdgpu/vcn_5_0_0.bin             | Bin 434768 -> 439824 bytes
>   amdgpu/vcn_5_0_1.bin             | Bin 208144 -> 211280 bytes
>   amdgpu/vega10_asd.bin            | Bin 197120 -> 201216 bytes
>   amdgpu/vega12_asd.bin            | Bin 197120 -> 201216 bytes
>   amdgpu/vega20_asd.bin            | Bin 197120 -> 201216 bytes
>   amdgpu/vpe_6_1_0.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/vpe_6_1_3.bin             | Bin 25984 -> 25984 bytes
>   amdgpu/yellow_carp_rlc.bin       | Bin 178128 -> 178128 bytes
>   amdgpu/yellow_carp_ta.bin        | Bin 234496 -> 238592 bytes
>   amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 572368 bytes
>   132 files changed, 0 insertions(+), 0 deletions(-)

Merged, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/691
