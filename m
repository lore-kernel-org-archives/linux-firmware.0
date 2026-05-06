Return-Path: <SRS0=B7Ho=DD=ti.com=p-bhagat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9309ECD3424
	for <linux-firmware@archiver.kernel.org>; Wed,  6 May 2026 05:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E713C2BCC4; Wed,  6 May 2026 05:44:56 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8E96C2BCB8
	for <linux-firmware@kernel.org>; Wed,  6 May 2026 05:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8E96C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgwnlEzVgiXTshjHVi5ruM41Qjmr693EsjP/Gte2OmM1YYu714gkMQLr8stnyOU3J+BZ0D1yo11fF7urh462dpTkIipk7iFglpk1ZoeUbk5l4Ei8DeHE4xrYXZURnw3ZrjYcj3u1GozglnwM0ZVbFykqUAA2T6gihUOgt9TrGeNC7ZvtZ0McVA8K8nXHTmH3NUFp1XSlz77dND3XdadIEmhGKaULw4a4BcpqJ7q2dy7BKbOtoqlDRen09/DxORfifcrxwKlelfYdxMBzdE7l89FwfmQc9+3hCVABRmoos6b/0MpHQ3g+tvWiL78A72Q36jgOIYGtCHiQjLJv4S5OrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50xLgPGrOI6u9rhG6wkuCWJM5D2zwsnvQ1gmXsYYkJM=;
 b=IM4SgPkAkafAsGAaaptX5HkzANdM2g8dCmZMJd6EHzO/ebBBGnk4IGbqMW7f1xi0j43hWNOPBD7BpX2rZut9a2GvDgnCrRq7GBVGd+Ox0cbDL9Uc6YA1VFH+gKwQZyjWEF52xbB0HoKJpmtMgO+yRRp2tL27py2U+bSXELM+Wd0Hu2VRVKtwykgPbI7RIeJaH62wCl4j6+NY2mcenrf5PymRxvtRNIxYMErgsSpi44VJQcRfkHGj65h7GpTdaDBFeSiIpmgWbhpUcuxqsxil7L8JzTBSa3SsFVj/B2HDbh394nIctMmIeHN+AOXEYJhxmfWFHYACoAfdIteSAI7sDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50xLgPGrOI6u9rhG6wkuCWJM5D2zwsnvQ1gmXsYYkJM=;
 b=RGhJMM7jEhb2sbZzYd9Eg4etnYePYLRLfKJgSaXt57cwM+UzAp4TdllKxP7RYSmoTQF3Xo/X0C1EpgHYF6F56pZbckg5nwQJBlaeD8io537buzEzMIZoDTpp51t0VIQ4ybW0VBBUFoEhgywwegDYTIff2lJNlaC0NsbEV3lbQUg=
