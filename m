Return-Path: <SRS0=n8NH=S4=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19444E64AB6
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Dec 2024 15:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D83E6C4CEDA; Tue,  3 Dec 2024 15:25:00 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A8D4C4CED6
	for <linux-firmware@kernel.org>; Tue,  3 Dec 2024 15:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A8D4C4CED6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJ1UXkRyVFU0YhSxmIQI0hjKUq4PJdpX1O8nTwWvG7yel44KRrsgVKkyyM12ntB7BTKwL5ZXo2QJGqVDdF+K4bilbSHsngntCl6B1zawfJRBXa7jdNDD/un0iIM2C8jbe+hlGLd3S3Tee8J9G42WOSnI5wowD0qZ9QA0KXKNUU/3Lr40lSX9aH/2puaagk+VonpFavpMRw1i5556NktDhGS08vXq3fxspexbQknwHW4nElvrv1QthBxavfGKm29lpVoIhydBpgge8Oq0lhxaZuDfjP+4v99qVVq2iuKJLjvKzJdZgoOhoPvSKne+E54GA0vIAviQhmpxPMIE9NhpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+dF6JWMB2M8L2QghU1e5orvgnbtBRnB9GHcCK0JdjM=;
 b=Ax59qjK18yXjsUjSUFk0S1BxEUFxb5zGda12U/xkPJfMugIlYHE/IfQTU/WPQrq9fnJTPAJt4E97s8SKeLvnq9jNW84XQNZBQgzeBt0USqxlK+B44XG1CJ0Kf13SBKhxo1LzaUD8fmulbnZunIthtnPnMxQkmhaAbqbkLD8yxUnnZcmpqvmngAt3g8fsPJkuEqkOE9JfY8kS39KPsFq/ANX1D9VjPuzSkG1FgSVAk4vlCSWZqM4tAwBSK3oyKGYx73o64rEZ4K6t1VVWRzZ+n2zw8TltGERCSBm5ZFAX34fYXYMKeR839DcExvdvYvmBpSo/MwWdp4IIz00dXvZrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+dF6JWMB2M8L2QghU1e5orvgnbtBRnB9GHcCK0JdjM=;
 b=g6nsYRLPAAFQlRxCIqUKLtJIIfsQlQ9GGZzLscD8n2/zr42QpoiM4Aeq50EkzxdHBaUcESPSgBRT/h/q0V2YAebW0/PtORhfjmNllHn0zasd0so0J5exWCbYDf9IEOCAGly8yA+exU4Z/rDNafG7nlY+BU7xAh2sdO+yFMWpssU=
