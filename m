Return-Path: <SRS0=Ja9M=5L=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962A2CCFA00
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Nov 2025 00:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56FE1C116B1; Mon,  3 Nov 2025 00:58:51 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 190B3C4CEFB
	for <linux-firmware@kernel.org>; Mon,  3 Nov 2025 00:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 190B3C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7M7VipE03snUpyV0+7+EkiYncFq3FpESa51SwLvwlpdeQj10aOzh14khNP4XCn+egndt8X4fls9Vi4X1+h7tHsCFuc7HqRf5mrVAU/dPLyhx9CRPj7C8nnep3nbfHG1jhjb3w/KQtWmdWcujuBeKnafr7KHBbb4jL10pcnM8fQtIjyGK/YpoEvEHh28UlN3/klnwghA4VS+iR6PsuKxb7ZHq2x1J87Yq9hyqAM9huh2tBs+f2+81do1//pdjTGcP3NJKno7QFyaMQ+47ITlL1VQunX982uHUd+3CTHSGU/y5VuoxDQPRbCWEA/4eT1tHMVhCZjcYNriIOx2vVknAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNbnZisSs2CVI//PKKFDUXNnl/Bcwlpg2FonszwHy5w=;
 b=WTZdDabn7eLK06Uozj/o2UKIjdzzq4V7H++1Pcyo482Be5rPLyWc/PzgFW5VvgrciGvRR0+zsUDzqHwWwCmyaY4VTBkRIXJDsXQ0wbi4nha04J55A3XN2n+Mocrkw8jpLXhNkRzHZsVUVCOrOEPvbk6nIWFdtBlcGzM79UZ2kvASl61100vooSW4KjvNt0ZN51GTMUWNKn/EmUKAO6oHSCCyYO1tTv8LsITxMpPJbvvCr9n7a1gZr5SniYBLSAHOzs/wl+NMqXZbAvdPQXLJHNWlyYK6t3y0XlxyJwqgzxkhyEZFcjNvZpqQEzZ64NHYCdiqzcjWPpe5CqVDoGifyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=139.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNbnZisSs2CVI//PKKFDUXNnl/Bcwlpg2FonszwHy5w=;
 b=OtlatICCxlPjRR4sERno9PoiQUHzOQEWuYmBIKOlSUXjRpo4c363O3f+rcl3wkBA9oNniBQI0xNuXvog/NtQEmQVZE9JnBUSf76LDHKgVn1vKnNrzQYA5f0tCTHwYnV2G1QRGQnedrFhtiYkkSPm/J4UE1nY9KkrpghysoMcPv0=
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by PH7PR10MB6281.namprd10.prod.outlook.com (2603:10b6:510:1a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Mon, 3 Nov
 2025 00:58:44 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::ed) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 00:58:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 00:58:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 18:58:40 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 18:58:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 2 Nov 2025 18:58:40 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.35])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A30wboN3254513;
	Sun, 2 Nov 2025 18:58:38 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <baojun.xu@ti.com>, <13564923607@139.com>, <13916275206@139.com>,
	"Shenghao Ding" <shenghao-ding@ti.com>
