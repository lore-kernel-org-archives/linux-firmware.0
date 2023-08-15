Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71775C04E69
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EA2BC433C7; Tue, 15 Aug 2023 18:01:00 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4273C433CD;
	Tue, 15 Aug 2023 18:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4273C433CD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqzHT0wNM2ET4asV49Wb/cn3A0XqdaWZq/4dWo6vsFoBXsXQeMlKPGicS5ogPKWaCCH5z3kgfemKkKnXx6ZTVSFE9UjghOEL4FGGVxtluzbmS+KR1jLzVmy/P2PlKp2QpbzQ22dMfoeehcjimIL87hA0O7WoAhiwDNoDQbYT0TUizQla4yztAeirVjRbRuXtpArobswsNZFT5h9mL676RHOkJX9JP+Y/Lg3zDS8LeqWG6QmV9PYpBnzLpnJMaMXu5xoJ88OaylisWp49WxM7S8BL9E3XkWS568d0PSJZWezxItQmb63haC6fKLwCqdXaphSbDX4Lqy8WXxVwXnmMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KV1TKtQPftfPE95Z3XOHUyyDx3wcKNs7barFxxWpvjA=;
 b=lc+qeY9TUmw/c3oz/fHBnzWvpjWjBSZ2I62tnGKe/5nxgxrU6pz1lvqMBZ7qReiQDLIO+nTQ8jVqewWju/PnYgl9VU2LyRQNtrv+GEwlYdmI/ngohtC1OZvewAIXlmeHXuMbf9uzkCBI1QxJRdyGeab0oiPAWhgEg1aqshAOW5fkBt3qRnpItkCyXU+u5RtlDL1AxAupQ1O7aAx3iPfUJdIhvtvteeQ/ACTKUDT9mVrpKzzRQvJhemjhUEcOe0rz6vUjIZpqRetmhPpRFYp6HY50tUge6YQEfDwgtfxWgt3hAdJ/PLjfTSIry/19OZPGGTIRFlZXaJT7ZNa8aSO7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KV1TKtQPftfPE95Z3XOHUyyDx3wcKNs7barFxxWpvjA=;
 b=5Y+XczmCLmuIfnpj0Elb+8cn0InwDkKsU/tI7V6Svlj8cagD30ZP0Pe2tA6X1EPtj23/n8n+QqBqbvjfWFDVKtOTq30whIh9+WoOKps3R5VofqKfIGLu7BSEhtohocXQ01kl6+ddBfEnCeHDSZd0udjQDXaprjZOz4NtrtmlVmM=
Received: from CH2PR15CA0011.namprd15.prod.outlook.com (2603:10b6:610:51::21)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 15 Aug
 2023 18:00:39 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:51:cafe::b4) by CH2PR15CA0011.outlook.office365.com
 (2603:10b6:610:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:38 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:37 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 02/20] ath10k: correct typographical errors in the Notice.txt files
