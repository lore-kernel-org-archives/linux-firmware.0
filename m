Return-Path: <SRS0=Ey05=6B=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D15D0EE04
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 16:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70C18C19421; Tue, 25 Nov 2025 16:33:43 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77CE9C4CEF1
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 16:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77CE9C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V98QUP2JVogcK0zFgyYUeLbu9ggEQ7ORUR3zCOOZU0kAI7CDpQKXvjpJZAttYxC0JmGlUjwHNJe07Ejbeg4PWO74ffMl5n6RCNUuFltJ1YnIewG9KicOqL7+Yw1iSBCWCUpPxGxSWYihPiCz2VAVYnjMbtj2KXBex6YNTgDepKaeBaWK8pFE+4EQ/X4zyM5nbPaPEtJDGpBu5ZK6FdfqJkwrROqMH78tyi3bumEIQHwJJuVoPtALBm2seH4FKfg2weAWgTVNMnDZwB4jpciJCkgqTXfDkSJflHC0j/7tcylWotyUj4RFm1IYMu4bxc5Q2FMI1e5X/w5gnRxpPvlDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvEEPIQhR5OOSoj+bAW/xdUy6lCfo5gBzwcrVS8tENI=;
 b=Roj8Ws3dsA+hvEHNYqAN88EiLtBDkhHGrwpsInDahpM6tHOya6FdNx1I+65OyicoSQLt+ou7RAzaybY9suyZWO3cFbyZaNlzCB+EMwhhBwFDKcB6JnW2lHXfGu+9a180pBf2hAPzg2ZYVjg7HB3FItQ1lwBCQLS5Gc6wuRQIaBOJf9nHvuVawRlc7pdJOQOBy6sA1iLsLQGiXgnOwya6/2Vbilt1pRt8J6PhKkTVwqB9Dus7dRaaFJtWN7l1yVn8jjLAthNp5FQs1ScgA43kAYjofWVgP6nB6gbPRaRHjd++XOXRqFj1k96Zj/K7rgm7bnyJwjvDChmeQhvqkxf42w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvEEPIQhR5OOSoj+bAW/xdUy6lCfo5gBzwcrVS8tENI=;
 b=my8RiLx2OEErs3letHfWM9GdtgGnORehwxnuM8sFg+6Pw8Hf0Dg5vrcJyEER8hEIotoVrL1QHjX+9wCEqSfzbvRvSxetkfPV18tUu62/BnO7103SBhtetrCt8I2mpeny44km22ysUpAoU6w56v72VViH4T16pDjgShzMyypqb58=
