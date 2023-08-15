Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF5EC04E69
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99B38C433AB; Tue, 15 Aug 2023 18:00:47 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E837C433CC;
	Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E837C433CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdZ08MKl7E3CS9wq+Cc/DTVrPi9khqkMCpuQRD2YX3y5ini0obzsmyTSm9GCoH3dz4UPfWk055i+Fodi1LB9/uPqFP1IwWgXnEGLc50Trq900rxBFh3NhbntfsVxZ8Xr93sluUGOlvB0RJPcvijVqKI0Mk/ZKtrl2pppGgHE4SNl9qxcIYaWRUQUzkPewbdN4OOTfrgW/HYmKlNIpcGwR7xjQvhM2a1pWU4FRqV1GAXcayAJrnK0N22YalRpBx7YKJtmZoPNM6VdJUC0TapHY5hlrumxl7YdeqEMXziM9BZrGKI3Iiw9JNtqE50nzZxyt25m+4imsxxjMdCSic8fSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQpsgi8UYeRSX89eitXnK/V1LF29f/1kaT1BAdx1gO4=;
 b=BMOg8+VYUx4WoAWMTxVA9aLoUIftl/QmJ8l2acyYzMVC1j2b0+0NGeTBuqE0r13XNIhzXByRkULw6Quq2k1xes1KDMfhadYiFezuWm2Ohs0Pl5tKs/Wlx3wEGqXIGxdloIe59bA7SOpzRUz94DXoBZ1mEZlBltVrf9u2XkY6sf/cWsNjjAUEBd7AIZXLEQxL/XdYGQQNWr9wmRgnM542GPiMTNiPzWQBB+yJoZatRnsKQDzpcLTs33kRrbRjsa/Q4KEG9sevWGZdr4nLtBTQZfptkCT+wKor5aS8EdAHSuzxXs+sc3WzkRxRN7PULFlF0JkOz7Islsz6LxrOGZ1Qjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQpsgi8UYeRSX89eitXnK/V1LF29f/1kaT1BAdx1gO4=;
 b=lTpL2pTgODD2w3xNnVJEcfj23Bw79usz3b/hxvDlAa6DDLU2UgsjJ5ej6IrZfdaWBk/UV/ZBN2o0cKKGk+kEsl70WkwJAzhHhfyO25g/ksTcYaVhaa8/L0l0qEtO9wuKWpW3WsteOtaGpyWjVZ7CTmamXfR2R3hoUKk1BUTznNQ=
Received: from CH2PR15CA0002.namprd15.prod.outlook.com (2603:10b6:610:51::12)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:42 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:51:cafe::da) by CH2PR15CA0002.outlook.office365.com
 (2603:10b6:610:51::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:41 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:40 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 09/20] cxgb4: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:07 -0500
Message-ID: <20230815180018.25554-10-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: f65b210a-d244-40c9-285e-08db9db98a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hTM/soHLuajWphPKZFHcigg6Z8f0bfKTj/wrXIlFRG2f02JznabBK3+n9NbluDKoaD8dyhzjPblH8R3nh0N/OA4ty1H6PFwo4ZEsRMPysxw49sa5xUGJNccU4xHchfL4rkRIx9lD5pVkSvWYiJ/sljCNUkpBNVfKhVDBKTwBeFVa+QMHynhZ8KLg/LxKhp24BX/4SsS3KlTF4AESh6MfnFN/V9Zst9eGmUs3XGQQMpY9uZ29LS6b3PgLvkQPbrJBJXakePTFQ/4BSKpvgi2NZ11F9509AkdIi5TD4CWoB1Q16vvyvGvIyt64ueIGNlrE7I+3WiRY+XVvsjnjEw2GrtmqFucd/o45H1/nSTfsSkF3yerDMjv0T+b3tmwCzJLrMdAwZxD7OihaPHxzkyumOBYC7O7pUifk55o9/SZs7d3fwp54L9U7YgaAB/QkxkhOb/YrQElAmVzeWBxtYTvfGTB0eaEnQCk9qfw3i+9O//z64ANFVZSN/hCcHBhCasG4jBvdOuPbD17hedVH9f1Y2+IgBc29grPEhm9lUeIcDqGDUEJzZFtWahw31+xX7kmLhZRXTpy9ob9zvq//nfJplxIftdq6HaJcTJ7SvzvemPyJToDQoToEIm0l1w0gTaTxLt479s4tsVefkxjTRAHaXydMUrmLGGEb0zOspiBaiCHaUFoIpIfeZORmWWvmPWuz+Urux1Nc8mUjvqaWWgHOBxxzXTPauWJWJBU2ICjRKyavjAYL9E/IJ3D6GIpxx5WhuzkLhjyaYaBMk0KYrtbRoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(36756003)(110136005)(450100002)(82740400003)(41300700001)(70206006)(4326008)(86362001)(70586007)(8676002)(7696005)(44832011)(336012)(40460700003)(16526019)(8936002)(26005)(1076003)(6666004)(5660300002)(426003)(2616005)(2906002)(81166007)(47076005)(478600001)(316002)(356005)(83380400001)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:41.2017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f65b210a-d244-40c9-285e-08db9db98a09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 cxgb4/configs/t4-config-default.txt    | 6 +++---
 cxgb4/configs/t5-config-default.txt    | 6 +++---
 cxgb4/configs/t5-config-hashfilter.txt | 6 +++---
 cxgb4/configs/t6-config-default.txt    | 6 +++---
 cxgb4/configs/t6-config-hashfilter.txt | 8 ++++----
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/cxgb4/configs/t4-config-default.txt b/cxgb4/configs/t4-config-default.txt
index 1774b4d9..b758fc5e 100644
--- a/cxgb4/configs/t4-config-default.txt
+++ b/cxgb4/configs/t4-config-default.txt
@@ -17,7 +17,7 @@
 # finite.  This requires balancing the configuration/operation needs of
 # device drivers across OSes and a large number of customer application.
 #
