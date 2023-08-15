Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269F3C04A6A
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AD3EC433CD; Tue, 15 Aug 2023 18:00:50 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D938C433A9;
	Tue, 15 Aug 2023 18:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D938C433A9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgR1byuKd6ZlXTg5xB6X4T0hQBeDXG+Hj587QXJvH60wdAU3T1sa7Q0DADspogMJb9cJtjO3d9eOFr5P77qxU23YNyeRZbDNvOEztyt5sXWjwJipK1oReku1baHqtKrdzTaYzW0hDIImIkEhm3k7ek+Z1hG0yGPOQoMuLwehLCPpeS+ZMUexFeD1cNMEDHlbLQnNVOLbUMT2TPonwuthDJlsTk2HdtrP0Ojp60KHDpsDmCLm0RcPM6uAe0axLk2vt7733G2sK1PYkXmhWafsMdUt08M5IQSuXZlLQhKCT5Kfl7QBo+noOZMuT2Cp/9GEABhUb43yIuTrmPmDUVJ3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDObx6Jlm5ldBusPIiz5+6WCLprCYWqJvnYzh12/Jmc=;
 b=aS9C6kcQNi5879aOBX1Dy9g3KA9kSaBN5MRT0e8vKSXcJSokI3m/U+mpgQkvovlCNL+Ai8a7PowUKTx3TtJjlqINUjsLZvgUPt2uwWbVPAgWVNxgsEBZtMlE/y4ItCYBpEDVCywS4J4z9HuwwT3ATrx25QylrIqZ/GWsXKlV73p+yxC97jpt+iFVJPeQ7M5yNLr4hnYtc1CvqaZmXHj0h40fGROmdNXFgUP9PNwzBxJYAUo8sNv6w/O7IlZzSzVVyVqdhwXCEsfXS2Ohnw2lXT9ZbBThmNA1YVN3sxi3mqCIc+ADpM4ZHQG+Yjns2gmx1H5gud0zuIAQcImL1QT1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDObx6Jlm5ldBusPIiz5+6WCLprCYWqJvnYzh12/Jmc=;
 b=XNe/9pgdEeYo5P9vaiSlgUEopjkr0COAjuwfXVDgeukS3G0BoIqOq79DdvumhLvCL6jc1eLLkilHefEz5WJFn/41ipMdoNgPvpjEoYlyAc3M1b2BIvELzXCpAUs/XGRBsr3+Dl0PD7AGISXVX6ifkwKcuxfeHb/pWtM1A5QifSo=
Received: from BYAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:c0::17)
 by CY5PR12MB6156.namprd12.prod.outlook.com (2603:10b6:930:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:43 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::59) by BYAPR05CA0004.outlook.office365.com
 (2603:10b6:a03:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.12 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:42 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 15/20] carl9170fw: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:13 -0500
