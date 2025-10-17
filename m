Return-Path: <SRS0=Tycb=42=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4E6CCD195
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Oct 2025 18:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2439C113D0; Fri, 17 Oct 2025 18:56:15 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BD24C4CEE7
	for <linux-firmware@kernel.org>; Fri, 17 Oct 2025 18:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BD24C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbCBTrG3XexFQk3sofKXaHSRaU8RJejdZS8tUd3+HQw19b/B5GZZUyoiGOHfRBHQGynuFiutEI/Vb2TudGaa+BvCgvFdoAieY4jM+2YnHbhcig8h1E/y/QD6bYVzX870M9OwSexyG3wuAQp7RGIk67kiHe2xsZ4VNXTuPW/YankMBrUpnNrwsGmk5qgAQiPboI/1rpS74jjZf2efsUuSaBmpyEvO4VF/yvh68BylxIOENRTY/JivgPNKlS8u1dkkSmwc9oB+tN4FxcQVeBqE+JpfLgU8HsHbnZCKV3xDQ/AYpdzsZyx3gH6FmpVvgwmNA2phl2TQJLaz5pg4DhSHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmquNKLMqhdQimdBSKB/gR4KIewV5E137Gm0y24VPYc=;
 b=H7kS4TRxrvrlRGmEFBWhhxSRAK1j8O+KCIFxZdU6qkaGMpdjflPiZhxlhJAoboubmzioScdFyB48czutDPIKOegCKX2j9iqNfl5eWueJpuEvXrJ+USAlh4agQzIyQQiotyCK/Ohd3DvDJ9mXn8cLiPkoTZ4wnO7ddMSl4Mxp0Bv8Dm+nZP3xJdDOTi0P+X8YAp1Si+Hp+IeV06JCF07aDDUgDzklOG3M0SVeuzVolHKkUkMhAJBdB26/MO6L4i5qZV/BOIfsrQmTJuUJMNREZgePhki1ITS8XioXBWtTPJtrZ8/sCcZnpFaykfbx1ikphVWvNQ6R/1JtPU4Ja36t+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmquNKLMqhdQimdBSKB/gR4KIewV5E137Gm0y24VPYc=;
 b=AOdQliFO0aEVED5tih3BS/eieL6zZa+6RTDjsg/nrZJDLyB6YeSyfpD1wBrhTEARXueRl2jLLPCMAnx/rpz3dLOfTQH+MwMmJsW0GsaDdzU+w2mbwllicwNPxxemTHfpyJwOqLqkAmfjLDTrsy9+jcSxQGz0tiWnOrs14OQOCVOoj/oe9rxqndr8Z9TMjiGAPrXAOaAs1ak5ZhymsQ0COmrCCDv4LK2rjlH0InwHU6YZ+TQlyXSIfS4g6IGydN6shSy6dW2xmHFjQuqLIfPlKOUqCJ3aomSY6YA8BUdFG/9OzAJ7jyyND+nBXcHBrl44OaiMSBnp/9d6Ot+Vv4HbcQ==
