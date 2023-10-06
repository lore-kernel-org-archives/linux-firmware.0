Return-Path: <SRS0=VTOh=FU=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB8E81DFF
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Oct 2023 14:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DE99C433CA; Fri,  6 Oct 2023 14:29:12 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1604C433C7
	for <linux-firmware@kernel.org>; Fri,  6 Oct 2023 14:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1604C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nkkBLfo6xE/nJ32xuqX9k6pWuT+vtJ+15HF69X0cAjt5T+rBpQuoP0xcPFrVdhR/XoRZc5mT22QwyAr4cFrxtlK3gQ8ZXzGaWdvoTgYqp0gKZOXTOx89DongB7YeTQqxYJQ9DoFmUPX7j4YtCU0u5UjEsNxpyRCovH1fc2szQXUaswEj876WjAEEYAE7ooaOwLcO9ZcqZNdag03h6AMc3FrHVL/zhahtwnKpV1ClXDtHGV+teWNu4SuKJEdcY8P5Ln8bMGYUZWhvakPKciEw3aqji86lUKd0M94YQjv8Tpjm2vpy4RrcykQVnPPGVENxx3MuCpc/DzD0gy6JjpbdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+S8DdrIKyDocX0uHsOfbTU8Ep8OHd4Np+hc6X2mDZE=;
 b=niEa7eqVA7k+ingduZ7lJB+pmes2BrkLzpQJ9ezsJJzXYuqodPRnpAfIROoZ1rg+o5uah9K84SmcYWvFRq3UwqyAH0szHDZb1hhfgHkl9fVzYhn4taZkr9O7H2u8EFYiZG9N/gAC6S4TmsNB6Qig7ItAQCkw+XbEkt6izYpg0aBngBpASECnee1fGr0xw13Vf8WDdaljnBhFbxFkZggQNuCnv5GZuZgcegf6oiCBz50OGvTHS7Rn/Rbdylj+CdMsVMUFuzIN1GSu1r9Jf4TqY4vooKUT9madUUwnfdlE/dFi+tyRDCHnJPiOXlvVfO6UGNXuhkcM3ha1W+sYwaRmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+S8DdrIKyDocX0uHsOfbTU8Ep8OHd4Np+hc6X2mDZE=;
 b=opNcbsT5I+CURMW7fz3QaSI6E/Q8l7Ju9L+KLpxjkc5pU4Oj2745w4+Q3qwtVNaxaMq7Onk3VRoRjjqGE4c8JbxViqp0oQurmVub0jUaroNkJFnhcZZN43RHaKjK0atvsv7bXu6cQfp8sXTNercZRSUTKNZsE9FUI95TZxP9Kng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7631.namprd12.prod.outlook.com (2603:10b6:8:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 14:29:07 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 14:29:07 +0000
Message-ID: <22b982ca-b90a-4e0e-a076-7b0a9d10f52c@amd.com>
Date: Fri, 6 Oct 2023 09:29:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] linux-firmware: Update FW files for MRVL PCIE8997
 chips
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>, linux-firmware@kernel.org
Cc: amitkumar.karwar@nxp.com, pushkar.sudame@nxp.com, shailendra.gupta@nxp.com
References: <20231004122904.658513-1-neeraj.sanjaykale@nxp.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231004122904.658513-1-neeraj.sanjaykale@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR17CA0001.namprd17.prod.outlook.com
 (2603:10b6:5:1b3::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e6e2a5-8f82-4fc7-3f84-08dbc67898ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8jcLBnLBdY9j1omL3Zf3I9Zt8jbpK5OtQYR29+TOplX2PHpAo/bibXurilUiHIKtz66oIKOfpNYQfitzS04bcxdt1iv6M3ECae55ewwbGRfb824gc6nCV3WVrIfLhlmRJFgd+phWYfxqkoKAqs9Xqh96ZCqep2GeYvC4+jpqDiOi6fjnyRq1Xl/5LvbbRvfh5GinHXPcMXGmblNEdDxVKKIdw1VhcJa0uvpGlBaRTzjTwDvJEWkg+pzYoM45JpHSpluNdCmJjM76gkv7qAfj3LX1l3wjbTXXvaihJ1MbAN4+VCaRd8Z9udaOzDnAsIkvgioZdcEBVJ3G7j98OmjOorhnhGzh0M3L0sxbHGz+fPkVc3kQy8ymUYY1UwaIjf7zXJYnd1xYFEifSjb7VvBUPiqL+rzcyDpJ5djaJU5WvFCWzP+R6MNmWtGtA/TtfYvbGMKJ2O/u0pueQs41Qm79RAMtXyOSatEu/rxk7UtKvKAiqVhnn0y/m66hn/wioX5ksUAjfWbYcFOAOqhJ+oBqswBCeAvWxyunxs1yVlJviL3R5jjetdNa/wiJrdI8KCqg56auGEunMZfU8RsuXkdSS6ng9F6AsBnguP20/RS8Yxu/11yxxxyKsrY9Pt3Fdnn0wDd2vNx5dPE1X2qY5LUE5A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(376002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66556008)(66476007)(316002)(2616005)(66946007)(41300700001)(6512007)(53546011)(36756003)(26005)(6666004)(6506007)(6486002)(38100700002)(83380400001)(966005)(478600001)(86362001)(31696002)(44832011)(15650500001)(2906002)(31686004)(4326008)(8676002)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzBaWFdDUzdxcmRPc1ROT0VaOTRuVjVaZGFHL2pUblBrK0FMWjVuV2YySG1P?=
 =?utf-8?B?OGFVOGhUck1wVDZXVnMrbDlpTEsrUzJJc2Qwa3AyMk4vektST3ZPbDRzcjRr?=
 =?utf-8?B?Vnk1NlNzZDhERnhzVlFCZG50cWNzbnFhbmgwZ0QyZ1YxRHpYOWJWQVlUcHlq?=
 =?utf-8?B?aGhjdDhRQzVCVnQ3Z2RCaDlKaVJtTHFkTmYwa3ZLb3R2VEtsYW5VdEI2alVN?=
 =?utf-8?B?OHorUWF2Z3lvZmpBcTlOcENBdSthNTVqRHlhZDdtbnFkK2NacGRaNHRwVGZu?=
 =?utf-8?B?Mkl3b0VwNERkZlY0MTVWQWdUWkpVeDY5WEtNNXZ1TDZEdzNyZjJJL1VsZVlG?=
 =?utf-8?B?ZkVUR0poKzRMRXhpUWF1ejFQSnVSa3M5VFZMMzdtVitUTlpnOFN0aC9xd3lq?=
 =?utf-8?B?QlRnYTd0M3VPSVgyalVDZi9ualhabEFuUG1FcXhOaUZjOVgwR2JBcnBrK2pL?=
 =?utf-8?B?KzRXNHV4RlpNMlE1VU0vNlQzWnRzWnhzUHl2YnloZnNheEhieU1TcXBHNXBR?=
 =?utf-8?B?dDg2dXloTFVQeGVxTDVlbTY2azRKWW0yM3hCZWlLOHhsaHFNSlZIRmlucUNU?=
 =?utf-8?B?WkcrdTVIRU5EWitmalEwY0UxdmNJbG90WlhPa0xTTlB1UkhTV0cyaUIxSldZ?=
 =?utf-8?B?V3FRMWZwVW5qVysxOEJRbzF2NXBkamxjL21mUGthMk1JUVpWR3phcUJ6bVBz?=
 =?utf-8?B?dkNiNWpzclFWcjZsRVpzaXJERkFaQk4xKzk2bWt6N2hOaHZxTzhWUmlOV2ZN?=
 =?utf-8?B?djdWOVJvcGhKTUZ1c0drOGRFRDVmRWp2UUJPUzVsUWNsWkcvZEdrY2M0WkIw?=
 =?utf-8?B?cjRUazhYTUpmZjNDUHZJOU50bTZ2NEhjajJBbXp5TmFIUXRkcGUxZENJTVdm?=
 =?utf-8?B?ODJ6Y3B4eHRaSEdyYlRDamt0eXE4YWlWdmdEbmNDWU5TYUphMWQ5K1pjTEdJ?=
 =?utf-8?B?Skt2OGkwUVl0T0xENzU3Q3RVNjBSZ3FFZldROUtoSnQ1SlhScEptQlN5MEJV?=
 =?utf-8?B?bE5JMm5lZWR6L1orQmxOSGsxQzNTTHlBYVpGOUNtT0lEaVRPNEtOWWpnUFRQ?=
 =?utf-8?B?RmZQeC8yL0xFdy9xRWQwMzdmeTNQc3VEZE5CQzF4SnNydm05dHlMeE1sZGhi?=
 =?utf-8?B?Rm0xaWpUYnpsdk5BVjM4a0hUWmw3TVhlMmxUMTA5UnFlZWFmbG14MEtSS3ho?=
 =?utf-8?B?YmlvRVBCUXkraXR1clNubmFqNXZpb0ZpNkZFWkY2d0RnNitTQktwd2YxSmNR?=
 =?utf-8?B?bUkxRDhSNVhyaldjRGtpZ3p0bGhyTEIrdDVDQUlEZDZxdDR0ZWdkSXpaQ0NV?=
 =?utf-8?B?bWprME9qSHNKMVZyNGRxSW9lTnpBZFBQSlM3VFhadzlzejI2VGV1TlRKeE1a?=
 =?utf-8?B?Mjh4QTNITHp0eUI2NlRxT3VKU21xRXUvYVVVbER5bWJ0MHA2SWJnSGdDRWVi?=
 =?utf-8?B?dDAyRjZTWm93QWlZTDdBNC94ZXVGNmo5UUhrVytCZVBrSnJyN21UM3ljV2dG?=
 =?utf-8?B?aGpCdW1TWEwzTGtVN1pJRk5vcTBES3N2cjlpTVNONzdmNGVaY0lWd0U3WFBW?=
 =?utf-8?B?UjRvKzhyWm15bEZQbm8zSjc4Y0JTMmJjL2prV01zeStORnhESFRPcHoxMzRW?=
 =?utf-8?B?RzZkWmVMOHpiTFBlQ1lUdHZsV0p5RWdhelF3MFcvTEJjV0hBbXhqODJGMWl3?=
 =?utf-8?B?WkFYQmdPa0FONVdRZ2tkNjhwTFdDYW1kYVgwaTZROEpLdHBEcllIaTNYOUlF?=
 =?utf-8?B?OGdtZVJEekRBT0x5MTlqTTNVRnR5QVNoV0JOWHc3VUVnWlAzKzVLaVFIRlNT?=
 =?utf-8?B?V3hmdG9BUEc3NEd5YVlhWGYwU041ZjlpSDgwQmtDUFRLZkdTajBPMFNEM2p0?=
 =?utf-8?B?QlRRNG5Yd2hiVWVYc3Awam1SelF4ejBVR0QxL2xWUmMva2hSVUFDcVU0OThV?=
 =?utf-8?B?eHNsRzRxV25TN2dxS082QnhHeFFvM2hDNEtGYU1tZFhkdFl1MWFhK0VBNmVG?=
 =?utf-8?B?VnRPZnludmt3Rk52bGV2NEU3YXJwdXdIbHBwZ3U2UGRoaENQeVIwRG1rY1ZH?=
 =?utf-8?B?ZVpQMlVwc2VEWGZMMVEzK29rcGdLL0NGMUZ5OS9scEdHaGR6cHpNOElBS2Jh?=
 =?utf-8?Q?xE6s7EaU54xn03q+UrtsSJRLB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e6e2a5-8f82-4fc7-3f84-08dbc67898ed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 14:29:07.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OfMv0Tiiv7//uYMol3RgReers48Fczz19XB1D5ErcQudaXiFbkFPj146qpumNrwV+DU0D0gTtCSCefWI8LJpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7631

On 10/4/2023 07:29, Neeraj Sanjay Kale wrote:
> From: Neeraj Kale <neeraj.sanjaykale@nxp.com>
> 
> This updates the pcie8997_wlan_v4.bin and pcieusb8997_combo_v4.bin
> FW files along with WHENCE file.
> This fixes an issue where AP mode was not allowing more than one
> Ex-STA to associate.
> 
> Signed-off-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
> ---
>   WHENCE                        |   4 ++--
>   mrvl/pcie8997_wlan_v4.bin     | Bin 456488 -> 464500 bytes
>   mrvl/pcieusb8997_combo_v4.bin | Bin 638992 -> 639044 bytes
>   3 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/WHENCE b/WHENCE
> index dbcdcedd..f2c7df06 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -726,10 +726,10 @@ File: mrvl/pcieuart8997_combo_v4.bin
>   Version: W16.68.1.p179
>   
>   File: mrvl/pcieusb8997_combo_v4.bin
> -Version: W16.68.1.p195
> +Version: W16.68.10.p159.1
>   
>   File: mrvl/pcie8997_wlan_v4.bin
> -Version: W16.68.1.p195
> +Version: W16.68.10.p159.1

AFAICT this is already committed.

https://gitlab.com/kernel-firmware/linux-firmware/-/commit/1ed8d8bf7348c1cd586d24a2b89e7c94a101f3ba

