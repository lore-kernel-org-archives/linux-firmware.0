Return-Path: <SRS0=05n3=YE=opensource.cirrus.com=prvs=4235c1bf41=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C205C3ABDD
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 13:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13886C4CEEF; Tue, 20 May 2025 13:51:25 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5A62C4CEEB
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 13:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5A62C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8b0RY011523
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 08:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=bQuBhbf2gnbm0kpT
	63Q8dUcTopcT3oEDB+mp0HeCWxw=; b=YzUtQBNlMF2B/mjsdYRMQGKqLJ7igQLR
	X69dC1HvnbFycrC+13x3TSgkm3Rv4OtRMSMzjlut4jVHazuQ7sZU1PqKy5GUFQoe
	xBVfusVHnXP99QS0xqofW/f3o5eIIP0Ohzd8tWlzdDz9Ts7WnM9a5sOIlC8yPhRv
	Dwc6dX+1gLGQY3KpOQZARt3TH6wxJC1Z3PTcS+KqopbKZoMN6+rFW9aGpvkTVdIC
	GzDVBYRXq3o/zTjmEHhAPvnth2YiyTxwQ3J5PxNVuon5lfEQXGDYSOt0q7Fqcy77
	CSOFz7nbbhUZ1PZuKl6+1+yCXmkGl2NR0W81xIY74qJ6lVqRXt9ImQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46rpcqrefu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 08:51:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Quenuz5k50ASej0C5WMzoefxcuakajYhuPC7njv3kDvAtJbPBFefsGDTNlAuDmiDASLWFMz+2jS8ofd/1D6iEkC8KLCSPr8QgujFAVzzSunLZF8LzVmdC4u/U5scY2ewnqzUCapRdqgTN9gNBa4GyOlaKB4ynTW9uVRU1dTkg8HgNVOEdm9gnTJV3XsPAdBLHWrDrZFGzw5R3WdV1IIJQjddiVjOiJOqjlPhpR+mnRH/NgxnBir8voKJyibMGi4I/MCzIld3olyCXWKrVqyvjS1O8AD1nz4cS1hXdJ7BpQLNXE9bFXVaeEAtQR24j1pC81WK+qsOjO97ZpK82iYlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQuBhbf2gnbm0kpT63Q8dUcTopcT3oEDB+mp0HeCWxw=;
 b=h8Cy4JmxICVvae4V3KVxArFrwIXWcEbsqsBs/27yNf970TGUlSsuFmDrbjpRcadB7gAbxfwbgn4OwUC1t40aMIW5wIBmrLtMB3tIvdks30EgnFut4xVmxnktW8MdKsWQfhFJzmuihnjYUNqJtRibM6Kfr10YhifZ2fZ5P+K7rDh+1pmw1VqwuAG+u5rP/GQGRaehBVRmqL6Qasad2A3wMCsjfyXGnA1uavVpfnAbsh7c+lLpk/1sxKxBzYSXJDW1/xHsNdB/XI4T/BTuuTiEVWOgHvJ0UCr0Vue3ci/45i5DlaxUYnc9ybfuV8bsA+NTVr7U9W1RdL1LKk/YxJrvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQuBhbf2gnbm0kpT63Q8dUcTopcT3oEDB+mp0HeCWxw=;
 b=FR3fBlN/ZiVlgiGxZPNytLzs+J2SZNRshYefcqMfZydGZbwG3aV8/mM5OQYmn2vs5hiYk8yKEA+zCiLZN0DIa2pdyQ3vp9UQKGHq98BE7zJGD6lGG7HgGd8y4jTUk50qO9qGSbjMhXQRGTQvtttjI9FjZKe9uhWL9dNSUkKCBWU=
