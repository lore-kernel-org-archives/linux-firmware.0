Return-Path: <SRS0=HhZU=UJ=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF8C02183
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Jan 2025 21:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2716FC4CEE2; Fri, 17 Jan 2025 21:14:10 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CCEFCC4CEDF
	for <linux-firmware@kernel.org>; Fri, 17 Jan 2025 21:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CCEFCC4CEDF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byYb1YGLMHKfoef2CDRiH/CpxPkqMPypUee/r3ML7hZE4/Y+e8NMZ+nwZfISR1wb6d8TO76odSjg7HZ4tuZGyb8VDYZXUjA9pYNqccaMgFvFkoASXoTh/A2lQsXZbbZlHLg/pgFJZyZKIGp1/xQSeTivfrpceHtxXIYS8DBDYF7GKzQIdSbvXyrivIJ7IYGlre732qK152KfGp3aU2bJGMnfxCaynl1x9cKoxlJRlF0uk580NWRjSQfWgGdInqiBUC7Gh0kVifVkncs8mogA+a+T2SnDAC3Mw5/L6DkjE4VgMPDzAw01u+kMXirfgi6QfQgfvp1wGrJ17i7hg6JONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEhg+ZdDgW+ZNp69BE1i/qGJenZhC68pmWsOZp1Gj2g=;
 b=Xbj+UCGOhFb34pWHXflTlxJ8tWXid+kWIJ1F8NpmmrquPdO3B9qTHTtiqVERR6qJ3DvF4dykmY7GoV0+rdjrXpB7V1/WhQLcO4enlH8wz/5L1ZyTt5814dloJ/3u9nRcEMeN0DTOjghgKqI6CPSA1mi6x3aAZ0h6VkMak7MlaLLSiYWuoIWABlh36+r4SaI2uSKHT9OUdtOF1cdjaWpMpNA0x49gYSp+EZ9LAy8xRjwguNBvrFnUl4nF4oN2l526F/POxKA4yj0wqpO3FRcMmJsbW+YTIDs8gGuB5ylRUQO0s7qbIaxV9lfdPlnxgzzJ5FFsofYMx6mRknnucCzWBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEhg+ZdDgW+ZNp69BE1i/qGJenZhC68pmWsOZp1Gj2g=;
 b=fmb8hIevIi8luscfBihWUQw0JVkXsRnpn+eWruO6TmOWBDkFn/KseTQ6rz2FsdQT6y+VR/zl6GYRo8HqPXJvhnFbVSETpFctFrTiv14eg0iRKrgiiFZkzBEoAvFacpsZRj8DK4fQ83TsbujRGR2m86iEoX999htw1z5+UfU4x94=
