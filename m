Return-Path: <SRS0=Ja9M=5L=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69639CCF9E3
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Nov 2025 00:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42611C4CEFB; Mon,  3 Nov 2025 00:58:52 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED131C4CEF7
	for <linux-firmware@kernel.org>; Mon,  3 Nov 2025 00:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED131C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc513jHYdRKXiQR/yUwRqXx/WNHpEG+F/mdepdnr9CMHp/1of64RkqSNjxXB/ikDVMqK4Yxj1ERqK4fHtaPcuObj5sF0EByJx1vq8xww3EmtxaKpKXiA6YMM9wLDBaHB2EVm+RDRL9GHV8kLs6Ts41POjnA51jq2Y8HeUy9OwqYUAXJkiHaGEnB7L8oM0jMs8J/0Mvp5Ml6U8ogROtsRuyLYUCJkUT/GMZ0zTCoP5X838P6tDjFbGhvvEJmlUkE3Km+CBnqCVGcYOLSSrYdpm4qMBi8gfr6Pxwpr/UVQtMbehwca56edevcBj4XbjmgBIro5rYuDG3bS+zVnK0YHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+c2Mil1CSi9Kkii9LddX51EYeP84nj/NaDmQhoWsYA=;
 b=oJjowXttjKDGsl3FdMlU2/97b2+chEZdplIylG5YHi/bTYR01jp2oQ/A6zKnaRcBlrru34D01DQGmaUgUpQfyFoxW5yzzBV0kxBGlxKaN3t6ACaCTIF3byY2EPcKd2lDl7W8z4aataDvb3ucBEKPENY9rQdN/hEvaMNZtA43Tdsu7ORMGBGqzXwuh51n2jHKS+8KCUY8pAEQRuebidsFmkUUkyLQJNwMYp/EDRChw8mwyqQeWAbpxU74N2pzM08DhtQ8XkN2ZpZbM2g35rnEucp2iDEh9hy64SyhVpIG6Zjw0ZX4ovrkj5l6reGdlSSPfMXL0KzYG84KttXNKZvrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=139.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+c2Mil1CSi9Kkii9LddX51EYeP84nj/NaDmQhoWsYA=;
 b=Am81piHfX/FPZ0dgs0lixeaXCoKpb4X0JwC+WB60Net4u0IQpPpFE1EGBlHz+XRKfm76834OVTlnnrcX1UGdGwHEkuFOFJSp/0tU97EfbH9Q0Vw6xKJTp7kJGZztptJ6rw7Mms7Ocewg79DfvwFFxE7dXIStwCgiajw2Sw0LRwY=
Received: from BYAPR06CA0038.namprd06.prod.outlook.com (2603:10b6:a03:14b::15)
 by SA3PR10MB6998.namprd10.prod.outlook.com (2603:10b6:806:31c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 00:58:46 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::dd) by BYAPR06CA0038.outlook.office365.com
 (2603:10b6:a03:14b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 00:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 00:58:44 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 18:58:43 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 18:58:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 2 Nov 2025 18:58:43 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.35])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A30wboO3254513;
	Sun, 2 Nov 2025 18:58:41 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <baojun.xu@ti.com>, <13564923607@139.com>, <13916275206@139.com>,
	"Shenghao Ding" <shenghao-ding@ti.com>
Subject: [PATCH v2 1/1] linux-firmware: Create audio folder in ti folder, and move all the audio firmwares into it
Date: Mon, 3 Nov 2025 08:58:33 +0800
Message-ID: <20251103005833.1945-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251103005833.1945-1-shenghao-ding@ti.com>
References: <20251103005833.1945-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SA3PR10MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: ff663ed1-0542-47ae-dfa8-08de1a7423ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TauTLv+AUgVjz+eVP2xGcZYjhC2dNHXRyYNi3YCfPUlGKZJaNciqClHtEDW1?=
 =?us-ascii?Q?0XvBanHUnKppieeGOrJLPvc9oxUSLSw47WMkHa94FWkWmyQl63uFcPwaIhsI?=
 =?us-ascii?Q?y/HbYdbeqOyz6uBmc857CTws6vDhF37Z8P5g3cG9JaX3jqo9odTE/eGhMlSY?=
 =?us-ascii?Q?wloyfN4KViPHrPxBNJl/13OSPd/TR7mljl1qFsboambe17Ew8DuiVgax7AsI?=
 =?us-ascii?Q?wPR79LFAal1SFdr5Vft4hF1E5pWkMKoksCSN+ZtzQF/7ZcsWorgi9cGdnpC/?=
 =?us-ascii?Q?MyIeFp9IrEt0ojOLKC2nHTtkP9ptyinOj1LvEQEHEbZJjNOf+pW2/D/5wWlo?=
 =?us-ascii?Q?pJ33zE2hlw+V70yoaWMCs4S/OmvauGc/E68RzE3/3OpyorhMOqouHgk1HKa5?=
 =?us-ascii?Q?GzUbxTwBnIsJC3pZERQg0ga45T7gMm6tymbD9PuUzqpj5oBm5PoBwcxzJzW1?=
 =?us-ascii?Q?jicR8J52TyU2Z3cUusy2omejLG2ovFn+U12CBNh1fmTyh5c9/Mi6WQgLrpQq?=
 =?us-ascii?Q?3U/ylRk8+G7WfO1AVPMNry1KS5Pt4HX/f6kV0IyCu0Z8cDhEzMuD5kfVMVkJ?=
 =?us-ascii?Q?7opa42HkKSFAWhXqFshB6NUhCy3GsLhjco5tKFbEjesQ2v2vHNQLsDpVYeo6?=
 =?us-ascii?Q?XGF+ePxc9kNtNQbFJw2E8Lb2K5IsZCyuJAVU6LROhEMdWdlhmBfcBYM6A1LW?=
 =?us-ascii?Q?ineS8Q/8pnz1rew9nY6ugyEl5rr8V3BnsFCjD6YlJTU1oHmDDgzubrNgj0OR?=
 =?us-ascii?Q?eWwNlvzIWYEzveER+DKfpErL8T996f/NrO2BSay4AS0SwZDSk5YGveItCR/r?=
 =?us-ascii?Q?ihYRItSGTgkkYOXTvIRsVxY51gIz4lach83meusLvjcT3wEHM5YPeUeQjPkR?=
 =?us-ascii?Q?qMnnSSt3crjwDGXGX+15OtcMsWcgHyAy+YkYC2+glfEAji2auEB04zq+pVCt?=
 =?us-ascii?Q?4KKg/cGQUp1OKopTn2P0QY4o1b2OC0tXgX7vvA9C4zroL+Cev8HR+rh1P+P5?=
 =?us-ascii?Q?Ny7xXj2O4tcbz4Zux/3n3xTDwoJviEMp2KrmEWPV+HXOWbctIMk2LAruLLG4?=
 =?us-ascii?Q?e9lB/O2vcUOvXGZc65rCecKcC7rA/P2eQzufagfFy3avL5C9ZGBo7AQ5FBy7?=
 =?us-ascii?Q?IGqakrtIitQUYcs44sO8gY5dLkcWP1rIpyLGHmfnD5bK99Y8XmJBLzPQDWJn?=
 =?us-ascii?Q?lYUUyrJjLbi7QIxufWPW3bT1vNpILbVbmj0MuclUvZeZH5pqWQZPjSKhKzYy?=
 =?us-ascii?Q?pmsHPusxk9wJiSc2DY61/3+3tNHJ/BlXM7atW3Pn5HLt/Pz6D4Yqw1HOMoSL?=
 =?us-ascii?Q?7KECkr98qs9I72GPy3tqvaewrXWsF/eSE8fvx7j2ZLWIsuWIZfichoZj7Jvt?=
 =?us-ascii?Q?CqheJx7wypkuak4ouRaN89dDkcbpohk55DsV9ZFwUlCkuC/3RTOKpgXGCUVC?=
 =?us-ascii?Q?+Ru0DwMR1ptyYfLvOEhToBZ8LyYaAxY+iQEIF5Arad0XDpUpwhlgKY4ooeEB?=
 =?us-ascii?Q?LLZx/nR+BPKz7jJMB6EWWYKYod8i6YQH5IqwBO8l9gzNveF0U2NoaHVDWNUz?=
 =?us-ascii?Q?5tcvvNBt826dyfyi3V0=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 00:58:44.8905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff663ed1-0542-47ae-dfa8-08de1a7423ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6998

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Rewrite the comments.
v1:
 - Create the audio folder in ti in order to only store auido firmware.
 - Move all the audio firmware into the newly-created audio folder.
 - Update the year to 2025.
