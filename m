Return-Path: <SRS0=SjPH=IG=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DC4CCF2C3
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Oct 2026 20:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D2751F000C6; Fri, 16 Oct 2026 20:19:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.13
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1792181960;
	b=3mNiAnoP1JzRFKO/kPF1TvlVT2ocsO0+UCtu13Ee89MGbZBr5bm1samRNSmoXaJi6PY6
	 z3Oh+Vf9KKUy0C53Ei+72WhA9mOGdYBUEA87DD7V2anxfTZJyqlAHVaC8UQXetPRCWDL/
	 OhGTwauteRQeZsG1LpM2Ym57BQVciKikcptgagZtoIzWqK7MCajf2ngF6aV9kcaoi2kHB
	 QJe+UA84z4PJfYpk3jSEaVo+EXvxDTaXinmk226/fuLp4ifL0DV39wvoUIRKHdO4DlxxM
	 jqPAk+I3LKZcsrEu5I3CGE7+leIyV3mjb8TzRr8RzsfSBHy5NPE8hLLb9HGdLahmGrA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792181960;
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
	bh=6X6Jvs7+dLMiOPrD6XO95frv90h9Nxfhw9ARIwlAgiM=;
	b=ieU5WvhkX/lS3z/REQE9bhx9mdyYStRAm6Ekul54eqr7vE5TlFlAMlDxJ/EYcTDLLWPP
	 4aMuoSxFUJ1jaGkUlSCaynuD+PaeCE1WcadnqpMxMxqz85UoKL8GUegB3RSF+njip8+Hb
	 qDHQqcpggSYnh2CtjMjE9/2Z7p/TOQoGLCCtOD3ojckV4TPt9D3ndPS3uouhZlLK7xVEw
	 iVeqqP8E+W1cuVSJSBeORkARFnBHKYPyHtWXaCV5G9GUfJN/ekKaEsQDVxfgbBoDKkwPR
	 oYpP6UifQKeRLrCF90pZTiACflxq3n7fGu2F6G8wqSLK2uKIRm0cKnYZAVorsrL3ndQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C9clJ1NO;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.13
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EE931F000C5
	for <linux-firmware@kernel.org>; Fri, 16 Oct 2026 20:19:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=C9clJ1NO
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9EE931F000C5
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBtbzP7tv3gnse0sLw25gAlzDi8NKYvoBOMvEixd7spKcCZN1Z2g34MqF2g6Q+eJn5V85ZP8m5JnhXpmjhzutXHjaJYNWQHBq2cM+8CLQMAshSXhhPV7Ucibr/pTprEHcP4QBwqdtb2eWZk9JUanBIM8OtBQDugKlCNgaY6bRzaTebFUw+4vA5PmiJcovhtzWvsr4fcr8RebtrUwBVydln5MxWbVS/9hKXVbnapnUk7awkNQBda8JmLp90rejiQ09hR/CGZ1bFDixEPd1Gndsvtmryofk4pIpXblGcxZODnQ1RL/MEJ3OvjlsNRv6Xqdre9FoAfScprSMawmETSNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6X6Jvs7+dLMiOPrD6XO95frv90h9Nxfhw9ARIwlAgiM=;
 b=cFPIJWOFzAGNq7UzrLGlnJmpuKtEKWhT/SsnfsTJeLkKGyyxKI/fWObaRWfJY2uDIzEcqN4+PMxPQ1DwsCSj2bc73AxEgLvfg8/6ibKEVTTtAcbLEXiwkBrYFH2WbboO1nQcTaq6fxM6DXtfw52dS0cBss5v2RrUivkkhcr8oKBv3iPEzRUP0PFfWLQ0iZTYSJmzaytM3NaP6w23mIEHwcJ8w5UWrYTf15vp1XHGUHZbozrwZ9bXv8U/ilFkpNCntt6w5jjbIiU6kbq6UMoOvUM4l79hV4p5yJRzU+VoQcb8DprTYu4qXk8dBaGot4paqubDXcJbFmYtPKwYMm0mkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X6Jvs7+dLMiOPrD6XO95frv90h9Nxfhw9ARIwlAgiM=;
 b=C9clJ1NOw20oc1s74M3Ybf5Qnon+hUeqbR86iRWMGNOE/oakSPVy2KLNLaMRT6N5vKfFKR2ohZT2ljWMo53B640VQ5D9le9cb+prXXE23JHRCG44nCMq/6MTZSpK6q5mVBOhpBDygV1eGP1jjPctjkFhYc/Vw51QUAFmKZwEnps=