Date: Tue, 15 Aug 2023 13:00:00 -0500
Message-ID: <20230815180018.25554-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: afae9c80-7593-4c7d-62f9-08db9db9885e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hO1QjPvq7294DNx2jc9WSxsZcXPQ2rRlaqMtDcMjWuV5u+5ye6y3E/OHlaArSuv+vVPSc5r3eJyYhh3a0S1ijMzftbrv+E0qqEz+epazCzFkSa4bUY3goyIY1I+FA478TyNuGio9wWVs/bmHcxeUMgZU7ThuWN6ibjbRTS27fDRf+7up8uEK/c8F4w/KmxttVwWVhI9YiJ5jD9uyoTnXW62mR8V/490oqZwvLQ787EPROuNCl4eTt2kAjNJ9LlAcO5WzJbF726WLD8qo2SeUbyc+NXeUTO+kzksDnY4UMkggJgZAo5kHmvDFu5K/DMB171Wdx/YzIZiilmemmQo+Ijs4TcpVvPE5I7EMLqNsW9pK3jMLWi+ANST9RRGDWN7iM5OTt9/Wek7gNVNs56ZHhiq0/YzDmF6WmT/U57aHqpRCSo9oCX7+pVldnFFuf2zOXwCPl16oUnJkQUQZmqX94D41hZHFASzk/9itKSlFJoRSkoZEk/5vivxmVrDVHGkJu4ooYmzjJlw1EE7H75KP7sy141ybonS+YrVHV1eaU2+x5RZYCW2cRPacM0k3ZLXaF1uWWGGFYw/xT4Q0KuStUAY386dQqbEVC4FHiYMaOiYTnj6MNaobI4YplnHd7ffKKfbplOrRHHR/Rt6DNN9yM3YCtf2H2T5CRC5bX0EF+K/BjMQbGYOBKWu/ItUKugp2PXv/5b/V61fRvipVuWVfcLJgxh7onnQTCYkYxr9uGZXK1cTzeTUju2zA3SQR2GV9T2jxaYj1skwHI7h/MWbNOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(70586007)(70206006)(4326008)(44832011)(8936002)(82740400003)(450100002)(5660300002)(66899024)(110136005)(81166007)(426003)(36756003)(83380400001)(47076005)(356005)(41300700001)(40480700001)(86362001)(478600001)(2906002)(6666004)(8676002)(26005)(316002)(7696005)(15650500001)(30864003)(16526019)(1076003)(36860700001)(336012)(2616005)(40460700003)(36900700001)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:38.3892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afae9c80-7593-4c7d-62f9-08db9db9885e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .../hw1.0/notice_ath10k_firmware-5.txt        |  40 ++---
 .../hw2.1/notice_ath10k_firmware-5.txt        | 138 ++++++++---------
 .../hw3.0/notice_ath10k_firmware-4.txt        | 144 +++++++++---------
 .../hw3.0/notice_ath10k_firmware-6.txt        |  32 ++--
 .../hw3.0/notice_ath10k_firmware-sdio-6.txt   |  32 ++--
 .../hw1.0/notice_ath10k_firmware-5.txt        | 138 ++++++++---------
 .../hw1.0/notice_ath10k_firmware-6.txt        |  32 ++--
 .../hw1.0/notice_ath10k_firmware-sdio-5.txt   | 138 ++++++++---------
 .../hw1.0/notice_ath10k_firmware-5.txt        |   8 +-
 .../hw2.0/notice_ath10k_firmware-5.txt        |  40 ++---
 .../hw2.0/notice_ath10k_firmware-4.txt        |   8 +-
 .../hw2.0/notice_ath10k_firmware-5.txt        |   8 +-
 .../hw1.0/notice_ath10k_firmware-5.txt        |  40 ++---
 .../hw2.0/notice_ath10k_firmware-5.txt        |  26 ++--
 ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp      |  26 ++--
 15 files changed, 425 insertions(+), 425 deletions(-)

diff --git a/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt b/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt
index 2f736cb7..717743f9 100644
--- a/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt
@@ -33,7 +33,7 @@ Other products and brand names may be trademarks or registered trademarks of the
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -55,24 +55,24 @@ Other products and brand names may be trademarks or registered trademarks of the
 ========================================================================================================================================
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -181,7 +181,7 @@ Other products and brand names may be trademarks or registered trademarks of the
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -201,7 +201,7 @@ Other products and brand names may be trademarks or registered trademarks of the
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 ========================================================================================================================================
 
 ========================================================================================================================================
@@ -343,7 +343,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -368,7 +368,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -472,7 +472,7 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -496,24 +496,24 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
 
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt b/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
index 9e32162f..20fe4d88 100644
--- a/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
@@ -53,7 +53,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -121,7 +121,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -141,7 +141,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 
 
 
@@ -159,7 +159,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -312,7 +312,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -668,7 +668,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -782,24 +782,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -817,24 +817,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -854,24 +854,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -889,24 +889,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -924,24 +924,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -961,24 +961,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -997,24 +997,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1033,24 +1033,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1069,24 +1069,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt b/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
index 5199e3f8..00c84f0b 100644
--- a/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
+++ b/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
@@ -53,7 +53,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -154,7 +154,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/romexport/AR63
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -673,7 +673,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_protocol_cmn.cnss/1.0.0/src/nan/
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -736,7 +736,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_cmn.cnss/1.0.0/include/queue.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -764,7 +764,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_cmn.cnss/1.0.0/include/queue.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by the University of
  *      California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -826,7 +826,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_protocol_cmn.cnss/1.0.0/include/
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -1065,7 +1065,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_protocol_cmn.cnss/1.0.0/src/supp
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -1093,7 +1093,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_protocol_cmn.cnss/1.0.0/src/supp
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -1156,7 +1156,7 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_protocol_cmn.cnss/1.0.0/include/
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -1341,24 +1341,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/src/misc/binsi
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1375,24 +1375,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/include/cil.h
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1409,24 +1409,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/include/dev.h
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1443,24 +1443,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/include/pcd.h
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1500,24 +1500,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/src/soc/usbhwc
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1544,24 +1544,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/src/soc/usbhwc
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1578,24 +1578,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/include/os_dev
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1621,24 +1621,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/src/soc/usbhwc
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1677,24 +1677,24 @@ p4://qctp411.qualcomm.com/components/rel/wlanfw_mac_core.cnss/1.0/src/soc/usbhwc
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt b/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
index 35518019..e69b83cb 100644
--- a/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
+++ b/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
@@ -61,7 +61,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -160,7 +160,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -679,7 +679,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -741,7 +741,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -767,7 +767,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by the University of
  *      California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -829,7 +829,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -959,7 +959,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -985,7 +985,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -1048,7 +1048,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -1230,24 +1230,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt b/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt
index 35518019..e69b83cb 100644
--- a/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt
+++ b/ath10k/QCA6174/hw3.0/notice_ath10k_firmware-sdio-6.txt
@@ -61,7 +61,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -160,7 +160,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -679,7 +679,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -741,7 +741,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -767,7 +767,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by the University of
  *      California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -829,7 +829,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -959,7 +959,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -985,7 +985,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -1048,7 +1048,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -1230,24 +1230,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt b/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt
index e10d8078..cd29445a 100644
--- a/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-5.txt
@@ -53,7 +53,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -121,7 +121,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -141,7 +141,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 
 
 
@@ -159,7 +159,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -312,7 +312,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -668,7 +668,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -782,24 +782,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -817,24 +817,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -854,24 +854,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -889,24 +889,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -924,24 +924,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -961,24 +961,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -997,24 +997,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1033,24 +1033,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1069,24 +1069,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt b/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
index 35518019..e69b83cb 100644
--- a/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
+++ b/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-6.txt
@@ -61,7 +61,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -160,7 +160,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -679,7 +679,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -741,7 +741,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -767,7 +767,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by the University of
  *      California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -829,7 +829,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -959,7 +959,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -985,7 +985,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -1048,7 +1048,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -1230,24 +1230,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt b/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt
index e10d8078..cd29445a 100644
--- a/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt
+++ b/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-sdio-5.txt
@@ -53,7 +53,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -121,7 +121,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -141,7 +141,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 
 
 
@@ -159,7 +159,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -312,7 +312,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -668,7 +668,7 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -782,24 +782,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -817,24 +817,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -854,24 +854,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -889,24 +889,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -924,24 +924,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -961,24 +961,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -997,24 +997,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1033,24 +1033,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -1069,24 +1069,24 @@ Copyright (c) 2002-2004 Sam Leffler, Errno Consulting
  * $Date: 2013/08/06 $
  * $Change: 2161544 $
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt b/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
index 4ff240e3..2e5c900e 100644
--- a/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
@@ -56,7 +56,7 @@ NOTICES:
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -84,7 +84,7 @@ NOTICES:
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -143,7 +143,7 @@ src/wlan/proto/include/if_llc.h#1
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -279,7 +279,7 @@ tests/serflash/flashprog/uncompr.c#1
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
diff --git a/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt b/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
index 2f736cb7..717743f9 100644
--- a/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
@@ -33,7 +33,7 @@ Other products and brand names may be trademarks or registered trademarks of the
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -55,24 +55,24 @@ Other products and brand names may be trademarks or registered trademarks of the
 ========================================================================================================================================
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -181,7 +181,7 @@ Other products and brand names may be trademarks or registered trademarks of the
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -201,7 +201,7 @@ Other products and brand names may be trademarks or registered trademarks of the
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 ========================================================================================================================================
 
 ========================================================================================================================================