Received: from SJ0PR03CA0202.namprd03.prod.outlook.com (2603:10b6:a03:2ef::27)
 by IA0PR10MB6721.namprd10.prod.outlook.com (2603:10b6:208:441::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 05:44:52 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::3a) by SJ0PR03CA0202.outlook.office365.com
 (2603:10b6:a03:2ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 05:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 05:44:51 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 00:44:51 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 6 May
 2026 00:44:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 6 May 2026 00:44:51 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6465io1x405037;
	Wed, 6 May 2026 00:44:50 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <v-singh1@ti.com>
Subject: [PATCH] ti: Add PCM6240 firmware with multiple audio profiles support
Date: Wed, 6 May 2026 11:14:34 +0530
Message-ID: <20260506054434.1413844-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|IA0PR10MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: b7eb4076-68b3-4379-7fd0-08deab329813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S0hVIjTnyF2paaTLZnQUK9Mjnxn4XwbFUJOlLiTl0jjjQUT8/KVzbs3GzmXeQBhmZGCsDptkGd8DB5MZEUiOOqLAoWYR+uYVEdeuBt8plYzVg0ORyC4YbEL7t8x2A3wfuvEXMvLuo/LAeVSS1pPI+s5UcOrHWe6697o2OlXLvNFeWKHWH3x+uoGCUV8NHGOB5QxakX6XWTZguGBI5PMyR2QHObLXlfYDbW0q3RD4SokrEMjR/Ap7Xc8RbrxPheJ0YaE9mi3a/ih6+WajxNHB5pi60shPDZp03FGLj44sKl74ePAMfzql3F3xRu2y+8vh+bladzxipz7QlkAqusKiWLZ9V8Ti/9SqIpiUF8asbTXHobhcNfX/4uoquJIqy7SgQuZC8kRWR/x1hEsLznAwfDDymiAzeAGKxwvvy8aZaYg24F50kM2GV4amaDTvlrSMkEer/LgzptxjW2QaUbp66F1K/eHJdljMek+yEeerldg7v6yvY2+19Rjx/65KoU6sY6G5FdhPdBQxnGDfOIbKnUVZEc2vM0bGiliLd0BIGmh8XzLaOZnWGWCunmzT1ALGcYW+DKgvE9cVRZDFRnV3ohRBK+1PZmas5b90exna/mIBXgQGubWcx8tRQ320WPfxge+FMtBw+/NKPcsE6zMCFCRo7Xcryjm2fCnZGXeJkLrh3KWalESn1foYGdctfwVUDwJrTd6lpSxNP7OKZmD43v4AKGDXchg2DrhTv6sCmgA=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dEDO7dvpbXtRLy1fo+wtBZQuViK3oaCKasq3SK4ET+ojeTC1ruxi2tJOYmkQq7nSUwDER2jCgFEkgnjDYm5hKBHFTgl9ihHcEr0OCVJoe/ZCFuUyQbiYuWOLMLBwmTQZhiz6oC3C+V/ZxmY0W2IQ5FUe4q8ghy15A3Vt28aWShJJ9dhSMq6jbcK8Mwlx1X7gi3xD4uTB3InYfJOFsycYgQ6Ed9YuQP//9TFL1KQwdtp+Yk+ukVt3HT6aYDcrf4VGqI4R1IieX+bLTDM5FvYEY+A/uPL6bxqf70BVjt444bM4wpRxeqysNMyQo2qdgKtdXO/OYeNppL4OO7q8sNxmZS0f19kORi9kHDJ1MR5IYXgfusP2z0bucoV6GnrlPclfUA26dT2U5YpGYAm6f2mvzOGocPoi1NSobxveQR3hS7LHS6DrkbvKsqOTQxol98Je
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:44:51.9980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7eb4076-68b3-4379-7fd0-08deab329813
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6721

Add Texas Instruments PCM6240 Family Audio ADC/DAC device firmware
with support for multiple audio configuration profiles:

Profile 0: 8ch Non-Interleaved
Profile 1: 8ch Interleaved
Profile 2: J2A Stereo
Profile 3: J2B Stereo
Profile 4: J1A Stereo
Profile 5: J1B Stereo
Profile 6: J2A,J2B 4ch Non-Interleaved
Profile 7: J2A,J2B 4ch Interleaved
Profile 8: J1A,J1B 4ch Non-Interleaved
Profile 9: J1A,J1B 4ch Interleaved

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 WHENCE                            |  12 ++++++++++++
 ti/pcm6240/pcm6240-i2c-1-2dev.bin | Bin 0 -> 2684 bytes
 2 files changed, 12 insertions(+)
 create mode 100644 ti/pcm6240/pcm6240-i2c-1-2dev.bin

diff --git a/WHENCE b/WHENCE
index 48c471e2..95d846cf 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9984,3 +9984,15 @@ Driver: pcie-rcar-gen4 - Renesas R-Car Gen4 PCIe controller
 File: rcar_gen4_pcie.bin
 
 Licence: Redistributable. See LICENCE.r8a779g_pcie_phy for details.
+--------------------------------------------------------------------------
+
+Driver: PCM6240 - Texas Instruments PCM6240 Family Audio ADC/DAC Device
+
+File: ti/pcm6240/pcm6240-i2c-1-2dev.bin
+
+Version: 1.0
+
+Licence: Redistributable. See LICENCE.ti-tspa for details.
+
+Info:
+Firmware file generated via https://git.ti.com/cgit/lpaa-android-drivers/tasdevice-linux-driver/tree/json/tool/Non_Integrated_Bin_Tool_v1.4.1 and branch-master.
diff --git a/ti/pcm6240/pcm6240-i2c-1-2dev.bin b/ti/pcm6240/pcm6240-i2c-1-2dev.bin
new file mode 100644
index 0000000000000000000000000000000000000000..089aa34884435158c9f2f57f47daecd77c4e364a
GIT binary patch
literal 2684
zcmds&ze)o^5XNWkPNVTIq_MNO!dCEth@ed*C`Pb|>BT<>1|$*l2LuaW#b?k5u-8Yh
z$OBmT2>$jikw6lXO*V}SUvj(b?#wse%&bWEDg3C^Mbr{dwddoC5^)qiy^&>oBZYji
zHi&QLgXo|6SO2BB6I~R-X!okt3iqyW!?Q+xt5$Et4|nlpC%&12tgAfr%DyUaMTwK1
zA<8b_O7iL4Sry3;`IQ%uHI{r&Bw(IHoBex{1NIfc5jX|SACVSlcg0Nv^Esr_`?ZO-
zIG$SP!^AEJ{blUB*v(9`I}{tUxZoO|d+O29N4EPA4)8UHpEJj%U}zUTe6$FN&vdZ~
z%Y`DD6YA7CCu8CU7N;LNHlJ)Sfl+y*^=1s^4Y3)FN%NgN0qw3DpC@lzv<XJpfwvxs
zort?c>khZWIk{<@2HXO+=X%`!YG50GfK_gVupDXKv}`l!M%`J}%^9N``C+P?=B9O<
zhnrR1EOLu_ymoqB`oyS9r@g34l2yT|I>@um7^*k=P|~L-_9CnGmujfFn)1{n7T$L)
ka_zsqeO*mo8JBwO!g*o3TFl`=uBJQ_UE#XW_tX~GUpXDkCIA2c

literal 0
HcmV?d00001

-- 
2.34.1

