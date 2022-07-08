Return-Path: <SRS0=euG8=XN=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EBAC433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jul 2022 16:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF2BAC341C0; Fri,  8 Jul 2022 16:10:08 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0285C341C6;
	Fri,  8 Jul 2022 16:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0285C341C6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOp+BX+TZ9qEUcz+151ilV5nP0e4607TkfjAm1WMKf0vCnTOX/Aw0kILZBndGi5hvYs0K/7RlrUr0aDQEzxTWIavpskO43vnso/qeehhOpRx7qMfN3IWiFMejDs6EykM4+76fOJ4lmT4gfOTostMhbUd2jJwT4MHrhn38EXzQePV/QVi2+yqxs1ji1jVUYnCb39kpONk6p8jK6BhlFXQR8x2LkC5OuY8zzGR5AKHVq/mQjVD/GoTCFYquRXdLbK/bUqJmsAW0nipU0jCEm5rj3IIbEf8lMBh4aKca+tRgyU7SIkcoBe4ALmBzm1L7cce9PGJOj4XXXs4CCp16Tw8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfolkT5H6ytM8eG+4K7OCRjIybcu90S5hDcTjE/8KW8=;
 b=YkUx/tgPrp+lj67AsE2WzsTYv/Cug0tMS7+LGuDFIluF6vyLJq94QVZ+OJmMqMydiv/FW3u67afnQrsK9NlCmJdEDw5UoAU38gpfvNH1NygXJvDXlLqA5Cs0mqmJum4Iw7V8YfiSwGK5LDsUNmuijJ6T2tjLvhhrlOqJkHW2CATgiLAfjzX07XBIhLRsw9OQt4OVs/oLONFoAkdPD+7N+ufZ5V47hT9rVaua7sehmho+Y7YjJI4zGFc7QgvKEjqDyHdvy7cYZ/ZJq3Ne2STGvNCYTWkqfL4O1AgkUbD4L4FJQAjoMeBm44TZWzBzlry9NmaIGIDoBauQ5+XjQE2kWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfolkT5H6ytM8eG+4K7OCRjIybcu90S5hDcTjE/8KW8=;
 b=R+6VWcpEm5suFX1LCF4IJTOo3GNm2AWtNBNzXn1KXVNZr7ZFrRq1+HVOCDcK0TkzTe4FmhR/w4bnSEZ76IwZpAYmuQE5JhE3IgApsAfHHWucjXj4pz8HG5HVQAsNY/2xMlMiSiOCltcmKwr2U6RrrrtYoad+Wp+Di+VmWy/5Zz8=
Received: from MW4PR04CA0043.namprd04.prod.outlook.com (2603:10b6:303:6a::18)
 by BN6PR12MB1442.namprd12.prod.outlook.com (2603:10b6:405:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Fri, 8 Jul
 2022 16:10:05 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::26) by MW4PR04CA0043.outlook.office365.com
 (2603:10b6:303:6a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Fri, 8 Jul 2022 16:10:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 16:10:05 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 8 Jul
 2022 11:10:04 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
CC: <pbrobinson@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] WHENCE: Correct dangling symlinks
Date: Fri, 8 Jul 2022 11:09:51 -0500
Message-ID: <20220708160951.132-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4e1660f-b1ef-4a8b-ef96-08da60fc5268
X-MS-TrafficTypeDiagnostic: BN6PR12MB1442:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QPFGyPWvbzrlD32b9OyUm/I2kDn/TpuCyh0QIx/TMs8dBw/HMY5rwzB2Y33ZHiMUIyT2EFjW8w1LvWEmsyNgeEWGI/2afWXcTNJeVNXCZluvCh8r/xP3zWXFfDO+PkohvMMbZB/QpHFC8dO0s2mDf2frruxdzOVksBYzAUPKlpxpj2H6iooSQDG0Q3c8YhV2dXAPyEfUEyQibbxR6GF2ZoA+bx5Y5bYHHPpn7kX1wCH+yBQWenYS669UagYgFOCT38QBjqWv67rMI1fRVgsmzpUYpsNm6hk4YTSv2VjS7/e93e5KuOzKtjsn6Q6tbKI6/v7S5UBn0zKv50/gxzWfVx4Nbcl/qlnozSEvmVmhsIP4cw7PHa8lryz9/5yEzgoSCNypjAjB5t1UA2s9YOdr9i+rkHjAxhyvWeayrvM/1SSYeuf/dgQoLRSDQS9qei15gPHi4q33b9IXjINmF0+nZyNSkX0wYG34dYpmCLfaR82I4IeObCAzu99MwN6++v4BU0MbnXEuppIVcJC2EYJmFMCpCJwQdL41cvLcouspt63/vhyaF9odwsKjJ21hplU2FZ1r5VSIiHl7P1cuXC9oBKFNW6a8SrYpb4/T9B+Mt3ZXC3CCBYBBlb2FhtCN0/At26y7mxGL7/H+7Jxx/SJpIuy5+cEalpXCq4+sUmVAoOqEWKsF7hUe0/1TvlPbkyt+CUYyTlie4Jy0T9/vRebSOli0kvoIoWnbQTiCZtmTeXNiwiWBiPu1FljNb45VGSgRwNXhCbU2UXHNLOUmdVvqM5y4cwdNdHKUODoq86jLFfAW/PLyWzGkY0wBdNQAlz7pqPNJ5+NGnViGcZUq+1BKDE/TotvHFjOSKC1GQUYkOvpokVijEim67Sr6kq59i4H5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(40470700004)(36840700001)(44832011)(41300700001)(5660300002)(26005)(81166007)(86362001)(4326008)(40460700003)(8936002)(6666004)(2906002)(7696005)(478600001)(36860700001)(82740400003)(34020700004)(356005)(426003)(16526019)(336012)(186003)(2616005)(47076005)(40480700001)(82310400005)(1076003)(8676002)(83380400001)(110136005)(316002)(70586007)(36756003)(70206006)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 16:10:05.5105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e1660f-b1ef-4a8b-ef96-08da60fc5268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1442

The symlink direction was wrong for some brcm firmware.

Fixes: f8a2651a ("Link some devices that ship with the AW-CM256SM")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 WHENCE | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/WHENCE b/WHENCE
index 14f3472e..14d0a877 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2820,10 +2820,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
 Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinephone-pro.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
+Link: brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
-- 
2.34.1

