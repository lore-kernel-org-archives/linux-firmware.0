Return-Path: <SRS0=Brcw=HD=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2834C88E53
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Sep 2026 16:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B07731F00893; Fri, 11 Sep 2026 16:29:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.59
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789144194;
	b=IIT1xEKcE4VM5ZcsImFLudm5dkGpGn/+sEF40JevpAbypbh8KpcfzdCqegBJUenBXvac
	 c+7uaXLECfYa2zHrL/kdfJ1Dv+k9u0JeX7/W/B60ou6FKRwJuY8ZKijX2NuhuIs3qqq09
	 wEOgRGCnEnkkMY0XG4g1UHg66A9WDufNfpqyUQAaVxtPRm8UeTJLcrFDpufrtlSXmJ+0Z
	 B14F0DuxU10iII13O+/y7tHmIUYhyoDck6f8CZ2SrpDuVYCof8gI3wJwttt/OEttcJw/P
	 /R6/pKrinNydBeMoNUuLVzaHn/diub7C7fOauociaxfsC4p7ZZY4/WLQrBZ6sC4Ga+A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789144194;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
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
	bh=t7TTOA/PXaBuiHSClsSReNueDjTLP36/cdbk3BbCPbY=;
	b=jmd2nAms/yonRH+/nRyz+3IU0hGb5dsItrKwrDM7PkmKNHelps77RIVDjKRYntFVRq7S
	 C0zzdmpB+At8R/M05IeSIpCGDQFQF0ih44ZtkgQxeCNCGhrscQD5ruK9b9G1/Jsg69/4a
	 Yx47r1RURuBw1gFVYyTtcjv9UsUgfFbXtEAwFbF4djeJwO3laoUFDiN14zFiaDMW/V4C0
	 WrEdpI53sWcq1RN4Y3CjqBDEJ3B4HjkqZRIfOfSJm8TloB9xaTskeNMLkuoaHFpsIN2CM
	 /ngZegaacP+LKDdpyYGAH1qeRlkJz7N2O3GNgeA0IdqpNLBfVRyckwuvsqoluJdFeYw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=w1KzpWZh;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.59
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D28291F000FF
	for <linux-firmware@kernel.org>; Fri, 11 Sep 2026 16:29:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=w1KzpWZh
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D28291F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmmGZGBAOSq7qr1EisF1tXiD86984chn6kw+zqNf/QvbL8D2Hy3Yz+CuXI5S/DpkWS+GoRWlNU7U/ka4DAYG2CrK2SNeDZLfyhNakOQk66glL9GVpAo5Wxh8PlEHHF1Wr/atvylQplmLh8anDf8z47SVrW7XmQ0xOaAEwVvuiT/2Lormhc5++HykQO060j71rzAbimXpoZz+BnWJBcI3OTb/k2TbTdadELU/l0b61kndfwSYsHBzzSiqe6qUytQnGbkC6ZHWyH7w+oCv4XkE/wsM44h/gM6GAZTzU2JlZcnaHaWjn9CCjqa6ySPgy49GvfBtNMEmta/WGvWsoLWMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7TTOA/PXaBuiHSClsSReNueDjTLP36/cdbk3BbCPbY=;
 b=lHGITJm9ue6ytEDM/zrzm0T/2qOcXnfXdrvV4x4e1wKExW3MjmF6+f9wGWNJHG55ppRFw0jCnT7jsWkxSkjpAwp/QtWsg+Kqto6mqgEk7DoEG4cq0MI7lPVjERYQIUbGqQGsNguMK7hXuulFbwLMQEY+vLip8aCZJPjE3YPX+6vaqKPWq6sdryifu2/YNEAQT6J3EjyJH38xg/kmxfKL0unB9lVRVYiYUzFIlBUR2w+++q5m2bpqGo+kvr5L5vAeCPv+/M4d6JxSsuAw6OwYDf09PwQ3WeoxpYwL4qYn2/6lMMJYKDh21WKMsB9/4XkSA3NAinE+uXU2WHAyT3sTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7TTOA/PXaBuiHSClsSReNueDjTLP36/cdbk3BbCPbY=;
 b=w1KzpWZhKPuk7d4WF+JZ8ydGD1u99kg7fWin734Qj5+TWG3n9wph5cnOW3gsQAKUrSY2ATvMSRvRhGOoPDHhy/JPQwT10K3UYYMrYpqg7Zfyzq1DV+qXFl8ChA8GYH1IQVYBlCTHlTZe21vDGxLmT1A695peQo2OH7eqFPBhpWo=
Received: from CH5PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:1ed::13)
 by LVUPR12MB999186.namprd12.prod.outlook.com (2603:10b6:408:3a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 16:29:50 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::b) by CH5PR02CA0016.outlook.office365.com
 (2603:10b6:610:1ed::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 16:29:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 16:29:50 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 11 Sep
 2026 11:29:50 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 11 Sep 2026 11:29:49 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] update amdgpu firmware
