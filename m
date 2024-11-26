Return-Path: <SRS0=cL3a=SV=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682FBD3B9A7
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Nov 2024 15:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38C23C4CECF; Tue, 26 Nov 2024 15:24:40 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C84FC4CED0
	for <linux-firmware@kernel.org>; Tue, 26 Nov 2024 15:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C84FC4CED0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAxFrte3b58bTO5ntPF1VAoqJLV3ZxJGKrKlSthsL0E2uvQXB1gI/7Ike9/0iLlt/oJBBP7aV3o62eYqy+Qwmr/4/LrtJTHaJj1DdYG5MWBxBOhEAdH/KTARWjwKJylCiujOGw6qm8lDOVwQzgpsEMIksBEWalvnzJcj/gw823CFzer6vox8qYG9N78AgCsxQew7h+xHeXYOfetbrYkR+AdnMfx8C/vW9MplpAmul2WPu4Fru389YOqs2NLprTCT1/g9Yvc9FggzgSa/GbsfAAJtla5u/HY3vUoCy8iGesN0iom62S/qTnz5jpxlmTAl+fuTI8vuydaOEVD8BMv1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKJ2mF5OkDBwDSavG8pHHS2suqTwwJyH/8aIOQQVAW4=;
 b=lNl8mnVW4C8JU66CO8pSidz+2rK2Q5nzMA2TXHb+do4jmerTug0IB6iDpXjzuEHimqSfDxSpXul61RJCm+j63QsdHWR38AIIgAYfWfQfXKg9e3oaqdWXNe0BnQR6RLIZ43WMSGWnJbk9U/d+zRIk1C7Qwsnwq40D2Jv1M1wObX2RncgDu2SLAbGldMIdaO0y0yUPsho/6uiyKxfERLOO6/XXt0fHNqsowb0aa3BCDQDSp9bCEs0z/4y/hSy8/Yo1ePj0uHZSSVXTjlDJ39kD0xfLeMunCL/f6R6nieOYqMqY8Ua6mWmacmGmmm51AgKk1s9cdvXSeSHrYkIPr4iOYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKJ2mF5OkDBwDSavG8pHHS2suqTwwJyH/8aIOQQVAW4=;
 b=XqvdozIuG5Bg5f8z0FHEJu3sR35q2afmJK+P2x2tDWld5Y3OpEYV9sDaY+c4IOTnWSSW3id61AAR/v8HhOBpGWPumQ7E/JNOtA/OlS5vjjX0KFoyvy5uVsRitTyXc1e6jJsqLpXBp4vos8xf29y3J4T4ezLKPNQRvP9NvlQFvFw=
