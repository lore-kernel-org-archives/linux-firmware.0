Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB0AC04A94
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5CEAC433CC; Tue, 15 Aug 2023 18:00:52 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60655C433C8;
	Tue, 15 Aug 2023 18:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60655C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSLNc5u2+jRnHi1UKyxf0f381mWqfRX00p/3tIdiBN6l/sC1A2yQsE+D/q9yulVBSb4n50VgZtgBB60ycX4rOXqkd6kfqHchmMV4Gi4C06eWpS8+ac1TvaNR4OwaXI1rhlBA+q88EeeKkH4mOmKjw5uhg6Oh8qxCvAJ+vN4ZbbV8mpcPZF4wPjEM8X8nnezocFxRYK2QNRY3oLBVRVzJlxDcXvpFrXzIZRaTm+CGrqLwyeUzY7LcOrP5rn35HbK2vRGAyd/2hCc9aSCRhKHiFF46NHWipGDpEpxEeoTbhdHqrxJxB7orWAu4tAtOeYLNNxf9z2ksSs5mtX5IxufOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ci7/MhBWIhPLdxBwWBALLmy+ZYztmDDINqzRev02tjg=;
 b=e5qGO9knxZL1AEODK+AIjPPFAyrwPzrYcJMXb/alw2SaEk8p9JB94dbxA/AD3pydKGBX1JTj1zLdeiQDw4fkLnwe0w+GWfvxQbJJQlWGkhv/dk/GH7atLSsxdJNxIEJZysaS5WQTcPseSHYm1AtlSWRMPbgWVZcYvhiKbh5/mN6BwAe6A30ipSNPPRqkH9zOb2zcBSqdsmAhN56Nz80gAFoty40afjzUiE9tlg1UFbt6bQG8Lg++NqxsLDnODWVb2/4Q09XZr6dhu8yeyYcyKsSz9R89hmUm1cXoSlroG2iMMK/aZtfg2EZ3D11UIBZJ7pBqdfhdkT7Kt+L4VF57EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci7/MhBWIhPLdxBwWBALLmy+ZYztmDDINqzRev02tjg=;
 b=0EZ3JShSR8eH3gu6JASHq4D88VUZ1zSX8jTyXcKdh7HZgYhZ9EpAnWv5FucVxD8dV7E1v+PIpLu+tcz7NlnFWsbYRds7tuUfx99ZDYfn1LIss+W8ukZNQWiw90HR2j+Sg3w3z5NwZNE576rbxMRTRKwv+cAN+rraXd5ojXor36Q=
Received: from BYAPR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:c0::21)
 by SA3PR12MB7878.namprd12.prod.outlook.com (2603:10b6:806:31e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:42 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::72) by BYAPR05CA0008.outlook.office365.com
 (2603:10b6:a03:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 12/20] xc5000c: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:10 -0500
Message-ID: <20230815180018.25554-13-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815180018.25554-1-mario.limonciello@amd.com>
References: <20230815180018.25554-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|SA3PR12MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: c9291d33-9e94-42df-12cf-08db9db98a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mcQstlCf2NRxuC8l9QOMjZFDuPNPurNH0BEOm8p1Lq89K7R6vYvBBooPCKFJQHxEYjaJdFJx3mhOezgRQQp5k3kY8xqY/P37i5Mdn8hCk8FTepjPRx30X0+3RT3fKYc9CB/ESpetIPSITYPeNt19U5xftKqDBGBHttcT3kDSQRhTPkyKpI2kaqcQ4ewFpf3eGyeNYijpzorWrW9MY1grlDBDIU0kZyNvMl1TZuzrq+saW8E6hZjPPjllDSCwQBVxm1QoxLaoWu1L++3TmWlEZuxG1ji9155s6hH1nTPuo3IHx4Tny8GblHMBNYPo+nYLW/lh6Im1gIbKLe51HxAkcfU3nI1B7V9uk3JzXszz15C/vJxtt19ZdCEQk3oIEhM0axvij20tZtNeEdFuO+03komBxJUpPE7zZPO17bVdwo7iZGjzJ3KYGx8x8xZAUb4gx1UWTWMlWnB+X3JMMpi7W1r+BP/jawWyjhCrrDV1+7NH69+tbxRThVV5gjk7VNLRxLeIMRccKRL9EZH9hGeZACE1FXghPdaz7xEZQliZAX/+M15Skz8crhVuV5VVv9yYKOTPOP5qn//ijhKMZYs9qX4psrh1BUau50ZOt0xzSv2wWIdvBeyMOa+N8cR8WVBMcHKHlWRfx3YFBmkQ8WQIi5uoHtiRe5Vwrjnvf6/t4V7782j88FfFekPgmCnMA3EzeyJd4vNGj6cvKlDgUoGqdFck0mU0TCZ/cK0esAKjgbBFVfnsNsp5yvlhVrvdikD2AbZBWcFt8OMNRZRYqYSErA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(8936002)(8676002)(41300700001)(70206006)(26005)(70586007)(450100002)(36860700001)(426003)(1076003)(83380400001)(86362001)(478600001)(7696005)(110136005)(81166007)(356005)(40480700001)(2906002)(5660300002)(4326008)(4744005)(36756003)(16526019)(44832011)(40460700003)(316002)(2616005)(82740400003)(6666004)(47076005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:42.1842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9291d33-9e94-42df-12cf-08db9db98a9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7878

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 LICENCE.xc5000c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/LICENCE.xc5000c b/LICENCE.xc5000c
index 23b81e76..ea9c8bd4 100644
--- a/LICENCE.xc5000c
+++ b/LICENCE.xc5000c
@@ -10,7 +10,7 @@ The code was released by Cresta Technology under the following license:
 // Copyright (c) 2012, Cresta Technology Corporation <info@crestatech.com>
 //
 // Permission to use, copy, modify, and/or distribute this software, only
-// for use with Cresta Technlogy ICs, for any purpose with or without fee is
+// for use with Cresta Technology ICs, for any purpose with or without fee is
 // hereby granted, provided that the above copyright notice and this
 // permission notice appear in all source code copies.
 //
-- 
2.25.1