Received: from SA1P222CA0142.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::24)
 by PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 21:14:04 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:3c2::4) by SA1P222CA0142.outlook.office365.com
 (2603:10b6:806:3c2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.17 via Frontend Transport; Fri,
 17 Jan 2025 21:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8356.11 via Frontend Transport; Fri, 17 Jan 2025 21:14:04 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Jan
 2025 15:14:03 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware updates
Date: Fri, 17 Jan 2025 16:13:49 -0500
Message-ID: <20250117211349.3237123-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 499adc0c-e20b-4db6-67bf-08dd373bdf1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lo6DAuZZb9ZpFIwZ7KEWSrlORx2OZmtysIR+gZuoF+9O6ihTl+uZ8Wz/rLFk?=
 =?us-ascii?Q?NdHoXvE5QF8/3GoiXsH7ve/mfQY0zu455PwIxnO2klXlKmk81bPyMrN1qKX6?=
 =?us-ascii?Q?mBP3+bUXmlLmbqKOS5A54yXKAfOgkQQqiC0JY/LgYHD9kCHZk14ImfIiTtGK?=
 =?us-ascii?Q?oA1C5v9SI+WUnhWt2wUNNrfyDotOmeXNUNOv+MhmLfR0oBYUyI0Hwi1/rgO2?=
 =?us-ascii?Q?mxaFTQbpDwMNNTGW6OmS4I2FTdDqb+imm2QXC4I9Wo21wJGASFmHWSdttgaG?=
 =?us-ascii?Q?kZTbagJX9e83Npnm3s2VvqmXzwfsOJJtnbB6UTKLarCvsWlgG/8kOPzOdQ3B?=
 =?us-ascii?Q?a1QFE8idwAez1kB2dGYrUrcGACrrWPe7KmeUrXHEP/2w700L327dLBUlwGM5?=
 =?us-ascii?Q?G944NREmExo/sdJfJQnT3FrWyY0yueO4s5lF4KPCoK1h9HPc9gr9v7WL7xZV?=
 =?us-ascii?Q?0ZPx0/tGGB+JR2erAxRW1yhwAadW6BJVSdXXRBW4X3UXENAPz4j8b9BF9R2w?=
 =?us-ascii?Q?yLsTUoYhgjY1IoZr6+6xnWn8iHUfRA83tYWaMzVS4pkLmj91c9kcCyn3dmgH?=
 =?us-ascii?Q?/Hdgt5QP0PIxESG5zR4m1MOr91nMBdoTH2Yor2Y2sehVDQGRdYTKg2NnsPoW?=
 =?us-ascii?Q?EgnWib+URM9LnFWTjwKr7ooaTWsamvnEF/ioK0UHDMyffS9kBoZKYjwUka1h?=
 =?us-ascii?Q?1Ma4rOU0mAFyQFOq5/avRz3phyBlfAHnMeKsMgOxHBYFYEDVgheR7ojA4x+A?=
 =?us-ascii?Q?sxjSHsAL6bYsW5hmF5bZHXzT2PsRy6q+cdwmdIALlJbaXmDyFTNbDUj4goS+?=
 =?us-ascii?Q?QqA2Qv+NsjHEVXTF6MDniFhshMjWQFIgLGACWm3PPOxxje7wz8YqZMfdP/MM?=
 =?us-ascii?Q?Wo/Piz3JdH4MA/P9wK5Q5Y4FnTxum8v/A0STl9x9W6IsabWa4DulUjclGjkc?=
 =?us-ascii?Q?e+9ikam1N4bTccuHwwzXsdaA4SWF4maTq1aWMEjc/+c66dZC0y6alV1L6Hes?=
 =?us-ascii?Q?Cz53NYdcK2a7gkmK3IBZmZ2FotmQwjrw2QvV/3C4OY9XFIcEbAz68/KmlPu3?=
 =?us-ascii?Q?zg0z6VyJOkj2If4NSLs0ht2jtUnWtQ1znlHQZm0DLU8jPUUZ8a9LDWQcJfFA?=
 =?us-ascii?Q?8WMwkKc+OCy62FiwDpPjS4T8ZOSXISiI58o5ZyNUYJykD5hNZ7Ef8zGSjzFj?=
 =?us-ascii?Q?LdYgYRWNknyo4l6iyZwLA79yyO7hks+NbBP58HRZmEd21bn91qG9c8KGln10?=
 =?us-ascii?Q?724FFLhixdaIkrcEWvI6q1LLrc4y3G5s3mSB6Xo66rtgWewunE0e8ZwxrWiu?=
 =?us-ascii?Q?tCId0VROUj740DX/aY9QoQc+y12ESuV2nWsjEZAIqbTQVb6VdWHAa3yYKtep?=
 =?us-ascii?Q?NHha4Hdyvjkew5Tv/BdQuN7ea9usiDHuDasxsayep5MjCcIgy64tgvQL/99X?=
 =?us-ascii?Q?b5nH52PTPMHg7wdh1QIoakATLzirBKUkrz2Rbs+iyybvw77Skw8i1+jwD+fy?=
 =?us-ascii?Q?21deOl5FBknGSb8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:tr;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 21:14:04.1516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499adc0c-e20b-4db6-67bf-08dd373bdf1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883

Hi,

Updated amdgpu firmware.

The following changes since commit 6dca30000d8aabdb8d6b540ec8901ea7956507c3:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2025-01-17 03:00:38 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-01-17

for you to fetch changes up to 95b18682465584a0178b496ce13fa96b74d61988:

  amdgpu: update psp 13.0.10 firmware (2025-01-17 15:55:55 -0500)

----------------------------------------------------------------
amdgpu: update firmware

Based on internal git commit:
ed603f9ea0fc91f92f7ef70a4b2890296f75fda0

----------------------------------------------------------------
Alex Deucher (25):
      amdgpu: update yellow carp firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update psp 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update navi10 firmware
      amdgpu: update gc 9.4.3 firmware
      amdgpu: update gc 12.0.0 firmware
      amdgpu: update psp 14.0.2 firmware
      amdgpu: update smu 14.0.2 firmware
      amdgpu: update navi12 firmware
      amdgpu: update gc 12.0.1 firmware
      amdgpu: update psp 14.0.3 firmware
      amdgpu: update smu 14.0.3 firmware
      amdgpu: update navi14 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update navy flounder firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update beige goby firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update psp 13.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: update psp 13.0.5 firmware
      amdgpu: update psp 13.0.8 firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update psp 13.0.10 firmware

 amdgpu/beige_goby_ta.bin       | Bin 242944 -> 247040 bytes
 amdgpu/dimgrey_cavefish_ta.bin | Bin 242944 -> 247040 bytes
 amdgpu/gc_11_0_0_mes1.bin      | Bin 217408 -> 218080 bytes
 amdgpu/gc_11_0_0_mes_2.bin     | Bin 256528 -> 256000 bytes
 amdgpu/gc_11_0_2_mes_2.bin     | Bin 256528 -> 256000 bytes
 amdgpu/gc_11_0_3_mes_2.bin     | Bin 256592 -> 256064 bytes
 amdgpu/gc_12_0_0_me.bin        | Bin 410688 -> 410688 bytes
 amdgpu/gc_12_0_0_mec.bin       | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_0_pfp.bin       | Bin 350864 -> 350992 bytes
 amdgpu/gc_12_0_0_uni_mes.bin   | Bin 709920 -> 709520 bytes
 amdgpu/gc_12_0_1_me.bin        | Bin 410688 -> 410784 bytes
 amdgpu/gc_12_0_1_mec.bin       | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_1_pfp.bin       | Bin 350864 -> 351024 bytes
 amdgpu/gc_12_0_1_uni_mes.bin   | Bin 709920 -> 709520 bytes
 amdgpu/gc_9_4_3_mec.bin        | Bin 268736 -> 268736 bytes
 amdgpu/navi10_ta.bin           | Bin 33536 -> 37632 bytes
 amdgpu/navi12_ta.bin           | Bin 33536 -> 37632 bytes
 amdgpu/navi14_ta.bin           | Bin 33536 -> 37632 bytes
 amdgpu/navy_flounder_ta.bin    | Bin 242944 -> 247040 bytes
 amdgpu/psp_13_0_0_ta.bin       | Bin 255232 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin      | Bin 251328 -> 251328 bytes
 amdgpu/psp_13_0_5_ta.bin       | Bin 230400 -> 234496 bytes
 amdgpu/psp_13_0_7_ta.bin       | Bin 230400 -> 234496 bytes
 amdgpu/psp_13_0_8_ta.bin       | Bin 226304 -> 234496 bytes
 amdgpu/psp_14_0_2_ta.bin       | Bin 258016 -> 258016 bytes
 amdgpu/psp_14_0_3_sos.bin      | Bin 431536 -> 435632 bytes
 amdgpu/psp_14_0_3_ta.bin       | Bin 270624 -> 270624 bytes
 amdgpu/sienna_cichlid_ta.bin   | Bin 370432 -> 374528 bytes
 amdgpu/smu_14_0_2.bin          | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin          | Bin 333236 -> 333236 bytes
 amdgpu/vcn_4_0_0.bin           | Bin 395632 -> 395632 bytes
 amdgpu/vcn_4_0_4.bin           | Bin 395632 -> 395632 bytes
 amdgpu/yellow_carp_ta.bin      | Bin 230400 -> 234496 bytes
 33 files changed, 0 insertions(+), 0 deletions(-)
