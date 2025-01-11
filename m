Return-Path: <SRS0=JB7E=UD=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F705E77188
	for <linux-firmware@archiver.kernel.org>; Sat, 11 Jan 2025 01:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74270C4CEDF; Sat, 11 Jan 2025 01:06:48 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFF84C4CED6
	for <linux-firmware@kernel.org>; Sat, 11 Jan 2025 01:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFF84C4CED6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0T2JVhp9BZNXMyN+5Ge2Yoek0A2o16bD6J8VO1GFrURcWtjhikiayISCURn3/8u8pwhkrjEy3rHuUcRsw/Cc8Z6+X0mOSx43Iddf55SQo2gI0ZqKxFr7qvYj7zIOl9AkFaxusSHPRbtMMUycvdAw5v1OoAdTfhdviLh7vk8dC9BUA39ZwhdqT3MNB6xnvLgwFpywJ3FT6dhdqqJ5dSQFjjnzCTbVPua6+6Im8ZOvF+gCi87jZmtXyJzXHuyeHXCaYlm95eIVZj5AEV3AH9azOzQIn84bl2Opuk8rYzJIRMUT0fxNaRM/Hen6REPmswUvnFjpi3qE/S2nlR9cAW8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYQSVXxMk7HAOF5nmAJHnLqF7LzBIOo8uhvAtkMW0cE=;
 b=TrdNF3M6fWL0z6PIrazqmCDMngYqxamlS8/JdGFros60qEg8v22nim0M8a0B5NPjLqEMTbkSiN2HH1OGoCX1ZyBne0DsYjC/iG+mHB/tXEF/TLQCNqWzPKRlpgUskDUgVAtGqJjTbQnuX7XoFRYoTiaZS5kUR0+Kf/xABPVSgpYGtNFipmYMhKWEPk2G0fQBOE+ARR5gqvcvaqVs0HWt9ESGL5gvGQyNYIilXIHBwY1dZbHwoh6ubcygkWSSpdcK0taHZU7yrWOeml1Tk13mrRjV6c3v0f9RPMAA7uB53TlcHlTMIJCH7nt/hsv1jKASze246CA2q6JL5azLXpEMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYQSVXxMk7HAOF5nmAJHnLqF7LzBIOo8uhvAtkMW0cE=;
 b=fvEC4IaF26PUT1QpED3PPFD5H43capJLzftpp9RrZwUz1KIXBvuK1VgvJmCfeU2GBtkEHb1roHwAdueqFuszfqC2IePtfq+P5UWipZeObl0ulhbVFEeskHE8J3F7qX0j4pRTD9MaMmPw3gcroqecLQuEnaF6Z2w/OkowYg8fkqU=
Received: from BL6PEPF0001640D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:14) by PH7PR12MB7187.namprd12.prod.outlook.com
 (2603:10b6:510:203::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Sat, 11 Jan
 2025 01:06:42 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2a01:111:f403:c803::) by BL6PEPF0001640D.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.15 via Frontend Transport; Sat,
 11 Jan 2025 01:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Sat, 11 Jan 2025 01:06:41 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 19:06:40 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware updates
