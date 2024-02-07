Return-Path: <SRS0=RQ/a=JQ=amd.com=Aurabindo.Pillai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0C7C4828D
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Feb 2024 21:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55C3BC43394; Wed,  7 Feb 2024 21:28:00 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4419EC433C7;
	Wed,  7 Feb 2024 21:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4419EC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYjjooLZpV6ZauDOLHa8cSwzZX4KwWUsNLZig0ReyrFBULtMT6AyYeP3wRoHsxoaUt5v+odZRVK5lb0JlrmCf0nZ70lZGW3ZffImH3uZ4mTqLiiBk7m3+eDH5POteA5MspIHOlSZqC8hno12L1muKb8abQvBQPZ4qJQm3kYOBXQPoaZANpsM208X1wfvKXoj9M+cbpjAf1jcMKomL1+PhWa1lZQEkpb1sU44YcPYCfztxFKECyfmrtW9ctm+jM4QWfuJI7PfOPdYTSQwmrtqHkJKqaqpLyQwlaXuLuxUyoaOmYu3i5Xv0IcV6B56OtdPxhk0+dd2RvXr4qNeK3gi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+5d9QW0sprMzsbb03EYknb2Aggfu2Arpa+8Fr26BIU=;
 b=QyJGONfJyzIiVCtYmWrjn8AOh7RfccJiCg4fenl86ondgQGgR0hn7Z5MyoyAx15NANr+b8Tl44eot0iEYvINspy+nGyeIkaf30lxK633q3fhUOj6a4uywVKYs1R8qKD/GOAf1R4udL+UHNCbXs5HWqxXCrJ71Yk4e6TrfKdmqVxMhzqh1WJl9Bwdmgrox5pAH8unweaEvJJuNEWjaSojwI0GGKUAe4fH0J5tM47j2Nz2c9MmpElu7zcqgKvwlQaKDyYyU8023NPKOAE6cEqhiNFQmfN7OCFC5583gbdP2fl66buJeeaj4ZBRg50aI6YcNSBVYcAFHNCnuPqoOlOdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+5d9QW0sprMzsbb03EYknb2Aggfu2Arpa+8Fr26BIU=;
 b=2AAokmdN2T+VZUGaUSog9M80HTfOAEiUHmhFTM7xS92cquQL61noTrE3wfDt0Ra7B9LULKSZDPvNfq4VKdYOqU5SVCjMANclow854bYnulF+IRruVDZjud6yWmBai47KoAsVvHZQfrMOx1Z3NPXpl8965+K3n5Sqy2buMJ81atk=
Received: from DM6PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:40::23) by
 PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Wed, 7 Feb
 2024 21:27:57 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::b) by DM6PR03CA0010.outlook.office365.com
 (2603:10b6:5:40::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38 via Frontend
 Transport; Wed, 7 Feb 2024 21:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 21:27:56 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 15:27:55 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 7 Feb
 2024 13:27:54 -0800
Received: from manjaura.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 7 Feb 2024 15:27:54 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: V2: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
Date: Wed, 7 Feb 2024 16:27:52 -0500
Message-ID: <20240207212752.1614192-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3e45ba-16e0-449b-3930-08dc2823a6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kkw3dbdlOXN10EE63Vvkz2v2vWiSUbOpGExirObQ1VYCWdBv2EQLeIJL2DHLI3OEr4eBXAW6eWp3cdqhajz7hnxAVw3xa+XNdMMZ83IccREH4S+5K5PyTaIahZKUyyQL4W9RJrfLuLk9TR//QJqBIf3MSz1ECzOTUNDATB7RJ+Ve0bMwT5KJXVErJQenqmRLQK6BSaoQX4ZwTRub1FGZxQ/RKwYOKCJAXVn1nzMzFRTiTvgySR2WuY+7v0fetyhYg+2cZAuktXBnwI5wbyIyEGidke20QVrNJbjqU4Lpd1JNTamCs4HzgxUOK1eLhZSMvpJAjIw81NWlwd40oG3iBBtYD6mJIC2oasnTSHXLYOrZfNGVH7yFV3VCoHWoc9vC2NioQ+D/kFK/zrX1nUZ6tn2xIOYbtAPrbZOYqi02q3kmM75gJEgsDBtK7ktZVt1BnMKRKfZb2zrNSq6omlCEQ8NVzF/rOi7paIGDb4LLbivunwC2xgWQbwicfHDpP+oNqqZW9glZZK/Aq4fwO6ttPrO+GmHcT7h1nL4nm1e24JCxai1dhzPngcyYpcg18JHEkwa/zSsF9iBrkb83ZUHEPLq4rd29jeoS4+dyEy3t1cI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(36840700001)(40470700004)(46966006)(2616005)(41300700001)(15650500001)(81166007)(2906002)(83380400001)(1076003)(82740400003)(7696005)(26005)(336012)(356005)(36756003)(426003)(54906003)(70206006)(478600001)(86362001)(110136005)(8936002)(8676002)(316002)(5660300002)(44832011)(4326008)(70586007)(450100002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 21:27:56.4973
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3e45ba-16e0-449b-3930-08dc2823a6ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096

The following changes since commit bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:

  amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-02 16:58:17 -0500)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-02-07

for you to fetch changes up to e34e1e5078b8020c789c7f11e0176c86630f4d3f:

  amdgpu: DMCUB Updates for DCN321: 7.0.38.0 (2024-02-07 16:13:19 -0500)

V1 PR had a wrong path for the files, which has been fixed in this V2.

----------------------------------------------------------------
Aurabindo Pillai (2):
      amdgpu: DMCUB updates for Yellow Carp: 4.0.68.0
      amdgpu: DMCUB Updates for DCN321: 7.0.38.0

 amdgpu/dcn_3_2_1_dmcub.bin   | Bin 232224 -> 232224 bytes
 amdgpu/yellow_carp_dmcub.bin | Bin 234768 -> 234768 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/amdgpu/dcn_3_2_1_dmcub.bin b/amdgpu/dcn_3_2_1_dmcub.bin
index 42790cd8..e463012b 100644
Binary files a/amdgpu/dcn_3_2_1_dmcub.bin and b/amdgpu/dcn_3_2_1_dmcub.bin differ
diff --git a/amdgpu/yellow_carp_dmcub.bin b/amdgpu/yellow_carp_dmcub.bin
index a72743bc..5b634a72 100644
Binary files a/amdgpu/yellow_carp_dmcub.bin and b/amdgpu/yellow_carp_dmcub.bin differ