Message-ID: <20230815180018.25554-16-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CY5PR12MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 86acc186-989b-4915-1ffd-08db9db98b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fh4Tz27ZGgDNejc00WPWXJUwJdNkzRrsIM3qYwzrjfHH4uEGut9+EiFZqJGPqfbRJvCQyctYoySxMrCq2e6sQrzv53FrdwaD4j3neFv53OryNJ8sbV0mUMv7D3gjtzhoPD0ZzvL6l7iekfvR4ill/Erhnwf+93ttVzvXTVVBzK8r689tuu9i3502QYpfVOC5pckCwEJJNN3fBFOBNf5V1ELiVxwzcOZG6ZroH5srLXi0FMvjS4PC02FlVagWdLkxOQFWkQnYbbeXB5CKhVvraEP5uf/o6GwjV9O5WBF8m5PcyAVW3BT7Ly8t7g+rZLXmGpUswPWYsU5YuQh2R3N+Rs9TumOqWq5re02OiIaZlPLcVXXYdwyDJ2YPmeO9VaNvSE38mxeoXPjsuI9nw3HpLY9mupy+81QyezB4qXqDhy431jZ/CFPAkqhXbdXVlfLNR5frU3E6pC8i1GZptQVqX8/8Hrgp1elq8yge8UFig03oC5EpkmJSsoiKvqJQxzzYX//8kNinEmou7s3a4EjrgmOo5T/ugXPTk3FIYziLKcdkpTMUSsmePKsG/dTNCPXhJgoydxjgVxPLMnx/SVLmsCp8yekLqHlDeJ8gYdJCuYb7mmmoEzbrWtIQ3aTBitW3DK6sKTbCu2IcINz94fB8A8j71GFgMqmBqu/jAwOztpzcyl4P59WRsNSkGHHQvozULqGs9Vl+5WC7XZRaJmOCI7ZlJjD1NN3seIe/vTSWBz7b9c3YfteNgersM5+4FZHQcqvQ2w/BrOvjvO5hZ5T4zungd2Hffy9rChDw/EG6bw8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(70206006)(19627235002)(450100002)(8936002)(70586007)(2906002)(86362001)(6666004)(110136005)(40480700001)(2616005)(7696005)(30864003)(26005)(478600001)(44832011)(316002)(1076003)(8676002)(40460700003)(41300700001)(4326008)(426003)(81166007)(5660300002)(83380400001)(356005)(16526019)(47076005)(36756003)(336012)(36860700001)(82740400003)(36900700001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:43.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86acc186-989b-4915-1ffd-08db9db98b2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6156

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 carl9170fw/carlfw/Kconfig                            |  2 +-
 carl9170fw/carlfw/carl9170.lds                       |  4 ++--
 carl9170fw/carlfw/include/dma.h                      |  2 +-
 carl9170fw/carlfw/src/wlan.c                         |  4 ++--
 carl9170fw/carlfw/src/wol.c                          |  2 +-
 carl9170fw/extra/FindGPERF.cmake                     |  2 +-
 carl9170fw/extra/FindPackageHandleStandardArgs.cmake |  8 ++++----
 carl9170fw/include/shared/fwcmd.h                    |  2 +-
 carl9170fw/include/shared/phy.h                      |  2 +-
 carl9170fw/tools/carlu/src/fw.c                      |  2 +-
 carl9170fw/tools/carlu/src/test.c                    |  4 ++--
 carl9170fw/tools/carlu/src/usb.c                     |  6 +++---
 carl9170fw/tools/include/frame.h                     | 12 ++++++------
 13 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/carl9170fw/carlfw/Kconfig b/carl9170fw/carlfw/Kconfig
index f42268c4..bc268da3 100644
--- a/carl9170fw/carlfw/Kconfig
+++ b/carl9170fw/carlfw/Kconfig
@@ -155,7 +155,7 @@ config CARL9170FW_NOISY_MAC_RESET
 
 config CARL9170FW_BROKEN_FEATURES
 	def_bool n
-	prompt "Broken Featurs"
+	prompt "Broken Features"
 
 config CARL9170FW_DEBUG
 	def_bool n