-# Some of the more important resources to allocate and their constaints are:
+# Some of the more important resources to allocate and their constraints are:
 #  1. Virtual Interfaces: 128.
 #  2. Ingress Queues with Free Lists: 1024.  PCI-E SR-IOV Virtual Functions
 #     must use a power of 2 Ingress Queues.
@@ -275,7 +275,7 @@
 # to directly select the type of Physical Function to which they wish to be
 # attached.
 #
-# Note that the actual values used for the PCI-E Intelectual Property will be
+# Note that the actual values used for the PCI-E Intellectual Property will be
 # 1 less than those below since that's the way it "counts" things.  For
 # readability, we use the number we actually mean ...
 #
@@ -491,7 +491,7 @@
 
 # MPS features a 196608 bytes ingress buffer that is used for ingress buffering
 # for packets from the wire as well as the loopback path of the L2 switch. The
-# folling params control how the buffer memory is distributed and the L2 flow
+# following params control how the buffer memory is distributed and the L2 flow
 # control settings:
 #
 # bg_mem:	%-age of mem to use for port/buffer group
diff --git a/cxgb4/configs/t5-config-default.txt b/cxgb4/configs/t5-config-default.txt
index 44fdfad7..352af3c0 100644
--- a/cxgb4/configs/t5-config-default.txt
+++ b/cxgb4/configs/t5-config-default.txt
@@ -18,7 +18,7 @@
 # are finite.  This requires balancing the configuration/operation needs of
 # device drivers across OSes and a large number of customer application.
 #
-# Some of the more important resources to allocate and their constaints are:
+# Some of the more important resources to allocate and their constraints are:
 #  1. Virtual Interfaces: 256.
 #  2. Ingress Queues with Free Lists: 1024.
 #  3. Egress Queues: 128K.
@@ -310,7 +310,7 @@
 # to directly select the type of Physical Function to which they wish to be
 # attached.
 #
-# Note that the actual values used for the PCI-E Intelectual Property will be
+# Note that the actual values used for the PCI-E Intellectual Property will be
 # 1 less than those below since that's the way it "counts" things.  For
 # readability, we use the number we actually mean ...
 #
@@ -540,7 +540,7 @@
 
 # MPS features a 196608 bytes ingress buffer that is used for ingress buffering
 # for packets from the wire as well as the loopback path of the L2 switch. The
-# folling params control how the buffer memory is distributed and the L2 flow
+# following params control how the buffer memory is distributed and the L2 flow
 # control settings:
 #
 # bg_mem:	%-age of mem to use for port/buffer group
diff --git a/cxgb4/configs/t5-config-hashfilter.txt b/cxgb4/configs/t5-config-hashfilter.txt
index e106f24b..38e8ef4b 100644
--- a/cxgb4/configs/t5-config-hashfilter.txt
+++ b/cxgb4/configs/t5-config-hashfilter.txt
@@ -18,7 +18,7 @@
 # are finite.  This requires balancing the configuration/operation needs of
 # device drivers across OSes and a large number of customer application.
 #
