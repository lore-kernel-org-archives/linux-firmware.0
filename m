Return-Path: <SRS0=YStI=KV=amd.com=Wayne.Lin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D4C54E66
	for <linux-firmware@archiver.kernel.org>; Fri, 15 Mar 2024 04:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CEB1C43399; Fri, 15 Mar 2024 04:11:13 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E54E0C433C7;
	Fri, 15 Mar 2024 04:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E54E0C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGLZJMs/kIJBEBXm/SKkmkwSss+An13rVFaKsi1EP1au0NRASH7foursR0vRfUyJjng2yNyVVaV3EsOyu4jNRYWoIrynIsRMrXyWU4Pmb5L6UpYkVbJbF2X1At8MHVXZRbB4auKAYNv7TFsgqLcZ7830rrSLwlBQcUnZkLVxLN1iToLO0DtFt8PDhY5HIscRB2b3aTH3Hy/SW9k8qkZAnpvzUK4+MHZx6TQHp4+mQ4wBpUfqZ5I100cvY1wyREl4MIa7V0VMLqecddYHTYXuclXId0NSdtjOJTbh8frCoDEllaIToxQv1HA2dumsTONt+eJ0It3bwwy8iVL35aKkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50DyxCm6LxTpwFkO/bIP+OchVZBfpDNv5yndFmsN3e8=;
 b=IxY2J1NfZJxFYUbtv7TrNQ2Qyllxe4tBoAgSVKZlCGBC9/WPEQFlqWE+BzOVxjHeltbwRVt9VBr8ErLzDaecZmqrH7TD70RHXxkWbYQGKslp7kHZSCXE4cvDFob3oFf3/FYXCJ451qYSdEaZuD0z3bKZL6cJzeR0YrnC6/4MFAVJT+SWu7p2oDaUf7sdcyq4R8FtJ+Rwp8r7FfiZmchWn9+d75wjzntkDDXQw4EzXUvlJiltXKKcaQNOAJhtLpX/7PyVSG1nX8+XBEfWSY9q5qLPKXAXSHJbtL31lF2+91K0UMAyuLSMfPx1SV+v50crtyIoJHCkMw5+fgOx9WM9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50DyxCm6LxTpwFkO/bIP+OchVZBfpDNv5yndFmsN3e8=;
 b=zeaMRonhX2beahjIJD96QQrbk+ibJVzDDptJekHnq5x1vns1BEgbbCiCqmoQ9EfExingzaVJnQ9ym5ZncuZkenbZHCn31JvdT6T9eGi9p6xdd16UVylTJ/5ZD14tiWEpWHQETZ5mRSXbWL9/x0YATMBlpUfKqwumvASifD4LJYE=
Received: from CH5PR02CA0019.namprd02.prod.outlook.com (2603:10b6:610:1ed::12)
 by CYYPR12MB8937.namprd12.prod.outlook.com (2603:10b6:930:cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 04:11:09 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::38) by CH5PR02CA0019.outlook.office365.com
 (2603:10b6:610:1ed::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Fri, 15 Mar 2024 04:11:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7386.12 via Frontend Transport; Fri, 15 Mar 2024 04:11:09 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 23:11:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 14 Mar
 2024 21:10:55 -0700
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 14 Mar 2024 23:10:53 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.209.0
Date: Fri, 15 Mar 2024 12:10:52 +0800
Message-ID: <20240315041052.1029736-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|CYYPR12MB8937:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e987187-f281-4e52-f1ca-08dc44a5f1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OwikfJZMOG6b+VbDqXbp37UHU+69yhx6OYQrWfUtQkk9aQzOxCJLgBXak5H/MrGzTqN7rze3iG/IdN6nK4YILfnmTk66VyhfSnQCVA8lObf1+NG3E/6DdyxL4+/XXdmgP1wZMmC9UihdyIS2VvvwoIeSFJP/ArJpZkV9RtE7KCZyPGJFzibHCUhrp1R9TuuT7KEr0FsQclAhQKe0Tcuq/6FKRmSwWITvyYrALoFeA8J2k1ro1CozkEinP/NY+QwpxsR3rEo04BBAVsyxIpH/JvVjBCsJSqzoU2NgJx8TiT26QKQSXP9B8cMZeUGmf2di2eTah4BQeSsla82otE+U5Zegk2LnCDMeHHPVzgbeE7qAAPgPLcCQUGG3qfWe2GnE1ojKvO4lz4E6rJIe2HJufyi+XDrA/EriXDTDKUQjycm7ir8dci3jdbuEFbsJAKUdgnMgboe05VBju3ZYubVkFcIyFrWD4CEj2F5s7PvGNyGHMBpCPVOcjRJYY/cJ0yPrNswA09A2Ukm6KCW3w2a4gtAuQoLXjwU2lUPaqISTls2D3MVPdlx5+xAq9+Uv4DF21XEHIANLBNb+gVB9JwuKvHOyYC3t1UrZ/6/G/44D5AT2Tn3UNNvUJezyDzTe3v43vlTkaw+CU0ZUDs+m0sf5pmZlp4QJn4zyxLp2u8pLZLNNGW8aS6vQ4LsiOGAKX+XVgkB19EpmMzTd8xcqNG9/z3Q+3pqA9YIYqSBtj8CoMePApdgc4tfrja6ch04Mm2Tw
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 04:11:09.3750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e987187-f281-4e52-f1ca-08dc44a5f1a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8937

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-15 11:56:11 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-03-15

for you to fetch changes up to ad8aea35cfcb90e1579082b828c4d965603b8c0a:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-15 11:56:11 +0800)

----------------------------------------------------------------
