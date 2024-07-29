Return-Path: <SRS0=vq5B=O5=amd.com=Pratap.Nirujogi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6100C3DA61
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jul 2024 15:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8865CC32786; Mon, 29 Jul 2024 15:30:48 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B27EC4AF0A;
	Mon, 29 Jul 2024 15:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B27EC4AF0A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncsyAoLEHN2yrLSsxAtmzK018bSS/P3l99AlZTCF5t8zO6wW6VmZeqsyKyMwmD7n6gqZvEY/Ap08XApXf4h7oAhC71ceu7dhHhtJBvn8rsBJ+20w2Yc0Heihwgp8LZU0gqPCNheLpWEDCnH0Pqa6h61wIrQPBHHx6+B0OZZxfDyroHKSFqlOdFHSzzwqbLdtFjqVhIhL2At4QsqcTreoPNO6hgx5eBmnHFCMZ08XYOLie0LneTYaEkDroq9ExmhMzsZoeNAjlYVv4XZCidHu9jqA9eLgNDUrbZSpYUDdTQC868TCfBanSrg09C4TLb21e5M5/ISmzLZFf19HC4WnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W2MZ9JkGtz+WfMr9kh3apBefpIWW3FmqO9e0szmQzM=;
 b=W06F8ihB4iYps7+TXur2zPRNGYmAxxQFPHgHmCPRDLEqSfVBkDrgps++XEukRVpNQQwkGKxxExFfPkz9di0Dx9GmMRs+KdOn4AihWDkHpubzuKLry8v7fTBTeqI8z3X82QM6ORZrCxfUoMZ6/7RvjsGjIcdvnOAM9ynCVMh3AOGvt3lOHGZjrAJdKNJ4sUUy1/MEVRnXfRO5zF7SRvFD4sip6g0ZiWxpxCCKbiocV6ueSx2P/UH9Y4/bq4OuFzuGUvWTBqNzeiZRmry7tWRVZ5hORjDysM6F9IDbrP781rx+gGKn4cnKnWMJPgjlUNCQUTDb+BTjmndefevqPmqfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W2MZ9JkGtz+WfMr9kh3apBefpIWW3FmqO9e0szmQzM=;
 b=xVwyQMgdqt4pHCVr60YxgyXTmoodpfeRF1qzWbsoiLXs/xPLe+cY+cRrjtfohGFSxMSiGSYc/Ze6XngnOWMEgmHwMpzob8QbN1sP3xm/zOGe0hibJK7T3LZSQJ8dimqoGkK600YeRiBxAwxLIHIjya0/nZ5JhhQKjWcxGICsmnM=
