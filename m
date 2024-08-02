Return-Path: <SRS0=LicA=PB=amd.com=Wayne.Lin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C728C3DA4A
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Aug 2024 06:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8534C4AF09; Fri,  2 Aug 2024 06:39:41 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2CF6C32782;
	Fri,  2 Aug 2024 06:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2CF6C32782
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhkQ7aUHjBR5Dtd/sTCrf1RQAIRkS6cDBp4Oi9U4kJ9D9w6fSbTSXW4wWYbxtQatesYpDM65Riw0AvXVnOv5SIfDcymULs8WwuPCBhjT2DBpZgbqvjBUjIC+VUXADz8hGpx1IRm0emF1dhQANGHsJ5ylV8gmTeQ06aKASn3QQ0VP0edvfhzhpOooB2rc8TVToIH7ofijI6nYvA0+Y5kfvuNNTAkBna2dMLAjjd2UTxC1uK8QerhUBowNplvrbMXhEYJfvL0hdAe5IHjQ3dxqQzEHT7fe47izFm3QOjD09CTa/Q/wair00JIKJk0mekw6/7vNsAFZOV00X/X0sli/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiKSxMizd+PYXD1BY8hbyOZgN6uRELND88E7zN9mYHU=;
 b=nkAt9K+BctfMcpEEu8ezI0ougwzYqI2SUJHg1baD7ERCRkQ6sa5YB/ZUk5lOM7j5kYH4IZogLX6f+Gn4Hl+pa3LZEvbtn5dv1KfQL8++0V7K+rhQW43uWLFfnJX3xcIv12IsTXucTT4UybUcFFUXx5zdd2CzkKDXkAHEvOyVrhdPiLS3gzsCffPOomNFGy9/3V58OaMULTbR9+MTCYjP/tPoaINr76UezB6hukeqp8Fm7h0FBLQEIJGmbILi8xHRvZx1VGsw7Tjxiugw5qRadElHaQ5YLB6z2emK5c8mnPB4NJxJqLBovC+SZevf93SWOvpCwYQnOyLqKMnjqtU7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiKSxMizd+PYXD1BY8hbyOZgN6uRELND88E7zN9mYHU=;
 b=zzS8BEFpKhdxgIyFzbWCDVvBXADIDNwHcqY5sQ/thqBaozkI1yukBwtmikfNwcox7/rpOg1TNj4PUx9WMXi9Mh52mSEJ0jXHTu/DRHoaCw9nCiOrGAk/MkLKBT4lzZjDMDXYavXMEoq5B9HqpqbXM2tME0LNX4OMSR6zVwvLjZo=