Received: from PH8P221CA0058.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::7)
 by AT6PR12MB026552.namprd12.prod.outlook.com (2603:10b6:170:116::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 20:19:15 +0000
Received: from PH4PEPF0000B60C.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::89) by PH8P221CA0058.outlook.office365.com
 (2603:10b6:510:349::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Fri,
 16 Oct 2026 20:19:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH4PEPF0000B60C.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.0 via Frontend Transport; Fri, 16 Oct 2026 20:19:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 15:19:03 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 15:19:03 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 15:19:03 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu 2026-10-16-1
Date: Fri, 16 Oct 2026 16:18:58 -0400
Message-ID: <20261016201858.2229323-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60C:EE_|AT6PR12MB026552:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ac460fc-df14-474b-6355-08df2bc2c017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|261009223027099003|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bBSvaJuEi9TnHzRvZrZc3yz0GBrUwLloulcUZ/kck8RlNqepiHbClO3X6TK29EUdMWGSUP9RQIhPVls5sw6SRqOuDSxGYdtf+oG8U/fVSGm1qfC8AQ02QfEaRYUgzg4fM+fXYYU7biGEBBGT36OxyvL7JmrK1iJiC+ckCbEkccCAu83Z1PbzIOkRlqB52wjnYHgOVIfqbPBg66mG5l6oRmcdQzKnH53xtDnteXMtw6yg0vaUHkn8SDBNrZXJk4E5Z7O9QxhUsJ6AuzLVQYX9T/mCjPAAF2WziO8V/l1Bvmp5ytwgwpApvzHwNi1p9kHJ/KeScR0nFY3KauC+Ou43syYkMotLs/h4pWWXno7vfe3449SCKkRZFdYmYL/5MJXunDDbKe6ZMw37UCaEU5AaRjDORt0E5EJvadLLpeom9lQ+1te++MHgOCvpVGXMEYuD8noAFxYXA4MmuKlz+I2q3X4mIo3DXSXJ3bo/IOtpidovJOkKUcv+NZmhZgIoZY6GX9glKreNsNG9T6KnKz33SKgE45oY741tNcDxRztikw8duQVqELU5FFWEYk6Es5bhxIfRf4eQFXsE6BGLuSbLWDNUEWK+1WKgbsdP8hraam66aKRqm/JTA2GUvZ/RDPg6OASsJROQM2I7k9E3lajQGnbXsGnalNmsyg2mfk/LNPWRY67ug1WlwO4p+DvRZTbFUvzaoE4mF+tbGxk6s8bALw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(261009223027099003)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9fIKtnHX4Q+Q4Qd+In6XoVgKXcT1MJiGwoBkA0jb5v1WP/1O4NbG+3mYR4A4kDH4R7LOT1m7tC1Zn1rN7qgGQe2wVhkUWOpcHgR3wCnsC/4Q+IszDHARmHR33zp0+9xbDcXCQ7nHFy6ewhG8QeHttR7IBURKbxfJd8v24ZwhAzFUe8F2cUSOIQrLw6mC2EUl72D6GGBDaa02ivKuVZwyqN09SQbr2mbSgf4duoCLDZJ8jIxSeVnd/QrjcMKzsyexTS8DoxsEDzrDdvRhgS64NidbZ2mb17R3gNfN+8S7iEfNGpo1kDRdAM5g90DPQi1S8pB3pccmup+rw+Yyq2HuXXCoiJDI1N4ogwCDTgQnxh08BURHxfryiM7qU7qvVQ6VGxnbWnt4OIWhvA9K/j3FrV7lvK4dGma9kHVozzdIFP0e7IwB2DsyXUeBbY6+WCSP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:19:15.5647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac460fc-df14-474b-6355-08df2bc2c017
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B60C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB026552

Hi,

Updated GPU firmwares.  Please apply.

The following changes since commit 9ff0f3abf72d11793662a04fcfd59c9341804b1e:

  amdgpu: DMCUB updates for various ASICs (2026-10-16 10:01:40 +0800)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-10-16-1

for you to fetch changes up to 6f9bc511052c5e990fe606445c175fc4f35d1b3f:

  amdgpu: update vangogh firmware (2026-10-16 14:45:12 -0400)

----------------------------------------------------------------
amd-2026-10-16-1:

GPU firmware updates

----------------------------------------------------------------
Alex Deucher (54):
      amdgpu: update GC 9.4.3 firmware
      amdgpu: update PSP 13.0.6 firmware
      amdgpu: update VCN 4.0.3 firmware
      amdgpu: update green sardine firmware
      amdgpu: update GC 11.5.2 firmware
      amdgpu: update PSP 14.0.4 firmware
      amdgpu: update GC 11.5.3 firmware
      amdgpu: update PSP 14.0.5 firmware
      amdgpu: update PSP 15.0.0 firmware
      amdgpu: update VCN 5.3.0 firmware
      amdgpu: update GC 11.7.1 firmware
      amdgpu: update PSP 15.0.9 firmware
      amdgpu: update GC 9.4.4 firmware
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
      amdgpu: update VCN 4.0.0 firmware
      amdgpu: update GC 11.0.3 firmware
      amdgpu: update PSP 13.0.10 firmware
      amdgpu: update GC 11.0.2 firmware
      amdgpu: update PSP 13.0.7 firmware
      amdgpu: update VCN 4.0.4 firmware
      amdgpu: update GC 12.0.0 firmware
      amdgpu: update PSP 14.0.2 firmware
      amdgpu: update GC 12.0.1 firmware
      amdgpu: update PSP 14.0.3 firmware
      amdgpu: update VCN 5.0.0 firmware
      amdgpu: update GC 11.0.1 firmware
      amdgpu: update PSP 13.0.4 firmware
      amdgpu: update VCN 4.0.2 firmware
      amdgpu: update GC 11.0.4 firmware
      amdgpu: update PSP 13.0.11 firmware
      amdgpu: update picasso firmware
      amdgpu: update PSP 13.0.5 firmware
      amdgpu: update VCN 3.1.2 firmware
      amdgpu: update raven firmware
      amdgpu: update raven2 firmware
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
 amdgpu/beige_goby_vcn.bin       | Bin 580112 -> 582800 bytes
 amdgpu/dimgrey_cavefish_ta.bin  | Bin 259328 -> 259328 bytes
 amdgpu/dimgrey_cavefish_vcn.bin | Bin 580112 -> 582800 bytes
 amdgpu/gc_11_0_0_me.bin         | Bin 315120 -> 198608 bytes
 amdgpu/gc_11_0_0_mec.bin        | Bin 406528 -> 272720 bytes
 amdgpu/gc_11_0_0_mes1.bin       | Bin 220480 -> 171968 bytes
 amdgpu/gc_11_0_0_mes_2.bin      | Bin 260624 -> 202112 bytes
 amdgpu/gc_11_0_0_pfp.bin        | Bin 232096 -> 107984 bytes
 amdgpu/gc_11_0_1_mes_2.bin      | Bin 267008 -> 266976 bytes
 amdgpu/gc_11_0_2_me.bin         | Bin 324080 -> 198624 bytes
 amdgpu/gc_11_0_2_mec.bin        | Bin 406528 -> 272720 bytes
 amdgpu/gc_11_0_2_mes1.bin       | Bin 221408 -> 172256 bytes
 amdgpu/gc_11_0_2_mes_2.bin      | Bin 263696 -> 202112 bytes
 amdgpu/gc_11_0_2_pfp.bin        | Bin 234944 -> 107968 bytes
 amdgpu/gc_11_0_3_me.bin         | Bin 324080 -> 198624 bytes
 amdgpu/gc_11_0_3_mec.bin        | Bin 406528 -> 272720 bytes
 amdgpu/gc_11_0_3_mes1.bin       | Bin 221216 -> 172064 bytes
 amdgpu/gc_11_0_3_mes_2.bin      | Bin 263760 -> 202176 bytes
 amdgpu/gc_11_0_3_pfp.bin        | Bin 234944 -> 107968 bytes
 amdgpu/gc_11_0_4_mes_2.bin      | Bin 267008 -> 266976 bytes
 amdgpu/gc_11_5_0_mes_2.bin      | Bin 263632 -> 266944 bytes
 amdgpu/gc_11_5_1_mes_2.bin      | Bin 263920 -> 267232 bytes
 amdgpu/gc_11_5_2_mes_2.bin      | Bin 263632 -> 266944 bytes
 amdgpu/gc_11_5_3_mes_2.bin      | Bin 263632 -> 266944 bytes
 amdgpu/gc_11_7_1_mes_2.bin      | Bin 256928 -> 267200 bytes
 amdgpu/gc_12_0_0_me.bin         | Bin 463392 -> 267568 bytes
 amdgpu/gc_12_0_0_mec.bin        | Bin 455648 -> 259584 bytes
 amdgpu/gc_12_0_0_pfp.bin        | Bin 354912 -> 159616 bytes
 amdgpu/gc_12_0_0_uni_mes.bin    | Bin 734432 -> 299408 bytes
 amdgpu/gc_12_0_1_me.bin         | Bin 463424 -> 267600 bytes
 amdgpu/gc_12_0_1_mec.bin        | Bin 451552 -> 259584 bytes
 amdgpu/gc_12_0_1_pfp.bin        | Bin 354912 -> 159616 bytes
 amdgpu/gc_12_0_1_uni_mes.bin    | Bin 734432 -> 299408 bytes
 amdgpu/gc_9_4_3_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_3_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_mec.bin         | Bin 268736 -> 268736 bytes
 amdgpu/gc_9_4_4_sjt_mec.bin     | Bin 268736 -> 268736 bytes
 amdgpu/green_sardine_asd.bin    | Bin 209408 -> 209408 bytes
 amdgpu/green_sardine_vcn.bin    | Bin 405952 -> 407232 bytes
 amdgpu/navi10_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/navi10_vcn.bin           | Bin 405952 -> 407232 bytes
 amdgpu/navi12_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/navi12_vcn.bin           | Bin 405952 -> 407232 bytes
 amdgpu/navi14_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/navi14_vcn.bin           | Bin 405952 -> 407232 bytes
 amdgpu/navy_flounder_ta.bin     | Bin 259328 -> 259328 bytes
 amdgpu/navy_flounder_vcn.bin    | Bin 580112 -> 582800 bytes
 amdgpu/picasso_vcn.bin          | Bin 369408 -> 369376 bytes
 amdgpu/psp_13_0_0_ta.bin        | Bin 271616 -> 271616 bytes
 amdgpu/psp_13_0_10_ta.bin       | Bin 267712 -> 267712 bytes
 amdgpu/psp_13_0_11_ta.bin       | Bin 254976 -> 254976 bytes
 amdgpu/psp_13_0_4_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_13_0_5_asd.bin       | Bin 209408 -> 209408 bytes
 amdgpu/psp_13_0_5_ta.bin        | Bin 246784 -> 246784 bytes
 amdgpu/psp_13_0_6_sos.bin       | Bin 787040 -> 787040 bytes
 amdgpu/psp_13_0_7_ta.bin        | Bin 246784 -> 246784 bytes
 amdgpu/psp_14_0_0_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_1_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_2_ta.bin        | Bin 274668 -> 278764 bytes
 amdgpu/psp_14_0_3_ta.bin        | Bin 287276 -> 291372 bytes
 amdgpu/psp_14_0_4_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_14_0_5_ta.bin        | Bin 254976 -> 254976 bytes
 amdgpu/psp_15_0_0_ta.bin        | Bin 275088 -> 283312 bytes
 amdgpu/psp_15_0_9_ta.bin        | Bin 275088 -> 283312 bytes
 amdgpu/raven2_vcn.bin           | Bin 369408 -> 369376 bytes
 amdgpu/raven_vcn.bin            | Bin 369408 -> 369376 bytes
 amdgpu/renoir_asd.bin           | Bin 209408 -> 209408 bytes
 amdgpu/renoir_vcn.bin           | Bin 405952 -> 407232 bytes
 amdgpu/sienna_cichlid_ta.bin    | Bin 386816 -> 386816 bytes
 amdgpu/sienna_cichlid_vcn.bin   | Bin 580112 -> 582800 bytes
 amdgpu/vangogh_asd.bin          | Bin 209408 -> 209408 bytes
 amdgpu/vangogh_vcn.bin          | Bin 572368 -> 575056 bytes
 amdgpu/vcn_3_1_2.bin            | Bin 572496 -> 575056 bytes
 amdgpu/vcn_4_0_0.bin            | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_2.bin            | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_3.bin            | Bin 359696 -> 359824 bytes
 amdgpu/vcn_4_0_4.bin            | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_5.bin            | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_6.bin            | Bin 395664 -> 403856 bytes
 amdgpu/vcn_4_0_6_1.bin          | Bin 395664 -> 403856 bytes
 amdgpu/vcn_5_0_0.bin            | Bin 438288 -> 440400 bytes
 amdgpu/vcn_5_0_1.bin            | Bin 217680 -> 218256 bytes
 amdgpu/vcn_5_3_0.bin            | Bin 449296 -> 449296 bytes
 amdgpu/vpe_6_1_1.bin            | Bin 25984 -> 25984 bytes
 amdgpu/yellow_carp_ta.bin       | Bin 246784 -> 246784 bytes
 amdgpu/yellow_carp_vcn.bin      | Bin 572368 -> 575056 bytes
 87 files changed, 0 insertions(+), 0 deletions(-)
