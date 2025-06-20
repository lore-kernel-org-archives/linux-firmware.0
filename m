Return-Path: <SRS0=SCrN=ZD=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C917C7115C
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Jun 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13FF2C4CEF0; Fri, 20 Jun 2025 17:27:16 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80D5AC4CEE3
	for <linux-firmware@kernel.org>; Fri, 20 Jun 2025 17:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80D5AC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uxwjzbu7+qVxPmgoZRoFeMUWd5BJGd9fY3j7giQwIG/Wd7cUT3Eyz8HQpI4ZzGXUbdt2l1oGbloaypo33f/RYGkFyGIJHGnEtig4chUqq9CqIP87pgxGs+9aymlhGTsHsfIyUeaHVrBhoQjTeIjSwiOFiPevXEzohvJfFd8yzRGchMfBRyDkNE2dA5jfbQtkIbPprkn8O5vhoMk60U1kRatxOMbCwu5ZhdxG5i8zy9lKpJ1yurhbXPAaEW/9uUnhWkJaWKfFb64qnvWGbJh6IMygBul0aoNQ8DjSKMIeHo2lrZR5EFoB0wTS3MGl0dEs7w0QK5AVk8el5RtNzapOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyWhr2IaduzJ/H1jVeU7fJw/I8Xm+z8CKflRvdcuYdo=;
 b=bk6DiyqtaGEhua2of8tlfiSx1CM671U3DGSQZmZcWB4EJKxSXtno4TpV5mSZvuO0C/gdPGI3LIft3/GGXfGEXRTDotBnwg7w34/uVu0sZICBWiMrT9OYvmYoqLgXn7C1rsAA+XXI8/uxI8qoEHAKPY4aP6DBuE0MY/USfuEuQEoROQGw+2unj4CMyu/b8c9Ms6/8s5o7/H9y8WYuY6e0ZzOkxxrlCAIMVIL+tCI6kO+GnBhzuWpyD8jRv64xSEMg2jEHdbSkD8LrCOFhOGGzEB+HbY9P5xSFQfFVmT4nnN+yVJW1EgmoYyQyR5QnxodDBmN/kJ95ZyFrsLHWZvDEow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyWhr2IaduzJ/H1jVeU7fJw/I8Xm+z8CKflRvdcuYdo=;
 b=gX2x/bmE5k2uxx7IPbk9p/rmMWoavzZ29Ido4EGgg3FrYHcqovdUhFAyeg6rLEGyCNPfvKVYzsQnmhzln4JbWWzf/DHjEul6P952yoi/CrWKgl1e7eP4W18MyibVaRL8MjY2kXr0pOmik/GGYwbSVqgD8HnC/Lux2LfNSdtB18Y=
