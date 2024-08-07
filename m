Return-Path: <SRS0=mgRo=PG=amd.com=Pratap.Nirujogi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2627C52D6F
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Aug 2024 20:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8DE7C4AF12; Wed,  7 Aug 2024 20:22:54 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99967C4AF09;
	Wed,  7 Aug 2024 20:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99967C4AF09
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPHmjUZTcRy7zZvEbPG1Etc3KJwFxZJKDqixlkBdoT69B69kXUh24QbrxyHK1RONeU41td+cJZHCpRP+Ohh+d3gnGF01W8c9F8YRCBDUhvvls2mpE+Appf5X2x70bLjlxjh6Sf4Y1cwUsNmPpNsQZ3zQyLn+IhcNNH1C+7Vxdej/o0n5Zse9Bp2Gyu/L3q30qw4aRWSIsetza1Wz1JcpLDzBLFUYULkrhxAS8HJAFRnqTRFxYNc5ESMkChVFOE55jPiXEZeNOeyva8sgUc1iSrZjw9CnX8RaaROLP0S+gsgkWMmGLnV0PPYkrLxLqcXdLJ7BLNVy6DmoJor8vkdTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=585a3c8PiI1uPCU2f8G4oRIu5+RnggyEEdekuIGgWpg=;
 b=BgU59z0+siHZRbEkVD+pWQE4eNTKBrYr4tiI4z0Qall/8zg4jIHZSPd6HxLEhFvv2wEahb4eOer27jS+xZkA6P/luaCw3rDji8gB0U6tkLSfXg9PlVOHDkYB2QU/FgwKIDdmPCgtbiLhSmP1x3Pw/x2cs0fjqn359ytcqaVAwM9yKQV51IEMKy0OwelIAng8Dgh8FmzCPLLUDrjrMzKYpxE0TtBfQFs310Nzry5HsZls2IkIQjbw/3giAvGpyrK/85G6HEUULqjyOTSmUR+BDL42tjkRG6KL2oRcpxXtzX8ZS+etkBda5sAOCp9ky/RAqcmQ6eMuZBJ8vmJaCrSDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=585a3c8PiI1uPCU2f8G4oRIu5+RnggyEEdekuIGgWpg=;
 b=gLEcQWmhkYV8B6ksqjqrS8S3YTiwsXbs/RIuOSLyDk5OMTb4ZXgTiU3bg+nKxl1WVofUB+LyHLp4R5heU9r0ROt8WAtR9gvTniEvOj6Z6zHWHqUAgXNd0sFM58ctwBF57gYQ2DljBvGHUfwwoiBy2nJ15v9GSfocWlZWKGoZw54=