Subject: [PATCH v2 0/1] linux-firmware: firmware patch check report
Date: Mon, 3 Nov 2025 08:58:32 +0800
Message-ID: <20251103005833.1945-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|PH7PR10MB6281:EE_
X-MS-Office365-Filtering-Correlation-Id: 87556542-c124-4c3e-2ed9-08de1a7422e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F1okOl3leYLdHcRFdeAHQ8mTGUINOpAm4fRJUrAXqJ53GGCKtTESD424spiO?=
 =?us-ascii?Q?XYR94/c/LYuI4/aj97lUdd21BYpEvTxxpz7s8AUjXsJCEcxPqBhMWdEuqqU6?=
 =?us-ascii?Q?whj76bPbi+wiEjwkzh4ptHZcUM1N3POyxW4udEtnjvZyRWa6bBm6sjBgWW1E?=
 =?us-ascii?Q?W9XE/ecG4J2bhcmJ8IOliMK8HNrWxQdriFhOd4dbug/OS1ulA1b/FfDI02Wk?=
 =?us-ascii?Q?Q3KHUKfzwlDgc6BNJw5EOd+4xW0WwmjuXzpCyNJ+LAvRFq/IwlyuzkZ0HW9I?=
 =?us-ascii?Q?omyq7z4cqbySvsHS4HwLTMJc9Hodam6ZGJcTc8zdJphWxqbGmx4dm3/18RBK?=
 =?us-ascii?Q?Xc0s+G4xVZhqN/2Od38CXujJBt2KQZK07HhU0tXO0/0X7+6aryNGFwCKbTlh?=
 =?us-ascii?Q?PFkCojvO8bDFZmlVteUJySK5DWw13bKtonILw/uCPltdulcyRDoOURc3GMcj?=
 =?us-ascii?Q?4aG3z0yyEzgofW6QmEYYRsjaa9x9xNJs7Mf48WctIOw0YXoaiyoL5brr6azA?=
 =?us-ascii?Q?T6p3lJoTPq5VwvwGrtoQhFB6dyD29DNsHhm395YaBRWEyA7e3jsCvZW76F2a?=
 =?us-ascii?Q?DgP8qpv2ZCd0HoH2u/+gcHfhAscO8VY/n7I6MHMFW0O05iV9P5aZqA02q02O?=
 =?us-ascii?Q?mSRBTzYBPkIe9rWIZrJRhp9z0yLGWqV/SndYQwtdMLUHs9i4HLojTuzfS1/z?=
 =?us-ascii?Q?vQYGhUdCo06AR8cyNMqLfsx5HAMkNu9LYK9zV1cU91SrtGDxn8EdfCajdOY+?=
 =?us-ascii?Q?SMjHdJE3ub0HolUvkpC8088bGm9m8GJhkAtxbsOgrAE49JolvWvpkkD7YdRy?=
 =?us-ascii?Q?tuFqsGZVa1z5zK1zqd/xALX65u1UTSsYGBU4Tn+ZoJ5Nu2r03lOZp9Z8VxSF?=
 =?us-ascii?Q?JgooRM2IwBU0eUdFHFN+NYc/Pi+LNmz9kPLr12mMSf1E3eKiOuYSa9bwPAjP?=
 =?us-ascii?Q?dzbohRHA4P0QuGCqMYGA5gs2XMwBhWYs3Owc+vI7Yak84CO6fXmFRjbitsUO?=
 =?us-ascii?Q?3BCW/CbaNK5NrpgVeuu+V3pbyw1Xks96Xc4gNQ3qGxSCZ3gboENiX1IEV85E?=
 =?us-ascii?Q?emIrWk5hj6C21B9+vUQDGyTgMu8BLiZL/LAMhITHSb0JYS6OEb4ZLQQjO64F?=
 =?us-ascii?Q?s6W+LuEJb+lVHmwIZKJSakh3Y1mQEyIEhKfo2BiQSYMMHhAiUzOQQ6l581QN?=
 =?us-ascii?Q?mQ7+TJp/maJ+FjtMF4AW5X/Jb0ti5QUIhzauGdzQL1PGV9kqrMqZQ9lYhxow?=
 =?us-ascii?Q?76yR+RC2VA9MdYuw0l0akXYrzV0N4bNT0VTRfSohU94ZmN8WHsEmcwOTo5Wu?=
 =?us-ascii?Q?+udDtAlAfefsdPY88gKlYSXtVuw5vmCxuv08o7mllNYa3wS4UbRwvgQW/jW1?=
 =?us-ascii?Q?2rhn/uC22bAH+Uo4s6sR06yzR6tHDg6esKl603xiAStC4CzWcaaWSOjgwrEt?=
 =?us-ascii?Q?pbHwjmYtPXkGjOP5+7q9sMFZO/cIcBig+wJwThM+LROIL8GQE+dyUEyYSMKZ?=
 =?us-ascii?Q?ZfJEWgXSHDmBxyLXW5JsjNgjjkXgZhLtty0cHxy4+e+66UCEaxNeHogpbDAp?=
 =?us-ascii?Q?UCm0ThK9hAnqygJMqj8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 00:58:43.6134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87556542-c124-4c3e-2ed9-08de1a7422e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6281

 root@LAPTOP-4VMBP1QN:/usr/local/src/fw_new# make check
 Check that executables have shebangs.....................................Passed
 Forbid new submodules....................................................Passed
 Check Yaml...............................................................Passed
 Check for broken symlinks............................(no files to check)Skipped
 Detect Destroyed Symlinks................................................Passed
 shellcheck...............................................................Passed
 black....................................................................Passed
 markdownlint............................................................Skipped
 Check whence.............................................................Passed
 root@LAPTOP-4VMBP1QN:/usr/local/src/fw_new#

