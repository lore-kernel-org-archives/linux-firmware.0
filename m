Return-Path: <SRS0=h7Eg=53=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06580CF58C1
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 17:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9B7AC113D0; Wed, 19 Nov 2025 17:41:37 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010037.outbound.protection.outlook.com [40.93.198.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4AFC6C4CEF5
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 17:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4AFC6C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZdrun+ob0U4UZ0yChCmGrkli1Or7zbe6WJ+uJDbqqg7uwg+1ciU2rIA0T/D5gmf9CviQs8FFz2gBY36qk+3hKYYFAzWEnUfgKRocrbRGgBQX/8S26igIx6Uk0E9p54PmN6/RMHvqLeaZWMsj4i7s7ETPQxL0rxFwNjL48UggrtIpdoVe+B1yeIjFcmnSaEdjwdMG/PCrNm5oiSLCJcLf+Om1u9J1BhcLsgE7VExoQqK3C/I3mEwXutXRed1XjHIM5idK38Avjf0LFJChduzkocT6H5i7zW0Tw2AjLcyHozgfbNGb3+1xxdMq1Cgmi1jqGj2s1EMBmSy+1wNZ7hPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/gLu2LB3dhW+LFCLa2KSpY3k6p6+NxBywVM7h7JcGY=;
 b=Vx2p5vE2k3S11puy6zY8sX2toT/1jFYhfz221x6M7rBhSp6dl6gN5tMqImp87637R4Foc5Y0sno+Eb6TFKCvgVDUpDMbNnmYtuW7ST5Ph0yQGmUSKeSlYx7/6ka33s2UBCI5W/A1zBMIyRcpx3J9TC6RFWBbmbvwIq+aIwaNIM3pq7bjdWkAP1s6dsqbVWteUCIgK75QXOL5Ez1Zbhv+OjvgNqCmVD7iUy/KWnl/7mIG4SBn0r6BWliZv9pIaYII8f8b930LPZwBxm42PFGDFWj4sfjjCShwVADqEXs8fMtniJjA/X1+Vmo+8hVAsJrce4VAKGRrC+suaTHEML2n8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/gLu2LB3dhW+LFCLa2KSpY3k6p6+NxBywVM7h7JcGY=;
 b=Q8ELmC2WD6NThOasy3lYyVbMMae63b2L/F81Kr2K2qFJqUY7Lx+d3yhBkZCwMBUsNSj/9VWP/UwfTbC4FD0V2bWI1Td9Kk5N2ur7KOaiJ+s3UDKHdRikZJGE57ME5SiwU7H9qD3ZglOwMBMZMHzpeHZFPIdvTZ0+XL8yUCEbPio=
Received: from BN9PR03CA0472.namprd03.prod.outlook.com (2603:10b6:408:139::27)
 by DM4PR12MB9070.namprd12.prod.outlook.com (2603:10b6:8:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 17:41:27 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::92) by BN9PR03CA0472.outlook.office365.com
 (2603:10b6:408:139::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 17:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 17:41:27 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 09:41:25 -0800
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware updates
Date: Wed, 19 Nov 2025 12:41:11 -0500
Message-ID: <20251119174111.3670202-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|DM4PR12MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c1e04f-a434-4f8f-038f-08de2792ddb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OMiJGKUP6iup1TVy1BW+1bUtAjHfRoeQ8xq4Tk6GixTweCKe4bmOUWDLq/7f?=
 =?us-ascii?Q?LgnQYKVOBUU65vYQ7t8g4Ni4rQQwRONIS6wpxEaqE/imV+lQibJPLbypKgwf?=
 =?us-ascii?Q?EEkSCT2fnFtyLkKVw5h+pbwrHMt93PaxzT28bl4XOqMHSURMaQFL4YAYv1ck?=
 =?us-ascii?Q?SkgfTdsthahQ8YxMPz3YoEnRluwvBpUFpZTByGCWAsInN6LICMTx3/HWJQV3?=
 =?us-ascii?Q?iGuzeuNvv9bM0G/NErTYqW+Tqo0DlMgd2ozsvswMXvpfcRtUIeb7KbfdppFj?=
 =?us-ascii?Q?MExz5ZZ0zraGE3CHo4UprqX2HuAA7iIdWsTJZnFmzsqLCC4rAIsLtgjNAGjO?=
 =?us-ascii?Q?+0NkOWhbJF8tqSPoMveQwXsNHv+yPFuf+x3/XBF4w9yKv2+t1vre+2BN9mxo?=
 =?us-ascii?Q?QVUCqagGLqoeh1AzNu1EN9AGcaOYw20PohdEYk0Gr5gN6JqdT5J7+9Yvoww6?=
 =?us-ascii?Q?gfPk6UcL2gt2VXOO1zmZhvy0jZzlbazoNUmrasNvEJn7VCrBnemC9qq1SVdq?=
 =?us-ascii?Q?LT5ZBNPK8EPpszLFwE6ayCfRdlN/v7bEJ6+iGByQszv8ZT8SIPXIAGPXoFLd?=
 =?us-ascii?Q?lNyFWunAsZpEy8zZcH7Y1S/yJNmNSltzmz2DQgrfb50hLPnEpA8weF7xSt7K?=
 =?us-ascii?Q?uOsv2c36imaiuxAzxBpRdwBty1FVitf8b9R6mNiCj9zctIYlX50BAHpEBi3h?=
 =?us-ascii?Q?rxssSpEf2HhfprahNmrtNrLz2uyYdkW57+ksVdrXXcCPI9HSoQ4oaTVxSqun?=
 =?us-ascii?Q?WaYgLZYSz+6qvI3XH3y9pucSffwLmbCiqchqgLtiaEQ4HMCO22S1VeRwkC6s?=
 =?us-ascii?Q?58AFj+lRd6rDyYm0FgTnWlK/80JUli8COgPQnHQt4K3Y1VYeD3xaxgXx+A34?=
 =?us-ascii?Q?uVVhO/NcRVHcoce7+McwmlJo0XwCkgFLN1kavHzPGKFITuwwKxVu+HvjmMlj?=
 =?us-ascii?Q?A0906aKyFqXueGRspV4DGbR+2pCjOfdTIMqK2C/OQpvGH7XTjL0cgIHQEfcc?=
 =?us-ascii?Q?Cur9zEz87uep6KG3swDL/DUmgHxQ1rDg19SFB0aGpnWj2hz5zT8hMeYISIb3?=
 =?us-ascii?Q?g9jcTM0Wb7CRnqAvU0jpDjN/Fy3mTbqtjZTXduVufCyl1u4dtycUTmQcjPST?=
 =?us-ascii?Q?4M+NMbY2wDkJy4rA9/Pad0evfHOoYpsBbavhqJYKWtuZ3dc5NyzJTkI1ZcRm?=
 =?us-ascii?Q?llXHtRSoEs/PrR49Q2SDO+TqXpqyX60C6rZ26eSWHV/QhxlF6TGTXbv8TcG3?=
 =?us-ascii?Q?zJbnpmZyy/T4l9Myy7eocykrppFC52RPlI839LxpwBNFBajCcbbh3N+igJRH?=
 =?us-ascii?Q?I5IEd62AtfZe/33cMlSMtBfBvo0j5Fo44KSAQNeAnqYEYYLgulUD3zI0prqU?=
 =?us-ascii?Q?onYqfyuwM/qtDbsNLxY05QpbC4PMAlr8uRJZv8yQTuoa6V9ZuzqynnQEOsYn?=
 =?us-ascii?Q?SvKUKtzZHhJVXn5XYdiIaMUUbkvMJVD9wlrk+3kgfkrqf7JdPas2XDCJc3b5?=
 =?us-ascii?Q?5GKG5RLeYysjzpNbjm/bTyyKVt+SxVFYh0OhirZMQiNhg7vds82iMxc/xQOl?=
 =?us-ascii?Q?wSZahV5Nk8fSFCw6nqM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:41:27.0825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c1e04f-a434-4f8f-038f-08de2792ddb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9070

Hi,

amdgpu firmware updates.

The following changes since commit 213080aee725909038628065516da521dd5a2a4e:

  amdgpu: DMCUB updates for various ASICs (2025-11-07 17:17:43 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-11-19

for you to fetch changes up to 58fbc72faa87a48a18d285da11701e8efe638cd6:

  amdgpu: update vega20 firmware (2025-11-19 12:31:42 -0500)

----------------------------------------------------------------
amd-2025-11-19:

Update amdgpu firmware

----------------------------------------------------------------
Alex Deucher (64):
      amdgpu: add vce1 firmware
      amdgpu: update aldebaran firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update beige goby firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update SDMA 4.4.2 firmware
      amdgpu: update VCN 4.0.3 firmware
      amdgpu: update green sardine firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update GC 11.5.3 firmware
      amdgpu: update PSP 14.0.5 firmware
      amdgpu: update GC 9.4.4 firmware
      amdgpu: update PSP 13.0.14 firmware
      amdgpu: update GC 9.5.0 firmware
      amdgpu: update PSP 13.0.12 firmware
      amdgpu: update VCN 5.0.1 firmware
      amdgpu: update navi10 firmware
      amdgpu: update navi12 firmware
      amdgpu: update navi14 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update navy flounder firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update SMU 13.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update PSP 13.0.0 kicker firmware
      amdgpu: update smu 13.0.0 kicker firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SDMA 6.0.3 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update smu 13.0.7 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update SMU 14.0.2 firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update SMU 14.0.3 firmware
      amdgpu: update VCN 5.0.0 firmware
      amdgpu: update GC 10.3.6 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update renoir firmware
      amdgpu: update vangogh firmware
      amdgpu: update vega10 firmware
      amdgpu: update vega12 firmware
      amdgpu: update vega20 firmware

 WHENCE                           |   1 +
 amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sos.bin         | Bin 446208 -> 446208 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_smc.bin        | Bin 244934 -> 244934 bytes
 amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
 amdgpu/beige_goby_ta.bin         | Bin 251136 -> 255232 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 580112 -> 580112 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 251136 -> 255232 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580112 -> 580112 bytes
 amdgpu/gc_10_3_6_rlc.bin         | Bin 177104 -> 177104 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 257344 -> 257344 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_0_1_mes1.bin        | Bin 232816 -> 232784 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 257312 -> 257376 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_rlc.bin         | Bin 157040 -> 157040 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 257344 -> 257344 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 257408 -> 257408 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_0_4_mes1.bin        | Bin 232080 -> 232048 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 256704 -> 256736 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 257184 -> 257216 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 257440 -> 257504 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 256960 -> 257216 bytes
 amdgpu/gc_11_5_3_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_3_mes_2.bin       | Bin 256960 -> 257216 bytes
 amdgpu/gc_11_5_3_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_rlc.bin         | Bin 162064 -> 162064 bytes
 amdgpu/gc_12_0_0_me.bin          | Bin 467488 -> 467712 bytes
 amdgpu/gc_12_0_0_mec.bin         | Bin 451552 -> 451552 bytes
 amdgpu/gc_12_0_0_pfp.bin         | Bin 352048 -> 351920 bytes
 amdgpu/gc_12_0_0_uni_mes.bin     | Bin 723328 -> 723648 bytes
 amdgpu/gc_12_0_1_me.bin          | Bin 467488 -> 467712 bytes
 amdgpu/gc_12_0_1_mec.bin         | Bin 451552 -> 451552 bytes
 amdgpu/gc_12_0_1_pfp.bin         | Bin 352048 -> 351920 bytes
 amdgpu/gc_12_0_1_uni_mes.bin     | Bin 723328 -> 723648 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/green_sardine_asd.bin     | Bin 201216 -> 205312 bytes
 amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
 amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
 amdgpu/green_sardine_mec.bin     | Bin 268064 -> 268224 bytes
 amdgpu/green_sardine_mec2.bin    | Bin 268064 -> 268224 bytes
 amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
 amdgpu/green_sardine_ta.bin      | Bin 33536 -> 37632 bytes
 amdgpu/green_sardine_vcn.bin     | Bin 404288 -> 404544 bytes
 amdgpu/navi10_asd.bin            | Bin 201216 -> 205312 bytes
 amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi10_vcn.bin            | Bin 404288 -> 404544 bytes
 amdgpu/navi12_asd.bin            | Bin 201216 -> 205312 bytes
 amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi12_vcn.bin            | Bin 404288 -> 404544 bytes
 amdgpu/navi14_asd.bin            | Bin 201216 -> 205312 bytes
 amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi14_vcn.bin            | Bin 404288 -> 404544 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_smc.bin     | Bin 244902 -> 244902 bytes
 amdgpu/navy_flounder_sos.bin     | Bin 222704 -> 218608 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 251136 -> 255232 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 580112 -> 580112 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 263424 -> 267520 bytes
 amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 259520 -> 263616 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 246784 -> 250880 bytes
 amdgpu/psp_13_0_12_sos.bin       | Bin 410416 -> 439088 bytes
 amdgpu/psp_13_0_14_sos.bin       | Bin 397632 -> 397632 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 246784 -> 250880 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 201216 -> 205312 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 238592 -> 242688 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 238592 -> 242688 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 246784 -> 250880 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 246784 -> 250880 bytes
 amdgpu/psp_14_0_2_ta.bin         | Bin 266208 -> 270304 bytes
 amdgpu/psp_14_0_3_ta.bin         | Bin 278816 -> 282912 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 246784 -> 250880 bytes
 amdgpu/psp_14_0_5_ta.bin         | Bin 246784 -> 250880 bytes
 amdgpu/psp_14_0_5_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/renoir_asd.bin            | Bin 201216 -> 205312 bytes
 amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/renoir_mec.bin            | Bin 268064 -> 268224 bytes
 amdgpu/renoir_mec2.bin           | Bin 268064 -> 268224 bytes
 amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/renoir_ta.bin             | Bin 46080 -> 46080 bytes
 amdgpu/renoir_vcn.bin            | Bin 404288 -> 404544 bytes
 amdgpu/sdma_4_4_2.bin            | Bin 34304 -> 34304 bytes
 amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 378624 -> 382720 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 580112 -> 580112 bytes
 amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_0_kicker.bin     | Bin 261888 -> 261888 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
 amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
 amdgpu/vangogh_asd.bin           | Bin 201216 -> 205312 bytes
 amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin           | Bin 268160 -> 268160 bytes
 amdgpu/vangogh_mec2.bin          | Bin 268160 -> 268160 bytes
 amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vce_1_0_0.bin             | Bin 0 -> 48680 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 572368 -> 572368 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 403856 -> 403856 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 403856 -> 403856 bytes
 amdgpu/vcn_4_0_3.bin             | Bin 359696 -> 359696 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 403856 -> 403856 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 403856 bytes
 amdgpu/vcn_5_0_0.bin             | Bin 439824 -> 436048 bytes
 amdgpu/vcn_5_0_1.bin             | Bin 211280 -> 211280 bytes
 amdgpu/vega10_asd.bin            | Bin 201216 -> 205312 bytes
 amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega10_ip_discovery.bin   | Bin 656 -> 656 bytes
 amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega10_mec.bin            | Bin 268224 -> 268224 bytes
 amdgpu/vega10_mec2.bin           | Bin 268224 -> 268224 bytes
 amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega12_asd.bin            | Bin 201216 -> 205312 bytes
 amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega12_ip_discovery.bin   | Bin 656 -> 656 bytes
 amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega12_mec.bin            | Bin 268224 -> 268224 bytes
 amdgpu/vega12_mec2.bin           | Bin 268224 -> 268224 bytes
 amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega20_asd.bin            | Bin 201216 -> 205312 bytes
 amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega20_ip_discovery.bin   | Bin 564 -> 564 bytes
 amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega20_mec.bin            | Bin 268224 -> 268224 bytes
 amdgpu/vega20_mec2.bin           | Bin 268224 -> 268224 bytes
 amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 238592 -> 242688 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 572368 bytes
 168 files changed, 1 insertion(+)
 create mode 100644 amdgpu/vce_1_0_0.bin
