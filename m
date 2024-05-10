Return-Path: <SRS0=QlO3=MN=amd.com=Alex.Hung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26824C25B10
	for <linux-firmware@archiver.kernel.org>; Fri, 10 May 2024 17:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0594C2BBFC; Fri, 10 May 2024 17:37:21 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E86E9C113CC;
	Fri, 10 May 2024 17:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E86E9C113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nogM997iX1a/UGYDHkVg7ciI+XZv/ztZf8d4964/bq6bKR1wIPhSjWspavBXnNffeSNPdSNRB5m56uSFyTBwZs+8NZ5tWjMAGDzH+k10gR2cIUble0bzTCEbZzIlFewTPAyZjl0h3GrrHdGwZeDYy53OE00gVSQVbeQdgm7sR5BfOcd+rjsLbtdLJuJWsBRXrlJG+kAnbruP2WvS6NP18XIHbgjRWrXSbu7FymkY3moHKOkDIa2YfGN6UyjYU6XhV5/DWPfVkokJn6OMW2b27m6SYNJl/zTK201WHFs/CzbIig5UX0cj/g7mFd+lhXuZ8Ww+odzE8RRwgjXwO31RBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obefsxOHyjgi/JyZ+IbSr3AR9Otp7e6TBIHqcUE9AFQ=;
 b=FrSfXa73sVBgxjjXDP7zvpYTgeMcVeZk1CAwp8hmSGJ+AKG2JdUDAxt9GtNWZ9R1cVBfN/+I7+rMmMak2cUqyNBJGE5YKS2Urh7Ns4xQT2fJnmI00PyPQuH9HyZJgc4xGodlorIWxujZN8NiEVV4qYxQmYAkUxaUqsx7/g0tN9ovjcagWxNjncgCRfEqzEEa34Kc4XoTi3dKTQEgmra8Qv6ZFN4u0M0ja7hDAUX7v+313N071ORS936XIr9kxgKaPpbSdcg5YaY8pQEw/RXgutSGuiu8Gisy5lmJZ9R3yuACYwFY2tD+0MDHd83WKiGlscLGXo3pCmJLpeggaOn8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obefsxOHyjgi/JyZ+IbSr3AR9Otp7e6TBIHqcUE9AFQ=;
 b=WmgW3aNxfiLDg0kqLpcCO49d3CTX0BXI47M96gFVY6vGBoHQ+K6kzs5pSKWvO1ImxJdJ+9G+qs96hbSECfF1G6BEbEB58Wgu2pZnxN6nq5s0KdWB2Ei+iZtM8XFMLLc05aH2ofdkP9bsIftDbqL3Ew+7ARUwusHFbEa5k1Jh99A=
