Return-Path: <SRS0=/QPB=PL=amd.com=ChiaHsuan.Chung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6055C3DA7F
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Aug 2024 05:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8BCAC4AF0F; Mon, 12 Aug 2024 05:52:59 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A49F4C32782;
	Mon, 12 Aug 2024 05:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A49F4C32782
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fH9oEkQHNADXsXn7ibacJjhwJzCIVwjIRganp3PRwENxMVWChy3epLIK08IF5ckyXqPA6eWgdYYoF43Sim1X/Tu64Rd9j0w4QmT90mb2wrNQwPL5p1D2SeYbNtREB4VnQXOXznxourSpZWyYTrBhxAFrauvKuSvU2Gu1fPrmykCMeFaMxgMJCNCmL2IRxdSCy+C99hB/GWojz6/MzUYgGHbkTZXYZA4CHb6XkF013VP/4Lysopm1/f8n7grExhLuiNphR0+huoXAHvg9T1GCNZIVIu+ST/5WmVMpOZg7SYIGcSNKiTSCNIEdP16EQuCrTE514lezle19GsX4c5W0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhbfrRdw2NpiY4c9Scxu7p2dg4X3efMoRbMV2N4Yq7U=;
 b=tQSurIRIMgSWLXlZelFmFSBq/q6bakXc2HdkKRrsL02UlSQh2AZXwiLXkPvLm6a/KuUREL1coIIQn2hxaVWtg/7a8Hdvmw4uhBFTZ96DjhlIj28u/q45EfZRpsF2gQXetmZOSqmUg4XD9EXGrLhmpmIj6E1lbGrJAXyzw/lDJmOcngP8X8qSoOQcv+wchlxZTtwxqvjl1vznAivPE+1cGA2l8P+/eKQV3SXgTqkw6Yfwz08EMDBFTAKImyGgUS2eMQvEPoj8GXPyxjhMAxlj2oswXPx+EEji1VjqzM0vXEYwLraT6cUzC66FVwcvyo29NSn0BxVW1GiHN1dgqEt/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhbfrRdw2NpiY4c9Scxu7p2dg4X3efMoRbMV2N4Yq7U=;
 b=pbl4NcF3CnqzAwbev09TMZ/VvyfdvDshHLkdzUjbZZL+oGFKici54Dm2bkGpccGqCtCK6EBzhbClIFCJNjVn8ca86oEseeFbSpgwH7gqKfZE58oN4BqV1nnYf+8ZLDo3mbT8tGqdkaI6vBVT2zs+lsF+ZyQFH+GC8eyKxGL0phs=
