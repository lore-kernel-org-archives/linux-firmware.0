Return-Path: <SRS0=wEi6=XE=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA4BC369AB
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Apr 2025 13:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 664FAC4CEEB; Fri, 18 Apr 2025 13:41:54 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AA01C4CEE2
	for <linux-firmware@kernel.org>; Fri, 18 Apr 2025 13:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6AA01C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwyC5/VDMWyt2V4qb4MUj7sIPRmLFewwHVk1aJMd10cnMfnjz1xGREUTTkjY5kKSWLz/07JNs75qamH/7lDo2dI/yMYsw8TwvQjeWkSkDyy/sW6RfRqrb6VjdFwj07hXVRhsPmHa7iOZOYwE4g0LlhrUChkEqIB7nxzUsEjXZnoqY+nqSQU6YIWsbVcaeRny6piRukMSHTDdL5jgPhO43CQFUtPRNttWjk6zwbWuZfJAmwHdGkyEvTcJXHf1UAPQVRaproK3FuSa2oJncnA+3ARjZwtrjYMrvafUjiHMNWH8w7Fd+MsgDlX2a6wpQTD8gtlhquVVS7kJ8/dFUoqH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0d76pAa72A7aUUwCpk/5Q1c88Qc15NZSoyFVctcCexI=;
 b=iYZWV+22AVCnomknoiE2Zy6dCr2vr0/1h0wRNQ2jNKrwCGKY+80fXMjg2d76Mza5dOCfau/hEo0OWZzMR/z8kSqfPbxVCYQJi83xpJnucMMfgLX6zl7M6NBn7EJ/AkoaLo0NuYB2g3UW1ad4xgXlnvreoqum1XXkztA+RoOCNX38geL1YB8u9m1fqhOdEc5jxFehbAU0wd1oey3ffR94jtE45r5LqiZo7w3IGJrbHn3BE1yc7/G8xylQCi16/WTWYxunIObcobcm07pgNkgFztRJIvCWaU6Z6eFH1QE+X+Q9zIyNyPndcT4ApVENg5OscLAFmvOBJiDrGQmbUvLcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0d76pAa72A7aUUwCpk/5Q1c88Qc15NZSoyFVctcCexI=;
 b=Ey+y7Glt9ZC5OVw4uAEzI9BS40Y/T8x5Jc0llNXseKWjW1FbB+sbOR6SY44AJxDm8s4sAPZvVPuApDJp4+Mt3F4KcEbWy6lB5kTow0uAgVUHlBMJyW4ffGIU5jpPOOL0pIOHO2dynI37OM3axtM9CJtNtKLhRo9If5ljB8AnhC8=
