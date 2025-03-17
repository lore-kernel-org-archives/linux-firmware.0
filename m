Return-Path: <SRS0=8ycF=WE=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA823C282EC
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Mar 2025 19:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3587C4CEED; Mon, 17 Mar 2025 19:16:39 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9140EC4CEE3;
	Mon, 17 Mar 2025 19:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9140EC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+8dRTTWC09xo/9sz3ksCOJKqd3kyp03aXFDHKtIvLWewWFTEiSLM/bGQFdzlwmcg5C6d9zCOVtvxpMZD90Vr1vNasGgcpyTIrMO6Pe5KUAyM9S6R69w8hQ2/Do/nzZpuGAZHOAjbHFEP12A5y6rHS8llFyPXoCwWUu51jZpLv/K/hXN+OcDe+/CZEsTWCyQ/CIZveiH+OeEe6A8HSSd7ln0qPAudoGVonUU+/croH2nNtVp4DPS/tpCg+mEnLyq+OKX6DWzt2SolG82eAVnFF4pUbFWY84fqbUwqdtfCs4OB8nwo7TPcnzo6cM9IUIWpTqVHmnueKH17RRRKiRjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzTNJrmMmP/vx66wcGOAnVhxFJsuKuiqV9YNO1WwaLk=;
 b=yWt/brJJRNAAbnaPpP3W1u2j0D4UICJ/LNcasS6j2CyuBhBwiD+e4PRItIw4Op3SdKvMc7l76LdpYUUAJHqrue6AeKs84OF7ooNYUlwrjosEnurihN/jQ5khu1ynTQKBmCAnLgEhYbHbEDgIW7454QSxi/4XOULXo8j9Turqu3a8c35qRUf0UTH+rAW+wccTi2RRKflWSULbpqXvkzcDnnB6bQcqtSWL/vw/SNJ5cKIxPV27CHPmGBVLQ0wqkAche7D2I6eKuwfd6OvcbE9tXKHz3zeidIfzijk+HYrKqBjFcvq5VMfS1UfHbLsqeuLRPEjJWSBnRDwJHkFYBKZw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzTNJrmMmP/vx66wcGOAnVhxFJsuKuiqV9YNO1WwaLk=;
 b=PfNXCm0YU5TS0W4IWjwMZeZJjhENN8CIWIFw0mFOvG2otUqwFTkm76O+NpL52DkFkEMJpntMNII3gfOVxyd3qYEoYA84btS+ooRdPOfMONtLluSzYxbjLp/DfLjEDad+turbAZ0PWDSa46M4DhKGy05awcHOJjS1fHF971oO2oVbonnShbiRjy5bT+tQfB2lVZa8xN3a/pVZLYEdBByGvQBfucw6N+msngZa+5aDyAc0pVl+pwutmBEeC5XQHT3XyntBN0Fp20XLUknHjuU8hTAxxKQzqi9JSC7HdD8yTDJ45iMBNlu8GVyctR5FLwcloovabgkbhUqpDDa4XU0ZIQ==
