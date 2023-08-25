Return-Path: <SRS0=tiZZ=EK=amd.com=Hamza.Mahfooz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D245EE49A3
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Aug 2023 20:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E3105C433C9; Fri, 25 Aug 2023 20:20:58 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 682DEC433C7;
	Fri, 25 Aug 2023 20:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 682DEC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzJ4mxDgNJ3lx1CWiD+VfdeXFRly7zjxndxm78P4qTufg6G51qjDJJFwaRWBazt7J95IvfFk5IVb5dszSPbI+JgMl1hBM7OuiXMfUbprsDR7Trs9l8choMXAROMd4w+GEWGmixvL4p1OZL3N7jCYKYRu9SC7dOB0RsHFOqlO6xGaEdeXrsjWii7/qXt+/ERTdeEy5vLNROxnvmcnw5JesJgZKBZjGV4NpEmwn/1iPdfUCj3+BdquZYQcoSR8H5XV4WkaILg/W+8ximZ9hh8C9PRSSnN5La6qJfYzpCqdOi+E1ZFfrdnJehECxESUGiN/OZPWjCfkaVRxYl7yBHVpYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmPNEDZNMUxGdVEja8xoYKDy/nnBlDDZ6dA8k52bN4g=;
 b=iIksi2ApIrDuVtKRzcnFR6XHCVV5YoxlEFL8oJNFNc6+dEKbtaA97YCZu7hwwT2g7qkrqEgVmSMuNgliRqnPUTi/1FEwXBwFBGnBeUuGva3lpEqnLmULNkMaLiR7ewz67ZH5Oq1q19N1EfuMTLIw9Qj++ejarczuNiO0FntIURReSE/t6wkwBcOqwJNnhgElvBVpD/SKnThF7P7Syea/xhhYozB5V34PdYgLfKVJEMMPzTTLfeSoqnKUEbVtCq3tAEbRZSp7s2LHPOB0tPjtXxpfis2/R5/iqNF1nYTcbPfZLZDE9uYl53H1ISIxlCxa0gBxdPBWY7HHSDDhQSHVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmPNEDZNMUxGdVEja8xoYKDy/nnBlDDZ6dA8k52bN4g=;
 b=f5knmoJ8GvDA0W8if76IzIQTdppHl3LhIeWo3Kd+QLwUnEv9JgOYNd58HCnCDiCFS4dkrUG3d3H/SPvlez3w6Ebpzv6UcFGaEGT788Nz9I0lgu2cC6UZfwTK6GF7XpHHfGEURAKuY/Ig5u0bluYuE7AZS9U9rdz07qNexfaYq80=
Received: from BY5PR13CA0022.namprd13.prod.outlook.com (2603:10b6:a03:180::35)
 by DS0PR12MB7825.namprd12.prod.outlook.com (2603:10b6:8:14d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 20:20:55 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::86) by BY5PR13CA0022.outlook.office365.com
 (2603:10b6:a03:180::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Fri, 25 Aug 2023 20:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 20:20:54 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 15:20:53 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: <alexander.deucher@amd.com>, <mario.limonciello@amd.com>,
	<chandan.vurdigerenataraj@amd.com>, <deepak.sharma@amd.com>
Subject: Update of amdgpu DMCUB firmware (2023-08-25)
Date: Fri, 25 Aug 2023 16:20:41 -0400
Message-ID: <20230825202041.194349-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|DS0PR12MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: efd1c384-aead-4b49-45be-08dba5a8c921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	361rPKpqnajb/7xbZKwYV3Ac0W8Uj9JkWiZRBNXqkI9rh1ue0erfMNjcFP6hhql6suANNILB1bzU1mgYl6aE/Zs/lwStR9ZKri1qT/00knoA6z9OIRuOhvl6gY1ha8sIK/iNyHjkTmhcohvWm3ZCt0+z4YEjZpKkFDzEMJ1xi7gyl2jYTm/RQCzG6MfPbUxv3Wfd6vhZ2pwATNfmZvT6orYPwf5O2FvTywxDoXKXS0YcJj5JiXN4mbdufKM2Jly1BXO85u7As7x3dWyGs9LFUSU//THygWfBcjNHumYvmzvPYPYVC4H2k+tvgQzVDZ1uWYY2ehteycQ1Eq59H7PNZrRr5Bf6VW+Ve84ztitXAFuBLHG/eQqQTf3Gk9TzaoOX43PTto/3ftbMyS2YDUrah3jnqei/TCy+q4GbX+0j0Cw+3hOmq29yU8HjYF6IHOrJ+Bfx8yZpPgyJVcaXP/yHfSdo53pzEV1sdj69jg+F/Jyd3tatP/kDWAPs1rfnLmKEqAlQ8IluaJFd2KUgnNSnxogMLeFR+ny24zyRFr2gZSGnZLXIYcBUgonhayItN/gM3aP00EXrCkF42mH5RM14d4ZXOT40RJ80OmQEf6hz/DmO0hhgcJG06zWJiwPHAWP05r8OoJ/Qh6x8gSMK49yXienymgVvqF7ENLdwQ9KSPh0XlhSHrZtQBLx2Sl7f7a/1WBf/KizWQSuhP/W/YyaBRO0YpcYeRTJoOAVE9ex4J/Xy2IxaGs6sam8TZdIzEPgUNzBfgP/sXkxKdiEOgR0zWMq2Th48Bn9k05u6WL541fplDt6bHQoFYOjpK60BRI7b
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(1800799009)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(1076003)(44832011)(36860700001)(336012)(15650500001)(83380400001)(478600001)(26005)(16526019)(47076005)(40480700001)(2616005)(5660300002)(426003)(2906002)(4744005)(8676002)(8936002)(4326008)(356005)(450100002)(82740400003)(81166007)(40460700003)(70206006)(70586007)(86362001)(110136005)(41300700001)(54906003)(36756003)(316002)(6666004)(16060500005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 20:20:54.8046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efd1c384-aead-4b49-45be-08dba5a8c921
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7825

The following changes since commit a33f8f1abd1df344798188807de4b4397d7484d3:

  amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs (2023-08-25 15:25:00 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-08-25

for you to fetch changes up to a33f8f1abd1df344798188807de4b4397d7484d3:

  amdgpu: update DMCUB to 0.0.181.0 for various AMDGPU ASICs (2023-08-25 15:25:00 -0400)

----------------------------------------------------------------