diff --git a/carl9170fw/carlfw/carl9170.lds b/carl9170fw/carlfw/carl9170.lds
index 97dda684..9078de9c 100644
--- a/carl9170fw/carlfw/carl9170.lds
+++ b/carl9170fw/carlfw/carl9170.lds
@@ -1,7 +1,7 @@
 /*
- * The carl9170 firwmare gets copied into the device's
+ * The carl9170 firmware gets copied into the device's
  * Program RAM (pram), which has a size of 16K, but
- * also has to accomodate the stack the device uses,
+ * also has to accommodate the stack the device uses,
  * which starts at the top of the 16k, so we pretend
  * that we just have 16256 (16k - 128) of pram.
  *
diff --git a/carl9170fw/carlfw/include/dma.h b/carl9170fw/carlfw/include/dma.h
index 8f3a9df6..c7a50595 100644
--- a/carl9170fw/carlfw/include/dma.h
+++ b/carl9170fw/carlfw/include/dma.h
@@ -313,7 +313,7 @@ static inline __inline unsigned int queue_len(struct dma_queue *q)
 }
 
 /*
- * rearm a completed packet, so it will be processed agian.
+ * rearm a completed packet, so it will be processed again.
  */
 static inline __inline void dma_rearm(struct dma_desc *desc)
 {
diff --git a/carl9170fw/carlfw/src/wlan.c b/carl9170fw/carlfw/src/wlan.c
index d3328d67..87abbdbd 100644
--- a/carl9170fw/carlfw/src/wlan.c
+++ b/carl9170fw/carlfw/src/wlan.c
@@ -587,7 +587,7 @@ static void wlan_send_buffered_ba(void)
 	memset(ba->bitmap, 0x0, sizeof(ba->bitmap));
 
 	/*
-	 * Both, the original firmare and ath9k set the NO ACK flag in
+	 * Both, the original firmware and ath9k set the NO ACK flag in
 	 * the BA Ack Policy subfield.
 	 */
 	ba->control = ctx->control | cpu_to_le16(1);
@@ -711,7 +711,7 @@ static unsigned int wlan_rx_filter(struct dma_desc *desc)
 				/*
 				 * Don't filter block acks when the application
 				 * has queued BARs. This is because the firmware
-				 * can't do the accouting and the application
+				 * can't do the accounting and the application
 				 * has to sort out if the BA belongs to any BARs.
 				 */
 				break;
diff --git a/carl9170fw/carlfw/src/wol.c b/carl9170fw/carlfw/src/wol.c
index 7afb8e52..e8b025ff 100644
--- a/carl9170fw/carlfw/src/wol.c
+++ b/carl9170fw/carlfw/src/wol.c
@@ -46,7 +46,7 @@ void wol_prepare(void)
 	/* set filter policy to: discard everything */
 	fw.wlan.rx_filter = CARL9170_RX_FILTER_EVERYTHING;
 
-	/* reenable rx dma */
+	/* re-enable rx dma */
 	wlan_trigger(AR9170_DMA_TRIGGER_RXQ);
 
 	/* initialize the last_beacon timer */
diff --git a/carl9170fw/extra/FindGPERF.cmake b/carl9170fw/extra/FindGPERF.cmake
index baf87494..ee1cdfcf 100644
--- a/carl9170fw/extra/FindGPERF.cmake
+++ b/carl9170fw/extra/FindGPERF.cmake
@@ -22,7 +22,7 @@
 #  alias for GperfOutput
 #  GPERF_${Name}_INPUT - the gperf source file, an alias for ${GperfInput}
 #
-# Gperf scanners oftenly use tokens  defined by Bison: the code generated
+# Gperf scanners often use tokens  defined by Bison: the code generated
 # by Gperf  depends of the header  generated by Bison.   This module also
 # defines a macro:
 #  ADD_GPERF_BISON_DEPENDENCY(GperfTarget BisonTarget)
diff --git a/carl9170fw/extra/FindPackageHandleStandardArgs.cmake b/carl9170fw/extra/FindPackageHandleStandardArgs.cmake
index ec3440c0..a3c7b256 100644
--- a/carl9170fw/extra/FindPackageHandleStandardArgs.cmake
+++ b/carl9170fw/extra/FindPackageHandleStandardArgs.cmake
@@ -10,20 +10,20 @@
 # the name of the Find-module where it is called (in original casing).
 #
 # The first simple mode looks like this:
-#    FIND_PACKAGE_HANDLE_STANDARD_ARGS(<name> (DEFAULT_MSG|"Custom failure message") <var1>...<varN> )
-# If the variables <var1> to <varN> are all valid, then <UPPERCASED_NAME>_FOUND
+#    FIND_PACKAGE_HANDLE_STANDARD_ARGS(<name> (DEFAULT_MSG|"Custom failure message") <var1>...<warn> )
+# If the variables <var1> to <warn> are all valid, then <UPPERCASED_NAME>_FOUND
 # will be set to TRUE.
 # If DEFAULT_MSG is given as second argument, then the function will generate
 # itself useful success and error messages. You can also supply a custom error message
 # for the failure case. This is not recommended.
 #
 # The second mode is more powerful and also supports version checking:
-#    FIND_PACKAGE_HANDLE_STANDARD_ARGS(NAME [REQUIRED_VARS <var1>...<varN>]
+#    FIND_PACKAGE_HANDLE_STANDARD_ARGS(NAME [REQUIRED_VARS <var1>...<warn>]
 #                                           [VERSION_VAR   <versionvar>
 #                                           [CONFIG_MODE]
 #                                           [FAIL_MESSAGE "Custom failure message"] )
 #
-# As above, if <var1> through <varN> are all valid, <UPPERCASED_NAME>_FOUND
+# As above, if <var1> through <warn> are all valid, <UPPERCASED_NAME>_FOUND
 # will be set to TRUE.
 # After REQUIRED_VARS the variables which are required for this package are listed.
 # Following VERSION_VAR the name of the variable can be specified which holds
diff --git a/carl9170fw/include/shared/fwcmd.h b/carl9170fw/include/shared/fwcmd.h
index 9443c802..f4adca52 100644
--- a/carl9170fw/include/shared/fwcmd.h
+++ b/carl9170fw/include/shared/fwcmd.h
@@ -68,7 +68,7 @@ enum carl9170_cmd_oids {
 	CARL9170_CMD_FREQ_START		= 0x23,
 	CARL9170_CMD_PSM		= 0x24,
 
-	/* Asychronous command flag */
+	/* Asynchronous command flag */
 	CARL9170_CMD_ASYNC_FLAG		= 0x40,
 	CARL9170_CMD_WREG_ASYNC		= (CARL9170_CMD_WREG |
 					   CARL9170_CMD_ASYNC_FLAG),
diff --git a/carl9170fw/include/shared/phy.h b/carl9170fw/include/shared/phy.h
index 024fb42b..f05388d3 100644
--- a/carl9170fw/include/shared/phy.h
+++ b/carl9170fw/include/shared/phy.h
@@ -177,7 +177,7 @@
 #define	AR9170_PHY_REG_BIN_MASK_3		(AR9170_PHY_REG_BASE + 0x0108)
 #define	AR9170_PHY_REG_MASK_CTL			(AR9170_PHY_REG_BASE + 0x010c)
 
-/* analogue power on time (100ns) */
+/* analog power on time (100ns) */
 #define	AR9170_PHY_REG_RX_DELAY			(AR9170_PHY_REG_BASE + 0x0114)
 #define	AR9170_PHY_REG_SEARCH_START_DELAY	(AR9170_PHY_REG_BASE + 0x0118)
 #define		AR9170_PHY_RX_DELAY_DELAY		0x00003fff
diff --git a/carl9170fw/tools/carlu/src/fw.c b/carl9170fw/tools/carlu/src/fw.c
index fa4b3881..c8185fca 100644
--- a/carl9170fw/tools/carlu/src/fw.c
+++ b/carl9170fw/tools/carlu/src/fw.c
@@ -58,7 +58,7 @@ int carlu_fw_check(struct carlu *ar)
 	}
 
 	if (carl9170fw_supports(otus_desc->feature_set, CARL9170FW_UNUSABLE))
-		dbg("Firmware is marked as unuseable.\n");
+		dbg("Firmware is marked as unusable.\n");
 
 	info("Firmware Version: %d.\n", otus_desc->api_ver);
 
diff --git a/carl9170fw/tools/carlu/src/test.c b/carl9170fw/tools/carlu/src/test.c
index bf49559f..8d719b61 100644
--- a/carl9170fw/tools/carlu/src/test.c
+++ b/carl9170fw/tools/carlu/src/test.c
@@ -42,7 +42,7 @@
 void debug_test(void)
 {
 	err("This is an error.\n");
-	warn("This is a warnig.\n");
+	warn("This is a warning.\n");
 	info("This is an informative message.\n");
 	dbg("This is just utter useless babble.\n");
 }
@@ -61,7 +61,7 @@ void carlu_frame_test(struct carlu *ar)
 
 	print_hex_dump_bytes(INFO, "DATA:", frame->data, frame->len);
 
-	print_hex_dump_bytes(INFO, "PAYLOAD:", frame->payload, frame->alloced);
+	print_hex_dump_bytes(INFO, "PAYLOAD:", frame->payload, frame->allocated);
 
 	frame_free(frame);
 }
