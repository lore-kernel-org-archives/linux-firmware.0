Return-Path: <SRS0=W/Zt=T6=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6702E77198
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 21:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94B8EC4CED6; Mon,  6 Jan 2025 21:26:13 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62806C4CED2
	for <linux-firmware@kernel.org>; Mon,  6 Jan 2025 21:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62806C4CED2
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pt3aCgsv6mng++Fl932+IcwZXSCU6F5oHq3BAIM/ruEES2YWs79KGIRe0UgnmkQKUKcOTTuHcN9zfZ0iwf4LIfg/8JihuGbwrDVbQ/PCCy92GOZ5uaE0JFL9dJdvY7u0RFNUH6b/oC6eMpJ3gx0YqAnLKh4QBLZAZV6Hpv4U9q5RzHqAqHRPnps9jZKlG57+8N3/NXrI4nuNtXh5mul5kkQ8HgITjuGQJSAM/dK5BYV6IQIiGb6LK8ipApPjXatCjfEM/DfqcWsiZGqnGfBMxhGbVQo7/6tOrL1/HtN2u5utJnyOsfiJE34u40uiuWF+B2r128jsEj4nG9cK+aNs8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PABr9X1FfHr+9EvZlR+3EHBW29fSay5NenWLGmPobQ=;
 b=tX7Iks3oPNAU6lMLaQyLQc3bWJgPO9VYqxh73wjzCuaTiL0/F5UCfmanLYj+gucgjEtf+w8eyJoK+zcGsqKf7KIZVE9yDecHmyrtujeTRNXqrUaN/7SeQSRTtyimwK4UlOeYNZkAoL6JusKukBKDuRrg05mZgFMl06sFM2nLRLqygm8wjo6G5kGOt/wGoheAaf1xj4HfXoYFPGhWGp/N9eMfkU2YJXWlwXOA+v/8KQ1zy97SRHTuL4IkGPXbiZQvtcsx9UAJBUVykDul8O8RPGLJmdl3fRJ4/WVILxut7yk3p4912ueMqQr6r6NpClz/1Wf1cso6mPA4iTqRlrzFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PABr9X1FfHr+9EvZlR+3EHBW29fSay5NenWLGmPobQ=;
 b=ZHDBTMUqalUBsAEIwTYDTzgn9WRZcEF2P9akRde8YgBzsuf5Jw37EGQ1igvgDh3U0fXvykaoYnDp0RxwAYgqfgzLn6J2liRqiJsmxe1dpEp4tc801IEq8iFrPv4BKX1mEcVmXry67HtgEIsA5ODD6DRL/vl7BvK9uLzy44ZchsU=
Received: from SJ0PR05CA0102.namprd05.prod.outlook.com (2603:10b6:a03:334::17)
 by CY8PR12MB8314.namprd12.prod.outlook.com (2603:10b6:930:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 21:26:04 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::a1) by SJ0PR05CA0102.outlook.office365.com
 (2603:10b6:a03:334::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.9 via Frontend Transport; Mon, 6
 Jan 2025 21:26:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Mon, 6 Jan 2025 21:26:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Jan
 2025 15:26:02 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] VCN 3.x firmware fixes
