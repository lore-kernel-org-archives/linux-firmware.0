Return-Path: <SRS0=PE4i=OZ=amd.com=Pratap.Nirujogi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E51C3DA49
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Jul 2024 21:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6A33C4AF0A; Thu, 25 Jul 2024 21:39:27 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5877C116B1;
	Thu, 25 Jul 2024 21:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5877C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt6MoaC59UhUXtTH+DrVcJidy94KLiAD0Bf4dbwnx104FsTtgAM4YOBnoFvzxWn6lGDXmojWFY2lr9v6AkObKMnEDPfglleNglFHR1hILyxLRJ4bzZxp61nP1GQKutwkyb76OfaiUxJ2PXORXz2hIBYvIk82sLOcDXc9iB4MnDqNi7gGt++AZN5HDmRITKmnchtsUR9gw2XmAYr0DjANqNQlscBa+ft06Qjl0X9bCQsjJXJiJDNmP2rmhIOoxovuGgZURttH4/hBFrYvYo5JH9jmsyD/3hXR/+FnUghTgkbpHKD7COnQ4qrnvQwqrAIWnoQg6gYFtpwb9nfNYbuLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxpepw9cslQ0K0r32arpLCEhhLMJ7g8lVggOzXH2R+c=;
 b=TxK8cBmcU2Tq7B4p1J6hLp7vITIqeLUsJpLHZXO9/IM9Iexu4Q4d6myGCov7/LvismieEoNLP/pLNYhEWwi4E5bR4WxfsH0ZDhcPzjxBU7ghSBjlXs0toRtW3JV7Z1ZDrdA5Txiwj8X4le1azyEd7lMrc6F2teRY/rl28Ym7+YnXRw9PijhYJ6Z+AISulsQjhgxosnkPjuZrYaongYoPx7bZufmtZpCiXsDFI+iquUqdB4wUQPMOKJkMTqrtJ01NZVnkihhyTw2/gx4b2E+Sxs9tkwchd966TKK8ucZeiymMmKWyhj3GZ0rfXusFO1primgi5bQfJIgazfEkfm2aUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxpepw9cslQ0K0r32arpLCEhhLMJ7g8lVggOzXH2R+c=;
 b=cYnz5XeZi1ZmqjlGnbbbbzDa5cDON6pl2qEuF6lC6YRK+w2NNRMqQAjp7KKOj9tPXtWSuXY92ybE63rnMofgEG4o21w/MJqqvwYu+s/sJwOAklDghtawxdmeMo/lk4+GUo2x+9i66S2FCAbanfwarsUjwGXpj5BqfqSjZO3Tl8s=
