Return-Path: <SRS0=kZvZ=QZ=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D039CF6480
	for <linux-firmware@archiver.kernel.org>; Fri, 27 Sep 2024 21:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FA8EC4CEC7; Fri, 27 Sep 2024 21:23:48 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8BB0C4CEC4
	for <linux-firmware@kernel.org>; Fri, 27 Sep 2024 21:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8BB0C4CEC4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKonD3I6R9mlAnB0qJP5l4oICWFY4WNc8eauMsVwhJiyej630OtZEZI2sMM/Pv2vlwfpJj5+W+AId2rvR2ZdinZjKRsxgStJIvmP2xrDemfvkcePoB20Wafqdi6aqh0Mg7NH34okli7dsj43MDtLIeDDgR0YfEOSyc0lb+RLztAhcQqTEXhVgiK5ySjylhR7b9K1Ym5Y1rS8FttRgaU4LDW14uevIBMbhwbE4hmU4cAKUjHmWwACc1yL4Hp7VNMlS4zBJpvMr2hwQhic8/HrajQ/oSfToGPm2+yQsD7lOuY4n2Ksy2todPzcBziw+yoK7T14jd4jkrkuKSkSzdXlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiBTX68+hXLay+yl9T7OGiCBfpyGdU3tK7TZzPqYyTk=;
 b=cmiAWba1eVAl4QIxOFyZjacVfIiqdAv6eRhDQA25h0Y4wr6TTjXHSKUQEM7jsMTereEbQRwdjLY2spZazjpm9lS0xUUfWjPsJQfVCX6wGYw4dBLLRZmXuZ58OTWVNDCha6O97lc1aRbV4pKfjcv+QMBrcT0zB3FFpwb3/OT3l7/srJ4c1E98JrrlESmalPRvxDF94bmFfST8sYMzh4ZVRsQ9cIvthtYPDTePzwvqdhLPVOoHM18eptUFdgj4vEROUyx+zEplOmi4Ps9D+yxZD9pADPG1+9xppFxFGcVBMNJhf6jkAgxbKEPO8qMovh0qWESNgn9Jqa5N93EzE5PXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiBTX68+hXLay+yl9T7OGiCBfpyGdU3tK7TZzPqYyTk=;
 b=tFzykGOci7TCpS0sgPW5ZQudA72iXCd9u99jERj10Lrp/W0Ix2gzEh4lvwoFp+/YRwfJkiWxgSR20hAG/ljg7nvO9IzRi3WFQwEOoyI8iW+irSMs+qEsMhqIJ6o0LmWZYfRjsBZlda2IIK2OQgrxAGcwe2/LrswqBzK9bRm61bg=
