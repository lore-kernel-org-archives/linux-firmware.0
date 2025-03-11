Return-Path: <SRS0=V7sT=V6=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3EDC282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Mar 2025 15:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29328C4CEEF; Tue, 11 Mar 2025 15:22:54 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A9A1C4CEEA;
	Tue, 11 Mar 2025 15:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6A9A1C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC/oxQKjDbIYnmipIYXZSD+8nC9MZsrAwfzrgwjs0urIg91nx8jAWeePXnowbOAZvlxtLsPZF2MbGmTq9xcy6Qax5W923s4XH1igHipd3T/L6+187nJ/9Ci6GafaLtMTYV4xrDugsfCVpoqnuct8fkkJELaaj6OpAorUsCAX6x2m1BdxEzP1iGhl6eMkCPFzwJrofg/Slv4RG7F7PhIgadGISQCWe7/RHbR14BlVGtSdY5Rin3BuFJWWtA6eyFPHK/E5Uldjnkpz+r9JnDA/XHLba4DqGShrEeYTD/uyYH3RUUw3yh8s6beupA4ZNPPtn1ATacbBt1rM1d327g3vDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qKwvXKJzxdeglPTIp0d9Jn2sFasy+hFIU2L1WxHj/w=;
 b=vEUjgkFBieptMD7S4NKceJV7eZpuINwdcee43ePPMfNAX/gqTLXmt/FbUUD58H6nZ8C3cTp6+E/QQ79ubgCsRsf/XaegjdMWJyCarCgYFUkfsU+EcUUo6MFoebkSNy+FrUAj2hCphRz4NV20CidtBtgzjFNeCSiDRO6r1z+iN8IZSNforX4jjXDOUopEU0u9XEn49rX5egCgigvDNrqsDzQVgewfzCNebD/TVEYcAlFmJdgOtlvvWZ2ERto5J9d6QTQiDdnRxOgvhxKcLf28kX5NOmzYZ9zqkhcsrtFvz16TBK2TqRz+UqmO2+lDjmsoobP3tN9Nsu7WKgzbeRwQLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qKwvXKJzxdeglPTIp0d9Jn2sFasy+hFIU2L1WxHj/w=;
 b=bvq9Ttt6zkqVkEgvrD4NMeo/rqmu2LASN3LVZK7bRHOq9PmrWB3BPqT5H9NOR5n/rH490Og949UscWejtNyJC12S9kcMeBNlUsVyXyxX271yIE0rKUR0KCbZgOXCQo9l4DunxnsfEtz1AiACTTrPbOG5vOaeuexc9BSn0PRPCPs=
Received: from SJ0PR03CA0251.namprd03.prod.outlook.com (2603:10b6:a03:3a0::16)
 by SJ2PR12MB9210.namprd12.prod.outlook.com (2603:10b6:a03:561::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 15:22:46 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::67) by SJ0PR03CA0251.outlook.office365.com
 (2603:10b6:a03:3a0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Tue,
 11 Mar 2025 15:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8558.0 via Frontend Transport; Tue, 11 Mar 2025 15:22:46 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 10:22:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>,
	<jwboyer@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] AMD GPU firmware amd-2025-03-11