Received: from SA9PR13CA0105.namprd13.prod.outlook.com (2603:10b6:806:24::20)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 18:56:09 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::a7) by SA9PR13CA0105.outlook.office365.com
 (2603:10b6:806:24::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.5 via Frontend Transport; Fri,
 17 Oct 2025 18:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 18:56:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 17 Oct
 2025 11:55:53 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 11:55:52 -0700
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <Mario.Limonciello@amd.com>, <linux-firmware@kernel.org>
Subject: [PATCH 2/2] nvidia: add generic bootloader for GSP-enabled systems
Date: Fri, 17 Oct 2025 13:54:44 -0500
Message-ID: <20251017185444.638795-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|IA0PR12MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: e0440646-21ae-4ff7-dc85-08de0daed5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yaFhlb4VGfQl5M6dx/l2WXSdqCr908JGjm5vd2GSVozBkDdjqrr6bEZw3IcA?=
 =?us-ascii?Q?uZd1shcWkjeGMPVeODjVL85/V3UiNlXLA6GxjwhKvx/eDUwvXQDAz9rFrXO2?=
 =?us-ascii?Q?AK6p0l+wvBz7Zo8GC3RTzK/fh8su0TgKo/eNd3v1bYZo6CSHukg3WJjRAMhG?=
 =?us-ascii?Q?m/RM5pjVxTqjUxkPy7NGGC9myXHiDWfeygBv0o8hhmBv+GpQ61/6/uLCKMyZ?=
 =?us-ascii?Q?BWJslnuc9ZuUgNwLxXHZLSme/wvcuBHwIG85FTfec7ErFu9iIDL1gAVDVBbI?=
 =?us-ascii?Q?s4bWpCzPtWj8knjTX8xQNLC3vw5qLgHN9R8I1FXAu4BRtqwH8SgVDWiCy0fl?=
 =?us-ascii?Q?q4eByjzQtguebAa2Ch4yLr35dOO7QHqG7EuaZneei0YOMyJL82yE2dkeZ2CE?=
 =?us-ascii?Q?/GfIURVqnx+rJFGRuJMolpVzHqauQssAnFdeS1UkV5dyZIcHpJK4jV0Tyj6J?=
 =?us-ascii?Q?c4mNDSP02oIOP/Kxy3kmkXYISddfij89ciqgPqlJtPND50zqEpsIB0iKjmP1?=
 =?us-ascii?Q?VDSvc/AzFbU5tLKuqZC/WFx2cQWtVaL5sIeXf+oAp+ltvXpSgDa+Ga3xtugb?=
 =?us-ascii?Q?j2VVjWfIlQo32rqQPSmheTiTzn0SZq+DyupXtt/RxIIpaR2+b88wLdB0QIn4?=
 =?us-ascii?Q?tVdQfoddaG1rKNogaWu8OjaX7Kkm5A4ENk4kPkUK2A2/y1mtRiK+ETyBhS26?=
 =?us-ascii?Q?abPc3c/Bscz/WK9MEpokJiYs//IJVClve7eakXi1Pr88XJy0CQS+DuYP6Kox?=
 =?us-ascii?Q?i19BEx1CUZ9MNE894hYvfb0Rh1wFf7EB+0cQPjvbd3/YmoLTwOuKZ3ZXcnHw?=
 =?us-ascii?Q?XpoKhkoTNA/t7rNLqjYPsoztVi7CsY0u/OFazHIykPKwz3Ufcmp9bs6q7pbu?=
 =?us-ascii?Q?+o2B9AbiyJr1ihJYFcUt3KbOS0wrgA9mHeORlSIllGplai+ElEdbI9YHkWSO?=
 =?us-ascii?Q?YDK10uWlsJlOrJg0Pyv+2l6CNmp0BOTw0luWPwnHt2BPJBGqfvuZo3dBI9Wf?=
 =?us-ascii?Q?WDuDiqQf8e14mZXeGBhOhDTu02dujNDmkPXyVXMRy+6n/WybrUWYh0mbLoMa?=
 =?us-ascii?Q?stsRzadQh0tZiJeNwx+D1ZVbBV1EewF9teJP0xduQr456tDgzFPbddZYH/Pr?=
 =?us-ascii?Q?k/49r1w7AolwReOTYvkLqb34CfxPwsmvub2R9ju5UcPSuuTFyi0ivbvK4ox1?=
 =?us-ascii?Q?qE2OzCHd8xpHXE144ebKJ5RGVshVv2POZoaLqXYHx+I7iJi/kc+J4eIDmkI5?=
 =?us-ascii?Q?Y/eKH+Pi3PZNW4t7iS4qkrUrrjO93SWrLTlI49GCOgCxK2h1Kt7/xJTYkB49?=
 =?us-ascii?Q?DvbMtW/C/ZXO4m8tGpVm9DF6hdvGT9ioUfnLRfvMDFosDzXPMc3jpUOWkcSj?=
 =?us-ascii?Q?j2qn0MRFM0goAIOkkVL84YLi0KtDKGSF5HGvwvn+V4IJlq9FsgZpduQTLmpq?=
 =?us-ascii?Q?iiO2ihcewUYDQUs4bK2TCNGI8ksemr79d6C9euRXGUQwrYfdduHxy4LNTLYk?=
 =?us-ascii?Q?bN20PbUJYvs8ck/uNCg6lXMdCGunjXsTN8Nx08L+XdM7f4hx9OvYC7cgGYwZ?=
 =?us-ascii?Q?K7PbFVzjJ8xDYULWQnE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 18:56:09.2688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0440646-21ae-4ff7-dc85-08de0daed5b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650

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

