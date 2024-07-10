Return-Path: <SRS0=d1Ng=OK=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4A2C3DA42
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jul 2024 21:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16122C4AF09; Wed, 10 Jul 2024 21:30:43 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86D5BC32781;
	Wed, 10 Jul 2024 21:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86D5BC32781
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az4+9SN+4RjSzvYDePvnmPzZqLUoU3wwfR5lNlCphfobm0mwneGvmx7Q0kpdo8CG54+P5JWAmG5dnS8VfFfxrDJgpfueZRso7T7pTq+WrfZiVGus55wPiyrFT/QDZ7mBhiqSzxAWOeTRtfcPMxFE8mNBGSQFV6R6BCPzK0Twh5QzO4I3gauHiljCFdBHXEDTygtS69vdAAoVvVXnGWlomZQbdpXsqpHsWpaw0xDUp749Q0Utp3bTO9KSLRH9/f8voGg4Gd3+XSdAtTwwujxXWtNvWi/5b5CrmxcUrXe0K9V8EkcRbJ/XP3kLNUTDUp8YWK05HNAFyfKNM3OsRMl87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO4SS0zFBFW9DA10irDHhESLKLnR7NucQg4UrtI/prk=;
 b=NjItZRx7w6IkSpxnRSoeci9YY+YbzlJh45LHd5lhhqiWfADJEW3L3ES82h4237Xvp7ePjvfhxNzg5AaS7ZMFlQvPFQTGLTJIPMMGNrfkJMGK5Q24zcjyB0t76GGluhNDDz6T4T/xZxqwFw2VDFPfRHczzAYCpswCX6G55OLQ/6f9TFVqlf+tU6ozOGFoS6W2/XyJfBt4A4chR7OiLTvdTqQyQvnrXbbS3y2u50dMC/Im4f3Rmw9P2/Sl/enksypDhejyC9EW8sBqm5j9Cz3c7Lan16UaEOzKtLon1Kyph4sWS08GKzvuCvw0ZfQHiZhTAkL7YUZlZSPPp+0fk0ZVBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO4SS0zFBFW9DA10irDHhESLKLnR7NucQg4UrtI/prk=;
 b=oKMe3zT+KU9LP3zge5L7doz7+d9iBUaxEExHCNsTM5GtCTBGjqlHc9jC/xCgK83wAivc0S4yEImdmx4LQ0uZJO4met1bdlSHj6lm6RXK56LfUWUHGphPRv1j25LgJQSpmmOWMLZiDXD2N2ivB2UsR0ibWNTljAXwMEh+FpDLi80=
