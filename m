Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913DBC0015E
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D32AC433C7; Tue, 15 Aug 2023 18:00:53 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8D06C433C9;
	Tue, 15 Aug 2023 18:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8D06C433C9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ih1fzQp7YoQMtMZFukYtHc+NDLhdxzU/i0CWg60hJWJc98yo78GjzxKvMku142x5yIbFA7nnVCaJ8UgmQoodgIO2N9uCJO471+GMUVudjN/aSPZkJP1ihti7KGw1xYQ9POOgDFhYww4UxATlmXUJTYHAdtypCDXlsX0xqe7GpIBMaq68f7DhtCIcEKpFDniCp32xk2dq2jFtNhl1esCe/6I8xzmhME3NhmN8rW5XBghyYRnt6EWNY8hrDzwMKoCxA2Jvk5RapOUyaRu6qHygr/O0IPRCtokwjhCKr/eCOhm9NvugTo6/0Wrixn3Zjq07ao82IDYQtortu9JPN490Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn5Gkh5ow9RZxV4QoP96ec670e93qj2/IuzfggU5pMo=;
 b=MLw2OG3E5kiDvqDgAOEhSbpl8iLMuFzByydrzrAzNQ0u2Si91SPLkDROrCpbJaOpjWvl/DdsYCtJgn1yqhK+4OZgb0K4Ov274XzC4PMuYGBZEGqaax0ZXlK7CVltZgfIlLIqF8YkVhMrqdP0huS+XhXotxQbFy6N/Cdd6OxZhyW4FziXqo9riWzGzrdQiNaZiVoNpdnL6OHEM+AKBZTmhY/s8F5R4YcEvIoddp9B9klWg8afcOed6DirYdGBIRU/7+LvlC/Svk3/Q1uFS6d5w5K81ipC6DWGTOyGvm1lU4n5PvOc6dOi/DCxHs7xQThXIvJjKHCXUi7bVJUQ3SAUHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn5Gkh5ow9RZxV4QoP96ec670e93qj2/IuzfggU5pMo=;
 b=m7eg8bUqUCFTFuRYUQFdF6iJoCHgrd6AUo/TW7S55wRreIV1+cT9he3GDKlbuiFKRFE8yB5HWFnW6X7ioyVC7kqyt/TDINZJ3qm0N77nVuxrccAT3pKofTfBfRSUzuPSOMLQUkCPbkIfke9jvun/IJONClYSBgi0142R+RV1nfA=
Received: from BYAPR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:c0::20)
 by MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:38 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::22) by BYAPR05CA0007.outlook.office365.com
 (2603:10b6:a03:c0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:36 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 01/20] ath11k: update typographical errors in the Notice.txt files
