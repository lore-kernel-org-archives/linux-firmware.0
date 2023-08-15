Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0036EC04FDF
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC9F4C43391; Tue, 15 Aug 2023 18:00:49 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A082C433CD;
	Tue, 15 Aug 2023 18:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A082C433CD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iArSWhZjYXHSZOio6816tWtzxJqyv+E3sjlDRwnQsG7RnUznlyb++UV+IeTGZs7/Wd4B/cA7obpYNOHKWJ9asBWEyNXmOi7lRecDBucDQIV7TeY0hRLaCgYfDaTm1WK/eicOB4ecg+r86GPdB4cXO/wAvXBrHJJ1OoY8i3N/YLMkFSBeoi/bnGnmwjPIpDyAW+fMCmRBliB/bo0of6fjhYNrB9NzfeZAi8dLQEvRKb9WvE7tyB0kFI5ug+TeyEqgudmwGQTAzaHhzI5gmkHLxEBFngc9c9jvq8HEXU0kqHDzR44L2yac35zhjNkuG/vfR7hea0WoJtOygx03HokDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E998QkxMy4H+6oWckYzgxCaSm67KTHDxRl+kn38/xFY=;
 b=P8C5/qHUpS5eSkTPRBaB6a0dlv1IPEdFW4TNlTeLaqiybimV1mdtTOE3KNhKm4bdpjoEREHb7IXldUR6805vT0mo3sMyngBtazYxr7d8u6wulYPj0WphB9ptA9bP9Q0k9/F17bES1xxg7EGX3KAdGDT2WdF+yjGgxPhv93YaMvAvtnB0vprovmOl7zicP3TAU5uIL3N2DgMMvldP7otm+jglExw53eP9AtuzG0R/I+qiPxTRZREWPr2gZNdtKM+QErgk2q7sbTfscePcCWbHoREYjneQAsr7umnbrPaPYk4Jcr37rGM2OOTmmirlvQf2M+smB7ATA5mvigejo25QvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E998QkxMy4H+6oWckYzgxCaSm67KTHDxRl+kn38/xFY=;
 b=H5mblWcswBi6EQ9HuL5pUWzOLg5XLN7BV/Y243AdSFCD+fnJVVZMNYlRo0y+oU/bHHgA1I1O9YuqFXxvBhfRI8jTc5Xjuy1yIDDnU9BFEUlKPQhhO7r0wsOJq7Miyb5kSwsghgRfFX3kTfitbEgh8dVVdwWjLNLfOvzSejU/c0c=
Received: from CH2PR15CA0028.namprd15.prod.outlook.com (2603:10b6:610:51::38)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:43 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:610:51:cafe::a0) by CH2PR15CA0028.outlook.office365.com
 (2603:10b6:610:51::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:42 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 14/20] keyspan_pda: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:12 -0500
