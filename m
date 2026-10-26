Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C5F606A31B
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Oct 2026 20:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OUdw/4g2
Received: by smtp.kernel.org (Postfix)
	id C55EC1F01828; Mon, 26 Oct 2026 20:55:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.42
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793048150;
	b=e9H8wmM0wv396pi1I5jneq7iD3wmK+rVqXjLtKosQ2qzWVNZ4k96jz/w+Ppjl3TRUuXj
	 TSVF2IDQgjjd03T0b1wtMM+gWU5pqhi7b8m5xZ2WxlI/oZh0oysHzNbxswtDrv/DrmnlO
	 7BeibBP/fzpz8+4XUvrhnleyq4iA2yjPp1I22M+BLiBv2ymJHnbEq9vTQdPvDdDxPCwpl
	 g2RvFNXgWo5+vGYuWQNXS+W29FtConidbIiNLI5gMJkB+4IUnAovmyz0qn4HTX3Q8gIUB
	 5cjGyhAmtXPtrAkfkwUjYNe5A7eCt3ifNy5PLQqWoKUbWDZ5mn3QpoGmK29OJxN2sRw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793048150;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:List-Id:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GhuHEnKt9zXXu0tHADCOPlBuL6rrnV2KlnG/4h5ulC8=;
	b=Bbsu8CDteVodW/IM2NXrbLnOe00kOaqVZ/oPYBXQNmOY9xIa5IjlVeq/9OPaJyHTzR2T
	 JmeOj8R3HaDfxvcf+U5LvHI80O7UxKisXTJ2112bM0ffUmhEyawaRHpN+IHVZYqVPaOSK
	 qaT7ClmtsdtjYrXYXSo826VwCX3RV0WyxTUVmO9BVnLbJBiYlgm7sA3MR+IItrA76p2oD
	 Ed54c6ZuSflVtfAgJ1GKpAoZUJJf47aIR6Bjicd7IH/aDH7SvnNbxyCnKXhGg6bR2II0t
	 MV2nKPwswpRcKvBWe+kDXFKn2cJbCxU+FTe9fRx2qXXxtufiU4+Nb0FFOnzoSQjLb5g==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="OUdw/4g2";
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.42
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E79971F01825
	for <linux-firmware@kernel.org>; Mon, 26 Oct 2026 20:55:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OUdw/4g2
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E79971F01825
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DljCMAQhMvZPMNRhDGRLd02T/x/7wlsJm/y+jYIeQ103uf7eXpjfrrUg0xYO1LXqq6+BwvkjY6x7+qiZvRvC3lOHo2/dglBbzEl0N1rlRCjb3Dn9s65QISvVa0rnib0t9lFLK1rYk0FI2X/VHsUd/UsTrfbn4RGzPIzWfdEqHeN3A+BK7tRbvDWGisU4BpJF7sjdToJFeXZ3rDtu1aPiYrDbYtMSvpMqAZF2r5j86Y+4NWZwOdkpUxbIYvm+emntevGAkkaaMJWA5wWTW/VexPrAxBxH4gBzscpQ3Sw3xhomHpebpTpTPt1IpNhTvWbRKfhc7LksrhAcYZjb8q0qQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhuHEnKt9zXXu0tHADCOPlBuL6rrnV2KlnG/4h5ulC8=;
 b=hfZPTp2lUTOQ4l0vN6QSAQ2utvHJpjOEZbb1kch+U2zZA8C8b/Zyn56EVvT1ZSWIHfZpgjRKVvnqqKKNzt6bUr/+dhKT+NfkibSf5l2J7Rm+JUWU5U3a+D6IlhLmowPcz8BfdUhv/F+i/wAQOGmXIyHwO0SNwmtsNMDW7JAne/Til/hTn5Fd3IgNX6Xe9aj78iAfTv80R5MjtevEYQmAc2zPWrid5DFlFPkjUSbQGwN9FgEz901DNJ4DV+FHEQ4XOx6EhbaGMnDq7Qn1F5VeGN4RbZiKk8Wm9g9dSo3gJzwr/xt9cH/OkdqcUqteyMW49ADOcsVlMeKxE3SYSgo3Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhuHEnKt9zXXu0tHADCOPlBuL6rrnV2KlnG/4h5ulC8=;
 b=OUdw/4g283YnC0XVoLqUFTwpWfVk5E3cDCvyEV/YrTf8fLTi+UlAITJK3lwS02uZQVAvi3zPT5d1D2AvsleDmVxgVjHETHdNtNjbR/UwH5aqjmkhry8kIvQeNQTzBIZBZ3gJRwuKdHulupCrz41aQTMSJTZlGDtHCwjbsTFODfdtzBPDKHCcvFCF/KzrMCtrwjBREHFoLy9jRVBPvfsYTMHUWvgPwczlHV0/yVUzf3PcdkpAX7ivRInkmZHMFE/d52StBtBclAIdpRKKr3khHzOIMFfQjwnTsJZrAHgB8dFhoVVNQCue+2KC56cCJ7SbT6P8KsMBPZNtapCnOcKgyA==