Received: from BN0PR04CA0096.namprd04.prod.outlook.com (2603:10b6:408:ec::11)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 05:52:54 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ec:cafe::78) by BN0PR04CA0096.outlook.office365.com
 (2603:10b6:408:ec::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20 via Frontend
 Transport; Mon, 12 Aug 2024 05:52:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 05:52:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 00:52:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 00:52:53 -0500
Received: from tom-r5.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 00:52:51 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, Tom Chung
	<chiahsuan.chung@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.229.0
Date: Mon, 12 Aug 2024 13:52:46 +0800
Message-ID: <20240812055246.9294-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c43a126-3dd6-4cfa-2079-08dcba93023b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?63/bsO3+EljY8NfKX7O8kgy9q9fen/HrEpibcDyM3akWdBMWtk+EKzIby4IU?=
 =?us-ascii?Q?e474QpXWtWtW0qlKtkH9qFjc9qcttHCCL+MBPZcTolHZ8Qe84F1/ss91mbNw?=
 =?us-ascii?Q?gow90Z56g2I/2Y3cCXG/Uhh8gDXIxSjtjw9duXAsVLjudFwfzckV1bjLdmwr?=
 =?us-ascii?Q?5BTZHvnUEgFrC7e5bzMd0Sv4l/jCyQr8COjBaAOM9wVwXfnHXR8sM9ao+lGL?=
 =?us-ascii?Q?zKfINyL+lPGSCpUq1hRSnrR+8WMFGPiz4Z03n/E0lHR5g2IjxOgUlaUiaRZk?=
 =?us-ascii?Q?+J/rl4/X9Gf3nYO2gHc1M3K1bONotYBM5rh4u271nN1+q+x21xJDBUYvMV2w?=
 =?us-ascii?Q?qNfzumJk8zJgq68EeqqLZkpGPk6Bhn/n6ThLyLY9bd9utfo0PkXT0m580gJL?=
 =?us-ascii?Q?ToTa6mUsBH7UBEAmRpkuFufOzwUUTl/V8wNGCXJGfzdRhkm89tOqcWoVVagg?=
 =?us-ascii?Q?AMgCwFII69rL3DNEWrvaY5mpvs1yQNwhOEs6pFoaxWUA14bjUuF2i8Z5qg8O?=
 =?us-ascii?Q?PVahYlGvuJjdBDTZ7e4Vd4uFP09+gETG+jHilzrfOdqjoxxFri7UCkjdNYVQ?=
 =?us-ascii?Q?SzDZeAuM+ol+U1xnXmp3rlmgCkq8CMd4SYj7iMfoS/AuApZfU7uH7S2lB3fi?=
 =?us-ascii?Q?yLxPiR8kQT+X1LY6dUvpozsAMEp6B4jokDf37AB2Rj2a/ywlb28eL1hTq+LC?=
 =?us-ascii?Q?Mtjr4UvFD5cAcJ/YqN+GXQKAjRfiOsGs/uyZd24LyCJ4Qx8DT6dxuOXfvOa/?=
 =?us-ascii?Q?LbwF9wqixaOM2WFO642xHKkD4GsRe4hR0yF3RLi6I6C5YFiUQdCZbQT9t6EH?=
 =?us-ascii?Q?R6UwIgDCU2Fk4zdDTtflKznj42DuKp6xJ/GJxd+t9KfXfcIkZq2LWteOuOU1?=
 =?us-ascii?Q?wAm5Sd57DsaGNjRRwNDX5JhD0KuWkjPQU0lBp3EGITNalA3+Qbe0nqsE9w8l?=
 =?us-ascii?Q?359NxqUf24C26eFRVJZLrUW9vXtWsPyEV2QuRpJY9yePtjJJIGv137JY38XB?=
 =?us-ascii?Q?Sjnf0UVG75o/pM/h8pjvRjl40nAEj3Ibm9oluX+Q1uyH0s0QhYWk7xxd/QEL?=
 =?us-ascii?Q?CGqokJD2yEk29Hdb3VRHP8seceA+6HrcldXyUiTRnG1Apfp8n6isXEWV+UYq?=
 =?us-ascii?Q?SuY6qOWBSX3U1M1tbLqPgcJ0kvN3rcGMoQN4/+q4pSMfGCxAVxmKGNXGy4y5?=
 =?us-ascii?Q?h2+78zvczB9Ytyta8j/A0zJh/Vq0seWpVPsVZpIvFvJL8g+VhFD3pAnRUcw4?=
 =?us-ascii?Q?YNtTrSQTnm+XigukgtykOkmZOiOtonnAwN7AYVCj0n40iVnKxBGxgp9vrhv8?=
 =?us-ascii?Q?5xwZGH6lt0+ZuMBV4xAc/ssYPs8eaLlk64j/+rxoEE8xGgAn9F59WaP2JNAW?=
 =?us-ascii?Q?UE6WTvNKnIGBMt67tFMN+8LLkyaj7CF+Ktq7D1Y999FGR6M9ijz296JKRqd8?=
 =?us-ascii?Q?wHBXtUUlCVKiLXIskpj82+ovUUzQqor0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 05:52:53.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c43a126-3dd6-4cfa-2079-08dcba93023b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-08-12 13:43:13 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-08-12

for you to fetch changes up to 0600ef249c32e761d2f31d50fddc4f17e6676849:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-08-12 13:43:13 +0800)

----------------------------------------------------------------