diff --git a/carl9170fw/tools/carlu/src/usb.c b/carl9170fw/tools/carlu/src/usb.c
index ebc19a92..5314cf31 100644
--- a/carl9170fw/tools/carlu/src/usb.c
+++ b/carl9170fw/tools/carlu/src/usb.c
@@ -53,7 +53,7 @@ static const struct {
 	ADD_DEV(0x0cf3, 0x9170, "Atheros", "9170"),
 	ADD_DEV(0x0cf3, 0x1001, "Atheros", "TG121N"),
 	ADD_DEV(0x0cf3, 0x1002, "TP-Link", "TL-WN821N v2"),
-	ADD_DEV(0xcace, 0x0300, "Cace", "Airpcap NX"),
+	ADD_DEV(0xcace, 0x0300, "Cache", "Airpcap NX"),
 	ADD_DEV(0x07d1, 0x3c10, "D-Link", "DWA 160 A1"),
 	ADD_DEV(0x07d1, 0x3a09, "D-Link", "DWA 160 A2"),
 	ADD_DEV(0x0846, 0x9010, "Netgear", "WNDA3100"),
@@ -188,7 +188,7 @@ static int carlusb_get_dev(struct carlu *ar, bool reset)
 		case 0:
 			break;
 		default:
-			err("failed to aquire exculusive access (%d).\n", err);
+			err("failed to acquire exculusive access (%d).\n", err);
 			goto skip;
 		}
 