Received: from DM6PR01CA0024.prod.exchangelabs.com (2603:10b6:5:296::29) by
 IA1PR12MB6307.namprd12.prod.outlook.com (2603:10b6:208:3e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 15:24:48 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:5:296:cafe::e1) by DM6PR01CA0024.outlook.office365.com
 (2603:10b6:5:296::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 15:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 15:24:47 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Dec
 2024 09:24:46 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <Mario.Limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu amd-2024-12-03
Date: Tue, 3 Dec 2024 10:24:30 -0500
Message-ID: <20241203152430.2391129-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|IA1PR12MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cef3077-e3e3-47f9-a610-08dd13ae9faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lZpbz0ylQ6W7eSQHQsvKNS/Ol9NbR0afYlrOwRtzFXImBVlW+QsmtJxcm+jB?=
 =?us-ascii?Q?5vFQgqkgtMhx1g3dpBX7TvOxt5AMpMn6oC0UtCr+Cd58R95l/ODRP1Xnre9T?=
 =?us-ascii?Q?qbkFENhYIcXITPUW8tr9tw2DRCBidmFjkM+CFNdOnLSxka3XjvLyqhFH6QVw?=
 =?us-ascii?Q?HjSlkMXVv9p+23LLomglS3Mtd+DinAz0rowwJilNxYwkDyHVVvEF4PIHyNJu?=
 =?us-ascii?Q?v6hzmgYi5RKcIbhdE5M9JkuM3CRlLAnUxEH4uXsVnrwSyTmTP+oJfC6fsFoR?=
 =?us-ascii?Q?ODsqkN6/pSjVtABsUmTnBAts5YA7PHzH5ShpgdjIMiC+Hc8/7POb2W/6vPy1?=
 =?us-ascii?Q?uR/AvzcRammX5pux/jAFWhAo9dgAsaoB9JIH48+F2wesYfDMqm3D4raF0DVY?=
 =?us-ascii?Q?Q6Il5/gnSzTOlGnhHsgjmxc55yDTnElPGHp+n683eVaX3vFWJUBjfx+3EaDo?=
 =?us-ascii?Q?wRbMd5Bv6raHsBqgXSJH6AZ43XyBzKh/vZ4uuegeJZR+faw4myv55Eux8mSL?=
 =?us-ascii?Q?mnDbdoKo2ZL/CiVH+B/7xRwqgJMVz+mpEr5IO3LbmH/lpdx/hLtK5+bOMiwp?=
 =?us-ascii?Q?fnONPKzcnHPbK6LFg3i4yXiBwrAdxdnzvMSzjvf5FXOa9JBu4N4LqO8YQHDl?=
 =?us-ascii?Q?SaOXYfRwZAr/PBBxASXGglm4VQwiIkD7WZin2pQD7VMYUqz0K6p1hvfJCRrT?=
 =?us-ascii?Q?+zehXMXlivEzTje6TNQfDZ0Voa1TTzNFDBh/mku+SjCxahxB1TeOXf9hkbkk?=
 =?us-ascii?Q?Zz7tcVgMCh+swa4iTWlAQtI5d5dFqt+AeVy5gpRJ4RAlOu2AStu8lOApbidu?=
 =?us-ascii?Q?L46Ohn5Bo+xRb7yHIHuk1EF+Y5vprxJTGLKOpPqh1Gzjd3Mj+AaOzOQ3enr/?=
 =?us-ascii?Q?JrxEnu+pxhC4pS9arRwQ0OWedduVTaC1PXZB33+9FE23PTtS9TjQiJezLQdM?=
 =?us-ascii?Q?X8zomhl/RTp7ls6upfhjrd8uYYkJ+lkCGZC1LsvyzyeCiS+dw1Jp3AGveVsI?=
 =?us-ascii?Q?JLKk9Mvjn/thdShYXpDhKp11uQBIL6IZVc8UTF/v6CPh+V1KpTJjRLhLiIGo?=
 =?us-ascii?Q?0+eoW8JzXi5ohHFLC33VXdNYup4xZwgoHnmTTOJJjnAXyiyYPr+ZdObVAERa?=
 =?us-ascii?Q?JCLPUxaWjoWRDlpZ3IvFK6UFedFHtBUtiN9k4Zlg/Rh/R3LGrLc3ZbQlAbe2?=
 =?us-ascii?Q?kwBEXZxGv/brk5fGxbYkaFSni/4Rh1DVqYLOJCoLkPWsZlbKmJCIw11PQp7l?=
 =?us-ascii?Q?n4u10DsVpd5TrFJUbzFXhrilyblACHVjy9VBFxYz8vufov3a9G3AvPkcywrz?=
 =?us-ascii?Q?BACRO3OaRBw2IfqWurtx3wEsN1xKHsoDBhT2YUbPOlascNxjEQBZ1/2oFzAD?=
 =?us-ascii?Q?ygCw2l1yukTgBbp+kiJXSTzNzAsoxKoNyDoCHgZ7gnXYSCqG6k/d7sM9VWD4?=
 =?us-ascii?Q?57m/uwFgJzf96hYaE6QZXaTd/e2YIzT4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 15:24:47.9382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cef3077-e3e3-47f9-a610-08dd13ae9faa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6307

Updated amdgpu firmware.

The following changes since commit dc44789e901d30a70b9d9ff7bcc8a38fbc201e52:

  amdgpu: update smu 13.0.10 firmware (2024-11-26 10:11:36 -0500)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2024-12-03

for you to fetch changes up to 9c1252813011ac54d1cde67464625488476fa36e:

  amdgpu: update raven firmware (2024-12-03 10:18:48 -0500)

----------------------------------------------------------------
amdgpu: update GPU firmware

from internal git commit:
1057d7713554894b50e2d00f550c4b7e9eeda84e

----------------------------------------------------------------
Alex Deucher (41):
      amdgpu: update aldebaran firmware
      amdgpu: update navi10 firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update psp 13.0.6 firmware
      amdgpu: update navi12 firmware
      amdgpu: add gc 12.0.0 firmware
      amdgpu: add psp 14.0.2 firmware
      amdgpu: add sdma 7.0.0 firmware
      amdgpu: add smu 14.0.2 firmware
      amdgpu: update renoir firmware
      amdgpu: update navi14 firmware
      amdgpu: add gc 12.0.1 firmware
      amdgpu: add psp 14.0.3 firmware
      amdgpu: add sdma 7.0.1 firmware
      amdgpu: add smu 14.0.3 firmware
      amdgpu: add vcn 5.0.0 firmware
      amdgpu: update psp 14.0.0 firmware
      amdgpu: update vcn 4.0.5 firmware
      amdgpu: update gc 11.5.1 firmware
      amdgpu: update vcn 4.0.6 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update gc 11.0.1 firmware
      amdgpu: update vcn 4.0.2 firmware
      amdgpu: update green sardine firmware
      amdgpu: update gc 11.0.4 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update vangogh firmware
      amdgpu: update beige goby firmware
      amdgpu: update picasso firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: update gc 11.5.2 firmware
      amdgpu: update psp 14.0.4 firmware
      amdgpu: update vpe 6.1.3 firmware
      amdgpu: update vcn 3.1.2 firmware
      amdgpu: update psp 13.0.14 firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update raven firmware

 WHENCE                          |  27 +++++++++++++++++++++++++++
 amdgpu/aldebaran_mec.bin        | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin       | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec.bin    | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin   | Bin 268736 -> 268736 bytes
 amdgpu/beige_goby_vcn.bin       | Bin 579312 -> 579184 bytes
 amdgpu/dimgrey_cavefish_vcn.bin | Bin 579312 -> 579184 bytes
 amdgpu/gc_11_0_0_mes1.bin       | Bin 217408 -> 217408 bytes
 amdgpu/gc_11_0_0_mes_2.bin      | Bin 256208 -> 256528 bytes
 amdgpu/gc_11_0_1_mes_2.bin      | Bin 254912 -> 256064 bytes
 amdgpu/gc_11_0_1_rlc.bin        | Bin 157040 -> 157040 bytes
 amdgpu/gc_11_0_2_mes1.bin       | Bin 217760 -> 217760 bytes
 amdgpu/gc_11_0_2_mes_2.bin      | Bin 256208 -> 256528 bytes
 amdgpu/gc_11_0_3_mes1.bin       | Bin 217472 -> 217472 bytes
 amdgpu/gc_11_0_3_mes_2.bin      | Bin 256272 -> 256592 bytes
 amdgpu/gc_11_0_4_mes_2.bin      | Bin 255744 -> 256064 bytes
 amdgpu/gc_11_0_4_rlc.bin        | Bin 159152 -> 159152 bytes
 amdgpu/gc_11_5_1_imu.bin        | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_1_mes_2.bin      | Bin 256128 -> 256416 bytes
 amdgpu/gc_11_5_2_rlc.bin        | Bin 162096 -> 162096 bytes
 amdgpu/gc_12_0_0_imu.bin        | Bin 0 -> 132352 bytes
 amdgpu/gc_12_0_0_me.bin         | Bin 0 -> 403984 bytes
 amdgpu/gc_12_0_0_mec.bin        | Bin 0 -> 447456 bytes
 amdgpu/gc_12_0_0_mes.bin        | Bin 0 -> 636048 bytes
 amdgpu/gc_12_0_0_mes1.bin       | Bin 0 -> 609840 bytes
 amdgpu/gc_12_0_0_pfp.bin        | Bin 0 -> 349264 bytes
 amdgpu/gc_12_0_0_rlc.bin        | Bin 0 -> 150704 bytes
 amdgpu/gc_12_0_0_toc.bin        | Bin 0 -> 2048 bytes
 amdgpu/gc_12_0_0_uni_mes.bin    | Bin 0 -> 711264 bytes
 amdgpu/gc_12_0_1_imu.bin        | Bin 0 -> 132352 bytes
 amdgpu/gc_12_0_1_me.bin         | Bin 0 -> 404048 bytes
 amdgpu/gc_12_0_1_mec.bin        | Bin 0 -> 443360 bytes
 amdgpu/gc_12_0_1_mes.bin        | Bin 0 -> 643536 bytes
 amdgpu/gc_12_0_1_mes1.bin       | Bin 0 -> 611920 bytes
 amdgpu/gc_12_0_1_pfp.bin        | Bin 0 -> 348672 bytes
 amdgpu/gc_12_0_1_rlc.bin        | Bin 0 -> 150848 bytes
 amdgpu/gc_12_0_1_toc.bin        | Bin 0 -> 2048 bytes
 amdgpu/gc_12_0_1_uni_mes.bin    | Bin 0 -> 711264 bytes
 amdgpu/green_sardine_ta.bin     | Bin 33536 -> 33536 bytes
 amdgpu/green_sardine_vcn.bin    | Bin 403904 -> 403904 bytes
 amdgpu/navi10_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi10_mec.bin           | Bin 268720 -> 268592 bytes
 amdgpu/navi10_mec2.bin          | Bin 268720 -> 268592 bytes
 amdgpu/navi10_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/navi10_vcn.bin           | Bin 403904 -> 403904 bytes
 amdgpu/navi12_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/navi12_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi12_mec.bin           | Bin 268720 -> 268592 bytes
 amdgpu/navi12_mec2.bin          | Bin 268720 -> 268592 bytes
 amdgpu/navi12_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/navi12_vcn.bin           | Bin 403904 -> 403904 bytes
 amdgpu/navi14_vcn.bin           | Bin 403904 -> 403904 bytes
 amdgpu/navy_flounder_vcn.bin    | Bin 579312 -> 579184 bytes
 amdgpu/picasso_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/picasso_ta.bin           | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_14_ta.bin       | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_6_ta.bin        | Bin 88960 -> 88960 bytes
 amdgpu/psp_14_0_0_ta.bin        | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_2_sos.bin       | Bin 0 -> 417120 bytes
 amdgpu/psp_14_0_2_ta.bin        | Bin 0 -> 253920 bytes
 amdgpu/psp_14_0_3_sos.bin       | Bin 0 -> 417120 bytes
 amdgpu/psp_14_0_3_ta.bin        | Bin 0 -> 253920 bytes
 amdgpu/psp_14_0_4_ta.bin        | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_4_toc.bin       | Bin 2560 -> 2560 bytes
 amdgpu/raven_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/raven_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/renoir_vcn.bin           | Bin 403904 -> 403904 bytes
 amdgpu/sdma_7_0_0.bin           | Bin 0 -> 45824 bytes
 amdgpu/sdma_7_0_1.bin           | Bin 0 -> 45824 bytes
 amdgpu/sienna_cichlid_vcn.bin   | Bin 579312 -> 579184 bytes
 amdgpu/smu_14_0_2.bin           | Bin 0 -> 333236 bytes
 amdgpu/smu_14_0_3.bin           | Bin 0 -> 333236 bytes
 amdgpu/vangogh_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/vangogh_ce.bin           | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin          | Bin 268160 -> 268160 bytes
 amdgpu/vangogh_mec2.bin         | Bin 268160 -> 268160 bytes
 amdgpu/vangogh_pfp.bin          | Bin 263424 -> 263424 bytes
 amdgpu/vcn_3_1_2.bin            | Bin 571568 -> 571440 bytes
 amdgpu/vcn_4_0_0.bin            | Bin 393200 -> 393200 bytes
 amdgpu/vcn_4_0_2.bin            | Bin 393200 -> 393200 bytes
 amdgpu/vcn_4_0_4.bin            | Bin 392688 -> 393200 bytes
 amdgpu/vcn_4_0_5.bin            | Bin 392432 -> 392432 bytes
 amdgpu/vcn_4_0_6.bin            | Bin 392432 -> 392432 bytes
 amdgpu/vcn_4_0_6_1.bin          | Bin 392432 -> 392432 bytes
 amdgpu/vcn_5_0_0.bin            | Bin 0 -> 438608 bytes
 amdgpu/vpe_6_1_3.bin            | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_ce.bin       | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin      | Bin 268720 -> 268160 bytes
 amdgpu/yellow_carp_mec2.bin     | Bin 268720 -> 268160 bytes
 amdgpu/yellow_carp_pfp.bin      | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_vcn.bin      | Bin 579504 -> 571440 bytes
 95 files changed, 27 insertions(+)
 create mode 100644 amdgpu/gc_12_0_0_imu.bin
 create mode 100644 amdgpu/gc_12_0_0_me.bin
 create mode 100644 amdgpu/gc_12_0_0_mec.bin
 create mode 100644 amdgpu/gc_12_0_0_mes.bin
 create mode 100644 amdgpu/gc_12_0_0_mes1.bin
 create mode 100644 amdgpu/gc_12_0_0_pfp.bin
 create mode 100644 amdgpu/gc_12_0_0_rlc.bin
 create mode 100644 amdgpu/gc_12_0_0_toc.bin
 create mode 100644 amdgpu/gc_12_0_0_uni_mes.bin
 create mode 100644 amdgpu/gc_12_0_1_imu.bin
 create mode 100644 amdgpu/gc_12_0_1_me.bin
 create mode 100644 amdgpu/gc_12_0_1_mec.bin
 create mode 100644 amdgpu/gc_12_0_1_mes.bin
 create mode 100644 amdgpu/gc_12_0_1_mes1.bin
 create mode 100644 amdgpu/gc_12_0_1_pfp.bin
 create mode 100644 amdgpu/gc_12_0_1_rlc.bin
 create mode 100644 amdgpu/gc_12_0_1_toc.bin
 create mode 100644 amdgpu/gc_12_0_1_uni_mes.bin
 create mode 100644 amdgpu/psp_14_0_2_sos.bin
 create mode 100644 amdgpu/psp_14_0_2_ta.bin
 create mode 100644 amdgpu/psp_14_0_3_sos.bin
 create mode 100644 amdgpu/psp_14_0_3_ta.bin
 create mode 100644 amdgpu/sdma_7_0_0.bin
 create mode 100644 amdgpu/sdma_7_0_1.bin
 create mode 100644 amdgpu/smu_14_0_2.bin
 create mode 100644 amdgpu/smu_14_0_3.bin
 create mode 100644 amdgpu/vcn_5_0_0.bin
