Return-Path: <SRS0=0i2T=4W=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B8BCCD183
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Oct 2025 19:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C442C116C6; Mon, 13 Oct 2025 19:26:46 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85D72C4CEFE
	for <linux-firmware@kernel.org>; Mon, 13 Oct 2025 19:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85D72C4CEFE
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6VActIX0IFinkioSx/IJV6lUYQgwLR88ckwcUUA5mvxeyxAtT/8CyDxWD6fXQGC1yuWtQYoYIKB0X58sexd6BwvZ1bTwnyOMM5h5CLT+lQSMaQza/skMt/0iCWcuAuGZIBdp/+w/PUodhjodHUgi3ykAAZ/GS8EGVMDq5rDrZPc25ihYUi1XgwqZfsuDHs2W74bXBw9GV3iDmtBAYym/N+CvoL3TbFzW60LC5ZQf4bA2t1BUQHziGOhNt1jpMRzeE6s2tT6Od2sH/3uy4CbG+0IQTiBCeGxrv7O2JCl7OX8ADBgAC8mFjJtGdiho7ekRxvV11vsVqwjjjwYaj4R1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmquNKLMqhdQimdBSKB/gR4KIewV5E137Gm0y24VPYc=;
 b=wrNL07AGfunfVAE7p0lJaah8uENeMqxP7k2FF/N1QxATaZBmLhy7K3srfFULymI3zGJ1QPbft2NFcM1F/Gb/8LBTf2JmTQhRKjNBUyNAr5npQw0PJHK3k9utt48/b+u49yzjKOm91NvkXfyXclDj8NS6a7j5i4OM+/iBe5vZPEOW1fjA7otSQHTDndBp0tCzr7rw5+F3JIlTfBpOcp+NyN+dM2a/93bfNvr9RlijD4En6lzo9UcsGKGZZAlnM8H/0FoBUJC/YT8sDblQpiqpGRGaRL+yEPXvXealDdrDCmrsFXsSJeHJyEPYnFISBquPxBskwE8TTNnve1EibSYGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmquNKLMqhdQimdBSKB/gR4KIewV5E137Gm0y24VPYc=;
 b=OkOc+kTQR848pKwVJTRFTpb/etUYX0AZGrS83IE/XY+zvZ/z/FC1jG5Wugo4y2dr8w7IJWFn1Y+p8WxXWcfjpyboV4HQWF1VSeRb7LfIffjpIajOyDDqciYm8nKdukGLJ6PT5xljP6o7X/e92G87i8U/y0Dn7VCL1fgHWj9FyGfDaogG4+dhk70QWGBdRfRQLgVq66KEhDCqSoWCKD6XOLO3Or5GzI/Zv6MtgG9M8I0zdiXE0XBtKIIqWLWUlwbZZcdymsVvMP5oX01IMVHbf5JQU2bhnRvTH1x8kp1QdPmrVEwV+EWTDwHkLHRu9OojsQW3825vGPOAOhxT48Zkig==
