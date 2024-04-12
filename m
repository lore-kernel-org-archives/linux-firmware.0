Return-Path: <SRS0=ff9R=LR=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A103C04FF9
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Apr 2024 04:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC413C2BD10; Fri, 12 Apr 2024 04:12:56 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2079.outbound.protection.outlook.com [40.107.101.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D3E6BC2BBFC
	for <linux-firmware@kernel.org>; Fri, 12 Apr 2024 04:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D3E6BC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw95xrNo0CdnlrED+hucadhqPpAGzwI0tX2bEIYu+G/WYJe9bVqXmTUuryd8EDNAVVv+YnYirDbzkw0FijX/hzzGav8a2JvTjjYo3ycvXApKeRY/OL/7JLvD4z0BI+oelNd3/L9yKiYYNukg7fE/j3FnM3+Y16cuSXjinKVd3Yv8QS6etQ3DXdm30JI2jl9dJl6c0FrOBo4Zz/6UrTYGdS+FfztsIdbpmu7GOIsAnPR1OC06OtlCtxZitWMD1y0r2U6XND50g6tRcWIEompMXUh48clNU+04bdCeRGH7JeVXpCOmcE55VXFL+h8LR2yiFPHTBxENLtGCXkIm6Uwt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz2A57WONRcJaTzmsowWJpdYSSNXzhFaGGWWUsBARwA=;
 b=LqCr+zIdvOabGv6BrT7p3uxCEkJHfOpsmHuWooiCzP6WEca+8t2h21nk/sjNOp6c80bL2GvKoBcqf0Ci52Ag5XHbmRkmeEV7JtWZ4LPiZFYvMMnr3abXHGVx3MB9pqDkI7I1+XGYMrp/gdBfm05q3CQAfL1Uv+elWKlktYK3uVvVTLiagIZDSx7zIHD+v7HOkO1aVwZ6FJ0l6hs4QaBqw/kJIdidZPW3NGqUy8c2RLYH1tzW5b0IgzOAO0SG7H7t1TzTeNXdtrCCiiP42GaTJEO+Ym9RvZIfzTx/BGF34ZuQhZ2AVrK7Dq35778IWwbROmoHA4QLyTqaoEwS1xb/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz2A57WONRcJaTzmsowWJpdYSSNXzhFaGGWWUsBARwA=;
 b=wfOgQP65NZVRVTAGXlZ7RjisYqytD0Ct0qPLjKT4eptQNao35GcDgzYvtpU2TkkdQL1TaL/GRDTHDZTP88f8At+ddTcuqpFNez9LvPDF81ie0rAGN93H1ltu2iGqbAKxZXWfh0SDV0prG4JyYqehePdJVaUPvJx7QfauMGZ6uIU=
Received: from BL1PR13CA0105.namprd13.prod.outlook.com (2603:10b6:208:2b9::20)
 by SA1PR12MB6919.namprd12.prod.outlook.com (2603:10b6:806:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 04:12:51 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::34) by BL1PR13CA0105.outlook.office365.com
 (2603:10b6:208:2b9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.12 via Frontend
 Transport; Fri, 12 Apr 2024 04:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 12 Apr 2024 04:12:51 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 23:12:50 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware amd-2024-04-12
Date: Fri, 12 Apr 2024 00:12:33 -0400
Message-ID: <20240412041233.913754-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|SA1PR12MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e70366-6982-4d9e-c9ca-08dc5aa6d1e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8SHa1YJ/O4Julasp9sDD5L4rLOMtKSJd+DuPZuOlfQoO0Rn0vDThTCq4ek63UTpOwi5plf/pR5/AEPd7KBujBq5xrv+JkT0PBGal19MGvL2vgTgW79YyGGw1RPFU9mbCoqXTN7bCYBxSgkzUcnvL1TxXNJcUR4hKvZTNsoRPvHFsdfJZ6412jAeKYmVYgqbH4bbNp8dLNS9X6cjLTfarT4V4BSdRHNZZBP/8gdwDe1NynAUu6sSWRqmazNMgFVwnU4VJ0QmmnKaqesFpz192NNZ5i58PJ8K381wW8ZhGR6vXiSLkROKp9OVlOIBzBcSmZpYO9Zg1L6FOIRhi8UxuiQIsDmlm0ZhEa+7qXWANlOrbg8KCSwP0blchhlJ15RxXRVZOj12LZdCtcEJrSJbUlb28uSN4HyqAvg832oLFcBhlZO3akE/1nwD+I7hMTzIcDZ5/mjH8ACjL+r/le/Xsk4Y4iock7MuX9ZAv9AiDeG3YKgBIDQfkw6wQkzFjqgMfOP8dG44UCA4i7uAWEuaH7gQc2Hq+qECayhRGoow0sDo1l0W2xNOl1omIMYyClrxGomuoLeSWqXldJIcr/w/377lGSAY16vJQrSTpDSDcXlpk8xkuqoKIrRgQw1pKTGJnhSokrY2Psd+PwOXOn0jT944BNOn7AGjmy+ODNIgeShdMZwBXiUl2v8m28xSzu6eFsn0kytpR+CaMW0s6s661hg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 04:12:51.1867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e70366-6982-4d9e-c9ca-08dc5aa6d1e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6919

Hi,

Updated AMD GPU firmwares.

The following changes since commit d9876ab4e6943640f497f314679db341821bcfe2:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-03-25 22:30:12 +0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-04-12

for you to fetch changes up to 08c8fb2e3eee58aaaea6f2417d407aeb6a23d2c4:

  amdgpu: update beige goby firmware (2024-04-12 00:05:22 -0400)

----------------------------------------------------------------
amd-2024-04-12:

update firmware from internal git commit:
2bccf1a6d5d71a9bfc01d8f746dea73dacddca4e

----------------------------------------------------------------
Alex Deucher (48):
      amdgpu: update gc 10.3.7 firmware
      amdgpu: update psp 13.0.8 firmware
      amdgpu: update aldebaran firmware
      amdgpu: update  firmware
      amdgpu: update gc 11.0.0 firmware
      amdgpu: update psp 13.0.0 firmware
      amdgpu: update sdma 6.0.0 firmware
      amdgpu: update smu 13.0.0 firmware
      amdgpu: update vcn 4.0.0 firmware
      amdgpu: update gc 9.4.3 firmware
      amdgpu: update psp 13.0.6 firmware
      amdgpu: update smu 13.0.6 firmware
      amdgpu: update vcn 4.0.3 firmware
      amdgpu: update navi10 firmware
      amdgpu: update vangogh firmware
      amdgpu: update arcturus firmware
      amdgpu: update navi12 firmware
      amdgpu: update gc 10.3.6 firmware
      amdgpu: update psp 13.0.5 firmware
      amdgpu: update vcn 3.1.2 firmware
      amdgpu: update gc 11.0.3 firmware
      amdgpu: update psp 13.0.10 firmware
      amdgpu: update sdma 6.0.3 firmware
      amdgpu: update smu 13.0.10 firmware
      amdgpu: update navi14 firmware
      amdgpu: update raven firmware
      amdgpu: update vega10 firmware
      amdgpu: update gc 11.0.2 firmware
      amdgpu: update ipsp 13.0.7 firmware
      amdgpu: update sdma 6.0.2 firmware
      amdgpu: update smu 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update raven2 firmware
      amdgpu: update vega12 firmware
      amdgpu: update green sardine firmware
      amdgpu: update yellow carp firmware
      amdgpu: update vega20 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update gc 11.0.1 firmware
      amdgpu: update psp 13.0.4 firmware
      amdgpu: update sdma 6.0.1 firmware
      amdgpu: update vcn 4.0.2 firmware
      amdgpu: update renoir firmware
      amdgpu: update navy flounder firmware
      amdgpu: update gc 11.0.4 firmware
      amdgpu: update psp 13.0.11 firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update beige goby firmware

 amdgpu/aldebaran_mec.bin         | Bin 268576 -> 268576 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268576 -> 268576 bytes
 amdgpu/arcturus_mec.bin          | Bin 268576 -> 268560 bytes
 amdgpu/arcturus_mec2.bin         | Bin 268576 -> 268560 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268720 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268720 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin         | Bin 234752 -> 238848 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 583536 -> 586992 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268720 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268720 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 234752 -> 238848 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 583536 -> 586992 bytes
 amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_6_mec.bin         | Bin 268592 -> 268720 bytes
 amdgpu/gc_10_3_6_mec2.bin        | Bin 268592 -> 268720 bytes
 amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_7_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_7_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_7_mec.bin         | Bin 268592 -> 268720 bytes
 amdgpu/gc_10_3_7_mec2.bin        | Bin 268592 -> 268720 bytes
 amdgpu/gc_10_3_7_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_0_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 379952 -> 310768 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 216032 -> 216928 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 242512 -> 249872 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 229152 -> 229280 bytes
 amdgpu/gc_11_0_0_rlc.bin         | Bin 185248 -> 185248 bytes
 amdgpu/gc_11_0_0_rlc_1.bin       | Bin 185248 -> 185248 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268640 -> 268704 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 244016 -> 246896 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_rlc.bin         | Bin 160592 -> 160592 bytes
 amdgpu/gc_11_0_2_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 379952 -> 310768 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 217184 -> 217408 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 244144 -> 249872 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 229024 -> 229296 bytes
 amdgpu/gc_11_0_2_rlc.bin         | Bin 178720 -> 178720 bytes
 amdgpu/gc_11_0_3_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 379968 -> 310784 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 216928 -> 216992 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 244208 -> 249936 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 229024 -> 229296 bytes
 amdgpu/gc_11_0_3_rlc.bin         | Bin 178976 -> 178976 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268704 -> 268640 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 242384 -> 249472 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_rlc.bin         | Bin 158752 -> 158752 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 269200 -> 269200 bytes
 amdgpu/gc_9_4_3_rlc.bin          | Bin 48076 -> 48076 bytes
 amdgpu/green_sardine_asd.bin     | Bin 188928 -> 193024 bytes
 amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
 amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
 amdgpu/green_sardine_mec.bin     | Bin 268048 -> 268064 bytes
 amdgpu/green_sardine_mec2.bin    | Bin 268048 -> 268064 bytes
 amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
 amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
 amdgpu/green_sardine_vcn.bin     | Bin 403392 -> 403392 bytes
 amdgpu/navi10_asd.bin            | Bin 188928 -> 193024 bytes
 amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi10_mec.bin            | Bin 268592 -> 268720 bytes
 amdgpu/navi10_mec2.bin           | Bin 268592 -> 268720 bytes
 amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
 amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi12_asd.bin            | Bin 188928 -> 193024 bytes
 amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi12_mec.bin            | Bin 268592 -> 268720 bytes
 amdgpu/navi12_mec2.bin           | Bin 268592 -> 268720 bytes
 amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi12_vcn.bin            | Bin 403392 -> 403392 bytes
 amdgpu/navi14_asd.bin            | Bin 188928 -> 193024 bytes
 amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268720 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268720 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_sos.bin     | Bin 218608 -> 218608 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 234752 -> 238848 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 583536 -> 586992 bytes
 amdgpu/picasso_asd.bin           | Bin 188928 -> 193024 bytes
 amdgpu/picasso_ce.bin            | Bin 9344 -> 9344 bytes
 amdgpu/picasso_me.bin            | Bin 17536 -> 17536 bytes
 amdgpu/picasso_mec.bin           | Bin 268048 -> 268064 bytes
 amdgpu/picasso_mec2.bin          | Bin 268048 -> 268064 bytes
 amdgpu/picasso_pfp.bin           | Bin 21632 -> 21632 bytes
 amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 242944 -> 251136 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 360352 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 235392 -> 243136 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 226304 -> 234496 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 230400 -> 234496 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 188928 -> 193024 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 222208 -> 226304 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 385056 -> 385312 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 63808 -> 67904 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 222208 -> 226304 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 222208 -> 226304 bytes
 amdgpu/raven2_asd.bin            | Bin 184832 -> 193024 bytes
 amdgpu/raven2_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/raven2_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/raven2_mec.bin            | Bin 268048 -> 268064 bytes
 amdgpu/raven2_mec2.bin           | Bin 268048 -> 268064 bytes
 amdgpu/raven2_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/raven2_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/raven_asd.bin             | Bin 188928 -> 193024 bytes
 amdgpu/raven_ce.bin              | Bin 9344 -> 9344 bytes
 amdgpu/raven_me.bin              | Bin 17536 -> 17536 bytes
 amdgpu/raven_mec.bin             | Bin 268048 -> 268064 bytes
 amdgpu/raven_mec2.bin            | Bin 268048 -> 268064 bytes
 amdgpu/raven_pfp.bin             | Bin 21632 -> 21632 bytes
 amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin            | Bin 188928 -> 193024 bytes
 amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/renoir_mec.bin            | Bin 268048 -> 268064 bytes
 amdgpu/renoir_mec2.bin           | Bin 268048 -> 268064 bytes
 amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
 amdgpu/renoir_vcn.bin            | Bin 403392 -> 403392 bytes
 amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268720 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268720 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 362240 -> 366336 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 583536 -> 586992 bytes
 amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_6.bin            | Bin 2584 -> 2584 bytes
 amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
 amdgpu/vangogh_asd.bin           | Bin 188928 -> 193024 bytes
 amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin           | Bin 268720 -> 268720 bytes
 amdgpu/vangogh_mec2.bin          | Bin 268720 -> 268720 bytes
 amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 575792 -> 579120 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 387792 -> 389584 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 387792 -> 389584 bytes
 amdgpu/vcn_4_0_3.bin             | Bin 384720 -> 389456 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 387792 -> 389584 bytes
 amdgpu/vega10_asd.bin            | Bin 184832 -> 193024 bytes
 amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega10_mec.bin            | Bin 268048 -> 268064 bytes
 amdgpu/vega10_mec2.bin           | Bin 268048 -> 268064 bytes
 amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega12_asd.bin            | Bin 188928 -> 193024 bytes
 amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega12_mec.bin            | Bin 268048 -> 268064 bytes
 amdgpu/vega12_mec2.bin           | Bin 268048 -> 268064 bytes
 amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega20_asd.bin            | Bin 184832 -> 193024 bytes
 amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega20_mec.bin            | Bin 268048 -> 268064 bytes
 amdgpu/vega20_mec2.bin           | Bin 268048 -> 268064 bytes
 amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin       | Bin 268720 -> 268720 bytes
 amdgpu/yellow_carp_mec2.bin      | Bin 268720 -> 268720 bytes
 amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 222208 -> 226304 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 575792 -> 579248 bytes
 188 files changed, 0 insertions(+), 0 deletions(-)