Received: from BY3PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:39a::20)
 by DS0PR12MB999080.namprd12.prod.outlook.com (2603:10b6:8:2fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 20:55:40 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::74) by BY3PR03CA0015.outlook.office365.com
 (2603:10b6:a03:39a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 20:55:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 20:55:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 26 Oct
 2026 13:55:19 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 26 Oct
 2026 13:55:19 -0700
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: [PATCH] copy-firmware: allow partial installations
Date: Mon, 26 Oct 2026 15:55:10 -0500
Message-ID: <20261026205510.1308898-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|DS0PR12MB999080:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ad5003-ac6a-424e-5eaf-08df33a37e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|56012099006|261026140227099003|6133799003|18002099003|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Z89hesrUhrUjIxco4mZKWZap3IeSBPOFlo4SJVhOvIWuX1jXNlXJKdC6phdIDrKfAJAtRIWj61vYxza85lFGRKOOqId3lT/fjBpjafhxEuoDb9SuMYHMAg8MulSVwxp6mQ7dALaAU882T9XyhflDAt3eaXtBlfOEKuydTD78mwVx4Yx7/66SZ+K/UyilIMf5XmjcwRyU1DOLTjwKGeTtOKSOhf22Y4IRySwkJhd8V8blIrBGxeSluq+yhiRHmRmnGmiSKD791Rnur2bbjoWYaBQvSdg07XYAj9fcTpqc89Dh/0gDkAbHce1bcdAjSSzj1IZwP7GAiRgOW0CGqi3Mo+3uhSRUnr6ASx731jvqaRR6dXGBpYL4ZbbZz9Nac8tLyuAS13QRTzbVdacgZiZncZGrb6zRwTgONnA/DD3lvMrPZFOeJupW6VHsFTRd6roO06gObKRs/jfI3f2qkGhEhVKFd6DmT6FvEloUpoEfYGRpDbMlRNKPlaa2cwUlTyaLhKKKEFiiDUiELHAdVPJGDvM0Se+U6xrXg1sNnzgw0esnopWW/N0ETUSLh1zUIWrEMnRqOFqvMu9Glq2AzSgd64N7w7KSrGRJmaQgvTw3Zmj34ihBcdqKFYjVJ7HngliGgPkgBGpZer0/AhoYUJtgYzu82IUbv9dLsfuSIzm1OEL4W8x9+f0EV7YogtvtdiopToI5eICs5uN9zvD6NJiYJw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(18002099003)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wKfE/q6pLj3PvOcJl/X84MRfVViz/OugRpGS0my3RC5C0k2ie7attlfxmNIJw8/CV0Eo6oevYBp2Ue9jbHANii/rpyXmRer1/4Lu6FNoox3mtyEKpFxs4MDmKPCsjn+S9/FJygPrtixftGcEhD2rzPwZVix85j63r4typdP0N1txk1iH8KqbVAX5FmntO2X5XkCMXQbXVoZvnW7xqqBBTDOWIOEH1QRWLJoKgw2GihEZslcH8iM4ic1EBDG1+kYgwwyvFlErV9kYgql9Ene6cK0zwdzXVN+QJ5Or4MCDIE+Ce4vj+R1+6hNqln83L5pyyUMsHgDRFH5BgIQ3ILpU/Snbw2KZ1HTlAhS6WRK2bTKUNz3uPYzkrkpnt2f73knnOz8bHaPljT/lT9O83QO2S0fb/Tq8/qX1Z83xU5pGmoQcuW1fXb0yNuoo7JZeGqnh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 20:55:39.7576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ad5003-ac6a-424e-5eaf-08df33a37e1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999080
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FORGED_SPF_HELO,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_FAIL,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the "-p <path>" parameter that allows for only installing paths,
links, and symlinks that match <path>.

This is useful, for example, for installing firmware only from one
vendor.  It can also be used to install a subject of a vendor's
firmware, but symlinks that link to outside that subset will be
ignored, and so the result could be invalid.  Caveat emptor.

None of the other scripts or makefiles are updated to use this option,
so it can only be triggered by running copy-firmware.sh directly.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 copy-firmware.sh | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index f9a609cf..8546a467 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -10,9 +10,10 @@ compress=cat
 compext=
 destdir=
 num_jobs=1
+prefix=
 
 usage() {
-    echo "Usage: $0 [-v] [-jN] [--xz|--zstd] <destination directory>"
+    echo "Usage: $0 [-v] [-jN] [-p <path>] [--xz|--zstd] <destination directory>"
 }
 
 err() {
@@ -62,6 +63,16 @@ while test $# -gt 0; do
             shift
             ;;
 
+        -p | --path)
+            # No path in WHENCE begins with a dash, so an option here means
+            # that the path was left out.
+            case "$2" in
+                "" | -*) err "$1 requires a path argument" ;;
+            esac
+            prefix="$2"
+            shift 2
+            ;;
+
         --xz)
             if test "$compext" = ".zst"; then
                 err "cannot mix XZ and ZSTD compression"
