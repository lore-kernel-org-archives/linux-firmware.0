Return-Path: <SRS0=p0Ab=6L=opensource.cirrus.com=prvs=1434084f38=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D75D32D9C
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Dec 2025 15:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A4B8C116B1; Fri,  5 Dec 2025 15:11:01 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DED4C4CEF1
	for <linux-firmware@kernel.org>; Fri,  5 Dec 2025 15:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DED4C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5DnpvJ4121529
	for <linux-firmware@kernel.org>; Fri, 5 Dec 2025 09:10:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=PyruXZl+aTFi4qo1
	1L4pw3BcXve1fhHwgUqdhdgQviY=; b=RWQoPokFx5r9Ap8ZSopGg/K3R8fNVxd6
	xc0IbZMtDqklnCtTy5nMWj0YIc75+kkdu8TfGYl7kgnzh8N76bAz2JVIO94RyAND
	+UXCfHt+SFNTgbQUKx0ABPVP0Ob1ae1B2C2rBYZV9e/GfbbZybWb3oxRzAtp59Wx
	7TIqPAohos4OIOyg1CYZuEBgUinlm1FEL6GH6KnFm8i7V+Ge6Vf64iuNO8ybT3H1
	vpEYL9/xL4Q6+hzyIxoVBR4lkOhbCKbMXu9EUeFa0WWPd8sHUmmPSjSZ0SYos44F
	035FQ4nBKVRRz68xgtIakPc3ZeSK41DmCwcC4xczsbzc1WxCcexcDA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023114.outbound.protection.outlook.com [40.93.201.114])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4av0md831d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Dec 2025 09:10:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zS+xknypuWnHBuFi2f7x9LKa0saOBl/12JgYfLsGGg/qVJ+KEjjeEfQwz+DZwYqmXK1IQ803mm1lU9rc0suZJssUyl+w7pvLDzqBYTsdgZV5uN5kv0Wdx5T4VPmIXvBT57KyvaN1ae6HIoc9POVc+pBZlZak3nFfk/ykyd4sYRzIS4+NRSn1vd+5xEcND3+QWWaZ+KgiQFcSeQvP/0YnoInwxumOJEG3Np29aBVHzBfPI8IW2Ln1T3rMbHTYQeEXVVeFRjyQbxaD5Y2WlID69hiDJitKdigI4inWyIhHBu7uwmsEL5gTsQg1tgLEql0l1MD1SFL+esomUV2HDnMKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyruXZl+aTFi4qo11L4pw3BcXve1fhHwgUqdhdgQviY=;
 b=GWsyVKc0xs8hqkwCvhb/xJ/t0xKtuC7Zcqll5rryWlQQfriXcYV7itpZfpTWzhpST5q1KsD4VJgXaWq0Hiz6+PE9iIku7iPoyGmkYc95wb4enDAOJCwYZN8fETFvxvwkg4yU2x9nkhvbwTi4H7fPsOrD4NeuWqrVURjPCsLpqpbZ7dh43vGhCHJ8tE8UOj5XR6YyGahClVNJHf0bDa1k8zsqdJ07FvsnnRWs3C1WMmSGqUQ2nM2uOCvCAYCUtmL/oHS/aHW8r3hfPF6UFusHxyWU9mjlp6zVXTRvhQTf0QPH0OiBsbZcv7zCAwuBqXCquvFqyv2WwAL/tDgMWsPUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyruXZl+aTFi4qo11L4pw3BcXve1fhHwgUqdhdgQviY=;
 b=XxpTo7F1pkRAO74VXk0Cc3/pcVD2b+Bo/5PH42A/p/Vh8LO64ntnIHAvm3Io3YdlLZX0n9bSkytCi1FyLMLF/50QSze7AVPOrrzMpO+OUTz1p1g9GDMA3Gr2ie02UBqF8MxMcgFyagDdiwLB7FdsrMwZViFzLl2hqtwwIJJCVXs=
