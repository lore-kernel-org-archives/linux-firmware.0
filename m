Return-Path: <SRS0=uoNs=2C=opensource.cirrus.com=prvs=62975ac158=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B41AC83F25
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Jul 2025 15:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C5F3C4CEF4; Mon, 21 Jul 2025 15:01:28 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B7ADC4CEED
	for <linux-firmware@kernel.org>; Mon, 21 Jul 2025 15:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B7ADC4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCHTDB013597
	for <linux-firmware@kernel.org>; Mon, 21 Jul 2025 10:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=uLqiUwbJiWqo7iAI
	SeH1El9tEJS2XmqYDf67Huy4EKE=; b=PlxaeZEYe1C/fVxwMYs5ATsbzgNhJXFY
	3VdQNvFrsnTnSeh28yGR63Cm93Ph2kh6nOGc+roSZo6guJikQgk1RUYCAJnOJCrX
	ulUy73zl1xJ51V5J09Wt7FdamTT1nGP6Qg3zbUShRY+yPJkXEyDjx19rFgBHclUN
	ddJuqpGQQiMBS+qF5b3NiB+p6yjGQBullCRyPqsLPB5tc0PvN0xZE4h8pzjJqQaS
	oR5Ocgw3XdqapIMjUabot6+2b8leDNhKzwj4maxKZBu6DYYRN6E3UrkQ8K5f0583
	iBucLufQP72O3atfyn3iTj41vTDsE/9BtnnlvcMrQWqe3w1heiMIpw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2115.outbound.protection.outlook.com [40.107.223.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4808s0j5qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 21 Jul 2025 10:01:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SodDkcxQhuWirb/k+COrqbU/W/3cT4rTqzFT8i6iz1gyj0xUdmUFI4+ndPpiyJGSe0I0LpgVnfhb35ULxWMKgMWvE9mAVdhNvSQncny2/Kex1eeJ5INKAT/U/svuvLxwPwZnNG3Yarp3VitshJW+TlEx4761JZFxxUz5a4qUT2bk48phFymKztmhBMyCUNgSBPPkrZn/+G64aMeK5S2mVJ1qSP+N5kdHOHsZ2XWj/6Gsm7K+pnrTeH6JjArLOgk6/5iA24796St5i2sjRN5V1oFR/SfujWVoA163E6Z4MajvGW2vrk/Ed3GZfBszlxBFax6KRGQxdalLRDxdCcODMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLqiUwbJiWqo7iAISeH1El9tEJS2XmqYDf67Huy4EKE=;
 b=tdLlZXNFztErNUBcjuGFOlHTotSbMS20/6ykAvW+L+BqWY+t1CfSzHMrS+Af1jKnLdngzopIpmwAyehEcQ8XwrQIqDdgR/LMxhokyOHbjZj39JrUVlWunks5/4AY5WiFiCmTO3uxcBVn60FgVbPCqw2WQ6GwyBwShhmuuSqcIuMcgXIPTzbVmG9q2VKJFd1iuYPd8GpfmM0Jxo3p9XD0uZgUSf24p8pvFYBsteSI5Sby1zLNq9pVjBE3+Jr4OzqTVU+gI80UYSq+xUL9es9aFSme2+bNTPcn+po7YL+ALqnZv+U97lzfffHdtHpnyKw4V7mCrImoYU1u4YpyEwjntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLqiUwbJiWqo7iAISeH1El9tEJS2XmqYDf67Huy4EKE=;
 b=CLugRShHT3f+lnMDkjJHz4ltEhPlNUTcjU8d+cNH37ldMPNMaUQ4HsTyg57ct27IP008qD0Gaa0RM/uJdkMEX9j3lYQOCQrWL1MNwx7mD9j09QFyF9JAN0zTEsRn9fWtpJTQvtp3Jz554i2fyZqCB8dl5eyrH5WrtEf7FdU7xes=
Received: from DS7PR03CA0172.namprd03.prod.outlook.com (2603:10b6:5:3b2::27)
 by SJ4PPFCFFEDAA63.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 21 Jul
 2025 15:01:17 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f2) by DS7PR03CA0172.outlook.office365.com
 (2603:10b6:5:3b2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 15:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 15:01:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1272A406541;
	Mon, 21 Jul 2025 15:01:15 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E1D50820249;
	Mon, 21 Jul 2025 15:01:14 +0000 (UTC)
Message-ID: <7b358989-0b9c-4a53-bc72-5f1bb59d5a46@opensource.cirrus.com>
Date: Mon, 21 Jul 2025 16:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add and update firmware for Cirrus Smart Amp
 CS35L41
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|SJ4PPFCFFEDAA63:EE_
X-MS-Office365-Filtering-Correlation-Id: 73b42816-f5c2-4900-e538-08ddc8677152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026|4076005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnNzdmpNeXNjVWdmL21TUS84WE1YMHlKS0huU0VyVDErZGRKaG9XVGcwcmdB?=
 =?utf-8?B?c3lUYlcxYXZsMzlKREVtUEtQeXpEckJvVlFoWVBVZ1YwY3pmOEVyUlk2Nlcy?=
 =?utf-8?B?NldGWThxY3Q2d3NsRkxUR2swWW5DUVRlTFZMUWhOZUVuNWZIZlVhV21RNU12?=
 =?utf-8?B?OUU4bDJRdVVuWTl1anRwUlRmUDVZUGRCdWFvYTVNVTZtcWpuSXRyZ3FocWhn?=
 =?utf-8?B?NXN4WG02QjdOdnN5TXhZbFJPTzFmWXExY2dtNzQ1L0paTVdDdG5NSTYxeEVq?=
 =?utf-8?B?M2hvVWNhUHlYUlM5a01iVXFYSGN6UStVUUZzSGxsQjArMU9ScGZ0U0RnNlhX?=
 =?utf-8?B?TTZGU3llcDNQY2JiWlhubkFxdHd6TFgwM0oweGRJYStObUpndlhackxGU1JD?=
 =?utf-8?B?bFhoK0R2MzBubnNSTEtQdmFzVmRHY0dmVVRGVjRqUnZZdytzT1RkODc1WTc4?=
 =?utf-8?B?WDVZNFVQSjIxdlBMKzlMUjV1aUk4VUhubVp0RjgyQWNna1VtcmxaUkNnSFZ2?=
 =?utf-8?B?MVdrNnJzSlFDNGs3TjArbFlPV0lwdkdVQXg5Mzh4U1Rhd2dEbU5xQTdNY0Ry?=
 =?utf-8?B?R21wMm1ZZFQ2ZlllbURUVFZyc0s3TlhVcTdraS9BYkcwcnRTWXI2NE1tUDdL?=
 =?utf-8?B?ZVV4ZU5pbjlNekllQTlFem1aM0o0cEF2SmxuRzdibTlLMElKU3U5QlRxU3RD?=
 =?utf-8?B?QUpHdk9keUpuam5Oc1ErNUJwOUZZUThCVVVwMlE4cFJHUkZ4SWtEcFlObjRL?=
 =?utf-8?B?OTZMMXlXeWNuQzI1YmhSOVhZN2dGeGt0YlVxYWRxNWFSR2pIdzV1cWEyb3Vm?=
 =?utf-8?B?WXFSRWN0U05DcGtaWXBoZjgyZERpSG1uYXFOdS9XVlFINTJuT0tVeXRianFV?=
 =?utf-8?B?MVlLa0pFSjVQSHZ6Zms5SG9wc0hGSE9IZG5DYmNzVkJxeDJYNGFqMFR6Tjl5?=
 =?utf-8?B?MTlqLy9zbVBuN3k1dG5kbml0cUcxYVcvOFZRVGZ0UVhhWXY5SXNnYllXakZj?=
 =?utf-8?B?elNMclZORWl2bFF6WDZCSHRySHlCZXRrRWtGY0NHblJUMXhjbUJMMlRiODc2?=
 =?utf-8?B?Mm1FcGxSUksrc0pjbTA2b0Q2ak9QWVBjMVJKSlBjWnlBckVXbEU0VVl0dGVM?=
 =?utf-8?B?OU5lbmJZNFRKT2pHZVp0NDhmK0hFdGM3b0V1TVNRY3JRNlROaURTK1FpZVNB?=
 =?utf-8?B?Rm01cWZHUkkvaFpzU1RKTzVtU0ZtbktxdXZ2VSt3VThRU1UvOVk0dENjOHRz?=
 =?utf-8?B?UEZYSWlmS09zMGNTd2psb1ZqSnpXWU42M0xaK1Z5K2g3STNUTEJ6OUg5cjN4?=
 =?utf-8?B?K3NRU1p5cEQ1QW1acjRlQkwvL3hnZkM3cTl3SlFMMWR4VmtxRmNPQWFTS2VJ?=
 =?utf-8?B?TUxWV2JFNWFoYnZmWkU4ODdCbWhzS3VlZVdaQTZvQW5LcFg2OEoyWU1hSFlO?=
 =?utf-8?B?bmIwb1Nhc1FSYlRlaHFockhZSjd3akZMZ2xDODBKNlNmTXNOblhEdHlBamxP?=
 =?utf-8?B?Ym5KR21wb3JmVU5yY2M4WVk4RHVlaVExMldpc3k2MUJHdGJUZHdaVW4vOWxz?=
 =?utf-8?B?dVIxS0N5Nm5SOGc2U0FBcUxEbW5oR1dWTlYrbno1bTFmM2NtV3BZbisvYm9o?=
 =?utf-8?B?UVZxYVMydjhET3lMQVRlVFBTaFhNUlVLcFRTbTBlam9iSlJDdUxrSUJ4ZUhB?=
 =?utf-8?B?eW1sdUZuWUNqMGNwb2VMWUhRbllabUFLTjZRTG1taEN6M3ZpVHZxdE1lQkpq?=
 =?utf-8?B?VG9VcnYvUnZFb3VpSG02N2hZVG0waUtYRHNaQ3lqTmhCZXFBbktNbDdzdDdx?=
 =?utf-8?B?WGZsRk5pWVM0UTZWV1NERkNxd21yYVFoNWhkS2FTY3phbmg4Um13YXRBRGRy?=
 =?utf-8?B?R2xxd2lESXpyejk4UVhRV0FsOWgzbmhpSWVVeFJOSU5RU0x4c3dnb1IwYWxY?=
 =?utf-8?B?ZCtiMm9mb2dJL3NTQ0x5K3pFbVJ4bWtYK0pxcG9RTXd1MWRzV2E1dkN5WmtV?=
 =?utf-8?B?clJSc1dJRTZObGppVG9yYnpMYXdnRjIza3dwTkkvOFFyVHl6MTMyZDAraXdW?=
 =?utf-8?B?Ulk1eE9RQng5U3oxUmVxK05qTjhlY2NleFZIZk1SNVlNNHVzRUMyM1hndlh4?=
 =?utf-8?Q?okPA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026)(4076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 15:01:16.2114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b42816-f5c2-4900-e538-08ddc8677152
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPFCFFEDAA63
X-Proofpoint-ORIG-GUID: xjjUMavo-IrU3wY3Bj3TG2PiL5zNia7W
X-Authority-Analysis: v=2.4 cv=VrYjA/2n c=1 sm=1 tr=0 ts=687e5644 cx=c_pps a=YbcMhz4I3gND9vdO9+Tgiw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=i6FOWYp1mdSAxnZoklkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MyBTYWx0ZWRfXzypeDOQfgpUH Vd6J5YSX2AFYxUQJ3pG3lgLJOFT5VAqPVIHEKeVd+R7wiRcvwQWhE8TQMvtXxHSOU7pFyVeJvOQ uPt8ghFFY/fRnYG5hxyWjbiR8kOhxw90MKqYfQx1jMG6Tx9kxDDtUG8w5TySFZwu/+7bh6i6pDR
 /WS/ZcXm7vPUsOm+1jSWlrBNs7QwKexOhLjdpDCLTmbRZsfvi+G5n4gumdIxGvIBIek3VlrkM+8 ixTFB2ZWO4LnhFoSvSS/fX4HzpTtcA0ofKtzc2j68Cj579I1qSoFsW6adHCPEkvc0S0IkVTWyuO 6rEGOvieFEOKeByh9VlwWHvALg1O6ojvamv149XCAWzaWQq8A5ltHVUGbAooIHETA9+NO2IWjWz RGTjzuv0
X-Proofpoint-GUID: xjjUMavo-IrU3wY3Bj3TG2PiL5zNia7W
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for a couple of Asus laptops.

In addition, we would like to update the firmware and tuning files for several Dell Oasis laptops using CS35L41.

Thanks,

Stefan Binding

The following changes since commit 9c2794b0f0373c627fd1c635bc2a416ba1ecc0e1:

  Merge branch 'qcs6490' into 'main' (2025-07-21 13:13:27 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250721

for you to fetch changes up to 82c2fdb0fd0f4bbbd552a3faed749dd6744a08db:

  cirrus: cs35l41: Add Firmware for various ASUS commercial Laptops using CS35L41 HDA (2025-07-21 15:15:50 +0100)

----------------------------------------------------------------
Stefan Binding (2):
      cirrus: cs35l41: Update Firmware for Dell Oasis
      cirrus: cs35l41: Add Firmware for various ASUS commercial Laptops using CS35L41 HDA

 WHENCE                                              |  94 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-r0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin    | Bin 3980 -> 0 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-r0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin    | Bin 3980 -> 0 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-r0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-r0.bin | Bin 0 -> 5436 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-r0.bin | Bin 0 -> 5436 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-r0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-l0.bin | Bin 0 -> 5436 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-r0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-r0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-l0.bin | Bin 0 -> 5436 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-r0.bin | Bin 0 -> 5436 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-l0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-r0.bin | Bin 0 -> 5440 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-l0.bin | Bin 0 -> 5272 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-r0.bin | Bin 0 -> 5272 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-l0.bin | Bin 0 -> 5264 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-r0.bin | Bin 0 -> 5320 bytes
 27 files changed, 73 insertions(+), 21 deletions(-)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0-r0.bin
 delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1-r0.bin
 delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbd-spkid1.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cbf-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc1-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc3-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10280cc4-spkid1-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431454-spkid1-r0.bin

