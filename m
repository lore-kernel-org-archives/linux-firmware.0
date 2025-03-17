Return-Path: <SRS0=8ycF=WE=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7ECC35FF8
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Mar 2025 19:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18B3DC4CEF0; Mon, 17 Mar 2025 19:16:42 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D424C4CEEE;
	Mon, 17 Mar 2025 19:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D424C4CEEE
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvsU6BHBSvZ5sjYZ+oplmn/wiYNbbCLG5ZvWwogRdP62kYmjZXDRaIx0bQ7Tms5Ow9p5BGT9zBS7mTR2jk0UVfWhKh1bTaJ0aQPi3eweoJj878n4XfXvtyFgedxX2Zc+/DoNqnGJx1nPG29EuNNLwtorpaNxfO1fV/O60SAafx8dJldB2Th+c7kJZBwVsIY5zmuMlCZayZkwZLZDvg83P7Qtyw/tObsO6TuMjGt4MOW3eluOx4Cdpj3NNExhK3kuqJcQTZJrNbm5gP+Sp8U1OOBZxQZwTW4vohqrMkMsoGjuPzQKmemkERS7ZyyqbuFWfxZgwg4hAZuLH/sfnDYcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPfXrbi02b2TRaOTf5h15LHaoCwePlrhNNendjPC2ok=;
 b=TAziMmmFkTe2KjEFUVArruVb2yU3iyaC3Tu86abuQt7pgKvxmkcxNI1QH7q+7QkM75R4db8X+9qHS/SUso9/En+LwHuGCeUFGA2OWzOWW3U6BrIzZr9yHgpFLfYHH+1mGMUVWBGd+UVNbFtZi+ZA5pJ4vf40g2emsr90h3K84deKMcqUdqCfmFOp7bxdILUCRkgjfQB2Bo6n04dMkBr0FzJvycz//whlOr5mefcQwB57gv0lozwuMla45uK3Y8kzBV5Ua3mpHfz+0/qb4JgfK0m8MGyp6AxrJqXUyhF6nISDfOr4MiTT9EpsZeFQVJvP2c+79BcD7DwG15ezLKtL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPfXrbi02b2TRaOTf5h15LHaoCwePlrhNNendjPC2ok=;
 b=C09f4pJPIqQTEdqd8pYhbcMaRG8NqP1Krxo5/Jc4RnUqRT6kWCQhMuYYx2KiVZoKrCDtP13hv9yIkOP3nFsjbFCsa+/8dA7iv53D0hJ0bPuaKa7NvQwmDL45l9s+XgMI6rRg/vB3VM17MVfP/e4YMqZQYjtE21tPlgfPOhOg/ABa9CUVCF4yAiqHRPg1LkeWJ2y1l/QeZAgp4zWfS4j1EfAPibNNOc4Q7iRjCtaQTJ96083OaKZrqLRAsGvad+I6cJDokUONcqaEFvoWekK+2XMW5/WBKY2z4OB6gt4L+9Yv4uOKlJiG1q9c+Bvf6zXlBW8ID3YLSBMlntHHv+gpbQ==