Date: Tue, 15 Aug 2023 12:59:59 -0500
Message-ID: <20230815180018.25554-2-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|MN0PR12MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc4529b-c010-438f-b9d0-08db9db9881d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cb6mvBP80qnXmEjOXbR7v4pD/R1rMuJDZBkIULWapSNPrK9emEGr0gn4rBEG6Ye4Gm0yzK0zbbR9OOfFvw77MWegeqz4ZNikQTSl9oJ5V90BEQ0hp96ZrvSMxZpUnN5qS/HEju/rw7+9VsK+hFgpAaLXjWQjsXH3j3Y2nYPwY9tciTJCDNT1BB0yA0Juvo3kHCwgqAwFHLoSdL6HLYSTWmCDrthQj0B/Fk5SC/HfTBVEVvDWOyAG7CLnSd5C5RAn+AJazIEC5R7F7zLCt4W/NOGdd+HydYmyDZjv8ikxJy6RCbFhVmr1Er7DjDBJI2iWEaN/PR50PXX1pFKGR51sgTQ1fV2McewKioft31QfYAbJncXfEgxWQE8BHPTJhTSGVW5VKBSp+ExJ9hlI8f7DWctyc7pw1PZx/t4Bndr9IGbwjxiOwu/xTIpR5r13miFE5v9Q7asGwL9AMUUPyyp/Ixc7n2iaSmihLwBPeWkX6/B3kNOW9ly8mZuUkCtrkE/Z7lhPwJI+Lx6CFPAfBeJ0JiVf4JfvOLZZX5PHC3pWFDXZEjwxI5PCvELU5VrTWH7S7Y4JkYq+BniMADXCNSnW7h4s0MVFT1U8SJxnS1ylfy+eB7kycHv9IDBwwUhZYfFme0kNnd/0I3h+3WQF3N5MItQFmAZkQ9hp049InCphnPR2RlJgKqKX5/qDbGIdeTT4pqxb2APti7upYs5O1EWTGLUIerKp6xqR690BnvWChnS1ts/YVhLzqqiVGjRCruQtOF7djCvCFj6p/Q25ZhSaSg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(36756003)(86362001)(40460700003)(40480700001)(5660300002)(4326008)(8676002)(8936002)(426003)(30864003)(2906002)(36860700001)(450100002)(41300700001)(26005)(1076003)(7696005)(16526019)(2616005)(15650500001)(47076005)(6666004)(83380400001)(336012)(66899024)(478600001)(110136005)(81166007)(44832011)(316002)(356005)(82740400003)(19627235002)(70206006)(70586007)(36900700001)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:37.8717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc4529b-c010-438f-b9d0-08db9db9881d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6004

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 ath11k/IPQ5018/hw1.0/Notice.txt |  28 +++---
 ath11k/IPQ6018/hw1.0/Notice.txt |  28 +++---
 ath11k/IPQ8074/hw2.0/Notice.txt |  28 +++---
 ath11k/QCA6390/hw2.0/Notice.txt | 100 +++++++++----------
 ath11k/QCN9074/hw1.0/Notice.txt |  28 +++---
 ath11k/WCN6750/hw1.0/Notice.txt | 164 ++++++++++++++++----------------
 ath11k/WCN6855/hw2.0/Notice.txt |  26 ++---
 7 files changed, 201 insertions(+), 201 deletions(-)

