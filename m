Return-Path: <SRS0=UXb2=DD=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC64ECD3439
	for <linux-firmware@archiver.kernel.org>; Wed,  6 May 2026 23:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5B5DC2BCB2; Wed,  6 May 2026 23:27:00 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27188C2BCB0;
	Wed,  6 May 2026 23:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27188C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw9BS3ug2WqxSJYinXiIYUZeClYUq/VekESQ9fQh3oI/2kKZ5aZ3AobrTHqleil/nywLu/xLq3oAKnHMRoU1u8tdOF79ura6frf4OfLr0BKFm29E8nGzFWVIe5xYlTj8fzDE42aOp+5TS2ShkhVLCyvsmtKm7akKvbRJWr2Dnwiy7xW1+qx1EFh3WHGxrrqdYx+ackzypYDU6uN2JGXIDXxOZewbGu/+mun1m0mcQvLiP22Hp66Pl0cFqMFy1C78LAPfor24B35929SO3v/Qy8fF+TvvefDM+8N3QV6MUIWj4UDhoyMu71oXADVCXdFvo9bneVfd8o5Dt3j2iC3K9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tazg4P2Lp01q4Y1YtV6JcOIC+ocHeS2E2u7EXvecBbM=;
 b=Uyu5wuopuC2VBbMVdSJahkbnnoxEosauuNlW7xyV6ZF3BYIKhhsPMvSHmR/h3qKyxVwhBWGNYaNH0qcz871KdFlHjeCQQhYHV3yRIKi9SSxzre5xuFkh40tv6OBNopdXwSf2abwenp8osjEyJ4mNPHwsCmQ/5LR0x0RM+GkwHPA1ogrYjqJKpCeEKhQQesEGgdjUC7Pg0slZRGhjhI5fcIJVmbM+qWd/1s/s+EgXljsU7BTdy8L4qI0zMVm1rzwXQ6/dlvbhtfCIuy8+8gavdXOai7HZIP7Ta07S+Q5C+opTV/aBS1vTkgY9I8NIsavFdcZiaplZqnheVrgeAUUQDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tazg4P2Lp01q4Y1YtV6JcOIC+ocHeS2E2u7EXvecBbM=;
 b=mBbF0WDND5oKJh/6/IJSV0Vt5QX7ChLwfpFT5tBa4OATugj7rE4+myhNOtX20UAheDCpa9f5Q/UMVA2e5sRX+XwF2RCGRCknW+96oVDzXxTQkBf5+4DHN1AAuPNgDQ6ZJtwtxsW0dYwtKxYmlIIvOvjHleOtfGgN6kpCHWFTqC0=
