Return-Path: <SRS0=H84T=GQ=amd.com=hersenxs.wu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43B2C4332F
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Nov 2023 20:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67223C433C9; Fri,  3 Nov 2023 20:19:43 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7071C433C7;
	Fri,  3 Nov 2023 20:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7071C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LStJFIYnGKak8oFOyZyqpw6UjQebuvvVH3Zf6eqXREFnMKfZN60sPdgJtFbuC6tuH2xpKTXu+tQvSQZ5OpHVKdZ3j2gN9DT8JJkdjtfM8NNt3udN4qvWPWPqZkmcEzuRgt4isYGQywRxCQHRpupz3mQ/L+TiwY84jlN5hLT7suuvZCLfB56ug6tILoqEDXEjHzrAQ1qi0bNJ9A68QIZyDvYh9FMDZMDwobFxqvS4QpxmIPBNZyR7jBAp+RM0ruzincioGJGE+BAUc8o+QFOL/HbFCTFVFYOcQ2EuQtBHWLoWWdgpvXj26b+ryuzN1Ga52cV5fbyEyyfsk/L2060kvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqgS64Dom9jOw9biAXvtjDN+Eevmzyo7uPPifQ7Aa7M=;
 b=AM4CSmbGwLqc/E5/p6lG2tcVDtjtRDjoGfwo5JCjv2HRJod2HIJRB0WOtr93TIyRUyBIfSeVWodiwGRZZ/CJxiH0u3i+dYpLzV4/vs5/OU4ZVXrVb8QsWnM3ibgUf6LAVCpSmBeqx4ikR0zrT+d0pHqLQnnMOO/Ree6vTp0Q2BfqLnSSXEy+lsOJ199xgCa/EwLSyCnZUaioDZn0+/V1XkoFmFy2YYYu4e+rNaOmjAkte9flAvlKNNmqmnUbnFwxLaLQDr9EAOh2/73mBxTp1FlAxC6LCAutaUz2e8+v8HTp2Os0HODfhu3MR55leaAdMUVX9F2hhbh5G1JCFM/mcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqgS64Dom9jOw9biAXvtjDN+Eevmzyo7uPPifQ7Aa7M=;
 b=vG0aA5Uf5L6sR5puqExHKB4sRX9+TlH8gFQ5Yil+AT/WS7HektCKWg27kV1rKPxY7KSmEDxjdtY6szhkEqTd83z7hcmVDi9iBs9vTgVfUHLXnu1v9BWfsAcuKvsoZhE0YfbdL7SeRJ9yHy5RLsl4ADanjqb66tUCVYZ6xxVsXQY=
Received: from MN2PR20CA0032.namprd20.prod.outlook.com (2603:10b6:208:e8::45)
 by IA0PR12MB7626.namprd12.prod.outlook.com (2603:10b6:208:438::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Fri, 3 Nov
 2023 20:19:38 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::29) by MN2PR20CA0032.outlook.office365.com
 (2603:10b6:208:e8::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 20:19:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 20:19:38 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 15:19:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 13:19:37 -0700
Received: from hersenwu-Majolica-CZN.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32
 via Frontend Transport; Fri, 3 Nov 2023 15:19:37 -0500
From: Hersen Wu <hersenxs.wu@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.191.0
Date: Fri, 3 Nov 2023 16:19:32 -0400
Message-ID: <20231103201932.502070-1-hersenxs.wu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|IA0PR12MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f3a276-0ed9-4286-ac4a-08dbdcaa3464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AV0UFB34/MP6DKkE9XLJ6bt8qUpm0yB3IMtDB+YV7TjZ6fxJ9jzC65IAzz1vntFuuPitR9n24Mjtoju5e4ZRR9AZMhYU9G/BThUPskok8P2gigc85WqjWVcsZctKxzhXg22bpfncqxLzr3XapYtOkoIf/J4Ce4xRQVnUOp6H1nChs4Z7gQaNHM9obn6K89ifRb8N4ySliPwxUmv+jkGSkqmVIcixd3VmruiR6yduVjaUjnzgrDrR31ZMGwHexiFynGwaV3XNR1Nu69RHpBk518xMlJtavAWEoh/tYe30E/oawZ9E6yqBnXFf6UO3q1jTgk9K+B11x6AgzmMYWT4jOSSqyGGlystOkrmu/KR6W0ciD/nN7X1o6M5TbU7N6U63ypwCGElwEXwOZCivsyJFzQpxaHRxJMUShe0SUZ/KpQ93I4geLCVv5UFUd8TTX47fr+YkGxHQw3qmXXXGfg7phfw6QvLN1xBEu4ZFecKKjb4e4K5YjH2Ag0GEleC/bvwi9VkkBfQ2lG+wgNJPdAgEP/u8tVUfYo/uYjbrdWnG9CecwfhQ3G1mGTlUdHt46w2goI2AvBcPyicj75UBo2Ne4ePPLFZmItzdNtWg5Lc/1X24EFbhAJtv+G98DH6CwFZz0vx6H4lCdH9J5xUAx4DevwH9v1GeGk+9KOvgmNtEHt+aLS5m0TBuZVGDRYFjJuCnsLBPFR7vPYcmSG+EX/EgpM4Pdo4aqrJL5E1iVuQVFgIWzm0PapClArxvpbaZRbkFTrwMHriEwegiFarcYHiM6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(36756003)(54906003)(4744005)(2906002)(81166007)(82740400003)(2616005)(70206006)(70586007)(7696005)(47076005)(110136005)(1076003)(6666004)(26005)(478600001)(40460700003)(316002)(426003)(336012)(5660300002)(41300700001)(356005)(86362001)(15650500001)(83380400001)(36860700001)(4326008)(8936002)(450100002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 20:19:38.4152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f3a276-0ed9-4286-ac4a-08dbdcaa3464
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7626

The following changes since commit 65a89b16fd43a955ac05fb67f2be5f3870fee520:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-03 15:28:59 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-03

for you to fetch changes up to 65a89b16fd43a955ac05fb67f2be5f3870fee520:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-03 15:28:59 -0400)

----------------------------------------------------------------