Received: from MW2PR2101CA0027.namprd21.prod.outlook.com (2603:10b6:302:1::40)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 25 Jul
 2024 21:39:22 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:302:1:cafe::d6) by MW2PR2101CA0027.outlook.office365.com
 (2603:10b6:302:1::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Thu, 25 Jul 2024 21:39:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.11 via Frontend Transport; Thu, 25 Jul 2024 21:39:22 +0000
Received: from pnirujog-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 16:39:20 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
	Deepak Sharma <deepak.sharma@amd.com>, Benjamin Chan <benjamin.chan@amd.com>,
	King Li <king.li@amd.com>
Subject: pull request: amdgpu: Update ISP FW for isp v4.1.1
Date: Thu, 25 Jul 2024 17:38:56 -0400
Message-ID: <20240725213856.115428-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 7771aaa5-14eb-47c5-308c-08dcacf23f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uKq+uQ02Rn5xT9sEfFXGMWaS6n4OjxCT4jutfgOI9BXowWFXTG5LEufH94I3?=
 =?us-ascii?Q?wAaPdwYfBmtR6VvEQP7kbe1k/z/RUx6AppmCAjGafLUyeDvXS8Gpot4h7LNH?=
 =?us-ascii?Q?fTsBcDr/E60ell/lhsK07Z40RHm8DLLnO5etgkSa2t3KP6z0rW7ftAfWQWKY?=
 =?us-ascii?Q?suapOLUvwhpknb1mRSluYqgzgu939OIfifoj4H6HjwthmD2Fa1pTMfGqz7wn?=
 =?us-ascii?Q?1LqlvOEyNTkeZRm1y8vf2TG9gbGQrmTMrrn7bSej7KKSP43ZnG0lQ+cagWg6?=
 =?us-ascii?Q?H6T1Xm918ray13OTzsHS24Gon3o4x89YsYmfZLbEUPLp1iR7JSjSOqjJkRSt?=
 =?us-ascii?Q?IAou5Lx86E2D+H0b/1eYJpP+/e75yfhR7MyDTaJjoNbmPShobENbI9sgG9aH?=
 =?us-ascii?Q?7Un+eOoERcc2Vs/2yU0vml5EvALA0R/F/YhcXwprK1VXk2xpY5VfBEKc+7Sz?=
 =?us-ascii?Q?6mwi8PKoNU2oSq5vqz9qAvcaW0A5jRLSbTd+Na1mncL40jj/twdvrEKTQwpW?=
 =?us-ascii?Q?ZwiDp/PtLvV1R/pdbfIMt+5qeOpWhrxjPFr0q6d0kSGY8De0CiXH5hRTBzdj?=
 =?us-ascii?Q?G/Az0fEnIuWBrg5+qqAIHtzEn2i7DI4PjWmJds9Imh0yDpmt9a5d7Tnvln9V?=
 =?us-ascii?Q?hBM1CNKByG5Znn5ad0rjg38aUMax5s+J/hotiYuTjhdw7ezeShYQMie0JB0P?=
 =?us-ascii?Q?Y1MvKHB81xWljo2MoKmebPhtg5E7zh9o7HP4lTdhum8coUVdcEBnykxl8vG0?=
 =?us-ascii?Q?VEXzjhan/ZPqkbqR2qmmpqsw9w0p+7gNwnw5OIfNn58GhTTImQkjeQK/sBS1?=
 =?us-ascii?Q?8U7RVNBHP+87f/5txNz+CKZngRIeRMUTu1is439YnkDeDPwJuBNsUpHlWfW9?=
 =?us-ascii?Q?l90GwyXvmm80jsV8RPjfT5N5YzDaFrsaurZVnHcV/s8gUTbq4zkjfzL7YOl7?=
 =?us-ascii?Q?xmZSqCcAsdDmd/wp0aQs5ufSsLD8foUiQv/w7rDdhkG/HWo3OMXRyFIoER+o?=
 =?us-ascii?Q?E/ot59pgpJ+99YvmNiJzyPYkOb8BeoCDnrIMztWIuLytgJwWDLeQfT1TMCf/?=
 =?us-ascii?Q?h9ugiKBhqQ5TrhOCmPn71Rla3Mb0AUDwm5A35UQTSqdF85i+Fu2kNHivsEM2?=
 =?us-ascii?Q?aVoLnvK3LxwUKxB4CEBYvTroYCPXCUz70inThi5HcIuftV4iWIUR2hurPKWG?=
 =?us-ascii?Q?SLXuyPnsOT3JKIT8p1/vr9mmxVNG/E2vjtpSQcWmtsVDmtpR0RVqJN3WK4D/?=
 =?us-ascii?Q?L1PLVCELoXvyUE0CaEZMOkvTm6sSVqI7Kras+OIv7oeLMLtTfaO4KdFFj+Vs?=
 =?us-ascii?Q?uIPXDQig4/H74698bZqcL3IsR7PRO+R1k2DaCsSAp/Z9S/nm6d2Rdkk5Qe/v?=
 =?us-ascii?Q?uI7bXwdP2KjxGAhaZN9/2SuGMcWKrDb6Evj8E6QZ55J1TeEfXs786j5aZocz?=
 =?us-ascii?Q?Bc9ChJt/WqGLy6vDlKi0tZiJmm0oazAq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 21:39:22.0714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7771aaa5-14eb-47c5-308c-08dcacf23f48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684

  amdgpu: Update ISP FW for isp v4.1.1 (2024-07-24 17:33:17 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git amd-isp-staging

for you to fetch changes up to 231bc1316da608e95cec919fbbabf7c587b93b47:

  amdgpu: Update ISP FW for isp v4.1.1 (2024-07-24 17:33:17 -0400)

----------------------------------------------------------------
