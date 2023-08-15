Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D6AC001E0
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20ED9C433C8; Tue, 15 Aug 2023 18:00:53 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB04DC433C7;
	Tue, 15 Aug 2023 18:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB04DC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7f+ErSM/Sl0JM8K15WMkQubvGRYiYngfXAoZPv11waWIACZf6Ihlj+/V93zVoTfD2GjsAidnRIrb3mQyfoYUor3/e4BbE5Qxz0opmLyQx5Scmyq5GC2DcbrC7iUNzJxRfSuCzrfbgPmrzNlo67Uq9t7nzQl0oiSRUko7h0ipnBXm9BJIYSKc9i3CsRbwwXX5aES5hvJO3tCqo8oI1g40Cq+DM8TD9NlCRXSnabnAu1l/PPL+BqOH01Wx/kEgHkdcmmSWJPFfGvhcWhl1G29F5KspKsb24chqwJUGfLrhpr44OASs6KW3tD3RAoMs0PNpCu2YJWGZvAHMOPvWXoncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/REvw3g6cW8HzI61JT8rd+tWHrNuAi0e0qobOb1z1A=;
 b=dj6DxPgau5MWg+2oc9Ugguiy0F9rhQShsBEqarGhfJttiFooZmQcFpVvVX3om3Jqc+ftoGay0WkpytDTDmwxqcGiw/IIoEy7ortUyM1OckKe3aegtfqqWXRf3ZPKtHCTRN5uu5Scxo8TVnwGozJXDgLtrmkVR46uXZU/OpN1hp5hfDTnxd72hZlJmS/P9vWB2XLJnqSMMfeE1oZ54OMQiLwIbqjv1G2Ht1VG4A/f69hX5ZZLrCHn773Ce+LAvLWoXh9J1reSnBOCDoBDA9bDrTMNErVrJO1/IW6lxApyW/34d03iGfJsVetDhHDKUSJxdJwWnUCk0JKrENObFFabmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/REvw3g6cW8HzI61JT8rd+tWHrNuAi0e0qobOb1z1A=;
 b=fhMm+bHlsVUE1Jn1V7CxippNRoAjYNj/VQ2JmvrjqNXDM9nG2GTDx36X+qfHxXMd4zU+FF7Dmv72fWaKcr7R4Z9UEz896+hYAVHlhxbSW4Md9mbHzTRsjy3yMtgE6ZtrUju9DtWGWWzXvZZhr/tkey4UEFintkDy5FZgXe2D/Po=
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by PH0PR12MB5647.namprd12.prod.outlook.com (2603:10b6:510:144::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:45 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::58) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:45 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:43 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 19/20] Wire up pre-commit to `make check`
Date: Tue, 15 Aug 2023 13:00:17 -0500
Message-ID: <20230815180018.25554-20-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|PH0PR12MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6ba679-589f-4d5d-3b94-08db9db98c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fs2W2GEpzJQ35H/C2xpCmqwRV9Pl1j0KZdveK4fSSPWVjForBAuESUBjKM4wnOdw0q/IQwxCw2w6HTS5AY4xYOzb/ZpzPS+twCDhsGxnHSnUS3LrtKJ2vKz333+eG86VoMUlTAPoXfF98DxsPxYLCD0Y/JGgs1D3IVj3fF28rrBqSt8TW1jzFb/toMiDqRbqchl6V69+Jt3U0dJk6K7BeCLWf1AyKl822l7gJ28Q1WG+M9Il8FhWnoBBs7D9/Xwe8tmupiN8JVqmdJHJXrDGN9lTD1j7oMznVc4i2Xtb6WrDjuzNdkjPt1YJ2uJ2EEnI3/uPipxJSsn0yrAwHzCgmib9nw48HCBkc1BjegOe6Ao7F6TtKECPUil2fgF55UTvgTusd5oMSDy8RMCnUkUadnu9Rut0hdfdF7gTUl2I/P9r4NRf6KrryDvAOD0WBn5FRagXYgyjTsE7e0jqAAQZQB3v3+dpUkdC0zeJ4D0YnBRWEcXAIyOgUo6YRYkiUVY4Q30hoa4WZ/e21wJFKrCvcevSK+FLXcFs7kwzRPzxsKIirHc4YqudcVAI+ojy1GTinjdbF6z0wSKKIcHAl0jMgLlsGb492wP0CS5eWo63OdSKaILYPkzmv6TZgfRxQwMy4cz5+FFbVX4nAATo/qptEPW/Zm6UJ1n8CVNi9sFWdwcDdwJuoFIc/NWaPIjLaylz95uCFRuMoi+FKI++9ug1PJcpzVjwnYAFMDA8gl65FaEmzz/TXUmdU07v8vG/NJDk4Hk4avAO7z/0QZPdpfblGMVaMpdgjtMAkEqojMC4NOY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(2906002)(8936002)(44832011)(8676002)(4326008)(478600001)(86362001)(83380400001)(110136005)(7696005)(426003)(16526019)(1076003)(450100002)(336012)(47076005)(5660300002)(4744005)(40460700003)(41300700001)(316002)(70206006)(2616005)(36756003)(356005)(70586007)(6666004)(36860700001)(26005)(40480700001)(82740400003)(81166007)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:45.0623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6ba679-589f-4d5d-3b94-08db9db98c56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647

This will let `make check` cover more things than just `WHENCE`.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 50a4c29b..75039ccb 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,11 @@ FIRMWAREDIR = /lib/firmware
 all:
 
 check:
-	@./check_whence.py
+	@if ! which pre-commit >/dev/null; then \
+		echo "Install pre-commit to check files"; \
+		exit 1; \
+	fi
+	@pre-commit run --all-files
 
 install:
 	install -d $(DESTDIR)$(FIRMWAREDIR)
-- 
2.25.1

