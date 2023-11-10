Return-Path: <SRS0=smvQ=GX=amd.com=Alex.Hung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61AFC4332F
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Nov 2023 21:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E5EBC433C7; Fri, 10 Nov 2023 21:22:28 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CB52C433C8;
	Fri, 10 Nov 2023 21:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CB52C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A93/38RirhQtK88Qmba93+i45w5oyLXZmcFKSjWNFehnkmOz1rsdWShDpA1zqBzhK9e+4SLogh8zZyu9sn7OMh4dom/hL0kGYqkxt5nhkqwezb8VpJWSyXlJS63C3DXNzfPVLdJ4Df5AwUnin2+wxNLQq5g+/5zV/TNhglDbAwTO8rnOi8m8g4D7YxMIy8K/FHwP4wTR4KNf6n09V01mSt6sfra8Xnl7iFsVSccHIXdrhbCOnmuaAX/OSnueIZhaqk9cE2t+GN+DDs2ez68Q+T8V0ByGViy/OqaYte0gHoZUgf6nUknsjqiFQ0eqTc/fZrZ/sHUDZVoRRz8dOPpKDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifk+N1oUkh3CIslZ6E7TqaHhlSozdbqsfYBNAqMxhXo=;
 b=K/5XhjpAgGPHNy45QZayGawbdiD+XfmN7zRmsPnMEkcnIqDUQ0GJ3s7BYznAuP5aD1aN/auRjpvwf9ymtsjwvqHYEo7wBy4Ei5kLbiTg918SENpWNE/XmSRMXYTT4wtOl1bxOdL47TKZmMmiXabEfVVrjHfGoIYjaDl5k7RQT9toDvHcLkElnrQrPF523F+FQlT1DnENoIS+4tTeRxzX4uRBA06x5iSBhR7lWlGNuLuCrTnoD1vSKWD4aEaOzUqDYSbJa9qODn+xjSCAnN+ky36XgonhG9rwENvKrJeUt9mNBxBUZ7+tjTxGcADmMuBHvawc/fUUpWXrMKuUCYfmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ifk+N1oUkh3CIslZ6E7TqaHhlSozdbqsfYBNAqMxhXo=;
 b=EDtJUTvOcOP0io92qvttSFjXAzgYMinkpYMr21NNlE6lNoB9lGBk/2EbwMfhhNzwEwbg1dli0FxVWfEtYwD1KrrKp/N8FoxWFdgc1avSpD3u3z3+TZdYJcVlN8QvH4a65Rl+gIl+BVnvYnoQ0MjY/XciAuek0da2krhcgUF62Oo=
Received: from DM6PR13CA0053.namprd13.prod.outlook.com (2603:10b6:5:134::30)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 21:22:23 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:134:cafe::a7) by DM6PR13CA0053.outlook.office365.com
 (2603:10b6:5:134::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 21:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Fri, 10 Nov 2023 21:22:23 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 10 Nov
 2023 15:22:21 -0600
From: Alex Hung <alex.hung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v192.0\n
Date: Fri, 10 Nov 2023 14:22:12 -0700
Message-ID: <20231110212212.4065995-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 4010ddd4-f0a5-4e03-998a-08dbe233216a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o2ubMUQwCP2+2TS9a9DqPb6CqVKS/eaEXDt0w/9XGq7N6m7/a3AZpiq842ItEhNxfEcnGZVqciHegl3Qi1IMSjEeovC6tTBGikLvywLHm/ksKZv8pTzqSec4CbM6KENq+u9kplJqZ4n82GSKgGC8oNJeEkR2d7YaygXOSYwfQewT5ffa24H906uxP4BruZwmqsMMRbdSpF4XkP78amKkfzaKJd0OZU8osQigZJypmxDoaBSF7ah6WlpUbgUsktT2hWw8u8cXxxGuW3gTkbqUfAy9k/5SLBA7xhtEsCxtplNWkH21GyjLfaXnDGr1JHPe+LF6XI+7r3A4w7AV8/Vn7BvGyUNf7qjv/yKe+jvtC464PBI1aicUwpZ2nnkaGvIDowHOHfFhCiBDZXEzx4fX4TEYGzzyoBXvT9NWk3cqxrWkR0WBOCw4USACRyPfI1K0cupJIZvKxUFHdXAvOXJzHdKDhKy36+kQu/o1tOjtjxY0ddEvXHE0WNC4MkZHBCDFI1WPbkxXVVBY5x07k+ncJ0URNhlrW0fmT2pkGQ369cMqPgE8hpZphqEJRGuPpwh88jLPXiWSDAKr6XwTTNBXag4ZliqNkM4YCEPgcrZw8F9PIr4KVb/O2QWYtliqkCUyTpdqPHv2PR2O9IMMrQrftM2UKEd4o2m9Tpb1ovEwZXR/myBGPLMhOeQ8r/AJJieN3j3LPxYvIjEeMbaOVkdOg03R9icU37aOdHdxRh7l6gQwbB5BVjH3XOJY570t4Zf8zg6t7S8HaM7U4Ja+/nGNHg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(40480700001)(426003)(83380400001)(1076003)(47076005)(336012)(16526019)(2616005)(26005)(478600001)(36860700001)(7696005)(316002)(70586007)(356005)(4326008)(54906003)(2906002)(44832011)(86362001)(70206006)(110136005)(6666004)(4001150100001)(41300700001)(15650500001)(8676002)(5660300002)(4744005)(450100002)(36756003)(8936002)(82740400003)(81166007)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 21:22:23.3338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4010ddd4-f0a5-4e03-998a-08dbe233216a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-10 12:12:59 -0700)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-10

for you to fetch changes up to c57c83846676f41a7fb4165b7fad8018b2f5d617:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-11-10 12:12:59 -0700)

----------------------------------------------------------------