Received: from MN2PR20CA0036.namprd20.prod.outlook.com (2603:10b6:208:e8::49)
 by CH1PPF12253E83C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::606) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 23:26:50 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:e8:cafe::db) by MN2PR20CA0036.outlook.office365.com
 (2603:10b6:208:e8::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 23:26:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 23:26:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 18:26:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 16:26:48 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 6 May 2026 18:26:48 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <superm1@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu amd-2026-05-06
Date: Wed, 6 May 2026 19:26:27 -0400
Message-ID: <20260506232627.2210758-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|CH1PPF12253E83C:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb17bc2-39ec-4fc4-8662-08deabc6f317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wAaS42jcOYRdewd3oVQG+4VLnyYe1X/OWox8A00TRC7rEmAe1GgA55JsFyYHXbDComMKvMwiP4cB8awJ2Oaf5ANKW5IwguLnxjs8vSgfc7e3aaZWGgLdcv95+ImmjozZRDBH8+l3tHpYY8LwtZGHrJ5r9iWKjqJi9C03i9Q8ch60i1v8LtGztFQcQh+OoZG1WmjefDtqyrgaQd97hsDNWHe48rJJo2TnqW8TRdayCi+px0lLjDyygPcPu8RdzZIAN1Qq4T7fmFDPkPlv+UElodVF2dZhI9DmCkn/Um3uiA6jhrnOhif70t82C8fkKakH1NghXEU/bhvxJqYbril1VW5c8nvQHN5KwVgyM8wkdaYlXDJbUqXFoySo+O7/KTHQiT8CRoXPd/yTR42XqrY4E2jaqZWbA3fAXQX/0dMqciF6eIeJmWOehxoGN2qR670M1uSBc97SqNyvZ3IWCxgijlF8hE6HEjesqHvNk11wEZdpFhTHcYfwIUG99yVyygv7uFXUg/ETLsnp/LFMPLvxbGbS6Pkmku0w8+t8xfVhRNfGm1a/2gJXoZrwCR+hglqOvCLhpuFjQb5wagMLGiGDpIUUD48yjVUnz0SWhoWOb+BQ4yqhEe9qFsdMc9xPWmxoZrcsfMcf/xm8G3n0haAJXI4jK25Cj/a8rLieh7G4D5aMciP+36FJdUl21BwZh3LQSH42f9+8i0DGr5+iL6TM26kBiz5y4FML59kr39ItQ34=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cE4Nay5+Sa5O2wj57raUoNB9OFU7fWay/DSfU/X2SY/gSEAa71gTaUPhOgQ59Xj8TBgAWzHWOWV4zYw7Tmtwj4pkBjnEc9BdeFLkDP7EJFXyS2nlHpV/yHP6GgN/KzPnDI+EYU8IDvkzDpqJ6HNrv5NFKNPnYzSyQyjPqg1lP29HfcSedLqhRDb5KcFyllp9ITFv/lMLSQTzfP7wmQIhTOuU/NFKysmjSLzE7WrBF41SWJIg/u1YGwJ+4eKslqYuYxCPz2A4qLgqN/q+BNRFgzypUmueWWtygcHAFBSmIux1PDJFMUPJDTgQ+MAMkuyTn8MG1e135liRn5XDGc8qXi52I4ATa6FcASRzUNjjfqCh8OkDYRBmHgsyUhWUPvNK8LAOk35jKqMDy+AJJoSbRjVdEtT9yuXWJpjegPLPQIXMvKbouV9oqpxy8osVL2wr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 23:26:50.3115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb17bc2-39ec-4fc4-8662-08deabc6f317
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF12253E83C

Hi,

Updated amdgpu firmware.  Please apply.

The following changes since commit b9a35af9f69b4222664bb9d1b629dd25323017cc:

  amdgpu: DMCUB updates for various ASICs (2026-05-05 07:23:04 +0800)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-05-06

for you to fetch changes up to 85a26eb6f3ef0c0acef3d615dddb766bc7a3542e:

  amdgpu: update SMU 14.0.3 kicker firmware (2026-05-06 19:17:52 -0400)

----------------------------------------------------------------
amdgpu firmware updates

----------------------------------------------------------------
Alex Deucher (66):
      amdgpu: update aldebaran firmware
      amdgpu: update renoir firmware
      amdgpu: update dimgrey cavefish firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update SDMA 6.0.1 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.5.0 firmware
      amdgpu: update PSP 14.0.0 firmware
      amdgpu: update SDMA 6.1.0 firmware
      amdgpu: update VCN 4.0.5 firmware
      amdgpu: update VPE 6.1.0 firmware
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update SDMA 4.4.2 firmware
      amdgpu: update VCN 4.0.3 firmware
      amdgpu: update beige goby firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update GC 11.5.1 firmware
      amdgpu: update PSP 14.0.1 firmware
      amdgpu: update SDMA 6.1.1 firmware
      amdgpu: update VCN 4.0.6 firmware
      amdgpu: update VPE 6.1.1 firmware
      amdgpu: update PSP 13.0.14 firmware
      amdgpu: update SDMA 4.4.5 firmware
      amdgpu: update GC 9.5.0 firmware
      amdgpu: update PSP 13.0.12 firmware
      amdgpu: update VCN 5.0.1 firmware
      amdgpu: update SDMA 4.4.4 firmware
      amdgpu: update GC 11.0.0 firmware
      amdgpu: update PSP 13.0.0 firmware
      amdgpu: update SDMA 6.0.0 firmware
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update PSP 13.0.0 kicker firmware
      amdgpu: update green sardine firmware
      amdgpu: update navi10 firmware
      amdgpu: update vangogh firmware
      amdgpu: update navi12 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update SDMA 6.0.3 firmware
      amdgpu: update navi14 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update SDMA 6.0.2 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update GC 10.3.6 firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update sienna cichlid firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update SDMA 6.1.2 firmware
      amdgpu: update VPE 6.1.3 firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update VCN 5.0.0 firmware
      amdgpu: update yellow carp firmware
      amdgpu: update GC 11.5.3 firmware
      amdgpu: update PSP 14.0.5 firmware
      amdgpu: update SDMA 6.1.3 firmware
      amdgpu: update navy flounder firmware
      amdgpu: update SMU 14.0.3 kicker firmware

 amdgpu/aldebaran_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268736 -> 268736 bytes
 amdgpu/aldebaran_smc.bin         | Bin 242688 -> 242688 bytes
 amdgpu/aldebaran_sos.bin         | Bin 446208 -> 446208 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268160 -> 268160 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_ta.bin         | Bin 255232 -> 259328 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 580112 -> 580240 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268160 -> 268160 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 255232 -> 259328 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 580112 -> 580240 bytes
 amdgpu/gc_10_3_6_ce.bin          | Bin 263296 -> 263296 bytes
 amdgpu/gc_10_3_6_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_10_3_6_mec.bin         | Bin 268592 -> 268592 bytes
 amdgpu/gc_10_3_6_mec2.bin        | Bin 268592 -> 268592 bytes
 amdgpu/gc_10_3_6_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_0_mes1.bin        | Bin 218240 -> 220480 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 259568 -> 260624 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 257312 -> 258368 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 259568 -> 260624 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 259632 -> 260688 bytes
 amdgpu/gc_11_0_3_rlc.bin         | Bin 179104 -> 179104 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 256704 -> 257760 bytes
 amdgpu/gc_11_5_0_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_0_mes_2.bin       | Bin 257184 -> 258208 bytes
 amdgpu/gc_11_5_0_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_1_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_1_mes_2.bin       | Bin 257440 -> 258496 bytes
 amdgpu/gc_11_5_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_2_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_2_mes_2.bin       | Bin 259504 -> 260560 bytes
 amdgpu/gc_11_5_2_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_5_3_mec.bin         | Bin 268160 -> 268160 bytes
 amdgpu/gc_11_5_3_mes_2.bin       | Bin 259504 -> 260560 bytes
 amdgpu/gc_11_5_3_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_12_0_0_me.bin          | Bin 467424 -> 459840 bytes
 amdgpu/gc_12_0_0_mec.bin         | Bin 451552 -> 455648 bytes
 amdgpu/gc_12_0_0_pfp.bin         | Bin 352336 -> 353536 bytes
 amdgpu/gc_12_0_0_uni_mes.bin     | Bin 725216 -> 727680 bytes
 amdgpu/gc_12_0_1_me.bin          | Bin 463712 -> 459840 bytes
 amdgpu/gc_12_0_1_mec.bin         | Bin 451552 -> 455648 bytes
 amdgpu/gc_12_0_1_pfp.bin         | Bin 353712 -> 353536 bytes
 amdgpu/gc_12_0_1_uni_mes.bin     | Bin 725216 -> 727680 bytes
 amdgpu/gc_9_4_3_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_rlc.bin          | Bin 38708 -> 38708 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_mec.bin          | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_5_0_sjt_mec.bin      | Bin 268736 -> 268736 bytes
 amdgpu/green_sardine_asd.bin     | Bin 205312 -> 209408 bytes
 amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
 amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
 amdgpu/green_sardine_mec.bin     | Bin 268224 -> 268224 bytes
 amdgpu/green_sardine_mec2.bin    | Bin 268224 -> 268224 bytes
 amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
 amdgpu/green_sardine_ta.bin      | Bin 37632 -> 37632 bytes
 amdgpu/navi10_asd.bin            | Bin 205312 -> 209408 bytes
 amdgpu/navi10_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi10_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi10_mec.bin            | Bin 268160 -> 268160 bytes
 amdgpu/navi10_mec2.bin           | Bin 268160 -> 268160 bytes
 amdgpu/navi10_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi10_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi12_asd.bin            | Bin 205312 -> 209408 bytes
 amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi12_mec.bin            | Bin 268160 -> 268160 bytes
 amdgpu/navi12_mec2.bin           | Bin 268160 -> 268160 bytes
 amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi12_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navi14_asd.bin            | Bin 205312 -> 209408 bytes
 amdgpu/navi14_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi14_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi14_mec.bin            | Bin 268160 -> 268160 bytes
 amdgpu/navi14_mec2.bin           | Bin 268160 -> 268160 bytes
 amdgpu/navi14_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi14_ta.bin             | Bin 37632 -> 37632 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268160 -> 268160 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 255232 -> 259328 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 580112 -> 580240 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 267520 -> 271616 bytes
 amdgpu/psp_13_0_0_ta_kicker.bin  | Bin 259328 -> 259328 bytes
 amdgpu/psp_13_0_10_ta.bin        | Bin 263616 -> 267712 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 250880 -> 254976 bytes
 amdgpu/psp_13_0_12_sos.bin       | Bin 439088 -> 455472 bytes
 amdgpu/psp_13_0_14_sos.bin       | Bin 405824 -> 405824 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 250880 -> 254976 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 205312 -> 209408 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 242688 -> 246784 bytes
 amdgpu/psp_13_0_6_sos.bin        | Bin 787040 -> 787040 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 242688 -> 246784 bytes
 amdgpu/psp_14_0_0_ta.bin         | Bin 250880 -> 254976 bytes
 amdgpu/psp_14_0_1_ta.bin         | Bin 250880 -> 254976 bytes
 amdgpu/psp_14_0_2_ta.bin         | Bin 270304 -> 274432 bytes
 amdgpu/psp_14_0_3_ta.bin         | Bin 282912 -> 287040 bytes
 amdgpu/psp_14_0_4_ta.bin         | Bin 250880 -> 254976 bytes
 amdgpu/psp_14_0_5_ta.bin         | Bin 250880 -> 254976 bytes
 amdgpu/renoir_asd.bin            | Bin 205312 -> 209408 bytes
 amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/renoir_mec.bin            | Bin 268224 -> 268224 bytes
 amdgpu/renoir_mec2.bin           | Bin 268224 -> 268224 bytes
 amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/renoir_ta.bin             | Bin 46080 -> 46080 bytes
 amdgpu/sdma_4_4_2.bin            | Bin 34304 -> 34304 bytes
 amdgpu/sdma_4_4_4.bin            | Bin 34304 -> 34304 bytes
 amdgpu/sdma_4_4_5.bin            | Bin 34304 -> 34304 bytes
 amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_0.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_1.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_2.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_1_3.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268160 -> 268160 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 382720 -> 386816 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 580112 -> 580240 bytes
 amdgpu/smu_14_0_3_kicker.bin     | Bin 327424 -> 327424 bytes
 amdgpu/vangogh_asd.bin           | Bin 205312 -> 209408 bytes
 amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin           | Bin 268160 -> 268160 bytes
 amdgpu/vangogh_mec2.bin          | Bin 268160 -> 268160 bytes
 amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_vcn.bin           | Bin 572368 -> 572368 bytes
 amdgpu/vcn_3_1_2.bin             | Bin 572368 -> 572496 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_2.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_3.bin             | Bin 359696 -> 359696 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_5.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_6.bin             | Bin 395664 -> 395664 bytes
 amdgpu/vcn_4_0_6_1.bin           | Bin 395664 -> 395664 bytes
 amdgpu/vcn_5_0_0.bin             | Bin 437712 -> 438288 bytes
 amdgpu/vcn_5_0_1.bin             | Bin 219472 -> 217680 bytes
 amdgpu/vpe_6_1_0.bin             | Bin 25984 -> 25984 bytes
 amdgpu/vpe_6_1_1.bin             | Bin 25984 -> 25984 bytes
 amdgpu/vpe_6_1_3.bin             | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin       | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_mec2.bin      | Bin 268160 -> 268160 bytes
 amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 242688 -> 246784 bytes
 amdgpu/yellow_carp_vcn.bin       | Bin 572368 -> 572496 bytes
 169 files changed, 0 insertions(+), 0 deletions(-)
