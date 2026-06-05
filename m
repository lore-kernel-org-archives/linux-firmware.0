Return-Path: <SRS0=SGBu=EB=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2FECD6E7C
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Jun 2026 17:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A47D61F00898; Fri,  5 Jun 2026 17:32:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780680756;
	b=FTaR330L4Lg6zn3jj4hijAEbhsmXSVQ38oIsznAV8Op+H5g1OgYgPiV9dYt5C7NXldlL
	 B1c/NzTB+Q6B4G1zDPU5Li/auoBpI6kV5OvcGo+GCxQdMLcRk+YWXcBbq8HRbTlHLTs9+
	 c1Uate1sOcAFyAkfgKEbllzb9Ljhsgdi++IQlaxZg9loaSESwNi/9z5DTBshSoHJlwBPO
	 j+i3cILHvMoVxQfM1Qm+vhbsliTOoiLdzjPDNLPE0DHrl4blWTo3e29pHDxrD5ZOynDVP
	 eeeqyv72SyTLgNTOqTdGgOBRtRZmT3V+6vshYatnswJI4RCIdvty8J2/AWari5RZmsA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780680756;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zjNjUMLyAewUMiVW4DKJPSUpH1muWQTCZHKbLHwJ6rc=;
	b=BCCyrYCZWQ8evKo6j550tbFU+rSir4Sp17shuIW+MztMgmRirSuBnfjbVRshi+H2p9b3
	 Wc3WekIamD0lLr72ammeP146TQvGhlW76uNbfUktbvNpev6sXieeHgqHzHbPNXbt2tg/w
	 FLNNTkKvp4Pdi8i2IAENn+/eZkNuUED+VzWaMsCuvOGPG2U4Afw4ESYvEvQCqDiOx7H20
	 4srRsYvuSgrwNqS5yoc+QGjWGNkwUmU9DAYODcNxpAwQMoxkTjiFgu/nuogzeismThJ1d
	 z6h22wbaf80tMfjpwwmDTeKiVmIceK+TzHOL+KVdPJ7Opgo4wnkbrc1Xdc6xrC0FoAw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3H8p7IXB;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.63
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE9261F00893
	for <linux-firmware@kernel.org>; Fri,  5 Jun 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3H8p7IXB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org CE9261F00893
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stk9cjTx9RldDglwDFIH6ZzNfWbrAMM7FOZWvg+2V2fkAf+KyPXoG090fUlY8IP7odgVz9jDO87NCifYrY/ELK/f6x274SFvzLdsKUOr6RNV3YTByiNyyGaE1NUIpOMsdKsNvgGfFaEl7YVVblks6rGRJ3+W6tzqdRqIB1cjkA6/nhP5Ko9JtxfA0hpT++A8uBvX82OVNsgy5W6K4zUMiSCSNDulZzcW0JTc3IUvcXbztEewp3UrA8XO0huh0wj8HxBAOFFa6noPzBwEShAyFaGRDmknMzthU92AVi5OxDSl/IwXY+tNp+x13VOqX0VR6eSuKi8BtQ+U5ThxaJW66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjNjUMLyAewUMiVW4DKJPSUpH1muWQTCZHKbLHwJ6rc=;
 b=zRIOwxFLvyOvTcpMbzRgNteNnCdjrNBIuLmRFZNeXQaImURtvIq522a8zbkzuW0TqqZUWrlwN18hRVZuxBee25qnEP4yjv6XtdTsNwU0qCJU859sqE1+c+S0460mZEmma4KDvA+6GOoqUPDl+30dbgFnlOu2XnkV1h+5wYwY2NTxGtHePuFIuZ+mlfQQzMHfNWBOanFQKEyAGpjuwk8006CkQJbDzRW4WS+JL2lLyY80gkkozFRgQkZJ4r1ngbhYPe1VZeaJcwvUjRdVtfB2zd/aqP8JFZLU+3lsSIgOYaajbOSZKTm2pTw4RhVgPxSMommJC7u0xNh++NqdmujyHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjNjUMLyAewUMiVW4DKJPSUpH1muWQTCZHKbLHwJ6rc=;
 b=3H8p7IXBH2YU8dVc/fUra+gJ2lndB3okUrqteYc2yrGrBROhPQlSHtlVwxF2x7FVorkeuEXJd2D2Y575DhnsiS3sYAlsXrw2DoxnxodjIyN36As6WGq423C90oTWEREws7GYVubHo+R1sI5hxhUUvyyXilNKY7oMOFqOqehNGpg=
