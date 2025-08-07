Return-Path: <SRS0=texe=2T=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FD2C87FCF
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Aug 2025 16:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 274A4C4CEF1; Thu,  7 Aug 2025 16:25:34 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EB5FC4CEEB
	for <linux-firmware@kernel.org>; Thu,  7 Aug 2025 16:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EB5FC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdYEHlQlUMmbDlhXBn/i7a10kD3JaXtKfZjNev2vaa2ObwX9es7FbmPm29ymQRhJgpJs7Zp8cGzOpj94X/TjtjI9NRza+OcXjGXVUNiOEiZNkLk+ZbZNxIfa9QEByXErmfWk4PZ5O8BGKuYStNyn27BXeaTSxhJ9+uwEHx+vaHdScep5W2NN4cjxXy0KhU/w7+P+q3fFOK/0ffn/7vAkV80bwmCzyjBes9ScJGu1gu5BGNikps+svyYKwfcL1yk81x2MdW7F0cfENiEd03Ie9sUIFHt+RvhST3DB0L9xsZTdHwngSLQLGvdUORt10U/pin37rXY+lqFJnm2zrbH8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcHyyKgkZ3nkLG/PrJGzZIOl5aeBVLZmaqSHqaEwIek=;
 b=r+XoZ1uHezQOVE6dVdqPN0BKfLLC5jb2dL6xIf2gcw5+7EVXIv+z1lZ24VtYM8pw8jzjQWuIolxE43kMKg1bjVDuKSU8Femu3gMBrkwY/ZUXXdl9YrWNTNtqw9tGe5iujR38vGpNNrfA2jCMwA7pVk28CrK2BYNG9IQj3DQCRvkmddaXCFX1jPd2l+WLsZ+j/UVRQytvrgM7gEIj5t45qzlhDvjUkOh6bfhfyKidRfnDyIYErlIKYwQpVLbF/PlHbcBLNMHl2CCN3X6uip1/aqkDVvx5KGb+hR4OD43KKkBkt5US6//GGfUY+KdKR7hHI9nnTtcWEL2xeuPWCjoScA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcHyyKgkZ3nkLG/PrJGzZIOl5aeBVLZmaqSHqaEwIek=;
 b=L0enwmc3oZFydYH7Y94x3a85L5MUfCKL+UuMisvDANX9EknHawo7an1VlpSkT1UCAPie1tKPNwTIa+zPfeJqoghr2Cv6OiimS0pDEIo1OB1s6kgK/lsk64V0nBrmH3DxkKVt7vNhWqNrRHMya6UgZvI47XpjLFxOvMZVT7dnry0=
