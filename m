Return-Path: <SRS0=O3Gi=A5=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E8DFD376A
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Feb 2026 17:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E35CC19421; Wed, 25 Feb 2026 17:03:11 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26271C116D0
	for <linux-firmware@kernel.org>; Wed, 25 Feb 2026 17:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26271C116D0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxhKqhriI0fYMrd4+Xm6VsS0/gcKXzM5DtAOax4BdTder123J4t3ijdUSQsf+Lo32lWTJ1viq0XCzQbj2lPKI2Am3cNK5GIWLAeT0FOleaoXrkMfnCYRkVTdFV/PEKNa5Q1mddQvkfSEjDuO7C/BBnkqupaDlzPAIhlty7TOxPizb4AAYLbtFlc1nc3NxywUFhZEqzyu8SA7ihHqUjFNfkTrgoat9DQi3aENwhYhPLoDz5iqJ5YJePZ6oX2vIKRjPPzRggntMbZ7Wo+GkO2ufSOO/ETpN06VI6EFl9/ftIuIHMMCW4nw25bQ4AcJOh2zYiGFejNQYlozkD3AeDka1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGPr7MHtLw3yqFlNACVpbnKjnCqZlHkG2Gnoeh750h4=;
 b=YrXODifaziCeY9JRot2uSIfaMDHtDHc9JZ6v893RSe0dyprOdbuqHgnS3LzpFxpy6KXpI/q7KeUFj/6XA6KMnu1Aaf1FAH6qUFQgBtqUEp2272LBwy5Kljv2DLXRvFESE8P03VZUWVa3xRXoKjTB0mbnvCSOIPlWIeK9Iab+EjAtCeh+jCpLSa2afxxJdstcXwWL+wmy0rgMnKU25FGWl96Ljy8yWs9yvXbRyM/cR9B0ZaLKsXnAkwI9NztP/xVM85AR+cpvV9RFutFYVT82cLCwrrtkSnQrB3Juqkaup+ZS0wyBCbHY7VbMpjg+q8tilHFk/e/IM56NWWMJX8nwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGPr7MHtLw3yqFlNACVpbnKjnCqZlHkG2Gnoeh750h4=;
 b=SEgY0gmgwg9I+dgSmTD4lv5P0KgI6puusnK7qkdcXMZEBJIeCXrdWMuPjJwnp+C4SWUZTBeTXsXeLLzXi/MZWkvevwHlyrZr1DkN/4fEAhu2FrdF8xTU/zxrxxWIZ1aZmABxvo3R5eEobkN8i9h7xsrtgjRJGc/zWb0apI3aGpo=
