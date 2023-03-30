Return-Path: <SRS0=t0kL=7W=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7234BC761A6
	for <linux-firmware@archiver.kernel.org>; Thu, 30 Mar 2023 14:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36B82C4339C; Thu, 30 Mar 2023 14:31:38 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E1DEC433D2;
	Thu, 30 Mar 2023 14:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E1DEC433D2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es1dpA8oFAMjroFkjYLogFcQvXmAKgrvc23hreWM9X52KLahK0x2RPNXrY3iEtn1SvLVhUWtm+VBsR8fVn9tNBae07kCLDOmqTcXBqHoK3Hy4m4wpzpiM7sc+pB4kyR5zYQnBmbqjpi8O+qGweW90KYuYYP1cQnXSs5CnSQIKNWvIKroBRarkHIktxXPdy1qGXDPoy011qjFHq1zzSYpCnnh5O23+00ER1tdNB9XzJ/DCDI13C3CMegkxcnf8LyXUPcBM/SxNZpOIdQYbXVIkVnZU9KORd2ZM7XSMEKKZ05o49UOLM+62/dgRDBaw+RAUDpYkHPoNHl6h0paN65LiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1S8EqpYUwD/dnDOZrrvXJyMsvwiNgTqy2U9AJek/O4=;
 b=V7UlcquRElB1AjS2BSRTOgyo8kyo9urYA5huvf95GTia71czhpxLyHdlI1Z0ZBNvc/exNkhXAHBRnEK3bl0DDNIhTyDiMvHfXqDAT5TqpNM37U4klFH8AfRbIwzTxx9Hg6UIKtkDhEcownhvBS6hvEivsiE9hKS0ccdRiWkb9wAVbcw7Sy3z4lctGX4PQNwjkgpCqLNOW68eX8YmkQuRKwW7G/hmPPm3506GutI8GPGgOa17y8eb/jLa6yHXkpAa2RZbKe2r0kv3Yk0HMcYXb0hhlCHuxphljxczmxBnt+okZyc2oRq+Iygnf3sRYJQS/1AjyUq1FlpSQTfN6Scoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1S8EqpYUwD/dnDOZrrvXJyMsvwiNgTqy2U9AJek/O4=;
 b=4+ILOMI/2a9V9UflMVkuFNR7urByYrIkBA+c6gTtvnbskBu32fmfkB87gubJ4uOELB/0Yekd7Kw3HPzJjv12HHg/QswdxlptOvmyzM8ky9CP86e3zjYXyQgiY8+6Nvz5wQ+Lpok/8flMx9BCCnH8rkCC57NxiBQVjjkP76WLHdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6659.namprd12.prod.outlook.com (2603:10b6:510:210::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 14:31:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 14:31:32 +0000
Message-ID: <176e1296-5b37-4177-8602-12b28b2115a4@amd.com>
Date: Thu, 30 Mar 2023 09:31:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>,
 Josh Boyer <jwboyer@kernel.org>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Updated firmware for DCN 3.1.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0018.namprd19.prod.outlook.com
 (2603:10b6:208:178::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a78ae29-cdbe-44bd-417e-08db312b74ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/5WIKekhwiYZn/kkVRIXKWlCCnMpqKGXPgOJYGpu6nocRSUrhi8Na7rJwFyRHhAyPf/SK79QJ/ID7Rx+LhNTb8JVxlLUyDleouX1vA2Az9cs3bS/0/4d1OkoATAXiuvkOlPj3ZDRqLl7O0PnqikEhCSJQgCsVgpfe4CCvHknRQvZt5ewReK2BcrQn6PKJdir09BkSHeqGeXeP+r/bbV9b24RrAo0ACSoTdDZ/KAaoeC4O9M1nEIK7a6vdAvfZ047KSX8qr5P5BNkFfoaVBElM3/Yu4JyzZy8mtZ7uOEG5DC40VWCOS1/2w+2biZgR/olrlJEdH3rxNna7zL/JRu5gDbYdSyGsX5/4sl9/IPKSt6xoIdSEGxdKdaN9bLyrsy2wbq9Bp4z3gKUQIV2CGBQvKL/Ik0p9rUpHbvLCleMGFs7/xVFmnXgEsJ4wmd8S3y+9eFJYEPnM1w4bPfPZb67RRC2UREjzc+F2s+8F47qWcsbKo/Jp2XnZ32oF9ZCMSL7EQbJC/wBtXEJQYVZQ59Fzhp2ri3H3UHqdhZOOOBPAzb9MuHatg59CQ5PVkUzB3J5RKjdQHvn9o5yb2vrJjlJ4rVQt5RINVmu+DxHCiDLAhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199021)(86362001)(186003)(6486002)(31696002)(966005)(450100002)(4326008)(36756003)(110136005)(316002)(41300700001)(5660300002)(66556008)(66476007)(8676002)(6506007)(66946007)(6512007)(26005)(478600001)(8936002)(31686004)(83380400001)(38100700002)(15650500001)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alg4bnc1QzR2eTVXaUNQOXBIZWhybFE1S0cyV09POUVuQ3FEeXRoOGZhMUFF?=
 =?utf-8?B?Q2djM1pPblE2aXVWcUt0Z2VxUW9KZ0hwWi85SjhtY3Vmd3N2Y0w4YWg5Wjhz?=
 =?utf-8?B?dTIwY3FTYlNkeXZUdElYSG5HZThTNlBqSERFd2hQYmJ1NTk2MEZtRC9mRHlz?=
 =?utf-8?B?MGg5dzUyaG9aTm02b1B5djNWWVZmQUJ1YlpVTmlTcGNDUFlRa0Q5MDZBZVBB?=
 =?utf-8?B?eHZnUzVwN1dlYVRSVDc5ZGVSN3lmUHludVBjcGVIUjZaUnpQTy9FRkFFazAy?=
 =?utf-8?B?bkNUc3UyTmdkeC85MDQrcFQ3VEZ5VHVwRXNYUWgyd0h1M0NCK1ZkQkF0V2Q3?=
 =?utf-8?B?cWEwWG5GQS9mL3lKWWdmZXRoVi9QWVBhZ3pRMFo5ZUJUWEIwU3FKTy9sLzUr?=
 =?utf-8?B?QU5KdEYreG1yNDF3YmRzcWFDVWt4bFdyUVFkSFFoNFNLZWdIbW1pMDRITlN6?=
 =?utf-8?B?S2NlNjIyWFZRMkQrNXZDQVg5dnA1WEV6MThRaUtUaGtIWTFpUk1GWXZnMWhW?=
 =?utf-8?B?RDVVdUx2YWdja241b080N2kvaVVTMzhtenQ3cllwdWd0Wjh1Q0Jlb3ZXN3VM?=
 =?utf-8?B?RGhRVWVvV0lvSVlBRUFVRitKUDhLUkxoaC95RkRYOHZPZkwyTWtXWC81UCtC?=
 =?utf-8?B?Y1JtSjJPWHQxNkNQcGhhcWpkWVB3N2ttOTA4blBOaE9PaG0xU0s4UVN6cmdu?=
 =?utf-8?B?elpyU0lnZUFuTHRCejNGcXJwczhQRWMxK09yYU5LYk1ZQ3V6WThhaTNjTGFY?=
 =?utf-8?B?RVdOb0hUR1ZxR0I4UzRUN1RvcDV5dXY2Y1llMExRTk5CSzg3cVRRYi9qbTNj?=
 =?utf-8?B?SUZPdXlIQW83L1dSLytqU3VpWGRWSHY3V2tENW1qOE9mcDFjSFpPNVZyMFg4?=
 =?utf-8?B?MnZiQzJ6Qm9IdUdCZHBtT1lPeGRsQms2REVqM0dULytWT3FWdUdIZmgvdGh5?=
 =?utf-8?B?ZkpVMTNRR01WdGpIMUFxL0YwNW8wdGNDNzBTZ0tkdi9BSFN5U2sxK242Yks0?=
 =?utf-8?B?L1JsRWxEd25HVXR1ZVZPU0QrZXZJQ0FUM3V6eDhxbWhNcVg5UjZnaFdwNlBr?=
 =?utf-8?B?WGpMZmQ1U1NvMm9HbVE3Ly82TDNGbmdpdkFwQlFxWGprdDRzdERWYm5nbjVt?=
 =?utf-8?B?Z2lXaFBycG80V21OTzZ2cElNNTZ0akFGT0hHWGFJd0NWL1B6YnN6S0JyUzRG?=
 =?utf-8?B?NmlvV2RqZytxR1huQlFySGdVVG9UbE4yT2RFOXNmdXFWaVpTN0V3NytkZm9u?=
 =?utf-8?B?NEpzYU5JZWJiZlBrVlBmYmI5dDlqS3MyTnEwRVNCOXFHVVhUV2ZKeHhQaFQ3?=
 =?utf-8?B?eHNCRlVGam0rWnhLQ0JrRnp6enVXVlNBcUtKYnYxeS9MQVFiZDJEWWF1c0FZ?=
 =?utf-8?B?SEpIQXlUOWR0VHpBZmltVkxYeXpPcE5aRjE5Zk1IclZyTWUxa1A0RjhmVHJ1?=
 =?utf-8?B?WDRLOTBMK0NYVzgyTVlsZXEzTHZqSkpvdytjUGc5eTZialhVbGd1SmZsNWE0?=
 =?utf-8?B?ckVDTlNtRXhtY0RkTzVaWGNYc3kyUlRNdDFKUis4TkxZaWZRYnVickVHcUV0?=
 =?utf-8?B?UVlrNHlRTUZtV2t0Vmszc0lTVGNuby9yZzkySVFqMG1zSyt2Q1FSRGFHdzB4?=
 =?utf-8?B?UlpEU241ZDd5M282QmJhRUY2c2wwT0oxZVF4aFRWdExXelNJcHAxRFQzbG5o?=
 =?utf-8?B?L3plcCtRc3NtNUNab0RrYVc4MjlzV3UwdzZ2VEdBemxrV3BqdWJneXdsaG9G?=
 =?utf-8?B?N0phelNqdG1LbVlIc0pWUFg5U2grTGlJS3VBZE4yV3hENnphRXZleXRuNmE4?=
 =?utf-8?B?dEVTTEg0WjB0VHhxWjZQTEVSNjdXdDRGblFoVkp1SEdiWG44N25kT1pzVkYy?=
 =?utf-8?B?ZlkzZUVpOTNJSlR5aTFsZTRXTG5yVW1uelY1RFdabzM3SWZSYU5wM0JBNHlq?=
 =?utf-8?B?NCtJblBlS2tuZjBuZ0s2MXRjVzJNQ25QbmJTSHFGTWpUSU5rU0ZuU052UTBq?=
 =?utf-8?B?Y0ZWZ3JvNzVhMDVhbHlZN1BreG1vWWsyZjVOZU96eUhnbGQ0cXpoMGxOQTlM?=
 =?utf-8?B?WHBzeSt3Zmw5ZFBZRWVaNzlkMi9CT3lDMHBQWVl6ek12WFFraFRKMlkvK1Z3?=
 =?utf-8?Q?UOemykFeR7MRWnTIU8xELidGW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a78ae29-cdbe-44bd-417e-08db312b74ef
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 14:31:31.9227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzBBZGEb1mkDt136PdDx46sYVcwQcjIMNhctjerDnKlVF0SLYjbHAWo72g6+LXj0gySzlWkHlmF2sOJZDWbRoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6659

Hi,

I've updated the firmware binaries for some DCN 3.1.4 based products.

Thanks,

The following changes since commit bcdcfbcf0a8f24a914b8c163906e6ce93d7f8897:

   linux-firmware: Update firmware file for Intel Bluetooth AX101 
(2023-03-20 08:34:27 -0400)

are available in the Git repository at:

   https://gitlab.freedesktop.org/superm1/linux-firmware 
mlimonci/update-dcn-3-1-4

for you to fetch changes up to 9ee24ce0e164ba9620ecc33295b183fc135bac7b:

   amdgpu: Update SDMA 6.0.1 firmware (2023-03-30 09:03:34 -0500)

----------------------------------------------------------------
Mario Limonciello (6):
       amdgpu: Add GC 11.0.4 firmware
       amdgpu: Update DCN 3.1.4 firmware
       amdgpu: Update GC 11.0.1 firmware
       amdgpu: Update PSP 13.0.4 firmware
       amdgpu: Add PSP 13.0.11 firmware
       amdgpu: Update SDMA 6.0.1 firmware

  WHENCE                     |   9 +++++++++
  amdgpu/dcn_3_1_4_dmcub.bin | Bin 296864 -> 298016 bytes
  amdgpu/gc_11_0_1_imu.bin   | Bin 132352 -> 132352 bytes
  amdgpu/gc_11_0_1_me.bin    | Bin 263424 -> 263424 bytes
  amdgpu/gc_11_0_1_mec.bin   | Bin 268640 -> 268640 bytes
  amdgpu/gc_11_0_1_mes1.bin  | Bin 230528 -> 230368 bytes
  amdgpu/gc_11_0_1_pfp.bin   | Bin 263424 -> 263424 bytes
  amdgpu/gc_11_0_1_rlc.bin   | Bin 157440 -> 160592 bytes
  amdgpu/gc_11_0_4_imu.bin   | Bin 0 -> 132352 bytes
  amdgpu/gc_11_0_4_me.bin    | Bin 0 -> 263424 bytes
  amdgpu/gc_11_0_4_mec.bin   | Bin 0 -> 268704 bytes
  amdgpu/gc_11_0_4_mes.bin   | Bin 0 -> 288288 bytes
  amdgpu/gc_11_0_4_mes1.bin  | Bin 0 -> 229856 bytes
  amdgpu/gc_11_0_4_pfp.bin   | Bin 0 -> 263424 bytes
  amdgpu/gc_11_0_4_rlc.bin   | Bin 0 -> 159472 bytes
  amdgpu/psp_13_0_11_ta.bin  | Bin 0 -> 206272 bytes
  amdgpu/psp_13_0_11_toc.bin | Bin 0 -> 2560 bytes
  amdgpu/psp_13_0_4_ta.bin   | Bin 271808 -> 206272 bytes
  amdgpu/sdma_6_0_1.bin      | Bin 34560 -> 34560 bytes
  19 files changed, 9 insertions(+)
  create mode 100644 amdgpu/gc_11_0_4_imu.bin
  create mode 100644 amdgpu/gc_11_0_4_me.bin
  create mode 100644 amdgpu/gc_11_0_4_mec.bin
  create mode 100644 amdgpu/gc_11_0_4_mes.bin
  create mode 100644 amdgpu/gc_11_0_4_mes1.bin
  create mode 100644 amdgpu/gc_11_0_4_pfp.bin
  create mode 100644 amdgpu/gc_11_0_4_rlc.bin
  create mode 100644 amdgpu/psp_13_0_11_ta.bin
  create mode 100644 amdgpu/psp_13_0_11_toc.bin
