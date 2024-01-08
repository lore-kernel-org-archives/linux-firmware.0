Return-Path: <SRS0=Jthy=IS=amd.com=Rodrigo.Siqueira@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6D7C3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 15:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2086C433CD; Mon,  8 Jan 2024 15:41:58 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8540BC433D9;
	Mon,  8 Jan 2024 15:41:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8540BC433D9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gf6fzYtIknTuNpPR0q+iO/R/fsnkJ6NrliquWnrPo2iG2Xp3SjgiT/OTsmJmvktVd4OOEdG+NAgfLu63ulb/p6581zPiq14fSTKdwXUhlxZRX0kYyUASU8oqTtAeBxnhBXZTIAkZmffVroFV009o/irw8aUyfEeZbg72S2mvafBhXMI3kfIGe+/L579KyARLl8nh0TZgWeZjEXfZsfQ3nhGpblrtyvpzkewdJDDmI9sqCMRCTBH+pNpfvXPpus610yXHbOR/vhK27YXHTOKYYuoSk3qq/zLEX2P3SZsODoy+0TGUy1bpzKBHvXeWZNCaojXeqX9UooUABcA5at9h0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxAjzK+EmU+G6AO7Mv3gZD5F71R1kHKPt0fWsX8kK8Q=;
 b=PE2c0eriOnDAOR2eiSEhhW5jWSLNZEMsNGuvoAkxathuCJioqlLq+bS0IRtY2wKY5aGmrDrywZCGD3EpkUKbPhFJSX4LCg1C2Gv2NJjMzmMJo2Q0Gb1kUFXmD/Sxs81cKB6UKwrDgvHIKPjty7t4DmpdgrNOoy5eR7gpZfeGaVqzYVG0na19v5C42XwZdPkTioetz+WjpK5cwLrqGrTFr70YmcPS0BKWCw1rJb9IdR7DNmNljMqtZG5fHnyBPoLscXy3aWNZO6ECV7pQrIBFy6K3esfWY2KEOw3wKs8winWW9o9VLkcuFwnXKPfLCMSsO6BSD6BkbQO4U77Hg3saeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxAjzK+EmU+G6AO7Mv3gZD5F71R1kHKPt0fWsX8kK8Q=;
 b=0u9h9MsEHtFX03BeDZFIwgSuwVaJpweCwZqBoRju+5kTyTuv1e0w6IsOgyZb9zb7csuq6CQcQVTnMLh1FpyMSgDKYjaaTzv6MISIrsC2tEiftvi3kcLPCguaKNr4NGtss3Qb8gO4tjfLaGei3CUAsLGB/0PMpdlOR+XMek6Gqkc=
Received: from MN2PR20CA0056.namprd20.prod.outlook.com (2603:10b6:208:235::25)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 15:41:50 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::e7) by MN2PR20CA0056.outlook.office365.com
 (2603:10b6:208:235::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Mon, 8 Jan 2024 15:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.13 via Frontend Transport; Mon, 8 Jan 2024 15:41:50 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 8 Jan
 2024 09:41:48 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, "Rodrigo
 Siqueira" <Rodrigo.Siqueira@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
	Anson Tsao <anson.tsao@amd.com>, Amit Bhutani <Amit.Bhutani@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware for DCN312 to v0.0.199.0
Date: Mon, 8 Jan 2024 08:40:35 -0700
Message-ID: <20240108154035.23859-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|DS7PR12MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c43eb25-27ee-4af7-ddb7-08dc106054d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PbnrdY6Ledbm7//GLMNj6/YzZhORSOXYW1LNj1ayDLjeORKmIts/YL8BvlMydwmbMAPIBPvnDBea/lFR2XSxAhczfxrOe0tVCYbxTO8wel+W+jhsfaqs3kBo/CpLq2AUX5glNuw32XP29kBnYg9triKaptvQwCtFWuYgl0GItD4wDG5ifIPBzW9kOz5ux34fYZCEAYKpb8QYcDlWoMsZjbwirEjp3lPi4itUvs7mwyqxPnMlZGSMxSLJ7bkgHV9mkh+YrQrpiID5OV5VILKFj83uDUusriF4BCVZGE/6wg6x7X0UvI5VhjkQAB5BqKbGUWtZeQJkBPPFY16hC+OJpla56FIanq5IduuqIVgCvSQTIOa6QWVRKgNzb0lOOSzcL101LAHlabDbo7SyuMz0XXvmdzqIl+cBoFaILll8I4XKa5SFFQnu3XOwGmy2abKP2AOABWerhjwcARN/vwZJis7DMjWabMLildqyrISl50ehRoOTLBbhwWwb0hlvdZqPhPEwgVhy7xR2gYTsocsN6HttLj7Nf0heb3BwB2LPSNl1LP9N80oy0gXt4G4ScndqdVF7KHohWivwg+gicVXzaEazQTSkToOkm9EexnDpdVOk9yaea6eMgdShIp/1g4+DFG3lNEjRkDF6L6XZvpB6A/orCKb9sXUTUeDnQPdiqGxv1fSffJU7olMugg11ktczY55Pvv1+So02Ck/ALYttVoRf2LVt1GvZdjs7TDvaWs5UfbRC3xA06TZwfgtxqefj66oPnBmlUGJ3BwVFeEPwww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(186009)(1800799012)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(2616005)(8936002)(8676002)(26005)(83380400001)(336012)(426003)(16526019)(1076003)(41300700001)(86362001)(450100002)(4326008)(316002)(54906003)(110136005)(4744005)(5660300002)(2906002)(15650500001)(4001150100001)(36756003)(70586007)(70206006)(6666004)(478600001)(36860700001)(356005)(81166007)(47076005)(40480700001)(82740400003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 15:41:50.5374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c43eb25-27ee-4af7-ddb7-08dc106054d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418

The following changes since commit 87be457c2e50d35caeefc00cd590af21c29a8b83:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-12-15 14:54:01 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-01-08

for you to fetch changes up to 2909bf41a051601e86129a9c2fcebf31c15eebc8:

  amdgpu: DMCUB updates for DCN314 (2024-01-08 07:26:59 -0700)

----------------------------------------------------------------
Rodrigo Siqueira (1):
      amdgpu: DMCUB updates for DCN314

 amdgpu/yellow_carp_dmcub.bin | Bin 234768 -> 234768 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/amdgpu/yellow_carp_dmcub.bin b/amdgpu/yellow_carp_dmcub.bin
index cc1c5c75..a72743bc 100644
Binary files a/amdgpu/yellow_carp_dmcub.bin and b/amdgpu/yellow_carp_dmcub.bin differ