Received: from DM6PR04CA0009.namprd04.prod.outlook.com (2603:10b6:5:334::14)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Fri, 10 May
 2024 17:37:18 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::b9) by DM6PR04CA0009.outlook.office365.com
 (2603:10b6:5:334::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Fri, 10 May 2024 17:37:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 17:37:17 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 12:37:15 -0500
From: Alex Hung <alex.hung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.217.0\n
Date: Fri, 10 May 2024 11:37:05 -0600
Message-ID: <20240510173705.1276833-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: 584cb094-2ce5-4ac1-7d7a-08dc7117d6c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zmgMzOQzd9JCwCfzlXubcMgKPEa2oBzDisoacdN+mFD69AWixCXos/KgF7pk?=
 =?us-ascii?Q?sAbO1Owy5FGKr6CKuHEC8DxQ43JI6Hu2cNV42zGyotMq86ke1pBq/ydrbg3N?=
 =?us-ascii?Q?zXMZP6dr31P47c1LNQzJjt7xYsKWKvJjZ9gbDE4IxbwGXNQ1F4WeQQFSaTKM?=
 =?us-ascii?Q?EoZjErxmKgvLA7V/tDxurG7ksQmPhlIcxI1GBBlazIhPUZbQvmgsZD4RZDBP?=
 =?us-ascii?Q?M+u5f/U94GcrNoFkCuqQd9+e5pF+9M/yKSmGaxYwCxAvO0sHt/XTokANfMln?=
 =?us-ascii?Q?9+AIkqPd0iBGhn74iNXaAAQrZwZAfSJjjDvDRqdIZbZRq/xLDUicJg+G/oUF?=
 =?us-ascii?Q?vDkPcM8F30bfsSubnDhcJbtM8zfwDEGbCoZPue7I9VY5+bSltHhOCKunZThL?=
 =?us-ascii?Q?XDrMAKkNTCmGvdkvvSlZbLIjgarZLLBBLKbaUoe4k7oDOtsx2fwsfLnM0jVp?=
 =?us-ascii?Q?dqcMv/pW2ZRGz6CbjDRL5XZpbAikCDqQ8VBiBNoL3Hds2aNiMVsKcEh+bAw6?=
 =?us-ascii?Q?aXREaqOVta+EaaDSJrFY+YTyWx/f3w8PsWX5ZzrRBlVbdXLyzH2dnOQAOKnw?=
 =?us-ascii?Q?54j+YBEh610mflZsql8VdwSCqfgLYbx5ijTMLzCqb+M5dIJBEEdW/NFz9v3m?=
 =?us-ascii?Q?XWGow4aZxenVpLb4yBugv0S0dlRwIcVHa2dxS3jsky6Tg+hZalpANgOoCZqS?=
 =?us-ascii?Q?nXCdGSC9RDNwnLo53/S7bXRNDKLfUuBOXnIT6gtaK6IGR7SabM7wnrHcTh0P?=
 =?us-ascii?Q?GJUIUxsPtIGGFJet69W+OT4hn0Jeyje+qn97Go7TbssxhLlVkXdPYkTFGFce?=
 =?us-ascii?Q?A/uDwlswJLdy4nNpoQM1pkgn6k7REAVUiAlXzBELLli+zpdFS/riTwAjolJj?=
 =?us-ascii?Q?+5jw3em7JZRmlfvR5jBF03rt1gRttwS+f540gYsfWGdKz9niFLf/qHNfr5Ot?=
 =?us-ascii?Q?58S1M9lVvfOWepwHOS7L9WxqggaLGbjUrexbDXfzcZtrBSgrth4onlTxXwA6?=
 =?us-ascii?Q?jn/qWMvEBm1oDVpVAOP6qU34fcSlt/0mUPXX2JvNaFPSTx8O65wLyvjcUtsf?=
 =?us-ascii?Q?h4mlJ71ZsICyN4/NNwXc0/OXk/rYqF7Fj+znXMLiINcJPO4fz6Fv1S6UtD7l?=
 =?us-ascii?Q?qEkyRe7kF6/6O7rVLpTCClrIESk7Q3K2d29Ab+gpCW+P27+/gTL457h15qDA?=
 =?us-ascii?Q?yfX2jwWdRSyYgRF2GL+3jFHRv6kBObkawdCo1dMI4Wk67V1Wbt9eKCb3V8gj?=
 =?us-ascii?Q?XlhA+UMr7EA8HikAbuTY6R2bL2U2D+ebu/SC9S2WvYqgXTr74ZPd5mNROZC7?=
 =?us-ascii?Q?OSWutUoAYqHZxvAgbdBDG51Kgn68Q1WUeLFOQ0kN12kLV5VjxM3fxwfSWCbe?=
 =?us-ascii?Q?7MIn0fVKHmnAGesuqphGb7GSa9IT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 17:37:17.6886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 584cb094-2ce5-4ac1-7d7a-08dc7117d6c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-10 11:12:05 -0600)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-05-10

for you to fetch changes up to 1aa355aabd61cfe904fb01878b29f6f8957dca24:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-10 11:12:05 -0600)

----------------------------------------------------------------
