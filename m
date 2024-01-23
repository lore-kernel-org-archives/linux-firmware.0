Return-Path: <SRS0=ouMd=JB=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04871C47DDB
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Jan 2024 18:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6D64C43394; Tue, 23 Jan 2024 18:42:35 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3D7FC43399;
	Tue, 23 Jan 2024 18:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3D7FC43399
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkGHLmk/+kKetpDCE9I3pAkLHSR4zwjoMAYTpEl//DfdNpDT8geTpoeZGj0oi3Y1ai/SeHErqbLitKAaT0H1a5NZTmeZntLkCdOrBoL0Q6+9bAdikHtk5+tyK5vcjjEqVag/hsE5mM7E0g2/xYQw/oNlSddz19XqWMqERQDYUJbjSp1LcLh/oeRr/qtMWNtu2nZcuGy5lvoPoGUSdtXPw3b5EvbZi7fj+XP0DHJBL58HTPxtW0mO3WyeBkxskvn2uz4jI+2yNkrzdgTt2L9ixjn9CoV+Rb8A5fgDH20GbfT3Ft8I5pytzjVNbdm5tsEPY5zl46jQRJE/UWptjSVAXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BR8t4GuzfSUyljuxtJrQtyGNAAify4s7mDVw52acJw=;
 b=NI+oz68xhbQK0LyDfWuL0LrThrynYJvNqF1Vya+hOvwsrYVk4SUyAzM00YSCdSRyuVUg2s8srH207lf9XlbLdLW05UfxZ6Yo+uiNfRkfFPsnSuoDyuwpKmWdVEaM5PqCP7Gptz+gJw68ifTuon1UYMDKlWByQfWG1/50XixJGeU+2u6gDCoVJbrEkSretHGlCuSjQUg2Ojx7LuuBTl62hf/h/qD3WjqjkKH6xAiqdse8F1GyHdew/hTjs4ET+Zqo9KBOSyyAXJBaksXdNHfF9FlyBdWSw+oqqxqtDKdjRpx+60V+nffPx6uTqwzXZo7V8QUe3PFD8aoF8ST9kWiKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BR8t4GuzfSUyljuxtJrQtyGNAAify4s7mDVw52acJw=;
 b=0S+CjeNRSiH+oEqsG0neYeafQz447WO2sfU1RqhJgmWHi06gH9sxZ8SNNL5gvV+qTLJVP7oiYEbYSE5mkQQHwjXw48d7Ea1tSKpOvX5z4cLDvg01ZavTg+vhgB98+qM6f4Z+31g+b5GJvRULot5NPmjkYriguMdnGAVHiwyyaVk=
