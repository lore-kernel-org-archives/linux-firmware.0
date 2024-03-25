Return-Path: <SRS0=AViF=K7=amd.com=ChiaHsuan.Chung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B25C54E58
	for <linux-firmware@archiver.kernel.org>; Mon, 25 Mar 2024 14:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD7F4C43390; Mon, 25 Mar 2024 14:40:51 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2076.outbound.protection.outlook.com [40.107.102.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96E38C433F1;
	Mon, 25 Mar 2024 14:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96E38C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMHZfq9+cdHb+4swd+4uubHXHjRZJ2KIqt2pt84GsVFE1CCMazhp+7PRH7y5zvd0TTHTr3V4tuO70CSzZpfPGU6JNQCWUATOn0gFckRT0/4WQ8DDGbGe2JcN5UH+LKDXErgxW2oYWlZQfaMJ9NbOSDL7iHgPQaLskMev94rNbhIBKpDtYrQfjjCuUzfjvPduYgbpBRDjhwlTJsaqQY/6v/TWm0WhFriVdJ12IPHzwbgRbTqoqVUvYIwXsKnOftPHzeDs0n/6tZNpS0d5BIN30H/E5Wyyeygmq3OLgeXYwHm3qvIUwx07FWLRXaM9p5t2oX60J1VR2bM0a9s7E9uk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQlYDdfBcnLpkgqmLtKFwhG5Up73McwfWF5kUZAFfPs=;
 b=PIEp+thUpznSbYXMJ3fTEPPf5xtfE4ZWtEdIXh+bXMiWGDFVe4BZBXc/MJ+oV2uA7B3148onwsObAjd+qemKKJnzYzsqg2G0LnEpQxwpOI56cf1g9QAJKXSijUcVJ42baRRZ9DEfYz6DKGGT6ofI0r6pDngFTGz/qjbb29jbmnZe0WhwMuBtMeRJebVvIGwDZb8l3XVrE4Nsb/X4udL36/FKSlqZlJUo1EkBQIhYfTDn8fNp6jUmNRwfFxzrAC1M969+4AHJAQ7/b5PVx8gfuvlKDBIixERpOMqIzpKr2Q12ABbgsJA+Dn1ppR9RQSB+m7xSaNHKCJ6ulijfUMgdGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQlYDdfBcnLpkgqmLtKFwhG5Up73McwfWF5kUZAFfPs=;
 b=LKjfbBod8dXQmofSRZW6v+8SIhocKtaF0haTlna2ASL0xphSoaxZFjKVdokaI5Yb7t2/jBflj119kiaz9fTUEAYhXmM55WosT1wyOJLfwqfY/xAzUn3i9MFw2gqNFqPT+9cWILSRiCDDWYEYYt3RccVt8AmC4ul9o1zVsDEJJ04=
Received: from SA1P222CA0059.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::11)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 14:40:46 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::ec) by SA1P222CA0059.outlook.office365.com
 (2603:10b6:806:2c1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 14:40:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 14:40:45 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 09:40:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 07:40:45 -0700
Received: from tom-HP.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 09:40:43 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.210.0
Date: Mon, 25 Mar 2024 22:40:42 +0800
Message-ID: <20240325144042.2657222-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b0d479-fabb-4eb6-12bf-08dc4cd98e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JLpn2of4HvTC73cSnzMHfx2CZKlHwLkkBAXWJYJcbC5NYkBcIsFjkiebM7O3iW5xLKj5ucVCca3kmbtrlnE+5AOp1Uqfem1mJAFpZL3tREQZv3+b09VlostB3s0WdT9CpooFG17tUkvcjKyTw99DQ6xEYyCN8CBcWfosQrREZrLxXNt0XekOgh/UhiVOTSaKmrjzd4SUrCJhpm4oXi1KJ3a9xRU1LHRFwZr00PJrXK2o54WiJ5LZG0iHEkGHRKNV434Bwdb/BXuwiLoyhKILW2AkemGuREA1B1+Hr6hKAg2hLfcIdimGMn4+TLqRwgKwwaoTd44gjTF/kimXAZq2yXodeGjimfI27UwZ/COhJBI7TOHhC/ZvkWFZQGEvMLvtkqtHApc751ox/ZPfSEVIgNV8nh5+qEpqS6xdukjLT54OkyDp3EfoGzgdoZtr7lEQQWtx/dBvVdAlqlTiAhMWXgyteU2OOYBoM1uDYk39DE/mTD0c2YM5XeGBf+qKhuJnB3ySz671y5Td0O6gFAgmxCwEgF5/Y7lpXBgAatHjvwQVsRraLCwqv5+7fZ6wy8VrHUawtkW3iJhK3BRfhrl4n6y1qAkxEyGhKKqpr0ze2jrs5EMHyGz0pAXZn47SbBKFiVG1mlCF1UtthEG2iwZ9kHRQjCEc//jnjBzH0lXyyUQhZrvyyFbICpdSxA9zaobh/nxGJap295NO+b2EbZrjtaIy7yC+voBg9m0DHmuDyW34Uy8llvLhuHAfl6rdJWoN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 14:40:45.8737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b0d479-fabb-4eb6-12bf-08dc4cd98e58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-25 22:30:12 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-03-25

for you to fetch changes up to d9876ab4e6943640f497f314679db341821bcfe2:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-25 22:30:12 +0800)

----------------------------------------------------------------