---
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

diff --git a/WHENCE b/WHENCE
index 21458863..2aed5c16 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8555,165 +8555,165 @@ Originates from https://github.com/linux-msm/audioreach-topology.git
 
 --------------------------------------------------------------------------
 Driver: ti-tas2781 - tas2781 firmware
-File: ti/tas2781/TAS2XXX0C94.bin
-File: ti/tas2781/TAS2XXX0C95.bin
-File: ti/tas2781/TAS2XXX0C96.bin
-File: ti/tas2781/TAS2XXX0C97.bin
-File: ti/tas2781/TAS2XXX10A40.bin
-File: ti/tas2781/TAS2XXX10A41.bin
-File: ti/tas2781/TAS2XXX11540.bin
-File: ti/tas2781/TAS2XXX11541.bin
-File: ti/tas2781/TAS2XXX12040.bin
-File: ti/tas2781/TAS2XXX12041.bin
-File: ti/tas2781/TAS2XXX12140.bin
-File: ti/tas2781/TAS2XXX12141.bin
-File: ti/tas2781/TAS2XXX1EB30.bin
-File: ti/tas2781/TAS2XXX1EB31.bin
-File: ti/tas2781/TAS2XXX2234.bin
-File: ti/tas2781/TAS2XXX2326.bin
-File: ti/tas2781/TAS2XXX387D.bin
-File: ti/tas2781/TAS2XXX387E.bin
-File: ti/tas2781/TAS2XXX387F.bin
-File: ti/tas2781/TAS2XXX3880.bin
-File: ti/tas2781/TAS2XXX3881.bin
-File: ti/tas2781/TAS2XXX3882.bin
-File: ti/tas2781/TAS2XXX3884.bin
-File: ti/tas2781/TAS2XXX3886.bin
-File: ti/tas2781/TAS2XXX38A5.bin
-File: ti/tas2781/TAS2XXX38A7.bin
-File: ti/tas2781/TAS2XXX38A8.bin
-File: ti/tas2781/TAS2XXX38B8.bin
-File: ti/tas2781/TAS2XXX38B9.bin
-File: ti/tas2781/TAS2XXX38BA.bin
-File: ti/tas2781/TAS2XXX38BB.bin
-File: ti/tas2781/TAS2XXX38BE.bin
-File: ti/tas2781/TAS2XXX38BF.bin
-File: ti/tas2781/TAS2XXX38C3.bin
-File: ti/tas2781/TAS2XXX38CB.bin
-File: ti/tas2781/TAS2XXX38CD.bin
-File: ti/tas2781/TAS2XXX38D3.bin
-File: ti/tas2781/TAS2XXX38D4.bin
-File: ti/tas2781/TAS2XXX38D5.bin
-File: ti/tas2781/TAS2XXX38D6.bin
-File: ti/tas2781/TAS2XXX38DF.bin
-File: ti/tas2781/TAS2XXX38E0.bin
-File: ti/tas2781/TAS2XXX38FD.bin
-File: ti/tas2781/TAS2XXX391F.bin
-File: ti/tas2781/TAS2XXX3920.bin
-File: ti/tas2781/TAS2XXX3E300.bin
-File: ti/tas2781/TAS2XXX3E301.bin
-File: ti/tas2781/TAS2XXX3EE00.bin
-File: ti/tas2781/TAS2XXX3EE01.bin
-File: ti/tas2781/TAS2XXX3EF00.bin
-File: ti/tas2781/TAS2XXX3EF01.bin
-File: ti/tas2781/TAS2XXX3F000.bin
-File: ti/tas2781/TAS2XXX3F001.bin
-File: ti/tas2781/TAS2XXX3F100.bin
-File: ti/tas2781/TAS2XXX3F101.bin
-File: ti/tas2781/TAS2XXX3F200.bin
-File: ti/tas2781/TAS2XXX3F201.bin
-File: ti/tas2781/TAS2XXX3F300.bin
-File: ti/tas2781/TAS2XXX3F301.bin
-File: ti/tas2781/TAS2XXX8DE8.bin
-File: ti/tas2781/TAS2XXX8DE9.bin
-File: ti/tas2781/TXNW2781RCA0.bin
-File: ti/tas2781/TXNW2781RCA1.bin
-File: ti/tas2781/TIAS2781RCA2.bin
-File: ti/tas2781/TIAS2781RCA4.bin
-Link: TAS2XXX0C94.bin -> ti/tas2781/TAS2XXX0C94.bin
-Link: TAS2XXX0C95.bin -> ti/tas2781/TAS2XXX0C95.bin
-Link: TAS2XXX0C96.bin -> ti/tas2781/TAS2XXX0C96.bin
-Link: TAS2XXX0C97.bin -> ti/tas2781/TAS2XXX0C97.bin
-Link: TAS2XXX103C8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
-Link: TAS2XXX103C8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
-Link: TAS2XXX103C8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
-Link: TAS2XXX103C8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
-Link: TAS2XXX103C8DE8-0.bin -> ti/tas2781/TAS2XXX8DE8.bin
-Link: TAS2XXX103C8DE8-1.bin -> ti/tas2781/TAS2XXX8DE8.bin
-Link: TAS2XXX103C8DE9-0.bin -> ti/tas2781/TAS2XXX8DE9.bin
-Link: TAS2XXX103C8DE9-1.bin -> ti/tas2781/TAS2XXX8DE9.bin
-Link: TAS2XXX10A40.bin -> ti/tas2781/TAS2XXX10A40.bin
-Link: TAS2XXX10A41.bin -> ti/tas2781/TAS2XXX10A41.bin
-Link: TAS2XXX11540.bin -> ti/tas2781/TAS2XXX11540.bin
-Link: TAS2XXX11541.bin -> ti/tas2781/TAS2XXX11541.bin
-Link: TAS2XXX12040.bin -> ti/tas2781/TAS2XXX12040.bin
-Link: TAS2XXX12041.bin -> ti/tas2781/TAS2XXX12041.bin
-Link: TAS2XXX12140.bin -> ti/tas2781/TAS2XXX12140.bin
-Link: TAS2XXX12141.bin -> ti/tas2781/TAS2XXX12141.bin
-Link: TAS2XXX1EB3.bin -> ti/tas2781/TAS2XXX1EB30.bin
-Link: TAS2XXX1EB30.bin -> ti/tas2781/TAS2XXX1EB30.bin
-Link: TAS2XXX1EB31.bin -> ti/tas2781/TAS2XXX1EB31.bin
-Link: TAS2XXX2234.bin -> ti/tas2781/TAS2XXX2234.bin
-Link: TAS2XXX2326.bin -> ti/tas2781/TAS2XXX2326.bin
-Link: TAS2XXX387D.bin -> ti/tas2781/TAS2XXX387D.bin
-Link: TAS2XXX387E.bin -> ti/tas2781/TAS2XXX387E.bin
-Link: TAS2XXX387F.bin -> ti/tas2781/TAS2XXX387F.bin
-Link: TAS2XXX3880.bin -> ti/tas2781/TAS2XXX3880.bin
-Link: TAS2XXX3881.bin -> ti/tas2781/TAS2XXX3881.bin
-Link: TAS2XXX3882.bin -> ti/tas2781/TAS2XXX3882.bin
-Link: TAS2XXX3884.bin -> ti/tas2781/TAS2XXX3884.bin
-Link: TAS2XXX3886.bin -> ti/tas2781/TAS2XXX3886.bin
-Link: TAS2XXX38A5.bin -> ti/tas2781/TAS2XXX38A5.bin
-Link: TAS2XXX38A7.bin -> ti/tas2781/TAS2XXX38A7.bin
-Link: TAS2XXX38A8.bin -> ti/tas2781/TAS2XXX38A8.bin
-Link: TAS2XXX38B8.bin -> ti/tas2781/TAS2XXX38B8.bin
-Link: TAS2XXX38B9.bin -> ti/tas2781/TAS2XXX38B9.bin
-Link: TAS2XXX38BA.bin -> ti/tas2781/TAS2XXX38BA.bin
-Link: TAS2XXX38BB.bin -> ti/tas2781/TAS2XXX38BB.bin
-Link: TAS2XXX38BE.bin -> ti/tas2781/TAS2XXX38BE.bin
-Link: TAS2XXX38BF.bin -> ti/tas2781/TAS2XXX38BF.bin
-Link: TAS2XXX38C3.bin -> ti/tas2781/TAS2XXX38C3.bin
-Link: TAS2XXX38CB.bin -> ti/tas2781/TAS2XXX38CB.bin
-Link: TAS2XXX38CD.bin -> ti/tas2781/TAS2XXX38CD.bin
-Link: TAS2XXX38D3.bin -> ti/tas2781/TAS2XXX38D3.bin
-Link: TAS2XXX38D4.bin -> ti/tas2781/TAS2XXX38D4.bin
-Link: TAS2XXX38D5.bin -> ti/tas2781/TAS2XXX38D5.bin
-Link: TAS2XXX38D6.bin -> ti/tas2781/TAS2XXX38D6.bin
-Link: TAS2XXX38DF.bin -> ti/tas2781/TAS2XXX38DF.bin
-Link: TAS2XXX38E0.bin -> ti/tas2781/TAS2XXX38E0.bin
-Link: TAS2XXX38FD.bin -> ti/tas2781/TAS2XXX38FD.bin
-Link: TAS2XXX391F.bin -> ti/tas2781/TAS2XXX391F.bin
-Link: TAS2XXX3920.bin -> ti/tas2781/TAS2XXX3920.bin
-Link: TAS2XXX3E300.bin -> ti/tas2781/TAS2XXX3E300.bin
-Link: TAS2XXX3E301.bin -> ti/tas2781/TAS2XXX3E301.bin
-Link: TAS2XXX3EE00.bin -> ti/tas2781/TAS2XXX3EE00.bin
-Link: TAS2XXX3EE01.bin -> ti/tas2781/TAS2XXX3EE01.bin
-Link: TAS2XXX3EF00.bin -> ti/tas2781/TAS2XXX3EF00.bin
-Link: TAS2XXX3EF01.bin -> ti/tas2781/TAS2XXX3EF01.bin
-Link: TAS2XXX3F000.bin -> ti/tas2781/TAS2XXX3F000.bin
-Link: TAS2XXX3F001.bin -> ti/tas2781/TAS2XXX3F001.bin
-Link: TAS2XXX3F100.bin -> ti/tas2781/TAS2XXX3F100.bin
-Link: TAS2XXX3F101.bin -> ti/tas2781/TAS2XXX3F101.bin
-Link: TAS2XXX3F200.bin -> ti/tas2781/TAS2XXX3F200.bin
-Link: TAS2XXX3F201.bin -> ti/tas2781/TAS2XXX3F201.bin
-Link: TAS2XXX3F300.bin -> ti/tas2781/TAS2XXX3F300.bin
-Link: TAS2XXX3F301.bin -> ti/tas2781/TAS2XXX3F301.bin
-Link: TAS2XXX8DE8.bin -> ti/tas2781/TAS2XXX8DE8.bin
-Link: TAS2XXX8DE9.bin -> ti/tas2781/TAS2XXX8DE9.bin
-Link: TAS2XXX8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
-Link: TAS2XXX8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
-Link: TAS2XXX8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
-Link: TAS2XXX8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
-Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
-Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
-Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA0.bin
-Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA1.bin
-Link: TXNW2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
-Link: TXNW2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+File: ti/audio/tas2781/TAS2XXX0C94.bin
+File: ti/audio/tas2781/TAS2XXX0C95.bin
+File: ti/audio/tas2781/TAS2XXX0C96.bin
+File: ti/audio/tas2781/TAS2XXX0C97.bin
+File: ti/audio/tas2781/TAS2XXX10A40.bin
+File: ti/audio/tas2781/TAS2XXX10A41.bin
+File: ti/audio/tas2781/TAS2XXX11540.bin
+File: ti/audio/tas2781/TAS2XXX11541.bin
+File: ti/audio/tas2781/TAS2XXX12040.bin
+File: ti/audio/tas2781/TAS2XXX12041.bin
+File: ti/audio/tas2781/TAS2XXX12140.bin
+File: ti/audio/tas2781/TAS2XXX12141.bin
+File: ti/audio/tas2781/TAS2XXX1EB30.bin
+File: ti/audio/tas2781/TAS2XXX1EB31.bin
+File: ti/audio/tas2781/TAS2XXX2234.bin
+File: ti/audio/tas2781/TAS2XXX2326.bin
+File: ti/audio/tas2781/TAS2XXX387D.bin
+File: ti/audio/tas2781/TAS2XXX387E.bin
+File: ti/audio/tas2781/TAS2XXX387F.bin
+File: ti/audio/tas2781/TAS2XXX3880.bin
+File: ti/audio/tas2781/TAS2XXX3881.bin
+File: ti/audio/tas2781/TAS2XXX3882.bin
+File: ti/audio/tas2781/TAS2XXX3884.bin
+File: ti/audio/tas2781/TAS2XXX3886.bin
+File: ti/audio/tas2781/TAS2XXX38A5.bin
+File: ti/audio/tas2781/TAS2XXX38A7.bin
+File: ti/audio/tas2781/TAS2XXX38A8.bin
+File: ti/audio/tas2781/TAS2XXX38B8.bin
+File: ti/audio/tas2781/TAS2XXX38B9.bin
+File: ti/audio/tas2781/TAS2XXX38BA.bin
+File: ti/audio/tas2781/TAS2XXX38BB.bin
+File: ti/audio/tas2781/TAS2XXX38BE.bin
+File: ti/audio/tas2781/TAS2XXX38BF.bin
+File: ti/audio/tas2781/TAS2XXX38C3.bin
+File: ti/audio/tas2781/TAS2XXX38CB.bin
+File: ti/audio/tas2781/TAS2XXX38CD.bin
+File: ti/audio/tas2781/TAS2XXX38D3.bin
+File: ti/audio/tas2781/TAS2XXX38D4.bin
+File: ti/audio/tas2781/TAS2XXX38D5.bin
+File: ti/audio/tas2781/TAS2XXX38D6.bin
+File: ti/audio/tas2781/TAS2XXX38DF.bin
+File: ti/audio/tas2781/TAS2XXX38E0.bin
+File: ti/audio/tas2781/TAS2XXX38FD.bin
+File: ti/audio/tas2781/TAS2XXX391F.bin
+File: ti/audio/tas2781/TAS2XXX3920.bin
+File: ti/audio/tas2781/TAS2XXX3E300.bin
+File: ti/audio/tas2781/TAS2XXX3E301.bin
+File: ti/audio/tas2781/TAS2XXX3EE00.bin
+File: ti/audio/tas2781/TAS2XXX3EE01.bin
+File: ti/audio/tas2781/TAS2XXX3EF00.bin
+File: ti/audio/tas2781/TAS2XXX3EF01.bin
+File: ti/audio/tas2781/TAS2XXX3F000.bin
+File: ti/audio/tas2781/TAS2XXX3F001.bin
+File: ti/audio/tas2781/TAS2XXX3F100.bin
+File: ti/audio/tas2781/TAS2XXX3F101.bin
+File: ti/audio/tas2781/TAS2XXX3F200.bin
+File: ti/audio/tas2781/TAS2XXX3F201.bin
+File: ti/audio/tas2781/TAS2XXX3F300.bin
+File: ti/audio/tas2781/TAS2XXX3F301.bin
+File: ti/audio/tas2781/TAS2XXX8DE8.bin
+File: ti/audio/tas2781/TAS2XXX8DE9.bin
+File: ti/audio/tas2781/TXNW2781RCA0.bin
+File: ti/audio/tas2781/TXNW2781RCA1.bin
+File: ti/audio/tas2781/TIAS2781RCA2.bin
+File: ti/audio/tas2781/TIAS2781RCA4.bin
+Link: TAS2XXX0C94.bin -> ti/audio/tas2781/TAS2XXX0C94.bin
+Link: TAS2XXX0C95.bin -> ti/audio/tas2781/TAS2XXX0C95.bin
+Link: TAS2XXX0C96.bin -> ti/audio/tas2781/TAS2XXX0C96.bin
+Link: TAS2XXX0C97.bin -> ti/audio/tas2781/TAS2XXX0C97.bin
+Link: TAS2XXX103C8DE80.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX103C8DE81.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX103C8DE90.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX103C8DE91.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX103C8DE8-0.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX103C8DE8-1.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX103C8DE9-0.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX103C8DE9-1.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX10A40.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
+Link: TAS2XXX10A41.bin -> ti/audio/tas2781/TAS2XXX10A41.bin
+Link: TAS2XXX11540.bin -> ti/audio/tas2781/TAS2XXX11540.bin
+Link: TAS2XXX11541.bin -> ti/audio/tas2781/TAS2XXX11541.bin
+Link: TAS2XXX12040.bin -> ti/audio/tas2781/TAS2XXX12040.bin
+Link: TAS2XXX12041.bin -> ti/audio/tas2781/TAS2XXX12041.bin
+Link: TAS2XXX12140.bin -> ti/audio/tas2781/TAS2XXX12140.bin
+Link: TAS2XXX12141.bin -> ti/audio/tas2781/TAS2XXX12141.bin
+Link: TAS2XXX1EB3.bin -> ti/audio/tas2781/TAS2XXX1EB30.bin
+Link: TAS2XXX1EB30.bin -> ti/audio/tas2781/TAS2XXX1EB30.bin
+Link: TAS2XXX1EB31.bin -> ti/audio/tas2781/TAS2XXX1EB31.bin
+Link: TAS2XXX2234.bin -> ti/audio/tas2781/TAS2XXX2234.bin
+Link: TAS2XXX2326.bin -> ti/audio/tas2781/TAS2XXX2326.bin
+Link: TAS2XXX387D.bin -> ti/audio/tas2781/TAS2XXX387D.bin
+Link: TAS2XXX387E.bin -> ti/audio/tas2781/TAS2XXX387E.bin
+Link: TAS2XXX387F.bin -> ti/audio/tas2781/TAS2XXX387F.bin
+Link: TAS2XXX3880.bin -> ti/audio/tas2781/TAS2XXX3880.bin
+Link: TAS2XXX3881.bin -> ti/audio/tas2781/TAS2XXX3881.bin
+Link: TAS2XXX3882.bin -> ti/audio/tas2781/TAS2XXX3882.bin
+Link: TAS2XXX3884.bin -> ti/audio/tas2781/TAS2XXX3884.bin
+Link: TAS2XXX3886.bin -> ti/audio/tas2781/TAS2XXX3886.bin
+Link: TAS2XXX38A5.bin -> ti/audio/tas2781/TAS2XXX38A5.bin
+Link: TAS2XXX38A7.bin -> ti/audio/tas2781/TAS2XXX38A7.bin
+Link: TAS2XXX38A8.bin -> ti/audio/tas2781/TAS2XXX38A8.bin
+Link: TAS2XXX38B8.bin -> ti/audio/tas2781/TAS2XXX38B8.bin
+Link: TAS2XXX38B9.bin -> ti/audio/tas2781/TAS2XXX38B9.bin
+Link: TAS2XXX38BA.bin -> ti/audio/tas2781/TAS2XXX38BA.bin
+Link: TAS2XXX38BB.bin -> ti/audio/tas2781/TAS2XXX38BB.bin
+Link: TAS2XXX38BE.bin -> ti/audio/tas2781/TAS2XXX38BE.bin
+Link: TAS2XXX38BF.bin -> ti/audio/tas2781/TAS2XXX38BF.bin
+Link: TAS2XXX38C3.bin -> ti/audio/tas2781/TAS2XXX38C3.bin
+Link: TAS2XXX38CB.bin -> ti/audio/tas2781/TAS2XXX38CB.bin
+Link: TAS2XXX38CD.bin -> ti/audio/tas2781/TAS2XXX38CD.bin
+Link: TAS2XXX38D3.bin -> ti/audio/tas2781/TAS2XXX38D3.bin
+Link: TAS2XXX38D4.bin -> ti/audio/tas2781/TAS2XXX38D4.bin
+Link: TAS2XXX38D5.bin -> ti/audio/tas2781/TAS2XXX38D5.bin
+Link: TAS2XXX38D6.bin -> ti/audio/tas2781/TAS2XXX38D6.bin
+Link: TAS2XXX38DF.bin -> ti/audio/tas2781/TAS2XXX38DF.bin
+Link: TAS2XXX38E0.bin -> ti/audio/tas2781/TAS2XXX38E0.bin
+Link: TAS2XXX38FD.bin -> ti/audio/tas2781/TAS2XXX38FD.bin
+Link: TAS2XXX391F.bin -> ti/audio/tas2781/TAS2XXX391F.bin
+Link: TAS2XXX3920.bin -> ti/audio/tas2781/TAS2XXX3920.bin
+Link: TAS2XXX3E300.bin -> ti/audio/tas2781/TAS2XXX3E300.bin
+Link: TAS2XXX3E301.bin -> ti/audio/tas2781/TAS2XXX3E301.bin
+Link: TAS2XXX3EE00.bin -> ti/audio/tas2781/TAS2XXX3EE00.bin
+Link: TAS2XXX3EE01.bin -> ti/audio/tas2781/TAS2XXX3EE01.bin
+Link: TAS2XXX3EF00.bin -> ti/audio/tas2781/TAS2XXX3EF00.bin
+Link: TAS2XXX3EF01.bin -> ti/audio/tas2781/TAS2XXX3EF01.bin
+Link: TAS2XXX3F000.bin -> ti/audio/tas2781/TAS2XXX3F000.bin
+Link: TAS2XXX3F001.bin -> ti/audio/tas2781/TAS2XXX3F001.bin
+Link: TAS2XXX3F100.bin -> ti/audio/tas2781/TAS2XXX3F100.bin
+Link: TAS2XXX3F101.bin -> ti/audio/tas2781/TAS2XXX3F101.bin
+Link: TAS2XXX3F200.bin -> ti/audio/tas2781/TAS2XXX3F200.bin
+Link: TAS2XXX3F201.bin -> ti/audio/tas2781/TAS2XXX3F201.bin
+Link: TAS2XXX3F300.bin -> ti/audio/tas2781/TAS2XXX3F300.bin
+Link: TAS2XXX3F301.bin -> ti/audio/tas2781/TAS2XXX3F301.bin
+Link: TAS2XXX8DE8.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX8DE9.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX8DE80.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX8DE81.bin -> ti/audio/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX8DE90.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX8DE91.bin -> ti/audio/tas2781/TAS2XXX8DE9.bin
+Link: TIAS2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
+Link: TIAS2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
+Link: TXNW2781RCA1.bin -> ti/audio/tas2781/TXNW2781RCA0.bin
+Link: TXNW2781RCA0.bin -> ti/audio/tas2781/TXNW2781RCA1.bin
+Link: TXNW2781RCA2.bin -> ti/audio/tas2781/TIAS2781RCA2.bin
+Link: TXNW2781RCA4.bin -> ti/audio/tas2781/TIAS2781RCA4.bin
 
 Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
