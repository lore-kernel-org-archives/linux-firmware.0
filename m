Return-Path: <SRS0=86R6=VA=nvidia.com=petrm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAF6C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Apr 2022 07:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BBBAC385A4; Fri, 22 Apr 2022 07:54:57 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FBD7C385A0
	for <linux-firmware@kernel.org>; Fri, 22 Apr 2022 07:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FBD7C385A0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpZ4867eqU/HhGl1gu6XJhsc4Ut2efiiQE5hupiJUDYkj2QxWY+CVBIm7PAPFrTAqVbJDErBJaBfBF1fr6DrCA5sXB6yygLLOAnZFrGTaoAcYM0L6wYbp7lKo5gNvoCDKFwnPM1ObAJCjAko+j7ZWkdzNMbM78syBt0xB201oaKI/AmzSrtV96NRVrJOCjs7OGqsCOE9wfa+H8G4QSbjG/7DzPb/ezWJwoYXpOhce3vjcp62SzZISy/13dq4Pwedi4NaXbhwuoGPDBubViRrr0cQqSoQr/ykkf/8nG/r8H4uUzxurltHNrSP7vn+7oUkRphfy1FitErQbQz05b2Ogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34AkBMg8x0Y6DDAWSeRRgLXjHflOW+D1lvQ6THNOkwQ=;
 b=iSo4AQaEA8QizM0cjnTmBiPUObHCzZzh9dwlxrDQW5YxhNdKmz6JYRXre+vZPlWZFzceWNX2putC/I7XwS89ROkKUFpq/tj/3KjITSnDMp31R9xhQxEOpAeGTRsFHY88jx28+soKlk18mxAJPr1gFzvfMtnmoOMvNNyx/hebugUq0zpAWPfeuxXjPOBa8HFsJDpbt6NrxMZo2vimaHogiKJIZtaJ0i3EXLOxkqG17F6G+IlgzRepNr84fhnHj2BOoVWPQEAZQ8eCawTZy9Cjsp/BaRDo5XsT2eKcdXdz6yqY+yqiUROvusOs0uBkI8n0ezFbs5OjAIUB8ZD5Ou40Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34AkBMg8x0Y6DDAWSeRRgLXjHflOW+D1lvQ6THNOkwQ=;
 b=e5NAXMjN4Bs1h9brYksBDSLK2kaNEadcEqK1P7O9LeXAyLwDN3EfVnxITBQUCBHHKxFbEzOSid4yFa+AsddK7RBfbYuD+fDFJyqPebR/BI8C0v1Aaz4hFt/efDArFJqtcyGFNyN0YySWoPbNJb1Hc+QCbP5/5s+G7emgeZ7dlGrxhI4ylaAFeVwfFTjq2/FvC6MOMmdh/nTxEk4EizaefGsTAcMS98Mx4rVHU/URJ9niRmGgph3sPrUJpNm1rLTD0+lgvw5Zc0sQo/C5Fd7xJ5I6pl882etk1c1wC6KF7Zc/8gNHGu8OFpMCqIrrstExL4AgvO/WjVFrpPFEL+ue2g==
Received: from BN9PR03CA0663.namprd03.prod.outlook.com (2603:10b6:408:10e::8)
 by IA1PR12MB6041.namprd12.prod.outlook.com (2603:10b6:208:3d7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 22 Apr
 2022 07:54:53 +0000
Received: from BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::e8) by BN9PR03CA0663.outlook.office365.com
 (2603:10b6:408:10e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Fri, 22 Apr 2022 07:54:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT027.mail.protection.outlook.com (10.13.177.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5186.14 via Frontend Transport; Fri, 22 Apr 2022 07:54:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Fri, 22 Apr
 2022 07:54:51 +0000
Received: from localhost.localdomain (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Apr
 2022 00:54:50 -0700
From: Petr Machata <petrm@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	<mlxsw@nvidia.com>
Subject: [PATCH linux-firmware 0/2] Mellanox: lc_ini_bundle updates
Date: Fri, 22 Apr 2022 09:54:23 +0200
Message-ID: <cover.1650613831.git.petrm@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4ab6657-9646-467b-9a04-08da2435628c
X-MS-TrafficTypeDiagnostic: IA1PR12MB6041:EE_
X-Microsoft-Antispam-PRVS:
	<IA1PR12MB6041AE3FB34680780F4FEF17D6F79@IA1PR12MB6041.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Oo0An9zAF+uk51txdrhHEHtN2F0PFkJOh++kaLQYiiIawDEdZpY+I4c+jK/xN72xcEbxADjWH7pWcjCjV4JnprOKFydbASqCAq8+//P/bAG6IeB2UYtu++2waJKUe00nt1XdNHdTocXKdjbBJzpDEX7dAo8pMFAmZLBPmCSCmkqMS4g9hPZxYP6/cH+lT5mMHMXw6TAfirk1I1XWEJ/hovdeJtfg/aOf+L8vwA4nkhWAOYfGqnXX76/6Wt/oR368uB59IyIkDWwlSSnBhmZ/mVji6TwNWAWc6ufpa5VYtL3Zn239VjEctWPQF3nCXP7IjIBHoFIj6fQRz/SAz3LpyTFxLR8xZjZBJUjmn0luGSsfiXi60ZfNnMbE02B1epHzLRfnrjpKyPO9bBNz2m0Cvwfj0d9I3LMOOnAljpV9prwmUvlqU6BaZjfaDjLfoSykkCjq9YOmWAsX6ouVAVnG6gXTXtgtByYl1TiRbYHoAIentD1B83+TZVFjF0S5PyReEWFFTuJjSbpST7ZQ4tn8eN5aE4phBjUIOzmVs4V1lGpm/nI2kgJxMxsOy9oh+by61HDOHx1u1nV4T3Sc+mjniNvSfvnoeosCrhbsls/GKJZv3Xj/UrNVlU5yDu5NMNes6vDxAgDWj7s0JkkUJV+tJnj9orHhMBqFWfg9p0ljYZt6XUUoXU7TLePa+k/mDA7ZyMBvQf0g+RFpNEsHGZk+Xg==
X-Forefront-Antispam-Report:
	CIP:12.22.5.234;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(26005)(86362001)(508600001)(5660300002)(356005)(6666004)(2906002)(36860700001)(81166007)(4744005)(83380400001)(8936002)(2616005)(70206006)(107886003)(40460700003)(16526019)(186003)(336012)(47076005)(426003)(316002)(70586007)(6916009)(8676002)(82310400005)(36756003)(54906003)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:54:52.9563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ab6657-9646-467b-9a04-08da2435628c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.234];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041

In patch #1, repackage the existing lc_ini_bundle sans xz compression.

In patch #2, contribute an additional lc_ini_bundle for the minimum
required FW version, XX.2010.1006.

Petr Machata (2):
  Mellanox: xx.2010.1502: Distribute non-xz-compressed lc_ini_bundle
  Mellanox: Add lc_ini_bundle for xx.2010.1006

 WHENCE                                  |   3 ++-
 mellanox/lc_ini_bundle_2010_1006.bin    | Bin 0 -> 12300 bytes
 mellanox/lc_ini_bundle_2010_1502.bin    | Bin 0 -> 12300 bytes
 mellanox/lc_ini_bundle_2010_1502.bin.xz | Bin 632 -> 0 bytes
 4 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 mellanox/lc_ini_bundle_2010_1006.bin
 create mode 100644 mellanox/lc_ini_bundle_2010_1502.bin
 delete mode 100644 mellanox/lc_ini_bundle_2010_1502.bin.xz

-- 
2.31.1

