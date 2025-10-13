Return-Path: <SRS0=0i2T=4W=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51F9CCD183
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Oct 2025 19:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9AADAC4CEF8; Mon, 13 Oct 2025 19:26:42 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61EDEC4CEE7
	for <linux-firmware@kernel.org>; Mon, 13 Oct 2025 19:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61EDEC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtYBbDJB5mY41QbI+NhXke/uGG+CyMblhyG7xzXKlPZEXgGN/IqHRr3u3sRhWeOD6HKwXN5yM7FRp7HHgdWUX7TBRTvpPyzPwqhILYe/oAdviTMH1TgtsFzv1bfQQCOSi0ijquIccK5iPuA9tvfQa6oZ5VplY/81RFwu0p/puc25vNXn+YbPEcbH/BM+WvWzBbG2QtUZ3GS3NRBeiS5OAD2kBUA09oRkIF1/w3luaaWCVP+gPwfYSIJovUt4tzEVDtleTo1KiZ+bOVCVReBDYztmGr8N332L7J0/oDf68JHY3MAdc8GJ/f5wTb0vdBd2VHS0IOlWrSq2Q0ARUsf8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2l1XI0kq0tu8B4qLurYX23OtdioKpnXRJ/2aInmQ9s=;
 b=qcX415iB6hjxSz2OIBe/5SEFLjR30UgQwYoQ8wmMVW+MVgw9hLQrrRCSMqmhkXZi12uV0brDR0bweO+lpsLIi9h+blKGshoFRFq9td/ZhFbzuslk0M5vqiSM6gDk7Qy0KiXAdGsAHsB2YUpuKUCYnZgTDaQ4BzAPpCjpxKH8FWwqcdOBDrJUv5toqT1oRJQOJgHqSha14Ll1iiW1zxonC1WG/HeZ/SPxnPqv9NfiivW+ULL0tU1dewcejdZhxQMCE2PZ71lVYUgTO3V3uBNNSFtZ+KFZkA5/D2NyjIHxyDviVeJyTjcIRu+CfB7UfMlmCbR1l/FQAsC7dRy6wSTi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2l1XI0kq0tu8B4qLurYX23OtdioKpnXRJ/2aInmQ9s=;
 b=JW3k30k2vyCp16b+NTOcoJ75oIqL5BUqh39HAcdSNGg2Tb8PNOQL9COB1QXygdEx/vRKLBZDVDpyKaQ0eP3iEywkfoSCkoLzRBDPeVRmFo66CbpEjZ2OvgShOAUW5yN7grpe0ruM9xdKYqjFCFZ4mTvP3hICcQA2sCkB1WaEe12bn0tSaSZzns0gr/bJEK7py789a3XjMwBVLC+cSO6c6AnxA6CRoGI61EArsgMWb0gBudNHscY4X7X6QpD3gC00Qs+6xfIP5Ay3fSGT6GY8FQsLQBdHX76tfydyuf5ZxMBI7lJchFkiaicd5Mv0gH++KB5rOnulyBTpy7d3oYFq6g==