Message-ID: <20230815180018.25554-15-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d7c07b-5d29-4a60-d09a-08db9db98ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7bguRLvNVH2zgEHBFbW9k9QoEUAdFQB1hrjA9lMLo0OVYHn3benuwVpllZ/9Rfvch9Kw0sb3JOgSt0+m9WIAbg8TSLuxPLyciHCWfb/rM7i1j31fgRr0+UYI+hcWtUcMx6okcvB3eugjtdeZt3P2lo5B/eCEAB/dXu0Epk2Whze79yFALqx6oy/5MqRKQzSRCqEPTUbsaCg1Qi7hH/BLdgKm7PKbw3t+MKxrtIdsattXqeIj+q3jyxTCYFidH31tWGgTofBh41nU7tWGpP/OM62ls76X9fFE3uGW4MdPodqzfEpvRsIAh/BKBMpqIkzjq0afG5xAg4m2nMQuhFTwG/ZndUeDJbe+6Em8L6H2lefNPaD4MZPCNsOlPdDZ0ypS5Q1UvKMw7/pW2Q6+6Yb8t9V3bUaWAy3j2/nxuTwMUU0cHS7KKA4i7QbfgL8CbwIGKlPEFoVFV1LI61PqDFpUs2XghVdZkmow05xdH28Mv91D6+38GIeqFKCmnw1I7eeCW3IFgL0yeHyZaVRqCree8MjjRcOGwPcWtn3hlA9qWEDf5FRc1FPSZQWmeIlWMRuD57A5QARvqnfx7NIYzlluVXMRde9IcP9h3GL2cpvvyojYtx13+vMUkxOg7AOJT9iktl4W+0EFArN43eftlCUPAnVQ9Rrcu0fGZYxjgrVFEx4vhZ9qpm+7kKn9xL4P4MLx4uA4buFcvK7xyqZQCF/QJK+3qHirYJVVR6Y+XOVvdzRY1wM8XSV6VHrbl2BHxLYaNhunGBVbLU2banO00zN14w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(2906002)(8936002)(44832011)(8676002)(4326008)(478600001)(86362001)(83380400001)(110136005)(7696005)(426003)(16526019)(1076003)(450100002)(336012)(47076005)(5660300002)(40460700003)(41300700001)(316002)(70206006)(2616005)(36756003)(356005)(70586007)(6666004)(36860700001)(26005)(40480700001)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:42.5298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d7c07b-5d29-4a60-d09a-08db9db98ad3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 keyspan_pda/keyspan_pda.S | 4 ++--
 keyspan_pda/xircom_pgs.S  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/keyspan_pda/keyspan_pda.S b/keyspan_pda/keyspan_pda.S
index 602bcce5..adbce258 100644
--- a/keyspan_pda/keyspan_pda.S
+++ b/keyspan_pda/keyspan_pda.S
@@ -677,7 +677,7 @@ set_baud:			; baud index in r3
 	mov RCAP2L, a
 	mov TL2, a
 	;; TODO: restart xmit/receive
-	;; TODO: reenable interrupts, resume tx if pending
+	;; TODO: re-enable interrupts, resume tx if pending
 	clr c			; c=0: success
 	ret
 set_baud__badbaud:
@@ -1107,7 +1107,7 @@ string_serial_end:
 ;;; ring buffer memory
 	;; tx_ring_in+1 is where the next input byte will go
 	;; [tx_ring_out] has been sent
-	;; if tx_ring_in == tx_ring_out, theres no work to do
+	;; if tx_ring_in == tx_ring_out, there's no work to do
 	;; there are (tx_ring_in - tx_ring_out) chars to be written
 	;; dont let _in lap _out
 	;;   cannot inc if tx_ring_in+1 == tx_ring_out
diff --git a/keyspan_pda/xircom_pgs.S b/keyspan_pda/xircom_pgs.S
index 05d99dd6..e6db2cc9 100644
--- a/keyspan_pda/xircom_pgs.S
+++ b/keyspan_pda/xircom_pgs.S
@@ -710,7 +710,7 @@ set_baud:			; baud index in r3
 	mov RCAP2L, a
 	mov TL2, a
 	;; TODO: restart xmit/receive
-	;; TODO: reenable interrupts, resume tx if pending
+	;; TODO: re-enable interrupts, resume tx if pending
 	clr c			; c=0: success
 	ret
 set_baud__badbaud:
@@ -1170,7 +1170,7 @@ string_serial_end:
 ;;; ring buffer memory
 	;; tx_ring_in+1 is where the next input byte will go
 	;; [tx_ring_out] has been sent
-	;; if tx_ring_in == tx_ring_out, theres no work to do
+	;; if tx_ring_in == tx_ring_out, there's no work to do
 	;; there are (tx_ring_in - tx_ring_out) chars to be written
 	;; dont let _in lap _out
 	;;   cannot inc if tx_ring_in+1 == tx_ring_out
-- 
2.25.1