diff --git a/ath11k/IPQ5018/hw1.0/Notice.txt b/ath11k/IPQ5018/hw1.0/Notice.txt
index b15324d4..82a65a23 100644
--- a/ath11k/IPQ5018/hw1.0/Notice.txt
+++ b/ath11k/IPQ5018/hw1.0/Notice.txt
@@ -378,7 +378,7 @@ File: common.h
 File: atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -411,7 +411,7 @@ File: atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -430,7 +430,7 @@ File: atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -452,7 +452,7 @@ File: atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -465,7 +465,7 @@ File: atomic_ops.h
 File: qurt_atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -498,7 +498,7 @@ File: qurt_atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -517,7 +517,7 @@ File: qurt_atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -539,7 +539,7 @@ File: qurt_atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -673,7 +673,7 @@ File: if_llc.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -698,7 +698,7 @@ File: if_llc.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -772,7 +772,7 @@ File: stail_queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -808,7 +808,7 @@ File: queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -1092,7 +1092,7 @@ File: if_ethersubr.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -3110,7 +3110,7 @@ File:aes.c
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
diff --git a/ath11k/IPQ6018/hw1.0/Notice.txt b/ath11k/IPQ6018/hw1.0/Notice.txt
index b15324d4..82a65a23 100644
--- a/ath11k/IPQ6018/hw1.0/Notice.txt
+++ b/ath11k/IPQ6018/hw1.0/Notice.txt
@@ -378,7 +378,7 @@ File: common.h
 File: atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -411,7 +411,7 @@ File: atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -430,7 +430,7 @@ File: atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -452,7 +452,7 @@ File: atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -465,7 +465,7 @@ File: atomic_ops.h
 File: qurt_atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -498,7 +498,7 @@ File: qurt_atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -517,7 +517,7 @@ File: qurt_atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -539,7 +539,7 @@ File: qurt_atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -673,7 +673,7 @@ File: if_llc.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -698,7 +698,7 @@ File: if_llc.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -772,7 +772,7 @@ File: stail_queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -808,7 +808,7 @@ File: queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -1092,7 +1092,7 @@ File: if_ethersubr.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -3110,7 +3110,7 @@ File:aes.c
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
diff --git a/ath11k/IPQ8074/hw2.0/Notice.txt b/ath11k/IPQ8074/hw2.0/Notice.txt
index b15324d4..82a65a23 100644
--- a/ath11k/IPQ8074/hw2.0/Notice.txt
+++ b/ath11k/IPQ8074/hw2.0/Notice.txt
@@ -378,7 +378,7 @@ File: common.h
 File: atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -411,7 +411,7 @@ File: atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -430,7 +430,7 @@ File: atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -452,7 +452,7 @@ File: atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -465,7 +465,7 @@ File: atomic_ops.h
 File: qurt_atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -498,7 +498,7 @@ File: qurt_atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -517,7 +517,7 @@ File: qurt_atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -539,7 +539,7 @@ File: qurt_atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -673,7 +673,7 @@ File: if_llc.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -698,7 +698,7 @@ File: if_llc.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -772,7 +772,7 @@ File: stail_queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -808,7 +808,7 @@ File: queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -1092,7 +1092,7 @@ File: if_ethersubr.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -3110,7 +3110,7 @@ File:aes.c
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
diff --git a/ath11k/QCA6390/hw2.0/Notice.txt b/ath11k/QCA6390/hw2.0/Notice.txt
index fd4fa45f..e687fb80 100644
--- a/ath11k/QCA6390/hw2.0/Notice.txt
+++ b/ath11k/QCA6390/hw2.0/Notice.txt
@@ -22,7 +22,7 @@ may be trademarks or registered trademarks of their respective owners.
 File: atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -55,7 +55,7 @@ File: atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -74,7 +74,7 @@ File: atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -96,7 +96,7 @@ File: atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -108,7 +108,7 @@ File: atomic_ops.h
 File: qurt_atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -141,7 +141,7 @@ File: qurt_atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -160,7 +160,7 @@ File: qurt_atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -182,7 +182,7 @@ File: qurt_atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -196,7 +196,7 @@ File: qurt_atomic_ops.h
 ================================================================================
 File: tailq.h
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -229,7 +229,7 @@ File: tailq.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -248,7 +248,7 @@ File: tailq.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -270,11 +270,11 @@ File: tailq.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -307,7 +307,7 @@ File: tailq.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -326,7 +326,7 @@ File: tailq.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -348,7 +348,7 @@ File: tailq.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -1190,7 +1190,7 @@ File: stail_queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -1474,7 +1474,7 @@ File: if_ethersubr.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -1623,7 +1623,7 @@ File: aes.c
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -1783,24 +1783,24 @@ File: cil.h
  * $Date: 2013/07/12 $
  * $Change: 2108597 $
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
@@ -1813,24 +1813,24 @@ File: cil.h
 ================================================================================
 File: dwc_dev.h
 /* ==========================================================================
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
@@ -1848,24 +1848,24 @@ File: dwc_os_dev.h
  * $Date: 2013/07/12 $
  * $Change: 2108597 $
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
@@ -1883,24 +1883,24 @@ File: pcd.h
  * $Date: 2013/07/12 $
  * $Change: 2108597 $
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
@@ -1968,7 +1968,7 @@ File: queue.h
 // notice, this list of conditions and the following disclaimer in the
 // documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-// must display the following acknowledgement:
+// must display the following acknowledgment:
 // This product includes software developed by the University of
 // California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -2854,7 +2854,7 @@ File: if_llc.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -2882,7 +2882,7 @@ File: if_llc.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
diff --git a/ath11k/QCN9074/hw1.0/Notice.txt b/ath11k/QCN9074/hw1.0/Notice.txt
index b15324d4..82a65a23 100644
--- a/ath11k/QCN9074/hw1.0/Notice.txt
+++ b/ath11k/QCN9074/hw1.0/Notice.txt
@@ -378,7 +378,7 @@ File: common.h
 File: atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -411,7 +411,7 @@ File: atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -430,7 +430,7 @@ File: atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -452,7 +452,7 @@ File: atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -465,7 +465,7 @@ File: atomic_ops.h
 File: qurt_atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -498,7 +498,7 @@ File: qurt_atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -517,7 +517,7 @@ File: qurt_atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -539,7 +539,7 @@ File: qurt_atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 /*
@@ -673,7 +673,7 @@ File: if_llc.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -698,7 +698,7 @@ File: if_llc.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
@@ -772,7 +772,7 @@ File: stail_queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -808,7 +808,7 @@ File: queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -1092,7 +1092,7 @@ File: if_ethersubr.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -3110,7 +3110,7 @@ File:aes.c
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
diff --git a/ath11k/WCN6750/hw1.0/Notice.txt b/ath11k/WCN6750/hw1.0/Notice.txt
index f0297679..5ecf0c87 100644
--- a/ath11k/WCN6750/hw1.0/Notice.txt
+++ b/ath11k/WCN6750/hw1.0/Notice.txt
@@ -131,7 +131,7 @@ File: stail_queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -621,7 +621,7 @@ File: strlcpy.c
 File: program_xml.py
 
 ##############################################################################
-# Australian Public Licence B (OZPLB)
+# Australian Public License B (OZPLB)
 # 
 # Version 1-0
 # 
@@ -654,7 +654,7 @@ File: program_xml.py
 #       contributors, may be used to endorse or promote products derived
 #       from this Software without specific prior written permission.
 # 
-# EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+# EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
 # PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
 # NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
 # WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -673,7 +673,7 @@ File: program_xml.py
 # OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
 # OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
 # CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
-# CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+# CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
 # DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
 # CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
 # DAMAGES OR OTHER LIABILITY.
@@ -695,7 +695,7 @@ File: program_xml.py
 # i.  the supplying of the services again; or
 # ii.  the payment of the cost of having the services supplied again.
 # 
-# The construction, validity and performance of this licence is governed
+# The construction, validity and performance of this license is governed
 # by the laws in force in New South Wales, Australia.
 
 =====================================================================================
@@ -703,7 +703,7 @@ File: program_xml.py
 File: interrupt_xml.py
  
 ##############################################################################
-# Australian Public Licence B (OZPLB)
+# Australian Public License B (OZPLB)
 # 
 # Version 1-0
 # 
@@ -736,7 +736,7 @@ File: interrupt_xml.py
 #       contributors, may be used to endorse or promote products derived
 #       from this Software without specific prior written permission.
 # 
-# EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+# EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
 # PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
 # NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
 # WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -755,7 +755,7 @@ File: interrupt_xml.py
 # OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
 # OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
 # CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
-# CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+# CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
 # DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
 # CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
 # DAMAGES OR OTHER LIABILITY.
@@ -777,7 +777,7 @@ File: interrupt_xml.py
 # i.  the supplying of the services again; or
 # ii.  the payment of the cost of having the services supplied again.
 # 
-# The construction, validity and performance of this licence is governed
+# The construction, validity and performance of this license is governed
 # by the laws in force in New South Wales, Australia.
 
 =====================================================================================
@@ -807,7 +807,7 @@ File: wcslcat.c
 File: machine_xml.py
  
 ##############################################################################
-# Australian Public Licence B (OZPLB)
+# Australian Public License B (OZPLB)
 #
 # Version 1-0
 #
@@ -840,7 +840,7 @@ File: machine_xml.py
 #       contributors, may be used to endorse or promote products derived
 #       from this Software without specific prior written permission.
 #
-# EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+# EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
 # PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
 # NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
 # WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -859,7 +859,7 @@ File: machine_xml.py
 # OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
 # OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
 # CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
-# CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+# CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
 # DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
 # CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
 # DAMAGES OR OTHER LIABILITY.
@@ -881,7 +881,7 @@ File: machine_xml.py
 # i.  the supplying of the services again; or
 # ii.  the payment of the cost of having the services supplied again.
 #
-# The construction, validity and performance of this licence is governed
+# The construction, validity and performance of this license is governed
 # by the laws in force in New South Wales, Australia.
 
 =====================================================================================
@@ -954,7 +954,7 @@ File: stringl.h
 File: ezxml.py
   
 ##############################################################################
-# Australian Public Licence B (OZPLB)
+# Australian Public License B (OZPLB)
 # 
 # Version 1-0
 # 
@@ -987,7 +987,7 @@ File: ezxml.py
 #       contributors, may be used to endorse or promote products derived
 #       from this Software without specific prior written permission.
 # 
-# EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+# EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
 # PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
 # NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
 # WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -1006,7 +1006,7 @@ File: ezxml.py
 # OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
 # OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
 # CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
-# CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+# CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
 # DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
 # CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
 # DAMAGES OR OTHER LIABILITY.
@@ -1028,7 +1028,7 @@ File: ezxml.py
 # i.  the supplying of the services again; or
 # ii.  the payment of the cost of having the services supplied again.
 # 
-# The construction, validity and performance of this licence is governed
+# The construction, validity and performance of this license is governed
 # by the laws in force in New South Wales, Australia. 
 
 =====================================================================================
@@ -1058,7 +1058,7 @@ File: strlcat.c
 File: merge.py
  
 ##############################################################################
-# Australian Public Licence B (OZPLB)
+# Australian Public License B (OZPLB)
 # 
 # Version 1-0
 # 
@@ -1091,7 +1091,7 @@ File: merge.py
 #       contributors, may be used to endorse or promote products derived
 #       from this Software without specific prior written permission.
 # 
-# EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+# EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
 # PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
 # NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
 # WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -1110,7 +1110,7 @@ File: merge.py
 # OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
 # OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
 # CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
-# CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+# CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
 # DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
 # CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
 # DAMAGES OR OTHER LIABILITY.
@@ -1132,7 +1132,7 @@ File: merge.py
 # i.  the supplying of the services again; or
 # ii.  the payment of the cost of having the services supplied again.
 # 
-# The construction, validity and performance of this licence is governed
+# The construction, validity and performance of this license is governed
 # by the laws in force in New South Wales, Australia. 
 
 ===================================================================================
@@ -1157,7 +1157,7 @@ File: dlfcn.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -1273,7 +1273,7 @@ File: exec_elf.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the NetBSD
  *	Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -1314,7 +1314,7 @@ File: headers.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1369,7 +1369,7 @@ File: wcslcpy.c
 File: qurt_atomic_ops.h
  
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -1402,7 +1402,7 @@ File: qurt_atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -1421,7 +1421,7 @@ File: qurt_atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -1443,7 +1443,7 @@ File: qurt_atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -1452,7 +1452,7 @@ File: qurt_atomic_ops.h
 File: atomic_ops.h
   
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -1485,7 +1485,7 @@ File: atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -1504,7 +1504,7 @@ File: atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -1526,7 +1526,7 @@ File: atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -1549,7 +1549,7 @@ File: search.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1587,7 +1587,7 @@ File: load.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1625,7 +1625,7 @@ File: symbol.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1690,7 +1690,7 @@ File: map_object.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1763,7 +1763,7 @@ File: rtld_start.S
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *        This product includes software developed by the NetBSD
  *        Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -1803,7 +1803,7 @@ File: reloc.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1870,7 +1870,7 @@ File: rtld.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1907,7 +1907,7 @@ File: debug.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1944,7 +1944,7 @@ File: debug.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -1981,7 +1981,7 @@ File: rtld.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *      This product includes software developed by John Polstra.
  * 4. The name of the author may not be used to endorse or promote products
  *    derived from this software without specific prior written permission.
@@ -2028,7 +2028,7 @@ File: print.c
  */
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -2061,7 +2061,7 @@ File: print.c
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -2080,7 +2080,7 @@ File: print.c
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -2102,7 +2102,7 @@ File: print.c
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -2174,7 +2174,7 @@ File: qurt_printf.c
  */
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -2207,7 +2207,7 @@ File: qurt_printf.c
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -2226,7 +2226,7 @@ File: qurt_printf.c
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -2248,7 +2248,7 @@ File: qurt_printf.c
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -2259,7 +2259,7 @@ File: tailq.h
 Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -2292,7 +2292,7 @@ Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -2311,7 +2311,7 @@ Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -2333,12 +2333,12 @@ Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -2371,7 +2371,7 @@ Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -2390,7 +2390,7 @@ Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -2412,7 +2412,7 @@ Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -2425,7 +2425,7 @@ Copyright (c) 2013  by Qualcomm Technologies, Inc.  All Rights Reserved
 File: alloc.c
  
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -2458,7 +2458,7 @@ File: alloc.c
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -2477,7 +2477,7 @@ File: alloc.c
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -2499,7 +2499,7 @@ File: alloc.c
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -2559,7 +2559,7 @@ File: strlcpyK.c
 File: ecc_xml.py
  
 ##############################################################################
