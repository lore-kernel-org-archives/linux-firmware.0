Return-Path: <SRS0=NzCr=GD=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3521EC5AD7B
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Aug 2026 18:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02F0A1F00A3A; Mon, 10 Aug 2026 18:17:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.3
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786385848;
	b=x9T0CY1ITqVMYuHNOUtg161mEk8O5BUr+c9LNOryoHFYfAALWKDJHjJK74FAJ/z3A0/w
	 2hFhQI328WurH8Pt5OSlBWCNWaOWr0p0ThKIR0xpXh6jGx7M1rJo6b0EwrfVdP7Df//fE
	 VbPZ4gI/UhJ8YmlZYIdeyNCnGiL1+BWUPH5HbbbMABCaOHavoGRXR6pvSCKBZH1hcEelV
	 Yd4NLpoiIvstened2rNIaOs+D4dj0BBwRhdnWwqaKmtjb+fWCNVNHR+ptvS0Mdv5v9qjn
	 5r+shHbDeVbCA87VmrLfuOu8EvLei9EURO0pK5H2utdDWv25LYG1/idnHRstq/NpgeA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786385848;
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
	bh=pXPl07DnvmZ9ihxlnoby8r87lv6paHtx85yJWK/JMXk=;
	b=kiJwOswWJYph9OUWeQbVo7/RvLfY4e014qgeKf5b+tmM7FEkBH4LIE6GaBYfYkCwK37N
	 T0d2DS3W8v22MQiEUqKmvJkJuIbJM1NsCePS3+4Q3jiP2McNw54mvrGpy8yzjtuMfBkPD
	 S4gZOKkjdK78X6hEdQfMr61nv7l+kCgP66WOSDPlM9YyoEh9FegWH9x+YuCwWh5ykqi7Y
	 79px4zlKU2FDG0/PzDgdhcXDGICFHAp6broG6a4Snt7SgTNCvKbuAjduu3p8bcKLwm5oC
	 PwvLsYVqpkv56bivviTOEkeIZjcsMbXla0OOfHqeMTJenCSygYzsj8yAD3SuYrUOhEA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="O1cB/sv+";
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.3
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC4A11F000E9
	for <linux-firmware@kernel.org>; Mon, 10 Aug 2026 18:17:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O1cB/sv+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EC4A11F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJ49CG0lBKBxW68gXcbVbRK+6sVPSo9rjS2Tdg1vJjNS8AIX3sXGLsfk/FxNgSx6/qiBo0E54CoXu4Yog+uicDZJlftD6x4q5xME9z8gbZvW/j+mWo6LrWBPs453qtrerSMDCc+WNrI2VMePBt+Wz3Y9XEnQTRoXc4sZiUDtsV7o5T623mWzoAx500Jy1Th9XwPQZZzOIC6tYuh+5PiNwrkmZ8SE0N9oET4lsVEwM5z42I5IEjz97hvT/yL9aZ9wmXuJvqWKE4n+UP/kyUIewRTyJ4/U4fN6CWTEOEGACM/ko48nEzndsYCbD24Y5e7moXbs9pFpEPU0ejf5yoCCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXPl07DnvmZ9ihxlnoby8r87lv6paHtx85yJWK/JMXk=;
 b=UdrJeF5aqGanGrSuvngghoaCl3THYAyCF4qTNoXtsL/ibM7p0LVpjT9o63sm8Q/S/tKkKBw16Q37Abel++/EbTl1x1Wi+KJhkmvDDg05v7iNkXohFqkDZsP59palS2uani+P21ASk8b9LK1tITFyjh9TrzoTph3VWUQwV9Pq8uwZJgGTSN/9drYgcNLNFT3UEC1hCazTf8NqgZ9NGg4W0nDWZckxXSLG2io6rpNJoc9DMo/uBTf182HS0Dluc32zDKn1O4KQ9e7p1AcMOGvuEdyzaiqGuKneecNq+kXfIQv11LN/AGycDqRMgumq5ZzlPEy+o2O5QNAQ+v3zkSyIAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXPl07DnvmZ9ihxlnoby8r87lv6paHtx85yJWK/JMXk=;
 b=O1cB/sv+PvbkvnghUfkoxyByKt6DLAd5fAv7/NVWKu48/TMERvhxuz1kbks0vlPKotoaKyhOt/MUM8PBHDEBJtl8he2vlm1H/aHQjc5mDicbJNO7YCzXGwL37UcXJEKIzIEAwd94InVNZSbgQ7zleubbpn+2GvYfhfB0CO8PcrU=