Shenghao Ding (1):
  linux-firmware: Create audio folder in ti folder, and move all the
    audio firmwares into it

 WHENCE                                  | 302 ++++++++++++------------
 ti/{ => audio}/tas2563/INT8866RCA2.bin  | Bin
 ti/{ => audio}/tas2563/TAS2XXX3870.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C94.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C95.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C96.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX0C97.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX10A40.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX10A41.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX11540.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX11541.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12040.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12041.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12140.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX12141.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX1EB30.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX1EB31.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX2234.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX2326.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX387D.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX387E.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX387F.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3880.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3881.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3882.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3884.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3886.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38A5.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38A7.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38A8.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38B8.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38B9.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BA.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BB.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BE.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38BF.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38C3.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38CB.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38CD.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D3.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D4.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D5.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38D6.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38DF.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38E0.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX38FD.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX391F.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3920.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX3E300.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3E301.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EE00.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EE01.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EF00.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3EF01.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F000.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F001.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F100.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F101.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F200.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F201.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F300.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX3F301.bin | Bin
 ti/{ => audio}/tas2781/TAS2XXX8DE8.bin  | Bin
 ti/{ => audio}/tas2781/TAS2XXX8DE9.bin  | Bin
 ti/{ => audio}/tas2781/TIAS2781RCA2.bin | Bin
 ti/{ => audio}/tas2781/TIAS2781RCA4.bin | Bin
 ti/{ => audio}/tas2781/TXNW2781RCA0.bin | Bin
 ti/{ => audio}/tas2781/TXNW2781RCA1.bin | Bin
 68 files changed, 151 insertions(+), 151 deletions(-)
 rename ti/{ => audio}/tas2563/INT8866RCA2.bin (100%)
 rename ti/{ => audio}/tas2563/TAS2XXX3870.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C94.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C95.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C96.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX0C97.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX10A40.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX10A41.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX11540.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX11541.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12040.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12041.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12140.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX12141.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX1EB30.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX1EB31.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX2234.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX2326.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX387D.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX387E.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX387F.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3880.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3881.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3882.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3884.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3886.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38A5.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38A7.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38A8.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38B8.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38B9.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BA.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BB.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BE.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38BF.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38C3.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38CB.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38CD.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D3.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D4.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D5.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38D6.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38DF.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38E0.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX38FD.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX391F.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3920.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3E300.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3E301.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EE00.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EE01.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EF00.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3EF01.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F000.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F001.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F100.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F101.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F200.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F201.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F300.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX3F301.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX8DE8.bin (100%)
 rename ti/{ => audio}/tas2781/TAS2XXX8DE9.bin (100%)
 rename ti/{ => audio}/tas2781/TIAS2781RCA2.bin (100%)
 rename ti/{ => audio}/tas2781/TIAS2781RCA4.bin (100%)
 rename ti/{ => audio}/tas2781/TXNW2781RCA0.bin (100%)
 rename ti/{ => audio}/tas2781/TXNW2781RCA1.bin (100%)

-- 
2.43.0

