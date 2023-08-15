Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371B1C04FE1
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18DB2C433C7; Tue, 15 Aug 2023 18:00:51 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C6C7C433C8;
	Tue, 15 Aug 2023 18:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C6C7C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h64aogy8UrY/enqyqiWKMlI+WwqF5TAKeEKip9brPn7igaWrhalPQq/+SqO60hpPLzxaTa2PsJmLAiEWJgOhAQ8JinApH4zKnGeg0w0AJP235Zjt895yCBiRIZfblRSlKES4MPeZT9CrQp/7V9k0azeg4p1c9Pmnhlbg4GNRRuKgKgBQtMl/+gYKrEixwtpZqD7y/cYHYB+kwnpkwPr/wxFPyOjIs15FObHF1kONUtWs+oWvSoZQoIK1JdBO8QF4S9yY8XI9Syg58yXib6m9T6beY2mb/+PbxD07ELWe90/uLo30c+qqotHVsD1CrhQ+pWXknmEej09pFc2a1ira0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RJkqbvTZJ231BxtvkKLbqGDv7H7xI7lPuTTKc33GXU=;
 b=K9pNxCvxKRv0ZV3hj7P3e4VtRdy3HaFSyTbQ9U9723nVPqHdQviaTrvirfL3DmhdjpIdvXBOv5fQczIjijyyA0THjjR5fFvR5yWaukyDaTeq9MGkKfWG9YanLpKAGD71Kyt+o02gA+CXtcFumMQBRK6z1OFSV9Ebz0T+tecKXGnsJGlcYUnycfuo1mD7/yNYhphxWv9BHPCIgwfhMvRVEjI2rNTf4J7UpixY1TbFn0c6KzWnTTPuxlTzH5BiHowRGtn0jQlwvGZwkqZe9nwtdBND09wPnWhhGCGq8/PEYTLEtJglfT0eQaoJq9+vgJ23xQJWEbjd3EzvLV7phStHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RJkqbvTZJ231BxtvkKLbqGDv7H7xI7lPuTTKc33GXU=;
 b=jgpiBZFV7y9kQYtHPrT3JyQqlckEck7WvrHqkTUYMU+/VVgA8hA4utLOgyJz+V3aaVSPoOvuURMjelzkLr8xBPN08ggOX1GFe3VEh3nzxayzr53Spi3LMceKH9GKvpvgVxem3BP3SxXPnPe5sqTRFJQP+U9cW5AP04nTEyQHW/s=
Received: from BYAPR05CA0001.namprd05.prod.outlook.com (2603:10b6:a03:c0::14)
 by PH7PR12MB6659.namprd12.prod.outlook.com (2603:10b6:510:210::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:45 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::b9) by BYAPR05CA0001.outlook.office365.com
 (2603:10b6:a03:c0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:45 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:44 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 20/20] Rewrite README in markdown
Date: Tue, 15 Aug 2023 13:00:18 -0500
Message-ID: <20230815180018.25554-21-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|PH7PR12MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d66e4c6-1775-41e8-4d19-08db9db98c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tSDqoRg5snTLikBQmrwm2DCY5Z9i+N2eH515YiCRpnHIj9f8/iMuNOD5VSb8SvyRPs4LMZWSKvzMI/vxjJ/7uHvy/JJwByi4AMLPEJMFwWUrWkc2i6hsZVw8TBeeERSwS44ySsDKB9MqL2lxJTQl11Ri5tjPucMLr5rjUCj3H4ru33ZJhL7DLv4zFviFKrnYDjMEW6JBOoc24opviGFhFLJLPNgtFxpeCiCXHR59LmAc1f2xnZ4gnfkOzym7CqvyH/hCjl8jVAea0BeOxvyyPAO0Q/APx+8ZyMoOBNtWpTunjnPKCLPBkInnBHO88DfI2XIUAirnLAfOIiCwISwuVtvBk53pifdtHCDBdUevtEC5+IQRUiPFAp+MCfGx+0+nXN+i/mXq1fOFuIgaZgVl28rPPFLI8NdygzIehHXuwsvC8hd7qrWyqJxO47519YX836f4jvwvTL8kTtiAXK04mhheDAXRr/vcNfBCjvSkaIZCOuX98k/nT5BA1dEnNLBU95W1u2WSSzRpgPDgFfKtMZ+evMmdOe+Uq5VeV/rbi19iftSah2K0AtDSYNlOxMev8ys/Ii4QRxYXqD2RLJndkXNcdqgVJdE9uDTJB3Ft/Xg0WvjwMT3WgPip56/QKqEkjdOIdyeNkFI65HW593b3VDMfODXDwPFP4ZmOIIlx2Kgn/1FQudnCEgGFKTG3I/PbZRQVjmH0xn1sB6c4aCUP3UOTyQl+5NQgUyAH3VwYdGPK17wP8OwkMWq1slxO8kdbOcSwGBx57emwgqlKAFLXrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199024)(1800799009)(82310400011)(186009)(46966006)(36840700001)(40470700004)(36756003)(86362001)(40460700003)(40480700001)(5660300002)(4326008)(8676002)(8936002)(426003)(2906002)(36860700001)(450100002)(41300700001)(26005)(1076003)(7696005)(16526019)(2616005)(47076005)(6666004)(83380400001)(336012)(66899024)(478600001)(110136005)(81166007)(44832011)(316002)(356005)(82740400003)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:45.1217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d66e4c6-1775-41e8-4d19-08db9db98c5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6659

