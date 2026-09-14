Return-Path: <SRS0=PdCi=HG=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A6BC88E72
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Sep 2026 21:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB7F31F00898; Mon, 14 Sep 2026 21:04:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789419878;
	b=Wjnlh0CBk3RvjIVGTsrxSv5lJlS8JIQdts7YfSnQaNNSsUEHZhHWFWZZ6n+iPvVpYPIG
	 W0kE63ypNo/iHHw0cAYKFdccZci6jP21TIcnzUeSyjYQFV4MAJi0HI8/MwaxO4H0qNsv6
	 jj6vs9v5LpqVv1lwcZnncJWMmJJCLSxy6wUgZBsdsS5fgk1vlPyae/dmdyY7bF2rYIRYy
	 edN0dlcur9N52R8jEmcGTg9d/Z/HSk2XGoDzmM5u5FLWS4PD2txJDdYavUBqExWCN3z5p
	 Swn4CW+FeW2bWJIY03oOM2UvRxlVdQQC8YsaO0gcCkwZJYZoSyUp25Sl3/nKz0xu8AQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789419878;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dumr9m71o7+A+3ys5+1xGsC0LO+tgeII6/MEXP9bS+w=;
	b=aHiylpMYjmRSoyS5CeuKK++2vJ/xON8xF9H/zERX2epuen8LSjkHGYrffiDW4JBPXGHu
	 j++EElbQyK7z4vvxD/zjqg5TQvOaEYgn9xfBwMDjNj9w5ltDKonYWMpa67CxKAKriuyJ7
	 bM69pmYlrlVmH9CdsAP4vOlUhqKUXCVB5W9RgSxiokRJTScsSxvL2jkNJBO8c9FBDVNA9
	 jMk0pphAidnGgIC3CeaZYIKmr8sH/qNnjLXEur5HvBKT8c7CxC3haPIxM0Xb0ebOhp3/9
	 /ZBTeTFZ6ZCrfCyXFfWWz+cdqiswRqdDYNtqN78f//1lMj9EXbNvM7lTsrupwE4R5bQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q6DAfoMI;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.25
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010025.outbound.protection.outlook.com [52.101.56.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED8471F000FF
	for <linux-firmware@kernel.org>; Mon, 14 Sep 2026 21:04:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q6DAfoMI
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org ED8471F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjdmAg0QguHOjW9FZG4X6oEGzicb70XSWMazgoY1nZ0rYNgZczHZgRspdNwOCKlvxN71P5moza1AWG/rJl5ul/6AHbAUoOs77kIBriO++HVC4KeN2L/Mj2LdGMCLMp0RnxQskg6zr0W+PXm8NeR90WYixukLixJYZJGb6vF5DKGhHI9VfRC3tJccj2xZR4P1i+VbLYzcdxOJxuQrkXjEL0auVz+kgr4YIrQCY8QuZ10E1e5QQQicTblaWx12wvxoAeq0BkSVi1vlSWVwTov3nlIcBtO6j2kky8oa/F14PbfC0xHTkX7HmI47vK7aGshJHpEB+GFf1GhsyHreu/5B4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dumr9m71o7+A+3ys5+1xGsC0LO+tgeII6/MEXP9bS+w=;
 b=JeUN6kBdcwzc1m0YPER3xZL5KWgt8M6BMTa5k/tDeDtLA0XBWafiD6N5dDOh+POZIG6Et1Dplsw4GhZiCGHZv7/Mn3YdtfAj1O9PSTwB2MC0xsOGaI8E6jB099yiXqfF9qtrVmVpTekE0aPWz4LfQS4aJj3QERsm1aCdRoCDGH6zvM7na17DVnWi8GVEhHXnLtO67L/MzVcUaMxp+0t4vGxHq5pPmBaUbgdenpTGNhrUPHSQcxThQi/ytb+2TRq2WC+BLEmPltsyWaC55Yt6LRNhmYUOXL5SmMVdii92KIF1sxad3c4vn3UESGSberHasZzkgU1FngHfYRDKoB0V6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dumr9m71o7+A+3ys5+1xGsC0LO+tgeII6/MEXP9bS+w=;
 b=Q6DAfoMI/mcUHyn3iphyVZ1YLhZNjlMSFpnjrtdInFu6EFkFZvHBmWxpbntRMnDNKO8AU/6yM5sOXkEhQd26NUICzs3ubwe1o5Ze4VOCH3b9pStqeZUjdMd+WTeSoFyQBUe0VhmzaeKCVRHw73SzGBcYNEY8RQAM5igQwZz7rcU=
Received: from SJ0PR05CA0060.namprd05.prod.outlook.com (2603:10b6:a03:33f::35)
 by CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:04:23 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::48) by SJ0PR05CA0060.outlook.office365.com
 (2603:10b6:a03:33f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Mon, 14
 Sep 2026 21:04:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 21:04:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 16:04:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 16:04:22 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 14 Sep 2026 16:04:21 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu VCN firmware update
Date: Mon, 14 Sep 2026 17:04:08 -0400
Message-ID: <20260914210408.1809640-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: d075e7e6-2d33-43de-29a9-08df12a3c084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|13003099007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fy83qhHqp3GmSjhWqOF2bQ5T9VWq7KZjiqGBTB/0osWVJT9LuxZgZ0UjLtPFhrUMc5C0qDlK1sUcUq+UTCbX2Cj/43P7Uic+nDr8mkXx57Ey7M83y5cFcmIBUNrUDocC84riL5XN223269kUM7RepbaC+EsnqgGvMSS16X+6w8regPZIARsmmxUMr1ji0u8k304gpGiuQJl1F32c3uT9r6jAA7Ws14OtsxZDPFa3vELIcZC1ILzI1RTiQCTxpdElqcaT9WKQdp/Pems6HEXdYWEvdiYIv8hOIupgGKhx9Y44yP+2RKv2bVO9BFzFYl6umnRr7sIRsS3vV5VHAIQthO5yvBw099vataEmcNuU/7coKfNFfiHZLXJ313sYWpzZ7oFmW3oICMu5zwQOvpMpg1CoT8oK8G0+OjL7eQl3/yDxC9ueSdQTgFPMIyD2tmUmV4oCIxz9MVpI8AYjVKFsk/a3XpDbngR4jolVDZU7qYYaxBgEjYmSsHZ3kAjYH1l882quLTLRzujfCsl6JzxepyAmCbJevnKDdviXkcskgOt5zx0IFN1axCwOPmdYOBXO8VtwozansGp7IkVaLrcBePOdXbLbJiLjMBfhhQLmHwL3W2N+qvwutWPndQxO1LIeB//5zEno8epCWqjdZtOMK3320bo0aKLaoGZJLBjR5ok=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(13003099007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jQvn4BwORq7AZiTjFGxM540/yQJpAoxrKhPBOtKzZ3luJtikoPt8YZZGtqEPw2rlO6vY5ye/ibu82XSPgqcdnD1Rz7H16ZUF03XLMxQB48gP5AUKKfcgr+BosomXwTROpFDA3Y9Bo2uWJIL7vhjGpTYY7tqwLvy+Ws/SWfQ/p/Exg4yMtUO+WrCEPBD6JqXik7IHT6cY9+3pkFXVHyaKcuXQQW1FYH/37XJxVBIoI28sBLoC7FuJJe+0zAOd0E9ABcaPBZHuQ3MS5T4nj1vPI/mS/mAawcW57l+mq4OIumVOUJTQx6zBVN/CZsh9vCi6fp6FED8OGo4Ro83sF1CrrP5S0u0r3aGsvsK42wLgIc1xntSNpWlJ9FoXCKN6ivOEf9gG0uhwbS8ZpxJs5osAZy3Tti8/GfRC+iPR/yFYg/LGtrQhr+UeCdkJGbMlIUTJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:04:22.7653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d075e7e6-2d33-43de-29a9-08df12a3c084
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528

Revert VCN 3.x+ firmwares to fix a compatibility issue with certain
videos on older versions of mesa.  See:
https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16090

The following changes since commit a9f025fe99e7159c03879ff951e1a2a72686d884:

  Partially revert "amdgpu: DMCUB updates for various ASICs" (2026-09-14 13:49:40 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-09-14-2

for you to fetch changes up to 2f5e3da8d1da6cf0c8a8090b1f5edb145d8db9de:

  Revert "amdgpu: update VCN 5.3.0 firmware" (2026-09-14 16:53:16 -0400)

----------------------------------------------------------------
amdgpu firmware update

Revert VCN 3.x+ firmwares to fix a compatibility
issue with mesa for certain types of videos.

See:
https://gitlab.freedesktop.org/mesa/mesa/-/work_items/16090

----------------------------------------------------------------
Alex Deucher (19):
      amdgpu: partially revert 063e840eb6a5
      amdgpu: partially revert 17ee8fdf9196
      amdgpu: partially revert 7b262e1ddce5
      amdgpu: partially revert 7df10898a825
      amdgpu: partially revert e3e45091597e
      amdgpu: partially revert 9f1eb5124635
      Revert "amdgpu: update VCN 3.1.2 firmware"
      Revert "amdgpu: update VCN 4.0.0 firmware"
      Revert "amdgpu: update VCN 4.0.2 firmware"
      Revert "amdgpu: update VCN 4.0.2 firmware"
      Revert "amdgpu: update VCN 4.0.3 firmware"
      Revert "amdgpu: update vcn 4.0.4 firmware"
      Revert "amdgpu: update VCN 4.0.5 firmware"
      Revert "amdgpu: update VCN 4.0.5 firmware"
      Revert "amdgpu: update VCN 4.0.6 firmware"
      Revert "amdgpu: update VCN 4.0.6 firmware"
      Revert "amdgpu: update VCN 5.0.0 firmware"
      Revert "amdgpu: update VCN 5.0.1 firmware"
      Revert "amdgpu: update VCN 5.3.0 firmware"

 amdgpu/beige_goby_vcn.bin       | Bin 582160 -> 580112 bytes
 amdgpu/dimgrey_cavefish_vcn.bin | Bin 582160 -> 580112 bytes
 amdgpu/navy_flounder_vcn.bin    | Bin 582160 -> 580112 bytes
 amdgpu/sienna_cichlid_vcn.bin   | Bin 582160 -> 580112 bytes
 amdgpu/vangogh_vcn.bin          | Bin 574288 -> 572368 bytes
 amdgpu/vcn_3_1_2.bin            | Bin 574288 -> 572496 bytes
 amdgpu/vcn_4_0_0.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_2.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_3.bin            | Bin 359824 -> 359696 bytes
 amdgpu/vcn_4_0_4.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_5.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_6.bin            | Bin 403856 -> 395664 bytes
 amdgpu/vcn_4_0_6_1.bin          | Bin 403856 -> 395664 bytes
 amdgpu/vcn_5_0_0.bin            | Bin 439824 -> 438288 bytes
 amdgpu/vcn_5_0_1.bin            | Bin 218896 -> 217680 bytes
 amdgpu/vcn_5_3_0.bin            | Bin 448528 -> 448272 bytes
 amdgpu/yellow_carp_vcn.bin      | Bin 574288 -> 572368 bytes
 17 files changed, 0 insertions(+), 0 deletions(-)
