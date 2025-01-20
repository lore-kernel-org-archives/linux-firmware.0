Return-Path: <SRS0=miSA=UM=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6250BC02187
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Jan 2025 03:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24190C4CEDF; Mon, 20 Jan 2025 03:00:52 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79FEFC4CED6
	for <linux-firmware@kernel.org>; Mon, 20 Jan 2025 03:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79FEFC4CED6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dq+imtIaQkK5m0Qk0a1dFA8lv29zLzwvR0oJAbcIG0qImzd1D/OZiroiuoNBuLyQV6vJu/iiAd4zQddvG0dBNVk/LJCETdfivwSw3mg2J2DrGB+vVW83eeR48QQfAkkk7XwfHaHqHXVQnaIiKJIfqgbtVzwID+bAhxKR4Vz1+X+EsJGTScEd2ecuIleAizT4XUSKp/tjX6IgNDypiBNK8qbKDAorPdGkt0z8tW4g74rlw+hZFdUVF2lge8fx7vibYmF7j05QCUncpVHT3UruI393tll6rNaREDFMYo7bbsU+axXUfYGKHg2NrC9haVd6tYVxElTdUE9usLkJmWa91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBYQ0mlLy/EZBXzTLEILmyeJWtrLw9ybKION7nYAnl0=;
 b=w1POmH/ZitHILmoNevMhigK+J408+xdojCun7CaYm+IMInzJOCkr8pGxXk+9Hiobb0I3w/hLNUUrh9B9Wft9qYGvfXlpkxWJUC2bQ1zkTpoz0VZxaXa5HGrrZ/jBqqyZBWTvcxpRyfa9sAZs/9ORQ7MYRJtEeZAxKObKWyADHiYy15mm71TywDtuDruNk/Kn0JNmDcGmKTJUBuChSCuq7zgxNuTtD7PW1zpTfvCC35XmLVcE56XeqWZICW+E9+RbeXxViEZ9I6eLoERhQ4s3u/26nMx6I2fZNfQpTuJstRdkn58v/Mti1zKkr5xDTP/hUCKo/0IZuPu+eKpgIb0qkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBYQ0mlLy/EZBXzTLEILmyeJWtrLw9ybKION7nYAnl0=;
 b=wBfZzE/vENp+ABei3Bep1I9pOfzV+qGZKItNV4pNZfsKl8UQCfKGkN6rumotjU/dV5Ibjb/TQ543bjcyHNS9G3ej2/SzVsNk/l9aKaH6tpgsnXxXpRXleWhaR5i+UrJV6+ymxMNW7lo5v4PsWgsFpm5pXUP3oM5Q17jGGfuQCDk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB7088.namprd12.prod.outlook.com (2603:10b6:303:238::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 03:00:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 03:00:47 +0000
Message-ID: <f6348ad3-edcf-4166-9a47-2357fbe75506@amd.com>
Date: Sun, 19 Jan 2025 21:00:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [pull] amdgpu firmware updates
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>, linux-firmware@kernel.org
References: <20250117211349.3237123-1-alexander.deucher@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250117211349.3237123-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd198fc-c81b-4eca-3264-08dd38fea368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmRGa3ZBWW1MakFYczg2TXJrbVRCaCtwN24rVUlIMUkyMDNKVzh3UUFJcnR6?=
 =?utf-8?B?NTFOdUJxUTlqVGNCTStIdm9Jamt4anhBeGp0NHpRNU5HYkpRUzB6RVdCa2hB?=
 =?utf-8?B?cUU2WVFUNFE0bHBab0RjaEVYTHRZNE1VUExOcWFSVExldjJPQVRxYWh4ckxY?=
 =?utf-8?B?cm5sYW1wTFIvQTNZZG9TSlVrYmZGcS8wRGxHdnNtUkkwZnZxWis2MUpqQmhE?=
 =?utf-8?B?ZGlwcGNvWkp3U0lJdEF6djRmdkpKdzl6ZnhLL09zSW1TQ0c4NzJjUjhCbkt4?=
 =?utf-8?B?QmcwTG91UmJodC9odUpqeGxMM29FTHVDdzlUV1c0RXFxcjZmYklwMnZ4UkxU?=
 =?utf-8?B?YlMreDk5bGZZM0Z0dzFUaVpmK0tYRFhUTTFmQzlXQWlBNEszYyszVlcxS09u?=
 =?utf-8?B?enZYci9YUmcwSWpTKzgwTlhGcXFBK3N0b1piTVhkUWE1R2p4bzB0REFlcFRY?=
 =?utf-8?B?cmtzT1FJc3YrYVdUdnpOTW05K0JMZXJhd2ZFWmwyeWZMMlBmYUFsVEkybkcv?=
 =?utf-8?B?WHlrSHdoZHlMMjExWDh2bHNkMkl3QWpOMGU3SUZxWTQ3SDlEMlFmQUZ2aVhO?=
 =?utf-8?B?Nyt4QlNaUjNSK0gxb1FvcmFTMUpCNTNQc2NIRi8wNEc0dW5XOW9MaFZzbVh6?=
 =?utf-8?B?c1hhYXVDWDh1M2lBZ1ZJWE1OYW5WZkwyV1U2WUdyYWFMRE5sM2FIV1NTVjJW?=
 =?utf-8?B?NlIzWWNUcVp6OEZPN3U0TW41bWZtUG5vM0VNdWx3NlBteE5kdlhDcVZhemhX?=
 =?utf-8?B?Wkc5aGtkeXM1bFJqOVNlcUZJbWZiUU9uQmZ1QjE4alkzczFEa2dFVnlnMkQ2?=
 =?utf-8?B?SEZwcjAyMDVpOHBic21Nd0V3RG9yWTFjMTlHRTIzWmxHWDQ5ZlNuVGU1K21u?=
 =?utf-8?B?QmVFdC9nNjlQcURZWGVLR25CaU5ZdUhQNlo1ZEFkVHFIWTNyZktZSnExRXRX?=
 =?utf-8?B?TUkzWVNxRVp3STBBVXpYenBzYVJCbVNOcjhHZ1NQQU5qb2xVcVVzV1hGWHBy?=
 =?utf-8?B?R2Fpblh0ZkhVNDlac2MwWk1rR3ZVMFl3Uk51WjlEY1RabnJITFd1UVZRMW1T?=
 =?utf-8?B?YzZ4MklzcmFaMEdHRlJUL1N4RnZmL0xRNFpRb3pqdVdHQS9TVkxMOVRHc1hy?=
 =?utf-8?B?S3JWeXFJRkJXemJ1STJRanptY1VTNmxOYThhTUJKdmJPK0ppYU01WElHVjFD?=
 =?utf-8?B?ZU9tZ2FGaEgxWTlydXZHZXJoYkQvaTFlMG9CQW0xdnFEUzBzeWg1L3dOazIz?=
 =?utf-8?B?WVhGY2R4ekxGYWpxRmxoa2tvRWVycm9aK1RBWXhIUEIySDBScTRHOHpDMTJS?=
 =?utf-8?B?NFBSUCs1eXd0elpmb2NKWE9Oa3EzYmhrQVcyb0pIdjVlQk1DK2o0R1h4UmRY?=
 =?utf-8?B?dHBXZFpnbk1pYmoyb3NFbXhwSk0zeWdUeDFKVGVSTzhhN2FIamlYNnFiVVZ3?=
 =?utf-8?B?bkRNWVpkLzhZbWRJR1ZPOVlMSm1Rb1pRZTRvMjVSckJMQzJ2cGVhR1NYaEps?=
 =?utf-8?B?ZThHNCtnTFljUFZCSEgzR0orREV6d2haYXNEKzU0R2Q1aHU2N1NRc1hqTDNU?=
 =?utf-8?B?NGM2OTRNWExWcmN2SnJDNEZhU1AxOEhud3EwWk5Kdzhqem5lak5YSnlJR0JF?=
 =?utf-8?B?S2ZpaVFBL0tRVzZoMHRXMmxzVGJsbVB3TTNzM0FLZmZYUzRodnU0dnYvcFhV?=
 =?utf-8?B?TEdOL21zNXJ4VnJUWHdiOWRKQW43V0hRb0k4bHpXRjNob0RiNEhKRVVrbElJ?=
 =?utf-8?B?bkpyMHl4eGk3Qk4rN21UeEplU3NFMFVoTVorMXlqaTZwVW9oS25lRzZBdnlu?=
 =?utf-8?B?cnNGWW92eDI4cmd6QVAxNDVlRjFPYVpFdDdpWTNFNzBaRTcwYUcrS1BxQnpK?=
 =?utf-8?Q?Wv4l5JGP8QpL+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0lJRE1veE44U3RuUVc4M0N0c09sTDJVdlRvdVI3RTh0RllrNlZYZEZjMnBr?=
 =?utf-8?B?ZThRcUZMRXhIb3hSMUNGU1hkbWlZNm41SFhiZTRBRlk0eFRYTUdYb1p3Zzhu?=
 =?utf-8?B?d1FtdkNoWXVMUVUwSTdNbnArSDR5UGtQc0l1Rm0xcmlLejdSMzRRVlhjeDlM?=
 =?utf-8?B?UmQweXhwZEpGUW5rUTB0Zk9UNHJhYWFxMURjRWs4ZXVVUThSRUw5T3ZNbFVP?=
 =?utf-8?B?Q1loSjNLY3E1eE9QWmVqckd1T2JJQVV5U2p3aDBFc3pObGxaakFjRk5XMGF0?=
 =?utf-8?B?VTAxdllKbFEzTDRNMG03aXlnYmtlVS9ORUcwT1JoUXc5Y3Z0UUVNLzdOcEtD?=
 =?utf-8?B?N2hjT2YrdnJVcFlyS3U2NDlaT3k3bUh4TG81aWJEY01mM0Rvak5OZ3lnaXh0?=
 =?utf-8?B?WUdlSUppWTgzMzVQQU5uTFh3ZXdlQ3JVNEtGTXkwdldnYkpBUUV2Y0lhZU5M?=
 =?utf-8?B?c3A1Syt1blN6cnl4VmJobHErL0ZpTUtmdGErWWcwaTJaa1lKSkpuMmFrMEFt?=
 =?utf-8?B?VGpjSkRpWmxkUVhuZWFjN1dnV3NXektsOU05NXFMRkJuOHp0MG1nak02cDZq?=
 =?utf-8?B?b1gwaGsrdVhlNWc3WnlGazhtQUNCUzdGQWZ5bzFMeUNYN3pmbm12Q0RZU1Rz?=
 =?utf-8?B?UmZ4S3p6bm9wYkU2M3pHT1E4eWlCMmNHNUh1bHkyYnNyQnliNUYxL1FTbnNx?=
 =?utf-8?B?dVlDZHVrNm1KSHB5bElhNHltakxnMng1VzdWelRUQW5qZ0pYYWpuY3g5ZjM0?=
 =?utf-8?B?WWUyVEdmeCtjaFkyMzJmTzZUNzZSVmVkUmRIWHR6RS9vUE5ZbzM0WEw1TTZO?=
 =?utf-8?B?V1dDRXdvL2UxRjVtcjNYRm9lTHN2UjVjVTJ5UWhycjJxRUt0d1poQVpiQ3dR?=
 =?utf-8?B?ZjlPR21DWTkwVzVGRkpiQytjS2xEMXNkVE8vclpEdU15THJyWGxjcXNQcndo?=
 =?utf-8?B?RWJQaXBkeENIQUppTkVBRHJZVUowL25jbFJLeHByQ2laMzcrWVlRUG1Vc2NL?=
 =?utf-8?B?dHpRMUpyRmFmTWt0ZU9JZUwvcnQ0OVlzWks0Nlh4K0dLdGxUTk4zb0hscldJ?=
 =?utf-8?B?S0pyRkZHNmVxc2ltQ0MxNGF3M216MEJYSWd6YmlBTG5XSmZIZml5ZzkrMllE?=
 =?utf-8?B?UU1aLzNmWEhoN0U1OXZtUDVwOFFLVkpOd3dxdk93UXFOYzM1cEhDdjFEOEQ1?=
 =?utf-8?B?dVRnbUEydlRESkJLd3c0ZU9BcnFRVWtENXpFOE9VTC9pemI0S0pRbVdCaUFo?=
 =?utf-8?B?aFMyY0NxN2Z5RDdKUGZqd2JPY1pRMHE2RzRPSWZzejhFb1ZpUEpkZ09NVGNO?=
 =?utf-8?B?MlRxQzlMbktFNjF4RnUvUjVqRC9RdzkxMGEzTFU0amJMb3g3cExQOVRQSTZw?=
 =?utf-8?B?M2NldERFWGtOY1dUK2RpL0cvOExBUndEVk9HUTBFaEhVakY3MTJ3MExzVUI0?=
 =?utf-8?B?ZG90Y1JqOXlGcmI3cFQxQS9DZktiYmR2UW9mSlBMK0UzajJ1elUrLzRrRFNT?=
 =?utf-8?B?VFNsa1NMeElOTERHT3c5QUhaNUM0TnB1ZGtVN09XOVQ4NTE4ZUJDSENTQmdi?=
 =?utf-8?B?R3FLS0F6d0VsazdldThVbFZwUWc2aHBNcHhndGpnbkNod2xhL2cyVTlMOHVa?=
 =?utf-8?B?VWhQd0NkRDVYVStwbVVUc1ROd2xKeDhURGZEeDJ0TmRWdnlxT0tsN2VxeGdK?=
 =?utf-8?B?QzVwK0hTTERLaDlhNjIvTEJuQ2ZsY205YWtsOTI4L3lNQVFvckhiMkZLS0pM?=
 =?utf-8?B?UWhXbTk3QVJkMlp2YWNPdEFnMzB5dzhoWXNKVTRjUEZVR2JyNW1lQ0RxVURO?=
 =?utf-8?B?UnNWUTFSWm9sSHgrTThRQldHMjhhcUZnQzJuYTVkWDVHcWVlYVRLbytRYU1O?=
 =?utf-8?B?R1crR2xNaW9FM2VtSEFNeXUwdnBJMFNpMVdKbkxqL2xwc2FXSDBLdUR2TUJ5?=
 =?utf-8?B?ODBZaXNtOGZIN01VZzdKTEJneFR6K3o4UThrR0hkai9Qb0VPNGsvOVlSVndX?=
 =?utf-8?B?M1owaFlUd3VRc090MXdOekcrandaMWhETCt1SEVZNUNXY3lLenNncDZCZUtO?=
 =?utf-8?B?SHBsVVRMYXJPeC9kSll0bUswcUZDanp3UDJOaFQ0eGkvT05HNUJtZnU4QlZW?=
 =?utf-8?Q?dAVx97vLitjWn/GfAiZf20NNd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd198fc-c81b-4eca-3264-08dd38fea368
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 03:00:47.2399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lba+8/grqM2CstAHjomR53sqvUfmya1e3hl0Lb3yoP1S+SapmbSQFd3HzcYqWxTPB+Zioo8eEd1lYSs+y3bf8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7088

Pulled, thanks.

On 1/17/2025 15:13, Alex Deucher wrote:
> Hi,
> 
> Updated amdgpu firmware.
> 
> The following changes since commit 6dca30000d8aabdb8d6b540ec8901ea7956507c3:
> 
>    amdgpu: DMCUB updates for various AMDGPU ASICs (2025-01-17 03:00:38 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-01-17
> 
> for you to fetch changes up to 95b18682465584a0178b496ce13fa96b74d61988:
> 
>    amdgpu: update psp 13.0.10 firmware (2025-01-17 15:55:55 -0500)
> 
> ----------------------------------------------------------------
> amdgpu: update firmware
> 
> Based on internal git commit:
> ed603f9ea0fc91f92f7ef70a4b2890296f75fda0
> 
> ----------------------------------------------------------------
> Alex Deucher (25):
>        amdgpu: update yellow carp firmware
>        amdgpu: update gc 11.0.2 firmware
>        amdgpu: update psp 13.0.7 firmware
>        amdgpu: update vcn 4.0.4 firmware
>        amdgpu: update navi10 firmware
>        amdgpu: update gc 9.4.3 firmware
>        amdgpu: update gc 12.0.0 firmware
>        amdgpu: update psp 14.0.2 firmware
>        amdgpu: update smu 14.0.2 firmware
>        amdgpu: update navi12 firmware
>        amdgpu: update gc 12.0.1 firmware
>        amdgpu: update psp 14.0.3 firmware
>        amdgpu: update smu 14.0.3 firmware
>        amdgpu: update navi14 firmware
>        amdgpu: update sienna cichlid firmware
>        amdgpu: update navy flounder firmware
>        amdgpu: update dimgrey cavefish firmware
>        amdgpu: update beige goby firmware
>        amdgpu: update gc 11.0.0 firmware
>        amdgpu: update psp 13.0.0 firmware
>        amdgpu: update vcn 4.0.0 firmware
>        amdgpu: update psp 13.0.5 firmware
>        amdgpu: update psp 13.0.8 firmware
>        amdgpu: update gc 11.0.3 firmware
>        amdgpu: update psp 13.0.10 firmware
> 
>   amdgpu/beige_goby_ta.bin       | Bin 242944 -> 247040 bytes
>   amdgpu/dimgrey_cavefish_ta.bin | Bin 242944 -> 247040 bytes
>   amdgpu/gc_11_0_0_mes1.bin      | Bin 217408 -> 218080 bytes
>   amdgpu/gc_11_0_0_mes_2.bin     | Bin 256528 -> 256000 bytes
>   amdgpu/gc_11_0_2_mes_2.bin     | Bin 256528 -> 256000 bytes
>   amdgpu/gc_11_0_3_mes_2.bin     | Bin 256592 -> 256064 bytes
>   amdgpu/gc_12_0_0_me.bin        | Bin 410688 -> 410688 bytes
>   amdgpu/gc_12_0_0_mec.bin       | Bin 447456 -> 447456 bytes
>   amdgpu/gc_12_0_0_pfp.bin       | Bin 350864 -> 350992 bytes
>   amdgpu/gc_12_0_0_uni_mes.bin   | Bin 709920 -> 709520 bytes
>   amdgpu/gc_12_0_1_me.bin        | Bin 410688 -> 410784 bytes
>   amdgpu/gc_12_0_1_mec.bin       | Bin 447456 -> 447456 bytes
>   amdgpu/gc_12_0_1_pfp.bin       | Bin 350864 -> 351024 bytes
>   amdgpu/gc_12_0_1_uni_mes.bin   | Bin 709920 -> 709520 bytes
>   amdgpu/gc_9_4_3_mec.bin        | Bin 268736 -> 268736 bytes
>   amdgpu/navi10_ta.bin           | Bin 33536 -> 37632 bytes
>   amdgpu/navi12_ta.bin           | Bin 33536 -> 37632 bytes
>   amdgpu/navi14_ta.bin           | Bin 33536 -> 37632 bytes
>   amdgpu/navy_flounder_ta.bin    | Bin 242944 -> 247040 bytes
>   amdgpu/psp_13_0_0_ta.bin       | Bin 255232 -> 259328 bytes
>   amdgpu/psp_13_0_10_ta.bin      | Bin 251328 -> 251328 bytes
>   amdgpu/psp_13_0_5_ta.bin       | Bin 230400 -> 234496 bytes
>   amdgpu/psp_13_0_7_ta.bin       | Bin 230400 -> 234496 bytes
>   amdgpu/psp_13_0_8_ta.bin       | Bin 226304 -> 234496 bytes
>   amdgpu/psp_14_0_2_ta.bin       | Bin 258016 -> 258016 bytes
>   amdgpu/psp_14_0_3_sos.bin      | Bin 431536 -> 435632 bytes
>   amdgpu/psp_14_0_3_ta.bin       | Bin 270624 -> 270624 bytes
>   amdgpu/sienna_cichlid_ta.bin   | Bin 370432 -> 374528 bytes
>   amdgpu/smu_14_0_2.bin          | Bin 333236 -> 333236 bytes
>   amdgpu/smu_14_0_3.bin          | Bin 333236 -> 333236 bytes
>   amdgpu/vcn_4_0_0.bin           | Bin 395632 -> 395632 bytes
>   amdgpu/vcn_4_0_4.bin           | Bin 395632 -> 395632 bytes
>   amdgpu/yellow_carp_ta.bin      | Bin 230400 -> 234496 bytes
>   33 files changed, 0 insertions(+), 0 deletions(-)

