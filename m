Return-Path: <SRS0=YKXe=33=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F74CAC5A6
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Sep 2025 21:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3817C4CEFA; Tue, 16 Sep 2025 21:19:49 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A3C0C4CEEB
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 21:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A3C0C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDteFz95NKRzb5ym6yRWYijb0P8uigXyD+BZP5BPb09VnR4B075Tw65ZlXvuZ3rzX6mqJoNMBltb//JdM9EqGfwspAjmvI5EeWedimQwwQIj4zdqEq6qQPT9FUHVkUcQrQ19OnJCBueHgIpYDr4gZ3g+k9rP6/Oyy/s4wVTpfJuXYQ+XKpQmNyGIr7aZktFfBeb90+fD6V83TAiUDNmVHqBEIJSvQI/e/t3C7df5x03rizskab8PnMD6BePXMYLNG84GTnH/JK95BawgvpqndF/VJsyjkkomFnl0V2zWGyjQhRla8dfu7Tzj/KsK4Cmdldkxg/auLdeVYKM+rFuk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDuHMsFjDZP7RH1vDV4IwFYJIvnAbKoxMD0ddMXigF8=;
 b=t1uHu9fOmIpcSwepmrnICU3Bcb2gQM9VVGI3cIwNUajB51znW7WzH42xhsr55MoIYV2ogJEsqmSDzmH95egTTj3zdLWyizY6/fY99ZrVQ02FjNuZAtgM3VMjUKMXopaHkQbdbJF9SaQ6W2acFZTuV5wVzx5bb64z5uz5WLPI2UaXKmG7qPlGGqcbO+EOdNimAA8/wIqrMOdkdjP9cMo+X8lTBzZN39xZlbH4u1QEqw9h0rbSOvGBzELL4k3TxaqZPS70NfoJ5huFG3Kt6hqz2/8LXTgS0Cg/jOirJ0mo1bwxQqCUe/G3kV0avYfplMJYXqrTHZCMn/fE3UxTruCxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDuHMsFjDZP7RH1vDV4IwFYJIvnAbKoxMD0ddMXigF8=;
 b=QthDzHo+Ltb0s7nV3DiWBsG2wc+ScQoUZJmPmIuyWwt9i3RwbSNCDRJn4y7Gg2BP42LYkH92dMeIZTN/M+WArf9RUPpAR9Y8deLkWji0AnB9/4i9xmp7wuwx4fhJxaHkHhZDrqbYYlZo+Zq4oz4AURVSZlBWE4KCK+H/FOBq6F0=
