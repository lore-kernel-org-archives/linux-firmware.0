Return-Path: <SRS0=z+XC=OC=amd.com=Jerry.Zuo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAF2C30658
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jul 2024 19:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40DA8C32781; Tue,  2 Jul 2024 19:07:46 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20DEBC116B1;
	Tue,  2 Jul 2024 19:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20DEBC116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaAfgYIdBfkqO2x4mhDtLi0nL12BFaJcPgyjz7xd/HwwxVuiMb9chrakrLCKOro6rIAdCTYLXh/tBjnerIbIck9C6eWniMfZfP70+QVrOT17ZP7djPOKSJNnrL8Yjt3ujpA0PK6OZ1R/U7cf05YoKbwnToKlLzMdcskWDTC030oWuaAYHBmmYcijCiwEQpQdMmSIGHR8MZk8Q1+a1oOCV3Mo/5GKen+WWD1Te8fEUEGpxuaWcZqo4Nw3f+DrOT6b7OQ29WALgvr5eUapzI6cJ/Bnx6bUJAev+AXGlK+SAgBhyCe0XMOCtH95aZEWAnICEWp7H5Ds2ecR+fpI0oITaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W619MIEEyPiQFB1DE0VhbrdymMTw/jL4tc3aa/2VaXo=;
 b=kgvVnjXyTx44mFmmc5UaDUvg3DRyeDLjwsvg6/bp33gpI7HV/FIzHNMBPm4MYY2ohpfIOISSSTr3rgYxnUvdUlf9o49CChwrITMXpgLCrOMvc5MNATeRlFp5Qj+8j6jMsjH4v3aNiuxTdo84CqziHSKexf87W2OLBiNMhf4/PLQPCJuYsXzCQEfzWHkukS1zRy0jics6p+laBH0AjloH5pJUq6a41Djfca3RxfOa4Cl9lCLqm6vbQsEnof+u8Bj0WWEJaF8KIxQq915oFyrsCGUybBgZfByAWFv3Wut7XlgAhcwnhyP3AyvBYPeuPeJs0+xWg2cP3KVc4MgCOf1sHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W619MIEEyPiQFB1DE0VhbrdymMTw/jL4tc3aa/2VaXo=;
 b=HyS/6NgvcAzf/EomS0wmU2kklYX7BN1REmQA2VASX8equ8LOFUWQ9YnalE/QUpfe1b23HJzQgjdkWrpgBjKAjOC68Q3ftwGceGsXyCK6ru1/wj/ideOhGkeAnXXG49MvvJLLHNZyUsGzzd/EaQUCdV2vhv7Zjp5VABnjNoCyFW0=