Received: from MN0P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::9)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:25:29 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:52b:cafe::17) by MN0P223CA0015.outlook.office365.com
 (2603:10b6:208:52b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.14 via Frontend Transport; Thu,
 7 Aug 2025 16:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 16:25:29 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 11:25:28 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amd-2025-08-07
Date: Thu, 7 Aug 2025 12:25:15 -0400
Message-ID: <20250807162515.1560892-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|PH0PR12MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d66d0c-ed5f-4068-1e15-08ddd5cf05eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QkNMvHVLNIWQqnJrZW0bpXIyr7qys2NZ2nidO1sRYdUIWLTtSMpeAj1uCLoJ?=
 =?us-ascii?Q?3+2Ouq3KoHoH8lvlS0ROHE3LJmEUGW956cxade1sMxarCTLWACVUbWM2GMD0?=
 =?us-ascii?Q?7ZSIA78F6lu6wQLeOw4MbU8JCAfQ9sqX3Uq/F9aizWFx2zOAn6uhkLd5OoYc?=
 =?us-ascii?Q?j+q3z3S/bwwGOMQ4gossX2QADXt69Q/CTbOJgDdsFwqpkX/trQLdN6QWOLAz?=
 =?us-ascii?Q?o7MdCBoc3KOt6tT+zFcD3mGKsPdx/VNEcJlbzrptM1rp0qIcEANNE0Amk3ke?=
 =?us-ascii?Q?qIwfWIS7i4sDUkY4CIJZ2+iCADKuVmOk4fVqlfRGPQxMcFwQ07b81LveqVt5?=
 =?us-ascii?Q?cNmwOlmnCiyjojdTKOARlrS4CEZjDkyFR6d1+ve8rlwic1i6FX8fyAEob/ho?=
 =?us-ascii?Q?mw+vuEAVYWwYMY3AjWvu3Srq+42YMQaBGCE1CRmtr+mY4IBTVKihJCp9Maaa?=
 =?us-ascii?Q?2ApgX3ZFROaNBShbe2f0B1nXZT2IFtFiGcmaOGJ2GeCAGCrpHRgIPMIokvFh?=
 =?us-ascii?Q?SHG166PZCMgopMNAc1oVCnb4BFPwkSewFoOboVh8kKnI3dH2DkdwB4VEEsqL?=
 =?us-ascii?Q?M6dea/yjKRJz3pNvqIWRkJHfuMrhvu63JlM5g2WAjcHPVpGxFxxZ4Z/wMJsF?=
 =?us-ascii?Q?AtuJL057rXQwgfMIRbrygweCU4y9+DV12QGypQEFTpScarzwAh1xpZOljZhP?=
 =?us-ascii?Q?YO/b6WgQb1A3J3z0H1oJhcGyK00pfPqBcL/e1HKDvbuLAhL/JAvNeJOHthlb?=
 =?us-ascii?Q?bvueP/A1lZkFs13cdZ+JY2hyQpDINLt4fV8kfsavkUh7p5Y2gp/BkmsA0Ywo?=
 =?us-ascii?Q?nq3Yuyodw5ZFkgyLEvsH+Ncw2qsxldot6xNYToGHoeCXb7Dnt784Wx6qRI/g?=
 =?us-ascii?Q?GKuhPqATpSZtzUOGdw/1OA9SFBkuf4ZcrNKkRe7HcoMMG6ca+BHIHiAdwuGk?=
 =?us-ascii?Q?Kpsocj5jkqJoiDFz50X50rEW6EmrzUTXmOTyN/FVbW4hYybocWcg5+ubgoRd?=
 =?us-ascii?Q?tL2IavorK22behmNi1y3lueZz+7LJ539XnuwrigLPB7rV3wzC5c2VKoEP6ec?=
 =?us-ascii?Q?gATh+bazPKhFO2dfyvpZIRgvdPD/lDmunsMnxG2awzxdR96HtwQSQcwXJuP8?=
 =?us-ascii?Q?p7+TwOoaz3jPQjqu8sTh1pLJ2tzwE3FVDSRLNsMdD6NdA9tR7YWCeIyQWSbZ?=
 =?us-ascii?Q?8955HNhLqY0xaZmnhgaHVxq3BYfM/s9CEegPbTQcB9+7At6WAdxz0zGcAbZX?=
 =?us-ascii?Q?4WLYxt666f+DqnkHmlvfQgxbYttV5flIMH52bsTGqwgRlLsc+pDbfASQAg43?=
 =?us-ascii?Q?Q3egwMTTK9yU3+ZnXDQ1AFxIb2RxM+tB4R+blO3/qoyJus1XkZXPBL1PI1ul?=
 =?us-ascii?Q?J9+bxb6OyLKRZAWF0wKXrOZXfa8SkJPzjwaSHxQf9uZB9m9MgA2Gu28jT4r1?=
 =?us-ascii?Q?KU3H/QuaTRFgx/Wj7c9vlChnHUPiXZhOqPxj5cXFEJC1H83x4R7dZ55L8d3a?=
 =?us-ascii?Q?zKgQD2Hg4eU+bgAIFyRaPHSkobtz9jKu0Ls9eEKPQhZIOnIx+qq8Xa+njw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:25:29.0289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d66d0c-ed5f-4068-1e15-08ddd5cf05eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470

Hi,

Updated AMD GPU firmware.  Please apply.

The following changes since commit ba2549fc973076ac1500a9ba5adf8864c130e7f5:

  amdgpu: Update GCN 4.0.5 microcode (2025-08-05 13:35:36 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-08-07

for you to fetch changes up to 4bc7421189c99138355ac1378a1cb60ff34af516:

  amdgpu: update renoir firmware (2025-08-07 12:07:15 -0400)

----------------------------------------------------------------
amd-2025-08-07:

Update to latest GPU firmware
Add new kicker firmwares.

----------------------------------------------------------------
Alex Deucher (63):
      amdgpu: update aldebaran firmware
      amdgpu: update dimgrey_cavefish firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update SDMA 6.0.1 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update GC 10.3.7 firmware
      amdgpu: update PSP 13.0.8 firmware
      amdgpu: update beige goby firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update SDMA 6.1.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update vpe 6.1.1 firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update PSP 13.0.14 firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update SDMA 6.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update GC 9.5.0 firmware
      amdgpu: update PSP 13.0.12 firmware
      amdgpu: update VCN 5.0.1 firmware
      amdgpu: update PSP 13.0.0 kicker firmware
      amdgpu: update navi10 firmware
      amdgpu: update vangogh firmware
      amdgpu: update navi12 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SDMA 6.0.3 firmware
      amdgpu: update navi14 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SDMA 6.0.2 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update GC 10.3.6 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update vega10 firmware
      amdgpu: update vega12 firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update SDMA 7.0.0 firmware
      amdgpu: update vega20 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update SDMA 7.0.1 firmware
      amdgpu: update VCN 5.0.0 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update SDMA 6.1.2 firmware
      amdgpu: update navy flounder firmware
      amdgpu: add GC 12.0.1 kicker firmware
      amdgpu: add PSP 14.0.3 firmware
      amdgpu: add SMU 14.0.3 kicker firmware
      amdgpu: update renoir firmware

 WHENCE                           |   5 +++++
 amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
 amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
 amdgpu/beige_goby_ta.bin         | Bin 247040 -> 247040 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 580080 -> 580080 bytes
 amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 247040 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580080 -> 580080 bytes
 amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_6_mec.bin         | Bin 268160 -> 268592 bytes
 amdgpu/gc_10_3_6_mec2.bin        | Bin 268160 -> 268592 bytes
 amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_7_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_7_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_7_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_10_3_7_mec2.bin        | Bin 268160 -> 268160 bytes
 amdgpu/gc_10_3_7_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 314512 -> 314512 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 218144 -> 218240 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 257072 -> 257056 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 230480 -> 230976 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 256544 -> 256448 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 314496 -> 314496 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 218464 -> 218560 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 257072 -> 257056 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 230480 -> 230992 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 314512 -> 314512 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 218208 -> 218336 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 257136 -> 257120 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 230480 -> 230992 bytes
 amdgpu/gc_11_0_3_rlc.bin         | Bin 179104 -> 179104 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268640 -> 268640 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 256544 -> 256448 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 256608 -> 256512 bytes
 amdgpu/gc_11_5_0_rlc.bin         | Bin 166528 -> 166528 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 256896 -> 256800 bytes
 amdgpu/gc_11_5_1_rlc.bin         | Bin 161040 -> 161040 bytes
 amdgpu/gc_11_5_2_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 256080 -> 256704 bytes
 amdgpu/gc_11_5_2_rlc.bin         | Bin 162096 -> 162096 bytes
 amdgpu/gc_12_0_0_me.bin          | Bin 419776 -> 466592 bytes
 amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_0_pfp.bin         | Bin 352016 -> 351984 bytes
 amdgpu/gc_12_0_0_uni_mes.bin     | Bin 721312 -> 721824 bytes
 amdgpu/gc_12_0_1_imu_kicker.bin  | Bin 0 -> 132352 bytes
 amdgpu/gc_12_0_1_me.bin          | Bin 419776 -> 466592 bytes
 amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_1_pfp.bin         | Bin 352016 -> 351984 bytes
 amdgpu/gc_12_0_1_rlc_kicker.bin  | Bin 0 -> 150848 bytes
 amdgpu/gc_12_0_1_uni_mes.bin     | Bin 721312 -> 721824 bytes
 amdgpu/gc_9_4_3_rlc.bin          | Bin 38708 -> 38708 bytes
 amdgpu/gc_9_5_0_mec.bin          | Bin 269200 -> 268736 bytes
 amdgpu/gc_9_5_0_rlc.bin          | Bin 38700 -> 38700 bytes
 amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 269200 -> 268736 bytes
 amdgpu/navi10_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi12_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi12_sos.bin            | Bin 204656 -> 204656 bytes
 amdgpu/navi14_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi14_sos.bin            | Bin 184176 -> 184176 bytes
 amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 222704 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 247040 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 580080 -> 580080 bytes
 amdgpu/psp_13_0_0_sos_kicker.bin | Bin 268976 -> 268976 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 251328 -> 353728 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 238592 -> 340992 bytes
 amdgpu/psp_13_0_12_ta.bin        | Bin 66880 -> 70976 bytes
 amdgpu/psp_13_0_14_ta.bin        | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 238592 -> 340992 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 197120 -> 197120 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
 amdgpu/psp_13_0_7_sos.bin        | Bin 248496 -> 248496 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 238592 -> 238592 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 238592 -> 340992 bytes
 amdgpu/psp_14_0_1_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_2_sos.bin        | Bin 421216 -> 421216 bytes
 amdgpu/psp_14_0_2_ta.bin         | Bin 258016 -> 372816 bytes
 amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
 amdgpu/psp_14_0_3_sos_kicker.bin | Bin 0 -> 435968 bytes
 amdgpu/psp_14_0_3_ta.bin         | Bin 270624 -> 385424 bytes
 amdgpu/psp_14_0_3_ta_kicker.bin  | Bin 0 -> 270624 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 238592 -> 340992 bytes
 amdgpu/psp_14_0_4_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/renoir_vcn.bin            | Bin 403904 -> 404288 bytes
 amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_1.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_2.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_7_0_0.bin            | Bin 47872 -> 47872 bytes
 amdgpu/sdma_7_0_1.bin            | Bin 47104 -> 47104 bytes
 amdgpu/sienna_cichlid_sdma.bin   | Bin 34048 -> 34048 bytes
 amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 374528 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 580080 -> 580080 bytes
 amdgpu/smu_14_0_3_kicker.bin     | Bin 0 -> 327424 bytes
 amdgpu/vangogh_vcn.bin           | Bin 579568 -> 572368 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 571952 -> 572368 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 395664 bytes
 amdgpu/vcn_5_0_0.bin             | Bin 433552 -> 434768 bytes
 amdgpu/vcn_5_0_1.bin             | Bin 207440 -> 208144 bytes
 amdgpu/vega10_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega10_mec.bin            | Bin 268064 -> 268224 bytes
 amdgpu/vega10_mec2.bin           | Bin 268064 -> 268224 bytes
 amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega12_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega12_mec.bin            | Bin 268064 -> 268224 bytes
 amdgpu/vega12_mec2.bin           | Bin 268064 -> 268224 bytes
 amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega20_mec.bin            | Bin 268064 -> 268224 bytes
 amdgpu/vega20_mec2.bin           | Bin 268064 -> 268224 bytes
 amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vpe_6_1_1.bin             | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_rlc.bin       | Bin 178128 -> 178128 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 234496 -> 234496 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 571440 -> 572368 bytes
 145 files changed, 5 insertions(+)
 create mode 100644 amdgpu/gc_12_0_1_imu_kicker.bin
 create mode 100644 amdgpu/gc_12_0_1_rlc_kicker.bin
 create mode 100644 amdgpu/psp_14_0_3_sos_kicker.bin
 create mode 100644 amdgpu/psp_14_0_3_ta_kicker.bin
 create mode 100644 amdgpu/smu_14_0_3_kicker.bin