Received: from BN0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:408:ec::20)
 by DS4PPFAF629724C.namprd19.prod.outlook.com (2603:10b6:f:fc00::a48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 20 May
 2025 13:51:15 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::dd) by BN0PR04CA0105.outlook.office365.com
 (2603:10b6:408:ec::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 20 May 2025 13:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 20 May 2025 13:51:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 43F5D406540;
	Tue, 20 May 2025 13:51:12 +0000 (UTC)
Received: from [198.90.188.46] (LONNCK4V044.ad.cirrus.com [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2333D82026C;
	Tue, 20 May 2025 13:51:12 +0000 (UTC)
Message-ID: <495de728-31e8-43de-b2a4-56a8859e781d@opensource.cirrus.com>
Date: Tue, 20 May 2025 14:51:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add Firmware for HP Agusta laptops
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DS4PPFAF629724C:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf42875-b38f-4bdd-ac28-08dd97a5628f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0hHWkk1WFYycGRxT0cvR2RseWdHZTBocUNVMkZWaWhKTE5ZUWhvRG90Tmdp?=
 =?utf-8?B?MUZTTVRoUG1zZTJ0UzhlbEhIWTgvT1ZQN1U0VTdwYVlJdkNyOGFRYStPYWgv?=
 =?utf-8?B?NzRKTGJTR3dWTmsvUW5za2diSEkraWZiTFZFdnhlRWgvWGhoVzBCYlZ1R2Nt?=
 =?utf-8?B?d0N4YncrQ2UrSXJsZEszQ25OeW5IRmtKNTZqVlNDd1FUVDFOMDNjdm5YR3hn?=
 =?utf-8?B?VXBHMjhORzlVU01CUXJPY3NvalJ3T0g5S3M4anR2ZjhsR3gwNTJMYXpIMnpB?=
 =?utf-8?B?Qi9ndWlTM3FkTTVuVm5RbzhObmhyUzNYSHpNQjdKUGZYZFNsV08vVzBvQnZV?=
 =?utf-8?B?aENFT2ZhMnF5Rzc3VGw3Y3M5c01lZmpiL0F0THNwd3U0d01iYlZ3emJiaXox?=
 =?utf-8?B?T1k2Y0liR0c0MmhHemZnK1lzRThXNzk0RGJHTWFmVERFRGpkMk02d0UrM3VM?=
 =?utf-8?B?bGp4b1VDM1J5eFc4VklZc2tRT1JGOU5FdTFOdk5zSENWVHlKSEZ0ODVzUnV5?=
 =?utf-8?B?RTV0elUxbzg2dDAwaHBBUUVBK0Z0c3hCTHU1b1ZiUnRTWVRuZUlsSkFkRS8y?=
 =?utf-8?B?Ky9yMnpvOFlnWWtRS3hqWll3M3JhdXRpRy9WczFQcDNJUWtTVFlnZmxGWXU0?=
 =?utf-8?B?MXhTSEdNMVhKN2x1WS96SFd6NlFtUjBqOTViMXhVcjY5eVRvZjQyS2N0Ym4v?=
 =?utf-8?B?SDVVQVdLUnZEY2Nla3lsSW50cVg0VEo4OEVlU3JDM0F0MTlwTWpRTFh4WVA0?=
 =?utf-8?B?Zm5oekt0V0NiL2pIa0JrUUU0SXNlVzFpc1dQTS9vcHN6NjdXbWIxMnlPWng0?=
 =?utf-8?B?TTlDZmorRXVkT2x3dGU2dVgvakVLckxLa1JvUDBHRTZwQ01saFR6cmV2bVYy?=
 =?utf-8?B?Q1p2ZjYyZVV5NVJmcUNjczBSbDlzZytkVk5ORGV4TVllL2ovcGo5RHBEWEZ5?=
 =?utf-8?B?aGhGeW5QYWI5NThyTTJtTTVKZEdIZmlZZDJPOXE0MndjaktCQ1hVeXF5NE5n?=
 =?utf-8?B?SFhNcmE3NU92NGNvVXVGOFFnR1FKQ2g2Q2xKMWpYR0FIeHZ4N2pSc0QrU3lu?=
 =?utf-8?B?aExoSGFza3ZDb3Z0M0RSbXFnUGVWalhyajArakptNDZLVGZOQmkvTVBUMnZs?=
 =?utf-8?B?cjhWTWJidXBUcWNBeWdhSjdXUDdaMm93ZWFvYWJKeno1K1FJSk1zNnpQNXdP?=
 =?utf-8?B?MHhKQlVyaEc3UWx2U1dBN0Q5NU5BUmViQmptRlNsUWp5MHc1SE45NW5TdGZF?=
 =?utf-8?B?TzZNT3RRQUREQSt2NFI2MlRaNFd4M2RPV2hPa05PeTRKR0FIcC9UUTJQYnZl?=
 =?utf-8?B?bzkvQW1kNi80RlEzMkpuRnJNdGxSTTRrb1g0d0RJT21UNVROQVRORVhCSkFy?=
 =?utf-8?B?TnZRaEJjRDVwMGtxMnVMSUEwVk9PMG5lOUJRYm1ScDlRODVwRU1pYWlpZmRW?=
 =?utf-8?B?bHI0UHJxZ1dxRy9MaWVNUkdoVU1qN1VHTjE4MXg3TWVxOVFOS2FjMWljMVRD?=
 =?utf-8?B?Zk1ERktlNUR1dnN3dWhibUE4OU1jTVVWQzFNQVFIaFhZQWJSajRWaVA4dkFH?=
 =?utf-8?B?OVlyN0d1ZGtoVTc2TFlrWkhEY1ZMbzdpUEFvNjArRGFRNDR0Q3cvTnRYbFlE?=
 =?utf-8?B?SVpGY0dpYjVMcGtsVWdYeXEvTm5hWVpsN0tqNmM4dmY5alNidWFOVXZjbFNl?=
 =?utf-8?B?Qnk0YkQ4NmVjbVVhcHUwb3p0OXdTUmxMcWFYOFlpZzkxM1ZMOUh6ZTNGcDUx?=
 =?utf-8?B?M3lJclEwQVdSSVNkSm14QjY2cEk3OXU4SE9JaTc4Ky8yTzVBOWcrNFY2aEZZ?=
 =?utf-8?B?SzBhREF3WXdsRXJ0bk1GZmcyTXRFVm5xb0REU0UyMjc5dit0QWN2S2VBNUxK?=
 =?utf-8?B?eUR0aFJibTlBWXdJYkRWNFl3bzVFVGRaTWtkMDhtdWg4TnBNVHJ6OWM1ZGxw?=
 =?utf-8?B?L052eGU3OGhTc2JjZ1pnTWVMdlhKQ0Y5YWEwbC8yM25keklJdVJneWJLUjlS?=
 =?utf-8?B?bFo5ZFc3WTI3QXNCcHgrQlBaR1QrNnpmNFJNZ3pWZzgrb2pCdTZhOWpHSGJN?=
 =?utf-8?Q?IQMvfA?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 13:51:13.1821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf42875-b38f-4bdd-ac28-08dd97a5628f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAF629724C
X-Authority-Analysis: v=2.4 cv=epTfzppX c=1 sm=1 tr=0 ts=682c88d5 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=O-6wXAqVNhmHSKOezYwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2ZMk5mFRbg0JJMgnqSyoi2CU0uN8pBwD
X-Proofpoint-GUID: 2ZMk5mFRbg0JJMgnqSyoi2CU0uN8pBwD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExMSBTYWx0ZWRfX6xlCbl0Eu+6l fSKw0T0h2XR96TEQCZx3RK+g8vdxh2Ju9iawSayyJXO8FTmG729IP8vTAohXWwUma3Mp1zUVu4z QlObyMeYNNNSN/c1MdZN2CPe2iscTC9v/tERw7l0KI7fwU8img3VPCW/8NxvYAa6vn+PZYPwpoL
 a0ifmGDruQ+K7W40s1eAnJ0PySU4SaoaKJO7G3PFi6nV7ssflB02r9g2vevB8q42BtiizY5Bq8e jR8SpdjCyztNfKlXwqT7d7DAAh8I854TY5dlnbzjIsteZ+ejkAwch5t86PzgFxbOHBRJFU5zQ8+ CrNvwn9HW2BKHYGzmgk0zT8xpuMXxONFl174xdPF6OtaSaTRt+adDVbGaDn01+qFbLcUsjW34VU
 vXIUeeOpyep4Q+1HbheF6Gwl708LpU47fSlZRx+VlyafzZj9h8beeAOwsQSkjaBD4EsNNVAj
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files for Cirrus Logic Smart Amp CS35L41 for HP Agusta Laptops.

Thanks,

Stefan Binding

The following changes since commit 1c5341b3fe2d563588fb8514147f73bda946f121:

  Merge branch 'robot/patch-0-1747720161' into 'main' (2025-05-20 12:44:55 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250520

for you to fetch changes up to d2c68273da0ecfe064795d9a524769611212a4c9:

  cirrus: cs35l41: Add Firmware for various HP Agusta Laptops using CS35L41 HDA (2025-05-20 14:00:42 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for various HP Agusta Laptops using CS35L41 HDA

 WHENCE                                           |   6 ++++++
 cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid0.bin | Bin 0 -> 4820 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid1.bin | Bin 0 -> 4820 bytes
 3 files changed, 6 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8e3a-spkid1.bin

