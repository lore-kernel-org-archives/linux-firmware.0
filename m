Return-Path: <SRS0=IuTX=NQ=amd.com=Hamza.Mahfooz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C21DC27C6E
	for <linux-firmware@archiver.kernel.org>; Fri, 14 Jun 2024 18:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCD20C4AF1C; Fri, 14 Jun 2024 18:59:54 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2100C2BD10;
	Fri, 14 Jun 2024 18:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2100C2BD10
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPXHnxPHohyCH75FQXLe4S/1WPZOl8NnOdtmpkFNYBO3Y/9DHK1xR3FyuXNLFLEdZKFWl8V//CUty7gXD8AMo4IenmXoj1vBZuuA4OxZy3pnc1m15RgDKM6C9+d7RAmh5PMhH8FdAYEEZTcR+xvjFg26BQ2mJg3UDHagDCf7uZjv48HefmqSedVYnxEQ3FHut/0JfrRAAiVpFzdA5lY5BlK4QApGGDyg+M5jEXLVYMlflyzbjIVReCBnMgXBltSDpX/WvE+wKm2EVp63tUtrsioHaLeMve1MsiLHTvHkd6+CGuKMsZje7lhC6Cf4fsMAJNoL9zA4GZY86dKWhMDFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsU9cA2qayPVwBsHac3TWegFrqzql7abPmOn0ea0ukM=;
 b=I0wRbAds+zhpvo5eHJP+J2cwDpOoQ4/Df5zs9CS01uxnWTyQF6RTsrKUVUXTnJRg6/4v8GzNPvwxqPPCj/SBipbNRc1ndygOXEKYClwqLB0fKDXOcQ4gd4drXgtTEgVZwzkKQ/tn0UMMDeQVDLtroQrQ4QeSDeHuDCswU1OUCjmXFYZ6acjppqt5ZPo436YmRmywva2Kj5b8uVkT0zxkl5gO/0CczLQcungdFqOOuCHxCx1atLJ7iDED7jfOe/7l7oKTIYIOLhq87HZp4MaUkdOqCV7+eswH0SbCqO2ree+CEGLENjwRKJYKNQHNfMC6SgJ3iFp1lVzLp8uZQ0/QjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsU9cA2qayPVwBsHac3TWegFrqzql7abPmOn0ea0ukM=;
 b=HsNjE30VM+tr4yTBgTXk9K7zIuo4urz7WsDg+8GOs+/j0nu1fWafSnC6hCBQXhiWEWZwlnUUKO1+xSqTo8xQolaRY4zDCj8IpqfdD9M4jjcQL+lE/8SuKKuU2NbeI2JORXa59qRBMAS+EtZ0GxCcAxVxqVfLDcFvLnEOooUyhOE=