-# Australian Public Licence B (OZPLB)
+# Australian Public License B (OZPLB)
 # 
 # Version 1-0
 # 
@@ -2592,7 +2592,7 @@ File: ecc_xml.py
 #       contributors, may be used to endorse or promote products derived
 #       from this Software without specific prior written permission.
 # 
-# EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+# EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
 # PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
 # NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
 # WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -2611,7 +2611,7 @@ File: ecc_xml.py
 # OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
 # OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
 # CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
-# CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+# CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
 # DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
 # CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
 # DAMAGES OR OTHER LIABILITY.
@@ -2633,7 +2633,7 @@ File: ecc_xml.py
 # i.  the supplying of the services again; or
 # ii.  the payment of the cost of having the services supplied again.
 # 
-# The construction, validity and performance of this licence is governed
+# The construction, validity and performance of this license is governed
 # by the laws in force in New South Wales, Australia.
 
 =====================================================================================
@@ -2641,7 +2641,7 @@ File: ecc_xml.py
 File: physpool_xml.py
  
 ##############################################################################
-# Australian Public Licence B (OZPLB)
+# Australian Public License B (OZPLB)
 # 
 # Version 1-0
 # 
@@ -2674,7 +2674,7 @@ File: physpool_xml.py
 #       contributors, may be used to endorse or promote products derived
 #       from this Software without specific prior written permission.
 # 
-# EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+# EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
 # PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
 # NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
 # WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -2693,7 +2693,7 @@ File: physpool_xml.py
 # OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
 # OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
 # CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
-# CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+# CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
 # DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
 # CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
 # DAMAGES OR OTHER LIABILITY.
@@ -2715,7 +2715,7 @@ File: physpool_xml.py
 # i.  the supplying of the services again; or
 # ii.  the payment of the cost of having the services supplied again.
 # 
-# The construction, validity and performance of this licence is governed
+# The construction, validity and performance of this license is governed
 # by the laws in force in New South Wales, Australia.
 
 =====================================================================================
@@ -2740,7 +2740,7 @@ File: wlan_md_elf.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the NetBSD
  *	Foundation, Inc. and its contributors.
  * 4. Neither the name of The NetBSD Foundation nor the names of its
@@ -3009,7 +3009,7 @@ File: sha1_sw.c
  * The implementation was written so as to conform with Netscapes SSL.
  *
  * This library is free for commercial and non-commercial use as long as
- * the following conditions are aheared to.  The following conditions
+ * the following conditions are adhered to.  The following conditions
  * apply to all code found in this distribution, be it the RC4, RSA,
  * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
  * included with this distribution is covered by the same copyright terms
@@ -3031,13 +3031,13 @@ File: sha1_sw.c
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *    "This product includes cryptographic software written by
  *     Eric Young (eay@cryptsoft.com)"