Received: from CH3P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::31)
 by MW3PR19MB4315.namprd19.prod.outlook.com (2603:10b6:303:44::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 5 Dec
 2025 15:10:50 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::c7) by CH3P220CA0021.outlook.office365.com
 (2603:10b6:610:1e8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 15:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 5 Dec 2025 15:10:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5A5FD406541;
	Fri,  5 Dec 2025 15:10:48 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 346CB82254A;
	Fri,  5 Dec 2025 15:10:48 +0000 (UTC)
Message-ID: <0c43af68-4665-436b-9bb3-1a55a0c09d4a@opensource.cirrus.com>
Date: Fri, 5 Dec 2025 15:10:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add Firmware for HP Turbine Laptops
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|MW3PR19MB4315:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4b7b9b-4876-4da4-c33b-08de34107988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|4076005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wkp1dzlKeU5tZ2xVQ1dNdjdRUHk1UXZJMkQ1SUViRVd6UUEyTmY4UmRYRk52?=
 =?utf-8?B?SHNNekpTZDJWTzhYUFVvMy96WllJWHNFakMyM1VhZjBEa1hTa2dEWFRHSkVt?=
 =?utf-8?B?OGdPWFAyWU1DS3lpUVM1NTBiREhhYS9nZkIxM3ZUNUp6WEF0OWhlZVBZaVhV?=
 =?utf-8?B?TVY0NWdWb3owTnk1Mi9HQWsrdHRtdnpVS0pKVEROT1pZREg4dXdKSDkyMlZL?=
 =?utf-8?B?SDRjUXZESERWY2ptV1dUYnZHSHJMcG5IUzA3UmM0cWg1dG1BWDgrOU51bEJZ?=
 =?utf-8?B?K3RFdTB1QmdLOXJJeTlkZU1mWU1xK2U4ZGZ6RkVvS1dpSmpKOUVkSTNxdzda?=
 =?utf-8?B?L28vMERpUjA5TFpEdDJDdlFpQVhnVWF0TER0YWlMMFBtZmk5aDNhRzZ2dHdm?=
 =?utf-8?B?WGlTSGxLSVV6a3J5Y3g1Z2lwcCtuc3RXQlIzTHJVK0hsbVc3ckNsbDVqUEpR?=
 =?utf-8?B?ZTZIa3l6azZqZUFxU3FCdXdwQ0ZHWGxVMzZQU0VNcGc5cFlQTHZLNkQ1NzBz?=
 =?utf-8?B?TWdPbTkxdEF4QldIai9qT1pWclR2LzVPM3dZQnFLSjJ4d2dsTXdPQUExR24r?=
 =?utf-8?B?Rk02NTNGbmJrK1FGbEdQaHBYcEtCT3piRGNxTUEyK09CalZQQjRJQmMweEpn?=
 =?utf-8?B?dHo5MVVFMENGamlZNnBKZ0FDZ05pcWZxWnRoblcwWndKM2JtVGxIQ3duM2xv?=
 =?utf-8?B?OTFDSlJkWlVndHlaVVZVUnpqRVAvTm1LcUlvK1JPYU84dHl5YTBzMk5FT0Fm?=
 =?utf-8?B?UFlnTTlpVTAxRWk1ZU1vM3JKZXk4MUYxT3l0c2I4NEdkSGJVMlZZQ0lXaERU?=
 =?utf-8?B?K29GeGs1cStVZWF2dWtua0lzV050V0xMMDBzd0lpWWo0VWZ6SjFQT3I0eldi?=
 =?utf-8?B?QVNlOUlHWjBlWlZIeGg5NGo3ZVJCeXQvTm5Cc2JxSUhjYmx3bFVENUFmT28y?=
 =?utf-8?B?K0M0Q0hJYXlEUUtTT2dKQzdYMWpVTFBiellIK29Nd3FQV1hDR1VCdkJ2Z3c4?=
 =?utf-8?B?WnNEcWpQVnBpemxCRjhrQzBISytlMlN1QWNNWklmQjB6TTBncHZ2ZG1uSlB2?=
 =?utf-8?B?SmVvMzk4VW5DSThTUWw3dWpiNXVZdTVxRnZqN2JYMkphTVE1N1ZiWk5nSjFq?=
 =?utf-8?B?bXR6SzNtSDFoRTY3amY1L25tS0Y0MEFPelVlcG5rNHdiSHVuQlhvcGdiRDFx?=
 =?utf-8?B?alhzWk5tRWk5dTdwT1RoQi92RjFXZzRFaDFPNlBYMlVCTklLN1E2YkF5T0c4?=
 =?utf-8?B?KzYycmR4NjVlTExHdnRHMFV0VUNlSkJ6K2tOZ0c2SEdTYk5WNHh4UkhnZitX?=
 =?utf-8?B?Y3E0WllRbWtIVDA0VWsxaHFmeXA2Z01jTlZjL1BIQjd2WXlvQUZ5ZlBXVW1k?=
 =?utf-8?B?VC9WUXF5RnlEbmtkbkg5VDEyc2NyUVBKejkxMjB4T21QemxlSFZmb1ZBbURh?=
 =?utf-8?B?UWdHM2Z0Rk1WbTZHUUFDeHN6b2lGYU1uTGk3YTJtRlZoMGJtT1NRb21DQUlC?=
 =?utf-8?B?K3d0akIwU2V1S1k3UUUvZTRKZlJVanB6NDAwT3NvMnVIREFnOXZmSStmZ2gr?=
 =?utf-8?B?S3UreGxlQmFFOWZ3TW9ablBacy94dFhRZnc0aTA5N0V5cVlGdzQ1OXVIcVFl?=
 =?utf-8?B?TVVsQTN4amNEUVZnSXNheGxzMlJKM3FuejlpVWtJcWFhYnRGSHA4VEVsUldl?=
 =?utf-8?B?dUVMTEEwSE9ydnpad3NOYVp1aVE5S3VhV0lVeGQyaXB6MFJ2ZHEyZHZaRUNN?=
 =?utf-8?B?L1o1S2lEYlpIeXlucytzd0NsUTNDMEhjT25hdll0anRWZ0xGSjFVcTBxeW1s?=
 =?utf-8?B?b3ZTeXZ6R1UwQmIxc2huWWVhd3JNMDRWSFpNTGZhbVhZN29Sc0VyZURsY1RB?=
 =?utf-8?B?VVFuZDdVSWdtOW45YzA5cFljMnJ2b2NUSHAwdDhIMDcyR3RwQjBDVnk4TExL?=
 =?utf-8?B?VlRmNXdCY1orVWUydllDZFhTOHA2UWxaYWZtWmNmSUZQMFNieDVSZWd1ekZX?=
 =?utf-8?B?aHQyU2duTytLQk9JcmJmYVMzV2UwTXd0clNteFdoT2ZVdFg3akdqOU5CUTRG?=
 =?utf-8?B?QitxUVBJQ1ZzUWdhYVZBSkZVYmlwN05zNmo2am04ZkRPQytKdzZtaFVKMDZU?=
 =?utf-8?Q?Yeen3gb9hhxzA8jO4vUFRAcHG?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(4076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:10:49.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4b7b9b-4876-4da4-c33b-08de34107988
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4315
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDExMCBTYWx0ZWRfX2kvDdDPVJ6lj
 4plLzSIKqWj/nBVQy8HQAQ2WtnmiTPEb0y4OVlCaXpLLLVpI9xjNpkWkZMAGDalaEwmnlG2JcBX
 0+c7ALYGnVUkAy41fYDuZB5SHmpgLQy9KPNsKh2HoJNaYTl86iZY2YMjbhAzXWHDJY/WEoBNk/G
 RTak585AsznT/X2zQR0JS7CrAH3RfWaBgqZypBwEaUgJZDT0ZhYDhnfk4aqm/49PqZNPG7fYjz2
 1HB//RR/qfZV0hUabdj+wF6FGtEGEBoDt3cvPkFLZ75wdOojrsMIVjqq90alr47Iqjn4UP0FxKw
 B7nf/WjSywivwvg1F7Qe8IoWWS68vBt/Ou+Va9aifDbh3nluU1M/UtY3vybDGIyS6PMx4Pf+C2N
 0CB/z/dw5Ujd7i+SoLMEWVWt/WK26w==
X-Authority-Analysis: v=2.4 cv=cJ3tc1eN c=1 sm=1 tr=0 ts=6932f5fc cx=c_pps
 a=1bfLZ9IPuZA5gEd22F+xnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=xnaCJs7z7MxXsWByBngA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: j_mz7WUc_-jbwJV71ASUXP4Y1mtwwcmV
X-Proofpoint-GUID: j_mz7WUc_-jbwJV71ASUXP4Y1mtwwcmV
X-Proofpoint-Spam-Reason: safe

We would like to update firmware files for Cirrus Logic Smart Amp CS35L41 for HP Turbine Laptops.

Thanks,

Stefan Binding

The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:

  Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20251205

for you to fetch changes up to 1774b2a25c75937d3c885adacb98eb6c6b99d8bd:

  cirrus: cs35l41: Add support for new HP laptops (2025-12-05 15:08:45 +0000)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add support for new HP laptops

 WHENCE | 6 ++++++
 1 file changed, 6 insertions(+)