Received: from MW4PR04CA0214.namprd04.prod.outlook.com (2603:10b6:303:87::9)
 by IA0PR12MB8837.namprd12.prod.outlook.com (2603:10b6:208:491::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 21:23:42 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::85) by MW4PR04CA0214.outlook.office365.com
 (2603:10b6:303:87::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20 via Frontend
 Transport; Fri, 27 Sep 2024 21:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 21:23:41 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Sep
 2024 16:23:40 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware updates
Date: Fri, 27 Sep 2024 17:23:24 -0400
Message-ID: <20240927212324.3002636-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|IA0PR12MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a74faa4-180e-4996-2aaa-08dcdf3aa922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nEPw3Oe6KN/qBpaeu3Vb48zHKdzZhAgg6vVK8kppPpWxvNacI/IjGpah1gzJ?=
 =?us-ascii?Q?zVmmXq++5c2wpg78Uy9SUXSpQLQv+TM6pHtRUfSiO1OErjUVHhxtMqLGSztq?=
 =?us-ascii?Q?VXijDBARbAJ8EmslHqPUE8CKRGvXzzkq6/4VpDWCrKBPHfvJAbXUU1HIauJr?=
 =?us-ascii?Q?iDjxwpZCH9YZHjBEu/qiECUsOMESDuxgUY0SBVA5JjOwuB71p1HchEKhKWeL?=
 =?us-ascii?Q?OA5eYFOSKSUseFjIlkgxAT4ulaiScXX80IVzwm0LlDHVpbvvSqZ37rWdDOwh?=
 =?us-ascii?Q?pt6yZHPzhIiH3knClAesfrfq3nbuNCFsGgSrxJ8EHzTp5LI1FhvZs3qGoHCK?=
 =?us-ascii?Q?UJOGhfJAgQ5Z8/YnU0/UZRBwsko3Jd+0e0lkVYxIkDGKKia98XbgluREYaBA?=
 =?us-ascii?Q?h0eFTC7uW0fDZ/mm+TV87CmWo44NrxlzV1L/ibgVzU+x6ds+4U8RkG1TO+nk?=
 =?us-ascii?Q?f1V2z+wE4eGd2z5iF3hsHx6OVGreBv0dti341BsnOVSIK6JhZFB0gP2mFBw0?=
 =?us-ascii?Q?UuZTQLjgssVyFClS1IVyzpiJLWqoFp+7Ic6H8ktFmeGu8fCWtKW/St270mRk?=
 =?us-ascii?Q?LxMPhxAVaaLDlTjtJD4uIPRdBkQWhwiWXAPRP48W21gpPJhojUD33+irihY7?=
 =?us-ascii?Q?lUz7iNCVKj++7Z1QmjbOG0DTAVMBa7GBSDpUd5xS9hv9vQ2+WRGd5cxzl+Kh?=
 =?us-ascii?Q?o7dBNpr74YcX2dXImaGtiagzSGuFGNaWFcypbQxYU+0MvmA/BCX60DFp6782?=
 =?us-ascii?Q?GMrN4dsobXUDtvTu7i3NGqz+DDhEK1NS+jA91b+oqraZtV29TC0RGTYzl8rD?=
 =?us-ascii?Q?YNbVONUWfYG/FQIHURsVPUYahB3qfB2hl/m0FK5k+TRd2aOePKQP+n8F1goR?=
 =?us-ascii?Q?bf+0V9A3x7eEIyXo7K8TLwYIUNj9MxDNPm8y1W5+TZtKaAMivWeYb5m3Pybn?=
 =?us-ascii?Q?vAGc6OOD74c+qp1E+nhvLtvemyK4+mjXTJwp6ESpaJ0BNIK1OiwEH3hyIx5y?=
 =?us-ascii?Q?1lqFkkd9Pa1e20RWFbOpSETCf0Zt1AOxuFjOMUyFo0X101/d07A/8Q8fvEQE?=
 =?us-ascii?Q?r3twnoBsfZBD+6pww9u+/P058Beu2owEHcpDIwWbrv+k8DZJ5r8SSfvTI32e?=
 =?us-ascii?Q?QiMxkLzxM7e4V8Bd9T6vPlOOeHon4v+eqV3QY+CSzzUMQoaPJ/UkHNdErGEr?=
 =?us-ascii?Q?yUUGbt2rCzxdvGX1x1V7Yq5O+SWXqaxeX5TH2v6GbhQa1SadBJdrCwgHotqk?=
 =?us-ascii?Q?hY+g59Q3TLWtl+TkvlCwe7EvbqW3Q4p5/5l4RluOyGhML0wyLwe0SAOF5ic3?=
 =?us-ascii?Q?59cxbMuagUWi1NgYS709n3Zb/s/HL89W5SFnZgFRd1qMS585x15n4kgPSyRf?=
 =?us-ascii?Q?Ll50TgsgNTQt4VtRsz8F8xxfnxmZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 21:23:41.7047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a74faa4-180e-4996-2aaa-08dcdf3aa922
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8837

Hi,

Updated AMD GPU firmwares.

The following changes since commit bcbdd1670bc34d8044e1c1d4b88a5df30f901ec1:

  amdgpu: update DMCUB to v0.0.233.0 DCN351 (2024-09-13 20:26:57 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-staging-2024-09-27

for you to fetch changes up to 9a827f2b46514106238c95d47b1299837e552907:

  amdgpu: update raven firmware (2024-09-27 17:15:07 -0400)

----------------------------------------------------------------
amd-staging-2024-09-27:

Update GPU firmwares.

Based on internal git commit 97ae5dc916b1b174cc87c1f1502a19d2c044e6e6

----------------------------------------------------------------
Alex Deucher (43):
      amdgpu: update aldebaran firmware
      amdgpu: update navi10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update SDMA 4.4.2 firmware
      amdgpu: update SMU 13.0.6 firmware
      amdgpu: update navi12 firmware
      amdgpu: update renoir firmware
      amdgpu: update navi14 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update green sardine firmware
      amdgpu: update navy flounder firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update vangogh firmware
      amdgpu: update beige goby firmware
      amdgpu: update picasso firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update vega10 firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update vega12 firmware
      amdgpu: update PSP 13.0.8 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update raven firmware

 amdgpu/aldebaran_mec.bin         | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_sdma.bin        | Bin 34304 -> 34304 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268576 -> 268736 bytes
 amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
 amdgpu/aldebaran_ta.bin          | Bin 140288 -> 140288 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin         | Bin 238848 -> 238848 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 587120 -> 587376 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 238848 -> 238848 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 587120 -> 587376 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 310784 -> 310784 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 217184 -> 217312 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 253360 -> 255248 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 229328 -> 229456 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 252800 -> 254784 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 310784 -> 310784 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 217536 -> 217664 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 253264 -> 255056 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 229312 -> 229472 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 310800 -> 310800 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 217280 -> 217376 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 253424 -> 255312 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 229312 -> 229472 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 252992 -> 254624 bytes
 amdgpu/gc_11_5_1_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 253280 -> 255168 bytes
 amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_rlc.bin         | Bin 161040 -> 161040 bytes
 amdgpu/gc_11_5_2_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 253056 -> 254368 bytes
 amdgpu/gc_11_5_2_rlc.bin         | Bin 162096 -> 162096 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 269200 -> 268736 bytes
 amdgpu/green_sardine_asd.bin     | Bin 193024 -> 193024 bytes
 amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
 amdgpu/green_sardine_vcn.bin     | Bin 403392 -> 403904 bytes
 amdgpu/navi10_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
 amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi10_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/navi12_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi12_sos.bin            | Bin 204656 -> 204656 bytes
 amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi12_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/navi14_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi14_sos.bin            | Bin 184176 -> 184176 bytes
 amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi14_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 218608 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 238848 -> 238848 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 587120 -> 587376 bytes
 amdgpu/picasso_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 251136 -> 251136 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 247232 -> 247232 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 193024 -> 193024 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 385312 -> 774720 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_4_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/raven_asd.bin             | Bin 193024 -> 193024 bytes
 amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
 amdgpu/renoir_vcn.bin            | Bin 403776 -> 403904 bytes
 amdgpu/sdma_4_4_2.bin            | Bin 34304 -> 34304 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268160 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268160 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 366336 -> 366336 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 587120 -> 587376 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_6.bin            | Bin 2584 -> 3748 bytes
 amdgpu/vangogh_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 579248 -> 579376 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 391888 -> 392560 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 391888 -> 392560 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 391888 -> 392560 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 391120 -> 391792 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 391120 -> 391792 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 391120 -> 391792 bytes
 amdgpu/vega10_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/vega12_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 226304 -> 226304 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 579248 -> 579504 bytes
 121 files changed, 0 insertions(+), 0 deletions(-)
