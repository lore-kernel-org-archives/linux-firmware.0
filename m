Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4567C04FE0
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAB62C43395; Tue, 15 Aug 2023 18:00:50 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B302C433C7;
	Tue, 15 Aug 2023 18:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B302C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4Rq7Qkn0h3w3fHrPpiApRD/m2nWpv1skZAzbJIT7PAE/Sy36t5tjhb15M1w28aZUUEXLfeTokvj5Y094Je7UDMwWuLKLd02Cb/qcjm15+uY3ojT3+74axBmuS9L98KH7JH1Wt5B4DV1TJZPuDhiA2tW+X/zF5L24JetWSiGJvLP3FDA5QrEUGXLt4i6lG8d4BmDHh7z+Zt0rRouSvviHwv3MzVFu8TnDmZOXn3By9ULHgE3pgsmZuX0+iN/z1X+k17PEI8kNcErQjOqOMXZ+5Fmt17sLBd0buaax+IT7WfG6TYBLLqecpT1FPFkWTC78AMvtw/0UkxcXy9p1dbYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/KaU4JYfTqgNTWx3PbBmbiztl+Xd7+lid+O6EjuOgE=;
 b=jMT0I3WGcV5ponbSb+GJCOsLw2U7+pkMGqpJ6JQZkaEpwv5Wsk7dqr/uSTIVVTYOs365dfxKNQ0ku7KZTuujaX96zc0JkmGJj5ruc6CO1KMkJ1iNB7iJrxaw7/QNKtutJnT9/YJFe/QYe3Ke8rS1PfVXm4yqPmFY0HRLda4RsDeIjg2+jLsv7Yjs/LTE4gcHupFLZb9S/VyTHJ1FLwNMNvWnedP3YdBpE+ACRSDbHisJmz5qY55HVVFq/IOI7PmeRjsG11hoxCTROQOmTyHleTA9wtvjEx32Smh2pIM29D1IrxzySZhVOqmy3e40j4mcx/Y8M6UPmezPFHfNXrahOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/KaU4JYfTqgNTWx3PbBmbiztl+Xd7+lid+O6EjuOgE=;
 b=lnOnQ1zFJiRkXrJDpx92mIwqGGcoUqyuZEVuAuU+gMeIduTId+XdLYMgmljd+BTff2pkTJF+PCZX7C5QP4AsCcsG/VDlilnmjNav99hKuENpebkMpmEH5tL0fGpeUQsvQqfhf3yMV4GAXTdQ//dhv6GcMn69p4gcdfZzjWX3GPs=
Received: from BYAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:c0::14)
 by CY8PR12MB7561.namprd12.prod.outlook.com (2603:10b6:930:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:44 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::ca) by BYAPR05CA0001.outlook.office365.com
 (2603:10b6:a03:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:44 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:43 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 18/20] Add CI/CD with ci-fairy
Date: Tue, 15 Aug 2023 13:00:16 -0500
Message-ID: <20230815180018.25554-19-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CY8PR12MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: af3bcdd3-ba34-49b1-b66b-08db9db98bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X/vldnsU4rpauL1CY/uU3nkq+9Ht4y8Ko+SPTlBf0g71nyfUhNQ4zkv2b9qDeNfP7eVosCoK2u6vcPxAPbJa5xVYJ8cFJE+UH419yTGGIj7SbhHAsKM3I0z2w1esxAM896rAsyXpSDCkHbQRYqAq6JoWTnUSjS1VBIrDEY8b2tYBrJeue9E/qxddm8bcJKFkxzVKdJwuhQ/xgpNn0lrxHWTDNVTWRJSaWmj8s9SrDehGnOsPVbnswuWK/PRrVOPE+v+iae3exPv2yQvTCQGyh9my8sTtCAyoBWPGbxWeNQbPURCykJ958SHas1oRlfzOL5Ck0qYOsUOXB551phUslhkNJFPpNT2SqgiG4t+UufhZdjxFtm/z4O1fawvRtRKB1pu7QE0QR6K2TTDALubx4e0VVE2Ie5rmcSekc6VeBJkuzxAcmFzzNQ7cWCVNmKWCU1sshEX+SSDILyoa+Ie/sacWqNC43jirhZe97hhkHmfaXRrfASF639rKGzWvhi88oFAs8JYgovChky+8onyaw9XPoSuxDg6zwZnFuYEOnFTHIZtLDQsroLou2u+EEHc6oH6lJs4bpzAf4FC7Pgjxy6Mb48wqyNP3BIEB4K9Js3b463rRcXggE0hLonWYJdl+MvX5VUp7z00pPubWA1pXH2SRdP9bF61JBtpV2pjHOqyNz3wf7VwCxJX+hkJd8qVzeBGVok5no/AdG2EkVxmi5Lh1KRCbEtbZsCPp1s1oGmbY/JnN6crjX7XIpT+oNlGkrfsIrHxeBrwChuXC5svYkwor2AqKpm4JtVUiYNeZ2Cc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(1800799009)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(2616005)(2906002)(5660300002)(26005)(966005)(36860700001)(6666004)(36756003)(7696005)(86362001)(40480700001)(426003)(1076003)(47076005)(316002)(336012)(70206006)(110136005)(40460700003)(478600001)(44832011)(41300700001)(8676002)(450100002)(82740400003)(81166007)(356005)(8936002)(4326008)(16526019)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:44.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af3bcdd3-ba34-49b1-b66b-08db9db98bc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7561

