Return-Path: <SRS0=g1Ya=NG=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113FBC27C52
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Jun 2024 17:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD851C32782; Tue,  4 Jun 2024 17:49:47 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50F69C2BBFC
	for <linux-firmware@kernel.org>; Tue,  4 Jun 2024 17:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50F69C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5cufzoNk5mPm3wntwWq2NaduxE4Fec6uSUDkBZAqEdb3mJVMD9UPNoDlyiZrG48yrxcPsEUnT8wmJdXzNf8JSamrq/MvjFcelvkVJrVW08bhIc7rJE2gxf7+Htp/qNMWkTorRy+mc2xk+3ff++FntY/gf3BWXdKCr9B3b4wKJ5zr0IoR7zM8yDIUEGgYh3Q8dn2gi/2FVtqmhHw42juBgyEXoDQ7HKJTr6o8PuqK8wPQNSd2DzyZsmXOILS8SB4mpxvd1HW5aR3Em5dQndkqD9Zylo5SfFRoNZ5LaloqSnzPIgoI49Uyw9zX0+OepwdLJV4Rjp9+CR5xQERBL8Wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKJsgbzE1kZH9a7WJ1bKev+yKVQLgMiy0UbBhSw4Zrs=;
 b=aLSM91KhTbbz7isYPgAifhkbwzdioPHrsYKXztNHJXfOTvXLEmV7ZCOhL8U+zKt6TDwYej3GoLRvPCfIBlyjvOt7IG0AEVr2GN37QFyTd31j3yQYJ0PQQ85lAEydUMNwRDDCjiU3Nkmo7r4ZNpEWfUO7tf9ieqpj47yegA6O5VNT0fYgeGiDJvlOgQbg+K7d8j/4S8Nd37/+jEigy1F2unM6G1YS0mDjd4ULgU8AHzCT6R0OYJtKN4eN/nFo8vh/7QbuQK62sK6jOFB4gC7czv6Nyz0wICpZVTVLQvEfwboFLlpVFsNmRIDzyzc9e4lDox7obwbeK9auBxLL7661Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKJsgbzE1kZH9a7WJ1bKev+yKVQLgMiy0UbBhSw4Zrs=;
 b=32pYVd4JfETCW0wKXaz3nysQpcctxxJT0cXs6AQdjC9NgZML3AOGlw/nZ+hfsNsNQ+qAqvmgwLK7DzQNNOBWKs+X+0JwkyTrVCzgHLHhEli+jPz1FmgVxmBXh3usFMujUDs+zQiJkPg9oz88PROzRsK2USVj9rqWOEi2SAcmTYA=