Received: from BYAPR06CA0005.namprd06.prod.outlook.com (2603:10b6:a03:d4::18)
 by MW6PR12MB8661.namprd12.prod.outlook.com (2603:10b6:303:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Fri, 2 Aug
 2024 06:39:37 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::d2) by BYAPR06CA0005.outlook.office365.com
 (2603:10b6:a03:d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Fri, 2 Aug 2024 06:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 06:39:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 01:39:34 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 2 Aug 2024 01:39:32 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.228.0
Date: Fri, 2 Aug 2024 14:39:30 +0800
Message-ID: <20240802063930.3259604-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|MW6PR12MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d2aeea-4ceb-4bdd-b438-08dcb2bde0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kWx7nwYucpVSY2d8XnLFFMPtjXnmfDUEvMtsEC1H4rAME0N2Y+D9jhi8R2B1?=
 =?us-ascii?Q?wXGwn7+OKIuQXJFjgRA6/3x/0trgy50pc45v8DiPZQH8rsbSf++sjU/ydBLn?=
 =?us-ascii?Q?XdqV4xsUrDpYyc3xBCZ/LiXT2oL0YXJ6uUczPewO2Y8Twu4QTOM+iOW+8Vip?=
 =?us-ascii?Q?OCFNzG7blJel8ufXutIgxF17LCCTysHPKewiD/l7wqa7c7r+hcqZCo5J05ZX?=
 =?us-ascii?Q?5Nt7qTEp1b2W/ASsjvskLmVnA/J5t3NgAdH7zk/OZBET/xoj78qD7EP28ZJt?=
 =?us-ascii?Q?j9J4OiOY0EPwgJp9m22+yGYYpraBFrIu4+nx8xfoICqSdc4oxmU4gCokY9K7?=
 =?us-ascii?Q?djEjbY+414sYNEKMvXSp+RFf8ioEcxCeTiHNFVYLb/c7VpUHZ3Gsz5JOjfsc?=
 =?us-ascii?Q?O4Pqx5c4vCJtiXRH2CKQr48BzusAzva+W8WtsVsoNOSmOOyduDatJf5+iWen?=
 =?us-ascii?Q?dY5HlmZVWN44nzooEjMrwpRuAwoZbqXn04H9a+sTvcsmhxYrBP5bgj+3kHbM?=
 =?us-ascii?Q?cV0TBmDnVznt+Wa+EWQg1i3Z14y9+Cs1y8NZ+ore4hK4AvFIFa94IKB8yCnr?=
 =?us-ascii?Q?QBcxptXpVuTXbdIj2XNnmBJJyOQjUYYlwS4QzCJl4xJz+jz8++pw6mlHRP7Z?=
 =?us-ascii?Q?AOK3F5pFWCvTSVMHuq5E5WK7x0E/5SNLACGSCawiolK6poNqtVmc+K3Sh/No?=
 =?us-ascii?Q?KiXkOyaekkIUa1wx2VL59mwnT9eyJXvqgA0LC05VFaKyAdgksM2M28n70AIG?=
 =?us-ascii?Q?DYc8IttCDOnC72twNpW0IySLEjiRHE3iR3hpMYvJeMsCMMJVv/Z2Cql5+ETn?=
 =?us-ascii?Q?CN0ewbLH2MVv+XPqQE8apd1s2Y9jPpA8vb0R4mkgF+/ISCFiweWLdSy69q89?=
 =?us-ascii?Q?pF+hfIK4H4nFdtBFneCMc/eeA1ckyACI1rlH0RsrPiERwzRMqD1va2UqZ4M5?=
 =?us-ascii?Q?sznoYKUzXmAFzDjcHIf57epjaFBH/WiJJH6u6SFz02mYRSu7Y+buqTbU2xjo?=
 =?us-ascii?Q?CJViQUR0yKeb74eXZUY7Sa2AZPCvd3/zcVG8xNUSS5M/jB4p86JUR1IgjAEe?=
 =?us-ascii?Q?n9w2/LU40zVVLun/CHxt6pnv8iKG2X2Oc5mmW+xZjRW63J5Hh5Isu/P5z7+v?=
 =?us-ascii?Q?8Tv5yC7hpp4wiikLxESl8BtzmT7vAiyr2TTOQeZjNFnFjeMcJut905MaO7W/?=
 =?us-ascii?Q?rUidvpjpFKmGi1sIh95OsdYTD6xugPc4EPNgPO5JmsAIwFcIV9h3FCh1K4Co?=
 =?us-ascii?Q?nx/lu8a1KhVpGS89tKeEVpP9UTrfYB8RIvM2NU8avH6Fr5mfd7j23X+kedKu?=
 =?us-ascii?Q?rK7Rkdm5Cixgfe+DUIxWHQlSCcDXMPs0c2dIjye0WU25PtsxTV6F/pGDDVP3?=
 =?us-ascii?Q?WCX5KLZsdTIRLo+rXyfk9qIVptj2z6wYl6RFvTloLAquheVpWdQ11zm7DrAp?=
 =?us-ascii?Q?vydo6/X83fcRMxeD9pzR78xpkKvR+QEW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 06:39:37.1385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d2aeea-4ceb-4bdd-b438-08dcb2bde0f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8661

  amdgpu: DMCUB updates for DCN314 (2024-08-02 14:28:34 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-08-02

for you to fetch changes up to 3b14fc1e18ffddbdd5f7a457eee9e8654137c7e8:

  amdgpu: DMCUB updates for DCN314 (2024-08-02 14:28:34 +0800)

----------------------------------------------------------------
