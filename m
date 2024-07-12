Return-Path: <SRS0=2xz+=OM=amd.com=Jerry.Zuo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66289C2BD09
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Jul 2024 19:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24526C4AF0B; Fri, 12 Jul 2024 19:00:52 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0067C32782;
	Fri, 12 Jul 2024 19:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0067C32782
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIxWJ+4HSJXgHqf6eLA9lNx98qZmyyvdpVhOilkdpY0BhV7QQut2TRHkPHkdyrAm1z+38RQirP5lD6oZ5Q/s6t2hOTnb+F6/ewheSs6V6Ebg7QsXsGPr49HJkw3l5/F09viQC3QE0m1INfaK9wzQPYMggn9GC/jlkiOlEz86ENmO+nItfftoJCV+LPOOy4hb6bZHpcQ308HqlehFyURkHnsTx1ccZn1XFJgBuf34jArpP7lEXKqUfLDJxdDWJl76WK5lXT4h9s3rdwhiOgUCAex1PhqyCBkG+l/K1YQi+Ik0FssG1iExwXk87abUJ1JUgc7XZmp+IzpFcAjHLyi5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly5btKHpfWgI5dkFGACK5teDBLU1lal9rdJFR7hwGBQ=;
 b=oTqokxyNab205AwjMRneo8zzlb5kDeOMHFM1satBODV7LD9C0cbZ91zznihDMw1SoXQkBcR0LasTpVfaAgec+xwG7yay+l2giqKeR2ba5AOnGUITfd0Lx56UCxO85db3HVjJq/WXMeNoiX6Sa5As2XmIMWYEfhCZsFwBTE4zgZ3TVrknDYTt/tXLE1di/OeplZnRME7D5ZmUzGbkUrG1rLR6/c+kTs7x4EtzkVzvpBunPK86sT7GG8EQ9hsfSzMzoAkn9iI3XRyeP22qKRz/a8CSpnD3P6XR0nVDiy+Fq0RrMoPoqGXuvdkiNi5jT9oZKrhURaaOr02MIUkWuN93+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ly5btKHpfWgI5dkFGACK5teDBLU1lal9rdJFR7hwGBQ=;
 b=KsWHlPGUo3lrxZcQ0XDQ3wj89j9tr//YsfmCSq3CDpfNYF8u3QrVYAQFB5X+F+xXgaY+p9ujPxg63YTxx+8qB6UmbJHOPUGzcdkfLLYzHaicj3R7FzWEL7EZdZpF+1ZMql5johZlVJd7vwqVyjmKsTy+9AzXaLzp49Xg1UR91aw=