Received: from BL1PR13CA0434.namprd13.prod.outlook.com (2603:10b6:208:2c3::19)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 17:03:06 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::9f) by BL1PR13CA0434.outlook.office365.com
 (2603:10b6:208:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 17:03:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 17:03:06 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 11:03:05 -0600
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 11:03:05 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware updates
Date: Wed, 25 Feb 2026 12:02:57 -0500
Message-ID: <20260225170257.1801514-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: d27eb41b-e089-412d-d87c-08de748fbec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	9R0DauBVfOkMpDIe1WVQ9Mj+V0t/n3HlFpe4pZGcuFdyxWOOwyDNm6PPr1RiJfLYCnlH39OZtTlQ6bCdQl+D4eT8+Jbgzt/GwCYiM4i+lvIHnz0V93v0eUCJuSv/cDGb76thWBCjgOPBvk5atGGDp8ftUJeNccWXYZ6ofrKjxgnjLufQjFVe6TmdwHdV0+R+EBnRKxbTJFFHrG0821OMmDZC2hgM5oyduRcD8eRba9NoGaymHtzKPlhEDCJFDVQtzsXNjRNoNXrkZCpt8e3yHnOb6au8Li7wAV1Oquih1fHorUB9hmixmtGnRhn4H6J/ZXUQ3c7i+gQcoWewUFi2Y5WN+CRhoE4cr9a8YfPe8eBEDCNuMcfAO93OhVXjqTrGDtBThm2oiYzYFa0TFwEEEr12Mm9Qw1JHryhh32AaZk+XH/LEoiHkTsSsWinGzivNxpIwsNpMybmSBReBPWLeAzesiCeDOVHb4DbSnrrvoNh1vG3OJN22c3AH3iMvrNuJ6DxbN4JfwkaBg+V5ALjq0xDH6MuDuf4tTkDJKOuiJjppOikBljtET1p19iC8SGCukt4xDyxtp0YyFc+KOAe7j07h2LDIG6WorX9VOr97n5rHS6G62B6LgMl/OrrZNL5hj6UKnfBUf8G5pqJ9FnDcGve7pCTcJTlGI/GsQFKhWZ4h85UE9CSTB/PDJ3381k9fPxSuK2Efe6GteEOccD/hfTqxOtEedr1zEvE0COLbz+4QLrTNCwfaSKMeIPstHOVzOaMkSe3TeEipmvPa6ayInB8T7wAZJYRs0bWOtCMJBq85ET1iCKENW7UO+ScRQ49+eOmmWt5QKNeWl2s/qODWYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aK97i60Xlf/8WRQXylcXiaEep6mOcBdCtvG00s2RlqmSHbcOvuhItuPqxEf1Z+/+Q6hoxrbaKqbNugvMp+v92M5ctVH1qyROphsgYfW303VJncNpcZ59HQ5bVbunFG7RO13pomhT0SmckeJAlZItXpPMBphOC1b603MKTV0ql4+0zV9HV2rVKT4ikJPmrPdwyyukgaQeVhXYColA4htIWFizKg2mPUrUJ2QcKE7/etru5idRUqyVrwXxINFw4iI0y87w7a2Hgmhmoxm2s1L1bUvHq9CTvwaNTn7wMAOFwtDTOAMCbKkKODoYTiYWR1M4kHCnhcPPcZq+QIAGc5rhoZ4VZbvXUmUMGLNE2i/qVyHIS0c0EDyHyYBMLx0DbW7p2sy70G8vcRGiexxCzY3CSgU6BgJ4dy4DG3JAktm3BaO4oERcF9kM9wLdor8CArcp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:03:06.2576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d27eb41b-e089-412d-d87c-08de748fbec6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488

Hi,

amdgpu firmware updates.

The following changes since commit 1db833e68de88cd3f7f6612a5552b3e671e36ef0:

  Merge branch 'remove-obsolete-lenovo-fw' into 'main' (2026-02-21 15:51:25 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-02-25

for you to fetch changes up to 3bdab876ee3508f78ec896e5e04a4e8ebdadb309:

  amdgpu: update PSP 13.0.14 firmware (2026-02-25 11:43:31 -0500)

----------------------------------------------------------------
amd-2026-02-25:

Update firmware

From internal git commit:
e093aa5296eb2cb1af74a5214bec1aaf97113225

----------------------------------------------------------------
Alex Deucher (59):
      amdgpu: update GC 9.5.0 firmware
      amdgpu: update PSP 13.0.12 firmware
      amdgpu: update VCN 5.0.1 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update VCN 4.0.3 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SDMA 6.0.2 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update navi10 firmware
      amdgpu: update renoir firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update SMU 14.0.2 firmware
      amdgpu: update navi12 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update SDMA 6.1.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update VPE 6.1.0 firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update SMU 14.0.3 firmware
      amdgpu: update VCN 5.0.0 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update SDMA 6.1.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update green sardine firmware
      amdgpu: update navi14 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update SDMA 6.0.1 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update vangogh firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update SDMA 6.1.2 firmware
      amdgpu: update beige goby firmware
      amdgpu: update GC 11.5.3 firmware
      amdgpu: update PSP 14.0.5 firmware
      amdgpu: update SDMA 6.1.3 firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update PSP 13.0.0 kicker firmware
      amdgpu: update GC 10.3.6 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update GC 9.4.4 firmware
      amdgpu: update PSP 13.0.14 firmware

 amdgpu/beige_goby_ta.bin        | Bin 255232 -> 255232 bytes
 amdgpu/dimgrey_cavefish_smc.bin | Bin 244902 -> 244902 bytes
 amdgpu/dimgrey_cavefish_ta.bin  | Bin 255232 -> 255232 bytes
 amdgpu/gc_10_3_6_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_6_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_6_mec.bin        | Bin 268592 -> 268592 bytes
 amdgpu/gc_10_3_6_mec2.bin       | Bin 268592 -> 268592 bytes
 amdgpu/gc_10_3_6_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_0_me.bin         | Bin 314512 -> 315120 bytes
 amdgpu/gc_11_0_0_mec.bin        | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes_2.bin      | Bin 257344 -> 259568 bytes
 amdgpu/gc_11_0_0_pfp.bin        | Bin 231008 -> 232096 bytes
 amdgpu/gc_11_0_1_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_0_1_mes1.bin       | Bin 232816 -> 235344 bytes
 amdgpu/gc_11_0_1_mes_2.bin      | Bin 257312 -> 257312 bytes
 amdgpu/gc_11_0_1_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_rlc.bin        | Bin 157040 -> 157040 bytes
 amdgpu/gc_11_0_2_me.bin         | Bin 314496 -> 315120 bytes
 amdgpu/gc_11_0_2_mec.bin        | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes_2.bin      | Bin 257344 -> 259568 bytes
 amdgpu/gc_11_0_2_pfp.bin        | Bin 231008 -> 232112 bytes
 amdgpu/gc_11_0_3_me.bin         | Bin 314512 -> 315136 bytes
 amdgpu/gc_11_0_3_mec.bin        | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin       | Bin 218336 -> 220544 bytes
 amdgpu/gc_11_0_3_mes_2.bin      | Bin 257408 -> 259632 bytes
 amdgpu/gc_11_0_3_pfp.bin        | Bin 231008 -> 232112 bytes
 amdgpu/gc_11_0_4_mes1.bin       | Bin 232048 -> 234640 bytes
 amdgpu/gc_11_0_4_mes_2.bin      | Bin 256736 -> 256704 bytes
 amdgpu/gc_11_0_4_rlc.bin        | Bin 159152 -> 159152 bytes
 amdgpu/gc_11_5_0_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_0_mes1.bin       | Bin 235664 -> 238128 bytes
 amdgpu/gc_11_5_0_mes_2.bin      | Bin 257184 -> 257184 bytes
 amdgpu/gc_11_5_0_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_rlc.bin        | Bin 166528 -> 166528 bytes
 amdgpu/gc_11_5_1_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_1_mes1.bin       | Bin 235856 -> 238320 bytes
 amdgpu/gc_11_5_1_mes_2.bin      | Bin 257440 -> 257440 bytes
 amdgpu/gc_11_5_1_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_2_mes1.bin       | Bin 234992 -> 237776 bytes
 amdgpu/gc_11_5_2_mes_2.bin      | Bin 257216 -> 259504 bytes
 amdgpu/gc_11_5_2_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_rlc.bin        | Bin 162096 -> 162096 bytes
 amdgpu/gc_11_5_3_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_3_mes1.bin       | Bin 234992 -> 237776 bytes
 amdgpu/gc_11_5_3_mes_2.bin      | Bin 257216 -> 259504 bytes
 amdgpu/gc_11_5_3_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/gc_12_0_0_me.bin         | Bin 467712 -> 467424 bytes
 amdgpu/gc_12_0_0_mec.bin        | Bin 451552 -> 451552 bytes
 amdgpu/gc_12_0_0_pfp.bin        | Bin 351920 -> 352336 bytes
 amdgpu/gc_12_0_0_uni_mes.bin    | Bin 723648 -> 725216 bytes
 amdgpu/gc_12_0_1_me.bin         | Bin 467712 -> 463712 bytes
 amdgpu/gc_12_0_1_mec.bin        | Bin 451552 -> 451552 bytes
 amdgpu/gc_12_0_1_pfp.bin        | Bin 351920 -> 353712 bytes
 amdgpu/gc_12_0_1_uni_mes.bin    | Bin 723648 -> 725216 bytes
 amdgpu/gc_9_4_3_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/green_sardine_asd.bin    | Bin 205312 -> 205312 bytes
 amdgpu/green_sardine_ce.bin     | Bin 36608 -> 36608 bytes
 amdgpu/green_sardine_me.bin     | Bin 69376 -> 69376 bytes
 amdgpu/green_sardine_mec.bin    | Bin 268224 -> 268224 bytes
 amdgpu/green_sardine_mec2.bin   | Bin 268224 -> 268224 bytes
 amdgpu/green_sardine_pfp.bin    | Bin 85760 -> 85760 bytes
 amdgpu/green_sardine_ta.bin     | Bin 37632 -> 37632 bytes
 amdgpu/navi10_asd.bin           | Bin 205312 -> 205312 bytes
 amdgpu/navi10_ta.bin            | Bin 37632 -> 37632 bytes
 amdgpu/navi12_asd.bin           | Bin 205312 -> 205312 bytes
 amdgpu/navi12_ta.bin            | Bin 37632 -> 37632 bytes
 amdgpu/navi14_asd.bin           | Bin 205312 -> 205312 bytes
 amdgpu/navi14_ce_wks.bin        | Bin 263296 -> 263296 bytes
 amdgpu/navi14_me_wks.bin        | Bin 263424 -> 263424 bytes
 amdgpu/navi14_mec2_wks.bin      | Bin 268592 -> 268160 bytes
 amdgpu/navi14_mec_wks.bin       | Bin 268592 -> 268160 bytes
 amdgpu/navi14_pfp_wks.bin       | Bin 263424 -> 263424 bytes
 amdgpu/navi14_smc.bin           | Bin 264586 -> 264586 bytes
 amdgpu/navi14_ta.bin            | Bin 37632 -> 37632 bytes
 amdgpu/navy_flounder_ta.bin     | Bin 255232 -> 255232 bytes
 amdgpu/psp_13_0_0_ta.bin        | Bin 267520 -> 267520 bytes
 amdgpu/psp_13_0_0_ta_kicker.bin | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin       | Bin 263616 -> 263616 bytes
 amdgpu/psp_13_0_11_ta.bin       | Bin 250880 -> 250880 bytes
 amdgpu/psp_13_0_12_sos.bin      | Bin 439088 -> 439088 bytes
 amdgpu/psp_13_0_14_sos.bin      | Bin 397632 -> 405824 bytes
 amdgpu/psp_13_0_14_ta.bin       | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_4_ta.bin        | Bin 250880 -> 250880 bytes
 amdgpu/psp_13_0_5_asd.bin       | Bin 205312 -> 205312 bytes
 amdgpu/psp_13_0_5_ta.bin        | Bin 242688 -> 242688 bytes
 amdgpu/psp_13_0_6_ta.bin        | Bin 88960 -> 88960 bytes
 amdgpu/psp_13_0_7_sos.bin       | Bin 248496 -> 248496 bytes
 amdgpu/psp_13_0_7_ta.bin        | Bin 242688 -> 242688 bytes
 amdgpu/psp_14_0_0_ta.bin        | Bin 250880 -> 250880 bytes
 amdgpu/psp_14_0_1_ta.bin        | Bin 250880 -> 250880 bytes
 amdgpu/psp_14_0_2_ta.bin        | Bin 270304 -> 270304 bytes
 amdgpu/psp_14_0_3_ta.bin        | Bin 282912 -> 282912 bytes
 amdgpu/psp_14_0_4_ta.bin        | Bin 250880 -> 250880 bytes
 amdgpu/psp_14_0_4_toc.bin       | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_5_ta.bin        | Bin 250880 -> 250880 bytes
 amdgpu/renoir_asd.bin           | Bin 205312 -> 205312 bytes
 amdgpu/renoir_ce.bin            | Bin 9344 -> 9344 bytes
 amdgpu/renoir_me.bin            | Bin 17536 -> 17536 bytes
 amdgpu/renoir_mec.bin           | Bin 268224 -> 268224 bytes
 amdgpu/renoir_mec2.bin          | Bin 268224 -> 268224 bytes
 amdgpu/renoir_pfp.bin           | Bin 21632 -> 21632 bytes
 amdgpu/renoir_ta.bin            | Bin 46080 -> 46080 bytes
 amdgpu/sdma_6_0_1.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_2.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_0.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_1.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_2.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_3.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ce.bin    | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin   | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_mec2.bin  | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_pfp.bin   | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_smc.bin   | Bin 247396 -> 247396 bytes
 amdgpu/sienna_cichlid_ta.bin    | Bin 382720 -> 382720 bytes
 amdgpu/smu_14_0_2.bin           | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin           | Bin 333236 -> 333236 bytes
 amdgpu/vangogh_asd.bin          | Bin 205312 -> 205312 bytes
 amdgpu/vcn_4_0_0.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_2.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_3.bin            | Bin 359696 -> 359696 bytes
 amdgpu/vcn_4_0_4.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_5.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_6.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_6_1.bin          | Bin 403856 -> 395664 bytes
 amdgpu/vcn_5_0_0.bin            | Bin 436048 -> 437712 bytes
 amdgpu/vcn_5_0_1.bin            | Bin 211280 -> 219472 bytes
 amdgpu/vpe_6_1_0.bin            | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_ta.bin       | Bin 242688 -> 242688 bytes
 140 files changed, 0 insertions(+), 0 deletions(-)
