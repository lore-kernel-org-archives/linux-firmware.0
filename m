Return-Path: <SRS0=Yz3i=L7=amd.com=Wayne.Lin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60FDC4345F
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Apr 2024 04:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5DE7C3277B; Fri, 26 Apr 2024 04:07:04 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E6F5C113CD;
	Fri, 26 Apr 2024 04:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E6F5C113CD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgaNcR4otpKc8/QwzwX6Rsv4FuidwHZP9tT99TJEXKZgyLW0OSAXJIoA040TNpLIH0Ea8oRui9NbZ0QZa4K20XrsajWZaF/ZPkUQ2VgUFxIsJ/GCtvawQB91tAeFlVlbsMu2HcwhohvFADUNWAsDzXf+Hv9k8qG8f1BAUO8vujuD+pNs8w2alVPd6TaLKQaQS7fwuiRyFNNd5uMMVEgP83888z1N0h7WbnL8NOlPdEA7WxfG2vyZ6EldSxRAH6UdvDShtqufjhLNy5HcbUamOcp5lCAZpI65aYDb48BiDhUVdPZSeBOS9FLcCybShxXjpcO5ly2hTnaKcou/pXhCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hr+vBg8VNwyFHsZ6BJWimW4LA+L7yGfqJIgoLcnCLjU=;
 b=kuLFrjkN645QD/FnpPh4cKMq9c0vUgYU5NZFpLfVEekFj0RGjJeBaVW0Wew+3+QqPQVMyRaKx+OzRdpsnDu3mz02MyGwKG6Z0fVQ7S2re0QJ7i1Dm+Q1R9ifGCgUxSR3ps3wFATkCn4RjbZY6N7hMO9NRWAp6afhMNO3D2dAOF3qLC+79jxe5BlrmxXzWOdIKKEkFodoBF3i/n1fE+EmJLrZ7H9hkhZ03jGIgH1erNytAj0u9yIKO1VBaYekgVkFS1WsfVTIN2KIPmSV2rlcxpXL34i63cl+MH7EFAWi/CSHS3loD/zosmhPKE9KxMebzcME8KMtVExhzYsRm/ydsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hr+vBg8VNwyFHsZ6BJWimW4LA+L7yGfqJIgoLcnCLjU=;
 b=MO59QDgtVmJUb9YL65sgyjk/UFPgs8WsCsQzAfBCyxZyTFEV1zvAwmw/E2kbEAFkqmNf1xWHoaK6A4uHU33WJ8fy/C/eNGhNSWnla9oKRoZ1hQs21KAlZxp33mj7rX82UmO9BDWXkVaJqRBtkrb3057lAyvXaxJrEia1Y1G8wPg=