Received: from DM6PR07CA0051.namprd07.prod.outlook.com (2603:10b6:5:74::28) by
 SN7PR12MB7202.namprd12.prod.outlook.com (2603:10b6:806:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Fri, 18 Apr
 2025 13:41:49 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:74:cafe::fa) by DM6PR07CA0051.outlook.office365.com
 (2603:10b6:5:74::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Fri,
 18 Apr 2025 13:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 18 Apr 2025 13:41:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 08:41:47 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware amd-2025-04-18
Date: Fri, 18 Apr 2025 09:41:34 -0400
Message-ID: <20250418134134.2457259-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|SN7PR12MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: f186a91b-f4b0-42a7-74c7-08dd7e7ec4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7ShI/54edfbjO3M1s0QVpfHeR9+AyPiv9HRPhX91G0JMbDjDOgjgq++s/t1q?=
 =?us-ascii?Q?X/SNUa0EdMbsT5PK41RG5B/ZD83AlAx61uN3m3N4mDMtdm194IIfF6JesnRW?=
 =?us-ascii?Q?bfrdclYoPt7bLD5GJDtXHH+s0Lba5u6b0DcrYHKunH/0uPKhj0ijRsQl4+YJ?=
 =?us-ascii?Q?Npydw9wsYNN0oWSfi+JrSzWLXpYC8kxpHQRdJ+MfgZ/Gshvfuqe+WLp17I65?=
 =?us-ascii?Q?GPGZdABkIbFtmKGNKBUw4c3TkzqyhGxHixUddafLqT7BJmgGD8o2EIzt8lt6?=
 =?us-ascii?Q?7Xyn8n0/s8PbIfAQL6Mt9r9GF3O39LcwZwS1uiBqtg8Sp6FLcxCCWhtfnZB0?=
 =?us-ascii?Q?KZicWAHesW3TJXvc30ebQisv6EWrsWqDrAPod6OYbEIkLw2yZ7LGaR0ufSLo?=
 =?us-ascii?Q?I8PX3JCo1mpNWH97BuIoSYEwCMcc3e1y8HXX3ZVv87vCPQbIjK1OKyaM3OAt?=
 =?us-ascii?Q?GoHqyjsFEpS1aB4UCmWYw8Fhh4P1StVIRYKPRik6jVapJ9oQTAlnUXOQ52gL?=
 =?us-ascii?Q?mKbOygv9K4gmxZlFO8EvQIbFNFW+ibEcpbz6Jq4SDHmpokOeZTpLVdDV4a+w?=
 =?us-ascii?Q?JPO1f1hXaz+3VGWAMe7tHQIR1rozYGrOhnxNtfRYccb1hkFqI3v3GlmmgWeT?=
 =?us-ascii?Q?v46/R7BUBX09lF/CRaLyNeLT1MleovgSMNsTMLtzLzzU44ojPoxFukPYJv5d?=
 =?us-ascii?Q?KcOXf5YqRInEh+aMgsH/KWAglH/hvRKzGV+cN1Xr/awckalb06XeeuzfxB6n?=
 =?us-ascii?Q?zMShTTtRujXK23Li64mRT5dETsJI5/YF6atXrdIzxY7GALYyiVwQw//6FzYs?=
 =?us-ascii?Q?NKSgAm4FvVDZxcQa2lvGC2CApkCaMhfGoQq8PLPXtq74oK5pyyQAgjMNplfu?=
 =?us-ascii?Q?6hMSY9DDfmFh5+WiUgAceEXLHHSX2Z1qBlo67jHwF6RtfFFmKwkqgNjZwCxn?=
 =?us-ascii?Q?8BEh9mcD7xdk916c46gnP32nNwOHwIK1wruMiWE9del5yn4yuQ3dej5G/Nwx?=
 =?us-ascii?Q?2q1UndrPuJ4P62fHlePRFH9DTdLtY2ZhX+/FY5nQQJeib9kMnQeKeLnF9Tmo?=
 =?us-ascii?Q?jMWq6Vv2PHbCK1LoZ8sL3CNQNp2pzvvP6VSho4/ivuTXn4PxOCva50OU6/2R?=
 =?us-ascii?Q?u6UfcAxeNNZMLTz3MB95lIUUpPQksWfHH/mSW0TkAhzdz1AWqHmZqSqKGqto?=
 =?us-ascii?Q?+i8Eq/4ga7lhqV2d3co4SdZlY2v2b3dtoDtXfIiWyPQG8x/gDU1pebDquUZZ?=
 =?us-ascii?Q?7aNhEiLn4lrgq/nv2I7XfqMQiVE2pQr1H82lW6Uesk9ncgl6XZl2eZ11Uqeg?=
 =?us-ascii?Q?ctgnZkGuGWqjEoyNr3KscFqVldwG6NH8Q3a7mdl9ptwbzcNS6yP7SQGmUqwq?=
 =?us-ascii?Q?O9n4QcB2z+oy/XdRdJzIEEqlL53HM4kOxOfJZ85HhJShW9IeHG6BBoG6I+3s?=
 =?us-ascii?Q?2qlib6pvWzy8sRrRxxBD15uao9pkVDLR/yg/mPm3d9TEiANF3XxDjfOXAuMj?=
 =?us-ascii?Q?qnKvNH9hZ7jQiAXJDVz/qjbmrtt7xU3tWkyc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 13:41:48.7694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f186a91b-f4b0-42a7-74c7-08dd7e7ec4cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7202

amdgpu firmware updates.

The following changes since commit a9b5100f0f73e023aeb4372e02e39fd493b05daa:

  amdgpu: update dcn 4.01 frmware to 0.1.6.0 (2025-04-17 15:35:27 -0400)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-04-18

for you to fetch changes up to 3b81fc1785548f73d2f75395801551866c911f77:

  amdgpu: update vcn 4.0.5 firmware (2025-04-17 23:02:32 -0400)

----------------------------------------------------------------
amd-2025-04-18:

amdgpu firmware updates.

----------------------------------------------------------------
Alex Deucher (48):
      amdgpu: update aldebaran firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update gc 11.0.4 firmware
      amdgpu: update psp 13.0.11 firmware
      amdgpu: update gc 11.5.1 firmware
      amdgpu: update psp 14.0.1 firmware
      amdgpu: update psp 13.0.8 firmware
      amdgpu: update beige goby firmware
      amdgpu: update gc 9.4.3 firmware
      amdgpu: update psp 13.0.6 firmware
      amdgpu: update arcturus firmware
      amdgpu: update gc 9.4.4 firmware
      amdgpu: update psp 13.0.14 firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update psp 13.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: update picasso firmware
      amdgpu: update vangogh firmware
      amdgpu: update navi10 firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update psp 13.0.10 firmware
      amdgpu: update navi12 firmware
      amdgpu: update psp 13.0.5 firmware
      amdgpu: update vega10 firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update psp 13.0.7 firmware
      amdgpu: update smu 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update vega12 firmware
      amdgpu: update navi14 firmware
      amdgpu: update vega20 firmware
      amdgpu: update gc 12.0.0 firmware
      amdgpu: update psp 14.0.2 firmware
      amdgpu: update smu 14.0.2 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update gc 12.0.1 firmware
      amdgpu: update psp 14.0.3 firmware
      amdgpu: update smu 14.0.3 firmware
      amdgpu: update vcn 5.0.0 firmware
      amdgpu: update gc 11.5.2 firmware
      amdgpu: update psp 14.0.4 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update gc 11.0.1 firmware
      amdgpu: update psp 13.0.4 firmware
      amdgpu: update vcn 4.0.2 firmware
      amdgpu: update psp 14.0.0 firmware
      amdgpu: update vcn 4.0.5 firmware

 amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
 amdgpu/aldebaran_sos.bin         | Bin 446176 -> 446176 bytes
 amdgpu/aldebaran_ta.bin          | Bin 140288 -> 140288 bytes
 amdgpu/arcturus_smc.bin          | Bin 270698 -> 270698 bytes
 amdgpu/arcturus_sos.bin          | Bin 199248 -> 199248 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin         | Bin 247040 -> 247040 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 579696 -> 579824 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 247040 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 579696 -> 579824 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 314528 -> 314512 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 218080 -> 218144 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 256288 -> 256624 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 230496 -> 230480 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 255824 -> 256688 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 314512 -> 314496 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 218400 -> 218464 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 256288 -> 256624 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 230496 -> 230480 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 314528 -> 314512 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 218144 -> 218208 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 256352 -> 256688 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 230496 -> 230480 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 256080 -> 256688 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 256416 -> 257104 bytes
 amdgpu/gc_11_5_2_rlc.bin         | Bin 162096 -> 162096 bytes
 amdgpu/gc_12_0_0_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_12_0_0_me.bin          | Bin 422656 -> 422592 bytes
 amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_0_pfp.bin         | Bin 351696 -> 352304 bytes
 amdgpu/gc_12_0_0_uni_mes.bin     | Bin 711488 -> 712656 bytes
 amdgpu/gc_12_0_1_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_12_0_1_me.bin          | Bin 422656 -> 422592 bytes
 amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_1_pfp.bin         | Bin 351696 -> 352304 bytes
 amdgpu/gc_12_0_1_uni_mes.bin     | Bin 711488 -> 712656 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/navi10_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi10_vcn.bin            | Bin 403904 -> 404032 bytes
 amdgpu/navi12_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi12_vcn.bin            | Bin 403904 -> 404032 bytes
 amdgpu/navi14_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi14_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi14_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi14_mec.bin            | Bin 268592 -> 268160 bytes
 amdgpu/navi14_mec2.bin           | Bin 268592 -> 268160 bytes
 amdgpu/navi14_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi14_vcn.bin            | Bin 403904 -> 404032 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 247040 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 579696 -> 579824 bytes
 amdgpu/picasso_asd.bin           | Bin 197120 -> 197120 bytes
 amdgpu/picasso_ta.bin            | Bin 46080 -> 46080 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 251328 -> 251328 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 238592 -> 238592 bytes
 amdgpu/psp_13_0_14_sos.bin       | Bin 389408 -> 397632 bytes
 amdgpu/psp_13_0_14_ta.bin        | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 238592 -> 238592 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 197120 -> 197120 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 782944 -> 787040 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 238592 -> 238592 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 234496 -> 238592 bytes
 amdgpu/psp_14_0_2_ta.bin         | Bin 258016 -> 258016 bytes
 amdgpu/psp_14_0_3_ta.bin         | Bin 270624 -> 270624 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 234496 -> 238592 bytes
 amdgpu/psp_14_0_4_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 374528 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 579696 -> 579824 bytes
 amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
 amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
 amdgpu/vangogh_asd.bin           | Bin 197120 -> 197120 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 395632 -> 395664 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 395632 -> 395632 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 395632 -> 395664 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 395632 -> 395632 bytes
 amdgpu/vcn_5_0_0.bin             | Bin 440848 -> 440848 bytes
 amdgpu/vega10_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/vega12_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/vega20_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 234496 -> 234496 bytes
 114 files changed, 0 insertions(+), 0 deletions(-)