Received: from DS7PR07CA0013.namprd07.prod.outlook.com (2603:10b6:5:3af::19)
 by DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 19:00:48 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::43) by DS7PR07CA0013.outlook.office365.com
 (2603:10b6:5:3af::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23 via Frontend
 Transport; Fri, 12 Jul 2024 19:00:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Fri, 12 Jul 2024 19:00:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 14:00:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 12 Jul
 2024 14:00:45 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 12 Jul 2024 14:00:45 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to vv0.0.225.0\n
Date: Fri, 12 Jul 2024 15:00:39 -0400
Message-ID: <20240712190039.200992-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DM6PR12MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: 8169aed4-5654-46f9-16ad-08dca2a4f100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3JKuOtXEv6jzvDGvSEMkgj1PYYiaCvmo94YeGClng5szxZzaZOIZxyq1laZ5?=
 =?us-ascii?Q?FC3CcSNPVNP+Zrkbk/NTV55B8xkyx14acvWd350vwaXUtJ/UQOXJ2mcYCgY+?=
 =?us-ascii?Q?l7w0cHr2hMj19IJ7IznKQSwZXZ5nM53zLTYuhV2FQl3zunZn9lcZ0oDTMJJ2?=
 =?us-ascii?Q?0Bsq6NV7FpFGOj+EL9OVwNh/LVi6c2bMaQM3Pmvzc5rrbQSvF+j5sCKoPpmt?=
 =?us-ascii?Q?1+l0h+WkYn92QBzmxcPK13gsVbqUy5Rp7jDuHxAEKhhAe4M3xVfPaY+EFcX5?=
 =?us-ascii?Q?IwhOkPyO41lAtbV66bqlHmWUbAtVrF+VxICK0D6u5NH67y+5/6bZqf/2XQ7i?=
 =?us-ascii?Q?OBHqBFJTBgg3zockCzFlucTCRuu1UGfxO9BCyYvaawsykw+vL2v9S935YOzR?=
 =?us-ascii?Q?xZAwhZUvu6OZ1mxfTQUggfqs/R3yI+2cOWYzmDFrcKVC0WEssHCtfgBwPkxO?=
 =?us-ascii?Q?TSGtlGnKHKdln11tlFcsn4eKiWIdFrL7Ip/1egRmjwsGO99sO/V3gyJclOQp?=
 =?us-ascii?Q?OShCkTlxxBwESQRpp2eGSKTnjGMdhP+rEFGZS4GqpWELBmUx7PxbKwVKqfBM?=
 =?us-ascii?Q?Q0GgkXjQ+KRmbFtU2hGc9HMn7TxXGjWjWLxM1FCgtOqgOVhP8dsPR3W11PZz?=
 =?us-ascii?Q?NACs8X2xGane+mnoRiXyRsDWKybf3qlLALMg0EIa71CqX9sYJTl5bLl/xFBc?=
 =?us-ascii?Q?ogOJ+lFDC861ydj13oxMiuHNRLJ77CZnukDye1KKIDidRShNC0SlEtfqUj/U?=
 =?us-ascii?Q?/VaR8GsFkEl81BbqklFqNtX7CjDiPVgxk2m9cw5JXlw2NYyfQJclSKsRvAYM?=
 =?us-ascii?Q?Pn7K2C3XzG257QpHxaQr4k7vblQs2S6uFcYjLs0LW4K/LUNy2VybuSPLiaOT?=
 =?us-ascii?Q?q4v68OAjcdZcZ2AjaVCk88OK9BalX5S2LzlfX5ndsBil55k2Rq4yjJxphmVI?=
 =?us-ascii?Q?HnA5diqi8iJHK5U8ONYxHCNrh4Ra4U1CM7rUoX/7lZIeNfg7bwPbPEnO01KH?=
 =?us-ascii?Q?Tgbto3R1ccxJSQhwxWoWfzj5dVT46mY3pW4wJ6ClsXayCz6IhjjJOPb1/WKE?=
 =?us-ascii?Q?6dX4dmgI2hau5/0VtqZdsicz3VvDBRKZ5IEyHkm95eJVHvvD+k9i6xphgzHa?=
 =?us-ascii?Q?9QvIhAuMV0PWKFnY/C1C7FipAaCA5HgaEsFUrH8tOucJ8360nNADsHd7T1wn?=
 =?us-ascii?Q?6SRALXKqwd7jrlNK4AqZgWzdrdwmi9eeRCKFX4Wi8OXc7QdcAlqkMrK0SwQ3?=
 =?us-ascii?Q?2E1zpUS3qY/cWMM4q0HcBE0yMhiKE1XFy4k1UxU85fA2rOkU1q12GQrNS3Ll?=
 =?us-ascii?Q?OtgRAjkVH5gzK/1OmqV5Bn6ytVQ1iKT8aQNPiPgswi1o8/TU/n7WC4ozoZsP?=
 =?us-ascii?Q?XUoX9Bf4kckFfGDhBjk+aHYQ2bOMqh9sqBCAPSzQc53uIyAd5UX7SwtWMznk?=
 =?us-ascii?Q?7Xx4UryLfj+InDYanVJO08/xpy2QEyrn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 19:00:47.8606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8169aed4-5654-46f9-16ad-08dca2a4f100
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316

  amdgpu: update DMCUB to v0.0.225.0 for Various AMDGPU Asics (2024-07-12 14:35:30 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-07-12

for you to fetch changes up to 96447dfe5542b8576c32ddab07e8cf604f4d0903:

  amdgpu: update DMCUB to v0.0.225.0 for Various AMDGPU Asics (2024-07-12 14:35:30 -0400)

----------------------------------------------------------------