Date: Fri, 11 Sep 2026 12:29:40 -0400
Message-ID: <20260911162940.1313896-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|LVUPR12MB999186:EE_
X-MS-Office365-Filtering-Correlation-Id: a4015979-c8db-4d15-f63d-08df1021e717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2rU0n5yM7mLPaMT3cfulJkO5EwRT2Ag4qCwzQxFEYtzD3qpm522nBjd2G71WdnrPB2a3gqr71oSgiPuWlofST1oUuUdMTWZtKVzCQTDelVLq92f9kOhjc8ufLa0S/FvVHrHVV/oJGfc+jCldbzZjk0/M5yPY8ptIDB61jCmUB+S9WHbjbuMCQFQo9C7ZZCkBaRodItWKbvDM5nFwetlcX5Mv2udi8clDetbocjpegKN6tyfdDWmvKIiSmm94P9YkkK9X7mSqHvkPbZ43kP248W0S6Pcvk3KF4v7BBYK/lEmbotRy9s9kiUAOlzYKJ3Vh4F1I7wEBDCgzF55ey4geiQSjSGYQW6wlDmOpIDRTy2zzSNRrLULTXwG/e2vxIT0yn0tDpXHFX2nVevQQ99aV/v9www/hvDfh7MQQIl5U39R7UXJsvEwGBaCZRPFUqTpDp7gI9MobM0ec1UuBZnspMVVHFuKtb79x24qxB9hKKF2WpW5doLF1DEvslHcc8B32FqsWwk1PAVFmnMbRwtsiYUT7Z+bkeHBcLdvFyQZZFdgzorVjVUC0rUBFirth6T4xjflZ8z10Z9NWf2umTD0RBrkf8vtIT8I88biIZJdT+XCEkXNyIv4Vpr7mDVVid53mm5+RjaDmnSgN9lUBN4j7Uf+vWSnp0QXAJNU61lcHhA4O56Zx61ScOsdo02rNS+LJYHFmY3FQpcoGRtMQCklQMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t0Alq2vGSCjKGlkXp23KoEcLLluW4TkggoT8vJc9sMqpqvIw+zD/9QGBjvLQx+ZDe0G3oOZznf5NbDMjwOFrFsvTHZyuGD+cYxK0kiAMRYcCVNzrS61EIgJwWPc6lNJ+SXG3jtrOcEzALAkhE5kOTo3Sv+h4iCp/LMiQFYqCsnU3PBFVALG19/ZIccoOiW5YSM0Jod96+XuK0mTj0ha39bMsm0OO2JcTrzkeYyVeOd0fAzXQsow0VwA43Lew0LTujECb8rL85kKlQvZNd3Ig4j9CVkDNbd6iW0xlq1efMjvMpRleGb+iwsShpK3fEhch6D9sNRv6SvJGoh4IjKMVT6wnGkbmx4fk415W+GwUKQM8AwIRN571+33BNxVgtAPYZlmd5HMVvAIbtnARi5dTAfvv+ql5Q41nNY1yg5n57Oa13HJsAQxQBuX068S+PtF8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 16:29:50.6375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4015979-c8db-4d15-f63d-08df1021e717
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999186

Hi,

Updated amdgpu firmware.  Please apply.