-	 Copyright (C) 2023 - 2024 Texas Instruments
+	 Copyright (C) 2023 - 2025 Texas Instruments
 
 --------------------------------------------------------------------------
 
 Driver: ti-tas2563 - tas2563 firmware
-File: ti/tas2563/TAS2XXX3870.bin
-File: ti/tas2563/INT8866RCA2.bin
-Link: TAS2XXX3870.bin -> ti/tas2563/TAS2XXX3870.bin
-Link: INT8866RCA2.bin -> ti/tas2563/INT8866RCA2.bin
+File: ti/audio/tas2563/TAS2XXX3870.bin
+File: ti/audio/tas2563/INT8866RCA2.bin
+Link: TAS2XXX3870.bin -> ti/audio/tas2563/TAS2XXX3870.bin
+Link: INT8866RCA2.bin -> ti/audio/tas2563/INT8866RCA2.bin
 
 Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
-	 Copyright (C) 2023 - 2024 Texas Instruments
+	 Copyright (C) 2023 - 2025 Texas Instruments
 
 --------------------------------------------------------------------------
 
diff --git a/ti/tas2563/INT8866RCA2.bin b/ti/audio/tas2563/INT8866RCA2.bin
similarity index 100%
rename from ti/tas2563/INT8866RCA2.bin
rename to ti/audio/tas2563/INT8866RCA2.bin
diff --git a/ti/tas2563/TAS2XXX3870.bin b/ti/audio/tas2563/TAS2XXX3870.bin
similarity index 100%
rename from ti/tas2563/TAS2XXX3870.bin
rename to ti/audio/tas2563/TAS2XXX3870.bin
diff --git a/ti/tas2781/TAS2XXX0C94.bin b/ti/audio/tas2781/TAS2XXX0C94.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX0C94.bin
rename to ti/audio/tas2781/TAS2XXX0C94.bin
diff --git a/ti/tas2781/TAS2XXX0C95.bin b/ti/audio/tas2781/TAS2XXX0C95.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX0C95.bin
rename to ti/audio/tas2781/TAS2XXX0C95.bin
diff --git a/ti/tas2781/TAS2XXX0C96.bin b/ti/audio/tas2781/TAS2XXX0C96.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX0C96.bin
rename to ti/audio/tas2781/TAS2XXX0C96.bin
diff --git a/ti/tas2781/TAS2XXX0C97.bin b/ti/audio/tas2781/TAS2XXX0C97.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX0C97.bin
rename to ti/audio/tas2781/TAS2XXX0C97.bin
diff --git a/ti/tas2781/TAS2XXX10A40.bin b/ti/audio/tas2781/TAS2XXX10A40.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX10A40.bin
rename to ti/audio/tas2781/TAS2XXX10A40.bin
diff --git a/ti/tas2781/TAS2XXX10A41.bin b/ti/audio/tas2781/TAS2XXX10A41.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX10A41.bin
rename to ti/audio/tas2781/TAS2XXX10A41.bin
diff --git a/ti/tas2781/TAS2XXX11540.bin b/ti/audio/tas2781/TAS2XXX11540.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX11540.bin
rename to ti/audio/tas2781/TAS2XXX11540.bin
diff --git a/ti/tas2781/TAS2XXX11541.bin b/ti/audio/tas2781/TAS2XXX11541.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX11541.bin
rename to ti/audio/tas2781/TAS2XXX11541.bin
diff --git a/ti/tas2781/TAS2XXX12040.bin b/ti/audio/tas2781/TAS2XXX12040.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX12040.bin
rename to ti/audio/tas2781/TAS2XXX12040.bin
diff --git a/ti/tas2781/TAS2XXX12041.bin b/ti/audio/tas2781/TAS2XXX12041.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX12041.bin
rename to ti/audio/tas2781/TAS2XXX12041.bin
diff --git a/ti/tas2781/TAS2XXX12140.bin b/ti/audio/tas2781/TAS2XXX12140.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX12140.bin
rename to ti/audio/tas2781/TAS2XXX12140.bin
diff --git a/ti/tas2781/TAS2XXX12141.bin b/ti/audio/tas2781/TAS2XXX12141.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX12141.bin
rename to ti/audio/tas2781/TAS2XXX12141.bin
diff --git a/ti/tas2781/TAS2XXX1EB30.bin b/ti/audio/tas2781/TAS2XXX1EB30.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX1EB30.bin
rename to ti/audio/tas2781/TAS2XXX1EB30.bin
diff --git a/ti/tas2781/TAS2XXX1EB31.bin b/ti/audio/tas2781/TAS2XXX1EB31.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX1EB31.bin
rename to ti/audio/tas2781/TAS2XXX1EB31.bin
diff --git a/ti/tas2781/TAS2XXX2234.bin b/ti/audio/tas2781/TAS2XXX2234.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX2234.bin
rename to ti/audio/tas2781/TAS2XXX2234.bin
diff --git a/ti/tas2781/TAS2XXX2326.bin b/ti/audio/tas2781/TAS2XXX2326.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX2326.bin
rename to ti/audio/tas2781/TAS2XXX2326.bin
diff --git a/ti/tas2781/TAS2XXX387D.bin b/ti/audio/tas2781/TAS2XXX387D.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX387D.bin
rename to ti/audio/tas2781/TAS2XXX387D.bin
diff --git a/ti/tas2781/TAS2XXX387E.bin b/ti/audio/tas2781/TAS2XXX387E.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX387E.bin
rename to ti/audio/tas2781/TAS2XXX387E.bin
diff --git a/ti/tas2781/TAS2XXX387F.bin b/ti/audio/tas2781/TAS2XXX387F.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX387F.bin
rename to ti/audio/tas2781/TAS2XXX387F.bin
diff --git a/ti/tas2781/TAS2XXX3880.bin b/ti/audio/tas2781/TAS2XXX3880.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3880.bin
rename to ti/audio/tas2781/TAS2XXX3880.bin
diff --git a/ti/tas2781/TAS2XXX3881.bin b/ti/audio/tas2781/TAS2XXX3881.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3881.bin
rename to ti/audio/tas2781/TAS2XXX3881.bin
diff --git a/ti/tas2781/TAS2XXX3882.bin b/ti/audio/tas2781/TAS2XXX3882.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3882.bin
rename to ti/audio/tas2781/TAS2XXX3882.bin
diff --git a/ti/tas2781/TAS2XXX3884.bin b/ti/audio/tas2781/TAS2XXX3884.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3884.bin
rename to ti/audio/tas2781/TAS2XXX3884.bin
diff --git a/ti/tas2781/TAS2XXX3886.bin b/ti/audio/tas2781/TAS2XXX3886.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3886.bin
rename to ti/audio/tas2781/TAS2XXX3886.bin
diff --git a/ti/tas2781/TAS2XXX38A5.bin b/ti/audio/tas2781/TAS2XXX38A5.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38A5.bin
rename to ti/audio/tas2781/TAS2XXX38A5.bin
diff --git a/ti/tas2781/TAS2XXX38A7.bin b/ti/audio/tas2781/TAS2XXX38A7.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38A7.bin
rename to ti/audio/tas2781/TAS2XXX38A7.bin
diff --git a/ti/tas2781/TAS2XXX38A8.bin b/ti/audio/tas2781/TAS2XXX38A8.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38A8.bin
rename to ti/audio/tas2781/TAS2XXX38A8.bin
diff --git a/ti/tas2781/TAS2XXX38B8.bin b/ti/audio/tas2781/TAS2XXX38B8.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38B8.bin
rename to ti/audio/tas2781/TAS2XXX38B8.bin
diff --git a/ti/tas2781/TAS2XXX38B9.bin b/ti/audio/tas2781/TAS2XXX38B9.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38B9.bin
rename to ti/audio/tas2781/TAS2XXX38B9.bin
diff --git a/ti/tas2781/TAS2XXX38BA.bin b/ti/audio/tas2781/TAS2XXX38BA.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38BA.bin
rename to ti/audio/tas2781/TAS2XXX38BA.bin
diff --git a/ti/tas2781/TAS2XXX38BB.bin b/ti/audio/tas2781/TAS2XXX38BB.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38BB.bin
rename to ti/audio/tas2781/TAS2XXX38BB.bin
diff --git a/ti/tas2781/TAS2XXX38BE.bin b/ti/audio/tas2781/TAS2XXX38BE.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38BE.bin
rename to ti/audio/tas2781/TAS2XXX38BE.bin
diff --git a/ti/tas2781/TAS2XXX38BF.bin b/ti/audio/tas2781/TAS2XXX38BF.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38BF.bin
rename to ti/audio/tas2781/TAS2XXX38BF.bin
diff --git a/ti/tas2781/TAS2XXX38C3.bin b/ti/audio/tas2781/TAS2XXX38C3.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38C3.bin
rename to ti/audio/tas2781/TAS2XXX38C3.bin
diff --git a/ti/tas2781/TAS2XXX38CB.bin b/ti/audio/tas2781/TAS2XXX38CB.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38CB.bin
rename to ti/audio/tas2781/TAS2XXX38CB.bin
diff --git a/ti/tas2781/TAS2XXX38CD.bin b/ti/audio/tas2781/TAS2XXX38CD.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38CD.bin
rename to ti/audio/tas2781/TAS2XXX38CD.bin
diff --git a/ti/tas2781/TAS2XXX38D3.bin b/ti/audio/tas2781/TAS2XXX38D3.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38D3.bin
rename to ti/audio/tas2781/TAS2XXX38D3.bin
diff --git a/ti/tas2781/TAS2XXX38D4.bin b/ti/audio/tas2781/TAS2XXX38D4.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38D4.bin
rename to ti/audio/tas2781/TAS2XXX38D4.bin
diff --git a/ti/tas2781/TAS2XXX38D5.bin b/ti/audio/tas2781/TAS2XXX38D5.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38D5.bin
rename to ti/audio/tas2781/TAS2XXX38D5.bin
diff --git a/ti/tas2781/TAS2XXX38D6.bin b/ti/audio/tas2781/TAS2XXX38D6.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38D6.bin
rename to ti/audio/tas2781/TAS2XXX38D6.bin
diff --git a/ti/tas2781/TAS2XXX38DF.bin b/ti/audio/tas2781/TAS2XXX38DF.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38DF.bin
rename to ti/audio/tas2781/TAS2XXX38DF.bin
diff --git a/ti/tas2781/TAS2XXX38E0.bin b/ti/audio/tas2781/TAS2XXX38E0.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38E0.bin
rename to ti/audio/tas2781/TAS2XXX38E0.bin
diff --git a/ti/tas2781/TAS2XXX38FD.bin b/ti/audio/tas2781/TAS2XXX38FD.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX38FD.bin
rename to ti/audio/tas2781/TAS2XXX38FD.bin
diff --git a/ti/tas2781/TAS2XXX391F.bin b/ti/audio/tas2781/TAS2XXX391F.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX391F.bin
rename to ti/audio/tas2781/TAS2XXX391F.bin
diff --git a/ti/tas2781/TAS2XXX3920.bin b/ti/audio/tas2781/TAS2XXX3920.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3920.bin
rename to ti/audio/tas2781/TAS2XXX3920.bin
diff --git a/ti/tas2781/TAS2XXX3E300.bin b/ti/audio/tas2781/TAS2XXX3E300.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3E300.bin
rename to ti/audio/tas2781/TAS2XXX3E300.bin
diff --git a/ti/tas2781/TAS2XXX3E301.bin b/ti/audio/tas2781/TAS2XXX3E301.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3E301.bin
rename to ti/audio/tas2781/TAS2XXX3E301.bin
diff --git a/ti/tas2781/TAS2XXX3EE00.bin b/ti/audio/tas2781/TAS2XXX3EE00.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3EE00.bin
rename to ti/audio/tas2781/TAS2XXX3EE00.bin
diff --git a/ti/tas2781/TAS2XXX3EE01.bin b/ti/audio/tas2781/TAS2XXX3EE01.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3EE01.bin
rename to ti/audio/tas2781/TAS2XXX3EE01.bin
diff --git a/ti/tas2781/TAS2XXX3EF00.bin b/ti/audio/tas2781/TAS2XXX3EF00.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3EF00.bin
rename to ti/audio/tas2781/TAS2XXX3EF00.bin
diff --git a/ti/tas2781/TAS2XXX3EF01.bin b/ti/audio/tas2781/TAS2XXX3EF01.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3EF01.bin
rename to ti/audio/tas2781/TAS2XXX3EF01.bin
diff --git a/ti/tas2781/TAS2XXX3F000.bin b/ti/audio/tas2781/TAS2XXX3F000.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F000.bin
rename to ti/audio/tas2781/TAS2XXX3F000.bin
diff --git a/ti/tas2781/TAS2XXX3F001.bin b/ti/audio/tas2781/TAS2XXX3F001.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F001.bin
rename to ti/audio/tas2781/TAS2XXX3F001.bin
diff --git a/ti/tas2781/TAS2XXX3F100.bin b/ti/audio/tas2781/TAS2XXX3F100.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F100.bin
rename to ti/audio/tas2781/TAS2XXX3F100.bin
diff --git a/ti/tas2781/TAS2XXX3F101.bin b/ti/audio/tas2781/TAS2XXX3F101.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F101.bin
rename to ti/audio/tas2781/TAS2XXX3F101.bin
diff --git a/ti/tas2781/TAS2XXX3F200.bin b/ti/audio/tas2781/TAS2XXX3F200.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F200.bin
rename to ti/audio/tas2781/TAS2XXX3F200.bin
diff --git a/ti/tas2781/TAS2XXX3F201.bin b/ti/audio/tas2781/TAS2XXX3F201.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F201.bin
rename to ti/audio/tas2781/TAS2XXX3F201.bin
diff --git a/ti/tas2781/TAS2XXX3F300.bin b/ti/audio/tas2781/TAS2XXX3F300.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F300.bin
rename to ti/audio/tas2781/TAS2XXX3F300.bin
diff --git a/ti/tas2781/TAS2XXX3F301.bin b/ti/audio/tas2781/TAS2XXX3F301.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX3F301.bin
rename to ti/audio/tas2781/TAS2XXX3F301.bin
diff --git a/ti/tas2781/TAS2XXX8DE8.bin b/ti/audio/tas2781/TAS2XXX8DE8.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX8DE8.bin
rename to ti/audio/tas2781/TAS2XXX8DE8.bin
diff --git a/ti/tas2781/TAS2XXX8DE9.bin b/ti/audio/tas2781/TAS2XXX8DE9.bin
similarity index 100%
rename from ti/tas2781/TAS2XXX8DE9.bin
rename to ti/audio/tas2781/TAS2XXX8DE9.bin
diff --git a/ti/tas2781/TIAS2781RCA2.bin b/ti/audio/tas2781/TIAS2781RCA2.bin
similarity index 100%
rename from ti/tas2781/TIAS2781RCA2.bin
rename to ti/audio/tas2781/TIAS2781RCA2.bin
diff --git a/ti/tas2781/TIAS2781RCA4.bin b/ti/audio/tas2781/TIAS2781RCA4.bin
similarity index 100%
rename from ti/tas2781/TIAS2781RCA4.bin
rename to ti/audio/tas2781/TIAS2781RCA4.bin
diff --git a/ti/tas2781/TXNW2781RCA0.bin b/ti/audio/tas2781/TXNW2781RCA0.bin
similarity index 100%
rename from ti/tas2781/TXNW2781RCA0.bin
rename to ti/audio/tas2781/TXNW2781RCA0.bin
diff --git a/ti/tas2781/TXNW2781RCA1.bin b/ti/audio/tas2781/TXNW2781RCA1.bin
similarity index 100%
rename from ti/tas2781/TXNW2781RCA1.bin
rename to ti/audio/tas2781/TXNW2781RCA1.bin
-- 
2.43.0