Received: from PH7PR17CA0070.namprd17.prod.outlook.com (2603:10b6:510:325::10)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 19:16:31 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::fa) by PH7PR17CA0070.outlook.office365.com
 (2603:10b6:510:325::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.30 via Frontend Transport; Mon,
 17 Mar 2025 19:16:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 19:16:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Mar
 2025 12:16:17 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 17 Mar
 2025 12:16:16 -0700
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <superm1@gmail.com>, <maxim.cournoyer@gmail.com>,
	<linux-firmware@kernel.org>
Subject: [PATCH 1/2] copy-firmware: make script smarter about parameters
Date: Mon, 17 Mar 2025 14:16:05 -0500
Message-ID: <20250317191606.64181-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 0339ce65-c79d-4a85-15d5-08dd658839c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UigApMLfrZB3IIynAYLLMMpF60C7p0eKSawLAsgT57ky3imDB3icbLUhOHrX?=
 =?us-ascii?Q?aefOD0EC/2ey3/pFypiKDIqHb3sdY/N2xqI+soQNymB90rtQVCcvGKjAyvgg?=
 =?us-ascii?Q?oGEGdcr0Llvs88Nnt3efXOIdeJuIDvsTHloxaBOX/n5uolM1qCV/fmTNeYY6?=
 =?us-ascii?Q?JOHoTl9HTQs4qp+M6ClXhZNwFEvAI/8NOQSb4CBconiGpNE9h12kmg5++/qV?=
 =?us-ascii?Q?5YwRjKMbolyXpOEQLJXa+RmDnTeUMDQbyh6+0TPDBT5ssn53C+qpx+EeSLX7?=
 =?us-ascii?Q?Z46RFzw8mJA5RRzf4uFpI+g88n5W3ThgKl9i+07wgkwPfGGzS21OVFdq8B/o?=
 =?us-ascii?Q?b/WO32Xets+n1jskOR85snnJmUNoq5/cSu3ZlERd/hglqNUlTeA80y0zsS09?=
 =?us-ascii?Q?aa48kqPLLcBFxCgGdeHZ7OJUU8UFofLoIDmV/U/Eij5gepAEktr8UO2UT+qD?=
 =?us-ascii?Q?DNCBzkkhGxaH3mTJ3GWgsppuJp2Q3OuEg+LNJHAMXRywg2TF5GUwpaemwBBk?=
 =?us-ascii?Q?5p0A1c/ubk9e3sMYqqjIyJ+uBzCva2lQg2eDpv2SgsLA2rZvRGEEc8fY5OaF?=
 =?us-ascii?Q?HZftiklbGlwLehFLBrTM+mjNFJAAXb6zcBiqjFHsRn6KxLfHsjQkX5uVip3U?=
 =?us-ascii?Q?cYdyp+kZpcZrr8tLeKGrvXX4wpCNOV2hge3Dr4MK3pefeTboHa2EZ9X2kdpJ?=
 =?us-ascii?Q?iSf8xjPEtnY/38DoBDUqE6kn8g4sNAkqq3HujzRmqx61C6ez65gcDVlHKu7Q?=
 =?us-ascii?Q?QWejwv0E0kIy+rYEGQ/4kmxdDt9MwM19aP2plwbjqvut+lMfl117TIjKEzh3?=
 =?us-ascii?Q?6JoQ4iJpXY1aVUd9GeGp2jhig1XUUV1tGBJtQvp+Y2zlTDX7pljXVcvXQNiL?=
 =?us-ascii?Q?PunA4ozm2zBTIZ49uZ2/nhclMTA4jlJKr2/lfM/GOuuyCsxZFM9KFxPjxpE7?=
 =?us-ascii?Q?NfpQdkQ+tZ08dXrPH19YVJyrTEdKyykzMfBxcZA91Y6XK8R6yJ5nmNS4kXXk?=
 =?us-ascii?Q?550tqatGCxKsnjk+jdelYjnMc6y3QRBsqVduzt6ntvALk4XEaIvt3YOuAqJK?=
 =?us-ascii?Q?Q3pP66m64FqmoFJKzeKbvbdUQysvLEhPwkE1mfqp/bUhvY4zhyy568eG5cgX?=
 =?us-ascii?Q?z8TU0z0bxZUkutpwaD1f0o+RoUceE9IoPCJs+TsvnXDn8hBKTlTdugQ4hE/r?=
 =?us-ascii?Q?upVMJUl90PxBoswyw+U4f/Jh9rRw2lGv31sif+9FcQWTsHq3FnS1PEre6lVM?=
 =?us-ascii?Q?ZkVK6ik0518eEnlXGT5luVgnhVc4ooa4QqCJ131mOxSGy7naeSaSPfsw/+bL?=
 =?us-ascii?Q?doudJJpKFeUuR83t5voLvv6oAr1XqE4UL/AnaS9Nwfy2vNZsz0uOdqQZr0Xh?=
 =?us-ascii?Q?t3RjzKYbJhlDUTH7HRCH80/t1AP7qBFxg6VBsLk/jr5iUzo6kEFdcM6kuT2p?=
 =?us-ascii?Q?b/6v8pkdZBZ1AL6Pr2Ge8dFpW+G+7Wwk1RKxoW4MDV1p6NJ02XYEYv3X7Oxu?=
 =?us-ascii?Q?MvoCnMH1cyE0HJY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 19:16:31.4050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0339ce65-c79d-4a85-15d5-08dd658839c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283

Several improvements to copy-firmware.sh that make it more friendly
when passed unknown or not exactly correct command-line parameters.

1) Add a usage() function to show the command-line options.
2) Print that usage on all errors.
3) Don't fail with a weird error if there's a space between -j and
   the number.
4) Add support for the -h or --help options.
5) Ignore any command-line unsupported parameters that start with
   a dash.  This is necessary because otherwise the script will
   assume the option is actually a destination directory, and then
   the "test" command will get confused.  Drawback is that we don't
   support any more destination directories that start with a dash,
   but no one does that.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 copy-firmware.sh | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index dd4b9b6f..cd5a6893 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -11,8 +11,13 @@ compext=
 destdir=
 num_jobs=1
 
+usage() {
+    echo "Usage: $0 [-v] [-jN] [--xz|--zstd] <destination directory>"
+}
+
 err() {
     printf "ERROR: %s\n" "$*"
+    usage
     exit 1
 }
 
@@ -39,6 +44,7 @@ while test $# -gt 0; do
 
         -j*)
             num_jobs=$(echo "$1" | sed 's/-j//')
+            num_jobs=${num_jobs:-1}
             if [ "$num_jobs" -gt 1 ] && ! has_gnu_parallel; then
                     err "the GNU parallel command is required to use -j"
             fi
@@ -66,6 +72,18 @@ while test $# -gt 0; do
             shift
             ;;
 
+        -h|--help)
+            usage
+            exit 1
+            ;;
+
+        -*)
+            # Ignore anything else that begins with - because that confuses
+            # the "test" command below
+            warn "ignoring option $1"
+            shift
+            ;;
+
         *)
             if test -n "$destdir"; then
                 err "unknown command-line options: $*"
-- 
2.43.0

