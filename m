Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAB3C0015E
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4D63C43395; Tue, 15 Aug 2023 18:00:49 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F13CC433CB;
	Tue, 15 Aug 2023 18:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F13CC433CB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZUTtKtGPK2heMA/y0sXw3+uq9+g3kCFcLfH557abLMHnG5t1Bt3Mq/8y05LRD0c15H9eW1tBqsZ8lmj3igWsVKCWWyFmHDtbI4QLPRfWQul9stS+A1M/4x0XWIs/eAugMTUheM05KmJn+FEH727mpK+KBf/zwHKs+Ty0RKplOP4Jm6vHo+vkUgXpB5tsSZq0soHlBbzRHENCVz7uCbzGcRY40pj1XoXeQpFI77wackzQD0spOqadOYVNRb+NYrDa/b/Qegj53Zsa6NNHXiDhyUAJd2Jyu+/AfsJQxeNKfxfwCc3hUspA4z/ibHSvuxUpeSAK/OO+4frXzYg9CYGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnT41GUUwWeRkOcJj3td2Bq9UXTPGeb8iND84iCIi24=;
 b=WJoV1L7f7Bw/MZ4DjbH1WlBSMFIDCMgh2gMPfh5k019Y/hm/idcJkrc4hRCGEJhgH4W+liGSAcAMuZ9J1izOXcHiIlHTexGoLpRQgkKE1/ZmI30otXJTZn70Gz2l2vEv6iTncqgAO+AGlDxdLc2IXW48eWQWgLksmDQygt1DLaP8ClSNVEhebdDPd8rN5e3p6EpmrPW/Tz76/hQWcab8v2J6VlAMjRLZVbK4jkZptuGdVR94DqfL55a8wPurDnoF5xQdMkQ24reBKa/a4wLBm53l0Iz1zUgkbB6o4+8y31sBjAepW6r7FJayy6S5MIPFr9p2IV5UnR88qw+sRpkGMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnT41GUUwWeRkOcJj3td2Bq9UXTPGeb8iND84iCIi24=;
 b=GDul3nWgqRCAep/ND4nYuZ6fww0e1NocATTPc5xg0pgloRtDdH+Yh0DA1wuqbmGZT1yfMY0x+/tQ9F/0AEzfp5naLJ/x1JDr7hjz49uG2Dtmc2ZpMP4eRV+k65v8p5FcfM+ezlm2GsB8EFAgB5FA3QpcUL11/mWykuYwzR3kzsE=
Received: from MW4PR04CA0347.namprd04.prod.outlook.com (2603:10b6:303:8a::22)
 by SN7PR12MB8104.namprd12.prod.outlook.com (2603:10b6:806:35a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 15 Aug
 2023 18:00:42 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::b1) by MW4PR04CA0347.outlook.office365.com
 (2603:10b6:303:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 13/20] qcom: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:11 -0500
Message-ID: <20230815180018.25554-14-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|SN7PR12MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cafd70-ca6d-4376-8977-08db9db98abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w8/t1XVeMK+Vc+OVraPIUmsk2B2R+3Zd5dMUOsHFEZtQ/xzs47SFe0LS7i+/YeWvG51aNhwfZVozoAaLB8Imvylve7b06s78xt2bjXfp/1dJMnt99WOElSXHgKJ7m6DHqP9QgYfLlvnJlx0XfygIh+3DwYfpekLvBYa/ufbL419M2IXMYosSfbVZagye6lSEj+jVj/PVOm9/cuB0nVcAR4eDAtiMk/KtrGwHKdPZjoScKQLkXSHs7PayJsqgDGp3hQroY549TtMyc4LJ7TtobcbnTdMkIaI+Z7zZZUl2j3Ba5+d/zTTf/yZAmiIC91I/SmtBZuQft/pWWZhrk35rZerO/ircB1bFpsv+PshOoMAmowbTl7oNcFVJcYfhBHrn/zllDUSUZj0xmWN0zuvs0sH5Ht/Fqy0GNTseX7nX5YvAoFIS3OVd/VFvY/JnArO8G3bKMCCPJPdB7+EdUWfEXTIGAgwNebRypxp/VBKm1gD5/68X7VrfWxWSHn2qRMxaU7mdtF+HdBZSfOhIc9YG+zQP0mPTO8D9pyAqTEY0UkxARXYbB6ARO+g9ojrOe3hCbq+fqYJ8lTyQZvkS/I9VgXSJfyiqYCYD9VyFcQdZYjS8SOppDNUEsSH0FSX1C+a9Yixf2B4mThJThttRiFvXs836Kz4b9o9gSSynVYn4dHgn/gvauIjsbpj6Cb7WcrG+/XkukitT8U1Rgs/dyk6KOK5FeP7728/5tgMSFznlvLD2XCDoHRpFgQ6Ufg7Y7TccT8I9Adbp095PsW7gKaPEGQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(7696005)(6666004)(2616005)(83380400001)(110136005)(40480700001)(70586007)(1076003)(450100002)(316002)(8936002)(16526019)(36860700001)(426003)(82740400003)(47076005)(44832011)(2906002)(4326008)(478600001)(36756003)(5660300002)(356005)(40460700003)(41300700001)(70206006)(26005)(86362001)(81166007)(8676002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:42.2966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cafd70-ca6d-4376-8977-08db9db98abe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8104

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 qcom/NOTICE.txt | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/qcom/NOTICE.txt b/qcom/NOTICE.txt
index 184f88f2..089aa78c 100644
--- a/qcom/NOTICE.txt
+++ b/qcom/NOTICE.txt
@@ -97,7 +97,7 @@ trademarks of their respective owners.
  * The implementation was written so as to conform with Netscapes SSL.
  *
  * This library is free for commercial and non-commercial use as long as
- * the following conditions are aheared to.  The following conditions
+ * the following conditions are adhered to.  The following conditions
  * apply to all code found in this distribution, be it the RC4, RSA,
  * lhash, DES, etc., code; not just the SSL code.  The SSL documentation
  * included with this distribution is covered by the same copyright terms
@@ -119,13 +119,13 @@ trademarks of their respective owners.
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
@@ -140,10 +140,10 @@ trademarks of their respective owners.
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
 
 
@@ -300,7 +300,7 @@ trademarks of their respective owners.
    I retain copyright in this code but I encourage its free use provided
    that I don't carry any responsibility for the results. I am especially
    happy to see it used in free and open source software. If you do use
-   it I would appreciate an acknowledgement of its origin in the code or
+   it I would appreciate an acknowledgment of its origin in the code or
    the product that results and I would also appreciate knowing a liitle
    about the use to which it is being put. I am grateful to Frank Yellin
    for some ideas that are used in this implementation.
-- 
2.25.1

