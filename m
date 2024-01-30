Return-Path: <SRS0=EH65=JI=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E12C46CD2
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jan 2024 14:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65504C43390; Tue, 30 Jan 2024 14:13:11 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EDA4C433F1;
	Tue, 30 Jan 2024 14:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1EDA4C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TuC53VdngvUNUosfWhU32t8kzMOsJ+eyfrQwz3RKqdy8qPOEbK9YgPMYYr0BnHLr7yap4SuoUBNrVXL+47t+WQf/8JLp4B7IcQ52hPus5jJBuiI/mZRNuZXhBfOYsqcEKTFXPqdCw//W/9BfXiW5AbReheqGXXxnvglOo58CsUXa7ZxGdWHRZrsX1E7UOKguZ8kiba6vBDA8OWKtDY1jLgf6ODgaZfLqNuPDQcWUTAG5y/AMgEBOKvCKzmu9sfXVI88ZgwmnLZGPjw+lD40nfsN1QVf8uucwXbuochOzXVQjPK6/jifITzk0Vng/nBox10838FvU/g/fc0xbZveeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHyuiI42+Ol7VS+5KpPRGg6dr3Nx2UtBVHuY5BscQaI=;
 b=NIL/NyoPBRqKHZoEfqocS11BxzLZOUK0oPWMDKzL6i0IFjqzfd2HfEADJS6t9ZoG+E+9SDGSQ6ARV5+oZFxjvrhs80JAXyUiUNS7+6ZtklwFoOCjT9y7RFaWjrc2vBslanCnG6nDKg+WphWjApTR3FiJIpyXLOJtuEGkvmSLE+XhcoXDHslbW8sMobVnk/32zcWTsLPJYBgoejmiYWbQJEpXg90xUjVL2AjEmvMX1zfnz8HXzRK6RrVSo64TomaSGpDspNTMQKXPBdiDerFeg47zdpVsOc0hCgP91ap8n8J2nItwvgBJ6uwXM6fmkdjpCB/OyhqLHAwpOrHNn2EM9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHyuiI42+Ol7VS+5KpPRGg6dr3Nx2UtBVHuY5BscQaI=;
 b=GXs/h5Mbni+u+TkZmzwBnuDIg/hbivHqk53da2XNZVFl/gwOWfHRpFU8bB9Gmd9iqW2czkCyZU5RmMORQII5HKaOGoP8n1x6MKLVZt1nmHdivq94M3Y5qTJR4L6iYcKT+8vd8XCiBPIeBu5sbwiauU16D6iPWEqJoMsbCm/pp44=
Received: from BL1PR13CA0177.namprd13.prod.outlook.com (2603:10b6:208:2bd::32)
 by MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 14:13:06 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::99) by BL1PR13CA0177.outlook.office365.com
 (2603:10b6:208:2bd::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Tue, 30 Jan 2024 14:13:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Tue, 30 Jan 2024 14:13:06 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 08:13:05 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>,
	<Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu amd-2024-01-30
Date: Tue, 30 Jan 2024 09:12:51 -0500
Message-ID: <20240130141251.2493810-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|MW6PR12MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf2d2d4-56b3-42a2-3e9b-08dc219d9479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+CjYlkNuAScA/af85yP10/kzY2BpXXaVSZczCLula0+T269uZZmMnBOPrscJ9K2o892+vBET0rdKf4PoVKHmqJTQIhzH8nKXdNCQrCgAZuViNx6Tsp4zU2/Sc9UhFj4Rgnv2o+p97ntcLUlOXtMrwY5s9PgibSSSgtNRVbSYDmHHpZ4rkzPpFMbgB72XG+XcEbRj3H2WfX1qHJcSIAwD4Oe5OEQeXpQL00t7mWqObF6t+kM/XJpmbobf/JLHuF6pycJoAcIx1QWD0ewOqbMSS+Et/aOcau+Z0EIuCRJ8clIDtZElSG6JkdDdKq0ghOmni0yIvvxisADQGCtMUBTgYsBzsewn4Qz9++34ep6v9DCrUxI9LXW3NtJLVmfudvo1YgMnHiIAxQov8EaviaKJ1USmT8jcxDJ6O2z8KLurwMp0EuBCHhz9wbQC64Hs1nu7J740QZfHbuGM07Qyvu6hUKn8w1cQo88OSCxYUrGCpAjZ7vVvZ/yESn31kBTF0Xm2ZUqiutGgw+zy0zma3IZ+shcotU9ofjlXtSiCYzPX4leajFUL02C3VTWD5NqZCEFTAn5HnOWzk4RFxdGdXlOj9oxwQmHV3pwF7Yl/GbqBUrlPZdMyTcLteikXZjhNDqKsosCZOfbbBi5TTH2e5EqqNEhb/pitEl7PpamO9CEb+elQrQnV7pJjSl1IXV0s2BTTIkWWOymUVso1gssVGvqqgCU64vMK6nK75KPF105Pb/LzlAdgDUua2ycqhZzKXAXc
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(40470700004)(46966006)(36840700001)(450100002)(4326008)(8676002)(8936002)(2906002)(110136005)(5660300002)(70586007)(70206006)(86362001)(6636002)(316002)(36756003)(36860700001)(966005)(47076005)(82740400003)(356005)(81166007)(7696005)(478600001)(6666004)(83380400001)(26005)(1076003)(2616005)(16526019)(426003)(336012)(41300700001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:13:06.3854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf2d2d4-56b3-42a2-3e9b-08dc219d9479
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8705

Hi,

Updated firmwares for RX7900 to fix reported issues in gitlab.

The following changes since commit 0982b6be090d765416e8ff7fa311fb5b177b6692:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-01-29 11:32:52 +0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-01-30

for you to fetch changes up to c8c69cb95b876c12c2bcb74fdecc5cd7f587a882:

  amdgpu: update SMU 13.0.0 firmware (2024-01-30 08:55:15 -0500)

----------------------------------------------------------------
amd-2024-01-30:

Updated GC, PSP, SMU firmware for RX7900.

From internal git commit:
3c4bdae3eab9efad8922cebd5b3c6583bb84751e

----------------------------------------------------------------
Alex Deucher (3):
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update SMU 13.0.0 firmware

 amdgpu/gc_11_0_0_imu.bin   | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_0_me.bin    | Bin 298320 -> 379952 bytes
 amdgpu/gc_11_0_0_mec.bin   | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_0_mes1.bin  | Bin 216832 -> 216032 bytes
 amdgpu/gc_11_0_0_mes_2.bin | Bin 244144 -> 242512 bytes
 amdgpu/gc_11_0_0_pfp.bin   | Bin 228096 -> 229152 bytes
 amdgpu/gc_11_0_0_rlc.bin   | Bin 185248 -> 185248 bytes
 amdgpu/psp_13_0_0_sos.bin  | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_ta.bin   | Bin 247040 -> 242944 bytes
 amdgpu/smu_13_0_0.bin      | Bin 292452 -> 292452 bytes
 10 files changed, 0 insertions(+), 0 deletions(-)