Received: from BY5PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:1e0::25)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 18:42:30 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::31) by BY5PR03CA0015.outlook.office365.com
 (2603:10b6:a03:1e0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Tue, 23 Jan 2024 18:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 23 Jan 2024 18:42:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 12:42:26 -0600
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>,
	<mario.limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware amd-2024-01-23
Date: Tue, 23 Jan 2024 13:42:10 -0500
Message-ID: <20240123184210.2753628-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|PH0PR12MB7907:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a0fd38-0f6b-43df-eb50-08dc1c430c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FWTCz4xRkSRQbDzYQGl9CkeO15puN5xsGjRliUzlyWui6RhcH8FV7ifU/EYWhsBIDWdWI43y0oEPTRDI6qY71720l+YrocwdpEPWwG7X2L5mMsNsC7FInqOSEm69gvrB3HQeVu2LRtoNRUobt1v9jfkh9EIWvdhBxKz3KlmLx98m3UWNr0OKwuIJxflhxMQDPxAW9kJ96pzPNPrefSGihgOYk/x6Zf9p4G7csP2dDyXClMM+z+oOZMgvXaPbs3RQhMaR8Xhk0X9rG/sX/jCMh3kfGQCfUpQsPCbe47zCtIFoRohOxUOgaZq75G6VM9WjtksxTaAg1GJ50k9oUQuAU/RXGeeKRL1TmVcT2HOSv0zQEo0nxYInH+y2yp6JhWX2ukREox4oi9Ve11wNTh/cl2hFM1WZfY0TgymtZo7CB/Kz8KlKXq8eMGdL9k10d55H0OoAnJdyVEE7bYcMuUriIGITafydElRHLNapA1G/bld+x/y69dWf5Axv0y6olPpRveOadt5K5bg74cW9EDyN80W9Tvf/NZU3ROZHRcQOibDGrFbX06WqOObakNlIhJJozm/eHvCrcgeSDfqA/yIse4gi+UsqfCI77FyQx7rrBEk1kBgs8K1eJLHiD4e/RjmYRfIbnLPGJdIdiJpPs2uw3WcR6nB6LEsBbdKO0yj7vJOcYMsqOgQkWnOno/geeuEIwcm9bC12Ya2NFiED8TmFejQOmOxmwJRaQ0id1EFw9kzl6oy5DKuq6O1okCCsToBR
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(1800799012)(451199024)(82310400011)(186009)(64100799003)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(7696005)(966005)(2616005)(1076003)(8936002)(426003)(336012)(83380400001)(8676002)(47076005)(316002)(4326008)(6636002)(6666004)(478600001)(70586007)(70206006)(110136005)(26005)(16526019)(450100002)(5660300002)(30864003)(356005)(82740400003)(2906002)(86362001)(41300700001)(81166007)(36860700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 18:42:27.3483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a0fd38-0f6b-43df-eb50-08dc1c430c54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907

Hi,

The following changes since commit 4d8afe32753bff72f05b8eb125b401408f718a50:

  amdgpu: DMCUB updates for DCN314 (2024-01-12 14:43:41 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-01-23

for you to fetch changes up to 207f71b1306e8b1f2eb6003950371045537fcfdf:

  amdgpu: update raven2 firmware (2024-01-23 12:49:16 -0500)

----------------------------------------------------------------
amd-2024-01-23:

Updated firmares.

From internal git commit:
9a5104340a1e9fe80240546cc3d0975fdeaa8e06

----------------------------------------------------------------
Alex Deucher (48):
      amdgpu: update aldebaran firmware
      amdgpu: update navi10 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SDMA 6.0.3 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update navi12 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SMU 13.0.7 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update renoir firmware
      amdgpu: Add GC 9.4.3 firmware
      amdgpu: add PSP 13.0.6 firmware
      amdgpu: add SMU 13.0.6 firmware
      amdgpu: add SDMA 4.4.2 firmware
      amdgpu: add VCN 4.0.3 firmware
      amdgpu: update navi14 firmware
      amdgpu: update arcturus firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update green sardine firmware
      amdgpu: update navy flounder firmware
      amdgpu: update vangogh firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update picasso firmware
      amdgpu: update beige goby firmware
      amdgpu: update vega10 firmware
      amdgpu: update vega12 firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update SMU 13.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update vega20 firmware
      amdgpu: add GC 11.0.1 rlc_1 firmware
      amdgpu: update GC 10.3.6 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update SDMA 5.2.6 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update PSP 13.0.8 firmware
      amdgpu: update SDMA 5.2.7 firmware
      amdgpu: update raven firmware
      amdgpu: update raven2 firmware

 WHENCE                           |   8 ++++++++
 amdgpu/aldebaran_mec.bin         | Bin 268560 -> 268576 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268560 -> 268576 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268560 -> 268576 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268560 -> 268576 bytes
 amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
 amdgpu/aldebaran_ta.bin          | Bin 140288 -> 140288 bytes
 amdgpu/arcturus_ta.bin           | Bin 127744 -> 127744 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268720 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268720 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_smc.bin        | Bin 244934 -> 244934 bytes
 amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
 amdgpu/beige_goby_ta.bin         | Bin 226560 -> 234752 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 579568 -> 582768 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268720 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268720 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_smc.bin  | Bin 244902 -> 244902 bytes
 amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 226560 -> 234752 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 579568 -> 582768 bytes
 amdgpu/gc_10_3_6_rlc.bin         | Bin 177088 -> 177104 bytes
 amdgpu/gc_11_0_0_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 197216 -> 298320 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 211696 -> 216832 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 239136 -> 244144 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 211104 -> 228096 bytes
 amdgpu/gc_11_0_0_rlc.bin         | Bin 184992 -> 185248 bytes
 amdgpu/gc_11_0_0_rlc_1.bin       | Bin 0 -> 185248 bytes
 amdgpu/gc_11_0_1_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268640 bytes
 amdgpu/gc_11_0_1_mes1.bin        | Bin 231344 -> 231440 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 235072 -> 244016 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_rlc.bin         | Bin 160592 -> 160592 bytes
 amdgpu/gc_11_0_2_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 197216 -> 379952 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 212048 -> 217184 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 239136 -> 244144 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 211088 -> 229024 bytes
 amdgpu/gc_11_0_2_rlc.bin         | Bin 178448 -> 178720 bytes
 amdgpu/gc_11_0_3_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 197232 -> 379968 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 211792 -> 216928 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 239200 -> 244208 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 211088 -> 229024 bytes
 amdgpu/gc_11_0_3_rlc.bin         | Bin 178832 -> 178976 bytes
 amdgpu/gc_11_0_4_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_0_4_mes1.bin        | Bin 230640 -> 230736 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 234048 -> 242384 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_rlc.bin         | Bin 158752 -> 158752 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 0 -> 269200 bytes
 amdgpu/gc_9_4_3_rlc.bin          | Bin 0 -> 48076 bytes
 amdgpu/green_sardine_asd.bin     | Bin 180736 -> 188928 bytes
 amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
 amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
 amdgpu/green_sardine_mec.bin     | Bin 268048 -> 268048 bytes
 amdgpu/green_sardine_mec2.bin    | Bin 268048 -> 268048 bytes
 amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
 amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
 amdgpu/navi10_asd.bin            | Bin 180736 -> 188928 bytes
 amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi10_mec.bin            | Bin 268592 -> 268592 bytes
 amdgpu/navi10_mec2.bin           | Bin 268592 -> 268592 bytes
 amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
 amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi12_asd.bin            | Bin 184832 -> 188928 bytes
 amdgpu/navi12_sos.bin            | Bin 204656 -> 204656 bytes
 amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi14_asd.bin            | Bin 180736 -> 188928 bytes
 amdgpu/navi14_sos.bin            | Bin 184176 -> 184176 bytes
 amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268720 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268720 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_smc.bin     | Bin 244902 -> 244902 bytes
 amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 218608 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 226560 -> 234752 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 579568 -> 582768 bytes
 amdgpu/picasso_asd.bin           | Bin 180736 -> 188928 bytes
 amdgpu/picasso_ce.bin            | Bin 9344 -> 9344 bytes
 amdgpu/picasso_me.bin            | Bin 17536 -> 17536 bytes
 amdgpu/picasso_mec.bin           | Bin 268064 -> 268048 bytes
 amdgpu/picasso_mec2.bin          | Bin 268064 -> 268048 bytes
 amdgpu/picasso_pfp.bin           | Bin 21632 -> 21632 bytes
 amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 242944 -> 247040 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 355808 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 243584 -> 235392 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 218560 -> 226304 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 218560 -> 230400 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 184832 -> 188928 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 218112 -> 222208 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 0 -> 385056 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 0 -> 63808 bytes
 amdgpu/psp_13_0_7_sos.bin        | Bin 248496 -> 248496 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 218112 -> 222208 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 218112 -> 222208 bytes
 amdgpu/raven2_asd.bin            | Bin 180736 -> 184832 bytes
 amdgpu/raven2_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/raven2_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/raven2_mec.bin            | Bin 268048 -> 268048 bytes
 amdgpu/raven2_mec2.bin           | Bin 268048 -> 268048 bytes
 amdgpu/raven2_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/raven2_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/raven_asd.bin             | Bin 180736 -> 188928 bytes
 amdgpu/raven_ce.bin              | Bin 9344 -> 9344 bytes
 amdgpu/raven_me.bin              | Bin 17536 -> 17536 bytes
 amdgpu/raven_mec.bin             | Bin 268064 -> 268048 bytes
 amdgpu/raven_mec2.bin            | Bin 268064 -> 268048 bytes
 amdgpu/raven_pfp.bin             | Bin 21632 -> 21632 bytes
 amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin            | Bin 180736 -> 188928 bytes
 amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/renoir_mec.bin            | Bin 268048 -> 268048 bytes
 amdgpu/renoir_mec2.bin           | Bin 268048 -> 268048 bytes
 amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
 amdgpu/sdma_4_4_2.bin            | Bin 0 -> 34304 bytes
 amdgpu/sdma_5_2_6.bin            | Bin 34048 -> 34048 bytes
 amdgpu/sdma_5_2_7.bin            | Bin 34048 -> 34048 bytes
 amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268720 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268720 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_smc.bin    | Bin 247396 -> 247396 bytes
 amdgpu/sienna_cichlid_sos.bin    | Bin 227456 -> 227456 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 354048 -> 362240 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 579568 -> 582768 bytes
 amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_6.bin            | Bin 0 -> 2584 bytes
 amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
 amdgpu/vangogh_asd.bin           | Bin 184832 -> 188928 bytes
 amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin           | Bin 268720 -> 268720 bytes
 amdgpu/vangogh_mec2.bin          | Bin 268720 -> 268720 bytes
 amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 571824 -> 575792 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 385232 -> 386128 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 367136 -> 385232 bytes
 amdgpu/vcn_4_0_3.bin             | Bin 0 -> 384720 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 385232 -> 386128 bytes
 amdgpu/vega10_asd.bin            | Bin 180736 -> 184832 bytes
 amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega10_mec.bin            | Bin 268048 -> 268048 bytes
 amdgpu/vega10_mec2.bin           | Bin 268048 -> 268048 bytes
 amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega12_asd.bin            | Bin 180736 -> 188928 bytes
 amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega12_mec.bin            | Bin 268048 -> 268048 bytes
 amdgpu/vega12_mec2.bin           | Bin 268048 -> 268048 bytes
 amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega20_asd.bin            | Bin 180736 -> 184832 bytes
 amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega20_mec.bin            | Bin 268048 -> 268048 bytes
 amdgpu/vega20_mec2.bin           | Bin 268048 -> 268048 bytes
 amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin       | Bin 268720 -> 268720 bytes
 amdgpu/yellow_carp_mec2.bin      | Bin 268720 -> 268720 bytes
 amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 218112 -> 222208 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 571824 -> 575792 bytes
 189 files changed, 8 insertions(+)
 create mode 100644 amdgpu/gc_11_0_0_rlc_1.bin
 create mode 100644 amdgpu/gc_9_4_3_mec.bin
 create mode 100644 amdgpu/gc_9_4_3_rlc.bin
 create mode 100644 amdgpu/psp_13_0_6_sos.bin
 create mode 100644 amdgpu/psp_13_0_6_ta.bin
 create mode 100644 amdgpu/sdma_4_4_2.bin
 create mode 100644 amdgpu/smu_13_0_6.bin
 create mode 100644 amdgpu/vcn_4_0_3.bin
