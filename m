Return-Path: <SRS0=RQ/a=JQ=amd.com=Aurabindo.Pillai@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6DDC4828F
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Feb 2024 21:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55A6CC43390; Wed,  7 Feb 2024 21:01:11 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 107F7C433F1;
	Wed,  7 Feb 2024 21:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 107F7C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJPUtgQfgpFTeXnB2XM4yPzZlV27PBclAatCw0NWg5Kkkhe4nbf8TJZLTmG2Ruyikj+zMfF/QwjQyC3ws7wY9AHNk+O+ETNJEfmBTtb0BTJGCQ1S5k7WpEjbI3mRCCMQLo567WSM14HKkILF5Zrm0BoqnC0FNZid+faV/mynkZaYcSWkrtkKMqRufj9V3YS8b8lHkezEyECp/CPN8lquuzrbNIJf+0AHdU6Mv50Nr9BfUulKHV3DEaNDIyp36zHrAH+/PgFFaatfg/ck3OyqyN0gPOAs7pSGpT2qy5DlpTVGijZuTJouWhIIg3GH3zclQ5Nc3JaJzZXvUl9qzUpbDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnwAjOoKmFoWE18/8YFiMHpVMxr/jCnubFq3FUqjNBk=;
 b=JDVK//b3ZLxM2L2dXOh1/nV4nk0l6GiSYz+hID1VvNjBUJVMRli8G0TiNa8eK5SAUEOPTkJ2S7d5lCqXiBYse3lyYlLGnD0HAuVPPumlz67Qny2+Hp1DGWq6SBqJwmgivo8jYrsn3RY5pZBWitpUDikrtMYj6yQbxKtQoXL9DYd2xbYZ/xH55n63ObWR2FYzjh0u6xqRo2l4Qvdcbje0ghpNMIMPDKECnBcXFyzMQzMeC2zV8mmXRVisOLhJRspDAtscxNSkpOkvhxCwAjQUE5Gayu7+LMpMIUdssrTAFXLr3HYTmCiKaoOe+QGrQSKB8jS/lCcLGnNUsmewrZyp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnwAjOoKmFoWE18/8YFiMHpVMxr/jCnubFq3FUqjNBk=;
 b=tjqxYTSVe8ZBCKUgQ7SEQ+qvBz6Qb5U5T4MNDhMwpqPSxq+OQoztXFVfR+GhZ4+MmvlNYnA4PJ5vBtqnkuPFgZSWWaxrnFWlln6ycb2xg9c1jF3rkT5tNp20dmMF70UzsHjuvnOPshaQkaiUz1ggSTHmjWcjN7pWSL2BCcwC218=
Received: from CY5PR22CA0106.namprd22.prod.outlook.com (2603:10b6:930:65::19)
 by IA0PR12MB7775.namprd12.prod.outlook.com (2603:10b6:208:431::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Wed, 7 Feb
 2024 21:01:04 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:930:65:cafe::af) by CY5PR22CA0106.outlook.office365.com
 (2603:10b6:930:65::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38 via Frontend
 Transport; Wed, 7 Feb 2024 21:01:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 21:01:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 15:00:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 15:00:59 -0600
Received: from manjaura.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 7 Feb 2024 15:00:58 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.204.0
Date: Wed, 7 Feb 2024 16:00:56 -0500
Message-ID: <20240207210056.1610158-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|IA0PR12MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ba1c4b-5727-4427-7e90-08dc281fe4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Ixbxbqj+0bY65jjvSOV8m6rZ2vqrqupXZ4YwN/Knxm7rltrJO/st9Zxg7J61/afcx2FqJo/yi+CySlaMp/E7pRydQKYg14jYxvWjmNISnKunSei0nUEumZ9MKi/NafwFsui5e6cch6WGsbdDhJL/vI8WpoxSa8ga1/KOsCc1JKpjqBDRlGdlS7IHmOGrOYhlrk4Z7cAqxE+OtIZUxEZJGfyCyjgZjjhsYp2a3KYr6uC1TYCRA2lswD4N7j2v2dwO2B09nGb6T8T1O6TGa6iFOVxpLWa/G6QQglEp2Uq5pPNbxwwaxWvxXVJ22GDktcsJUyMpdfupWjr0e+jZjGzJMlLGHQ/8dQTSZvfnueER4BI87ERsRrXpGf8Ntebx9DlFnfXCWlCR8sizGHfyAG9jrDPOtyxsL01DDQrQi0pDZNK/QAXGs/BUfWYpA3HmsV8qhQQa79dUCz8X8LSrSkh2M/7KrNu4PKVhddFk0Wm1BE19PIcw67HWTNIxKBeEJoPogVO8tReuUSSa/bq5ZZuOjl+Ty/pcQ1R91ifrVNVjeonWlQnJYQ/TSuqBu9u2ptSclRX8f6y2iSouOjb59iJ8RregJwyvPMgKFI87Ir1fME=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(2906002)(450100002)(15650500001)(44832011)(4326008)(5660300002)(8676002)(8936002)(70206006)(70586007)(54906003)(316002)(110136005)(478600001)(82740400003)(2616005)(36756003)(26005)(7696005)(1076003)(356005)(81166007)(83380400001)(426003)(336012)(41300700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 21:01:02.7931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ba1c4b-5727-4427-7e90-08dc281fe4f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7775

The following changes since commit bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:

  amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-02 16:58:17 -0500)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-02-07

for you to fetch changes up to 914ac3d1a0881098fa7f091b2f7bd848544c44e8:

  amdgpu: DMCUB Updates for DCN321: 7.0.38.0 (2024-02-07 15:55:39 -0500)

----------------------------------------------------------------
Aurabindo Pillai (2):
      amdgpu: DMCUB updates for Yellow Carp: 4.0.68.0
      amdgpu: DMCUB Updates for DCN321: 7.0.38.0

 dcn_3_2_1_dmcub.bin   | Bin 0 -> 232224 bytes
 yellow_carp_dmcub.bin | Bin 0 -> 234768 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 dcn_3_2_1_dmcub.bin
 create mode 100644 yellow_carp_dmcub.bin

diff --git a/dcn_3_2_1_dmcub.bin b/dcn_3_2_1_dmcub.bin
new file mode 100644
index 00000000..e463012b
Binary files /dev/null and b/dcn_3_2_1_dmcub.bin differ
diff --git a/yellow_carp_dmcub.bin b/yellow_carp_dmcub.bin
new file mode 100644
index 00000000..5b634a72
Binary files /dev/null and b/yellow_carp_dmcub.bin differ