Date: Mon, 6 Jan 2025 16:25:49 -0500
Message-ID: <20250106212549.3381550-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|CY8PR12MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8b7307-d6a6-4e81-cd13-08dd2e98b975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D2an8Srt1rON1qBBqWvPdgxTSjsYo9YXZmQS2Dem3Iukm9iJXqi80tkOkGfx?=
 =?us-ascii?Q?DK9q/Fxse7BCNxllFLllks6c+eWCcdrI6jW6O0fDgT0jrr1RRpdSuPGrgW7R?=
 =?us-ascii?Q?d+1uMGf8iLLQRtjnSV2PQ6oOOUr8K2y6lvoxoKmqq8LOoWguHnupflMJKzlJ?=
 =?us-ascii?Q?uI/VCz4f4zmdTN/YdZlKUUpU1tSzbLppFVEQo/c8J8SqFaqkmWrDNHSDanLR?=
 =?us-ascii?Q?6e3/hWIkKSTlfTZCX2ko8KI6OShsBALkpSryOfVNj00Ch4WDL5m3J3zHaX4g?=
 =?us-ascii?Q?1gBV33Hxa8YI0Y2vSBPQxOaLsHRpNHCY26tFki0qf5JXDxJ8LzTU6m9LdnvC?=
 =?us-ascii?Q?2BciNw/JfAnEm/fL9yLSAPXcaukmdVYzTMWXUywn6HiDCMEwIcKwVYFOzvO1?=
 =?us-ascii?Q?9dOLwkUTM5ycynQv6jzg/2VyjIFVQy2GPbHMUFYaT+zn3IyseexUhwREjxAA?=
 =?us-ascii?Q?mzAwsfXXvDAgT2gvCHyIQ6X6q42pnKXk5C9BxI12gRxLhS39/hhUulL3aiAA?=
 =?us-ascii?Q?INRrANV+MQ0ZDRa3nE5MOJZnVbiGaVwTtXK8ypjxh1xXZ9fta7jx9M1mWjB/?=
 =?us-ascii?Q?mJFVpcFFd88pUSugkCcJVi+IpTRPE+V9apu3Kiwhy6FbCLcery72/W2ocTPQ?=
 =?us-ascii?Q?Yr10zxTcEEPEsAOxNO+aN390pxRQ+JUA/4lIufhwk9kH2FZq/u+Q29MCi06p?=
 =?us-ascii?Q?Kr+p1sUycCYItZU1n1LWpR4h1BtrbDgG9G/Esi4cgz5kj1AU9qUWDJe5fNv2?=
 =?us-ascii?Q?+vvOZ7sdgq3dkSEEzg1kgxukedtJAvMDLvh9ez/9hb3FVobT72MEUJvOPy/H?=
 =?us-ascii?Q?hPwf/M6iDydEgsbIe1B1xwHrSlwq1cHnKbofPjB0SxLth993eNAGZwKg5voH?=
 =?us-ascii?Q?MqskSelEXGHWjHkZoj4BY7n4nzLmlLRGTJ6gYF/0ZeNSpAWe0r4j93BTYsxz?=
 =?us-ascii?Q?HaHiuYnSqqM32zAtiAUCOyOua1AqJ0WJ62jUl9xHT2AsiXfrNCeppw1yz66E?=
 =?us-ascii?Q?YV50d+M6VMPHzfSCG4XhhR3cNRGV8AhpSIZhyXwM1JvW3plOxgZLVpIBBJHJ?=
 =?us-ascii?Q?XHF+643M0e4tm4VNmUEHooVOtlzudrMs3EHS8d49eyHcV3iV/BAgx/2K3bC7?=
 =?us-ascii?Q?2pEl3KA7WZZAkUTuKOLYWZAxUGasTfWm8ulgcAxd2al4MDn7gH2Xth67q4Ge?=
 =?us-ascii?Q?9Z4SOw64wKvI+RKs3lNsw/hJp8mY7uc3xB55MrQkQ85PbrBagiML498+T1KA?=
 =?us-ascii?Q?eAeLAvCINUi6gKf1QEAC/djYp5YDoHatqEyyGlmEY7qC2SthH6UYvLn4ZIUd?=
 =?us-ascii?Q?vMUGez5NqaHltVtI1n2vVIVvJ0BS97OFCPGyaALS1FERrRIA4t9LUe5qHtJi?=
 =?us-ascii?Q?o+wQo8UF6AR+MIDQ4IAbJGF5ScZq+mqPd9MX+eRGX21jN2025oY7lJTpmKc9?=
 =?us-ascii?Q?9yh9VJxO1FhxXbSH0fHe97J33tIZLvKNqYd2RDLWkyvvBEwS5KGNi47fY3KL?=
 =?us-ascii?Q?IlBHLYy9DOvmOFc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 21:26:03.6327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8b7307-d6a6-4e81-cd13-08dd2e98b975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8314

Revert back to older VCN 3.x firmware to fix an encode regression.

The following changes since commit 209c18b0e7cd2de304ad11c1042b085429fab1b4:

  amdgpu: update dmcub 0.0.246.0 firmware (2024-12-06 18:53:15 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-01-06

for you to fetch changes up to 8c576df27fbe8280c338cf23a8a03a3e74503647:

  amdgpu: revert VCN 3.1.2 firmware (2025-01-06 16:06:38 -0500)

----------------------------------------------------------------
amdgpu: revert VCN 3.x firmwares

Revert back to internal commit:
97ae5dc916b1b174cc87c1f1502a19d2c044e6e6

The newer firmware can cause encode timeouts
after extended periods of time.

----------------------------------------------------------------
Alex Deucher (5):
      amdgpu: revert dimgrey cavefish VCN firmware
      amdgpu: revert navy flounder VCN firmware
      amdgpu: revert sienna cichlid VCN firmware
      amdgpu: revert yellow carp VCN firmware
      amdgpu: revert VCN 3.1.2 firmware

 amdgpu/dimgrey_cavefish_vcn.bin | Bin 579184 -> 587376 bytes
 amdgpu/navy_flounder_vcn.bin    | Bin 579184 -> 587376 bytes
 amdgpu/sienna_cichlid_vcn.bin   | Bin 579184 -> 587376 bytes
 amdgpu/vcn_3_1_2.bin            | Bin 571440 -> 579376 bytes
 amdgpu/yellow_carp_vcn.bin      | Bin 571440 -> 579504 bytes
 5 files changed, 0 insertions(+), 0 deletions(-)
