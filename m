Return-Path: <SRS0=szi3=GC=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73972C0032E
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Oct 2023 19:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DF2BC433C9; Fri, 20 Oct 2023 19:07:58 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F05AFC433C7
	for <linux-firmware@kernel.org>; Fri, 20 Oct 2023 19:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F05AFC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrGG+tzHtRkfQs+q28M91qXCZxHQg9EZOcsZNL0X8VZ8biq+RAkqZNokkpKtWu/sXKYCXgCVAUz9TNmzhCMHzQgbh5xRgdnBj3tAeOZqebBa6qyPCMwCncgxFtItg2S/Eugu0dHpgQfhcgcyfIRWpE0SzCb9xRwgshMfC5WEiGJJVJjEgCFEbauAhKPZK4wF0VWw1vIE5vfXm7/RFsIQWnOt5GKpm+gwiZ+0FEVKFr16knaIEkZUeM4zfHtP4Y9WiUypD1K5nqzFmedu6Sz4hieHxratBGTu6/zLxKKY/HPezGx4+2G8YKz0a+j82nR0B784PQNsOjXcD2Lz/GPiCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frXBpmb2foKRSRn8/iACAQzkaTQONMH4NZb7sB5mLkY=;
 b=cVIhZYczIGTIsXJuKbP7+e6ZVd7MZk+ri3gi9KkrRBWguq77qKPjtW5jzzfx/vvq7sT55nCh+Vk2MKX9kzdfczeyStVM4Y8b55icnxAZ/Sv53ka5A9ikJvByPkJUFjf28oshGMfxA9QR6mTezIDUipi4V/WgPV+4huhU/8ikoQYmHe4LKFsfhXE1OUVlp1q50fGDEuG+G1rsAEvV2Jt0/ylbi5J4pmKAV7u+tHLv9egp99y4EISn6L8K6X5Jhuc9IOAnPwBaMehBJVQ9O1eUxZ851YF3YOetv0nVqccOhO3RMAaZVHAIGrafhQN1ZHQgEGh3NCX/+kUOP13kM2nWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frXBpmb2foKRSRn8/iACAQzkaTQONMH4NZb7sB5mLkY=;
 b=p6+GdZ+yz/oWd/nKpYhW+tlXTLAecvN2KYkK8YJssf/xH7he8KIkjq795tZ6MNDWgeqYrpFUBph9t/kTiQCjQk35uUHl+/jmR4NrTqycbmiAOWMJLbOk2JRL6aqTDfrPuyPBVXtmmctV9q9agMZlW66ee/xYklGudbim6VFkv/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 20 Oct
 2023 19:07:54 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::83d7:9c4f:4d9b:1f2a%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 19:07:54 +0000