Received: from BY5PR13CA0016.namprd13.prod.outlook.com (2603:10b6:a03:180::29)
 by MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 15:24:28 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::fd) by BY5PR13CA0016.outlook.office365.com
 (2603:10b6:a03:180::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.11 via Frontend Transport; Tue,
 26 Nov 2024 15:24:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Tue, 26 Nov 2024 15:24:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 09:24:20 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <Mario.Limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware updates amd-2024-11-26
Date: Tue, 26 Nov 2024 10:24:06 -0500
Message-ID: <20241126152406.3177927-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: c30e784e-bb41-40fc-b234-08dd0e2e6aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1NH2R616z4x0LMzcRxveDyofzK7alPnddiViBZw6b/bBAE4pYjUGEzHVr6P?=
 =?us-ascii?Q?o+HVtSLhINXwrMzD7aGJsBJh+xvq6aaAHr9waUS5ivXryaXf+cqVKtEikcgh?=
 =?us-ascii?Q?DPwPoVi99shGw2l9Lf10bc10C7NkLWOQS2ZWAoJ9rjgr85r1Ca/tPnLtu+hh?=
 =?us-ascii?Q?Ra6J/zDwn8u+H/Q/YD4VJa5XrdvnXtshmSf9sqtk1CIuZKvlhkjxYvGQS078?=
 =?us-ascii?Q?rp7ZLx426d1d4UkP2t+csUBlrPhfDKcTqspvApeT9SI0KdB0+gQSOCtYNPqu?=
 =?us-ascii?Q?4781H6gRK4U1cbYjn9hilxmnCvwP7ZTo82o6fLTb8KPFvUORfU3adZO973yG?=
 =?us-ascii?Q?YTJw8JlT6h57eH5+rpoZnKZ52dCqIn1spFnfsE/wN6HL7yBD/+Oo9bXBzNzq?=
 =?us-ascii?Q?0zmjpuR2KdlRV8KHgrWm89n+Us0TeXNgewCQGPnLXaGHNzaD3lBPgWZukfAR?=
 =?us-ascii?Q?8MrKv3eAjZLjMvrI9ZHJDrIPnt46W/lzVxHSm26prAKJZjNOl3mNm4BUAngJ?=
 =?us-ascii?Q?j9wqkCFMMg2cZqVnHXg0+qBciAFr2FwhweTfGpEGHLX5i38GvEsiGJDZINla?=
 =?us-ascii?Q?/I4/+URoCQkdB8OtQk/do4fqDp807g1Q/XlUWRpQcZxZkSzW1ICRLQH3yiDb?=
 =?us-ascii?Q?O97Ey76PY/+HwqLW9V/ML7URs2W/q8v+MFO0ltJQegSKAOwRb8dcug8aUHhl?=
 =?us-ascii?Q?mby3IJXOKDbSja6vDicVroZ8/kopK8s+UNiiWHBCxHwDC/QtxlnWL6w2bNd+?=
 =?us-ascii?Q?3F9CmSyepVmKxcqxgQwXZEvUcIEkOqHQRPl+iyN9yDBqCXQhYU5rdbTvZgGy?=
 =?us-ascii?Q?0pWErufhUAQKtS0EMIXtn0YMm6/0lo/rVN4wtoQoDe2c38cd1jrHvmor0EQJ?=
 =?us-ascii?Q?4E79ijbojqiKu+3LgCxKH2aEO/armB3s6bcRAsChv/fQVpX6/DCtN4JDc+XC?=
 =?us-ascii?Q?mJ6SvKyXS2YznvgJ+H+tcjWxNo/MpexZDu3cYnCG30TXpGLFAx29ZnVpbGI2?=
 =?us-ascii?Q?iD0pXMFCyRC2y1pKzW+8ytkk3XnqY/cyc5+C+pAfIMuA1EzvnjihqJnbad07?=
 =?us-ascii?Q?T7tnqM8vrS27Mk6W3ed0A5VvVu7dEaQwkpOaK4fEUsPr4f4aScViwY9+MCQ8?=
 =?us-ascii?Q?B6X82Bc67ctjk2dlJoOIlOPmdtdN9mQ3wAPRUi0qD1l9AT4BAxGwn+tzMzFp?=
 =?us-ascii?Q?t3EIH1jp9R4g2Lk2HEaRULz8ZgCO3x5IlSd2gj3n2xMbeXq50nWbOkB+KkMe?=
 =?us-ascii?Q?d5C38t5h3wtziNIwZ/0rS6Zm8mpNGocb42w+h1ioBiKg8ev/Tf/VqcX8XEId?=
 =?us-ascii?Q?wUIO6WqtEqKi5D7bWoBd42QoENDfA3MVs1GliTd7SWRedlfvT22Ls4cLc0+v?=
 =?us-ascii?Q?zkjPoYqjV7NzTM171U9SZpUlzDAN/Ixyj5YXjewb7MupmP6ixuyFxg6ZHJ6G?=
 =?us-ascii?Q?NHguUyxUaisB1CQVENbvmlxwJiBNjh3c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 15:24:28.0097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c30e784e-bb41-40fc-b234-08dd0e2e6aec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957

Hi,

Updated AMD GPU firmware.

The following changes since commit b94113eeda89486dc25cd11e080f328b1be22f95:

  amdgpu: update DMCUB to v9.0.10.0 for DCN314 (2024-11-22 18:27:29 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2024-11-26

for you to fetch changes up to dc44789e901d30a70b9d9ff7bcc8a38fbc201e52:

  amdgpu: update smu 13.0.10 firmware (2024-11-26 10:11:36 -0500)

----------------------------------------------------------------
amdgpu: update GPU firmware

from internal git commit:
5707e5a1dd1a1eca873a43fc2dcc8a99e71bc94a

----------------------------------------------------------------
Alex Deucher (49):
      amdgpu: update aldebaran firmware
      amdgpu: update navi10 firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update psp 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update gc 9.4.3 firmware
      amdgpu: update psp 13.0.6 firmware
      amdgpu: update sdma 4.4.2 firmware
      amdgpu: update navi12 firmware
      amdgpu: update renoir firmware
      amdgpu: update arcturus firmware
      amdgpu: update navi14 firmware
      amdgpu: update gc 11.5.0 firmware
      amdgpu: update psp 14.0.0 firmware
      amdgpu: update vcn 4.0.5 firmware
      amdgpu: update gc 11.5.1 firmware
      amdgpu: update psp 14.0.1 firmware
      amdgpu: update vcn 4.0.6 firmware
      amdgpu: update vpe 6.1.1 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update gc 11.0.1 firmware
      amdgpu: update psp 13.0.4 firmware
      amdgpu: update vcn 4.0.2 firmware
      amdgpu: update gc 11.0.4 firmware
      amdgpu: update psp 13.0.11 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update vangogh firmware
      amdgpu: update beige goby firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update psp 13.0.0 firmware
      amdgpu: update smu 13.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: update vega10 firmware
      amdgpu: update gc 11.5.2 firmware
      amdgpu: update psp 14.0.4 firmware
      amdgpu: update vega12 firmware
      amdgpu: update vega20 firmware
      amdgpu: update psp 13.0.8 firmware
      amdgpu: update psp 13.0.5 firmware
      amdgpu: update vcn 3.1.2 firmware
      amdgpu: add gc 9.4.4 firmware
      amdgpu: add psp 13.0.14 firmware
      amdgpu: add sdma 4.4.5 firmware
      amdgpu: add smu 13.0.14 firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update psp 13.0.10 firmware
      amdgpu: update sdma 6.0.3 firmware
      amdgpu: update smu 13.0.10 firmware

 WHENCE                           |   8 ++++++++
 amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sos.bin         | Bin 442080 -> 442080 bytes
 amdgpu/aldebaran_ta.bin          | Bin 140288 -> 140288 bytes
 amdgpu/arcturus_ta.bin           | Bin 127744 -> 127744 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin         | Bin 238848 -> 238848 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 587376 -> 579312 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 238848 -> 238848 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 587376 -> 579312 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 310784 -> 314016 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 217312 -> 217408 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 255248 -> 256208 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 229456 -> 230192 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 254784 -> 254912 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 310784 -> 314016 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 217664 -> 217760 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 255056 -> 256208 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 229472 -> 230192 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 310800 -> 314032 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 217376 -> 217472 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 255312 -> 256272 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 229472 -> 230192 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268640 -> 268640 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 252928 -> 255744 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_rlc.bin         | Bin 158752 -> 159152 bytes
 amdgpu/gc_11_5_0_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 254624 -> 255008 bytes
 amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 255168 -> 256128 bytes
 amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_rlc.bin         | Bin 161040 -> 161040 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 254368 -> 255200 bytes
 amdgpu/gc_11_5_2_rlc.bin         | Bin 162096 -> 162096 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 0 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin          | Bin 0 -> 268736 bytes
 amdgpu/gc_9_4_4_rlc.bin          | Bin 0 -> 48076 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 0 -> 268736 bytes
 amdgpu/navi10_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi10_vcn.bin            | Bin 403904 -> 403904 bytes
 amdgpu/navi12_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi12_vcn.bin            | Bin 403904 -> 403904 bytes
 amdgpu/navi14_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi14_vcn.bin            | Bin 403904 -> 403904 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 238848 -> 238848 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 587376 -> 579312 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 251136 -> 251136 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 247232 -> 247232 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_14_sos.bin       | Bin 0 -> 389408 bytes
 amdgpu/psp_13_0_14_ta.bin        | Bin 0 -> 67904 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 193024 -> 193024 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 774720 -> 778816 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 67904 -> 88960 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 226304 -> 226304 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_4_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
 amdgpu/renoir_vcn.bin            | Bin 403904 -> 403904 bytes
 amdgpu/sdma_4_4_2.bin            | Bin 34304 -> 34304 bytes
 amdgpu/sdma_4_4_5.bin            | Bin 0 -> 34304 bytes
 amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_sdma.bin   | Bin 34048 -> 34048 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 366336 -> 366336 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 587376 -> 579312 bytes
 amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_14.bin           | Bin 0 -> 1420 bytes
 amdgpu/vangogh_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin           | Bin 268720 -> 268160 bytes
 amdgpu/vangogh_mec2.bin          | Bin 268720 -> 268160 bytes
 amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 579376 -> 571568 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 392560 -> 393200 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 392560 -> 393200 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 392560 -> 392688 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 391792 -> 392432 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 391792 -> 392432 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 391792 -> 392432 bytes
 amdgpu/vega10_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/vega12_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/vega20_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/vpe_6_1_1.bin             | Bin 25984 -> 25984 bytes
 129 files changed, 8 insertions(+)
 create mode 100644 amdgpu/gc_9_4_3_sjt_mec.bin
 create mode 100644 amdgpu/gc_9_4_4_mec.bin
 create mode 100644 amdgpu/gc_9_4_4_rlc.bin
 create mode 100644 amdgpu/gc_9_4_4_sjt_mec.bin
 create mode 100644 amdgpu/psp_13_0_14_sos.bin
 create mode 100644 amdgpu/psp_13_0_14_ta.bin
 create mode 100644 amdgpu/sdma_4_4_5.bin
 create mode 100644 amdgpu/smu_13_0_14.bin