Date: Fri, 10 Jan 2025 20:06:24 -0500
Message-ID: <20250111010624.3955290-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|PH7PR12MB7187:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bb24ba-2eae-41c1-1975-08dd31dc358a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FnuO6QZZXuVm+bqEAdzZiXnjpdNK6kF9L3qWO8pJW+6rvsJZglYpgcBmhddf?=
 =?us-ascii?Q?DAQfJ2YDnbX7eqQDY48OLKOMnqSTRm4Xv+0+ZfFUiVGXewJhqTiigVPQjlxM?=
 =?us-ascii?Q?2yeKsmvkXQHXKpSWUZERXn6+uPKHwgI+gBlbKqulIZzCJaDocuXGsxz766QR?=
 =?us-ascii?Q?aiDuSjHzVquC6GKBlRmOxcQlc8Hjwa7g1Xb+7WL+ILMyd0ZdVaRDeto2BVqZ?=
 =?us-ascii?Q?aQcMZglNPg7qSI34fPG3V00qATffYB1P8NEhDRXc73MYgeeqyl0w97zmvqTJ?=
 =?us-ascii?Q?SNotFw6biP6NRcPndcWEzvpsKGF86i96ZCH0/m3gPBfFY1viNTBJ/cDEVAdq?=
 =?us-ascii?Q?LGsjNHi6M074NwTxfUe+bEleF+UCyY9IT8VsNzJycSKeN+Mozu8i/FeOvcs0?=
 =?us-ascii?Q?HbgogUvivliyiCUWnayUtGyhVhm8wPJtEXSXEY8IC4fr+hOlv8bhmEOsQC7r?=
 =?us-ascii?Q?L0wrAxFy+U9yErlytA3gelfGuangBbSGiaZ4Nb5ivFSSZi0h//KJFMZKmNEx?=
 =?us-ascii?Q?wPwUOCf1VFGiaN6OH+3X0bMtgnLTAo+TUwjUm8KToynGrRPyXNTdkpQCdaIm?=
 =?us-ascii?Q?Bw56mSaQrUgjTSnEtJ1P+PnEAT2zxatLjVM6YiIOap+WbCm5ZHY7B9q7kXH4?=
 =?us-ascii?Q?uGdk+P8ySF1Pbk+w5kG1ClFm7KN5GUpRzdZ2UpqNXeqBZyLmEsxqOY3az6Pd?=
 =?us-ascii?Q?D9qoLtySz6i9D6rWBWKIGYUuXRwnVmA8aeZTApwTxZqkIpEqQT/dgrwRYBkH?=
 =?us-ascii?Q?h5UK8iMmuEszvWOa4ndp03VZYLpSIFukj6aNT5fad2cKGkm4RJzb0BH8SGcC?=
 =?us-ascii?Q?6q37tv2CGC6DVPcEw4TZBSCTolnd4uFmH0BxJe3XHnYx6njQmIt1j5wgSW6g?=
 =?us-ascii?Q?u3yxWuF2h/fPRoh968GIRT3pUDOMxIqgV9Y3ZViPjTYAJvLgvgQjEjKA8qCM?=
 =?us-ascii?Q?2yqpUGXEJpA/VGTu7/B/H0NhdqS7DfwN7hs7Rm9xCkRZX90ErJH7FXbaudpZ?=
 =?us-ascii?Q?ZMufCK/IWIwmiIrhS8Xr0u4fUlNy6kHCliGjAJlpqmgEksoZqDJcsZgR6XZx?=
 =?us-ascii?Q?s4p90i9Hgxp9DPusPWSam3vajuSQq0ejEWw7xFxRgLrgpULKQGnWN9NSF1MD?=
 =?us-ascii?Q?1VGMIViq5QTx7dzUL0zcsByd23lNOhU6KzTO2tY76jvVIiuV9Pc0F/xS+btS?=
 =?us-ascii?Q?rxixpPMu23cqgX0lvH45CREDF9+6R9iPCsuiYo5PshHGyiYSxhISTaJ27ikM?=
 =?us-ascii?Q?vDmZaZRavWpg3EZ7ieZEOULW+HIVH3f8d31qfkgHRZ67tsCfC2VPoaYnGi+x?=
 =?us-ascii?Q?N5VlKr4jktgQJa4Vh4u4jHvJf5k8UVbt3i2OdI2L6hUWDPOT4yzf8AmZSszF?=
 =?us-ascii?Q?VVdEYaT0JpH3mDT9Dlpal6APlb5hutJJYXFJ5q0SI46sQESZn1XR/unnCC6b?=
 =?us-ascii?Q?ymFo10FguqvTvkUawPJrR67zGQguNSnkDQ2UQjxW+Dki3avq8ZVwmE9H1Jav?=
 =?us-ascii?Q?X5vtNUe9yo2vLf4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:tr;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2025 01:06:41.6662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bb24ba-2eae-41c1-1975-08dd31dc358a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7187

Hi,

Updated amdgpu firmwares.

The following changes since commit 8c576df27fbe8280c338cf23a8a03a3e74503647:

  amdgpu: revert VCN 3.1.2 firmware (2025-01-06 16:06:38 -0500)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-01-10

for you to fetch changes up to d193f9af9edd400718d4f68b5d5448cd3ee41130:

  amdgpu: update sdma 6.0.3 firmware (2025-01-10 16:13:02 -0500)

----------------------------------------------------------------
Update amdgpu firmware

From internal git commit:
6f4480f10a85ad02d395918b128266cc216469b1