Message-ID: <976a63ba-34ab-4554-9937-5c0440752fa0@amd.com>
Date: Fri, 20 Oct 2023 14:07:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-firmware] rtl_nic: update firmware of RTL8156B
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Hayes Wang <hayeswang@realtek.com>, linux-firmware@kernel.org
Cc: cyrozap@gmail.com, fejes@inf.elte.hu
References: <20231020070632.1188561-435-nic_swsd@realtek.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231020070632.1188561-435-nic_swsd@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0113.namprd12.prod.outlook.com
 (2603:10b6:802:21::48) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: a66db26b-c472-4012-d0c3-08dbd19fdcdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iWzfG6V1AkIq07rWiSv8ZLcTPrMghdGqfKF/3HU/iW/mT4WaBJrgGXBsqjjbEH/u657UCG0DEN0BkWehFEbCtPVdSt9S1825KIgZCebT7g2sZfRuwv0i+6hZrBYn+8H5T0mXfxIbKQ6SQh+BukMuide2smLYbmbpKPbXuxla/dzwVBeMin/6RiU8sF5LLj2uX5SPtkC7SfjGVsxTjh0+HKzB4WnqyeT6FeWERrdnO4iXKK09FIEy6CeX0Hg/2fBSrthTxne6nPNJqfQeDqjTzV1l2A5sHYYaDnny9EuadB+kw5NeUGL/N4Zn0wmueCBsxzljrC1fPl74eUSnlKZTUcOse2YGsbjDGVq85bx279jQ4ADoM7fVOuAr0WYwyG7jjN31lrjHvp8mnOxm2TIoLD5zqM42mRPK2/A+EkSuer6/TNnr0ytWebWAUD57wmT3TbyT6drXYlKzH5OXd4PqvyVmvU4Drr1IpfZ/nrT1Q55K0Ufbh2D2DEVwAoiFEk6miaz4HimfTWqVGzneZLDyp21Pcz8W7wEw1FTfK7MGJRaeWNI/NXWEhH6aq6Aat69kqXxWyH4BuvYj2Eq9FiW7iAxL0zdXv74x7Wt9o4Axb1NNeHOav37sZy3utONSzm5mILQnz8opSXPuN9BdKad6U43QrSignDonbAjVVRP/fLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(316002)(66556008)(26005)(2616005)(6506007)(83380400001)(6512007)(41300700001)(2906002)(53546011)(5660300002)(6486002)(8936002)(44832011)(8676002)(15650500001)(966005)(478600001)(4326008)(6666004)(38100700002)(66476007)(66946007)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Njg5Umd6OGlPdnViMUNSeEhscjhCVnIwVjlQUHJyS0ZBVHpUd1p4aTlPOWZq?=
 =?utf-8?B?OEx0Ty9ZenhheExTNzBJbDcreWRRWHRydlNYb255U3dQZGtpb2czaUd2RDYw?=
 =?utf-8?B?V0dzb0FQTzhCZStaMmlJUncvaENvL3cxWUZpUjE5WlgxL1p0dmIyRHdUVjVG?=
 =?utf-8?B?dkZXR05obm5PSEd6M0IrSWFEUlgzOHNmSloxZVR3clBvVHptdzRRSDRDaG13?=
 =?utf-8?B?bWtmNjhleTdPMEp6V1NlL0g0V1ZvNVcvTTB4Tk1xL3kwNkRqbWt4VXNUUzVn?=
 =?utf-8?B?Qlo0Njl6YlJSVG5YRU92UUI0MEpQR01oUTBrWjRJMGJ0NFI2OXRuOXBVSStJ?=
 =?utf-8?B?VzRmUEFDOE9iczRTUmdMd29QWE5DV0J0QVFnKy9RM2ROWXZUZTA1U2ZkbFdY?=
 =?utf-8?B?QzYwYXVtaXRUTGJwKytXbXFEYlg5cktvVjYzbys3SkpRbnJlWTZQNE9qenZk?=
 =?utf-8?B?N3EyY0x3NzRqY25PNFhFY0pMZEowbCtJT3ZCRjlCMVJzemtEdTRoNFJMTG9C?=
 =?utf-8?B?WkFoNjd0MmloOUNyMGQ0S2xkV1lpRlhmOWNvQm1vNys1VmMzcW1tM0ZEZy9w?=
 =?utf-8?B?VWhlWE0rVDIxVDc0b05LbWljYjNhMzRmWTJDWXN5WEhGVnFnOCs1ZkxpV0hr?=
 =?utf-8?B?Q2d1VkdLVWQvTGtXWmdUOGJZaDFySnRaUnNTbHh2ZlRIRFFCcFJETlRPQjRQ?=
 =?utf-8?B?ay9vYzRqanRRUWpnVU9hcEVBR2Z3QUNxeGdCelk3aG92SDYvcGRnVnljNkk4?=
 =?utf-8?B?VDdGeWcyL0ZjNnpHMXdoLytUK0paZTZ4ZVZBYjdzY0RyellsQmthUVVDbmxt?=
 =?utf-8?B?YVJBb0tWOTdZMkFoWnJSMmVkZ2w0dVNlMHVLclNQSGcxdzhOY29KVklkWnRR?=
 =?utf-8?B?QnR5bkY4dS81ek5rd1hYUGNpWFNsZ0g1NDM5eDNTRGp6aWRSSWlienIrTUFM?=
 =?utf-8?B?SGQ4REhydllmWEx3bUNOZFJ1VEJuV2IxdFIrajNIK2tZZ3Qrb09KRlpRdVRD?=
 =?utf-8?B?cXB1S3JKNnp3empDMEVBaU8rRGFGZ0pOMisrNlY2Z3E0cW1pV3VyNnNjblVG?=
 =?utf-8?B?U2hGa1paTjVidnNtVFFvZTNwRUFkWVV4WHRWblNNQWdDSzhON1J6SDFGSlpo?=
 =?utf-8?B?TVhRZ0hLRlpnM2F0dHdtZ1hBQ2h0RmIwL0VQUUhZaUU3elBYa0pZQzF1d3Fk?=
 =?utf-8?B?YmE5U1IwMmRrS0pqZW1oeE5iL2pENjBmdG5CbHV5TTU4L0VPUW9VcmNmTEY3?=
 =?utf-8?B?eGp2OHc5WUpLajF4LzU1V2RWZ0J6Vmh4VjdQSlNMSE1Xd3JCbjRCUFRiRjJN?=
 =?utf-8?B?RVlDS3FHNTJNT21HVFMwYWtKekJKanVZTDJxVzVXKzFhSEN6YmF6ZVo3dzFP?=
 =?utf-8?B?ZG9GOUxGT0ZrNlZpRERwOWVwUVRGL2R2a21sOVlxcGNnWjZjYnpFcVZuRWhK?=
 =?utf-8?B?M01YOGtmeCtSbk9DaEt6OWhuTjZSa0tYQ0xQelkzU2lXUG14N0xlYzhvU01v?=
 =?utf-8?B?VEdhZ24za1RWSWRiVUlXUXk1SG9HR2ZkUHNrYi9EdnVtV3h2ZzdoTEVSc1hO?=
 =?utf-8?B?SFJIcG16Qmh3V3YxcVgyZDE0R20xWnZhMUtac014UVZhcXF1RTBLMVc1Y1Z5?=
 =?utf-8?B?Tzh1ZFF2bFgrdEZoaFdsQlhTUnlBREwyTWZJVXlZai9UaFJ2T1BvdkJnb283?=
 =?utf-8?B?THI5aG1ZazlFYzVLSjAyQXQ1RWlaVk5QTmRsKy9MejYvMzBjblp5blRPLzNj?=
 =?utf-8?B?dzBjQlJaVjc1bFpFb3UxME9rKy9SclBrVUlva1VRRUluWVJiZkVJTUl2WEQ0?=
 =?utf-8?B?dnJsRHdhT29DWnlaQ3p0YzMrUmFIb0lJazlrZlpYNUV6OWk4QWNiRGlCeUFS?=
 =?utf-8?B?TjMrdU1zai9FOFFuKzk5T1VTbTNCZUl2TTRmNi9RM2dYSDR2U3FPeno0a2c1?=
 =?utf-8?B?NFpva1lOcjhPUWdNeHAvMjAzOW1jY2JXc1dETnhIb0JHTkVXU0h0VXZGRGw1?=
 =?utf-8?B?VkY1UHEvVVhGemY5dnMzTXNaZGd4MDUvSWUwdDVMb3hadWRnWURqT2pRTkdk?=
 =?utf-8?B?YmJUU0c5Z3VDczE1WkE4VG1oYmVTaEVacWl0YndLY3V2Uy8vajJTV2hVTnR3?=
 =?utf-8?Q?zhJZHGsamDvdxy6QAyCQ1b0D2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a66db26b-c472-4012-d0c3-08dbd19fdcdf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 19:07:54.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHO4DYumhmRjuiayr/nX9atn2L4PKySKVzybJMbxf0YrFjI4ZHPbNrVeXULY/7oJBDQE15drzQKjluenvT1vlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010

On 10/20/2023 02:06, Hayes Wang wrote:
> rtl8156b-2.fw
>     version: rtl8156b-2 v3 10/20/23
> 
> Signed-off-by: Hayes Wang <hayeswang@realtek.com>
> ---

Your patch failed to apply.  Please try again.  Binary patches and email 
can sometimes be problematic.

$ b4 am 
http://lore.kernel.org/linux-firmware/20231020070632.1188561-435-nic_swsd@realtek.com/
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
   [PATCH] rtl_nic: update firmware of RTL8156B
---
Total patches: 1
---
  Link: 
https://lore.kernel.org/r/20231020070632.1188561-435-nic_swsd@realtek.com
  Base: applies clean to current tree
        git checkout -b 20231020_hayeswang_realtek_com HEAD
        git am ./20231020_hayeswang_rtl_nic_update_firmware_of_rtl8156b.mbx
$ git am 20231020_hayeswang_rtl_nic_update_firmware_of_rtl8156b.mbx
Applying: rtl_nic: update firmware of RTL8156B
error: corrupt binary patch at line 153: --
error: unrecognized input
Patch failed at 0001 rtl_nic: update firmware of RTL8156B
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

You can also send it as a merge request here:

https://gitlab.com/kernel-firmware/linux-firmware