@@ -343,7 +343,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -368,7 +368,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -472,7 +472,7 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -496,24 +496,24 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
 
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt b/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt
index 571dcf63..7fa1fac1 100644
--- a/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt
+++ b/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt
@@ -51,7 +51,7 @@ NOTICES:
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -79,7 +79,7 @@ NOTICES:
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -138,7 +138,7 @@ src/wlan/proto/include/if_llc.h#1
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -274,7 +274,7 @@ tests/serflash/flashprog/uncompr.c#1
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
diff --git a/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt b/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt
index 4ff240e3..2e5c900e 100644
--- a/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt
@@ -56,7 +56,7 @@ NOTICES:
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -84,7 +84,7 @@ NOTICES:
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -143,7 +143,7 @@ src/wlan/proto/include/if_llc.h#1
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -279,7 +279,7 @@ tests/serflash/flashprog/uncompr.c#1
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
diff --git a/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt b/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt
index 2f736cb7..717743f9 100644
--- a/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt
@@ -33,7 +33,7 @@ Other products and brand names may be trademarks or registered trademarks of the
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -55,24 +55,24 @@ Other products and brand names may be trademarks or registered trademarks of the
 ========================================================================================================================================
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
@@ -181,7 +181,7 @@ Other products and brand names may be trademarks or registered trademarks of the
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -201,7 +201,7 @@ Other products and brand names may be trademarks or registered trademarks of the
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 ========================================================================================================================================
 
 ========================================================================================================================================
@@ -343,7 +343,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -368,7 +368,7 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -472,7 +472,7 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -496,24 +496,24 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
 
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt b/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt
index ae21b585..e1d53627 100644
--- a/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt
+++ b/ath10k/QCA99X0/hw2.0/notice_ath10k_firmware-5.txt
@@ -56,7 +56,7 @@ NOTICES:
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -84,7 +84,7 @@ NOTICES:
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -143,7 +143,7 @@ wlan/protocol/src/include/if_llc.h#1
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -247,7 +247,7 @@ wlan/mac_core/tests/serflash/flashprog/uncompr.c#1
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -424,7 +424,7 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -444,7 +444,7 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 
 wlan/mac_core/include/usb.h
 wlan/mac_core/romexport/AR900B/hw.1/include/usb.h
@@ -454,24 +454,24 @@ wlan/mac_core/romexport/AR900B/hw.2/include/usb.h
 
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
diff --git a/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp b/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
index b85005cb..f0204631 100644
--- a/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
+++ b/ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
@@ -57,7 +57,7 @@ NOTICES:
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -85,7 +85,7 @@ NOTICES:
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *  This product includes software developed by the University of
  *  California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -144,7 +144,7 @@ wlan/protocol/src/include/if_llc.h#1
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -248,7 +248,7 @@ wlan/mac_core/tests/serflash/flashprog/uncompr.c#1
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -425,7 +425,7 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -445,7 +445,7 @@ For all files with the above-mentioned dual-license, QCA chooses to receive subj
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* Modified by Synopsys, Inc, 12/12/2007 */
+/* Modified by Synopsis, Inc, 12/12/2007 */
 
 wlan/mac_core/include/usb.h
 wlan/mac_core/romexport/AR900B/hw.1/include/usb.h
@@ -455,24 +455,24 @@ wlan/mac_core/romexport/AR900B/hw.2/include/usb.h
 
 /* ==========================================================================
  *
- * Synopsys SS USB3 Linux Software Driver and documentation (hereinafter,
- * "Software") is an Unsupported proprietary work of Synopsys, Inc. unless
- * otherwise expressly agreed to in writing between Synopsys and you.
+ * Synopsis SS USB3 Linux Software Driver and documentation (hereinafter,
+ * "Software") is an Unsupported proprietary work of Synopsis, Inc. unless
+ * otherwise expressly agreed to in writing between Synopsis and you.
  *
  * The Software IS NOT an item of Licensed Software or Licensed Product under
  * any End User Software License Agreement or Agreement for Licensed Product
- * with Synopsys or any supplement thereto. You are permitted to use and
+ * with Synopsis or any supplement thereto. You are permitted to use and
  * redistribute this Software in source and binary forms, with or without
  * modification, provided that redistributions of source code must retain this
  * notice. You may not view, use, disclose, copy or distribute this file or
  * any information contained herein except pursuant to this license grant from
- * Synopsys. If you do not agree with this notice, including the disclaimer
+ * Synopsis. If you do not agree with this notice, including the disclaimer
  * below, then you are not authorized to use the Software.
  *
- * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSYS SOLELY ON AN "AS IS" BASIS
+ * THIS SOFTWARE IS BEING DISTRIBUTED BY SYNOPSIS SOLELY ON AN "AS IS" BASIS
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSYS BE LIABLE FOR ANY DIRECT,
+ * ARE HEREBY DISCLAIMED. IN NO EVENT SHALL SYNOPSIS BE LIABLE FOR ANY DIRECT,
  * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
-- 
2.25.1