Received: from DS7PR03CA0184.namprd03.prod.outlook.com (2603:10b6:5:3b6::9) by
 CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Wed, 10 Jul 2024 21:30:38 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::19) by DS7PR03CA0184.outlook.office365.com
 (2603:10b6:5:3b6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Wed, 10 Jul 2024 21:30:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Wed, 10 Jul 2024 21:30:38 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 16:30:36 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>,
	<jwboyer@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu amd-2024-07-10
Date: Wed, 10 Jul 2024 17:30:16 -0400
Message-ID: <20240710213016.3908123-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a150ee-40ff-4034-5209-08dca1278ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8VtlKh2ng5s/P1D2cJw5ptQDfjf1WPsO2eT484T1zPOm/NI3GrOX4r2QDZhJ?=
 =?us-ascii?Q?KDV8xkPwtehsVTPtq91Lip+HdqTA3xTd6Yug6zWNJxvH+3BD/cC6AJpiripE?=
 =?us-ascii?Q?YH4l4lKRDnAsoDvm8yL3eeyfMn1iYsae9TYE0NT2YlTuFF9qUVTHCtbPv2xI?=
 =?us-ascii?Q?1rIr2XyYx0kbomI0Xo4/bFW5sYofV9QG4uEri7t8txrZ6Vw0Q4XrRluaLFA8?=
 =?us-ascii?Q?An6Qo/PdAnKNxi0HZXq3+h94YGgTBsySXIkQLhXWNYhSKjXt2TC5AXxNrXjE?=
 =?us-ascii?Q?cxOLnVInvFXdYSM1TSy3Pq8HU5OkRi69KoUTmWCvQYkl2D/9/GiOfJ7Qs2UW?=
 =?us-ascii?Q?GKvz2LtCB4ysMF8y32FqF5qR+Qjwcv9Mmr7JyeJjpo+aIIz3Es6jXqlpNcU/?=
 =?us-ascii?Q?BA/w2PeQhLGeiH8R8E67+aOVbX2IazkumFlKaM3cSEKBd4QKCtOPng+UqzTm?=
 =?us-ascii?Q?3PHG0trmbG1b+0MJGmtdUabvY4n4LRw7rxag3ez89j8wYFW+d9CgFk2A7mfG?=
 =?us-ascii?Q?qwHjkW7EB90BHVw4+/Gkfh3GZRr9oof9/hgesR3bAemGYNon5lA1ZNvGJe3T?=
 =?us-ascii?Q?Naqu8YgwLBr4UyM1ihj1RlOzvl3R2+nNfJv+WBRThWQM/ztw3TXGX0bRc2tg?=
 =?us-ascii?Q?KCW6cVr9yD8OXWf/GL9EcDcfcmcyMEcZjuslkgqrmFOF8s9WrBUoWp/ndY6B?=
 =?us-ascii?Q?K4G5f0lSocnDqt+VfGP1TFZZaiWjHSLX/pchs/5yywLFtJjyAs2zRdjCPazm?=
 =?us-ascii?Q?Kl/V0wkIDpfl5Y0p7S/ouvWP7H8WSKjHt0WwPA24J/fDwpi0yCDnWEm+0PT2?=
 =?us-ascii?Q?+x/d7aD4e8fm/au3t0ox/HWDTfqXkjAn1IL0bPbB+OjXs/mNMxwGfsx85nvo?=
 =?us-ascii?Q?UbH5XArYytvunWzyIgk2i+5r/Uapch2RlNYXqhaFd6dXgedBchZGORxroIzy?=
 =?us-ascii?Q?JvEPM5bCWNbUgbEiA3ZrGMrOvx5tuKiCu4in1+Tlo3kOZcp70NvOrvFmLy2B?=
 =?us-ascii?Q?OsOAMy9467OLtbhkaQvvKbVqzh5Xe+feFGrBXJFoejI2cu5AVIFoaPJgowAS?=
 =?us-ascii?Q?MyIlTwUEPxRmMvtIoaHy5RCP/+iW7oabip7tk52xOH7ZxxmDTTmjn9bmZWCE?=
 =?us-ascii?Q?v9vjhK1kXYHhVXo1QASa96JUlq5EdC3hXEY9LKbtAp/AcWyY2zxOuqi1VlzX?=
 =?us-ascii?Q?4Oj8vGgmcKDRwegcH84bZeAX+qSTYYjEyc68y+Ma5cxmie10UL1fyM0VMgI3?=
 =?us-ascii?Q?2d1mNpQzTZBflWtWpIK0WNvqNv0DMmnOc0PwKbMTiL79EZMz578PCA8WrDFD?=
 =?us-ascii?Q?m7N4ouuZXc8ennYReEYOe6K2Ulgn+fS+N9n18yKBJrz9fxqN8qtzSK5RJdWt?=
 =?us-ascii?Q?tTTv0xBkOCpo5qAzvXXU+QQEqh2o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 21:30:38.3217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a150ee-40ff-4034-5209-08dca1278ae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243

Hi,

Updated firmware for AMD GPUs.

The following changes since commit 6ae2bb3fcc9c093efa62cc7c27357ff7fc3d83e4:

  amdgpu: update DMCUB to v0.0.224.0 for Various AMDGPU Asics (2024-06-28 15:23:55 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-07-10

for you to fetch changes up to 309310cb422ea8ebe5776b7b7256cdf304df7c0e:

  amdgpu: update raven firmware (2024-07-10 17:14:31 -0400)

----------------------------------------------------------------
amd-2024-07-10:

Updated amdgpu firmware.

----------------------------------------------------------------
Alex Deucher (50):
      amdgpu: update aldebaran firmware
      amdgpu: update raven2 firmware
      amdgpu: update navi10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SDMA 6.0.2 firmware
      amdgpu: update SMU 13.0.7 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update navi12 firmware
      amdgpu: update renoir firmware
      amdgpu: update navi14 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update SDMA 6.1.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update SDMA 6.1.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update VPE 6.1.1 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update SDMA 6.0.1 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update green sardine firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update vangogh firmware
      amdgpu: update beige goby firmware
      amdgpu: update picasso firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update SDMA 6.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update vega10 firmware
      amdgpu: update vega12 firmware
      amdgpu: update PSP 13.0.8 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update vega20 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SDMA 6.0.3 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update raven firmware

 amdgpu/aldebaran_sos.bin       | Bin 442080 -> 442080 bytes
 amdgpu/beige_goby_sos.bin      | Bin 205984 -> 205984 bytes
 amdgpu/beige_goby_ta.bin       | Bin 238848 -> 238848 bytes
 amdgpu/dimgrey_cavefish_ta.bin | Bin 238848 -> 238848 bytes
 amdgpu/gc_11_0_0_me.bin        | Bin 310768 -> 310784 bytes
 amdgpu/gc_11_0_0_mec.bin       | Bin 407072 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin      | Bin 217088 -> 217184 bytes
 amdgpu/gc_11_0_0_mes_2.bin     | Bin 251552 -> 253360 bytes
 amdgpu/gc_11_0_0_pfp.bin       | Bin 229296 -> 229328 bytes
 amdgpu/gc_11_0_0_rlc.bin       | Bin 185248 -> 185376 bytes
 amdgpu/gc_11_0_0_rlc_1.bin     | Bin 185248 -> 185248 bytes
 amdgpu/gc_11_0_1_mes_2.bin     | Bin 251200 -> 252800 bytes
 amdgpu/gc_11_0_1_rlc.bin       | Bin 160368 -> 157040 bytes
 amdgpu/gc_11_0_2_me.bin        | Bin 310768 -> 310784 bytes
 amdgpu/gc_11_0_2_mec.bin       | Bin 407072 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin      | Bin 217440 -> 217536 bytes
 amdgpu/gc_11_0_2_mes_2.bin     | Bin 251648 -> 253264 bytes
 amdgpu/gc_11_0_2_pfp.bin       | Bin 229296 -> 229312 bytes
 amdgpu/gc_11_0_2_rlc.bin       | Bin 178720 -> 178720 bytes
 amdgpu/gc_11_0_3_imu.bin       | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_3_me.bin        | Bin 310784 -> 310800 bytes
 amdgpu/gc_11_0_3_mec.bin       | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin      | Bin 217152 -> 217280 bytes
 amdgpu/gc_11_0_3_mes_2.bin     | Bin 251616 -> 253424 bytes
 amdgpu/gc_11_0_3_pfp.bin       | Bin 229280 -> 229312 bytes
 amdgpu/gc_11_0_3_rlc.bin       | Bin 178976 -> 179104 bytes
 amdgpu/gc_11_0_4_mes_2.bin     | Bin 250528 -> 252928 bytes
 amdgpu/gc_11_5_0_imu.bin       | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_0_mes1.bin      | Bin 233744 -> 233776 bytes
 amdgpu/gc_11_5_0_mes_2.bin     | Bin 251104 -> 252992 bytes
 amdgpu/gc_11_5_0_rlc.bin       | Bin 166528 -> 166528 bytes
 amdgpu/gc_11_5_1_imu.bin       | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_1_mes1.bin      | Bin 233840 -> 233936 bytes
 amdgpu/gc_11_5_1_mes_2.bin     | Bin 250784 -> 253280 bytes
 amdgpu/gc_11_5_1_rlc.bin       | Bin 160912 -> 161040 bytes
 amdgpu/gc_9_4_3_mec.bin        | Bin 269200 -> 269200 bytes
 amdgpu/gc_9_4_3_rlc.bin        | Bin 48076 -> 48076 bytes
 amdgpu/green_sardine_asd.bin   | Bin 193024 -> 193024 bytes
 amdgpu/green_sardine_ta.bin    | Bin 33536 -> 33536 bytes
 amdgpu/navi10_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/navi10_ta.bin           | Bin 33536 -> 33536 bytes
 amdgpu/navi12_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/navi12_ta.bin           | Bin 33536 -> 33536 bytes
 amdgpu/navi14_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/navi14_ta.bin           | Bin 33536 -> 33536 bytes
 amdgpu/navy_flounder_ta.bin    | Bin 238848 -> 238848 bytes
 amdgpu/picasso_asd.bin         | Bin 193024 -> 193024 bytes
 amdgpu/picasso_ta.bin          | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_0_ta.bin       | Bin 251136 -> 251136 bytes
 amdgpu/psp_13_0_10_ta.bin      | Bin 247232 -> 247232 bytes
 amdgpu/psp_13_0_11_ta.bin      | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_4_ta.bin       | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_5_asd.bin      | Bin 193024 -> 193024 bytes
 amdgpu/psp_13_0_5_ta.bin       | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_6_sos.bin      | Bin 385312 -> 385312 bytes
 amdgpu/psp_13_0_7_ta.bin       | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_8_ta.bin       | Bin 226304 -> 226304 bytes
 amdgpu/psp_14_0_0_ta.bin       | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_0_toc.bin      | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_1_ta.bin       | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_toc.bin      | Bin 2560 -> 2560 bytes
 amdgpu/raven2_ta.bin           | Bin 33536 -> 33536 bytes
 amdgpu/raven_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/raven_ta.bin            | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/sdma_6_0_0.bin          | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_1.bin          | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_2.bin          | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_3.bin          | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_0.bin          | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_1.bin          | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ta.bin   | Bin 366336 -> 366336 bytes
 amdgpu/smu_13_0_10.bin         | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_7.bin          | Bin 287080 -> 287080 bytes
 amdgpu/vangogh_asd.bin         | Bin 193024 -> 193024 bytes
 amdgpu/vcn_4_0_0.bin           | Bin 390352 -> 391888 bytes
 amdgpu/vcn_4_0_2.bin           | Bin 391504 -> 391888 bytes
 amdgpu/vcn_4_0_4.bin           | Bin 391376 -> 391888 bytes
 amdgpu/vcn_4_0_5.bin           | Bin 389712 -> 391120 bytes
 amdgpu/vcn_4_0_6.bin           | Bin 389584 -> 391120 bytes
 amdgpu/vcn_4_0_6_1.bin         | Bin 389584 -> 391120 bytes
 amdgpu/vega10_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/vega12_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/vega20_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/vpe_6_1_1.bin           | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_ta.bin      | Bin 226304 -> 226304 bytes
 86 files changed, 0 insertions(+), 0 deletions(-)