The following changes since commit 6f47eb9e53f416d52a44e8cf00da2c3bd6552a68:

  amdgpu: DMCUB updates for various ASICs (2026-09-11 14:50:56 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-09-11

for you to fetch changes up to 9b407c9718c6a2b5397836cc946093a745aa9763:

  amdgpu: update vangogh firmware (2026-09-11 12:15:55 -0400)

----------------------------------------------------------------
Update amdgpu firmware

From internal commit:
6d0a0c41f7d659d2607fa8b85c7143935b1c2f78

----------------------------------------------------------------
Alex Deucher (48):
      amdgpu: update green sardine firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update VPE 6.1.3 firmware
      amdgpu: update GC 11.5.3 firmware
      amdgpu: update PSP 14.0.5 firmware
      amdgpu: update GC 11.7.0 firmware
      amdgpu: update PSP 15.0.0 firmware
      amdgpu: update VCN 5.3.0 firmware
      amdgpu: update GC 11.7.1 firmware
      amdgpu: update PSP 15.0.9 firmware
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
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SMU 13.0.7 firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update SMU 14.0.3 firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update renoir firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update VPE 6.1.1 firmware
      amdgpu: update vangogh firmware

 amdgpu/beige_goby_ta.bin        | Bin 259328 -> 259328 bytes
 amdgpu/dimgrey_cavefish_ta.bin  | Bin 259328 -> 259328 bytes
 amdgpu/gc_11_0_0_mes_2.bin      | Bin 263664 -> 263696 bytes
 amdgpu/gc_11_0_1_mes_2.bin      | Bin 263664 -> 263696 bytes
 amdgpu/gc_11_0_2_mes_2.bin      | Bin 263664 -> 263696 bytes
 amdgpu/gc_11_0_3_mes_2.bin      | Bin 263728 -> 263760 bytes
 amdgpu/gc_11_0_4_mes_2.bin      | Bin 263664 -> 263696 bytes
 amdgpu/gc_11_5_0_mes_2.bin      | Bin 263632 -> 263632 bytes
 amdgpu/gc_11_5_1_mes_2.bin      | Bin 263920 -> 263920 bytes
 amdgpu/gc_11_5_2_mes_2.bin      | Bin 263632 -> 263632 bytes
 amdgpu/gc_11_5_3_mes_2.bin      | Bin 263632 -> 263632 bytes
 amdgpu/gc_11_7_0_rlc.bin        | Bin 162336 -> 162336 bytes
 amdgpu/gc_11_7_1_rlc.bin        | Bin 162080 -> 162112 bytes
 amdgpu/gc_12_0_0_me.bin         | Bin 463392 -> 463392 bytes
 amdgpu/gc_12_0_0_mec.bin        | Bin 455648 -> 455648 bytes
 amdgpu/gc_12_0_0_pfp.bin        | Bin 354912 -> 354912 bytes
 amdgpu/gc_12_0_0_uni_mes.bin    | Bin 734336 -> 734432 bytes
 amdgpu/gc_12_0_1_me.bin         | Bin 463392 -> 463424 bytes
 amdgpu/gc_12_0_1_mec.bin        | Bin 451552 -> 451552 bytes
 amdgpu/gc_12_0_1_pfp.bin        | Bin 354912 -> 354912 bytes
 amdgpu/gc_12_0_1_uni_mes.bin    | Bin 734336 -> 734432 bytes
 amdgpu/green_sardine_asd.bin    | Bin 209408 -> 209408 bytes
 amdgpu/green_sardine_ta.bin     | Bin 37632 -> 37632 bytes
 amdgpu/navi10_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/navi10_ta.bin            | Bin 37632 -> 37632 bytes
 amdgpu/navi12_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/navi12_ta.bin            | Bin 37632 -> 37632 bytes
 amdgpu/navi14_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/navi14_ta.bin            | Bin 37632 -> 37632 bytes
 amdgpu/navy_flounder_ta.bin     | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_0_ta.bin        | Bin 271616 -> 271616 bytes
 amdgpu/psp_13_0_0_ta_kicker.bin | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin       | Bin 267712 -> 267712 bytes
 amdgpu/psp_13_0_11_ta.bin       | Bin 254976 -> 254976 bytes
 amdgpu/psp_13_0_4_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_13_0_5_asd.bin       | Bin 209408 -> 209408 bytes
 amdgpu/psp_13_0_5_ta.bin        | Bin 246784 -> 246784 bytes
 amdgpu/psp_13_0_7_ta.bin        | Bin 246784 -> 246784 bytes
 amdgpu/psp_14_0_0_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_1_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_2_ta.bin        | Bin 278508 -> 274668 bytes
 amdgpu/psp_14_0_3_ta.bin        | Bin 291116 -> 287276 bytes
 amdgpu/psp_14_0_4_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_5_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_15_0_0_ta.bin        | Bin 278980 -> 278968 bytes
 amdgpu/psp_15_0_0_toc.bin       | Bin 2816 -> 2816 bytes
 amdgpu/psp_15_0_9_ta.bin        | Bin 278980 -> 278968 bytes
 amdgpu/psp_15_0_9_toc.bin       | Bin 2816 -> 2816 bytes
 amdgpu/renoir_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/renoir_ta.bin            | Bin 46080 -> 46080 bytes
 amdgpu/sienna_cichlid_ta.bin    | Bin 386816 -> 386816 bytes
 amdgpu/smu_13_0_0.bin           | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_0_kicker.bin    | Bin 261888 -> 261888 bytes
 amdgpu/smu_13_0_10.bin          | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_7.bin           | Bin 287080 -> 287080 bytes
 amdgpu/smu_14_0_3.bin           | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3_kicker.bin    | Bin 327424 -> 327424 bytes
 amdgpu/vangogh_asd.bin          | Bin 209408 -> 209408 bytes
 amdgpu/vcn_4_0_2.bin            | Bin 403856 -> 403856 bytes
 amdgpu/vcn_4_0_5.bin            | Bin 403856 -> 403856 bytes
 amdgpu/vcn_4_0_6.bin            | Bin 403856 -> 403856 bytes
 amdgpu/vcn_4_0_6_1.bin          | Bin 403856 -> 403856 bytes
 amdgpu/vcn_5_3_0.bin            | Bin 448272 -> 448528 bytes
 amdgpu/vpe_6_1_1.bin            | Bin 25984 -> 25984 bytes
 amdgpu/vpe_6_1_3.bin            | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_sdma.bin     | Bin 34048 -> 34048 bytes
 amdgpu/yellow_carp_ta.bin       | Bin 246784 -> 246784 bytes
 67 files changed, 0 insertions(+), 0 deletions(-)
