Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E690C04E69
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB280C433C8; Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D95A6C433CC;
	Tue, 15 Aug 2023 18:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D95A6C433CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiNfp3Wk3ZO3T1bRvEcAlcyDAvQBYJjOZxEeGZqcMK0lm8qhl5RWqgZAHGUx8S+6iqBMFsTK3/LD3JP1xEPVDPNyg2RXaBlBG9xxkyFjmrcRr/ljKglrzeTSH4ypwx+DVp38eaFh2bBLIdvwweNoC+PcHyogLrpYja9r2AsGK+3SROVuWNAz7ICTGDiiHs0+0tD0bj/E8CPlBt/MD/Ht+4N69+V+FANUaLrm2Bz+aNipI/LJYuxR83d3UVuquhSe6gDXRe6Wqt9KKjNpUaUyAvf1Sjf3gr1ts6Ran0IPhUVxyzk8nUaTvThjdr3eWaiHC+n431xpf84bjU8AOiSzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlA4Pq5jku3O7Yko5zISGRYhVzrVhD+sv7E7SJeA43w=;
 b=cJwEVLIk2VFdVHtH8lHI2YDziF/mvqmIH/TVn0aeqAQa5SmLFdaRJ+8HpToNvFNjyHwmtpLxYwmrARh7VKvSuGZYy54iW5/vEf7FGFsHXr0IFsLDliBInuekTLHcs7NhO8NjdF/DEWPNhvLw5ixCyltErwswoNjQqPYxUuS8sQXTaFOQnSs0yXfn64t/ndX/JBc6wiA6IJEqY2zYPWAOqcbtY+KcvOchrMwFXWnMiVDMPueqezQBZiqDWTIkCLJFB5f8w5ghrFoPEckoe+9rKNPYJv1jxv8crk70IxSsmZTx5hn4cNOkJPFKudfH4V9X79YcubTL0RGh32/Op5MrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlA4Pq5jku3O7Yko5zISGRYhVzrVhD+sv7E7SJeA43w=;
 b=p4a+9d0PSNcwUWo14KxJtvYu3/0xtLOEQ77NP+LlaQh5njfLU30dGoB6tfOJijSu13dcu8g/cru8dT9kJF0Uye/V2G0wqYFyv66Rdjkh9384yhiFBN5F2P7qWBugYI7WH3VfH+/WEqemN9gn9XG2EgtdeGhZ6Snl9bdsHLyFH30=
Received: from CH2PR15CA0006.namprd15.prod.outlook.com (2603:10b6:610:51::16)
 by CH3PR12MB9025.namprd12.prod.outlook.com (2603:10b6:610:129::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:40 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:51:cafe::27) by CH2PR15CA0006.outlook.office365.com
 (2603:10b6:610:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:40 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:39 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 08/20] dsp56k: correct typographical error caught by codespell
Date: Tue, 15 Aug 2023 13:00:06 -0500
Message-ID: <20230815180018.25554-9-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|CH3PR12MB9025:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eea80bb-277f-4f2c-cba9-08db9db9898a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jxofEfLjFubcZ982nRQIadj41WUMJqJWBCTuTobUymZIKTxFD01RVGnK6kniGfgrVlTWfXCgT2XjYblpIjqNG3EovRwlLoAILxuxyvZoDnjmbt5FTE4O7VlFrPkHuGgS8cTeS/5QNp/rcK7S07WBjSQqxYXNUwHNPFAJrn7awuaeuJY9maGr4hx2JP41lGB7FfW0wTAhAbzpYRweCUrgrtZrYLZamZo47mkYQTz/+wWkd4oS/8+B2kPog9zrf4U+0fMk8ZwPdnnwBUYd4Qmakeo6a1MN30o1t0zjcQXNGZWgrpvt7yv39e78/UbXWqfK+R6Bs1+ALziFtRcDOT6pfyLA1XAb8OnSfVWfE3lB0CDguhrXWkVZKlqO4tJl48/YeptMPNRqRs4w3/pDlK6sd6DuLrMVZGE465gP6SIxBbnwVB8eiIaI2pmAohZ8DxJnG4vc3mfo/4r2kspeLCfOwSsFtYWZ+aHD7X8Xv1skfSZDdnFLhhv3+D86l441PG1EhTJ+JXlnLmXFo8U04EC59TU2/8AzLGRVE2TVRzv+jykKDnjXXd4wdqppJuvQZ6MD9Rk3KcfYk5C2oa080lxHotUY15YVM/UXVV4N+c/IgMiRfjmQQNruiX904rQx8/2AbwMY82gIL8FpW+KVSR+PQ+P3s4nOBGmYEISdTzIrF25kUUIALexiZvIvJB95iLVv23mXLd/TddZkOvnwkC6hjWFHqIceUzRo2yWoPYpOeIA6/nkM5HoV99e+hdgvKqWrR2deW0V9TZzWakH5eXRshw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(26005)(316002)(336012)(70206006)(426003)(5660300002)(83380400001)(8676002)(450100002)(40460700003)(82740400003)(81166007)(356005)(40480700001)(2906002)(478600001)(44832011)(2616005)(7696005)(16526019)(6666004)(1076003)(41300700001)(4744005)(70586007)(86362001)(47076005)(110136005)(36860700001)(8936002)(36756003)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:40.3736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eea80bb-277f-4f2c-cba9-08db9db9898a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9025

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 dsp56k/concat-bootstrap.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dsp56k/concat-bootstrap.pl b/dsp56k/concat-bootstrap.pl
index b6d90037..b484b70b 100644
--- a/dsp56k/concat-bootstrap.pl
+++ b/dsp56k/concat-bootstrap.pl
@@ -20,7 +20,7 @@ while (<>) {
     } elsif (/^I ([0-9A-F]{6}) (\w+)\n/) {
 	$symbol{$2} = hex($1);
     } else {
-	print STDERR "W: did not recognise line $.\n";
+	print STDERR "W: did not recognize line $.\n";
     }
 }
 
-- 
2.25.1