Received: from BYAPR06CA0031.namprd06.prod.outlook.com (2603:10b6:a03:d4::44)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.46; Fri, 26 Apr
 2024 04:07:01 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::3a) by BYAPR06CA0031.outlook.office365.com
 (2603:10b6:a03:d4::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.27 via Frontend
 Transport; Fri, 26 Apr 2024 04:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 04:07:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 23:06:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 23:06:59 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 23:06:57 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.215.0
Date: Fri, 26 Apr 2024 12:06:56 +0800
Message-ID: <20240426040656.4111527-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|PH7PR12MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 028f30e9-51a4-4a27-104e-08dc65a652c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZL0Z3earyX9SsU3KQlE0iGlLdsmP+a8WdpQq29YeS2b3MCQT+WoobrbQomH?=
 =?us-ascii?Q?DUihS1aErZjIqbbj59FVrv8rvXDKBJaoLJ6TLfyKUR7k+kFuqJmW9I6qj1V8?=
 =?us-ascii?Q?jpjf2iZ8UncKzOeZwfYMz6T41ldrloBQwMsVfHdQSH3Z10v9lG6VM+s0s/26?=
 =?us-ascii?Q?IxKgbNIuKm8zqvLyAm/21QevuWX6rdNOV4a0+loYEatWu5bIPCPNJhKZThNp?=
 =?us-ascii?Q?yPdqTWBQ+ODLLfTe4+rKeeY6CuoRnO1DTVLSUHd/dencETgKsh7cZ3+tvu+4?=
 =?us-ascii?Q?3T5vfzplUAPLbIEwYIEGTzzzIjYeEX4ngEiOg4nFohMaNiZ2B83AgsezGoSi?=
 =?us-ascii?Q?CfCywGjq670Cyh//rLwfNRMCDFfkvFKS+YrtIfD4Cn7X64zqpACI1XsH7QqA?=
 =?us-ascii?Q?NZ839J7NIrQv4sEf9JLx/2CoWF8h3GOTCfBtexJbH4ewpJSQpCxIxbIcfkaX?=
 =?us-ascii?Q?rzL5cKlxhOYlrIxdMSRcY4xsQICdcFjhGYymfad5SXU1qmchornHsRbtiNl6?=
 =?us-ascii?Q?z5awJVyTJEIrxi/3il7Q6MWd6xzg3LE1tfCCBoi8jUrkNx5AEeGSPkbJAiXm?=
 =?us-ascii?Q?+eBSFqkPYy9uF7aMnJ0W6ExIV0O+/OFhAUEC5IkOS0QzKkWL4L6ZlzUFxdi4?=
 =?us-ascii?Q?LzQowQV5pwoRUBAKCqJPwb/khYvIEGqvawElDOlL5Iuyxwfw9s92lZtZUsYS?=
 =?us-ascii?Q?lc9plCUmSzfNzpjdvpcW87wpvbyUmemfZUY31v91EgZjie+y1mAP/qbqsBYh?=
 =?us-ascii?Q?PreP7oOj9owKjVjFMdCuq+r1MpLL2NK63aLo1EHVy9BrfG3CrX5u821zoL76?=
 =?us-ascii?Q?mhKByE8hwx1MMgPQEbA7g10F7wGQhK5lYCel3RWRlByPepILH+y0IbKOYIhq?=
 =?us-ascii?Q?9ZAcrBq/QB+HmKuiHhcL0DCtUlT5NV9+gWoFm+WvseXT5bXukx2L060iRaYc?=
 =?us-ascii?Q?0xPL7reCoykc76TwgjEkApcFkVVDxqptOKgtSo9cIQ3RRveogWQgSHStfELC?=
 =?us-ascii?Q?J7GbGtUVZ3GrirlesbDoqkEWkRLaf9fyFB5DM+8fmIinWIFzoLSnRK4RSh5m?=
 =?us-ascii?Q?xU/QH2OJUDKJw6CRKApU9kNZKN261WYnttZYgGAPhUVArKBLbavVi2/IC+V7?=
 =?us-ascii?Q?8qH5Hi49wbom3Ahc9zPqhVGtbB0bJ34MPokyXMQAUE7MXwKH6bFoY10Ylsya?=
 =?us-ascii?Q?1lOMj/DU1buKjwT7IHk5UJNN5BjFpYrVa5oNlomTpUMMx+EbJq2ZO8hvBG5k?=
 =?us-ascii?Q?0iCYeVaQciky3hmj30bqiIgRs/2/KN1lV4PH+KsSKJNM1flLafAa2Ao4GJmK?=
 =?us-ascii?Q?NHlrxIBY5aMdNq+WYiL68/vZrl22zJxr7VGAXMBun9Ke3uCMlFDNUr/yvf3U?=
 =?us-ascii?Q?AMaG8bycXiOw0OPFp+mrnmd2951I?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 04:07:00.5409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 028f30e9-51a4-4a27-104e-08dc65a652c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-04-26 11:48:14 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-04-26

for you to fetch changes up to 7945da5ee5d06132283c9f2f15312975d9559b9a:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-04-26 11:48:14 +0800)

----------------------------------------------------------------
