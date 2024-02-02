Return-Path: <SRS0=UVxI=JL=amd.com=Hamza.Mahfooz@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAA7C4828E
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 22:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7506C43394; Fri,  2 Feb 2024 22:00:56 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2AB2C433C7;
	Fri,  2 Feb 2024 22:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2AB2C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vx5weIrMCZULs3/MzfOtgV7d/bunUkuENTH+xDEikds5uy3r3qesrml2fIhAIG8Id4nCMhJUTR+OdB3mdsvAvze+6NhGk5fOklGOvUWJ6Qa8qXSlrpjlUGQYPEQ1z92vYxLu+xLPL0RQVFSAqZD9lMGFa6Lp3e/tCgwHXffNX6vRVvjhLeXHTEOVL5PN5fRNvugPfQwiBnWgk6v+8ceyFcCbqG1HPcFTqtHb+ypclXFCRjKz4qOQHJq5OykJY+NpVmopTPlbaK3WkvXcu6eMrl6HYW8deb3ti3IyzV5tdcqeKSnAnPqnoFmzQ4Tz2KY97gDBWR4GoTco5y47ld/ddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIYflpOrEtFQItiKNdgLbte0K5KjK50F2zArK/gSjXk=;
 b=VtHRFM51nGxlmT012SeT9B173NyNaP+Z7t3+HWJ/p28T0iZVUqBpOGmsDMnwfo68VoqgBsBdNbov7UScfzgr40Yfe2mwG9UWdte/I3ZqiZRgD/Qfl1IrinfQNZTTLqxQ8OVHzltgbWIKkusGxA9UtShNkQU6mRF/Olq29k93aUrFTILkrdGk7A0Qd3uJExJquAsFLRLJqBXJLCVl+zvvJgKU9S2G3D+MiSVHjcGzlr2Vl/Ga2hdurTthFdi01Ud6gnq+trnjzYxPGyD5DC5/Hw3z31yh8LMeQyxPgE6O84vlCAE9z2lLnoHiKhq5z8pLS4ils9A19bw6/fkLr83EEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIYflpOrEtFQItiKNdgLbte0K5KjK50F2zArK/gSjXk=;
 b=smpuazm0519j+QV60uNMnDlHxhwU3kF8G4cIQbhPzhrrVWrCCBBX+q4U3e9tz7RNzdXvRmL4FMSD685Z+V+MmJ67FUQ79hsztbdvlZcCC/7bq59mpJD65RtfmB1s+Gd3fLo1UKoc4OwQql3NEvnP9x7TkD0Oo1JX6ih+xBX+ma4=
Received: from CH5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:610:1f4::6)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Fri, 2 Feb
 2024 22:00:53 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::1a) by CH5PR04CA0001.outlook.office365.com
 (2603:10b6:610:1f4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31 via Frontend
 Transport; Fri, 2 Feb 2024 22:00:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 22:00:53 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 16:00:52 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.203.0
Date: Fri, 2 Feb 2024 17:00:41 -0500
Message-ID: <20240202220041.138919-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d46b573-1338-47f7-a207-08dc243a6d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rfn8cseB12rXtGRnYwo9u8wsMAssNDLhmCcgLRCsOG8AqV7kWe0M+Fcw5aFCbknRLW62dgS7vRxbD2l96BkyDl1UrQBMMlezS7iBnhori+XyBU4y8H/9SIL34Fc3639xYLDF1+TfaWG0WBA4r3o79pQuWGhPsSjuqDj1STH1TFwbv5Xjjbf3iAE47WXgAnc38wlNvp/7nnCe1LeMEoS0MaidNdV/TyMQ09pojp3cvO23nvyEAecHLcTvDoislnnzDg2ws/sn2VwEciHtSQIgcjmd8fqKeN/fJyFRtgQP3tG/eJgcg6zTNBRyOjmVZ2hTQAPgejczgCvUk8zloULA0Z7C5iNCaOVyaR27p91gJfhF75ZUuHqFtFM7ZiKxFKUWZRLd+cl7DPg7hIoCLT/Xf1B8BCDdc4ObI+aSfI+T/UuvfO+E6sMORZzVImz/4V86Xz8DXy82SCDOGR42PNL7czzpgj6uB6dniCCi+fiuN3aNxuQtmMxWpBs6O6tSTpvaoM0lMBVqAyxeaso6rn3CGjckjnDKzqx4kUzBkh5HzIy0myIna7ru6owOe7Oj4e0tXKyBho0VuhgMKfG1odOF4CfUw8mju4nYVePfWXqgItZvc/KLtA1SswG14Wjs+8ev6K/IvBIR84XuYfxgE/RTXGU9Wk1Axt7k6BSdQw4iXj5YZHphNu7Azy/3VZiBQlKGV1ikEUnKQY7SumMqGPDZNgT494+HEXDD5KsqF+dN5qHD5G85m5AXFjj1qALB3M6GInoPwFFI+cYyHNXUsKy7S4guDyk+T7nXF4GUppWf4lGQMpYzAAMKDCd0Yn1Yki90
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(36840700001)(46966006)(40470700004)(336012)(83380400001)(2616005)(26005)(81166007)(2906002)(1076003)(16526019)(426003)(5660300002)(36860700001)(4326008)(8936002)(450100002)(8676002)(44832011)(15650500001)(478600001)(54906003)(6666004)(70206006)(70586007)(4744005)(82740400003)(316002)(110136005)(86362001)(41300700001)(47076005)(356005)(36756003)(40460700003)(40480700001)(36900700001)(16060500005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 22:00:53.5259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d46b573-1338-47f7-a207-08dc243a6d0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458

The following changes since commit bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:

  amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-02 16:58:17 -0500)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-02-02

for you to fetch changes up to bd2ad5e65d3bc38fc35eed8c3dbb5e40ae45df20:

  amdgpu: update DMCUB to v0.0.203.0 for DCN314 and DCN32 (2024-02-02 16:58:17 -0500)

----------------------------------------------------------------
