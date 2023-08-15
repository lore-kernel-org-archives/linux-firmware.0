Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0327DC04A94
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF339C433CA; Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93B97C433C8;
	Tue, 15 Aug 2023 18:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93B97C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDrBsIiqoTinyypo3oGrf9nnc7xOj65RRYFLwjUHA3Jk2mDwc3u9HLmYOYqK3wOr2LFPjhnqkjKXzMrt/kXOzJVEcCFJb0f4+hjOE6exUk00+JeurFVd/6+/7pKwJ6WRvEsCouF88R3jfHH3IumqUEIoq3TVmuzUIIIkXjBujDOwZwQRm2fnM5aUq6zoBuxJ54RTL0s1oCeEkye+hll8EGrjRwmh+Bn5UKQNfGv3rq/4xNZQokWV5zJa5Bvm+DjUzWRdT57lY3FFK5ZF7DbBekYRJxrbMyVSl2AZDYs74fIJQ6jqFfn+zxncBmwM4e9uvaMOgcz9ID53SoDjo/4Q3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Elr7syPRd4X3QndTSyYODAZhPKC/FewpCibC5SSEtw=;
 b=Yl1g3Wpl2gvU6XtMkbToyoF+B9duhrtuBdcWsb2SyzputdVU1g/W06oa+9+qif1eH8A+1gfrVIxj4SvJn3Yn5Z1jTDKxfmk//oquNK7YGNoZosOor8xB8o/sIjT9tv/aKwwCHCAxMo1Q1N16BwjUUxcJ2lcrStVybotmzyDIpcL1YMgH8pWpE2lnAirkm+Po/9c9fkofL821Jfdiog7sCTTZA+dhhQ48mggS0cV399Slt4mjp9W6y6ulT8uM3pVlbGKraaE0uy5zXNMV19T4TkJFGoEpnPeQ/tUgFYWtX0Gjx7YTA0dKz9ohimA77Pyn3VYeGaQALOh5SaE/mFwhxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Elr7syPRd4X3QndTSyYODAZhPKC/FewpCibC5SSEtw=;
 b=WMoOAgoTw6m0HmX32IEiGpURMSsIwnerR4T5CEIUcVnTEuLEFPwjbBgWmIrPbRqFdLxkE2d5HVCHIA3goOjMbkJcmkr3+fy7dBTj/A3zlwB99CeSmyfKN22t44iA91Y4dwLPlU8K41sKEmuKdRAjCDNWKix+PY2AMXORDiAWeWA=
Received: from BYAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:c0::17)
 by MW4PR12MB7333.namprd12.prod.outlook.com (2603:10b6:303:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:39 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::20) by BYAPR05CA0004.outlook.office365.com
 (2603:10b6:a03:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.12 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:38 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 04/20] adsp_sst: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:02 -0500
Message-ID: <20230815180018.25554-5-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|MW4PR12MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b4d78b-3ea2-446c-27bf-08db9db988ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/FEUgDjhNQDJbBOFAZSuFG2pTtvXraqbN/6f2gFIqnGilQJr4WYYYTd/1iTA3W72loQ+p85D43UjXWtf0CxflYiaCeOYBpCXxoz9kFOn9rTZeRn7fFrfHh5/ZmPKSWwIpPdSybe8KK6T3kzn8RlB6hkSZF3zH4rIoraGYja8FGnqNmMtuq5zDy98I2SOn02seU1RU9xz4D+qhrXNvsLTCT9Khm9en86FOURhNGbyrVzZW+qTyh69X/MyIckGn299z4DEzgrLMPCHwX39l/fzmWvo8gqVh312QA71/r1cFO/MzOQQPa6X19ycfyFnFmL3bM2y6kvSepFs7LyE00jng38i33ZwzJEqMr9dnew9QIgu/x9jgy6iUbKVBt39f8qLA4w2aC/qRcofzSnsfZ1Hf5BKIBzMPBq+38+ThUJ/DBekXOErlnCUtz22P03z6kZvxA9PVvUDVc7XwiwYOnNPj1Di2wa45g4i6AGhK8HP1qCQyEGaTIlNH1QueyvTG3KUggbOoAfYUzeBLq7r5bjxb84T7/eSIg4z5Qw3j0bpvukRW83ExZ9cq6FxUzXjWCPi9Dh56L6elf5NB8RLg/3CHLP33rslH9ddCJNpswUZQ2nJGjKdJO2CbqQUcCH+WB7ANQ6JWzbsjY4y/3FR6AuQuj3j02weekC3/3ZYGjFyBKxOXvm23uNwTYPVzocNQeBPNOWDVUwUrMbYBfBJicsSEXEtPxGw94wUnbbGIpw75BY5PkwbCLzquHUFXV43tIGaCfwKuk2u34tCpa0GUYL6dw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(36756003)(110136005)(4744005)(450100002)(82740400003)(41300700001)(70206006)(4326008)(86362001)(70586007)(8676002)(7696005)(44832011)(336012)(40460700003)(16526019)(8936002)(26005)(1076003)(6666004)(5660300002)(426003)(2616005)(2906002)(81166007)(47076005)(478600001)(316002)(356005)(83380400001)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:39.1373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b4d78b-3ea2-446c-27bf-08db9db988ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7333

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 LICENCE.adsp_sst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/LICENCE.adsp_sst b/LICENCE.adsp_sst
index c66b1b20..25ba8491 100644
--- a/LICENCE.adsp_sst
+++ b/LICENCE.adsp_sst
@@ -1,4 +1,4 @@
-***** INTEL BINARY FIRMWARE RELEASE LICENCE ********************************
+***** INTEL BINARY FIRMWARE RELEASE LICENSE ********************************
 
 Copyright (c) 2014-15 Intel Corporation.
 All rights reserved.
@@ -42,7 +42,7 @@ ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 
-***** NEW LIBC LICENCE********************************
+***** NEW LIBC LICENSE********************************
 
 The newlib subdirectory is a collection of software from several sources.
 
-- 
2.25.1