Received: from BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9)
 by PH8PR12MB6820.namprd12.prod.outlook.com (2603:10b6:510:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 18:17:22 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::25) by BN9PR03CA0064.outlook.office365.com
 (2603:10b6:408:fc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 18:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.0 via Frontend Transport; Mon, 10 Aug 2026 18:17:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 10 Aug
 2026 13:17:20 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 10 Aug 2026 13:17:19 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware updates
Date: Mon, 10 Aug 2026 14:17:05 -0400
Message-ID: <20260810181705.1521852-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|PH8PR12MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: df511ae4-ffcc-4500-916e-08def70b9e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|11063799006|56012099006|10067099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	NbrK76gcbwwpp0X5GA12tGxnpdgO066kE925wxDTjPMzavsGlyRk3RH+pM+pMA3M2BqlZQodetgYnZ6oIw4y3kCJxIE6HYMAXDa3Rv+yuA62s6ClFV6//CuICSQzihwacj7CtW+hVJtaqSjy8WboqgGOx0ACIQf6m7+R4GCNfN+fwKIMPbouJYQfkoPqv1qQ/gLtocYXj6lILEjF/Zw3WMwmbGRw+Oh98XsACUXWtxLdkwpKGTYgti8nCkiBZ/jfq3jQfbcm1eLxu0THvFJMVdkVtbzsLWTwipYdEzugI4psZqPgufM2q0cx1YjQ4jZ6EEKWQMnL2SvEHXx879wegwpn8y06vYBNKJemU+2KclBKbX9RgSnh2KLlf5fBZOg1xYmAGTreVrrWdIxy9/SZP03wP9jBfwpg8wgwIMKxwxESR+50b8OLtbxR5DEJ/RCjR0rQeMCwXgvVYmGwSIl52v5CXRB9WnE8K4rXRty56x1Jhs6mN2641JIcsp5rtx0oZNy22T8kqZYglV/CAaJ+6Eh3kD8Pa6KhipHfB5o3+MOusWHzThDA1te90gqTpvaPfeaHt60XFztdy6f3bHMK1PpiHCH8jxnngWdYRxIQn1J0Ad9iHrnn3nQeFfJILxAAjdbD1pHSYBoEY2elZVmcD4vw8IfkK9iYoOmlRBCjt/8Fsyybo5SNA6eQCCLHz2sFtiwB7WBzp4Z7v3iD2RRaAQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JCd9KEcANiNZQ/1SSVe+Qg0F0OcYjxsnG2in16y1OSosIz121B28aOiwAgaD/daglJz6Y5zlXvQZtb3PjLWVRglmewTOqfoeeyxO1jiXEuWe+RpplSvUu/WLL3HpWQ4TvsXuFKtjDb4cbBm6HMoxZJmaFYv/FfT3hDh8N8oex/W+JiXlALPYkeTQEBVIwEfSCoP6IuJIItIxks95iwr+GnbQgYC0R54OnuxSfZfH4bHXCzxOBHF/jbZ8A0hm/BncfGBZXLisLnqEcuId1SJUmFg1XrGFvSVq+GtWV6XA5tK9OrnChkfPiAPoK7euk5BeWNKHGRG7PTTJT73PwWu9kNjuaI+blUNOK9P9CMCeJQyHS3d70bif0l0EGeS7up6U7Uytm1adgYSHrrYHgfsQjG7s/FiqwR6IsJA+ljqXfmBHG9PO6UnN5TcaRhOU3vYS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 18:17:20.7509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df511ae4-ffcc-4500-916e-08def70b9e6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6820

Hi,

Updated amdgpu firmwares.

The following changes since commit 495465e0e7742d29f52674ff3172445a8f03a3a7:

  amdgpu: DMCUB updates for various ASICs (2026-07-27 14:58:13 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-08-10

for you to fetch changes up to b22a326c596b4b53abe3df6cdc937e679c023213:

  amdgpu: update vangogh firmware (2026-08-03 18:09:06 -0400)

----------------------------------------------------------------
Update amdgpu firmwares

----------------------------------------------------------------
Alex Deucher (65):
      amdgpu: update aldebaran firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update VCN 4.0.3 firmware
      amdgpu: update arcturus firmware
      amdgpu: update green sardine firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update VPE 6.1.3 firmware
      amdgpu: update GC 11.5.3 firmware
      amdgpu: update PSP 14.0.5 firmware
      amdgpu: update GC 9.4.4 firmware
      amdgpu: update PSP 13.0.14 firmware
      amdgpu: update GC 9.5.0 firmware
      amdgpu: update PSP 13.0.12 firmware
      amdgpu: update VCN 5.0.1 firmware
      amdgpu: add PSP 13.0.15 firmware
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
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SDMA 6.0.3 firmware
      amdgpu: update SMU 13.0.10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SMU 13.0.7 firmware
      amdgpu: update vcn 4.0.4 firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update SMU 14.0.2 firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update SMU 14.0.3 firmware
      amdgpu: update VCN 5.0.0 firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update picasso firmware
      amdgpu: update GC 10.3.6 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update raven firmware
      amdgpu: update raven2 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update renoir firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update VPE 6.1.0 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update VPE 6.1.1 firmware
      amdgpu: update vangogh firmware

 WHENCE                           |   2 ++
 amdgpu/aldebaran_sdma.bin        | Bin 34304 -> 34304 bytes
 amdgpu/aldebaran_vcn.bin         | Bin 422656 -> 423936 bytes
 amdgpu/arcturus_vcn.bin          | Bin 420736 -> 423936 bytes
 amdgpu/beige_goby_sdma.bin       | Bin 34048 -> 34048 bytes
 amdgpu/beige_goby_ta.bin         | Bin 259328 -> 259328 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 580112 -> 582160 bytes
 amdgpu/dimgrey_cavefish_sdma.bin | Bin 34048 -> 34048 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 259328 -> 259328 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580112 -> 582160 bytes
 amdgpu/gc_10_3_6_rlc.bin         | Bin 177104 -> 177104 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 315120 -> 324064 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 220480 -> 221120 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 260624 -> 263664 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 232096 -> 234960 bytes
 amdgpu/gc_11_0_1_mes1.bin        | Bin 235312 -> 235600 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 263616 -> 263664 bytes
 amdgpu/gc_11_0_1_rlc.bin         | Bin 157040 -> 157040 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 315120 -> 324080 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_2_mes1.bin        | Bin 218560 -> 221408 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 260624 -> 263664 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 232112 -> 234944 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 315136 -> 324080 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 406528 -> 406528 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 220544 -> 221216 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 260688 -> 263728 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 232112 -> 234944 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_0_4_mes1.bin        | Bin 234640 -> 234928 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 257760 -> 263664 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_0_mes1.bin        | Bin 238128 -> 238560 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 258208 -> 263632 bytes
 amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_1_mes1.bin        | Bin 238320 -> 238720 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 258496 -> 263920 bytes
 amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_2_mes1.bin        | Bin 237776 -> 238176 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 260560 -> 263632 bytes
 amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_3_mes1.bin        | Bin 237776 -> 238176 bytes
 amdgpu/gc_11_5_3_mes_2.bin       | Bin 260560 -> 263632 bytes
 amdgpu/gc_11_5_3_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_12_0_0_me.bin          | Bin 459840 -> 463392 bytes
 amdgpu/gc_12_0_0_mec.bin         | Bin 455648 -> 455648 bytes
 amdgpu/gc_12_0_0_pfp.bin         | Bin 353536 -> 354912 bytes
 amdgpu/gc_12_0_0_uni_mes.bin     | Bin 727680 -> 734336 bytes
 amdgpu/gc_12_0_1_me.bin          | Bin 459840 -> 463392 bytes
 amdgpu/gc_12_0_1_mec.bin         | Bin 455648 -> 451552 bytes
 amdgpu/gc_12_0_1_pfp.bin         | Bin 353536 -> 354912 bytes
 amdgpu/gc_12_0_1_uni_mes.bin     | Bin 727680 -> 734336 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/green_sardine_asd.bin     | Bin 209408 -> 209408 bytes
 amdgpu/green_sardine_ta.bin      | Bin 37632 -> 37632 bytes
 amdgpu/green_sardine_vcn.bin     | Bin 404544 -> 405952 bytes
 amdgpu/navi10_asd.bin            | Bin 209408 -> 209408 bytes
 amdgpu/navi10_sdma.bin           | Bin 33792 -> 33792 bytes
 amdgpu/navi10_sdma1.bin          | Bin 33792 -> 33792 bytes
 amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi10_vcn.bin            | Bin 404544 -> 405952 bytes
 amdgpu/navi12_asd.bin            | Bin 209408 -> 209408 bytes
 amdgpu/navi12_sdma.bin           | Bin 33792 -> 33792 bytes
 amdgpu/navi12_sdma1.bin          | Bin 33792 -> 33792 bytes
 amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi12_vcn.bin            | Bin 404544 -> 405952 bytes
 amdgpu/navi14_asd.bin            | Bin 209408 -> 209408 bytes
 amdgpu/navi14_ce_wks.bin         | Bin 263296 -> 263296 bytes
 amdgpu/navi14_me_wks.bin         | Bin 263424 -> 263424 bytes
 amdgpu/navi14_mec2_wks.bin       | Bin 268160 -> 268160 bytes
 amdgpu/navi14_mec_wks.bin        | Bin 268160 -> 268160 bytes
 amdgpu/navi14_pfp_wks.bin        | Bin 263424 -> 263424 bytes
 amdgpu/navi14_sdma.bin           | Bin 33792 -> 33792 bytes
 amdgpu/navi14_sdma1.bin          | Bin 33792 -> 33792 bytes
 amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi14_vcn.bin            | Bin 404544 -> 405952 bytes
 amdgpu/navy_flounder_sdma.bin    | Bin 34048 -> 34048 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 259328 -> 259328 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 580112 -> 582160 bytes
 amdgpu/picasso_vcn.bin           | Bin 366560 -> 369408 bytes
 amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 272400 bytes
 amdgpu/psp_13_0_0_sos_kicker.bin | Bin 268976 -> 273072 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 271616 -> 271616 bytes
 amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 267712 -> 267712 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_13_0_12_sos.bin       | Bin 455472 -> 455472 bytes
 amdgpu/psp_13_0_14_sos.bin       | Bin 405824 -> 405824 bytes
 amdgpu/psp_13_0_15_sos.bin       | Bin 0 -> 439088 bytes
 amdgpu/psp_13_0_15_ta.bin        | Bin 0 -> 49920 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 254976 -> 254976 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 209408 -> 209408 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 246784 -> 246784 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 246784 -> 246784 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_2_ta.bin         | Bin 274432 -> 278508 bytes
 amdgpu/psp_14_0_3_sos.bin        | Bin 435632 -> 435632 bytes
 amdgpu/psp_14_0_3_sos_kicker.bin | Bin 435968 -> 435968 bytes
 amdgpu/psp_14_0_3_ta.bin         | Bin 287040 -> 291116 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_5_ta.bin         | Bin 254976 -> 254976 bytes
 amdgpu/raven2_vcn.bin            | Bin 366560 -> 369408 bytes
 amdgpu/raven_vcn.bin             | Bin 366560 -> 369408 bytes
 amdgpu/renoir_asd.bin            | Bin 209408 -> 209408 bytes
 amdgpu/renoir_ta.bin             | Bin 46080 -> 46080 bytes
 amdgpu/renoir_vcn.bin            | Bin 404544 -> 405952 bytes
 amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_sdma.bin   | Bin 34048 -> 34048 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 386816 -> 386816 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 580112 -> 582160 bytes
 amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_0_kicker.bin     | Bin 261888 -> 261888 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
 amdgpu/smu_14_0_2.bin            | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3.bin            | Bin 333236 -> 333236 bytes
 amdgpu/smu_14_0_3_kicker.bin     | Bin 327424 -> 327424 bytes
 amdgpu/vangogh_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/vangogh_vcn.bin           | Bin 572368 -> 574288 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 572496 -> 574288 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_3.bin             | Bin 359696 -> 359824 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 403856 bytes
 amdgpu/vcn_5_0_0.bin             | Bin 438288 -> 439824 bytes
 amdgpu/vcn_5_0_1.bin             | Bin 217680 -> 218896 bytes
 amdgpu/vpe_6_1_0.bin             | Bin 25984 -> 25984 bytes
 amdgpu/vpe_6_1_1.bin             | Bin 25984 -> 25984 bytes
 amdgpu/vpe_6_1_3.bin             | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 246784 -> 246784 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 574288 bytes
 151 files changed, 2 insertions(+)
 create mode 100644 amdgpu/psp_13_0_15_sos.bin
 create mode 100644 amdgpu/psp_13_0_15_ta.bin