Received: from BN1PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:e1::22)
 by SA3PR12MB9105.namprd12.prod.outlook.com (2603:10b6:806:382::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 15:30:42 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::3b) by BN1PR12CA0017.outlook.office365.com
 (2603:10b6:408:e1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 15:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 15:30:42 +0000
Received: from pnirujog-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Jul
 2024 10:30:41 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, "Benjamin
 Chan" <benjamin.chan@amd.com>, King Li <king.li@amd.com>, Rodrigo Siqueira
	<rodrigo.siqueira@amd.com>
Subject: pull request v1: amdgpu: Update ISP FW for isp v4.1.1
Date: Mon, 29 Jul 2024 11:30:29 -0400
Message-ID: <20240729153029.152836-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|SA3PR12MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: f48c0076-0a50-4f0a-6c03-08dcafe368ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vThx249OiVCrQR891P/TUe9YCO2yClPDeAl4jrwPIzKW8GDuUDsJkdSNynfS?=
 =?us-ascii?Q?RN8bvFsSoPUECFiUrF0vm7bi4jNj8aUMfzbdYdoHbNbsZejZQL+DteeCRPxm?=
 =?us-ascii?Q?+N2Z5QjuSeX5iE54Lu4zJjUtuXG0qV2e6iWNoltg7KlMpxsAiV2uXrL5CzNm?=
 =?us-ascii?Q?ZBzmvzG8OH/JrWs/rAP9/lldJoTjoaiY3cPvG1EVOkPHADlW3QUnNmADSz9t?=
 =?us-ascii?Q?DZM3DBJBhmgvgXy6mwTQhpQnxjEecjuo4/irY2mAnGqVWMvX06xl98y7+x7R?=
 =?us-ascii?Q?jmCKvX0VR2xzxd8zY+63wgJgOl23SEAGSG8W8f0qO46qKru/bIi82UwjasL4?=
 =?us-ascii?Q?2p9lbSBnLSfj5tGlu1oi+k0H10xmyct9qmv8m2VOeRzgOoyK4iR/SDFipKVF?=
 =?us-ascii?Q?nyAfxdbTwOTncJW4WtIp3l7j2phSldfkYOxhyep0kkprB9N78ecSNh0TCIDc?=
 =?us-ascii?Q?E8ntCahWfK0c0RbuxARRiQK64x5uD3g+Aux92jh9El30tWaqB0XHpYkhGLPo?=
 =?us-ascii?Q?saWzy62CmL6+jcLTY3CFHyQ0M+xBBlIPRs2FXYAhe1Z8j3qtTNLQS9JS3746?=
 =?us-ascii?Q?lyHE6PoaJDqLdQelr/nJV/Evc3AHzcsmXZLwvwcsR1YQ1gYcNPOYg+wG0p/f?=
 =?us-ascii?Q?5PBZ/5im1+pow3l1c+pBBERP5Ino0PRqRvf1zUxLq2VdAUgTG/q8GaAxtD+h?=
 =?us-ascii?Q?W2VeXwywNLM4ygPJiLnvKeAsw/Vsop0P+/H5MAjy/oQyV8mnXnRAuiJhFx5Y?=
 =?us-ascii?Q?i1lpN7vYpYR2+RegmlmvGCUWo1juggDwUd+104hcqlwqEJoZjv0YYeiNbcSz?=
 =?us-ascii?Q?wK3gB6GC+V17p+kYnQDt46XvN4sd8wQ8XwdtZznVgKWoCIigrIFVngZNnt05?=
 =?us-ascii?Q?p/fo56XytnRBOf3nZrWLUk4w0dYQ+D5vfu+JxnU/NfBLxIITfXj4OVddoqvq?=
 =?us-ascii?Q?A5V9bHubgSP7vFUT1IE5ygywsUfd7Bb+yFUQ0Q/bslxJKXpyvjBS88xXlyK7?=
 =?us-ascii?Q?y1rEpBo7Z+D76R9QZgHkPZ7uiC6YnVJiP3KV3HtmZaL/H3OJ5FzAJvky2loR?=
 =?us-ascii?Q?idcym959nqr9qCm+Ogoqyeqd4k4oNvaUxKzxZiob1AmGSrKzgdlA7tOECT92?=
 =?us-ascii?Q?QDwxyuP1+Do7ymlsUUNwaOtgPPcpo31H6qmwRNna7xSwjpVCttx9a5gWJRfk?=
 =?us-ascii?Q?6c8Eet2JPSLLhLK0/a7ZFd40NqLrZgmqhHuHwb1IbndhrdUyNEwViwXJbbbc?=
 =?us-ascii?Q?Bffof9lZYbdgx/p5eMSMh2fn5yrE0tW95e4Jr/NTsQ2vIaU4XKF/jRKs/mmD?=
 =?us-ascii?Q?tXWHZ1FeMQ3PbsUB7B8McRssfKR6r1LvElptMlXzcmegwuCrPMo4tYlZSe7k?=
 =?us-ascii?Q?2aL0d2kZhj135m/ky8FDoDsLIoCbuH8CXMenepcdLl3fgRQ0BMDLeLT1qpdt?=
 =?us-ascii?Q?Bn3taWuLHx3qghZ81JuRDugyDB0V3bog?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 15:30:42.7619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f48c0076-0a50-4f0a-6c03-08dcafe368ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9105

  amdgpu: Update ISP FW for isp v4.1.1 (2024-07-29 11:15:54 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git amd-isp-staging

for you to fetch changes up to 2416810743f9ab114a838b6245f32689c3a327b9:

  amdgpu: Update ISP FW for isp v4.1.1 (2024-07-29 11:15:54 -0400)

----------------------------------------------------------------
