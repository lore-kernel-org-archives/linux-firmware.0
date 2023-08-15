Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17C2C41513
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2FB6C433AB; Tue, 15 Aug 2023 18:00:48 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37681C433CA;
	Tue, 15 Aug 2023 18:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37681C433CA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jfwt1YwoImu4Gn7+b+TBeQlP7NUO/G/vOpBvkQOtezjEn9PMIYSo7IyttxajElmKH2alq6UuBdHM82sbA035J+c88XciTzx4RJC9S7UhKwRUcot6bTidgwwVc+8cAXuaO90e6O4c3q6lRezEtyTY77oQ4wB7pCgBwn3s80vZxvZ7WI77joolDowUuW3am4HiFfwKPP/gl+zJAtl6tFJOxb4UI3JlnGpPnvC0RHmCMXC8KrCaGvqOZZmbbPKkiq/Qw7OVb7tKCKN9iM6qEhAlfTnWIUBnTyYLm7pnoJm5MokshXEIojFfY5z0MTZ6ww4aRGNxmC4TC+Q8Ohq5Us1oNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1rD4VP4/zqq5uM/UQh0XbCwSpUBEUGAgSxp+J1QAH4=;
 b=hgHcW0Gfb6fiv3dvcbQOz7OlNsjpyzUs5CmOjqh7ghJCJ3oe3UvaCgFLgvPVn5obdsWNXIl7zU+S6TQMbhvgJumdhlzCxJ+cZ7dsP+OzqnT8kcMxYCmh6CBthpsbDHVBFzMAPJ3VFMNKiJjKewvZN8yCdWwOcpl8x8H6UmQQbonpt7JZv6KTWbPcFKWz/2ek+uK0dBz0CVdkh7xB4mAVysp9TEI+Put6iS7kjDv8+lvZklqxqepXI30znEWKBrsTa8lGAWjxvJor3zrKHc8+1SmSdN9PLa2biMbblWM30Yc+kd9QX4nh9Fzd//E1/DeFfwYM9oqBUD2mAZlN2dYz0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1rD4VP4/zqq5uM/UQh0XbCwSpUBEUGAgSxp+J1QAH4=;
 b=U8iyE9GzXdi/x4JBvy43tbfQkGeVu75zqOijl6ry4WkHd5q82EhNG6g+UJzicDoe+FrLDS52LoHQR3UMVt/t6jFzdXHkecKDZ/l43dQE0sOYONWINvKu95iXrcZG4qSlxK0Ym/UR86XyQEoR2XMwoRca/cixZKburzrSpeZcj3Q=
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by CYXPR12MB9278.namprd12.prod.outlook.com (2603:10b6:930:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:44 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::58) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:43 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 17/20] check_whence: reformat using python black
Date: Tue, 15 Aug 2023 13:00:15 -0500
Message-ID: <20230815180018.25554-18-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|CYXPR12MB9278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1202858a-93f0-4cf6-5844-08db9db98b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rQsEl1GTAPFeZs1oA3+WQjHvP6UiZast7ZCo+Gfb82s+xzsRA7bUgJlfo575Csf9qYfvWTWPwuPpw3jKFe/JX6BAwLqkk/lYPcaKOTtWWVAXDQYlMZpsPkKjbAbVypkQN+Lsh5LFHq7AHxcFELtL2sUSHZ6r4kBN9BV74/+BO6tvGcbu6sfQBKcgBXfmo3LkrKMbiW29sgHgONq+6J4Knr7WeC+56j5IeRBpc2+ZRY8XfZ0fbpsznf/ESQ6LbuWrSzjooRlvG4sgmfwRv/8HmX+7lPiRqY0Vf4qLdEgCCMAAOaWhA7kogWoL4P3ni0Qutdun0W7aw2kIbhBaK/CG10ZLEBSOZqpgLEjENayTU94W4dYEZd1zETg4IcB+9LmnWINaC1aAtOfwZeTEJCXOGbUvMKy9zKiSX5fqsE0jOOuUimfmSVDiWAdY21s5Cdd5AW/CGjRc7vapRVRGLpJIxKyxyND94aOKUp6NqCVIjLRsmcR6GN5DmnPnBvtgQGPLCEBnkRx2C3syN2hClHTCLPMQY1aPisn+zlGrmZhTRwzR4IiQFfMHSii9HL0/hx3fyzNsmzN/4IyT2axHKW/IsIe0MMHbd17ZiF7b/xpg1xwsga9zG91OkXDvvyWrzobn/HlNVZTSfP+9AN76Hsqr9ALCLD/I2sncOJBtk5YAFI0IlyR/OoImhptfZBuX1ZcTZUE7p2IQhuCOFkcRdapaRwPw2oh5EKATw39w0liFelznthNAXzJVD03At9SI27TT9vHNg+lDQo4HvDsAh4Lr6A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(336012)(83380400001)(426003)(41300700001)(316002)(8676002)(5660300002)(8936002)(450100002)(82740400003)(81166007)(356005)(40460700003)(6666004)(40480700001)(478600001)(26005)(16526019)(1076003)(2616005)(110136005)(7696005)(44832011)(70586007)(47076005)(70206006)(4326008)(36756003)(36860700001)(2906002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:43.7654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1202858a-93f0-4cf6-5844-08db9db98b90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9278

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 check_whence.py | 85 +++++++++++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 35 deletions(-)

diff --git a/check_whence.py b/check_whence.py
index d45d90f8..bf14aed6 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -3,48 +3,53 @@
 import os, re, sys
 from io import open
 
+
 def list_whence():
-    with open('WHENCE', encoding='utf-8') as whence:
+    with open("WHENCE", encoding="utf-8") as whence:
         for line in whence:
             match = re.match(r'(?:File|Source):\s*"(.*)"', line)
             if match:
                 yield match.group(1)
                 continue
-            match = re.match(r'(?:File|Source):\s*(\S*)', line)
+            match = re.match(r"(?:File|Source):\s*(\S*)", line)
             if match:
                 yield match.group(1)
                 continue
-            match = re.match(r'Licen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n',
-                             line)
+            match = re.match(
+                r"Licen[cs]e: (?:.*\bSee (.*) for details\.?|(\S*))\n", line
+            )
             if match:
                 if match.group(1):
-                    for name in re.split(r', | and ', match.group(1)):
+                    for name in re.split(r", | and ", match.group(1)):
                         yield name
                     continue
                 if match.group(2):
                     # Just one word - may or may not be a filename
-                    if not re.search(r'unknown|distributable', match.group(2),
-                                     re.IGNORECASE):
+                    if not re.search(
+                        r"unknown|distributable", match.group(2), re.IGNORECASE
+                    ):
                         yield match.group(2)
                         continue
 
+
 def list_whence_files():
-    with open('WHENCE', encoding='utf-8') as whence:
+    with open("WHENCE", encoding="utf-8") as whence:
         for line in whence:
-            match = re.match(r'File:\s*(.*)', line)
+            match = re.match(r"File:\s*(.*)", line)
             if match:
-                yield match.group(1).replace("\ ", " ").replace("\"", "")
+                yield match.group(1).replace("\ ", " ").replace('"', "")
                 continue
 
+
 def list_links_list():
-    with open('WHENCE', encoding='utf-8') as whence:
+    with open("WHENCE", encoding="utf-8") as whence:
         for line in whence:
-            match = re.match(r'Link:\s*(.*)', line)
+            match = re.match(r"Link:\s*(.*)", line)
             if match:
                 linkname, target = match.group(1).split("->")
 
-                linkname = linkname.strip().replace("\ ", " ").replace("\"", "")
-                target = target.strip().replace("\ ", " ").replace("\"", "")
+                linkname = linkname.strip().replace("\ ", " ").replace('"', "")
+                target = target.strip().replace("\ ", " ").replace('"', "")
 
                 # Link target is relative to the link
                 target = os.path.join(os.path.dirname(linkname), target)
@@ -53,42 +58,49 @@ def list_links_list():
                 yield (linkname, target)
                 continue
 
+
 def list_git():
-    with os.popen('git ls-files') as git_files:
+    with os.popen("git ls-files") as git_files:
         for line in git_files:
-            yield line.rstrip('\n')
+            yield line.rstrip("\n")
+
 
 def main():
     ret = 0
     whence_list = list(list_whence())
     whence_files = list(list_whence_files())
     links_list = list(list_links_list())
-    known_files = set(name for name in whence_list if not name.endswith('/')) | \
-                  set(['check_whence.py', 'configure', 'Makefile',
-                       'README', 'copy-firmware.sh', 'WHENCE'])
-    known_prefixes = set(name for name in whence_list if name.endswith('/'))
+    known_files = set(name for name in whence_list if not name.endswith("/")) | set(
+        [
+            "check_whence.py",
+            "configure",
+            "Makefile",
+            "README",
+            "copy-firmware.sh",
+            "WHENCE",
+        ]
+    )
+    known_prefixes = set(name for name in whence_list if name.endswith("/"))
     git_files = set(list_git())
 
-    for name in set(name for name in whence_files if name.endswith('/')):
-        sys.stderr.write('E: %s listed in WHENCE as File, but is directory\n' %
-                         name)
+    for name in set(name for name in whence_files if name.endswith("/")):
+        sys.stderr.write("E: %s listed in WHENCE as File, but is directory\n" % name)
         ret = 1
 
     for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
-        sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
+        sys.stderr.write("E: %s listed in WHENCE twice\n" % name)
         ret = 1
 
     for name in set(link for link in whence_files if os.path.islink(link)):
-        sys.stderr.write('E: %s listed in WHENCE as File, but is a symlink\n' %
-                         name)
+        sys.stderr.write("E: %s listed in WHENCE as File, but is a symlink\n" % name)
         ret = 1
 
     for name in set(link[0] for link in links_list if os.path.islink(link[0])):
-        sys.stderr.write('E: %s listed in WHENCE as Link, is in tree\n' % name)
+        sys.stderr.write("E: %s listed in WHENCE as Link, is in tree\n" % name)
         ret = 1
 
     for name in sorted(list(known_files - git_files)):
-        sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
+        sys.stderr.write("E: %s listed in WHENCE does not exist\n" % name)
         ret = 1
 
     # A link can point to another link, or to a file...
@@ -99,20 +111,22 @@ def main():
         dirname = target
         while True:
             dirname = os.path.dirname(dirname)
-            if dirname == '':
+            if dirname == "":
                 break
             valid_targets.add(dirname)
 
     for name, target in sorted(links_list):
         if target not in valid_targets:
-            sys.stderr.write('E: target %s of link %s in WHENCE'
-                             ' does not exist\n' % (target, name))
+            sys.stderr.write(
+                "E: target %s of link %s in WHENCE" " does not exist\n" % (target, name)
+            )
             ret = 1
 
     for name in sorted(list(git_files - known_files)):
         # Ignore subdirectory changelogs and GPG detached signatures
-        if (name.endswith('/ChangeLog') or
-            (name.endswith('.asc') and name[:-4] in known_files)):
+        if name.endswith("/ChangeLog") or (
+            name.endswith(".asc") and name[:-4] in known_files
+        ):
             continue
 
         # Ignore unknown files in known directories
@@ -120,9 +134,10 @@ def main():
             if name.startswith(prefix):
                 break
         else:
-            sys.stderr.write('E: %s not listed in WHENCE\n' % name)
+            sys.stderr.write("E: %s not listed in WHENCE\n" % name)
             ret = 1
     return ret
 
-if __name__ == '__main__':
+
+if __name__ == "__main__":
     sys.exit(main())
-- 
2.25.1