Received: from SJ0PR13CA0196.namprd13.prod.outlook.com (2603:10b6:a03:2c3::21)
 by MN0PR12MB6056.namprd12.prod.outlook.com (2603:10b6:208:3cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 20:22:48 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::9a) by SJ0PR13CA0196.outlook.office365.com
 (2603:10b6:a03:2c3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13 via Frontend
 Transport; Wed, 7 Aug 2024 20:22:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 7 Aug 2024 20:22:47 +0000
Received: from pnirujog-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 Aug
 2024 15:22:46 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Benjamin Chan <benjamin.chan@amd.com>, King Li
	<king.li@amd.com>
Subject: pull request: amdgpu: Update ISP FW for isp v4.1.1
Date: Wed, 7 Aug 2024 16:22:33 -0400
Message-ID: <20240807202233.246768-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|MN0PR12MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dd0ff6-1404-42b8-b13a-08dcb71eb444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i3XzUkCj2wXzRU1nl1nmf8HlYgt+61nJjNTcXfVt2cAZ8O7SyWIK5mEw83qq?=
 =?us-ascii?Q?8IBlFwAUgXAfDFWQOFtz6V+QXCFCN5Av5zr2/WAC4rApiIl617NrXCVJIoRA?=
 =?us-ascii?Q?CdcCxTK9g3CBaJL65XlpdJVdi9IQDA2yZ8TiEtlPU2iAzkAwPAdCgiql9vAC?=
 =?us-ascii?Q?hCXT86U9vXtllFQnGjw+i9o+7V3cgO0i+Kke/7At+TazCiTv7YN/VprgHcmT?=
 =?us-ascii?Q?zTEhErEi3y+XdrAgI3dL/xiN2lJpWav1vYFS1hX71PxXWsrnb2MVyXF7y41Q?=
 =?us-ascii?Q?fyCvzdFwNEh4XyoNg2lNf80JT9uaslXGkJasdm7tdswAfLDyUfNQXk98DNKf?=
 =?us-ascii?Q?tVEF1zNExVHJo1ksJW4XIsTMBF4QtBhtjv0DNe6r+tGjEcfSZuQJ5BfPCfyR?=
 =?us-ascii?Q?5OvLF0+EKvtUmw/KQsPTzQbmYQHItvrhBxkdPMTspXeHuV/e+MAwmddMadpp?=
 =?us-ascii?Q?N0d5dc/EgfNAmjoXvu3WkuMMMaDicuJJsTELDUyH6j3NFfsjYnB23/kPVioG?=
 =?us-ascii?Q?ni+BzETHPBh0X9yWTqjeo1PonTaEcyY7SfZeDc45DuBhFTJ99AqVVvC22xnz?=
 =?us-ascii?Q?0yLaKtNObHEbhu1tmuLKYuxoQy9dQC6I1SfKJNFyILn+acT7abW2iFMksC9g?=
 =?us-ascii?Q?5gWzPmoLAKmTYdMkON9Z9Eky/TdeETLkwoMAbCbuHKLBGJeZh+/TlS2XVYY9?=
 =?us-ascii?Q?EAp86ebKy3KrXKvmxz2mlSPBPEMR7JyEytQE15lyFv0+gpe4z8cIp07WBnEu?=
 =?us-ascii?Q?8tGhcCcwVg8Bp5/0VSs9t4GvncbxdO12UfsN30QwoI5+M/BcjI+ujYB6IK8C?=
 =?us-ascii?Q?5r9XFaaYyk3K8t86I2EbqV4LDh+ImmaDfixk5BSvb+EhVAJ+5LCkSSUX9K3V?=
 =?us-ascii?Q?RCGvpcSG159TSZ0ydkRcdR/enmaWxOv98oLp/fQ6KMMkDmNGTsvFHKegncqR?=
 =?us-ascii?Q?SlWE4b0X+t8wAbB8ngbii148HRSZlVFMhU7e2rcdKeRD1k1e2qOshS/5Jm3A?=
 =?us-ascii?Q?McdQtJIljve/ZetHj1Ohylly23JE29D4F+KP/8yn+5U17sw67Wg1/MazukuO?=
 =?us-ascii?Q?x1xZ6Fh9iFNFzsdO45SNI6JyWMAx7dGzwN1cuCOfdor3Ueq04Rpw8N6Xnvtl?=
 =?us-ascii?Q?5QHsyjN3Gt/xX94TVkGlPpg4xPO/5CUbYrPywr/EOF1yW4m1vjsrxdljhxtG?=
 =?us-ascii?Q?VcBpQdhNSe2aCbn5u2ouOPP8IqipsKrZJWm924RzIy7d/tvhfcxwzAhPE1M7?=
 =?us-ascii?Q?Gwfy1KQyjFYxpZUTSqXpOm8cTR7ym8NXloga/u/5C7q0hxLVOY8KIiBgmd3/?=
 =?us-ascii?Q?AK/eLhe7xCIshjxQSMN72ryMPYB+ifPPEPD1TXqflmL3y2ecTwox1Rn9VgFQ?=
 =?us-ascii?Q?1CJ6S6GbmDgogsMAROTrqRaZPPO81GFVnJ7JbBcmgrid+2hu3eqhLyTqCcdx?=
 =?us-ascii?Q?eSNFTrSI9Hkza6ABWyaAZHxRMyisF4OU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 20:22:47.8414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dd0ff6-1404-42b8-b13a-08dcb71eb444
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6056

  amdgpu: Update ISP FW for isp v4.1.1 (2024-08-06 16:02:04 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git amd-isp-staging

for you to fetch changes up to 4f1305448553b71b138ee0f197d96299039a9a50:

  amdgpu: Update ISP FW for isp v4.1.1 (2024-08-06 16:02:04 -0400)

----------------------------------------------------------------
