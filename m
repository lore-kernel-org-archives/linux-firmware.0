Return-Path: <SRS0=EVh8=OZ=amd.com=Rodrigo.Siqueira@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF40AC3DA70
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Jul 2024 23:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DE48C4AF0B; Thu, 25 Jul 2024 23:16:05 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4ECA8C116B1;
	Thu, 25 Jul 2024 23:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4ECA8C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3Fkpv0YB47zIu6wUmm71LnE4WMpjks4PTmKWPAKZoqppHZGdY67SLKzNNyjfLGGyms45+vDMr6EXUwas3DTO0cAOeI0Ss4WXX3FQSzKPZe1q1cN+ZoqjLLdiqDFC4ZdRbnIkO53KuN7svdagFWlpofTokDyrvro6szL36hb3W1MPDC2M1J0D/d1rOMP7EzSycI8kKMnVVLVF5QiQzekAGoMijHWGMQpz8zgDSbbmNA5xN7iAiPCYUm6RWuqHHexFl/oIQi+U7ppT8VwX/MsGzVkOvlNrtAgUlfeRmbdMdy3svmi14CPTDkaTo9ER7EOW1DR5Adbp0W5Upn5R6fffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M/XzvcNOkwXXPApt0V1exrjM1lscK7bOIm0iAE1elU=;
 b=Jsqr4c7CIWHyy7jeZlFCO+9FTx8TzPDZWOwMmJsM5e+4CA/0TOyP+TqzM9N+n385XM17bbqJX/nYxs09CY0PkKEMv0GdCHYUEgTjeFp5/1T/MvWnR1MzU3macpWmxTg5oLV3RYBcSukIJDkav7AwIQx0K8ZrdgXFHSJR/i2rrtFpadS5FEuWP8UxFq//kKh6ot1yz9h+fbF1jfS/yIvsLApj5RlQlFfGRkURXoKPVGhL6lfsFzjduwV0QlGLumjyozOoL14x8EvdruT3impPkPfAGpzfGpp/KxPaT4UigK/B2uDNXSTmvuMICm8GnqhL+1tAhprbXf0Ni9du5/bvBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+M/XzvcNOkwXXPApt0V1exrjM1lscK7bOIm0iAE1elU=;
 b=00IMMqk0CpR+YNuDaAE8EJLxeuDEglwCBevzJasCwAqH+0EcWJCak33bBxPDvAb+gOk3q5lOKnhF2UW64UzUqOCJUbWXu4kFgnC/zsFvFvvZQfZE5i2rYGPOjSmWcXXFtj6Bm/LiPrqqHwq4psUg73UtyRP5L3xmIRRPbk7pXz8=