Received: from BY3PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:39a::13)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 17:49:37 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::26) by BY3PR03CA0008.outlook.office365.com
 (2603:10b6:a03:39a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31 via Frontend
 Transport; Tue, 4 Jun 2024 17:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 17:49:36 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 4 Jun
 2024 12:49:35 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <mario.limonciello@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu amd-2024-06-04
Date: Tue, 4 Jun 2024 13:49:16 -0400
Message-ID: <20240604174916.591045-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb09bd9-4bf1-4d68-869e-08dc84beb38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yp2FzJctUV/mSgomXQVNiusL/1hudUgEay05XGJ1LiepRtKA9NHRHSzVoF/8?=
 =?us-ascii?Q?xBjOKl2LnXWq7adIL5acAGb0PCzJ8qrSrMLJXsbGVNIcg21qaZ75H/9xneei?=
 =?us-ascii?Q?i3Jdi4shSyoIh7mFhoEJxOqRGsi9cAMLHJhmJLGpfjf3XtqvVcOTk4UrwjDj?=
 =?us-ascii?Q?TJt1MgAuZK2O7EhMfgJL5AsgpAKHbMguEsnD+6o5Fd3klTnrvgin9dc7G8YE?=
 =?us-ascii?Q?/BXu1jhWnhIcaVytseh6ILxvcDuEu+3FDYrFQNEJdY7tv68XNRD9NY+YuF/R?=
 =?us-ascii?Q?9hvlimGIp+it/ZeBHKBdfoizZ2F/izWrO5nCFqaoMHFloC9OzsmxkckkO6LR?=
 =?us-ascii?Q?ELvRZfTDaR4Yt+5iYpxMNyvf5lAVjCLmJLnzy78Y9+d5R8ux+1LFye1o7rMw?=
 =?us-ascii?Q?dV+QhxqwtGcS+p9mVSYeU1ND89ReXc/G8xK6b6e7CCKPnstxtg0XFFa4aO+z?=
 =?us-ascii?Q?/F9q5zrxWq6DtNZK7zr7ylFwVkEjgGqE88wI6aJmopkmM6zSLx0/qzvPybxR?=
 =?us-ascii?Q?esTXMtrI/qvNucchw3P6YVdbStUm/TNHt43JcLTT9wv6/mRfuE+RXc02eJLv?=
 =?us-ascii?Q?d2HfMuFzGT1dtQOfAyVo9seJEIXu8e2H9D3fOX5P1Jw5Mq40I/LBt8NjfJ7W?=
 =?us-ascii?Q?kzJgyrd3dRE7wlPgur9JIej9ukHXK7JySrNxTTNU2GQVBuzcVvhSIMjsH97G?=
 =?us-ascii?Q?oJBAAdcnMipyjiO19N+v5y2lnF5H25mTFmVN3ZbgRF0ICf6cbMtvvfges3dA?=
 =?us-ascii?Q?7ktLV+UKD1UZVAKLqmtDZ9W2WYDIRejRA7mkB/DXi3jeY83S79w0H0Z6OOAG?=
 =?us-ascii?Q?bfzs/oy25JdaPZV/fY2kyp+VQIWbKiDPuMZSKERVEGZcThZ0VRa6MMhOV+if?=
 =?us-ascii?Q?UHg7iLk144n7k8FVdIcn8643dEz1M9pTTOnVAFs8GY6EsJrbpEttW19FaXN+?=
 =?us-ascii?Q?n7Bmfz9hkdwpaLniisfHo0ZOaAndT9uWP+y1yLjCRA7XAKiUxlJTLHxsR6b3?=
 =?us-ascii?Q?nHxhhjwq4QGvGohl+rd1X0NTeP9JcmysjmHhRsk17JJwhSigPfxz1A9FNwts?=
 =?us-ascii?Q?83z3bgLXImWjDRHuWypvDjZE3vzoSgOiYoh46GZuCfRhZ6t0yPeSyLQOzr8g?=
 =?us-ascii?Q?dXF709bZsvsXdZjVcXTlY0Oes64f876PEudy74TKIDancWlzb/hepW1K/KBm?=
 =?us-ascii?Q?IqFiyu1wwbfa0ow8/RHaNfRchAiKuR9EZ6t23zx7eQhOGRDVTiplm4vY0PgJ?=
 =?us-ascii?Q?2slmVM8pJH/P6s3fbDbl65yblvS9RIWkeGxbyq2h8sU4kwCgRJjqghXdLTy6?=
 =?us-ascii?Q?WIqz/0F3FyoiNbPCB8bZGaqx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 17:49:36.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb09bd9-4bf1-4d68-869e-08dc84beb38e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233

Hi,

Updated AMD GPU firmwares.  Please apply.

Thanks,

The following changes since commit 904d39f11f26dc7124a6184cff3e5fb62d3d21c1:

  amdgpu: add support for PSP 14.0.1 (2024-05-30 11:32:55 -0500)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-06-04

for you to fetch changes up to 0fbdea28bb52cdbc85af18138baf8a4bb9970bf9:

  amdgpu: update yellow carp firmware (2024-06-04 13:31:50 -0400)

----------------------------------------------------------------
amd-2024-06-04:

amdgpu: update firmware

From internal git commit:
501adf8bb60cd0a75c4a3e3ed0f608697caa3b77

----------------------------------------------------------------
Alex Deucher (46):
      amdgpu: update aldebaran firmware
      amdgpu: update navi12 firmware
      amdgpu: update renoir firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update SMU 13.0.6 firmware
      amdgpu: update navi14 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update SDMA 6.0.1 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update green sardine firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update vangogh firmware
      amdgpu: update beige goby firmware
      amdgpu: update picasso firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update SDMA 6.0.0 firmware
      amdgpu: update smu 13.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update vega10 firmware
      amdgpu: update vega12 firmware
      amdgpu: update vega20 firmware
      amdgpu: update psp 13.0.8 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SDMA 6.0.3 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update raven firmware
      amdgpu: update raven2 firmware
      amdgpu: update navi10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SDMA 6.0.2 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update yellow carp firmware

 amdgpu/aldebaran_mec.bin        | Bin 268576 -> 268576 bytes
 amdgpu/aldebaran_mec2.bin       | Bin 268576 -> 268576 bytes
 amdgpu/aldebaran_vcn.bin        | Bin 422400 -> 422656 bytes
 amdgpu/beige_goby_smc.bin       | Bin 244934 -> 244934 bytes
 amdgpu/beige_goby_ta.bin        | Bin 238848 -> 238848 bytes
 amdgpu/beige_goby_vcn.bin       | Bin 586992 -> 587120 bytes
 amdgpu/dimgrey_cavefish_ta.bin  | Bin 238848 -> 238848 bytes
 amdgpu/dimgrey_cavefish_vcn.bin | Bin 586992 -> 587120 bytes
 amdgpu/gc_11_0_0_me.bin         | Bin 310768 -> 310768 bytes
 amdgpu/gc_11_0_0_mec.bin        | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_0_mes1.bin       | Bin 216928 -> 217088 bytes
 amdgpu/gc_11_0_0_mes_2.bin      | Bin 249872 -> 251552 bytes
 amdgpu/gc_11_0_0_pfp.bin        | Bin 229280 -> 229296 bytes
 amdgpu/gc_11_0_0_rlc.bin        | Bin 185248 -> 185248 bytes
 amdgpu/gc_11_0_0_rlc_1.bin      | Bin 185248 -> 185248 bytes
 amdgpu/gc_11_0_1_mes_2.bin      | Bin 246896 -> 251200 bytes
 amdgpu/gc_11_0_1_rlc.bin        | Bin 160592 -> 160368 bytes
 amdgpu/gc_11_0_2_me.bin         | Bin 310768 -> 310768 bytes
 amdgpu/gc_11_0_2_mec.bin        | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_2_mes1.bin       | Bin 217408 -> 217440 bytes
 amdgpu/gc_11_0_2_mes_2.bin      | Bin 249872 -> 251648 bytes
 amdgpu/gc_11_0_2_pfp.bin        | Bin 229296 -> 229296 bytes
 amdgpu/gc_11_0_2_rlc.bin        | Bin 178720 -> 178720 bytes
 amdgpu/gc_11_0_3_imu.bin        | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_3_me.bin         | Bin 310784 -> 310784 bytes
 amdgpu/gc_11_0_3_mec.bin        | Bin 407072 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin       | Bin 216992 -> 217152 bytes
 amdgpu/gc_11_0_3_mes_2.bin      | Bin 249936 -> 251616 bytes
 amdgpu/gc_11_0_3_pfp.bin        | Bin 229296 -> 229280 bytes
 amdgpu/gc_11_0_3_rlc.bin        | Bin 178976 -> 178976 bytes
 amdgpu/gc_11_0_4_mes_2.bin      | Bin 249472 -> 250528 bytes
 amdgpu/gc_11_0_4_rlc.bin        | Bin 158752 -> 158752 bytes
 amdgpu/gc_11_5_0_imu.bin        | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_0_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin        | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_5_0_mes1.bin       | Bin 233616 -> 233744 bytes
 amdgpu/gc_11_5_0_mes_2.bin      | Bin 249536 -> 251104 bytes
 amdgpu/gc_11_5_0_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_rlc.bin        | Bin 166528 -> 166528 bytes
 amdgpu/gc_9_4_3_mec.bin         | Bin 269200 -> 269200 bytes
 amdgpu/green_sardine_asd.bin    | Bin 193024 -> 193024 bytes
 amdgpu/green_sardine_ta.bin     | Bin 33536 -> 33536 bytes
 amdgpu/navi10_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/navi10_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi10_mec.bin           | Bin 268720 -> 268720 bytes
 amdgpu/navi10_mec2.bin          | Bin 268720 -> 268720 bytes
 amdgpu/navi10_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/navi10_ta.bin            | Bin 33536 -> 33536 bytes
 amdgpu/navi10_vcn.bin           | Bin 403392 -> 403776 bytes
 amdgpu/navi12_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/navi12_vcn.bin           | Bin 403392 -> 403776 bytes
 amdgpu/navi14_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/navi14_ta.bin            | Bin 33536 -> 33536 bytes
 amdgpu/navi14_vcn.bin           | Bin 403392 -> 403776 bytes
 amdgpu/navy_flounder_ta.bin     | Bin 238848 -> 238848 bytes
 amdgpu/navy_flounder_vcn.bin    | Bin 586992 -> 587120 bytes
 amdgpu/picasso_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/picasso_ta.bin           | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_0_ta.bin        | Bin 251136 -> 251136 bytes
 amdgpu/psp_13_0_10_sos.bin      | Bin 360352 -> 360352 bytes
 amdgpu/psp_13_0_10_ta.bin       | Bin 243136 -> 247232 bytes
 amdgpu/psp_13_0_11_ta.bin       | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_4_ta.bin        | Bin 234496 -> 234496 bytes
 amdgpu/psp_13_0_5_asd.bin       | Bin 193024 -> 193024 bytes
 amdgpu/psp_13_0_5_ta.bin        | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_6_sos.bin       | Bin 385312 -> 385312 bytes
 amdgpu/psp_13_0_7_sos.bin       | Bin 248496 -> 248496 bytes
 amdgpu/psp_13_0_7_ta.bin        | Bin 226304 -> 226304 bytes
 amdgpu/psp_13_0_8_ta.bin        | Bin 226304 -> 226304 bytes
 amdgpu/psp_14_0_0_ta.bin        | Bin 230400 -> 234496 bytes
 amdgpu/raven2_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/raven2_ta.bin            | Bin 33536 -> 33536 bytes
 amdgpu/raven_asd.bin            | Bin 193024 -> 193024 bytes
 amdgpu/raven_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/renoir_vcn.bin           | Bin 403392 -> 403776 bytes
 amdgpu/sdma_6_0_0.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_1.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_2.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_3.bin           | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_smc.bin   | Bin 247396 -> 247396 bytes
 amdgpu/sienna_cichlid_ta.bin    | Bin 366336 -> 366336 bytes
 amdgpu/sienna_cichlid_vcn.bin   | Bin 586992 -> 587120 bytes
 amdgpu/smu_13_0_0.bin           | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_10.bin          | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_6.bin           | Bin 2584 -> 2584 bytes
 amdgpu/vangogh_asd.bin          | Bin 193024 -> 193024 bytes
 amdgpu/vcn_3_1_2.bin            | Bin 579120 -> 579248 bytes
 amdgpu/vcn_4_0_0.bin            | Bin 389584 -> 390352 bytes
 amdgpu/vcn_4_0_2.bin            | Bin 389584 -> 391504 bytes
 amdgpu/vcn_4_0_4.bin            | Bin 389584 -> 391376 bytes
 amdgpu/vcn_4_0_5.bin            | Bin 388816 -> 389712 bytes
 amdgpu/vega10_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/vega12_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/vega20_asd.bin           | Bin 193024 -> 193024 bytes
 amdgpu/yellow_carp_ta.bin       | Bin 226304 -> 226304 bytes
 amdgpu/yellow_carp_vcn.bin      | Bin 579248 -> 579248 bytes
 98 files changed, 0 insertions(+), 0 deletions(-)
