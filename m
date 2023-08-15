Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD7C04A94
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66FA6C433C7; Tue, 15 Aug 2023 18:00:48 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C1DFC433D9;
	Tue, 15 Aug 2023 18:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C1DFC433D9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDUuUvItffr0rcix03GgXdxujjHnJjUvNDKsCpoPU2TEGnfqsmatpSyjhxUbZNtLgmx3vvw/6OwpuBJjwGzRoumlDhR7EiK20ptCtfFjVbh1qhPTpa+q99jOuIv1Y3MjEH4uedg5bx80WNVyGe+EZuSVkEyUYs0tOUMvXBDnU/o3WE+vsBq+zjJqC5DvnDofNQhvudGBqe+XG3ryxAsOLN8+x22Qw0gJl0GRrSEFhwHWMyJtjIdisTGU7G4M1lNbEvYvycETT83zqgTH3aAUMsTOK/b7E4RG6R2+la/54ZWdJQiqrHNzjWFpU5lyg1j9ifiEMn7hfkTZiA8a+tI2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlMCG5dlxseoNMdCenJxlm2cvAxzg5L422oV3aAQAII=;
 b=LTC7YO9FnMgZ4E4Yessf9sGS/vTwB6If6VzNDbtyF7NtJun0q9Wfn6ElcK+zVe0PsMlYCP9IGGN9/2Ctah0F5twkVjxQND08nWrgUKJOcOxm40DJWuMTnrOztkqj3FAIADKo8PdtbwSukWO5qPvJSg2emQjCQb+D84SJlVuce07YM/bi3zxogX6MJbqN5Ka7aD9xQxenRluhIYxaOj2nGFpU2jcGo0nvnrhRTzP+pnpU8J7RHSdcAFzD+wer9h5ujP/xVLINWUhwg673VM8Q0QPu0I1TQAiPufiT9KhBw+lvr7F74I6I9NAbKedQDXqk/6ldE7lnVdoVxmaBhydyEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlMCG5dlxseoNMdCenJxlm2cvAxzg5L422oV3aAQAII=;
 b=qw/cdE7MpTNZBALSpJcfon4YHvajXFggL0zJycFTPkOMEkFIGAL+AbwnXscdguIqRHX6MwOXGR8Po+ndHw8lWMFZzXyc7ECMVj7LyfKku3I1r/2ueWdhek7D0W4iZpymg70Cwz7RLXVm7zBjs3w811nk4DPlPRrOk2TEVvJmv1o=
Received: from BYAPR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:c0::42)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:41 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::24) by BYAPR05CA0029.outlook.office365.com
 (2603:10b6:a03:c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:40 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 11/20] kaweth: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:09 -0500
Message-ID: <20230815180018.25554-12-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae21c2e-2d62-49d3-efb0-08db9db98a3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Epyn7cXHBnZqnjFKDHqzpsfKeOd/BVlDSJw4rJguFJJGg7ZYfAbv1hd6AGiZz9sr9u0gxAj7dOCRSZ1AgtvHgOTteujf53geZJU3BuSfl2luYJTfcEMTI6MesNXvXHt6pLiynxnoi9rE01cq/82JgWnD4Ei8zJG+NLKOVgzpeY8I3yVOwah1LAmhbqqTAPIXrij95XzYlj4XHz8ctNMAfTe/G/zNE6FjGna90NhL6dazXG6aSRJgcNdJKe5S1C+h+2RT0L4C2FF5nZdxf2Mdrtttdqj+L9hdidCZRaYM1rIDTfNSfO0Izq2B0gzlaZYsKu4YlBsXBukq8wzBsferDgqaKvdayI1LBWTajNwWFbIAODM/wFc47N5BsA2eav81S2bkGHOzCiYfOHvnXmAbeYKJPcznXSiGTOqUhf7filjT+dd2zpYpXPBMuJtxPYCEO1+mtYNnOYLIcqINz4jhx2opxaoHNzVlpwfdDjmg4w+G/HP1Mq7ZlcaIM8Lt+RMw05+gCmlLuYoZznGUihnNGCooBf3b1D0lhNNKhMhhBgWEfQQHIOGv8aEBvShfCFnVw6rtX/Wf4byuZWwg/tLDjg58luhrtCSwAelWyuGMjgNklvJLwrBmYUpkV++p520LqF3Jah7mOz/4j3V8Gx2LkGw+YWPQoxuNDPWgLLkWek2gPG4TOADwg+atDuDY7aabGPX7tGSKIvh68Ik9e3KUkMHNHoC827PSUBMomG+ad6XaPAphdi0hcFor2vn6yP72Y8jMFzr8roYw0zvFhIC4uA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(110136005)(70206006)(316002)(44832011)(70586007)(450100002)(2616005)(40460700003)(7696005)(36756003)(6666004)(336012)(4744005)(1076003)(26005)(41300700001)(83380400001)(426003)(47076005)(5660300002)(4326008)(8936002)(82740400003)(86362001)(8676002)(81166007)(2906002)(40480700001)(16526019)(478600001)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:41.5279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae21c2e-2d62-49d3-efb0-08db9db98a3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 LICENCE.kaweth | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/LICENCE.kaweth b/LICENCE.kaweth
index 75a59c01..5706cb9e 100644
--- a/LICENCE.kaweth
+++ b/LICENCE.kaweth
@@ -9,7 +9,7 @@ are met:
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. All advertising materials mentioning features or use of this software
-   must display the following acknowledgement:
+   must display the following acknowledgment:
        This product includes software developed by Kawasaki LSI.
 4. Neither the name of the company nor the names of its contributors
    may be used to endorse or promote products derived from this software
-- 
2.25.1

