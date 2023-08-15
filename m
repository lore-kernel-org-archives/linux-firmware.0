Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BE7C04A6A
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD465C433CD; Tue, 15 Aug 2023 18:00:43 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F6CCC433CA;
	Tue, 15 Aug 2023 18:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F6CCC433CA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNuO8PvYrv4uxJ2PB6ppJym4tYQkLdUfYk1LYA3TI3dSsihL7vFGQnou5qKI2BMkUpfRoD6PsBPnfyV/SLJ3fUK8YoNzCPp4J9rk7E4ZJECN8yPZawhQZ+VtfXfmq9jWqMuzPbiqpdBPmE9SYHnVbNFU9KZFUcNMv1C3WpQufcmWWSdyOkLrWkzr5pD7G8uEDQL1N+oygdA9QMjUvFq3rUcbLv2p8VgrupEZwC7w/gyyRMf5cugBBeZNi/hEk1vNEWEAUxPGiTtcYNZRJpAN+f/a9/VEg9xA45utfBCzG0XF+oN0EaUwfwiDpAznPd697A3NaWTNgDSYxfwqxCgk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKXWvlIP8FntQ7Aa/ZH6Zp6/4nGvqOruCpvll1Fz5A8=;
 b=RFlgqv31UI2wrlpFqPizKgl6S4DNnJ9M9CyRZ5dPVtodO+GFCith142rSkrk2wNpSGMg3Ww0HNfyHzRZWh2JrJ4jruxO3xpnSFsq2AKJAMjddUZ5J7HDV1lUEgYqpCwWwQRi6V3SHoIHc7/5M5I8/QNTyG5btfUB0NccQYCZdenOhyD8eK8054k+Ev7Q68LO94dPHkf7aMqPDc6bsXqeroEKAgNV3gxKRGuAI7CBSb0jdr67uYdWBMaDuq9rYhcqPGADNEwglOcPf+haB3yI0x7YVT5YvKi19K5WZp2dqzoAFZRjoF8wE/Kg+u9TnJXUhiwKwT51Gj9wAZ5O3IfoRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKXWvlIP8FntQ7Aa/ZH6Zp6/4nGvqOruCpvll1Fz5A8=;
 b=JwVkJJW2SYGSrAfj9GWEEnYu2j0f5t8Cc3TCnvivHIzIefHkHtDiy1tM0J97qucVlX1U+c2yHPlH0ekfULIWSR9OafC1WywWhRePDHzxUqVkymTL0wIa8hjsFdEJRAr7NwUQ+VEpOsUvnsxe6T/S7YCFXuSknnwA7tecQQ1Jazw=
Received: from CH2PR15CA0022.namprd15.prod.outlook.com (2603:10b6:610:51::32)
 by DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:40 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:51:cafe::16) by CH2PR15CA0022.outlook.office365.com
 (2603:10b6:610:51::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:39 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 06/20] qca: correct typographical errors in NOTICE.txt caught by codespell
Date: Tue, 15 Aug 2023 13:00:04 -0500
Message-ID: <20230815180018.25554-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a94f289-aa9d-4893-3392-08db9db98911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8Z7XEHzugJQeDZPqvUyNmnhRAkdrtIZS4R+BlshUUIkD8wJV/lNrN7ACuXOuSUvFBMzd5NCyHjITIXtgyw7NJ9U2AD6Jh+Jc1/KwbvF3ZQAIvI38WqH19PfbmNTuaCz7kd5WazUco47ACUW+DoCvCkykLk7ys2Ax3gJ1Tu3feGXhcQq3gy9ihRG2feN5rLIvzz/8luY8fq1P1Ks15nCoaqC9L61LLNgXdThfXiYjNtEXJyyHCn5DvYt/fOKE78iTEZdH4MoCQxJVf1C8XwCNJFsY03h9pAVtqfK6nrmkVdbt4H3QBBaa5iq0ATIoziRPNOHco/qPYQrXKHi5UBfK4GUIB5c28A4XfH7EE8dQgE/TrcRAkd4qF5xplhepi+ZDUTzHnz8s/feMA+Au6CjNai/lGsx+VQ282uvgLkx8gLGido6Lv7k4Nr46JNeYWtKkjpc0B0vDTkz0DN5MMXIG2H43xZboNriWR596/62zrNzUowncKcP1weCxAeUAq8QnTHYhKmQtRbck5a0rsQ/PF26oYIJHjPvaAnYxvaPRjmVzxh7ypqfGB9K61jQ+4Je3bBFUJhpElhwljMwfgx8ycjQL0fpLbTZHYY7yWsOpIzbl0waJL5Lb9Onv0bBp0v5cqadPhXrFU1SeTNuKMrJxoP7ztVGNwN7Zzwn18AtQ9kOvEApflnKR33f3qntRH7lLpP4T1ZK0C+s0TLqS6Xo63Sst5zSfz3CrpuO9OcV5DFD8d6ohtoegPcaIktYUjllWy//NmzgZ0p4bsorfBee3Ow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(44832011)(5660300002)(336012)(478600001)(8936002)(2906002)(7696005)(81166007)(450100002)(40480700001)(1076003)(26005)(8676002)(40460700003)(110136005)(36756003)(70206006)(316002)(70586007)(4326008)(82740400003)(16526019)(426003)(356005)(36860700001)(86362001)(6666004)(15650500001)(2616005)(47076005)(41300700001)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:39.5767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a94f289-aa9d-4893-3392-08db9db98911
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 qca/NOTICE.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qca/NOTICE.txt b/qca/NOTICE.txt
index 93130207..fde2a7c8 100644
--- a/qca/NOTICE.txt
+++ b/qca/NOTICE.txt
@@ -199,7 +199,7 @@ File Name list: aes.h, aes_locl.h
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -243,7 +243,7 @@ when       who     what, where, why
    I retain copyright in this code but I encourage its free use provided
    that I don't carry any responsibility for the results. I am especially
    happy to see it used in free and open source software. If you do use
-   it I would appreciate an acknowledgement of its origin in the code or
+   it I would appreciate an acknowledgment of its origin in the code or
    the product that results and I would also appreciate knowing a liitle
    about the use to which it is being put.
 
@@ -274,7 +274,7 @@ when       who     what, where, why
    I retain copyright in this code but I encourage its free use provided
    that I don't carry any responsibility for the results. I am especially
    happy to see it used in free and open source software. If you do use
-   it I would appreciate an acknowledgement of its origin in the code or
+   it I would appreciate an acknowledgment of its origin in the code or
    the product that results and I would also appreciate knowing a liitle
    about the use to which it is being put.
 
-- 
2.25.1