Received: from MW4PR04CA0318.namprd04.prod.outlook.com (2603:10b6:303:82::23)
 by PH0PR12MB7080.namprd12.prod.outlook.com (2603:10b6:510:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 19:16:35 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::7c) by MW4PR04CA0318.outlook.office365.com
 (2603:10b6:303:82::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Mon,
 17 Mar 2025 19:16:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Mon, 17 Mar 2025 19:16:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 17 Mar
 2025 12:16:18 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 17 Mar
 2025 12:16:17 -0700
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <jwboyer@kernel.org>, <superm1@gmail.com>, <maxim.cournoyer@gmail.com>,
	<linux-firmware@kernel.org>
Subject: [PATCH 2/2] copy-firmware: fail gracefully if moreutils parallel is installed
Date: Mon, 17 Mar 2025 14:16:06 -0500
Message-ID: <20250317191606.64181-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317191606.64181-1-ttabi@nvidia.com>
References: <20250317191606.64181-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|PH0PR12MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: fed4a7bc-d746-4431-9dc0-08dd65883b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vg1VYLN6DeSD3tpOwQrwV4r7vbkWR683FnYtXRHlo3KpT+jkWn5eANOmahzE?=
 =?us-ascii?Q?zCW7R0B7j34fujzMrxKo7tuoYaEeIy2ow4hpRR09ylhzfY/yBgZsBdm0KOLO?=
 =?us-ascii?Q?b02ygYRCF5VgP6ByCoaaXp411fJszjIafZNy17PQ9svROmrl3b6el061L9Iu?=
 =?us-ascii?Q?JH07+Mj9HvwzbxecegKx66lW1PFg93Owdnx2Zu7Knbvi4rXm7vclSrXOcZoU?=
 =?us-ascii?Q?K6i+tVSiFK1YtqVeHp8A1PEKfuo97VXPmaRz100px/yk9yA5xpQeldEUWX4q?=
 =?us-ascii?Q?PGu4wX+nYTHHyvMxLhSl0r74OFa+J/7sCLStXqdNhiMBXn6fDdovu9K6vbtB?=
 =?us-ascii?Q?QskvL08g2k3tFNDOvfCGlPtPXSOA+O2dRTGE8gBFEvM95Zc7x1l+iPlvn4Fx?=
 =?us-ascii?Q?1y9BNwe3CPVsANgD+i41pUPBSddsDIJUqTizwskxe3va9EQZrSRN1/rGyn4A?=
 =?us-ascii?Q?vLQb4lBBQyd3NnBvFsc2nxgGoOFcOvEKy2k2CBGgWXw2++dzRSC98vTZA+Ug?=
 =?us-ascii?Q?2lVK/tmiS5J82OxyfUPIwrCg/Sr1oa6tRMTD13neGvd4JHioM8+5UVHSeZ59?=
 =?us-ascii?Q?TLWAYPS0WJH2985649gXIuWDcbhZpbKwA4KNaZh13CEQ/QW/tl1lS38hP16u?=
 =?us-ascii?Q?iO+J+FFC2sZZctxFDoAVBLCQn+XkYXX2opN3pOaRiwwPtohusIcGNFW/KYbm?=
 =?us-ascii?Q?YO07EiKa4uWktCUOnxRLpijheGgsDkZ14oU+UVAr00umoa/nfvH6ScEgxrIa?=
 =?us-ascii?Q?BSTQ9PqL/hEskknaws+rnCSVzWKJZv9axpMyeaO7TiXQNVoV5IQwB/6sd90O?=
 =?us-ascii?Q?M0RQOnHwGXL8XdyJcncHia7a7bm5XcCfjWwcYtOhEQ1GvGTxbB9MOhTiHjuN?=
 =?us-ascii?Q?SZmkUuIxvmzSZZzcSGwUsCa636ZlLoJ8Z4LX88XKqAi/aN05e9fYj/I3MZit?=
 =?us-ascii?Q?lxb7q+ozTGsSBYAZuaLWVIHz41KylHJG/4j+xfslxU623vZxITK9ZMLsomgn?=
 =?us-ascii?Q?xA0fS2Tcx0rPbRrw8f0WaTSVLz7NRsnyAaE0tiwqbnUx/YVH5/hbWpFuA4EP?=
 =?us-ascii?Q?UOwk4fltuGRv6BKizwc2OKnd3DQ8zO1ZbIXVtZ0m1krcX7w5+39z00Zi1zO7?=
 =?us-ascii?Q?hbeKf/FlNilDqKchjA5dUApjCt1Q7hoCpbODv71vAe9N0HBUVtoKX6Oma4UB?=
 =?us-ascii?Q?/m1Fp6cWuu3EoOFmBiDJdyWry0m/SoTVTIStM1oGa4sTZvunLejnWPcTuATJ?=
 =?us-ascii?Q?3MTKzYlqXcuxTPNgfZL+k/S4VqQ1Bm2ExbSOUcu7G3J/O60i3q0cYpJ8P7rv?=
 =?us-ascii?Q?AUK3CB6kZ0vb8y0K2nthdcXktRMsv+0NpIgwTstWIWCu2vgZABra3u7W0tLJ?=
 =?us-ascii?Q?ykaaz9+k3Vi4aEbSbpA/MFvVIMUzJtvnharlJrCPhce9fwpYH5U9u/ADNdPv?=
 =?us-ascii?Q?LRoCHlXZlZvGXMDTmX80VO3sngAZlmRZX41+UHtWavA++5EKr4vb4U8fMpXW?=
 =?us-ascii?Q?rmG9WjwZ8Aw1j8E=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 19:16:34.5814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed4a7bc-d746-4431-9dc0-08dd65883b9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7080

The copy-firmware.sh script can use the "parallel" command to
parallelize some operations, but it needs the GNU version of
parallel.  There is another, simpler version of parallel that is part
of the moreutils package, but that version confuses the
has_gnu_parallel() function.  So first test to make sure that
the --version parameter is even recognized before trying to use it.

If in the future, moreutils parallel adds support for --version, this
script should still work because that version should never report
"GNU parallel".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 copy-firmware.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index cd5a6893..d8bfa2a3 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -27,6 +27,14 @@ warn() {
 
 has_gnu_parallel() {
     if command -v parallel > /dev/null; then
+        # The moreutils package comes with a simpler version of "parallel"
+        # that does not support the --version or -a options.  Check for
+        # that first.  In some distros, installing the "parallel" package
+        # will replace the moreutils version with the GNU version.
+        parallel --version >/dev/null 2>&1
+        if [ $? -ne 0 ]; then
+            return 1
+        fi
         if parallel --version | grep -Fqi 'gnu parallel'; then
            return 0
         fi
-- 
2.43.0