@@ -518,7 +518,7 @@ static int carlusb_initialize_rxrings(struct carlu *ar)
 
 		err = libusb_submit_transfer(ar->rx_ring[i]);
 		if (err != 0) {
-			err("==>failed to submit rx buld urb (%d)\n", err);
+			err("==>failed to submit rx build urb (%d)\n", err);
 			return EXIT_FAILURE;
 		}
 	}
diff --git a/carl9170fw/tools/include/frame.h b/carl9170fw/tools/include/frame.h
index f753fe31..cccdc5be 100644
--- a/carl9170fw/tools/include/frame.h
+++ b/carl9170fw/tools/include/frame.h
@@ -46,7 +46,7 @@ struct frame_queue {
  * @dcb: more reserved space for low-level / backend driver
  * @queue: selected frame queue / priority
  * @ref: reference counter
- * @alloced: maximum available space
+ * @allocated: maximum available space
  * @total_len: currently consumed and reserved memory
  * @len: current frame length
  * @head: points to the buffer head
@@ -67,7 +67,7 @@ struct frame {
 
 	unsigned int queue;
 	unsigned int ref;
-	unsigned int alloced;
+	unsigned int allocated;
 	unsigned int total_len;
 	unsigned int len;
 	uint8_t *head;
@@ -91,7 +91,7 @@ static inline void *frame_put(struct frame *frame, unsigned int size)
 {
 	void *tmp;
 
-	BUG_ON(frame->total_len + size > frame->alloced);
+	BUG_ON(frame->total_len + size > frame->allocated);
 
 	frame->len += size;
 	frame->total_len += size;
@@ -99,7 +99,7 @@ static inline void *frame_put(struct frame *frame, unsigned int size)
 	tmp = (void *) frame->tail;
 	frame->tail += size;
 
-	BUG_ON(frame->tail > (frame->payload + frame->alloced));
+	BUG_ON(frame->tail > (frame->payload + frame->allocated));
 
 	return tmp;
 }
@@ -166,7 +166,7 @@ static inline void *frame_pull(struct frame *frame, unsigned int size)
  */
 static inline void frame_reserve(struct frame *frame, unsigned int size)
 {
-	BUG_ON(frame->total_len + size > frame->alloced);
+	BUG_ON(frame->total_len + size > frame->allocated);
 	BUG_ON(frame->len != 0);
 
 	frame->total_len += size;
@@ -210,7 +210,7 @@ static inline struct frame *frame_alloc(unsigned int size)
 		init_list_head(&tmp->dcb.list);
 		tmp->len = 0;
 		tmp->total_len = 0;
-		tmp->alloced = size;
+		tmp->allocated = size;
 
 		tmp->head = tmp->payload;
 		tmp->data = tmp->payload;
-- 
2.25.1