This will make it render more nicely if linux-firmware.git moves
to Gitlab or a fork of it is hosted in Gitlab.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 README          | 43 ---------------------------------------
 README.md       | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 check_whence.py |  2 +-
 3 files changed, 55 insertions(+), 44 deletions(-)
 delete mode 100644 README
 create mode 100644 README.md

diff --git a/README b/README
deleted file mode 100644
index 77ff0106..00000000
--- a/README
+++ /dev/null
@@ -1,43 +0,0 @@
-
-	Linux firmware
-	==============
-
-  <http://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git>
-
-  git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
-
-This repository contains all these firmware images which have been
-extracted from older drivers, as well various new firmware images which
-we were never permitted to include in a GPL'd work, but which we _have_
-been permitted to redistribute under separate cover.
-
-To submit firmware to this repository, please send either a git binary
-diff or preferably a git pull request to:
-      linux-firmware@kernel.org
-and also cc: to related mailing lists.
-
-If your commit adds new firmware, it must update the WHENCE file to
-clearly state the license under which the firmware is available, and
-that it is redistributable. Being redistributable includes ensuring
-the firmware license provided includes an implicit or explicit
-patent grant to end users to ensure full functionality of device
-operation with the firmware. If the license is long and involved, it's
-permitted to include it in a separate file and refer to it from the
-WHENCE file ('See LICENSE.foo for details.').
-And if it were possible, a changelog of the firmware itself.
-
-Run 'make check' to check that WHENCE is consistent with the
-repository contents.
-
-Ideally, your commit should contain a Signed-Off-By: from someone
-authoritative on the licensing of the firmware in question (i.e. from
-within the company that owns the code).
-
-
-WARNING:
-=======
-
-Don't send any "CONFIDENTIALITY STATEMENT" in your e-mail, patch or
-request. Otherwise your firmware _will never be accepted_.
-
-Maintainers are really busy, so don't expect a prompt reply.
diff --git a/README.md b/README.md
new file mode 100644
index 00000000..d9fb7895
--- /dev/null
+++ b/README.md
@@ -0,0 +1,54 @@
+
+# Linux firmware
+
+This repository contains all these firmware images which have been
+extracted from older drivers, as well various new firmware images which
+we were never permitted to include in a GPL'd work, but which we _have_
+been permitted to redistribute under separate cover.
+
+## URLs
+
+[HTTP](http://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git)
+
+[Git](git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git)
+
+## Submitting firmware
+
+To submit firmware to this repository, please send either a git binary
+diff or preferably a git pull request to: `linux-firmware@kernel.org`
+and also cc: to related mailing lists.
+
+## Quality
+
+If your commit adds new firmware, it must update the `WHENCE` file to
+clearly state the license under which the firmware is available, and
+that it is redistributable. Being redistributable includes ensuring
+the firmware license provided includes an implicit or explicit
+patent grant to end users to ensure full functionality of device
+operation with the firmware. If the license is long and involved, it's
+permitted to include it in a separate file and refer to it from the
+`WHENCE` file (IE _'See `LICENSE.foo` for details.'_).
+And if it were possible, a changelog of the firmware itself.
+
+To maintain consistent quality on the repository, please run the following
+before submitting a patch:
+
+```shell
+make check
+```
+
+If you don't have pre-commit installed, you can install it with:
+
+```shell
+pip install pre-commit
+```
+
+Your commit **must** contain a `Signed-Off-By:` from someone authoritative on
+the licensing of the firmware in question (i.e. from within the company
+that owns the code).
+
+## Warnings
+
+1. Don't send any "CONFIDENTIALITY STATEMENT" in your e-mail, patch or
+request. Otherwise your firmware _will never be accepted_.
+2. Maintainers are really busy, so don't expect a prompt reply.
diff --git a/check_whence.py b/check_whence.py
index 3658e745..f20c0c86 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -79,7 +79,7 @@ def main():
             "check_whence.py",
             "configure",
             "Makefile",
-            "README",
+            "README.md",
             "copy-firmware.sh",
             "WHENCE",
         ]
-- 
2.25.1