Received: from CH2PR11CA0005.namprd11.prod.outlook.com (2603:10b6:610:54::15)
 by DS0PR12MB7994.namprd12.prod.outlook.com (2603:10b6:8:149::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 13 Oct
 2025 19:26:36 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::b1) by CH2PR11CA0005.outlook.office365.com
 (2603:10b6:610:54::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 19:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 19:26:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 13 Oct
 2025 12:26:20 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 12:26:20 -0700
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: [PATCH 1/2] WHENCE: nvidia: rearrange GSP-RM firmware lines
Date: Mon, 13 Oct 2025 14:24:32 -0500
Message-ID: <20251013192433.2598700-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS0PR12MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: cad909cb-0f3a-42c5-e3f0-08de0a8e6c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yV7bdpQZKj81aKCVO0bChGxQWeo4Gzwluombv+Ll5aujjjck1VE4T9xTkFqL?=
 =?us-ascii?Q?Z0oibSGWbFJH2UYEGzdlzASA7y+fuZjp0GHO8FzrGukVXN9VLoFUzqZdKiqH?=
 =?us-ascii?Q?NH0+I27+JsjMoS05txc+G5A+PvSc+wzCeJ7Pvp3meRTnYYcNAZJDE/Dm8oeK?=
 =?us-ascii?Q?l+EK1GGNmKJLLPZnHr35Fl4fUeHurS809XWFjCVncOWuFbhwkT/T9WnnImTk?=
 =?us-ascii?Q?OETuTlaYLy0/GXiefHmoCos/uab75CSp9l07PODEj/3JMJSkpLFlXrropZKa?=
 =?us-ascii?Q?GrgE6r/I8VparC/2IKbCRACMwBKsX5dWr0hrk6r/rk8wzVEbXbWgBcv7Fdvf?=
 =?us-ascii?Q?3jtWMMcOIg4UOfov2Is9w4MFLYu41afUjOFpzYEOXZoOPZ6pdjNR7VCklpg/?=
 =?us-ascii?Q?YkXook+6e3cZAwnO5bt9pZBxnNnHtsLenQ7KlDNWcnIJWPWlPoqxpSt3ZeD2?=
 =?us-ascii?Q?npTv5TyIPO5cyCgjOpBK95nymM+lJStkyDX/2jsleGk0rHgzGYdwNG5wapOm?=
 =?us-ascii?Q?S2jnm5qpAfb7w5FhLpa5WoAXP36jvh/9q5yijudKZOG60r96eozzBxHPXmqF?=
 =?us-ascii?Q?b+Wa4RujMnhDU+bExlEmp+eg2xflWCPWJ1nmDlYRdAUWaEHHSzqwpAD2EKNR?=
 =?us-ascii?Q?Z44BshBaR8WOoeCeugrKgX0lTgggPkF5yupdGyquQ+vr5u4QILuywB5fQI41?=
 =?us-ascii?Q?yIT5TvPNbSNJUFfePVHVercTLaPB21hM5znw4IZY7mR54Wl8k8ykIOfgQAGo?=
 =?us-ascii?Q?63Cw38A4pL1VCOkY4EJEDqurpJ2rVXWkjGkqJigvt8iiVlbm9eDVl+J9Jr1b?=
 =?us-ascii?Q?uU7jgkuQtRylvbYSvhwLGAVzsV9c2W6maRFt8D/XNwfK8XW/QQ2ZvF70CxmR?=
 =?us-ascii?Q?gOou7t61y4FskSESltDAIAGb/UwmrK8GJ5X4kiKyD/D8yUBBj1J4zBnfV9jB?=
 =?us-ascii?Q?ZnVcu03kygDmJLNPW4yXsvEteHW4ZExZ1bkRZmxd0MxqElLkwcIuYB3sL5+n?=
 =?us-ascii?Q?yLecjkJe4IzXgqfDTrG7ffFx/QQtpVjTqDfuDiTiunvhvt/iuRtpEFgByOrf?=
 =?us-ascii?Q?YT4KAY79JWhWH5tzpGVAfq3eepXO33eWbFwBn7O0WWg20WKAm9fQhf3IFVJj?=
 =?us-ascii?Q?C3I4LKP3GIzrXLPjE60kcqSbGtvsvhgczwJHsoB8MMdNugIML/yAEvPl1Rky?=
 =?us-ascii?Q?gWn2VAyGltDu8EYTGW88uKNT2T4NkBZpCEpa7gJcnN1GJErEkVjhFcpVeE2F?=
 =?us-ascii?Q?9ii/TmB3O5MO3IqLX/LGjt0GESeaH7GRJqJKTeiAZXNoBw3UaKAKWr+T5EzJ?=
 =?us-ascii?Q?P2sS9nRVvnT1/d5jSUZ1YE+/lOwPJCArzUIC1owYA9WObHxVXqCFMs0lo/xb?=
 =?us-ascii?Q?JLrlUZltNt+xp8T5HDMJ2QeIvWFPNvmMbTsRqkekAuU7xsGyXhEZHI3BVeqn?=
 =?us-ascii?Q?gT7HDoV9D3DvNBrTOzmKkxqwpB0KdQHCIEdmfoIy3MbKPJd0JbsIPo7PLAD1?=
 =?us-ascii?Q?2zEKDTn2WGLD+YscJy5gyB9cpXLlrsmR/WWLBSX9pbqECdG2NnCW2ROBnSa9?=
 =?us-ascii?Q?EKahmJ9xdL88M1NeGOM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:26:35.0944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cad909cb-0f3a-42c5-e3f0-08de0a8e6c59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7994

Group the lines for each version set of GSP-RM firmware files together,
so that they can be more easily removed or updated.

This commit makes no functional changes: the same files are placed in the
same locations, and the same links are created.

Nouveau/Nova use the GSP-RM firmware file, along with several auxilliary
firmware files, to support Nvidia Turing and later GPUs.  As new GPUs are
supported, newer versions of all files must be add to the repository.
Currently, two versions are present: 535.113.01 and 570.144.

To make it easier to add new versions, for distros to stop including older
versions, we regroup all of the relevant lines in the WHENCE file by
version, instead of by GPU.

Two things should be noted:

1. Some distros are apparently unable to handle changes to WHENCE where a
file is replaced with a symlink, or vice versa.

2. Most GPUs are just minor variants, and so these GPUs are represented
only by symlinks.

This means that care must be taken if a future firmware version includes
a new file for a GPU variant that was previously represented by a link.
Conversely, if a new version of file happens to be identical to another
file, it should not be replaced with a symlink.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 WHENCE | 84 ++++++++++++++++++++++++++++------------------------------
 1 file changed, 40 insertions(+), 44 deletions(-)

diff --git a/WHENCE b/WHENCE
index 8b0d17b5..5da99f80 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5763,72 +5763,50 @@ Firmware images needed for GSP-RM:
 File: nvidia/tu102/gsp/bootloader-535.113.01.bin
 File: nvidia/tu102/gsp/booter_load-535.113.01.bin
 File: nvidia/tu102/gsp/booter_unload-535.113.01.bin
-File: nvidia/tu102/gsp/bootloader-570.144.bin
-File: nvidia/tu102/gsp/booter_load-570.144.bin
-File: nvidia/tu102/gsp/booter_unload-570.144.bin
-Link: nvidia/tu104/gsp -> ../tu102/gsp
-Link: nvidia/tu106/gsp -> ../tu102/gsp
-
 File: nvidia/tu116/gsp/booter_load-535.113.01.bin
 File: nvidia/tu116/gsp/booter_unload-535.113.01.bin
 Link: nvidia/tu116/gsp/bootloader-535.113.01.bin -> ../../tu102/gsp/bootloader-535.113.01.bin
-File: nvidia/tu116/gsp/booter_load-570.144.bin
-File: nvidia/tu116/gsp/booter_unload-570.144.bin
-Link: nvidia/tu116/gsp/bootloader-570.144.bin -> ../../tu102/gsp/bootloader-570.144.bin
-Link: nvidia/tu117/gsp -> ../tu116/gsp
-
 File: nvidia/ga100/gsp/bootloader-535.113.01.bin
 File: nvidia/ga100/gsp/booter_load-535.113.01.bin
 File: nvidia/ga100/gsp/booter_unload-535.113.01.bin
-File: nvidia/ga100/gsp/bootloader-570.144.bin
-File: nvidia/ga100/gsp/booter_load-570.144.bin
-File: nvidia/ga100/gsp/booter_unload-570.144.bin
-
 File: nvidia/ga102/gsp/bootloader-535.113.01.bin
 File: nvidia/ga102/gsp/booter_load-535.113.01.bin
 File: nvidia/ga102/gsp/booter_unload-535.113.01.bin
-File: nvidia/ga102/gsp/bootloader-570.144.bin
-File: nvidia/ga102/gsp/booter_load-570.144.bin
-File: nvidia/ga102/gsp/booter_unload-570.144.bin
-Link: nvidia/ga103/gsp -> ../ga102/gsp
-Link: nvidia/ga104/gsp -> ../ga102/gsp
-Link: nvidia/ga106/gsp -> ../ga102/gsp
-Link: nvidia/ga107/gsp -> ../ga102/gsp
-
 File: nvidia/ad102/gsp/bootloader-535.113.01.bin
 File: nvidia/ad102/gsp/booter_load-535.113.01.bin
 File: nvidia/ad102/gsp/booter_unload-535.113.01.bin
+
+File: nvidia/tu102/gsp/gsp-535.113.01.bin
+Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+Link: nvidia/tu116/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+Link: nvidia/ga100/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
+
+File: nvidia/ga102/gsp/gsp-535.113.01.bin
+Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
+Link: nvidia/ad102/gsp/gsp-535.113.01.bin -> ../../ga102/gsp/gsp-535.113.01.bin
+
+File: nvidia/tu102/gsp/bootloader-570.144.bin
+File: nvidia/tu102/gsp/booter_load-570.144.bin
+File: nvidia/tu102/gsp/booter_unload-570.144.bin
+File: nvidia/tu116/gsp/booter_load-570.144.bin
+File: nvidia/tu116/gsp/booter_unload-570.144.bin
+Link: nvidia/tu116/gsp/bootloader-570.144.bin -> ../../tu102/gsp/bootloader-570.144.bin
+File: nvidia/ga100/gsp/bootloader-570.144.bin
+File: nvidia/ga100/gsp/booter_load-570.144.bin
+File: nvidia/ga100/gsp/booter_unload-570.144.bin
+File: nvidia/ga102/gsp/bootloader-570.144.bin
+File: nvidia/ga102/gsp/booter_load-570.144.bin
+File: nvidia/ga102/gsp/booter_unload-570.144.bin
 File: nvidia/ad102/gsp/bootloader-570.144.bin
 File: nvidia/ad102/gsp/booter_load-570.144.bin
 File: nvidia/ad102/gsp/booter_unload-570.144.bin
 File: nvidia/ad102/gsp/scrubber-570.144.bin
-Link: nvidia/ad103 -> ad102
-Link: nvidia/ad104 -> ad102
-Link: nvidia/ad106 -> ad102
-Link: nvidia/ad107 -> ad102
-
 File: nvidia/gh100/gsp/bootloader-570.144.bin
 File: nvidia/gh100/gsp/fmc-570.144.bin
-
 File: nvidia/gb100/gsp/bootloader-570.144.bin
 File: nvidia/gb100/gsp/fmc-570.144.bin
-Link: nvidia/gb102 -> gb100
-
 File: nvidia/gb202/gsp/bootloader-570.144.bin
 File: nvidia/gb202/gsp/fmc-570.144.bin
-Link: nvidia/gb203 -> gb202
-Link: nvidia/gb205 -> gb202
-Link: nvidia/gb206 -> gb202
-Link: nvidia/gb207 -> gb202
-
-File: nvidia/tu102/gsp/gsp-535.113.01.bin
-Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
-Link: nvidia/tu116/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
-Link: nvidia/ga100/gsp/gsp-535.113.01.bin -> ../../tu102/gsp/gsp-535.113.01.bin
-
-File: nvidia/ga102/gsp/gsp-535.113.01.bin
-Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
-Link: nvidia/ad102/gsp/gsp-535.113.01.bin -> ../../ga102/gsp/gsp-535.113.01.bin
 
 File: nvidia/tu102/gsp/gsp-570.144.bin
 Origin: gsp_tu10x.bin from NVIDIA-Linux-x86_64-570.144.run
@@ -5841,6 +5819,24 @@ Link: nvidia/ad102/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
 Link: nvidia/gh100/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
 Link: nvidia/gb100/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
 Link: nvidia/gb202/gsp/gsp-570.144.bin -> ../../ga102/gsp/gsp-570.144.bin
+
+Link: nvidia/tu104/gsp -> ../tu102/gsp
+Link: nvidia/tu106/gsp -> ../tu102/gsp
+Link: nvidia/tu117/gsp -> ../tu116/gsp
+Link: nvidia/ga103/gsp -> ../ga102/gsp
+Link: nvidia/ga104/gsp -> ../ga102/gsp
+Link: nvidia/ga106/gsp -> ../ga102/gsp
+Link: nvidia/ga107/gsp -> ../ga102/gsp
+Link: nvidia/ad103 -> ad102
+Link: nvidia/ad104 -> ad102
+Link: nvidia/ad106 -> ad102
+Link: nvidia/ad107 -> ad102
+Link: nvidia/gb102 -> gb100
+Link: nvidia/gb203 -> gb202
+Link: nvidia/gb205 -> gb202
+Link: nvidia/gb206 -> gb202
+Link: nvidia/gb207 -> gb202
+
 Licence: Redistributable. See LICENCE.nvidia for details
 
 --------------------------------------------------------------------------

base-commit: 46a6999a2d14a5f2239e7e712e5bbcf543f59034
-- 
2.51.0

