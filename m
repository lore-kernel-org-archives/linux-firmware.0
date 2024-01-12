Return-Path: <SRS0=POaE=IW=amd.com=Alex.Hung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D93CC4707C
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Jan 2024 22:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFF53C43394; Fri, 12 Jan 2024 22:49:59 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2043.outbound.protection.outlook.com [40.107.96.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87FD4C433F1;
	Fri, 12 Jan 2024 22:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87FD4C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ip5F/iTHcu7FpdV9jwF9mBefORbJ0Q8SlyBHsDgboM3ebJeJd7mW8CQ2Q3Wk37mx/MLS/DrmYWRkzRyL2VM+zwRSVZODWNT8vpDyUGwMKudW8Y29qfjEX/wNJMlVZM/WAS2MxfHxbBCr8X9JBF/Iv3KedTkGJcOhlwKywZdZC5WDdS66CLWvAltK+X3HWud11lMXDiMX4NVSj3Ji98ctAh3UX4Qu0+1o3VT/3BKwMH/ierreKNw4h+ZmF4AOkwKFBytcencziEdsX1IonDPdrweSuP/kGG/3On+B5ou3SOCXo3oEG21BLZiiihutX3pKghcDXfriRaK3rz4G3c+MZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIppEtCUM/EbxNtWw3tm2yYh/CRJKx3CeLdUZCvyucc=;
 b=OQWxs997mVPyHTVan5YRGai7aXUUejteCob4cQD4JQVpoJgp4wmFm/zaUO8SMgWjHcTbnazYmkYfSTCljVLJObobsK8Pjwh9bNI++wqjZ9g/mTp6aIE8wGJZ2X6nqyip6d4en1sCmqMKRx+qiskrwJOAfKpuDXFzsTFNqHuEST41RwQQvCrjdCauST5Z8VccTVet/ha7gdKNUPiDLt2FS09vmtI3P7fBuLuaG6/W9kk8BWX8j5YdRE7pQzczLWlHXZa+IaxtHxaUKurBYkDXh653KWivr/sNetBA6uAMxTGjBXwemaCYOB8Vwy3dnEKVGKq0VxH5tSzfDIqTv0sLRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIppEtCUM/EbxNtWw3tm2yYh/CRJKx3CeLdUZCvyucc=;
 b=OK4d0nMhtyH6W7qq+foj7Lb1BO/qEPUifWr0CRnwWXOvKL4TOtuny39yZvEJ7d0y/iGwFdfLDLktJjlca2LD02yZChh/8nQ3D+yWHFmMOPh1JM2/0tWuBKP/63VjgzrQaMHPyOfXmdzXhpejJPdNuH49aaBaN/mkSjTj69cM9b0=
Received: from DS7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::10) by
 SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.18; Fri, 12 Jan 2024 22:49:54 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:8:2e:cafe::4) by DS7P222CA0030.outlook.office365.com
 (2603:10b6:8:2e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 22:49:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 22:49:53 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 16:49:52 -0600
From: Alex Hung <alex.hung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware for DCN314 to v0.0.199.0
Date: Fri, 12 Jan 2024 15:49:28 -0700
Message-ID: <20240112224928.3827132-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 72372f30-086a-43db-53b1-08dc13c0cae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0gNKDI6r6vFqvc8ndGTAFAsgavIkYOfzOitthFKG0aNL5T+gAubjebVl34h5uBZhISTUklkAZsZNL1TnS/79//Urb6EcTp8ARZ6cMYek+D4MuL2wJKd0oK/eAUqr3KcMLM+e4ZuvOmVXNhuw6OV9lpc2ZqqUFDhmxSTNeyPhHhr/4d8qkr9JfUrc4zugGRUdy8ip1/s6dL0nXFy5SuJoo7HUXf1aKKj48nw6O1UZ8PZajcHFtoqEI89812S+jcYL2tf9AJzeKPhriLKkoVa/diPmt7/+Fk5ikA2BWr8/Sq9F13rxC118v7t3bxbpuLmyluPrHCHVLu8zbel2lNtLOokLEYz7QcVxojzToOJ3Dm8Lm5SAN2CL1Xiuies9S0r1Zl+77EuSsqXAfCcijIVyMolOQ+JWxlJDy7ROfdM9tyZZ/bfpcC5lUCLf+ijUhrBLSIgKpnWrLnpVakLC9l10dk0oyuBd4fk7+bxTCWC9nC2pONs8OvvfzBLDw2APR3jySK2M5yRlvywMhz3rIRnFIY4nXj89l5JwIda40SA7xRQ43L5DK3CplDnbIqYduuHdI4ICghT4aRdGvXoM0hiK6Ts7NScoYIcQbK4lkskHMUHHh9TMx8HwVtYPySiTKB4SspllGgS7YJSCO3/LYqlrOPuTdfQFY/+KHUSxMrydr5rgLrJPlDPC1+r7pStKqGeX0R56CKdWWUprAXsW92RgSyih+E5yew1V1ID+ek6gR/CJzfgFSLEu1deq70lYjyway/o+jniwL3AyGowoIUJ7Cw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(110136005)(47076005)(426003)(83380400001)(1076003)(16526019)(36860700001)(26005)(2616005)(336012)(82740400003)(4326008)(8676002)(7696005)(2906002)(41300700001)(450100002)(15650500001)(4744005)(8936002)(5660300002)(70586007)(6666004)(316002)(44832011)(54906003)(478600001)(70206006)(86362001)(356005)(36756003)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 22:49:53.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72372f30-086a-43db-53b1-08dc13c0cae9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204

The following changes since commit 4d8afe32753bff72f05b8eb125b401408f718a50:

  amdgpu: DMCUB updates for DCN314 (2024-01-12 14:43:41 -0700)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-01-12

for you to fetch changes up to 4d8afe32753bff72f05b8eb125b401408f718a50:

  amdgpu: DMCUB updates for DCN314 (2024-01-12 14:43:41 -0700)

----------------------------------------------------------------