@@ -108,6 +119,15 @@ if test -z "$destdir"; then
     err "destination directory was not specified"
 fi
 
+# If -p <path> is specified, then only install paths/files/links that
+# start with <path>.  This allow for a partial installation, e.g.
+# everything only from one vendor.
+prefix="${prefix#/}"
+
+# Escape the regular expression metacharacters in <path> so that the grep call
+# below doesn't get confused.
+prefix_re=$(printf '%s' "$prefix" | sed -e 's/[][\.*+?(){}|^$]/\\&/g')
+
 if test -d "$destdir"; then
     find "$destdir" -type d -empty >/dev/null || warn "destination folder is not empty."
 fi
@@ -117,8 +137,15 @@ if test -e .git/config; then
     ./check_whence.py || err "check_whence.py has detected errors."
 fi
 
+if test -n "$prefix"; then
+    $verbose "installing only files and links starting with $prefix"
+    grep -qE "^(RawFile|File|Link): *\"?$prefix_re" WHENCE ||
+        err "no files or links in WHENCE start with \"$prefix\""
+fi
+
+# The optional quote in the patterns below covers paths that contain spaces
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
-grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
+grep -E "^(RawFile|File): *\"?$prefix_re" WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     install -d "$destdir/$(dirname "$f")"
     $verbose "copying/compressing file $f$compext"
     if test "$compress" != "cat" && test "$k" = "RawFile"; then
@@ -142,7 +169,7 @@ if [ "$num_jobs" -gt 1 ]; then
 fi
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
-grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read l t; do
+grep -E "^Link: *\"?$prefix_re" WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read l t; do
     directory="$destdir/$(dirname "$l")"
     install -d "$directory"
     target="$(cd "$directory" && realpath -m -s "$t")"
@@ -154,6 +181,14 @@ grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read l t; do
             ln -s "$t" "$destdir/$l"
         fi
     else
+        # Test for situations where a partial installation results in a
+        # a symlink to a file outside the given <path>.  This could happen,
+        # for example, if <path> specifies a small subset of all the files
+        # from one vendor.
+        if test -n "$prefix" && ! test -e "$target$compext"; then
+            warn "skipping link $l, target $t was not installed"
+            continue
+        fi
         $verbose "creating link $l$compext -> $t$compext"
         if [ "$num_jobs" -gt 1 ]; then
             echo "ln -s \"$t$compext\" \"$destdir/$l$compext\"" >> "$parallel_args_file"

base-commit: 98b55c84e8da5c09dd9b8d21f5667c63db5993fa
-- 
2.54.0

