Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F05C04A6A
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 106D2C433C8; Tue, 15 Aug 2023 18:00:47 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93616C433C7;
	Tue, 15 Aug 2023 18:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93616C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmyhOiSe7U9s1gb0fM2AqL1YCe8Az+RrwGmQ+yqLjW2j0/bVbwJFkKCHaVSWYvwTggZg+anTM/DLv8MXlOdeGfpaKmx1ByJ3Za2gfZS8xhLCIuyy7obrVeNrN1dpKTZf26Pfj1D6fvFxYdQ1ckmst4AD32imKIVRlnVHLBIS9veuJtJvWP35DaVO/hJPyBsi8UrE+oEuV12AXsg1Lo7kdT44O4tXMFSTFlesGB/dlG6QZv/wYJH+KemWji4OtTS93Oi8/LKXorvAKA1HRfwH3bYVRw511Wd08EcFSOeD8im1/p2XsBt9BvfTPSQuM9CO289XVfozM08dZAxFciy8kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHa3m6u0u69TiFxgzRBiYOK4IZ+ABJ56f9ypBc8CA08=;
 b=P5DRt84WKxLuQ/ZUCApORIl9cJmJIxvgNWHQJ9UrV9JKYtNDwNcOGiBmqs8AxGv5jLHXqcMBCbR4tBv1Qz09h046Hh0YgN57a3VaKIR/2DC09NwVa+LeGbAbbMMJ6NwEzOsz0JkDGkq+sk/D6nezvhwupqxWMTXsED3HzZANa6lkpOQHMtxrmV42EwJo6IN1fWFaqKthKwFWeSNKqaKpGruZ23ATKjVNJqOTEUf5ukiZr1TfUpu/rmK7l8qWu20MZWfMuDApeI34S4ZFNiqRVXMTfpeQwRy+4/Gr2pMuM1YcbKYX5aMbZjPXlU1xu3fRqHkagiUywXq3I5lwQnPQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHa3m6u0u69TiFxgzRBiYOK4IZ+ABJ56f9ypBc8CA08=;
 b=xhmn0fLDdQWKBL34q47sum+X9AfoehBez8GLLyAv8R8lKCZpqkvYaf77HoxEl4xKr7yUtjzTd1o/t1KKga5773/iRty7gSdT+czlFgxoVABEs86c4yyER4E0/YA/jKIsmn7G1HsfRDyUCkFNHCW0coMa/nefe/9maSXg/UL30QI=
Received: from MW4PR04CA0336.namprd04.prod.outlook.com (2603:10b6:303:8a::11)
 by BL1PR12MB5350.namprd12.prod.outlook.com (2603:10b6:208:31d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:42 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::c) by MW4PR04CA0336.outlook.office365.com
 (2603:10b6:303:8a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:40 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 10/20] cavium_liquidio: fix typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:08 -0500
Message-ID: <20230815180018.25554-11-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|BL1PR12MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 4918d958-d80f-4097-b8dd-08db9db98a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W7p342U0JqRPN9fH6n/cKKkbd6vBqsSyW3I5VXW9uG0aSKTRGai4VfKSD8qbIItGlmQzdpHOc6XuxkAnq7dwAU2rcP1M4khlyV6CBCZs58UHDj8/Am160wmc1Z6XDxKTyK/pbGBXix/bPM+7j3ZLHxTsah5tAlUEsFB2PR/R6meORdBuInXa/xNV+Gw9rC9xnUQ7ppUpdVt4KEBH9zaZqiM3F3xxiPodqJcbdh0bqz1QLZUVPBbKDTCIf/1gSoneS2iaqkyx3lrxnG4QBH0njrHko6C9wHRl4wSrRqmagIYgYeLp0pFDT8XOySnIARUVobeaH4gYbYBQ3y1dzDloswVNVyTs2ML2lwgXRVTs33WD+TA+9zrSqTwSg7RH77o873VhDfQbEOweo0HkM8ghJb64/AY4TtEE9ygbwnqHGF6cTwzrtzjkeBt6KBtqRFBwC0daHAz529fIl8PhLESBB203ejVVVZ26r+IhEDdc9yf5dUAYjJlYtw7eaRxldeD9uEx2y1BTrIgmFP+3JtXrLOUfnzadf+QnLypinjf1vO8RPEBkocQ34ky0Z1MbkDbryzhqr9kMp4QrP7/Pbj/BcnYafFs8BcR02YsWZoD6ux6kmHaLf3wpXrLlilsboXEHFH7k+/fnQaQjksQSZC9hK0RyrMgruKIjKdlWVMjEzuS2bpxr9m1rFHcqbUOhBRQ1kNR3C9Lw8qrhLA2RxVBPrwJf5eyZjxlPKhMJVFgOhCIuIurVQFvMmvfWqVE+BnhBdnLxcje4RCD+91ts68sP8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(450100002)(8936002)(47076005)(41300700001)(6666004)(426003)(83380400001)(110136005)(40480700001)(356005)(5660300002)(81166007)(44832011)(2906002)(36756003)(86362001)(70586007)(70206006)(4326008)(36860700001)(478600001)(8676002)(316002)(26005)(2616005)(40460700003)(82740400003)(7696005)(336012)(1076003)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:41.2185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4918d958-d80f-4097-b8dd-08db9db98a0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5350

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 LICENCE.cavium_liquidio | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/LICENCE.cavium_liquidio b/LICENCE.cavium_liquidio
index 250b9fe2..1b94ea94 100644
--- a/LICENCE.cavium_liquidio
+++ b/LICENCE.cavium_liquidio
@@ -1,4 +1,4 @@
-This file contains licences pertaining to the following firmwares for
+This file contains licenses pertaining to the following firmwares for
 LiquidIO (c) adapters
 
 1. lio_nic_23xx.bin, lio_210nv_nic.bin, lio_410nv_nic.bin
@@ -36,7 +36,7 @@ NONINFRINGEMENT OF THIRD PARTY RIGHTS, CONCERNING THE LICENSED SOFTWARE,
 DERIVATIVE WORKS, OR ANY DOCUMENTATION PROVIDED WITH THE FOREGOING.  WITHOUT
 LIMITING THE GENERALITY OF THE FOREGOING, CAVIUM DOES NOT WARRANT THAT THE
 LICENSED SOFTWARE IS ERROR-FREE OR WILL OPERATE WITHOUT INTERRUPTION, AND
-CAVIUM GRANTS NO WARRANTY REGARDING ITS USE OR THE RESULTS THEREFROM, INCLUDING
+CAVIUM GRANTS NO WARRANTY REGARDING ITS USE OR THE RESULTS THERE FROM, INCLUDING
 ITS CORRECTNESS, ACCURACY, OR RELIABILITY.
 
 Limitation of Liability. IN NO EVENT WILL LICENSEE, CAVIUM, OR ANY OF CAVIUM'S
-- 
2.25.1