Date: Tue, 11 Mar 2025 11:22:19 -0400
Message-ID: <20250311152219.1950725-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|SJ2PR12MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: 33cc110e-fbff-419d-8245-08dd60b09388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?06vITsdNqa0p/KwlTyciqbcN3sMyy5li0k8Dgr3xy7VAHhpFa5C+HwskM/M1?=
 =?us-ascii?Q?X4N6sUoK01it5xpl9/faRIquTiesLRz6o+nxpXydUUzQyZnUpkzDjSo5WOMP?=
 =?us-ascii?Q?9KtH4erqAT5DKNtOwCc5HdpFsTf82P2zFgg2+KuVeusyZqf57T7bxVlwYEPT?=
 =?us-ascii?Q?/HtrmQ0hsfU3hocHwhN//Dbk2DblgAHvKSVWR2bXCg1EQy2bl2vcv6WhzSs3?=
 =?us-ascii?Q?yWrpH38rGfXb0IEZiUY2fMTcxeYeHfTPqfkh67iDq79kaA2rNUQX/UpRqkWu?=
 =?us-ascii?Q?ow4FSvfdXpIbrBAZF2XPO1IxosbcPlBO1DoRzYxL1qJKmyGAvdV55hUkZLCQ?=
 =?us-ascii?Q?QHaaVYqReD/cWHHpSQGo8lPeJQj/y72gWT+C0KlaO9LIjeKcGB+7bQLHq7Sz?=
 =?us-ascii?Q?9K4/1VZIQFfe0ErVWP+hzrf0aynd+NsBqQyhFJFZ1IYKhwRpq0H56djJmR8W?=
 =?us-ascii?Q?NatLzP7f/lR2TDRwQ8nwx4YQcx76R7xTgFYA1hYDgFVX5iJfbeXl4b4ZXw8+?=
 =?us-ascii?Q?M3FOBwSAnlRUAX7KA1JCnn39Uyy5Qn05SnFlejDQ9KFCqRi7AbBkUTA/vvks?=
 =?us-ascii?Q?9h4LtdZE6TsCG8gvd5rCNWeCgTWznThcM/09xJCe5gNjACTyvl+HtCKkPHry?=
 =?us-ascii?Q?IEyA2t6Mp3jE0QeykLv3rojdunF0uAE9VhgPz0qvOwtl/VoD5s1Gwoyd5/fu?=
 =?us-ascii?Q?ZiujNn+N8XoJSsp0udc2cvp/5DZt2YJkqX3qYzExuSviHTkKs/DGcOyH+MuW?=
 =?us-ascii?Q?qNegBvcuFs6PmB1beli83IeSqeVBECf5uMY0Qt0W6moC6PB+NHgr9MHwuWx4?=
 =?us-ascii?Q?xsUZtxcL0Y/yPfFCHRDYu20hRUasroZWBRlcHsU0cc++Mux457KiEkJplKiq?=
 =?us-ascii?Q?Rbq0DZqrcZ46R/vez6KlKRTNH+xQb0Z1Dg/ZvWFbvZ9c69QmYQBJLGpskjwt?=
 =?us-ascii?Q?JHrh4KkaaOLVofMOZvLY+b8k4Jo0ABMufPC8H6eHUBuYxe6ogFRq6l+JE7qr?=
 =?us-ascii?Q?tTWcu1arb0fWDQ7adQsmp0tpOSwpFCqleGwepCb6edVDts/UY3woSKKOeWiq?=
 =?us-ascii?Q?ZsOt92uwNUKZL1B8PgR6RYDoCNbTqfaILi+na9RNyZ4WfYvS8jRwUfaIEvag?=
 =?us-ascii?Q?TLJOe/BZQvmLIP7crvEH0DoMoQ4aGEIlCj8pL+rOR6BOc9OnoREtLub8oCzQ?=
 =?us-ascii?Q?GxT1u3m0+VaYSRgPZHng/QtK8HBeXQzAy+wVQTpwE0dpj5zivXp/jrayF/Up?=
 =?us-ascii?Q?Y01ShW/aXho419/GDpKqh0ksAm31FShF2aadcuiXEuOHSXj5yhD2LkrnqQXa?=
 =?us-ascii?Q?cNY3NuT4lF5ryiH0e0xEPUEvkGgewvA32ItC+V8fS804yEgzSmrwbuqtOcBy?=
 =?us-ascii?Q?SDAp1Ci4GLFDC0mh12EkEzJ1TIs/rt4ZtDOCrCjznIGiD6IFjQqoRXHtb8jQ?=
 =?us-ascii?Q?9mYmOAJPHtj/bR+8w5MVa+14wBr4a450xTx1DjsnZoiI+wWjquVpueSNA7j5?=
 =?us-ascii?Q?5KR0ISx/dWnRgk0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 15:22:46.0467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cc110e-fbff-419d-8245-08dd60b09388
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9210

Hi,

Updated AMD GPU firmware.