Received: from SJ0PR03CA0351.namprd03.prod.outlook.com (2603:10b6:a03:39c::26)
 by SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Fri, 14 Jun
 2024 18:59:50 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::a7) by SJ0PR03CA0351.outlook.office365.com
 (2603:10b6:a03:39c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Fri, 14 Jun 2024 18:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 14 Jun 2024 18:59:49 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 14 Jun
 2024 13:59:48 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.222.0
Date: Fri, 14 Jun 2024 14:59:36 -0400
Message-ID: <20240614185936.249658-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1764dd-1112-4beb-e61b-08dc8ca42afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CF/PrygQFfe3t25gEtaVY67nkNsO1XFUvZCAjt44/6N4aV+5aoKE0jzLrvuf?=
 =?us-ascii?Q?FnnKewph+6ydpbqtM+MoOLGT3FBKXjLRdEUgq4R8VVH3dc0qYrIu4BNLQbaT?=
 =?us-ascii?Q?CTb7u2M1Se4H8yfnWgjEMcUqJGh/CkTVdNHJMtvL6BZsLg6uFnnsX97tWehU?=
 =?us-ascii?Q?dXQL9zEDLfmBJWOHSsOr3KPnviqqo8021lcwNUECve568GlPhlI1mOmzNJwI?=
 =?us-ascii?Q?9bWkSJN+eyR1CQOwXE6ohykKNnHqP0TWh0V5zvvCr/TK7CRbHVk5TxDLuFIj?=
 =?us-ascii?Q?rRZTyvkWlRXgYTR1XuOo45ttmgb3GT2xOSgPvYh6fd8ykXmq4eT2LmBW64mQ?=
 =?us-ascii?Q?/nEPUjzTHCR1SRkvNO64MdEAVGADkIkAFi4dqkl6DaA0NChFns7ys+/bCUYr?=
 =?us-ascii?Q?4FcMoPqlvm8wEbCLLmcc0aKx0CC4c92zpcC3w9tmAvMhJ58FI6yZluPVZYdI?=
 =?us-ascii?Q?AMIErEcBOacRxbzII7sJZhWv2VZ1VBkWbQWqV/10K1HNXeLOvj7YoDGpXERy?=
 =?us-ascii?Q?fOk5lUqDs5j/+iUUA+b1BYHMFB/Di6PNXoSKpxScb27m+faLr7TYML3nf4Z4?=
 =?us-ascii?Q?3V94y2S99O0bxTCqzZxYCJ6zuvRnzIPue6gMuxgDQVeytlau+KCwjuP3NP+R?=
 =?us-ascii?Q?Do/Zwidymczts/P1xs+k8TjDBkJB/ZDYcdvS1fmGui8K/k1Rk3Cf8iUYMMDb?=
 =?us-ascii?Q?IP4wKJA9M4HoPauGvB3L9M1R9Dnb+ZuczBrmQ6LmFbDLBJ4p3BRPXjukew21?=
 =?us-ascii?Q?M4Ua5Kzabs9Bcmllf6GKZ40pERLuuqk9ZHZnJAc6qATBULShP9gF1lwAdlQ1?=
 =?us-ascii?Q?wrwp1+e/fEfEIdMJSm/dn3hzkNnqdylkzA4Fbtuk9vyrmqu3UNyDuRiCzdsA?=
 =?us-ascii?Q?oecxMvwNA7H2sL+//jEGf4Rw6s4FR+/9LqOJ/TSTC6pSYAXnsejb7Mj/Q6m8?=
 =?us-ascii?Q?vzYQD0c2JTVSTQeKXs3Z4buvpCrBl2ZLIVK9KC5ZJbbEiMiNzCQeK0GgK0Tu?=
 =?us-ascii?Q?s01QQQGPdfJN0DOT43btZ3F9dH3A/GdPc1AiINfRf12t/0IxvKZV3F7nesKU?=
 =?us-ascii?Q?MQqw0BCQfpHhqstaezHTYTnm9ml3IcUQfH+RZv3rtmwnX5uzo60SEtMen0SP?=
 =?us-ascii?Q?xNju0VSVB2HUxPXwjtaXE3t65kKcJirZo4QELE7Mm7EH4itArffJX85llKPS?=
 =?us-ascii?Q?ro5PFbMDQiIftReB023pQfmGRkul5RK9y0nbL6PNr2DCnaQLm9+YVAcwWe4T?=
 =?us-ascii?Q?iGBUJGYeMHaRLgGgqLUP3zxtwgeTqFi/DuWvc7HMzMWbYFsZiPiQrRqQvqEw?=
 =?us-ascii?Q?iZzqfet6jDvA5fdatgGTUhSMKrXXjk848GkftdjW4q1KVSuWtIksFZCZeejc?=
 =?us-ascii?Q?C+SC2spzoJPqKfbg23ny/8zUvt1JYyBBlyShhfr8WkK+sv+RCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 18:59:49.9981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1764dd-1112-4beb-e61b-08dc8ca42afd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912

The following changes since commit 51372fc19e8e3d0cded8d96f1708030b3d51a7e8:

  amdgpu: update DMCUB to v0.0.222.0 for DCN314 (2024-06-14 14:48:52 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-06-14

for you to fetch changes up to 51372fc19e8e3d0cded8d96f1708030b3d51a7e8:

  amdgpu: update DMCUB to v0.0.222.0 for DCN314 (2024-06-14 14:48:52 -0400)

----------------------------------------------------------------