When run on a Freedesktop Gitlab isntance this will leverage
existing templates and run a pre-commit script.

This will make sure that all formatting changes match the expected
style.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 .codespell.cfg          |  4 ++++
 .gitignore              |  1 +
 .gitlab-ci.yml          | 22 ++++++++++++++++++++++
 .pre-commit-config.yaml | 33 +++++++++++++++++++++++++++++++++
 check_whence.py         |  4 ++++
 5 files changed, 64 insertions(+)
 create mode 100644 .codespell.cfg
 create mode 100644 .gitignore
 create mode 100644 .gitlab-ci.yml
 create mode 100644 .pre-commit-config.yaml

diff --git a/.codespell.cfg b/.codespell.cfg
new file mode 100644
index 00000000..5af7dce9
--- /dev/null
+++ b/.codespell.cfg
@@ -0,0 +1,4 @@
+[codespell]
+builtin = clear,informal,en-GB_to_en-US
+skip = .git,carl9170fw,
+ignore-words-list = fils
diff --git a/.gitignore b/.gitignore
new file mode 100644
index 00000000..fcf54f43
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1 @@
+debian/
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
new file mode 100644
index 00000000..7cfdca38
--- /dev/null
+++ b/.gitlab-ci.yml
@@ -0,0 +1,22 @@
+.templates_sha: &templates_sha e9a461877f8c7f9fed9fff5491067ec3c3472559
+
+include:
+  - project: 'freedesktop/ci-templates'
+    ref: *templates_sha
+    file: '/templates/ci-fairy.yml'
+
+check-commits:
+  extends:
+    - .fdo.ci-fairy
+  script:
+    - ci-fairy check-commits --signed-off-by
+
+pre-commit:
+  extends:
+    - .fdo.ci-fairy
+  script:
+    - apk add python3-dev
+    - apk add gcc
+    - apk add musl-dev
+    - pip install pre-commit --ignore-installed distlib
+    - pre-commit run --all-files
diff --git a/.pre-commit-config.yaml b/.pre-commit-config.yaml
new file mode 100644
index 00000000..b77bb683
--- /dev/null
+++ b/.pre-commit-config.yaml
@@ -0,0 +1,33 @@
+default_stages: [commit]
+repos:
+-   repo: https://github.com/pre-commit/pre-commit-hooks
+    rev: v4.0.1
+    hooks:
+    -   id: check-executables-have-shebangs
+    -   id: forbid-new-submodules
+    -   id: check-yaml
+    -   id: check-symlinks
+    -   id: destroyed-symlinks
+-   repo: https://github.com/codespell-project/codespell
+    rev: v2.1.0
+    hooks:
+    -   id: codespell
+        args: ['--config', './.codespell.cfg', '--write-changes']
+        types: [text]
+        exclude_types: ['c']
+-   repo: https://github.com/ambv/black
+    rev: 22.6.0
+    hooks:
+    - id: black
+-   repo: https://github.com/igorshubovych/markdownlint-cli
+    rev: v0.33.0
+    hooks:
+    - id: markdownlint
+      args: ['--fix']
+-   repo: local
+    hooks:
+    - id: check-whence
+      name: Check whence
+      files: 'WHENCE'
+      language: script
+      entry: ./check_whence.py
diff --git a/check_whence.py b/check_whence.py
index bf14aed6..3658e745 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -72,6 +72,10 @@ def main():
     links_list = list(list_links_list())
     known_files = set(name for name in whence_list if not name.endswith("/")) | set(
         [
+            ".gitignore",
+            ".codespell.cfg",
+            ".gitlab-ci.yml",
+            ".pre-commit-config.yaml",
             "check_whence.py",
             "configure",
             "Makefile",
-- 
2.25.1