Received: from CH5P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::25)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:26:39 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::f8) by CH5P221CA0023.outlook.office365.com
 (2603:10b6:610:1f2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 19:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 19:26:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 13 Oct
 2025 12:26:21 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 12:26:20 -0700
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: [PATCH 2/2] nvidia: add generic bootloader for GSP-enabled systems
Date: Mon, 13 Oct 2025 14:24:33 -0500
Message-ID: <20251013192433.2598700-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013192433.2598700-1-ttabi@nvidia.com>
References: <20251013192433.2598700-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: fdac1ec0-888f-460d-f913-08de0a8e6e0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y/LVsV3fTOxaC+xBfYIGy4eMe23VlMcxZGkfuSjsFKcwDZTEOx81xkqQB/xt?=
 =?us-ascii?Q?jA+ti0wnm1jg/o5qZPJ3M7gDlKc+ieKigCFZOphhzBa3oqZ2fmv2zuvQI9YH?=
 =?us-ascii?Q?4a//QYlOzvk/aByzaIjtx8oXIBLt4QIWeMKuE3ZC2jhCAyBZ8QHs90wG4BWd?=
 =?us-ascii?Q?XlEvBtAztulLZD/lccerscJg8mkICPutXu1usfVMSRT3f4EXA5XYp6jMgRm6?=
 =?us-ascii?Q?mQORPDT9cX7HabnQK9G9WLLR6PH3V7hkGBSZbnnyxzuNH54ZaLY8WWlRlzf8?=
 =?us-ascii?Q?aRbceZWvjypiogFij9GLbnJbbHNkiUU7+UM8F+GCJzJEl2KHnDCaFq9H3iOh?=
 =?us-ascii?Q?O8C6Wg5wRo1MY/Wzu/a+ed04IanXEkY92krEV4EP8E+aca+lGfd7HMA3xwdy?=
 =?us-ascii?Q?bDA77UaEpwl0cJjnO7CLS9lMWasac2CkMqnm4qLn/xzzhTG6e93UDWjlPo55?=
 =?us-ascii?Q?P2hesvKDwkTF7Sf5Uw1PtpG+MnSDNrnuSBzAID8ZhXsvn6hBZLE+85OgwHWU?=
 =?us-ascii?Q?bqa/I488atgVQQaFWCVXo2NBEJAdYd/y90u3bdgnsTkmJ1UFU/g+wAhEXCs5?=
 =?us-ascii?Q?Kf/b5uA/ueHwmvaB0cOMPZ8RKW19GEMr21474Dbe9f9UfUqEAUKP3sT4RKLM?=
 =?us-ascii?Q?jxbAtCuwQ5y/2H8F/XqoCgDecykLESHG8aCbqoGO+ZHqzbI1OuStHxv3psl5?=
 =?us-ascii?Q?any/7ic+FbwDEWEI9SF9j1l1fmpLPIovT8MqIJcAwCJLRvjB9RM8pjsz76po?=
 =?us-ascii?Q?WQQO265yjO0ff1+U8UpwSf2Hqaj1kuHY9TUeZ2hw+t6egHZGs9OLhoM9zYew?=
 =?us-ascii?Q?qTgfkhtRhOEay1Pril0vCMKG7MZJzoQef8+NJybBKrtPlp1me64zlzzfjtDt?=
 =?us-ascii?Q?5ns9myVdK3Ssac/sd9Ami4lqrnp7ktaIcPUiip3Va20lxNH118+aXOJa5PLb?=
 =?us-ascii?Q?gezLTD7LFUtAyKiaj50ya3AZALRtlcXoTD9BHfPids1akrbL5agMa8Rps9ml?=
 =?us-ascii?Q?6w/BOOcBu+vjlD+DMKwANfnH3z/yS2wj++i+U+koiBXO2NX8FDRcYX3umrdW?=
 =?us-ascii?Q?+JCLFqmDo0BYvznRHcyKmP0srPzq0fZiwMQ4glLXN8KMJ8X+fdV2pUSs8rqs?=
 =?us-ascii?Q?CK571fhxuyzu4Zs91PwrX2/gydzwJJpKX6X1ienlIsmO56CEeeSnDr2ICGth?=
 =?us-ascii?Q?sbmHzuEysKXUyBR/anc+qdBKtyly6z16C2sts8OVZJ0KBDkWfEfLsqzdgbO/?=
 =?us-ascii?Q?tSDNacZj8ZuU6ewVTamIoQ7jay96TWDOqNmV63xKjUvD+aX7EgWvMcJ15eTN?=
 =?us-ascii?Q?o4fnQ731n5/DxLbR8/+M/3uJmcjCSsMLeQQDzaYbSR0GBtTRfXb9kO1rex88?=
 =?us-ascii?Q?pj8VXy/qOIjuE9PlVLRdMNlTGSqFT+o07CcW1lWaV+Y+hZRzAAjxDFsLXDLB?=
 =?us-ascii?Q?1ns8hfZ2tW1nqTtr3CuEiesYN17ev/ErCquXeVONcAnSf8xAGmmRBKfKpW43?=
 =?us-ascii?Q?H4QruXpbxLJGvgBslYgb/qcBXpWAc/kp8XpfPFyGfsClbwV6owiMFAJLuuvZ?=
 =?us-ascii?Q?xohW8ax2g2EA/xE1Sms=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:26:37.9294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdac1ec0-888f-460d-f913-08de0a8e6e0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782

Add the generic bootloader to the GSP directory so that Nouveau and
Nova can use it, instead of borrowing the booloader from the acr/
directory.

On Turing and GA100 systems that boot GSP-RM, the "generic bootloader"
is a small firmware image used to boot FWSEC firmware.  To date, this
image is the same as the "ACR bootloader" in the gp102/acr/ directory.
Nouveau simply grabs that image when it needs to boot FWSEC, even though
it is technically in the wrong directory and not generated from the
OpenRM source files like all of the other firmware files that Nouveau
uses.  All GSP-related firmware images should be in the gsp/ directory.

For the Nova GPU driver, this approach has two problems.

1. Although the generic bootloader hasn't changed since 2016, it is
packaged in OpenRM as a binhex array and could theoretically change
for any future version of GSP-RM.  The current approach that Nouveau
takes would not support this.

2. Borrowing images in other directories is problematic, as the firmware
loading code in Nova expects all images to be in the gsp/ directory.

To remedy both issues, a new build of the generic firmware is introduced
for the 570.144 firmware and placed in the gsp/ directory.  This image
is generated by the extract-firmware-nouveau.py script used to build all
the other linux-firmware images.  This new image, although slightly
different in composition, is interchangeable with the acr/bl.bin image.

A generic bootloader for r535 is not included, because Nova does not
support r535 and that firmware version is also deprecated for Nouveau.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 WHENCE                                      |   3 +++
 nvidia/tu102/gsp/gen_bootloader-570.144.bin | Bin 0 -> 816 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 nvidia/tu102/gsp/gen_bootloader-570.144.bin

diff --git a/WHENCE b/WHENCE
index 5da99f80..1aab9007 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5785,12 +5785,15 @@ File: nvidia/ga102/gsp/gsp-535.113.01.bin
 Origin: gsp_ga10x.bin from NVIDIA-Linux-x86_64-535.113.01.run
 Link: nvidia/ad102/gsp/gsp-535.113.01.bin -> ../../ga102/gsp/gsp-535.113.01.bin
 
+File: nvidia/tu102/gsp/gen_bootloader-570.144.bin
 File: nvidia/tu102/gsp/bootloader-570.144.bin
 File: nvidia/tu102/gsp/booter_load-570.144.bin
 File: nvidia/tu102/gsp/booter_unload-570.144.bin
+Link: nvidia/tu116/gsp/gen_bootloader-570.144.bin -> ../../tu102/gsp/gen_bootloader-570.144.bin
 File: nvidia/tu116/gsp/booter_load-570.144.bin
 File: nvidia/tu116/gsp/booter_unload-570.144.bin
 Link: nvidia/tu116/gsp/bootloader-570.144.bin -> ../../tu102/gsp/bootloader-570.144.bin
+Link: nvidia/ga100/gsp/gen_bootloader-570.144.bin -> ../../tu102/gsp/gen_bootloader-570.144.bin
 File: nvidia/ga100/gsp/bootloader-570.144.bin
 File: nvidia/ga100/gsp/booter_load-570.144.bin
 File: nvidia/ga100/gsp/booter_unload-570.144.bin
diff --git a/nvidia/tu102/gsp/gen_bootloader-570.144.bin b/nvidia/tu102/gsp/gen_bootloader-570.144.bin
new file mode 100644
index 0000000000000000000000000000000000000000..d7269c05d06638c5c85fd9f0049d9e1c63895d17
GIT binary patch
literal 816
zcmeH@F;Bu!5Xb+N7GDLSR0k3#zk%$garGPM=67&+XVIF}_zKcG5I+DUm7yJ(b<k0C
zabN<Ir)f+2^eVXN?%*Zw{+G+$z2Du~016;efd<KT9v6Wu*KboO$R8EnVHc1pqTaEQ
zAy!(H=AO>GtBJ`wX7IwCrv|^QWm4nqb$+(N?W%l7@WA94U&TIi66VNC=4qL)$<8uc
z;chv)5B-^Slp*b^LzliAK9alk1$&KG2Ed`%QBHwUi=e4D5@}M3i!`+$+lw*YT7MEg
z&#arDXDk4!+|>hN1m`UDZ1OqAvi}!2gM0PhjX9G>UV8yrQ%(^HYfIvUfI?}fi8lPm
zY3G7X<D$-PUCbON%9})7*t3!Ps44n>E=*TR23M%`H<OWdAd!q{JySFd(X5N6894+L
O_2zZD?!Wz|3w#1w)}l55

literal 0
HcmV?d00001

-- 
2.51.0