- *    The word 'cryptographic' can be left out if the rouines from the library
+ *    The word 'cryptographic' can be left out if the routines from the library
  *    being used are not cryptographic related :-).
  * 4. If you include any Windows specific code (or a derivative thereof) from
- *    the apps directory (application code) you must include an acknowledgement:
+ *    the apps directory (application code) you must include an acknowledgment:
  *    "This product includes software written by Tim Hudson (tjh@cryptsoft.com)"
  *
  * THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
@@ -3052,10 +3052,10 @@ File: sha1_sw.c
  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  * SUCH DAMAGE.
  *
- * The licence and distribution terms for any publically available version or
+ * The license and distribution terms for any publicly available version or
  * derivative of this code cannot be changed.  i.e. this code cannot simply be
- * copied and put under another distribution licence
- * [including the GNU Public Licence.]
+ * copied and put under another distribution license
+ * [including the GNU Public License.]
  */
 
 =====================================================================================
@@ -4870,7 +4870,7 @@ File: if_ethersubr.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -5104,7 +5104,7 @@ File: aes.c
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -6068,7 +6068,7 @@ File: if_llc.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -6098,7 +6098,7 @@ File: if_llc.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
diff --git a/ath11k/WCN6855/hw2.0/Notice.txt b/ath11k/WCN6855/hw2.0/Notice.txt
index edf86d4a..d66e22bc 100644
--- a/ath11k/WCN6855/hw2.0/Notice.txt
+++ b/ath11k/WCN6855/hw2.0/Notice.txt
@@ -57,7 +57,7 @@ File: stringl.h
 File: atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -90,7 +90,7 @@ File: atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -109,7 +109,7 @@ File: atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -131,7 +131,7 @@ File: atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -144,7 +144,7 @@ File: atomic_ops.h
 File: qurt_atomic_ops.h
 
 /*
- * Australian Public Licence B (OZPLB)
+ * Australian Public License B (OZPLB)
  *
  * Version 1-0
  *
@@ -177,7 +177,7 @@ File: qurt_atomic_ops.h
  *       contributors, may be used to endorse or promote products derived
  *       from this Software without specific prior written permission.
  *
- * EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+ * EXCEPT AS EXPRESSLY STATED IN THIS LICENSE AND TO THE FULL EXTENT
  * PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS", AND
  * NATIONAL ICT AUSTRALIA AND ITS CONTRIBUTORS MAKE NO REPRESENTATIONS,
  * WARRANTIES OR CONDITIONS OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
@@ -196,7 +196,7 @@ File: qurt_atomic_ops.h
  * OF ANTICIPATED SAVINGS, OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR
  * OTHER ECONOMIC LOSS; OR ANY SPECIAL, INCIDENTAL, INDIRECT,
  * CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES, ARISING OUT OF OR IN
- * CONNECTION WITH THIS LICENCE, THE SOFTWARE OR THE USE OF OR OTHER
+ * CONNECTION WITH THIS LICENSE, THE SOFTWARE OR THE USE OF OR OTHER
  * DEALINGS WITH THE SOFTWARE, EVEN IF NATIONAL ICT AUSTRALIA OR ITS
  * CONTRIBUTORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH CLAIM, LOSS,
  * DAMAGES OR OTHER LIABILITY.
@@ -218,7 +218,7 @@ File: qurt_atomic_ops.h
  * i.  the supplying of the services again; or
  * ii.  the payment of the cost of having the services supplied again.
  *
- * The construction, validity and performance of this licence is governed
+ * The construction, validity and performance of this license is governed
  * by the laws in force in New South Wales, Australia.
  */
 
