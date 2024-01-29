Return-Path: <SRS0=Rf67=JH=amd.com=ChiaHsuan.Chung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B0FC47422
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jan 2024 05:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36FBAC433F1; Mon, 29 Jan 2024 05:12:33 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE13EC433C7;
	Mon, 29 Jan 2024 05:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CE13EC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diE4vHnj6RXm2qR/0DOtggH1GhiqIvE7v0hUxIvLkYgVRN3k9BW9qJg/5gECxlul6EurbbQmHMDK9olvnsxakoZSQ0jW6NRfzspi0hL/+94dqQ1/LnI8UzWvt3d8fZjkJwc3T9+rOTZuG2XplnL1uTxym3Db17Ux7mp4K1L/42CcCvpOU2o2+IJWyyj82plJtA0hKIf34tTynHtXP/RqJnzVjGphiCzOmQ7LCEQlaTE/18ZN1c4ffk7YGEoBH7DNlAfxA4Nb4CXLRVHYoSROkXiQL8e/T3/yh22TPue3g8NGMsadM0ey7xH65khcP8rx6yOkL+x2zUtgeYzt41ZPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=bHTAbU3WG5OYxL8lj77I9OquN3zJMkK28FBbCM44df9PFhcF5fysK7h42jbpCsnyIHujeNKqMgTDhRXrpDIsmKmO2pCb3vqOGG6EW++gFB0UEKY5SiXRKhbIpLEb0brjOKuYf2zbxX7e2HOviF3qTXtndqorCYGltPRlmeisl7aBakVBlrtJImbhblm8RtHvjNB9h8WXrkUEc6Ed9VrK2WT6ykv+VATVfjVdN1pO9P6weNMuLVjZuMvwrCQto0VuSEGcBQY//EXe3O477RirxDR1CLxJXBiTTpeC84vkOvE5FYjmLelZkCHgdsH09axJB1FEiGL5h9cQaDoWPGvx/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=SmlfqoVmHIB+pOCDq/2R9F5OTvG7bkUmmqhZZnNE5TRDRd0bZdh+4bPPJ2Fuagz5hFhwIDB/ZLLJyoxvq2cgWdJzLN3/VZst2exhhYWvbkNusQCJsPFScbvqtU2EN2YBRhDpZvwFxfAcaGKLbotnP/c3yvYJXXYA6v2rNllkw0w=
Received: from BN9PR03CA0145.namprd03.prod.outlook.com (2603:10b6:408:fe::30)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:12:28 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:fe:cafe::5d) by BN9PR03CA0145.outlook.office365.com
 (2603:10b6:408:fe::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 05:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:12:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:12:27 -0600
Received: from tom-HP.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Sun, 28 Jan 2024 23:12:26 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.202.0
Date: Mon, 29 Jan 2024 13:12:25 +0800
Message-ID: <20240129051225.184093-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e52976-d200-4908-7d13-08dc2088e370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LYkgXTxR9Du7Mp9HL/IW39NofKBmmgMC0G+0UiaRr4fzW/fVwllVqbhJaEGeOmvw/rUaoQH4/3khnCb0PQgXVEzYSjYixbPBrbEU5KSpfkDMq23eP0TbE1NnBNTKJ5apCuFw2dpy/BBoF4q4keLEOhWa3M89J8wxd4wN0QW9Z77d/ll0hN9KWonTqmnOB1Lq4P1K9865XKDFT4+1NQHQ9hubJgaKB6/OMYRNpPdnYFhor2N/4CKXL9+Ee87WAmq8ZCx4psCPNGWbhGS0JRipwOjs1g5XF5WrQW/AKaKqRUiSPBEPrpo18JKoVUAT+ZCcQ+uB66u3MhjaiRk9S00zcUxJG50jSjAXb1IK/RrnDL6eG/M3W8pB0Zyc/TgqBwglVY6hUK2c+++No9tijK+FKPmd24gUB0RJ5TZwTwZZVU/1xQHAeQn1Du9qU5+DdKFAPIr9D4eyHHarXVKr0OSZ9QmTkZQutuTXzrVCJFwpDgXXBWVbIwAkeHciq9l0K03Jjd5If5ll5GMOyLir0wLLBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(36840700001)(46966006)(40470700004)(336012)(426003)(1076003)(26005)(7696005)(2616005)(4270600006)(73894004)(36860700001)(47076005)(621065003)(8936002)(4326008)(8676002)(41300700001)(2906002)(478600001)(316002)(450100002)(110136005)(54906003)(70206006)(70586007)(36756003)(86362001)(82740400003)(356005)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:12:28.2115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e52976-d200-4908-7d13-08dc2088e370
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