Received: from CH0P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::27)
 by PH7PR12MB7188.namprd12.prod.outlook.com (2603:10b6:510:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 17:27:11 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:11c:cafe::58) by CH0P221CA0001.outlook.office365.com
 (2603:10b6:610:11c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Fri,
 20 Jun 2025 17:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 17:27:11 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 12:27:10 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware amd-2025-06-20
Date: Fri, 20 Jun 2025 13:26:56 -0400
Message-ID: <20250620172656.55698-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|PH7PR12MB7188:EE_
X-MS-Office365-Filtering-Correlation-Id: 100d04f1-87d7-4f86-2210-08ddb01fb0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UQzBh2CodJUYzYPvSnQIto2GzOCmh0jSNBwGqCmVtVd6cR2XbsvuDak4ro/2?=
 =?us-ascii?Q?4VKNlaTOj+sItMktQia8s5C0wSnfVZipPZya7QsGOZ89Yt8RGIBXZv2Mbzha?=
 =?us-ascii?Q?K/v76ehZnY6CpZwCal+A11+DzYrRDoRNu6a4bJ2QxpLjuLE0g2DkxCuCXZKo?=
 =?us-ascii?Q?UBWpJsVsebrCrPBw5eEl/yJztIu057JofJgLjNQ0w+QlgVh0asrZdCXghHMF?=
 =?us-ascii?Q?8Pz1U/z5G8Vu3DVKH8iLqXth8f04Kjv/5aQ4+Tz3ymqB2d5qZeuO0XTg2Bnu?=
 =?us-ascii?Q?dZHs1vR5OZK9Vk2d4Q6jMjUtL5+mxEuzb9TC8OvfB/5ekxVM4JgeeZ3jxEns?=
 =?us-ascii?Q?yjv4qp3XvA4jMBAHnR+89ESovOVXfzJxPUaK8L1pSROpDef9OoYnhhVcqBFQ?=
 =?us-ascii?Q?AC5hv5cmezoPihjIqSn+s1WKlcRwJVJYEAZ1u7voEKVoqbL6tARh6LMQ2kHJ?=
 =?us-ascii?Q?uQAlHqdKSWZTl9pk32CsgQwav31d5uCMBv6IcATXHd11LRTyZ2c9Zghe/enL?=
 =?us-ascii?Q?s+OeweRUb4iTVocUgvTTaaqRjmTCJLjLdceRnR/fznMdkqzM1cU3afElIgW9?=
 =?us-ascii?Q?iFRer38o/GHnngCzMAuNyBkIRUSuMs9jB+5mBfbSd1LBHk+LB7fFUAh0DcZW?=
 =?us-ascii?Q?0VqQ5Qznu5F+6wVOrfUqx4exYeKhmHgjostRcTj3H47I+fEmp2ePu6lnzS0S?=
 =?us-ascii?Q?3/yksnETVBBFBitk00E5aCECobiF/J0AZGNnYL+CSqSCM4Pm4cwU4gxMa9yk?=
 =?us-ascii?Q?rxWisW9ObhR9Ww5CugPiHbdDPpid1mF6y/E//FAmmhNJ0pNIloAJdwiFr3Ge?=
 =?us-ascii?Q?W3g5mm0r4RBO7P/lE+1NZ2uUvA/bIF5vMc9zvE2Wl073nIskLSJ4wQZ55hie?=
 =?us-ascii?Q?GvqKvV5NwA+Z9biYmGmY3Pfcap2Vs36Dy2xt8JCZLZ2OaSmXFV59WFJJJ9FK?=
 =?us-ascii?Q?+auUqy8N5VB1ITUjwvY2wyXzXeX7H6Mng4QSHLDrwiOj4x3Adl9TJhOqDxMi?=
 =?us-ascii?Q?hEh64fJZTrPaVOSK8QwRMBIkxPAKJXW/UUlMYyzMT138v+US54x+2rovunHV?=
 =?us-ascii?Q?n61r2uTYZzKFE5KeBEGKGYQhWme5JaWVhMGX66DIhg7oKSQtaAJQ4VwisJ5w?=
 =?us-ascii?Q?9hZ/DxwXjp8OHBm2XwU+O4gdiwH1wYzv59Qz8t6ekBr1rCkGq6CjnvI7J5Ze?=
 =?us-ascii?Q?pZvOGdCJbNUsts1/4E5kI8QXsAY+pEP2iuc8Twuy5OYqNhe0Rks0zsqyTAjo?=
 =?us-ascii?Q?kPNbeOlJ+f9ISt/KRu+6mrIsCV5NT6lPLFTAAjl5iG/l0UZAh9wV4+Nq+56j?=
 =?us-ascii?Q?cN31vjpfknSxz1/HhfGcgCe0cUEbuCzmA59qS1OyVvnnbTr5O5dc//9nwGcA?=
 =?us-ascii?Q?OlsFodeEg/AIeg01FA+SNzm70s8OsYhctitg9OhrSpNxpeOaQesqrIYdtZwk?=
 =?us-ascii?Q?avQfFNsAdN92G/q8Eaj1six+Xb2fnepHnEeUFwZHVQTMIBelY5tWnUffyy53?=
 =?us-ascii?Q?UI7q3KFXVjX3ZDKba1OZ3mkzzv7W5T4Icr3p/zTRie8VKhOd03vZ7gXYEQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 17:27:11.2499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100d04f1-87d7-4f86-2210-08ddb01fb0cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7188

Hi,

Updated amdgpu firmwares.

The following changes since commit a26e413e7481d12ab5a53f77e0cdde2d5be937d8:

  amdgpu: update dmcub fw for dcn32 and dcn401 (2025-06-19 20:35:25 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-06-20

for you to fetch changes up to 655062ef7f004eb15266b0fca6a8f4cb71cd6eea:

  amdgpu: update renoir firmware (2025-06-20 13:14:15 -0400)

----------------------------------------------------------------
amd-2025-06-20:

Update amdgpu firmwares.
Add gfx9 ip_discovery firmwares.

----------------------------------------------------------------
Alex Deucher (60):
      amdgpu: update aldebaran firmware
      amdgpu: update dimgrey_cavefish firmware
      amdgpu: update gc 11.0.1 firmware
      amdgpu: update vcn 4.0.2 firmware
      amdgpu: update gc 11.5.0 firmware
      amdgpu: update vcn 4.0.5 firmware
      amdgpu: update beige_goby firmware
      amdgpu: update gc 9.4.3 firmware
      amdgpu: update psp 13.0.6 firmware
      amdgpu: update gc 9.4.4 firmware
      amdgpu: update psp 13.0.14 firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update psp 13.0.0 firmware
      amdgpu: update smu 13.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: add arcturus IP discovery firmware
      amdgpu: add gc 9.5.0 firmware
      amdgpu: add psp 13.0.12 firmware
      amdgpu: add sdma 4.4.4 firmware
      amdgpu: add vcn 5.0.1 firmware
      amdgpu: add gc 11.0.0 kicker firmware
      amdgpu: add psp 13.0.0 kicker firmware
      amdgpu: add smu 13.0.0 kicker firmware
      amdgpu: update navi10 firmware
      amdgpu: update vangogh firmware
      amdgpu: update navi12 firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update psp 13.0.10 firmware
      amdgpu: update smu 13.0.10 firmware
      amdgpu: update gc 10.3.6 firmware
      amdgpu: update vega10 firmware
      amdgpu: update navi14 firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update psp 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update smu 13.0.7 firmware
      amdgpu: update vega12 firmware
      amdgpu: update vega20 firmware
      amdgpu: add raven ip discovery firmware
      amdgpu: add picasso ip discovery firmware
      amdgpu: update gc 11.0.4 firmware
      amdgpu: update psp 13.0.11 firmware
      amdgpu: update gc 11.5.1 firmware
      amdgpu: update psp 14.0.1 firmware
      amdgpu: update vcn 4.0.6 firmware
      amdgpu: update gc 12.0.0 firmware
      amdgpu: update psp 14.0.2 firmware
      amdgpu: update sdma 7.0.0 firmware
      amdgpu: update smu 14.0.2 firmware
      amdgpu: add raven2 ip discovery firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update gc 11.5.2 firmware
      amdgpu: update psp 14.0.4 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update gc 12.0.1 firmware
      amdgpu: update psp 14.0.3 firmware
      amdgpu: update sdma 7.0.1 firmware
      amdgpu: update smu 14.0.3 firmware
      amdgpu: update vcn 5.0.0 firmware
      amdgpu: update renoir firmware

 WHENCE                            |  20 ++++++++++++++++++++
 amdgpu/aldebaran_ip_discovery.bin | Bin 0 -> 732 bytes
 amdgpu/aldebaran_smc.bin          | Bin 242688 -> 242688 bytes
 amdgpu/aldebaran_sos.bin          | Bin 446176 -> 446208 bytes
 amdgpu/arcturus_ip_discovery.bin  | Bin 0 -> 936 bytes
 amdgpu/beige_goby_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin        | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin          | Bin 247040 -> 247040 bytes
 amdgpu/beige_goby_vcn.bin         | Bin 579824 -> 580080 bytes
 amdgpu/dimgrey_cavefish_ce.bin    | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin    | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin   | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin  | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_ta.bin    | Bin 247040 -> 247040 bytes
 amdgpu/dimgrey_cavefish_vcn.bin   | Bin 579824 -> 580080 bytes
 amdgpu/gc_10_3_6_rlc.bin          | Bin 177104 -> 177104 bytes
 amdgpu/gc_11_0_0_imu_kicker.bin   | Bin 0 -> 132352 bytes
 amdgpu/gc_11_0_0_mes_2.bin        | Bin 256624 -> 257072 bytes
 amdgpu/gc_11_0_0_rlc_kicker.bin   | Bin 0 -> 185376 bytes
 amdgpu/gc_11_0_1_mes_2.bin        | Bin 256688 -> 256544 bytes
 amdgpu/gc_11_0_2_mes_2.bin        | Bin 256624 -> 257072 bytes
 amdgpu/gc_11_0_3_mes_2.bin        | Bin 256688 -> 257136 bytes
 amdgpu/gc_11_0_4_mes_2.bin        | Bin 256688 -> 256544 bytes
 amdgpu/gc_11_5_0_rlc.bin          | Bin 166528 -> 166528 bytes
 amdgpu/gc_11_5_1_rlc.bin          | Bin 161040 -> 161040 bytes
 amdgpu/gc_11_5_2_me.bin           | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_mec.bin          | Bin 268640 -> 268160 bytes
 amdgpu/gc_11_5_2_mes1.bin         | Bin 233520 -> 234288 bytes
 amdgpu/gc_11_5_2_pfp.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_rlc.bin          | Bin 162096 -> 162096 bytes
 amdgpu/gc_12_0_0_me.bin           | Bin 422592 -> 419776 bytes
 amdgpu/gc_12_0_0_mec.bin          | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_0_pfp.bin          | Bin 352304 -> 352016 bytes
 amdgpu/gc_12_0_0_uni_mes.bin      | Bin 712656 -> 721312 bytes
 amdgpu/gc_12_0_1_me.bin           | Bin 422592 -> 419776 bytes
 amdgpu/gc_12_0_1_mec.bin          | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_1_pfp.bin          | Bin 352304 -> 352016 bytes
 amdgpu/gc_12_0_1_uni_mes.bin      | Bin 712656 -> 721312 bytes
 amdgpu/gc_9_4_3_mec.bin           | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_rlc.bin           | Bin 38708 -> 38708 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin       | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin           | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_rlc.bin           | Bin 48076 -> 43388 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin       | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_mec.bin           | Bin 0 -> 269200 bytes
 amdgpu/gc_9_5_0_rlc.bin           | Bin 0 -> 38700 bytes
 amdgpu/gc_9_5_0_sjt_mec.bin       | Bin 0 -> 269200 bytes
 amdgpu/navi10_asd.bin             | Bin 197120 -> 197120 bytes
 amdgpu/navi10_ce.bin              | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin              | Bin 263424 -> 263424 bytes
 amdgpu/navi10_mec.bin             | Bin 268160 -> 268160 bytes
 amdgpu/navi10_mec2.bin            | Bin 268160 -> 268160 bytes
 amdgpu/navi10_pfp.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi10_ta.bin              | Bin 37632 -> 37632 bytes
 amdgpu/navi10_vcn.bin             | Bin 404032 -> 404288 bytes
 amdgpu/navi12_asd.bin             | Bin 197120 -> 197120 bytes
 amdgpu/navi12_ce.bin              | Bin 263296 -> 263296 bytes
 amdgpu/navi12_me.bin              | Bin 263424 -> 263424 bytes
 amdgpu/navi12_mec.bin             | Bin 268160 -> 268160 bytes
 amdgpu/navi12_mec2.bin            | Bin 268160 -> 268160 bytes
 amdgpu/navi12_pfp.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi12_ta.bin              | Bin 37632 -> 37632 bytes
 amdgpu/navi12_vcn.bin             | Bin 404032 -> 404288 bytes
 amdgpu/navi14_asd.bin             | Bin 197120 -> 197120 bytes
 amdgpu/navi14_ce.bin              | Bin 263296 -> 263296 bytes
 amdgpu/navi14_me.bin              | Bin 263424 -> 263424 bytes
 amdgpu/navi14_mec.bin             | Bin 268160 -> 268160 bytes
 amdgpu/navi14_mec2.bin            | Bin 268160 -> 268160 bytes
 amdgpu/navi14_pfp.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi14_ta.bin              | Bin 37632 -> 37632 bytes
 amdgpu/navi14_vcn.bin             | Bin 404032 -> 404288 bytes
 amdgpu/navy_flounder_ce.bin       | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin       | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin      | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin     | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_ta.bin       | Bin 247040 -> 247040 bytes
 amdgpu/navy_flounder_vcn.bin      | Bin 579824 -> 580080 bytes
 amdgpu/picasso_ip_discovery.bin   | Bin 0 -> 628 bytes
 amdgpu/psp_13_0_0_sos.bin         | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_sos_kicker.bin  | Bin 0 -> 268976 bytes
 amdgpu/psp_13_0_0_ta.bin          | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_0_ta_kicker.bin   | Bin 0 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin         | Bin 251328 -> 251328 bytes
 amdgpu/psp_13_0_11_ta.bin         | Bin 238592 -> 238592 bytes
 amdgpu/psp_13_0_12_sos.bin        | Bin 0 -> 410416 bytes
 amdgpu/psp_13_0_12_ta.bin         | Bin 0 -> 66880 bytes
 amdgpu/psp_13_0_14_sos.bin        | Bin 397632 -> 397632 bytes
 amdgpu/psp_13_0_14_ta.bin         | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_6_sos.bin         | Bin 787040 -> 787040 bytes
 amdgpu/psp_13_0_6_ta.bin          | Bin 88960 -> 88960 bytes
 amdgpu/psp_13_0_7_ta.bin          | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_1_toc.bin         | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_2_sos.bin         | Bin 421216 -> 421216 bytes
 amdgpu/psp_14_0_2_ta.bin          | Bin 258016 -> 258016 bytes
 amdgpu/psp_14_0_3_sos.bin         | Bin 435632 -> 435632 bytes
 amdgpu/psp_14_0_3_ta.bin          | Bin 270624 -> 270624 bytes
 amdgpu/psp_14_0_4_ta.bin          | Bin 238592 -> 238592 bytes
 amdgpu/psp_14_0_4_toc.bin         | Bin 2560 -> 2560 bytes
 amdgpu/raven2_ip_discovery.bin    | Bin 0 -> 628 bytes
 amdgpu/raven_ip_discovery.bin     | Bin 0 -> 628 bytes
 amdgpu/renoir_asd.bin             | Bin 193024 -> 197120 bytes
 amdgpu/sdma_4_4_4.bin             | Bin 0 -> 34304 bytes
 amdgpu/sdma_7_0_0.bin             | Bin 45824 -> 47872 bytes
 amdgpu/sdma_7_0_1.bin             | Bin 46336 -> 47104 bytes
 amdgpu/sienna_cichlid_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin     | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_mec2.bin    | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_ta.bin      | Bin 374528 -> 374528 bytes
 amdgpu/sienna_cichlid_vcn.bin     | Bin 579824 -> 580080 bytes
 amdgpu/smu_13_0_0.bin             | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_0_kicker.bin      | Bin 0 -> 261888 bytes
 amdgpu/smu_13_0_10.bin            | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_7.bin             | Bin 287080 -> 287080 bytes
 amdgpu/smu_14_0_2.bin             | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin             | Bin 333236 -> 333236 bytes
 amdgpu/vangogh_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin            | Bin 267920 -> 268160 bytes
 amdgpu/vangogh_mec2.bin           | Bin 267920 -> 268160 bytes
 amdgpu/vangogh_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vcn_4_0_0.bin              | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_2.bin              | Bin 395632 -> 395664 bytes
 amdgpu/vcn_4_0_4.bin              | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_5.bin              | Bin 395632 -> 395664 bytes
 amdgpu/vcn_4_0_6.bin              | Bin 393456 -> 395664 bytes
 amdgpu/vcn_4_0_6_1.bin            | Bin 393456 -> 395664 bytes
 amdgpu/vcn_5_0_0.bin              | Bin 440848 -> 433552 bytes
 amdgpu/vcn_5_0_1.bin              | Bin 0 -> 207440 bytes
 amdgpu/vega10_asd.bin             | Bin 197120 -> 197120 bytes
 amdgpu/vega10_ip_discovery.bin    | Bin 0 -> 656 bytes
 amdgpu/vega12_asd.bin             | Bin 197120 -> 197120 bytes
 amdgpu/vega12_ip_discovery.bin    | Bin 0 -> 656 bytes
 amdgpu/vega20_asd.bin             | Bin 197120 -> 197120 bytes
 amdgpu/vega20_ip_discovery.bin    | Bin 0 -> 564 bytes
 141 files changed, 20 insertions(+)
 create mode 100644 amdgpu/aldebaran_ip_discovery.bin
 create mode 100644 amdgpu/arcturus_ip_discovery.bin
 create mode 100644 amdgpu/gc_11_0_0_imu_kicker.bin
 create mode 100644 amdgpu/gc_11_0_0_rlc_kicker.bin
 create mode 100644 amdgpu/gc_9_5_0_mec.bin
 create mode 100644 amdgpu/gc_9_5_0_rlc.bin
 create mode 100644 amdgpu/gc_9_5_0_sjt_mec.bin
 create mode 100644 amdgpu/picasso_ip_discovery.bin
 create mode 100644 amdgpu/psp_13_0_0_sos_kicker.bin
 create mode 100644 amdgpu/psp_13_0_0_ta_kicker.bin
 create mode 100644 amdgpu/psp_13_0_12_sos.bin
 create mode 100644 amdgpu/psp_13_0_12_ta.bin
 create mode 100644 amdgpu/raven2_ip_discovery.bin
 create mode 100644 amdgpu/raven_ip_discovery.bin
 create mode 100644 amdgpu/sdma_4_4_4.bin
 create mode 100644 amdgpu/smu_13_0_0_kicker.bin
 create mode 100644 amdgpu/vcn_5_0_1.bin
 create mode 100644 amdgpu/vega10_ip_discovery.bin
 create mode 100644 amdgpu/vega12_ip_discovery.bin
 create mode 100644 amdgpu/vega20_ip_discovery.bin