Received: from SJ0PR05CA0172.namprd05.prod.outlook.com (2603:10b6:a03:339::27)
 by LV3PR12MB9216.namprd12.prod.outlook.com (2603:10b6:408:1a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 21:19:41 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::5e) by SJ0PR05CA0172.outlook.office365.com
 (2603:10b6:a03:339::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.11 via Frontend Transport; Tue,
 16 Sep 2025 21:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 21:19:41 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Sep
 2025 14:19:40 -0700
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware update
Date: Tue, 16 Sep 2025 17:19:26 -0400
Message-ID: <20250916211926.946502-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|LV3PR12MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc09cdb-7b69-442d-05f2-08ddf566bffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GuQStQiGb8s9NY62ZAmntzZgBO65kymO/TNeqyZqjDj1AQUk1LvWKdOdhxs2?=
 =?us-ascii?Q?rSCbZSFWh+Wip1GgoBKHdr/9olVJV5oyJdtBPGeziCrzxwciJg3MSFRlSMWv?=
 =?us-ascii?Q?9DCKm5yQuylGozmYQgyf6S/4+JGzvKzRllQjHtRBnyTYAFyMcioob6oUAw5Z?=
 =?us-ascii?Q?ZqnbBPn7eqVvC8AjtdbrE1HXziUI25kVHRCoLDwpNugGbvaundA2fRBORyIV?=
 =?us-ascii?Q?mZ1e8U44WjDllNApZu3Cu288aJkdisrCS4g1na+ZaXgRaIcPgfYH92H/97Dy?=
 =?us-ascii?Q?Q9+FaEwFU7+8AEtsPirll9eKXW5Fmp1x8Kjf+cBmtU++r3NK8uLQOo/drzYH?=
 =?us-ascii?Q?BvZkgPSZAfSP03DUXqUwE7MnjudD5EUmbl9nBooIfySehdozpnK9s/xj9s3t?=
 =?us-ascii?Q?Qf1vMdv66l/Im0+HgSiMj+N9VNvwVab+2HFci17Ul+vclIL5iXfQOEanAijn?=
 =?us-ascii?Q?A23N4B/tMhmHIevC4PO2lAuZy3nL14GMPky7K1MF9qcRU9kdghSYW9h53aJL?=
 =?us-ascii?Q?u9nEu9VL0Udnt07sFSLpGBk24tQzmsB/snVxzJnX4rIWeDTpsvO+ehZFJG9r?=
 =?us-ascii?Q?VRz5JwA6VmHxSiydkKCOdKHBNFSC9zqYL2EZRo6k4Jpy/MaFo078YKYawjV9?=
 =?us-ascii?Q?bW+1j2w70sTUjdY601UlJ77g/lJ8p8dQS0pRu6sn4y8sx1a/X7nAorVnhFlZ?=
 =?us-ascii?Q?VaGwpzDyiGdnJNIiLgkul6xlSWGzV/+CdVcM0qU4PwfZoL727OOjCcJBMEw+?=
 =?us-ascii?Q?uDMPHHP754J8lwuH8Eu1JOvCqx76Nr52eSnXK9M/4GjFjEo87UaCiBb5YKHr?=
 =?us-ascii?Q?HJrPUw6TkQToZpnQiDCnQCZ9yW9YpXeDvbZVoRHTL4hdtOL9B14RhaGO54AW?=
 =?us-ascii?Q?e2jvgSEDPE2KwB8Bks9WoPbemPgNaharqCjjbhthlLqY+tEIi+GctU8l92IU?=
 =?us-ascii?Q?59rzY1ximnhJYa+LHbO7e848x4OmPuFebfLiG6XagXo0+WLR0Ztrz1ZlaJ3y?=
 =?us-ascii?Q?FfPuCgjgvUGjkfTdt9nMP8ifnJV5j6MhHp8SsohJ/fIxCmu7wyrqdr+EiDik?=
 =?us-ascii?Q?wQSa+FN2CqM3EK7FerY5xaSwjM5nHOgXkYWTUJDaZeksRSE3o4c4g0rIFbpJ?=
 =?us-ascii?Q?PPEvm5ARRzOWqI5vh3LzzPCZO3NNw+oWhzWGB6jopdutT50r4mDW4mR7uLrN?=
 =?us-ascii?Q?APiwYYacEFPoeoUlDSs7ijMX2k8zU+HO6A7Ru1+fDjAf6cgmHheK1yLTN0L2?=
 =?us-ascii?Q?shig56FTESJjV8Lfpdr5R0p9wx0qAAoOrBwhSIfUKRNHUdJxJlcjuyzLxCry?=
 =?us-ascii?Q?1YZY0lg1DWqQM/osO6ScAXkSKQ2hLivjYnfZm9qgvGSEFK3qdhX5hlrJK+bo?=
 =?us-ascii?Q?j9tQpE+T+7nMrET6xu9Hs9mskoJgwJHrnNzBZ/ycmGU1OuwaqEvPyI8pseI2?=
 =?us-ascii?Q?ia7uF4S0H//G3jJkgObfemGFCV2+C8dEcd65QTY1IFjxjt6tHlST14VHBIPg?=
 =?us-ascii?Q?/iqDrzv6t3UMQ3Bhu6loXBIUKwoNfajsNMfL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 21:19:41.1692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc09cdb-7b69-442d-05f2-08ddf566bffe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9216

Hi,

Updated amdgpu firmware.

The following changes since commit ba7d706f9cf6e65e9956e65ac44906a78a790a02:

  amdgpu: DMCUB updates for various ASICs (2025-09-12 10:26:04 +0800)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2025-09-16-2

for you to fetch changes up to e3f70d8475399faae930b8180f88bde4d404b451:

  amdgpu: update PSP 14.0.3 kicker firmware (2025-09-16 17:12:48 -0400)

----------------------------------------------------------------
amd-2025-09-16-2:

Update amdgpu firmware.

----------------------------------------------------------------
Alex Deucher (63):
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update VCN 4.0.3 firmware
      amdgpu: update green sardine firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update VPE 6.1.3 firmware
      amdgpu: update GC 11.5.3 firmware
      amdgpu: update PSP 14.0.5 firmware
      amdgpu: update SDMA 6.1.3 firmware
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
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update beige goby firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update SMU 13.0.0 firmware
      amdgpu: update SDMA 6.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update PSP 13.0.0 kicker firmware
      amdgpu: update SMU 13.0.0 kicker firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update SMU 14.0.2 firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update VCN 5.0.0 firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update GC 10.3.6 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update renoir firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VPE 6.1.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update vangogh firmware
      amdgpu: update vega10 firmware
      amdgpu: update vega12 firmware
      amdgpu: update vega20 firmware
      amdgpu: update PSP 14.0.3 kicker firmware

 amdgpu/beige_goby_ta.bin         | Bin 247040 -> 251136 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 580080 -> 580112 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 247040 -> 251136 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580080 -> 580112 bytes
 amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_6_mec.bin         | Bin 268592 -> 268592 bytes
 amdgpu/gc_10_3_6_mec2.bin        | Bin 268592 -> 268592 bytes
 amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 314512 -> 314512 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 218240 -> 218240 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 257056 -> 257344 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 230976 -> 231008 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268640 -> 268160 bytes
 amdgpu/gc_11_0_1_mes1.bin        | Bin 231440 -> 232816 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 256448 -> 257312 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_rlc.bin         | Bin 157040 -> 157040 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 314496 -> 314496 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 218560 -> 218560 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 257056 -> 257344 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 230992 -> 231008 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 314512 -> 314512 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 218336 -> 218336 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 257120 -> 257408 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 230992 -> 231008 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268640 -> 268160 bytes
 amdgpu/gc_11_0_4_mes1.bin        | Bin 230736 -> 232080 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 256448 -> 256704 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_rlc.bin         | Bin 159152 -> 159152 bytes
 amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_0_mes1.bin        | Bin 233776 -> 235664 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 256512 -> 257184 bytes
 amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_1_mes1.bin        | Bin 233936 -> 235856 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 256800 -> 257440 bytes
 amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_2_mes1.bin        | Bin 234288 -> 234992 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 256704 -> 256960 bytes
 amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_5_3_mes1.bin        | Bin 234288 -> 234992 bytes
 amdgpu/gc_11_5_3_mes_2.bin       | Bin 256000 -> 256960 bytes
 amdgpu/gc_11_5_3_rlc.bin         | Bin 162064 -> 162064 bytes
 amdgpu/gc_12_0_0_me.bin          | Bin 466592 -> 467488 bytes
 amdgpu/gc_12_0_0_mec.bin         | Bin 447456 -> 451552 bytes
 amdgpu/gc_12_0_0_pfp.bin         | Bin 351984 -> 352048 bytes
 amdgpu/gc_12_0_0_uni_mes.bin     | Bin 721824 -> 723328 bytes
 amdgpu/gc_12_0_1_me.bin          | Bin 466592 -> 467488 bytes
 amdgpu/gc_12_0_1_mec.bin         | Bin 447456 -> 451552 bytes
 amdgpu/gc_12_0_1_pfp.bin         | Bin 351984 -> 352048 bytes
 amdgpu/gc_12_0_1_uni_mes.bin     | Bin 721824 -> 723328 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_rlc.bin          | Bin 38700 -> 38700 bytes
 amdgpu/green_sardine_asd.bin     | Bin 193024 -> 201216 bytes
 amdgpu/green_sardine_vcn.bin     | Bin 403904 -> 404288 bytes
 amdgpu/navi10_asd.bin            | Bin 197120 -> 201216 bytes
 amdgpu/navi10_sos.bin            | Bin 184512 -> 184512 bytes
 amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi12_asd.bin            | Bin 197120 -> 201216 bytes
 amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi14_asd.bin            | Bin 197120 -> 201216 bytes
 amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navy_flounder_sos.bin     | Bin 222704 -> 222704 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 247040 -> 251136 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 580080 -> 580112 bytes
 amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 259328 -> 263424 bytes
 amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 353728 -> 259520 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 340992 -> 246784 bytes
 amdgpu/psp_13_0_12_sos.bin       | Bin 410416 -> 410416 bytes
 amdgpu/psp_13_0_14_ta.bin        | Bin 67904 -> 67904 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 340992 -> 246784 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 197120 -> 201216 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 234496 -> 238592 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
 amdgpu/psp_13_0_6_ta.bin         | Bin 88960 -> 88960 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 234496 -> 238592 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 238592 -> 246784 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 340992 -> 246784 bytes
 amdgpu/psp_14_0_2_sos.bin        | Bin 421216 -> 421216 bytes
 amdgpu/psp_14_0_2_ta.bin         | Bin 372816 -> 266208 bytes
 amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
 amdgpu/psp_14_0_3_sos_kicker.bin | Bin 435968 -> 435968 bytes
 amdgpu/psp_14_0_3_ta.bin         | Bin 385424 -> 278816 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 340992 -> 246784 bytes
 amdgpu/psp_14_0_5_ta.bin         | Bin 238592 -> 246784 bytes
 amdgpu/psp_14_0_5_toc.bin        | Bin 2560 -> 2560 bytes
 amdgpu/renoir_asd.bin            | Bin 197120 -> 201216 bytes
 amdgpu/renoir_ta.bin             | Bin 41984 -> 46080 bytes
 amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 374528 -> 378624 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 580080 -> 580112 bytes
 amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_0_kicker.bin     | Bin 261888 -> 261888 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
 amdgpu/vangogh_asd.bin           | Bin 197120 -> 201216 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 572368 -> 572368 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_3.bin             | Bin 359760 -> 359696 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 395664 bytes
 amdgpu/vcn_5_0_0.bin             | Bin 434768 -> 439824 bytes
 amdgpu/vcn_5_0_1.bin             | Bin 208144 -> 211280 bytes
 amdgpu/vega10_asd.bin            | Bin 197120 -> 201216 bytes
 amdgpu/vega12_asd.bin            | Bin 197120 -> 201216 bytes
 amdgpu/vega20_asd.bin            | Bin 197120 -> 201216 bytes
 amdgpu/vpe_6_1_0.bin             | Bin 25984 -> 25984 bytes
 amdgpu/vpe_6_1_3.bin             | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_rlc.bin       | Bin 178128 -> 178128 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 234496 -> 238592 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 572368 bytes
 132 files changed, 0 insertions(+), 0 deletions(-)