Received: from SJ0PR13CA0004.namprd13.prod.outlook.com (2603:10b6:a03:2c0::9)
 by PH7PR12MB5973.namprd12.prod.outlook.com (2603:10b6:510:1d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 19:07:39 +0000
Received: from CO1PEPF000044F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::76) by SJ0PR13CA0004.outlook.office365.com
 (2603:10b6:a03:2c0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.22 via Frontend
 Transport; Tue, 2 Jul 2024 19:07:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F4.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Tue, 2 Jul 2024 19:07:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 14:07:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 14:07:37 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Jul 2024 14:07:37 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.224.0\n
Date: Tue, 2 Jul 2024 15:07:34 -0400
Message-ID: <20240702190734.9472-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F4:EE_|PH7PR12MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 717c937e-3739-4852-b2b0-08dc9aca3da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KI8P9JJtQFH5vj3UWGiWacP+WQT7uqGRopZOxiGfBm3zeItPbZ6eDpwGcnkK?=
 =?us-ascii?Q?Fa8ywRo/LO775WUs0FLXVdcorbGyPjD7RGzU21KBxNA5yFQiAa0rTb24oTZS?=
 =?us-ascii?Q?8oFoM/F63mROmwvQFfMpB+j7+43ooJbn4JriDqwqloYLpeMsfFWUAPdipwjA?=
 =?us-ascii?Q?svAIdlOuNBqEgbeEnRZusRDAx7wySm6lf+C4W+BBen6EAIaV2Q+8z1YvBspl?=
 =?us-ascii?Q?il8XHN5cK7T9PcTaQPC/beA8L9wEnj/SlrV6cF96A2PPxLtv9VOAlhAlgDd7?=
 =?us-ascii?Q?wYjCEiW+uLfZvocWJH74cI2VIy7+7Vc4GasaI5n3g8hvX+Hlh3YPuBVq1cKw?=
 =?us-ascii?Q?Sm/DZgNVaFHamPMAHlQFDbS7M7cZJL9FOcBlHLudu7FAze6cwtTxDk6K0yV1?=
 =?us-ascii?Q?RjKW4JcufNutG/ALCGoPUwyOdflLOT9d34cWsPwVuiCDYLBVwNJVcrorEvl0?=
 =?us-ascii?Q?aGrzfixyi95CbENQaS03iir2z6DSTfcuSslKWJciXt9zPvxu0eq0hbmQneoW?=
 =?us-ascii?Q?Rz+sab8oVO01MCm3eHjxLMG4ZufVYRwAQw2OSPQ/dtFu49jD8kqtrVqo5fY3?=
 =?us-ascii?Q?esfubVCdacEW1yS0YuJC2fFZyeSKKFsqZoPrSe52nelxYDdsgSaxGX16QNsf?=
 =?us-ascii?Q?y6/7FNyjpZRnQvMxYweNHnHEJJBpSIExgW1I14lpRPkelADBuD3IrMlijV6g?=
 =?us-ascii?Q?xbpvtdVhuzPhrm7A7oFR6cbVMAMXxxd2Ozg5GVdzJDobQ9xFGRIJbY02ri9C?=
 =?us-ascii?Q?jINrpBhqimTlxcMDJwwbHsyWLToDXahRpJdqfmSukNKiBpuO9CBr4vRAotVY?=
 =?us-ascii?Q?KR533VOGyntc6ETO1BfppA2Q68/RwObDbDVEFYKQlGqoG8Rqoyvz2Qh6t3ur?=
 =?us-ascii?Q?4m59gWdtVtiIOt/xsh8L0gV1JF8XqhqcOSCWYFPX8bcwgPO+bWLeUhE+2N67?=
 =?us-ascii?Q?of7phPHJNqB0yKPJVLYHiOxfIozh83KUt2ep3/okJ1hNW01tvhCiggV22WiO?=
 =?us-ascii?Q?7uEcL1Le1cM9Xdj6digjM7rVXw9FY6/282ajTIHIfI4btBc/FuU3ctikiWLp?=
 =?us-ascii?Q?TlAIJY+WV48eXjZ6VZWSAjkI7nJfDcRiuA1h8Fz7P2OtC1AEvZzlCMBLU+fh?=
 =?us-ascii?Q?498CkRu/eyW8/2vh+UGOSV2FWCI6L/kuzRiXroLy+CEZASwOJf6xE60R49/D?=
 =?us-ascii?Q?oehFo/G6n8GaNcDj7NOz7yyUAT3MiSe57qiKpOhOAnRKZ5OtGql3Bwi+5cWN?=
 =?us-ascii?Q?bTlocpHr+E6YPih1Kfu2zSiKP13ViSaFHAeNmORXNUfgZbmg+1AAnjWC+e+5?=
 =?us-ascii?Q?sBv9TMQ95GFPtK2VShFN0U/SV+cr0g3Wa+LScKisxMcww6pl2iHQdk3nfttW?=
 =?us-ascii?Q?ZdmTAcwie+uJUqgd5ZTYDiepR6wsguk0K7ZAe1K5SdIuiiCy0svvcYoyaNqF?=
 =?us-ascii?Q?8GOJGxmivFhuZrXB0p35ZxJLEbbJ0O9k?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 19:07:38.6258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 717c937e-3739-4852-b2b0-08dc9aca3da3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5973

  amdgpu: update DMCUB to v0.0.224.0 for Various AMDGPU Asics (2024-06-28 15:23:55 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-06-28

for you to fetch changes up to 6ae2bb3fcc9c093efa62cc7c27357ff7fc3d83e4:

  amdgpu: update DMCUB to v0.0.224.0 for Various AMDGPU Asics (2024-06-28 15:23:55 -0400)

----------------------------------------------------------------