The following changes since commit c2c0e64a1b022724dc3b1b10bba9a4ab1b60587d:

  amdgpu: DMCUB updates for various ASICs (2025-03-10 17:23:31 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-03-11

for you to fetch changes up to 1ed4e37c32eee7c6ae6fd8463509922635867cba:

  amdgpu: update psp 14.0.0 firmware (2025-03-11 11:10:37 -0400)

----------------------------------------------------------------
amd-2025-03-11:

update GPU firmwares.

----------------------------------------------------------------
Alex Deucher (46):
      amdgpu: update aldebaran firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update gc 11.0.4 firmware
      amdgpu: update gc 11.5.1 firmware
      amdgpu: update psp 14.0.1 firmware
      amdgpu: update gc 10.3.7 firmware
      amdgpu: update beige goby firmware
      amdgpu: update gc 9.4.3 firmware
      amdgpu: update psp 13.0.6 firmware
      amdgpu: update gc 9.4.4 firmware
      amdgpu: update psp 13.0.14 firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update psp 13.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: update picasso firmware
      amdgpu: update vangogh firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update psp 13.0.10 firmware
      amdgpu: update navi12 firmware
      amdgpu: update navi10 firmware
      amdgpu: update gc 10.3.6 firmware
      amdgpu: update vcn 3.1.2 firmware
      amdgpu: update vega10 firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update psp 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update vega12 firmware
      amdgpu: update navi14 firmware
      amdgpu: update vega20 firmware
      amdgpu: update gc 12.0.0 firmware
      amdgpu: update psp 14.0.2 firmware
      amdgpu: update smu 14.0.2 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update gc 12.0.1 firmware
      amdgpu: update gc 14.0.3 firmware
      amdgpu: update sdma 7.0.1 firmware
      amdgpu: update smu 14.0.3 firmware
      amdgpu: update vcn 5.0.0 firmware
      amdgpu: update gc 11.5.2 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update gc 11.0.1 firmware
      amdgpu: update psp 13.0.4 firmware
      amdgpu: update vcn 4.0.2 firmware
      amdgpu: update gc 11.5.0 firmware
      amdgpu: update psp 14.0.0 firmware

 amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
 amdgpu/aldebaran_sos.bin         | Bin 442080 -> 446176 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin         | Bin 247040 -> 247040 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 579440 -> 579696 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 247040 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 587376 -> 579696 bytes
 amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_6_mec.bin         | Bin 268720 -> 268160 bytes
 amdgpu/gc_10_3_6_mec2.bin        | Bin 268720 -> 268160 bytes
 amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_7_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_7_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_7_mec.bin         | Bin 268720 -> 268160 bytes
 amdgpu/gc_10_3_7_mec2.bin        | Bin 268720 -> 268160 bytes
 amdgpu/gc_10_3_7_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 314528 -> 314528 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 218080 -> 218080 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 256000 -> 256288 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 230480 -> 230496 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268640 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 256064 -> 255824 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 314512 -> 314512 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 218400 -> 218400 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 256000 -> 256288 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 230480 -> 230496 bytes
 amdgpu/gc_11_0_2_rlc.bin         | Bin 178720 -> 178848 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 314528 -> 314528 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 218144 -> 218144 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 256064 -> 256352 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 230480 -> 230496 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 256064 -> 256080 bytes
 amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin         | Bin 268704 -> 268160 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 256160 -> 256144 bytes
 amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_rlc.bin         | Bin 166528 -> 166528 bytes
 amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin         | Bin 268704 -> 268160 bytes
 amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_rlc.bin         | Bin 161040 -> 161040 bytes
 amdgpu/gc_11_5_2_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_mec.bin         | Bin 268640 -> 268640 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 255200 -> 256080 bytes
 amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_12_0_0_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_12_0_0_me.bin          | Bin 410688 -> 422656 bytes
 amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_0_pfp.bin         | Bin 350992 -> 351696 bytes
 amdgpu/gc_12_0_0_rlc.bin         | Bin 150704 -> 150704 bytes
 amdgpu/gc_12_0_0_uni_mes.bin     | Bin 709520 -> 711488 bytes
 amdgpu/gc_12_0_1_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_12_0_1_me.bin          | Bin 410784 -> 422656 bytes
 amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 447456 bytes
 amdgpu/gc_12_0_1_pfp.bin         | Bin 351024 -> 351696 bytes
 amdgpu/gc_12_0_1_rlc.bin         | Bin 150848 -> 150848 bytes
 amdgpu/gc_12_0_1_uni_mes.bin     | Bin 709520 -> 711488 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/navi10_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi10_mec.bin            | Bin 268592 -> 268160 bytes
 amdgpu/navi10_mec2.bin           | Bin 268592 -> 268160 bytes
 amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi12_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi12_mec.bin            | Bin 268592 -> 268160 bytes
 amdgpu/navi12_mec2.bin           | Bin 268592 -> 268160 bytes
 amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi14_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 247040 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 587376 -> 579696 bytes
 amdgpu/picasso_ta.bin            | Bin 41984 -> 46080 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 251328 -> 251328 bytes
 amdgpu/psp_13_0_14_sos.bin       | Bin 389408 -> 389408 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 238592 -> 238592 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 782912 -> 782944 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 234496 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 234496 -> 238592 bytes
 amdgpu/psp_14_0_1_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/psp_14_0_2_sos.bin        | Bin 417120 -> 421216 bytes
 amdgpu/psp_14_0_2_ta.bin         | Bin 258016 -> 258016 bytes
 amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
 amdgpu/psp_14_0_3_ta.bin         | Bin 270624 -> 270624 bytes
 amdgpu/sdma_7_0_1.bin            | Bin 45824 -> 46336 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 374528 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 587376 -> 579696 bytes
 amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
 amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin           | Bin 268160 -> 267920 bytes
 amdgpu/vangogh_mec2.bin          | Bin 268160 -> 267920 bytes
 amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 579376 -> 571952 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 395632 -> 395632 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 395632 -> 395632 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 395632 -> 395632 bytes
 amdgpu/vcn_5_0_0.bin             | Bin 438288 -> 440848 bytes
 amdgpu/vega10_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/vega12_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/vega20_asd.bin            | Bin 197120 -> 197120 bytes
 amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 579504 -> 571440 bytes
 144 files changed, 0 insertions(+), 0 deletions(-)
