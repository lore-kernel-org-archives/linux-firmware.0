Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A376DC001E0
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 676BEC433CC; Tue, 15 Aug 2023 18:00:49 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D05A5C43391;
	Tue, 15 Aug 2023 18:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D05A5C43391
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGaqfYwRK4Cg7WIuzm95GZyUoaEOkSenFozcAOvDdkk2+ZdBT4/hq6svsN35h7xJ74duBPDEYygHyDOzUKUrqTqjd6kGS0tfZ2u7akpcpSg2Zl5ei2gq3/9LfadzFFPlEjDmN711Nm3wuW9zl5/OJ0tVTAaqqS7KaDHsE5VPkYpnSkgz5yLsxuOHjVZCitnXDnAFc/3RNocc6JgXzGCof56rYGrLHZBNpMQCkig2ujL0rRr8iMNjxaX/j4eVD6sYFgvQVf4YdNcJ42me4JY1JBtS3gx83VH5GBZsAFZ5g0wQOqL3hm1MZfJpXFmhn94x6O7bvmXZzD0dLQ02mnUWOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ubba45B6yEJtgQM0577IWaTRCd+13dqA6Skivxc9bVQ=;
 b=JIPKdh30WOc87RAXVOQ7eSzTndCnMtr9NpjsL53qOVrNc5y2l1XEi8sIhzV4S9C9gtae5Fj5eH0kO2jtm3tGLDVb4UoEcNzBoHxeHEzB/bCMFdlsoq3lG0J1p4G5hp37o16d9fDb2dxNrPO4dhuHwZfeziUiMTz2k6+QHyO/Ceph+KyVrncCS6Vulb2ZmBSeg17A/m6NGBsZI5FabWCqhkGS9JK45FFO2tWAfVmlKg5AccL133lSSbLl+k8GM42Mr3fWBBxVoRibK1Ec6vpdibQbQoLkXY+J29ohAH/02A+9F2fTo9CCP2rPQX63UCcGqAgEh3GAetZ2hkSAPqfeXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ubba45B6yEJtgQM0577IWaTRCd+13dqA6Skivxc9bVQ=;
 b=mciggykNAu1dLwuqeg8HWMb2TJc+RPRRSyOpgiAKloK55dFBEvtaf1e72PjD0xecaa8/hO0TQfGpNqW6Egm41edU6aHC9dIIN8/cnxnll07NxKdsqEG3+/GuET7g9MW7muSA1R6q/Adtypxd8dTtZo9h1+rMNy0dAD4g3yogxXg=
Received: from BYAPR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:c0::26)
 by PH7PR12MB9152.namprd12.prod.outlook.com (2603:10b6:510:2ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:40 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::d) by BYAPR05CA0013.outlook.office365.com
 (2603:10b6:a03:c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.12 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 15 Aug 2023 18:00:39 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:39 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 07/20] usbdux: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:05 -0500