Received: from BYAPR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:c0::20)
 by DM4PR12MB6496.namprd12.prod.outlook.com (2603:10b6:8:bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 25 Jul
 2024 23:16:01 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:c0:cafe::49) by BYAPR05CA0007.outlook.office365.com
 (2603:10b6:a03:c0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Thu, 25 Jul 2024 23:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.11 via Frontend Transport; Thu, 25 Jul 2024 23:16:00 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 18:15:58 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, "Harry
 Wentland" <harry.wentland@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.227.0
Date: Thu, 25 Jul 2024 17:15:48 -0600
Message-ID: <20240725231548.145196-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|DM4PR12MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 94569926-07b5-4d12-4e55-08dcacffbf66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DdG7qf1TPSfgELVrKS+x2mdJARHBkoSmgzcgZTcMoRpiskemOYSTy7L49Zpi?=
 =?us-ascii?Q?dh3zP4tB5VYPlQ10l41fvXgknhBlk3sbbxQNCROGXksHgNQzMKIMxsWhww4W?=
 =?us-ascii?Q?tMM9ks9DSeBsmpjJbXoaSJh5Lw27/y4qaQCk1PIpO9Eo8DAUrh1nSVbukBnu?=
 =?us-ascii?Q?sHF0q1sOK+HGggUqmoUOfUOG1eeL2BYgqkBu6w5uu29DnW0/2q6YsKgu7Q1s?=
 =?us-ascii?Q?xHA7whER06/iHfUWdGRbpshV734tDhaA6c5nrtJdjsU+xWIEXvS510ZjsJ9T?=
 =?us-ascii?Q?PONVfxQMmaJmkWfVGMyk2cXTzWl6l4wEXAuWyxuTiuGiT73vUNLkHE80846d?=
 =?us-ascii?Q?Nkg0FO2BRUf9+hJ1yBHcMizpBGFeY02sUQuZ+OTt2RpGDlbfYOyg+PaWcOfo?=
 =?us-ascii?Q?Fk3jIuVZefGa5v0N0iqoLCey3o5HnYtoZJEn8pQMmp5liCG8YB51ZC7eMsM1?=
 =?us-ascii?Q?fQtOObfISHyzBJc4fHg2ENZpiF4XFp/j5oag8EE/q26LLvczabbeCH4G4g1V?=
 =?us-ascii?Q?gwj8Yrio5pzCL6+an2W5TWAL6P/ZKUrRjzC9tD+tkQymoRmQDK14diIVJ5cN?=
 =?us-ascii?Q?rEFz8VQeNrGFRMpQwd5Ub9bauQMlFey8DyHV0gOGgggb023bSVVxkiCqnROX?=
 =?us-ascii?Q?AycpzSTr4axW1cCdvAaaHl6mb5LRgndg1Jne7BMC7TWzAlOm/52G+GLlq/vE?=
 =?us-ascii?Q?sxaxuSojKelmHP30gvZnMhZXAl2qusYWYxgCPqS+RfA/Hewb/ogBAsy/4PJe?=
 =?us-ascii?Q?DHKQ3NnSaHQogplseBz5Pmn2yLEmxVcOy8P4aZAOO/9F9NkMqgCbK0B3Y4u7?=
 =?us-ascii?Q?CRYiM0LN3ZLsGSEmGYUTef9k33CC7sn4iuCvX9sflducVQfx7QUdSJfwtcgK?=
 =?us-ascii?Q?XLEEKmwNmRn8zahI5aZ7Zq/fXrWQUuk1JJkAbNscK2EDe0DuY3jkyZcD5Njt?=
 =?us-ascii?Q?2Ubw8loFuJDD3VpJSJXy17T9sVVXNV6fhamwkC8ByxakWZRZrYJ5etpPdunJ?=
 =?us-ascii?Q?IiPhNm9o+UwiTJzOwaZHpJAKXQjZzrWxKrEqLw9TKvcW7zNJGanfpc6Q3xum?=
 =?us-ascii?Q?Ldf1pr7dDkwlvIlI5c4F/ak1L9UhLsDlgm4mU1gpD1vcgFpoieKZ2N+4Ot2D?=
 =?us-ascii?Q?DH2ofmnEM2mJLgtTyJLUauEun3vLGAdg0eIKEGH5nonPIcvGcsBqeMvEFvYA?=
 =?us-ascii?Q?pAw0ZBeLUl/K8mjAeyTB9rAJxXB6gZ8OEjSbW1I+DPP+Zqxl0nnQxI0OUuSO?=
 =?us-ascii?Q?X+L3A1qje27GkGqdgi5Rp3fe3pKsQ2pu5HO28iP0Hpj1KvM7pmGbn6sEa+6X?=
 =?us-ascii?Q?Bx8iWMU84k72OlcZ8pVrwRtQGE4fDjbflyBKuSdxNptwbsNTD/BFFbYa0ntx?=
 =?us-ascii?Q?IsNEi9zJR8lFb/FqxRGwnYyT5nDyCsChIOXGHYiE2hLTLFXwTw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 23:16:00.5214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94569926-07b5-4d12-4e55-08dcacffbf66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6496

The following changes since commit b29f570a9b03d30e33966d653a214597f8132b4b:

  amdgpu: update DMCUB to v0.0.227.0 for DCN35 and DCN351 (2024-07-25 15:21:21 -0600)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-07-25

for you to fetch changes up to b29f570a9b03d30e33966d653a214597f8132b4b:

  amdgpu: update DMCUB to v0.0.227.0 for DCN35 and DCN351 (2024-07-25 15:21:21 -0600)

----------------------------------------------------------------
