Return-Path: <SRS0=b879=G6=amd.com=Hamza.Mahfooz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AED1C072A2
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Nov 2023 21:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB868C433C9; Fri, 17 Nov 2023 21:52:38 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACA68C433C7;
	Fri, 17 Nov 2023 21:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACA68C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWte9UuAJC2JaGF+QLPk7g4lw6iLzcmqRXppx5uWaJPdVLRrphNVGapHd0J5fxLweLVIBthuA4AV0O4bfznZRv/QGebuO1VFrTf174y1KIodKj8EOCZ4XttfSdzr0S3YCEpzwxBDgIa0iEz67mjuc0kIztnKyrKVm0W74HE9hTGCLt9NixQewukY5pCwAUbd2pXS3Ih4qkTb1CtwCSbd9q+8hIw8kynuq5csdcBhj+ydAgFmnDKuRIH+sJYsq+KvtTSDFOTQskPnUO9epbU5jzxNot2KsWW/aO6lClHIy+cSq2l+q3X6x0H5zWSJCaKSdbsoZL1yB5C/VueHCyUjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YVRA9b+zK+XkCVdKcQc3iL4bRQUTeG8gQa0LhRlh5g=;
 b=giatEmYJyohXhPX3Er7FrePmAiXmVl8LhcDtBXnQANqLAEDa2IRknmBRWOSL/eVgyucnwo98qXQBEL1DBOz3tGBkMS4BHPB2tazlRXS01NI9TKWLAOJ2RruYWHd0BWSzX1eicpIFVGPUb/koVYIce0VII3NeofGRF3flQDUnOIt4DRrPuJhv5Aujw9wVRe+RF60nRUp/cTw5rKIYG39vgblcyn1QXTFiItuOfMckhPFmrHyki1urADOW0P0jO3KZ1yOJxBOMGAtxf/kAmM/Pcoj6ZZQavCSypGt1/eWMroUdR/txYKpcH+fupMiqg2DWkUme1i05ZHHaa4QzGoqL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7YVRA9b+zK+XkCVdKcQc3iL4bRQUTeG8gQa0LhRlh5g=;
 b=2QF/UlDRwHDqU8pt/mTH/eHg82D5JntKAgpx+q6VSBi7TCBpX0sb4ey4EEQP2Va0Wq3ugxUhQNQVA9BeCnj4nf+bOCNAASkdTlGl1Vu/Nwb08M0Dj87pD7EUH9X48TRzIE2+WaO0qkaUJII7pSQu6gShzZ4rz+VqrGfqJcXvKl4=
Received: from MW4PR02CA0019.namprd02.prod.outlook.com (2603:10b6:303:16d::23)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 21:52:34 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::b9) by MW4PR02CA0019.outlook.office365.com
 (2603:10b6:303:16d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17 via Frontend
 Transport; Fri, 17 Nov 2023 21:52:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 21:52:34 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 15:52:32 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.193.0
Date: Fri, 17 Nov 2023 16:52:21 -0500
Message-ID: <20231117215221.23371-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|DM4PR12MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: 98cbd2ea-ab41-494a-7589-08dbe7b781c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q08nK0ERT1CmHgH53GZNF4YEXHDsRiEyy2tVDSyHztXmG3GdQJzBiCbggZI2rn6MlVZ+fSUYRHVRruNmjPNz+ofLmDGobSmhmy/OcPAg7Gean3+WsYsn5CnPDQvIAxGtSZw1Sk2ybmHN12hSS9eZ+y49GDZfE7r2wDDUE9NpT5yxnuiMpfeSBFSoX3xK15GdZzXZLCkzh6hGF8gq5hkN45P/2PVIh7uz3XPeeMlM2QTztlKtgNu2LD32T7YqOPXfC5KL7PL8b+iGDGifZctMlrF19FSin85EHCeHwZ4bQpzNYANG7T6AUNXPSSdAVLv29AKjXZ3khrSBhJ1s5dz+0p5tbzdbtDeXB5DTJoR5Wpxp7kw3njDTdYYu6JRivkWBu3/Hoj8RhqJdKm+O7XjtE6hBsGcsvUMUa8QoVfvwvb9fcVFij0NlpIK5z/dApGAq0AVPN/Zgn7K02Ir7Lp7LDKzfYTSLjshyqzpuJW5WCkOx8GYe2YGkxSE/5o2SQRyDqbLPfWcef9V/SysSB564YQX9wVO1dr0qn6bZG+D0rn1yOIX364ku0bmUghv3caXXRooSSOZuyZxSFgaJjLzhahsbsgplRpIlKTmupkSS7wU45Rrjilzqa7Y6H2S9YQskTgS+wuUlOEZFJSkf2VB7mnyJ2bkShTTWgkZCK+zW4DqZN1LXCqZ6JgzIe4y0B8W6VJMaWtOIS3fg1WfPsTxjNBFyHVrcJ/Qr8B1i6v8P4LH2F0gJVDoODmXY7EedRxFy2NlrtiRH9q1EGfByzrh/wNecdxDHzD2U2skpJR8hpdT6OOHajZTiqgJoSkwdqRMl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(82310400011)(451199024)(1800799009)(64100799003)(186009)(46966006)(40470700004)(36840700001)(110136005)(70206006)(70586007)(86362001)(336012)(426003)(54906003)(316002)(1076003)(16526019)(26005)(40460700003)(4001150100001)(8676002)(8936002)(450100002)(4744005)(44832011)(47076005)(36860700001)(15650500001)(5660300002)(4326008)(36756003)(2906002)(83380400001)(82740400003)(356005)(81166007)(41300700001)(478600001)(6666004)(2616005)(40480700001)(16060500005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 21:52:34.3727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cbd2ea-ab41-494a-7589-08dbe7b781c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818

The following changes since commit c03db704fa78ad3c44b18ccf51d0af6373b1f58f:

  amdgpu: update DMCUB firmware to 0.0.193.0 for DCN31 and DCN314 (2023-11-17 16:38:32 -0500)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-17

for you to fetch changes up to c03db704fa78ad3c44b18ccf51d0af6373b1f58f:

  amdgpu: update DMCUB firmware to 0.0.193.0 for DCN31 and DCN314 (2023-11-17 16:38:32 -0500)

----------------------------------------------------------------