----------------------------------------------------------------
Alex Deucher (49):
      amdgpu: update aldebaran firmware
      amdgpu: update navi10 firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update psp 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update gc 9.4.3 firmware
      amdgpu: update psp 13.0.6 firmware
      amdgpu: update sdma 4.4.2 firmware
      amdgpu: update vcn 4.0.3 firmware
      amdgpu: update navi12 firmware
      amdgpu: update gc 12.0.0 firmware
      amdgpu: update psp 14.0.2 firmware
      amdgpu: update smu 14.0.2 firmware
      amdgpu: update renoir firmware
      amdgpu: update arcturus firmware
      amdgpu: update navi14 firmware
      amdgpu: update gc 12.0.1 firmware
      amdgpu: update psp 14.0.3 firmware
      amdgpu: update smu 14.0.3 firmware
      amdgpu: update vcn 5.0.0 firmware
      amdgpu: update gc 11.5.0 firmware
      amdgpu: update vcn 4.0.5 firmware
      amdgpu: update psp 14.0.1 firmware
      amdgpu: update vcn 4.0.6 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update gc 11.0.1 firmware
      amdgpu: update psp 13.0.4 firmware
      amdgpu: update vcn 4.0.2 firmware
      amdgpu: update gc 11.0.4 firmware
      amdgpu: update psp 13.0.11 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update vangogh firmware
      amdgpu: update beige goby firmware
      amdgpu: update picasso firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update psp 13.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: update vega10 firmware
      amdgpu: update vega12 firmware
      amdgpu: update vega20 firmware
      amdgpu: update psp 13.0.5 firmware
      amdgpu: update gc 9.4.4 firmware
      amdgpu: update psp 13.0.14 firmware
      amdgpu: update sdma 4.4.5 firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update psp 13.0.10 firmware
      amdgpu: update sdma 6.0.3 firmware

 amdgpu/aldebaran_mec.bin       | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin      | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_rlc.bin       | Bin 46084 -> 46060 bytes
 amdgpu/aldebaran_sjt_mec.bin   | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin  | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_smc.bin       | Bin 242688 -> 242688 bytes
 amdgpu/arcturus_mec.bin        | Bin 268560 -> 268576 bytes
 amdgpu/arcturus_mec2.bin       | Bin 268560 -> 268576 bytes
 amdgpu/arcturus_sos.bin        | Bin 199248 -> 199248 bytes
 amdgpu/beige_goby_ta.bin       | Bin 238848 -> 242944 bytes
 amdgpu/beige_goby_vcn.bin      | Bin 579184 -> 579440 bytes
 amdgpu/dimgrey_cavefish_ta.bin | Bin 238848 -> 242944 bytes
 amdgpu/gc_11_0_0_me.bin        | Bin 314016 -> 314528 bytes
 amdgpu/gc_11_0_0_mec.bin       | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin      | Bin 217408 -> 217408 bytes
 amdgpu/gc_11_0_0_mes_2.bin     | Bin 256528 -> 256528 bytes
 amdgpu/gc_11_0_0_pfp.bin       | Bin 230192 -> 230480 bytes
 amdgpu/gc_11_0_1_mes_2.bin     | Bin 256064 -> 256064 bytes
 amdgpu/gc_11_0_2_me.bin        | Bin 314016 -> 314512 bytes
 amdgpu/gc_11_0_2_mec.bin       | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin      | Bin 217760 -> 218400 bytes
 amdgpu/gc_11_0_2_mes_2.bin     | Bin 256528 -> 256528 bytes
 amdgpu/gc_11_0_2_pfp.bin       | Bin 230192 -> 230480 bytes
 amdgpu/gc_11_0_3_me.bin        | Bin 314032 -> 314528 bytes
 amdgpu/gc_11_0_3_mec.bin       | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin      | Bin 217472 -> 218144 bytes
 amdgpu/gc_11_0_3_mes_2.bin     | Bin 256592 -> 256592 bytes
 amdgpu/gc_11_0_3_pfp.bin       | Bin 230192 -> 230480 bytes
 amdgpu/gc_11_0_4_mes_2.bin     | Bin 256064 -> 256064 bytes
 amdgpu/gc_11_5_0_mes_2.bin     | Bin 255008 -> 256160 bytes
 amdgpu/gc_12_0_0_imu.bin       | Bin 132352 -> 132352 bytes
 amdgpu/gc_12_0_0_me.bin        | Bin 403984 -> 410688 bytes
 amdgpu/gc_12_0_0_mec.bin       | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_0_pfp.bin       | Bin 349264 -> 350864 bytes
 amdgpu/gc_12_0_0_rlc.bin       | Bin 150704 -> 150704 bytes
 amdgpu/gc_12_0_0_uni_mes.bin   | Bin 711264 -> 709920 bytes
 amdgpu/gc_12_0_1_me.bin        | Bin 404048 -> 410688 bytes
 amdgpu/gc_12_0_1_mec.bin       | Bin 443360 -> 447456 bytes
 amdgpu/gc_12_0_1_pfp.bin       | Bin 348672 -> 350864 bytes
 amdgpu/gc_12_0_1_rlc.bin       | Bin 150848 -> 150848 bytes
 amdgpu/gc_12_0_1_uni_mes.bin   | Bin 711264 -> 709920 bytes
 amdgpu/gc_9_4_3_mec.bin        | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_rlc.bin        | Bin 48076 -> 38708 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin    | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin        | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin    | Bin 268736 -> 268736 bytes
 amdgpu/navi10_asd.bin          | Bin 193024 -> 197120 bytes
 amdgpu/navi12_asd.bin          | Bin 193024 -> 197120 bytes
 amdgpu/navi14_asd.bin          | Bin 193024 -> 197120 bytes
 amdgpu/navy_flounder_ta.bin    | Bin 238848 -> 242944 bytes
 amdgpu/picasso_asd.bin         | Bin 193024 -> 197120 bytes
 amdgpu/psp_13_0_0_ta.bin       | Bin 251136 -> 255232 bytes
 amdgpu/psp_13_0_10_ta.bin      | Bin 247232 -> 251328 bytes
 amdgpu/psp_13_0_11_ta.bin      | Bin 234496 -> 238592 bytes
 amdgpu/psp_13_0_14_sos.bin     | Bin 389408 -> 389408 bytes
 amdgpu/psp_13_0_4_ta.bin       | Bin 234496 -> 238592 bytes
 amdgpu/psp_13_0_5_asd.bin      | Bin 193024 -> 197120 bytes
 amdgpu/psp_13_0_5_ta.bin       | Bin 226304 -> 230400 bytes
 amdgpu/psp_13_0_6_sos.bin      | Bin 778816 -> 782912 bytes
 amdgpu/psp_13_0_7_ta.bin       | Bin 226304 -> 230400 bytes
 amdgpu/psp_14_0_1_ta.bin       | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_2_sos.bin      | Bin 417120 -> 417120 bytes
 amdgpu/psp_14_0_2_ta.bin       | Bin 253920 -> 258016 bytes
 amdgpu/psp_14_0_3_sos.bin      | Bin 417120 -> 431536 bytes
 amdgpu/psp_14_0_3_ta.bin       | Bin 253920 -> 270624 bytes
 amdgpu/renoir_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/sdma_4_4_2.bin          | Bin 34304 -> 34304 bytes
 amdgpu/sdma_4_4_5.bin          | Bin 34304 -> 34304 bytes
 amdgpu/sdma_6_0_3.bin          | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ta.bin   | Bin 366336 -> 370432 bytes
 amdgpu/smu_14_0_2.bin          | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin          | Bin 333236 -> 333236 bytes
 amdgpu/vangogh_asd.bin         | Bin 193024 -> 197120 bytes
 amdgpu/vcn_4_0_0.bin           | Bin 393200 -> 395632 bytes
 amdgpu/vcn_4_0_2.bin           | Bin 393200 -> 395632 bytes
 amdgpu/vcn_4_0_3.bin           | Bin 389456 -> 359760 bytes
 amdgpu/vcn_4_0_4.bin           | Bin 393200 -> 395632 bytes
 amdgpu/vcn_4_0_5.bin           | Bin 392432 -> 395632 bytes
 amdgpu/vcn_4_0_6.bin           | Bin 392432 -> 393456 bytes
 amdgpu/vcn_4_0_6_1.bin         | Bin 392432 -> 393456 bytes
 amdgpu/vcn_5_0_0.bin           | Bin 438608 -> 438288 bytes
 amdgpu/vega10_asd.bin          | Bin 193024 -> 197120 bytes
 amdgpu/vega12_asd.bin          | Bin 193024 -> 197120 bytes
 amdgpu/vega20_asd.bin          | Bin 193024 -> 197120 bytes
 amdgpu/yellow_carp_ta.bin      | Bin 226304 -> 230400 bytes
 85 files changed, 0 insertions(+), 0 deletions(-)