Received: from DM6PR10CA0005.namprd10.prod.outlook.com (2603:10b6:5:60::18) by
 CH2PR12MB4184.namprd12.prod.outlook.com (2603:10b6:610:a7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.18; Tue, 25 Nov 2025 16:33:40 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::8) by DM6PR10CA0005.outlook.office365.com
 (2603:10b6:5:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Tue,
 25 Nov 2025 16:33:40 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 16:33:38 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 25 Nov
 2025 10:33:37 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware update
Date: Tue, 25 Nov 2025 11:33:11 -0500
Message-ID: <20251125163311.2087275-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CH2PR12MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc7d5de-0967-4c9f-d813-08de2c406352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dVivRDdf8PPIX1aHH8FE7E+rloBMN4PGHR0Zl6TbDlWMze0t2TIUuYGrgGf5?=
 =?us-ascii?Q?XtZGLc7QrCwg8jhJvF7bnEy11zRU7PlmTh7c/toe4prWrLZ01fAVPSsCOXjg?=
 =?us-ascii?Q?sPYBkl9Ziz84BvoK8Zep3KIVNZgjLpk/vKPQbeb6jcpN4cjh+03hqhQFDavW?=
 =?us-ascii?Q?xIH7wo6hG4ulXqvANFkfiz/gz59aGT9L/AJLMMvhUB8TLRZg0BK7kLG5zY8Y?=
 =?us-ascii?Q?4cV3Gjl8u0XweiX6XuKtZ7/flPggU8zzVW04eAoZJphuXEVFqONQp+/qRH9f?=
 =?us-ascii?Q?hyh1pI1ssLZ/8I7WQOYgrPRYvEGKg5n41DaDyCoPFbOEU1IiYi2gCSZFVKAm?=
 =?us-ascii?Q?UdzkT6JBawghYbWcOZfx6HElHpK9yopEljpZsj8RKrCwfk5XVcvHPMcIdVPK?=
 =?us-ascii?Q?/NNCMw2JyflxSxAka1n5te0yrpRnsuwngpCN09PzQf4qpwwej26PiCmtcQLA?=
 =?us-ascii?Q?+c4xf7cxWlSKvxsOrBLz96ifv6V1C0wOfQSLic7qu2xbz6mUnWZ2MjX4KH40?=
 =?us-ascii?Q?5AscwBlfclE6zYBnRUTq+nYViQX5MV5DR0p92pBjhcX+QZDGV3YZpH8V9SoB?=
 =?us-ascii?Q?jr0XgzymMobZ/MBQmQFQ9GsFNcvNCAv/QO1UP7fBy67II8w7Xpr3cWhRppRK?=
 =?us-ascii?Q?wmoTOH/ft05ECUgvy4AKQPdf+dNibMNJ9hWSJaWzyEezO+ul0fx4JmGXqRFV?=
 =?us-ascii?Q?U/UKQMxsbdTIpn4oUmDem2ibfw15HLCH8oTXfqAgS0wQFnG476N9eKq4/WjX?=
 =?us-ascii?Q?MFMJE9tn8yZmYakrwWvO2b+PasTxUc6O8nDwecIYOFmZFTx5j1UGZRFTaoH7?=
 =?us-ascii?Q?QjysZd7663mjCKXV8CMS5QqS2v8w/A2uvvXtyD9niiKfIX5YSHibVLrZX++H?=
 =?us-ascii?Q?zvFXk0OA/pJqWT4g8C/AeQDJcujdSJNkqpRw9OX25Ego4EWWEmpbyyOEBOpp?=
 =?us-ascii?Q?U6yDXabp68eQJhmv95DQwdxaBo2TzdpmvlY7zjL/rZm62oAzzsk6OqZrnV/B?=
 =?us-ascii?Q?mq9hAXd9lWwIXM2oyU/qnX4UPf2/wW17XV2Zsg2qcC+YTuzOefN6lRIfLGgO?=
 =?us-ascii?Q?i+rw+egKz29xq1TIwuR5HRad3SZrBkYntTHIQApDpqyMrrk7IMlhGaSD16is?=
 =?us-ascii?Q?/LiMjsBRtJILAfn0noAmhUQlcQUu7LCUYMWZWhd+0ZriHXQMoqGOIBUuL2fi?=
 =?us-ascii?Q?krzO09MmRzwboufUxNao35mQqXFx7vdJ8Lwmpga/AfAPi+friXkrOX+NEi3z?=
 =?us-ascii?Q?srMufWMkcdEp1cJsu0PxUldSzmmOdrTqBLyaIoiGkSXJdjfS/6Sux8gYcWW6?=
 =?us-ascii?Q?hVXHyD8tcKvjWNWcwqxT7G7nS00g9GL30C6a7lm4A3oX3M7U38zUuPU8JE1D?=
 =?us-ascii?Q?CUdJdvfvgtvMPqnifBq2tHviMRj3/3/YID1ia6hWTEzaDMowtnvCoZDmUs3g?=
 =?us-ascii?Q?iNyWXaGTqEl7vLT2PwJv/XIsJeBUuxV5JHSQkhPWhNl48/w/I5L2woq8xQ0X?=
 =?us-ascii?Q?tva+mXOMdYe38tiEsZ9jdx8OUf7MbNG4yAO+8AuQgQQsuT69i7Gf8NBEvT+F?=
 =?us-ascii?Q?+7S00oyzBpQo/bsCwc0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:33:38.8219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc7d5de-0967-4c9f-d813-08de2c406352
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4184

Hi,

Revert GC 11.0.1 firmware update as it has been reported to cause
GPU page faults with OpenCL applications.

The following changes since commit a193f375146b41b294c07b5e15bc17c27a7320a9:

  amdgpu: DMCUB updates for various ASICs (2025-11-21 20:15:21 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-staging-2025-11-25

for you to fetch changes up to db29fc93958da80c76f45cde179ca1138afd17ff:

  Revert "amdgpu: update GC 11.0.1 firmware" (2025-11-25 11:23:15 -0500)

----------------------------------------------------------------
amd-staging-2025-11-25:

revert GC 11.0.1 firmware update.

----------------------------------------------------------------
Alex Deucher (1):
      Revert "amdgpu: update GC 11.0.1 firmware"

 amdgpu/gc_11_0_1_me.bin    | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin   | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_0_1_mes1.bin  | Bin 232784 -> 232816 bytes
 amdgpu/gc_11_0_1_mes_2.bin | Bin 257376 -> 257312 bytes
 amdgpu/gc_11_0_1_pfp.bin   | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_rlc.bin   | Bin 157040 -> 157040 bytes
 6 files changed, 0 insertions(+), 0 deletions(-)