Received: from BLAPR03CA0047.namprd03.prod.outlook.com (2603:10b6:208:32d::22)
 by LV8PR12MB9263.namprd12.prod.outlook.com (2603:10b6:408:1e6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 17:32:30 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::3a) by BLAPR03CA0047.outlook.office365.com
 (2603:10b6:208:32d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 17:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 17:32:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 12:32:30 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 5 Jun 2026 12:32:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu amd-2026-06-05
Date: Fri, 5 Jun 2026 13:32:23 -0400
Message-ID: <20260605173223.25087-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|LV8PR12MB9263:EE_
X-MS-Office365-Filtering-Correlation-Id: db85d6db-f550-436c-6000-08dec3286bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5xd4Yh+zhxeyFjTQteGOeDXB07xGcrkOEQnSYg0esmDVMkcrCM11jQFtUf64UUdlKhi0A5kDRRUFp0ONjdmOy8A2+1vc42xgFQh8Hx5113rB7G89oIDw2BahrVm5QvNW3Kc8UaKkzlvpXV+TcDUyiP43yORzSU6iTYVEwsbfPTkxXLfBqVskOvwjxdKQi2KGdHwAbIlnT71jW82mMSB6se8uhzuG6ttA8dCWSdaZ2cbuQmdIcqPJtetOU3g9420a40DGOJ/ZOcnI7J+1h/SidDUV+s+kXnefSForuPXYSHpdiIz8zsliy29UiHlZucXIen6BH/F0BKVsoKBWYr8J1xDUr2/WPPo6HH37gW3meFOP6iwjY026OilS32MEEko6pyn7fZFlyO4f8GpNwxPSsfXYvkwaTOSSnPpw4XuZm2R6Bpj9OVXQq5roEY5sztGfRR8jrashRiyUK91T5ye3uTXcT+0Jg5QaVCXyLPFbwTVpz6tpKS++OQJv/Gsyp1uEwbyyHZWbWhsyO1+bimBkD59cepFujN0/hYEPRMCnZhCXooQ/1LAxfFXwWC2iXIY8Xj506tYrV2uecMEC2yCdasQlB55sPqfmKCwEqHKPfDwSrUfpp4gCzHcJ9VlfBywNchDN5bFhI++v7lsE7UfbwhKjb+39ZRdZMBUK8bB4VERgH7wSc/pXFLR4HUfJ9WxCUrXS8a8pzA8/a+51QY9d2aGrg65gsVNml2lh/FChgdI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0gga2ZyoGfRyCm5i4N/FqC0KIL13xTLMEGkpna0ITrp0ri+r3OiNy8Fmm7W7fg6ikmW2LkZr+mwsOl022PocTcKMlkgXFAaAHBvrRrT9ERsSNTGTZjNl6Rp0P5DT230OndQFcaXLtLX/iS0QRW6hiEUVGCYPZrhrxHVq6hlOAwquE4H7/v9oDUm/VS9BuhboQDR+QIv08FEz5jLrApM01HAKaUYfYeCR/r2ScMtVBazzqrZsx7EJ2Uj3RU8FnZj0ImXGl6hLnQL7FEnmR2TiynFDUGoXtFp2f9OrESpgHHYcwl5LQO85P28nGX2iI2tTTs1CR1BrzseHBxob0SkXRDb7Xkf4Joqm+44qXCHWFzAIm+My1XhGHNkHfgIzqKfW7awEDSEFoKBWfOFRHXOkfQVEk+UdstaXpbWJnXHMnau/dUPLi4kkpx/N0eiPg8lD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 17:32:30.7552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db85d6db-f550-436c-6000-08dec3286bce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9263

Hi,

amdgpu VCN firmware updates.  Reverted to previous version due to a
regression caught in internal testing (VCN job timeouts).

The following changes since commit c8c796dcdd3b8d1ec71de2c7a71d3d7b1c8f7a68:

  amdgpu: DMCUB updates for various ASICs (2026-05-29 07:50:47 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-06-05

for you to fetch changes up to a69ce6eacb583310d3c0d16beac00935d6411651:

  amdgpu: revert yellow carp VCN firmware (2026-06-05 13:28:07 -0400)

----------------------------------------------------------------
amd-2026-06-05:

Fix a regression caught in internal testing
(job timeouts in some workloads).

Revert back to the previous firmwares.

----------------------------------------------------------------
Alex Deucher (6):
      amdgpu: revert beige_goby VCN firmware
      amdgpu: revert dimgrey cavefish VCN firmware
      amdgpu: revert navy flounder VCN firmware
      amdgpu: revert sienna cichlid VCN firmware
      amdgpu: revert vangogh VCN firmware
      amdgpu: revert yellow carp VCN firmware

 amdgpu/beige_goby_vcn.bin       | Bin 580240 -> 580112 bytes
 amdgpu/dimgrey_cavefish_vcn.bin | Bin 580240 -> 580112 bytes
 amdgpu/navy_flounder_vcn.bin    | Bin 580240 -> 580112 bytes
 amdgpu/sienna_cichlid_vcn.bin   | Bin 580240 -> 580112 bytes
 amdgpu/vangogh_vcn.bin          | Bin 572368 -> 572368 bytes
 amdgpu/yellow_carp_vcn.bin      | Bin 572496 -> 572368 bytes
 6 files changed, 0 insertions(+), 0 deletions(-)