@@ -1157,7 +1157,7 @@ File: stail_queue.h
 //    notice, this list of conditions and the following disclaimer in the
 //    documentation and/or other materials provided with the distribution.
 // 3. All advertising materials mentioning features or use of this software
-//    must display the following acknowledgement:
+//    must display the following acknowledgment:
 //      This product includes software developed by the University of
 //      California, Berkeley and its contributors.
 // 4. Neither the name of the University nor the names of its contributors
@@ -1408,7 +1408,7 @@ File: if_ethersubr.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -1520,7 +1520,7 @@ File: aes.c
  *
  * @version 3.0 (December 2000)
  *
- * Optimised ANSI C code for the Rijndael cipher (now AES)
+ * Optimized ANSI C code for the Rijndael cipher (now AES)
  *
  * @author Vincent Rijmen <vincent.rijmen@esat.kuleuven.ac.be>
  * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.ac.be>
@@ -2589,7 +2589,7 @@ File: if_llc.h
 // NO WARRANTY
 // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 // ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTIBILITY
+// LIMITED TO, THE IMPLIED WARRANTIES OF NONINFRINGEMENT, MERCHANTABILITY
 // AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 // THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR SPECIAL, EXEMPLARY,
 // OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
@@ -2617,7 +2617,7 @@ File: if_llc.h
  *    notice, this list of conditions and the following disclaimer in the
  *    documentation and/or other materials provided with the distribution.
  * 3. All advertising materials mentioning features or use of this software
- *    must display the following acknowledgement:
+ *    must display the following acknowledgment:
  *	This product includes software developed by the University of
  *	California, Berkeley and its contributors.
  * 4. Neither the name of the University nor the names of its contributors
-- 
2.25.1

