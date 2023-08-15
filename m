Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365E0C0015E
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0816C433C8; Tue, 15 Aug 2023 18:00:45 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B650FC433CB;
	Tue, 15 Aug 2023 18:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B650FC433CB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcWSCY+ca6kWxl1qoejqv2jC/Vu+BLmFpbluSHEdWGPSatKBMvDvD9BFD/WayBsGUdkf0jEu8BkVlH7dJB9ct17BHnI73bV/tc7o4CtzoXU3D7LNxaEtbska5B3WBZkxNg/EBATQTg2TAzXNKHlSmUave3LIKfR6bf026JEJI+iEnyrQUs3oBpCet+5OUWi7GmpxmKwuK1nbD/ou7Pkt+HBT9tEYZCRPs7Ye8FCkTEjY/mRXrUYHJXMN6J0ySbp5s/LX2PxkAq38+pZ1kZohXITIdEGPUE+5Lk5LUHu4Z/+XVt777ZUpmf270J2NZZjCtbSRFtR016Z09t2W+DcEuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bmcZRUWwTWC/eOmPVUznEv5uXRsDaDF6/gcr5LvmG8=;
 b=nGVBFmI0CUOAIjvfcUOV2ac8CI5ZJmLMN2PpTQPRnvX1HMzr1BxOmAoW4mqz12yIHnZh8Jt9wCmEF/6moTElKrsIdqh8DNvuEHjI/a/qGfCd9NIJdUpWhHjAE0nfovOSX1+KN7CQcbUCrjORdRMlfMfdIgDTQ97YyknSR+0MGvx7NLhzy4HniZkTsS8+nXDP9JE6bMRMtd8tbMshbzjDjQW5CqVrPiFRfAMv3M7+06F/g0N/VzqpJflPH5tIO9sAW8Mm7g35EPAobmQjkLrMDhmGOAdZf4PplgtaKkmYa9wKNFxVDTY2WJeUyGmEu1Fhm+NhR1Cq8EjkcNrHeyaQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bmcZRUWwTWC/eOmPVUznEv5uXRsDaDF6/gcr5LvmG8=;
 b=AKXziRvRcQlBITIpPmybjaXsRiOdb4YteKPgIM6J5keoMs1Hruhu4GfJf/9hdwm8ccKmlODbDie9Ge0hZV7ThG5t1cQ1GeYSNHmTGH3WEorCbnPv82BKvhn9A3pi15Md7rSxs9rlkxj9OAw6k8S9pSq6iz2R68pjnN7dbFzO5t4=
Received: from MW4PR04CA0354.namprd04.prod.outlook.com (2603:10b6:303:8a::29)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:39 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::30) by MW4PR04CA0354.outlook.office365.com
 (2603:10b6:303:8a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:38 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 05/20] agere: correct typographical errors in LICENSE caught by codespell
Date: Tue, 15 Aug 2023 13:00:03 -0500
Message-ID: <20230815180018.25554-6-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f40cea-e883-4143-296e-08db9db988d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jhlh7Y2OhRvFqyh9C8XUwWe5W4lBOE7+qgDPdOT2DEZUV6w1rQdZnT6VjXlyI4XebxFH6j+lpjwL0KMldMf/NakZ4r0rRCmC82mk48A5cmAGspVHFfMvLnZgdNUtf7gwMlNRsHBfCqwr6Thy62E2TmdDpHbPbjjE7HZvcgIJfCZROWo9N7tnl43eeo9EJJmnPSivhurcE6xjK9Lpk1N//QzX26rYbb8NC5GfihhfzJaA7p3J+pHJs/0NuWpsb9TEVcNbVqOOQhGlMj13fNDY/TC+iXobdim1eKi3I/UEn+p++Qwy6H2tpl8XxoAte1eHEKCU7uQAB6ya2/bSJuwVaaoMBbfkrjFsQhLOqP/ZWqm/XDKdOFhE2R8wBBxKOoTLavZjA6MoFjNa+yXjEK8HTIwxFTTVqNS5GYIVGVwoJMzxgS5I4SYbb00h7kVzh1fTo/Y5CoXWXI77yaYWokz7GOm/wCj/3EqZSI1BOIafEoKqydr6HvCqhUlmZPv34TvyY//9hpxBDUGNjRWImtMtkT/99FlRE9xO1BPWuTMPYQCC2Yemi9qR44x+HVHDleFWnhu+23O/rXYquK6L9LyLdcf08ieETL7eZonZJIIL4cE0pw0vuyo1/iPZPU02+j+7O44nuuCuKVetwr+CxlQBqI2XcksT7dl8RBmDylrtHa4V1l/R72FY48yk1gGqAqL1ZW4E5IPsLqmSe0iu9Y4+LjxvhfHzTTRSRJyPY1+dOEUk8Fx+VXJsvX0vLl0j2W31RWfGcSeOofUeZqtRPrAUOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(136003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(450100002)(336012)(70206006)(41300700001)(8936002)(6666004)(16526019)(1076003)(356005)(110136005)(7696005)(40480700001)(5660300002)(2906002)(36756003)(86362001)(4744005)(316002)(4326008)(44832011)(81166007)(478600001)(8676002)(83380400001)(40460700003)(70586007)(426003)(2616005)(82740400003)(47076005)(36860700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:39.2029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f40cea-e883-4143-296e-08db9db988d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 LICENCE.agere | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/LICENCE.agere b/LICENCE.agere
index c11466cb..1f619911 100644
--- a/LICENCE.agere
+++ b/LICENCE.agere
@@ -2,7 +2,7 @@ agere_sta_fw.bin -- 9.48 Hermes I
 agere_ap_fw.bin  -- 9.48 Hermes I
 
 The above firmware images were compiled from the Agere linux driver
-wl_lkm_718_release.tar.gz, and dumped. The driver is coverred by the
+wl_lkm_718_release.tar.gz, and dumped. The driver is covered by the
 following copyright and software license.
 
  * SOFTWARE LICENSE
-- 
2.25.1