-# Some of the more important resources to allocate and their constaints are:
+# Some of the more important resources to allocate and their constraints are:
 #  1. Virtual Interfaces: 256.
 #  2. Ingress Queues with Free Lists: 1024.
 #  3. Egress Queues: 128K.
@@ -316,7 +316,7 @@
 # to directly select the type of Physical Function to which they wish to be
 # attached.
 #
-# Note that the actual values used for the PCI-E Intelectual Property will be
+# Note that the actual values used for the PCI-E Intellectual Property will be
 # 1 less than those below since that's the way it "counts" things.  For
 # readability, we use the number we actually mean ...
 #
@@ -408,7 +408,7 @@
 
 # MPS features a 196608 bytes ingress buffer that is used for ingress buffering
 # for packets from the wire as well as the loopback path of the L2 switch. The
-# folling params control how the buffer memory is distributed and the L2 flow
+# following params control how the buffer memory is distributed and the L2 flow
 # control settings:
 #
 # bg_mem:	%-age of mem to use for port/buffer group
diff --git a/cxgb4/configs/t6-config-default.txt b/cxgb4/configs/t6-config-default.txt
index b0145ab2..bc000316 100644
--- a/cxgb4/configs/t6-config-default.txt
+++ b/cxgb4/configs/t6-config-default.txt
@@ -18,7 +18,7 @@
 # are finite.  This requires balancing the configuration/operation needs of
 # device drivers across OSes and a large number of customer application.
 #
-# Some of the more important resources to allocate and their constaints are:
+# Some of the more important resources to allocate and their constraints are:
 #  1. Virtual Interfaces: 256.
 #  2. Ingress Queues with Free Lists: 1024.
 #  3. Egress Queues: 128K.
@@ -327,7 +327,7 @@
 # to directly select the type of Physical Function to which they wish to be
 # attached.
 #
-# Note that the actual values used for the PCI-E Intelectual Property will be
+# Note that the actual values used for the PCI-E Intellectual Property will be
 # 1 less than those below since that's the way it "counts" things.  For
 # readability, we use the number we actually mean ...
 #
@@ -556,7 +556,7 @@
 
 # MPS features a 196608 bytes ingress buffer that is used for ingress buffering
 # for packets from the wire as well as the loopback path of the L2 switch. The
-# folling params control how the buffer memory is distributed and the L2 flow
+# following params control how the buffer memory is distributed and the L2 flow
 # control settings:
 #
 # bg_mem:	%-age of mem to use for port/buffer group
diff --git a/cxgb4/configs/t6-config-hashfilter.txt b/cxgb4/configs/t6-config-hashfilter.txt
index f8c78210..921a30d2 100644
--- a/cxgb4/configs/t6-config-hashfilter.txt
+++ b/cxgb4/configs/t6-config-hashfilter.txt
@@ -18,7 +18,7 @@
 # are finite.  This requires balancing the configuration/operation needs of
 # device drivers across OSes and a large number of customer application.
 #
-# Some of the more important resources to allocate and their constaints are:
+# Some of the more important resources to allocate and their constraints are:
 #  1. Virtual Interfaces: 256.
 #  2. Ingress Queues with Free Lists: 1024.
 #  3. Egress Queues: 128K.
@@ -167,7 +167,7 @@
 
 	# LE_DB_CONFIG
 	reg[0x19c04] = 0x00000000/0x02040000 # LE IPv4 compression disabled
-					     # EXTN_HASH_IPV4 Diable
+					     # EXTN_HASH_IPV4 Disable
 
 	#LE_DB_RSP_CODE_0
 	reg[0x19c74] = 0x00000004/0x0000000f # TCAM_ACTV_HIT = 4
@@ -304,7 +304,7 @@
 # to directly select the type of Physical Function to which they wish to be
 # attached.
 #
-# Note that the actual values used for the PCI-E Intelectual Property will be
+# Note that the actual values used for the PCI-E Intellectual Property will be
 # 1 less than those below since that's the way it "counts" things.  For
 # readability, we use the number we actually mean ...
 #
@@ -393,7 +393,7 @@
 
 # MPS features a 196608 bytes ingress buffer that is used for ingress buffering
 # for packets from the wire as well as the loopback path of the L2 switch. The
-# folling params control how the buffer memory is distributed and the L2 flow
+# following params control how the buffer memory is distributed and the L2 flow
 # control settings:
 #
 # bg_mem:	%-age of mem to use for port/buffer group
-- 
2.25.1