Message-ID: <20230815180018.25554-8-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815180018.25554-1-mario.limonciello@amd.com>
References: <20230815180018.25554-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|PH7PR12MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3c7415-31f4-47f8-846e-08db9db9894c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AYu5yeATwlMhIX7DIefu4eryp5bZZvHXApfGLzEeu8pL03PNoBdSTZsEqIysYV2rjM3QzQTaOl9dj3JgY3gbxTCeI66ppXkbd9I7UQhUf9E0JrC/GColugHZTRjLSGRytHo4sU4403XKwg5PcPZ8nSwKh8EUi5ZtGwztLNtso6FGfxolbg5Fc0AwthhF9xKxmQLsTB00ijMAhGJR8q16v+dQzAfVssi5pARDL449l5r+YWEwzvpnsuX5+QWzSq052c9kvlarTbDcGLf0C6hFKEGtb3EAq3fCy4Q6/6nL00185iCoqGGVS1GZdT8H5KY8GZhLQRqUnRcmQrGWa8B0kxdFkymw8PtCcN43PpBY7uu6rL5ASMpiZLuBYTJki11Br3bcHidiDV54Idj3sjyCxZyfPTxxqmH/B9SGAIaFm4tjXfVjiL1LOMFlVMPVlxocx/VVIHVfvbU8YMtZ9ebWBQ9nnLk+SE43w8XbL+qqKr26rCJ21Imh1cxc7t96auTDXfp+962oBAlqzFPmEfNshMXByU+jZy78DUpTMwLEllgVs87uacykO+wPiSvi7E05UCLlaQD5KO5djm/R1cMpYiBTDNAzQPnpVXch092pyDmUdhK/D/J1HRasJkg5ISJOooJjCo+02D62M5OXLn8Ax17TAI3ajZp/VTCKX2LbujVurbEvQQZ6VRCcmeQv7Du/JOb0ipoAhAKrW4Udkb+CFZpf2p70v6Fggv395iFjb03Av0giAMsHoSIo37tgnXODHkjbpsi9uaTWVpTsfLcZIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(110136005)(2616005)(26005)(1076003)(83380400001)(41300700001)(2906002)(7696005)(356005)(6666004)(450100002)(40460700003)(336012)(426003)(16526019)(82740400003)(4326008)(70586007)(40480700001)(8936002)(8676002)(316002)(36756003)(70206006)(36860700001)(86362001)(44832011)(478600001)(81166007)(47076005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:39.9498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3c7415-31f4-47f8-846e-08db9db9894c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9152

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 usbdux/usbdux_firmware.asm      | 16 ++++++++--------
 usbdux/usbduxfast_firmware.asm  |  6 +++---
 usbdux/usbduxsigma_firmware.asm | 14 +++++++-------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/usbdux/usbdux_firmware.asm b/usbdux/usbdux_firmware.asm
index b93a8955..a68a994d 100644
--- a/usbdux/usbdux_firmware.asm
+++ b/usbdux/usbdux_firmware.asm
@@ -170,7 +170,7 @@ ep4_isr:
 
 		
 ;;; main program
-;;; basically only initialises the processor and
+;;; basically only initializes the processor and
 ;;; then engages in an endless loop
 main:
 	mov	DPTR,#CPUCS	; CPU control register
@@ -386,7 +386,7 @@ wavetr:
 
 
 
-;;; initialise the ports for the AD-converter
+;;; initialize the ports for the AD-converter
 initAD:
 	mov	OEA,#27H	;PortA0,A1,A2,A5 Outputs
 	mov	IOA,#22H	;/CS = 1, disable transfers to the converters
@@ -410,7 +410,7 @@ init_timer:
 ;;; A/D-conversion:
 ;;; control-byte in a,
 ;;; result in r3(low) and r4(high)
-;;; this routine is optimised for speed
+;;; this routine is optimized for speed
 readAD:				; mask the control byte
 	anl	a,#01111100b	; only the channel, gain+pol are left
 	orl	a,#10000001b	; start bit, external clock
@@ -427,7 +427,7 @@ clock:	setb	IOA.0		; SCLK = 1
         rl      a               ; next Bit
         djnz    R2,bitlp
 
-	;; continue the aquisition (already started)
+	;; continue the acquisition (already started)
 	clr	IOA.2		; clear the DIN bit
 	mov 	R2,#5		; five steps for the aquision
 clockaq:setb	IOA.0		; SCLK = 1
@@ -473,7 +473,7 @@ zerob2:	mov	a,r5		; get r5 in order to shift the mask
 	
 
 	
-;;; aquires data from A/D channels and stores them in the EP6 buffer
+;;; acquires data from A/D channels and stores them in the EP6 buffer
 conv_ad:
 	mov	AUTOPTRH1,#0F8H	; auto pointer on EP6
 	mov	AUTOPTRL1,#00H
@@ -499,7 +499,7 @@ convloop:
 
 
 
-;;; initilise the transfer
+;;; initialize the transfer
 ;;; It is assumed that the USB interface is in alternate setting 3
 initeps:
 	mov	dptr,#FIFORESET
@@ -541,7 +541,7 @@ initeps:
 	mov	a,#00h
 	movx	@DPTR,a		; can receive data
 	lcall	syncdelay	; wait until we can write again
-	movx	@dptr,a		; make shure its really empty
+	movx	@dptr,a		; make sure its really empty
 	lcall	syncdelay	; wait
 
 	mov	DPTR,#EP6CFG	; ISO data from here to the host
@@ -560,7 +560,7 @@ initeps:
 	mov	a,#10100000b
 	movx	@dptr,a
 
-	;; enable interrups
+	;; enable interrupts
         mov     DPTR,#USBIE	; USB int enables register
         mov     a,#2            ; enables SOF (1ms/125us interrupt)
         movx    @DPTR,a         ; 
diff --git a/usbdux/usbduxfast_firmware.asm b/usbdux/usbduxfast_firmware.asm
index 0d8e7f80..fa946893 100644
--- a/usbdux/usbduxfast_firmware.asm
+++ b/usbdux/usbduxfast_firmware.asm
@@ -158,7 +158,7 @@ ep8_isr:
 
 		
 ;;; main program
-;;; basically only initialises the processor and
+;;; basically only initializes the processor and
 ;;; then engages in an endless loop
 main:
 	mov	dptr,#REVCTL
@@ -254,7 +254,7 @@ initGPIF:
 	mov	dptr,#EP6GPIFFLGSEL
 	lcall	syncdelaywr
 
-	mov	a,#00000001b	; stop when buffer overfl
+	mov	a,#00000001b	; stop when buffer overflow
 	mov	dptr,#EP6GPIFPDFSTOP
 	lcall	syncdelaywr
 
@@ -294,7 +294,7 @@ initGPIF:
 
 
 
-;;; initilise the transfer
+;;; initialize the transfer
 ;;; It is assumed that the USB interface is in alternate setting 1
 initeps:
 	mov	DPTR,#EP4CFG
diff --git a/usbdux/usbduxsigma_firmware.asm b/usbdux/usbduxsigma_firmware.asm
index 38f5f0e8..89808ffa 100644
--- a/usbdux/usbduxsigma_firmware.asm
+++ b/usbdux/usbduxsigma_firmware.asm
@@ -288,7 +288,7 @@ noepsubmit:
 	
 		
 ;;; main program
-;;; basically only initialises the processor and
+;;; basically only initializes the processor and
 ;;; then engages in an endless loop
 main:
 	mov	DPTR,#CPUCS	; CPU control register
@@ -332,10 +332,10 @@ mloop2:	nop
 	sjmp	mloop2		; loop for ever
 
 
-;;; initialise the ports for the AD-converter
+;;; initialize the ports for the AD-converter
 initAD:
 	mov	r0,#MAXSMPL	; length of channellist
-	mov	@r0,#0		; we don't want to accumlate samples
+	mov	@r0,#0		; we don't want to accumulate samples
 
 	mov	ASYNC_ON,#0	; async enable
 
@@ -348,7 +348,7 @@ initAD:
 	mov	a,#10100000b	; gpif, 30MHz, internal IFCLK -> 15MHz for AD
 	lcall	syncdelaywr
 
-	mov	SCON0,#013H	; ser rec en, TX/RX: stop, 48/12MHz=4MHz clock
+	mov	SCON0,#013H	; set rec en, TX/RX: stop, 48/12MHz=4MHz clock
 	
 	mov	dptr,#PORTECFG
 	mov	a,#00001000b	; special function for port E: RXD0OUT
@@ -458,7 +458,7 @@ registerWrite:
 
 
 
-;;; initilise the endpoints
+;;; initialize the endpoints
 initeps:
 	mov	dptr,#FIFORESET
 	mov	a,#80H		
@@ -499,7 +499,7 @@ initeps:
 	mov	a,#00h
 	movx	@DPTR,a		; can receive data
 	lcall	syncdelay	; wait until we can write again
-	movx	@dptr,a		; make shure its really empty
+	movx	@dptr,a		; make sure its really empty
 	lcall	syncdelay	; wait
 
 	mov	DPTR,#EP6CFG	; ISO data from here to the host
@@ -844,7 +844,7 @@ startadcint:
 
 	movx	a,@dptr		; interval is the 1st byte
 	inc	dptr		; data pointer
-	sjmp	startadc2	; the other paramters as with startadc
+	sjmp	startadc2	; the other parameters as with startadc
 	
 ;;; config AD:
 ;;; we write to the registers of the A/D converter
-- 
2.25.1

