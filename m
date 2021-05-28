Return-Path: <SRS0=uNcq=KX=infinera.com=Joakim.Tjernlund@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,LOTS_OF_MONEY,MONEY_NOHTML,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD02C2B9F7
	for <linux-firmware@archiver.kernel.org>; Fri, 28 May 2021 16:29:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0BC21613E3; Fri, 28 May 2021 16:29:32 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F29F61184
	for <linux-firmware@kernel.org>; Fri, 28 May 2021 16:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F29F61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Joakim.Tjernlund@infinera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiWO3hqNUXWSem9g8Xc07o86RFc4JYtRY9yTHZRpzPK0TQF3HkttGEPotEZ08dI/4OuyUa63m0TMS1a/AXR7T2MGqoJ0rwZnzOYXS0AatzV4SCXijlURdnpX0el/bgzlYv7w8lFdK7/WNcTVDGOKJHvVyQtw2Lhj3StzSA9tvDQLDlyZRszCIjG92h+wUx1v2IbTBLb3x7FNzJrm0SiHyoV3b8DtzxrHwsC3RpZQr1+kydkHR97AOE32l0tHCbzRNpMbRJtVW9VT7HYllVfm/d+23rJqHm3mhgUSVvfaSIMY4koxvu68Ih8GGS1To9dz/+JjC2lQ/lf++hYuzxxHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUYpQGo+OW6rSClYU3vLxldOWNCqVb/So1zVxhYyyhs=;
 b=PDqLAAa5bmslzLCOs0UY8W+7jJr0JiyJHD2XSfrVOF1CFpOblKu8ioja7/i3yCs2RZoCxH9lmxl8TTqt/WY5PoX+8SU8QVk0Xois2bYx+UiSS+oNbbf/VrZlBnA0enfb2e6adYCnQswFqINWFpcjTW+99M7bcKtHaBnnHSQHRQU20o+nginVz4OOMcWTpBW66hvLsQDN32Lp4lTFVvnRsZ27N8Gttmc2dmo4sT6Mnw72gB3H2Yj+iJajj1pEiocKUhSSzOdjJ+7rRIElvqh597/zfzAZS8y284nMe0ywnLEEeKoeZ37H4vOcQarvHjgB909xdDPVZnGBeMD/mqjtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.191) smtp.rcpttodomain=kernel.org smtp.mailfrom=infinera.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=infinera.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUYpQGo+OW6rSClYU3vLxldOWNCqVb/So1zVxhYyyhs=;
 b=MgAEJ2mhh0TIFR5GaTuF6HHdKBpP8aA8Lo9bLJdSNktWwWds+nosjR++SnXdOKImOM+KeFz01qsplBE4EOD7V55/UWQyjQTgduA6ReDxbHRMW2qApK+qpDJWMk67imVd123+pOZwaygLboSF9AmAeLj+0UAezZ840mYBW/AxbAk=
Received: from DM6PR07CA0042.namprd07.prod.outlook.com (2603:10b6:5:74::19) by
 CY4PR1001MB2343.namprd10.prod.outlook.com (2603:10b6:910:41::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 28 May
 2021 16:29:29 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::99) by DM6PR07CA0042.outlook.office365.com
 (2603:10b6:5:74::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Fri, 28 May 2021 16:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.191)
 smtp.mailfrom=infinera.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.191 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.191; helo=owa.infinera.com;
Received: from owa.infinera.com (8.4.225.191) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Fri, 28 May 2021 16:29:29 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 28 May 2021 09:29:28 -0700
Received: from sv-smtp-prod2.infinera.com (10.100.98.82) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 28 May 2021 09:29:28 -0700
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-prod2.infinera.com with Microsoft SMTPSVC(7.5.7601.17514);
	 Fri, 28 May 2021 09:29:27 -0700
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com [10.210.71.2])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id 4C1012EEE0C2
	for <linux-firmware@kernel.org>; Fri, 28 May 2021 18:29:27 +0200 (CEST)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
	id 463A220002B0; Fri, 28 May 2021 18:29:27 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: [PATCH 1/2] rtl_bt: Add rtl8761b firmware
Date: Fri, 28 May 2021 18:29:23 +0200
Message-ID: <20210528162924.27361-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 May 2021 16:29:28.0193 (UTC) FILETIME=[A1221710:01D753DE]
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 489a7e62-824b-4709-d06b-08d921f5c43f
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2343:
X-Microsoft-Antispam-PRVS:
	<CY4PR1001MB2343BC57EE6A9D8D32951E3AF4229@CY4PR1001MB2343.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	98M+C5KHuuEsLRXNxkh25iWHKvfjp7ckTMDkfhgzBBKQyw5YSne3Q9imvFEc9Idzk/ZMU9+p09K+ZeW+HDfS3SYEWVPY6yuE9dDIMDkrkpo1H6+/pkyI9UnNkiI6IkHvUhE4sSPgeUg6Jo9W5Tq/R4XfTprYjadxvIagMT4MI6MoKS68zCMYO0bekxp9jKHOcG21zi4LvsTZTk79ak5jTh1YkTizQFWRx2Sp1SNtemLhjeLP9qdx6X+zP9ChiGKu9DNxZIdbvQBu9pOuHDaq085zgckRoYEfVC/IHrvyvr7F7WroYESncRtB3HimezmAWNGhYVvtunaCqqaQWDqw+jrWYrSHTSCGvrAO19tltwNtA0J1u9m5cmCN7qzreQNmSe3hkRtZ1JgBcIc4whR0Z0C4XSi+Lsn2QxV8PmaZcQrPqfWTCtJ9YuIJaIeUyQu5qEYT7t94qg0VPZvNZbEKNILVE3/n3UKbq7r57cMU6FoKWOBuRZBPUOagzxPhu4M2N/gk9tSmNmZub1TrdC4oqHSzeYRS5xu+uJ9WldhBsXj1DvUJz0iqVJmrf/ac7Mj25DLt+C0hfVff44xDiY0JqM3lvMljPCp3liyApJvg7JVscHOtfm4O6hNtTtdSV4Rgvd/afRM0vqcYAULLjX5qlKQaBXG+km3t1c3XpNXvbBzs/5KfPRmRDdhQVOIKUGHT
X-Forefront-Antispam-Report:
	CIP:8.4.225.191;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966006)(36840700001)(36906005)(8676002)(82310400003)(82740400003)(478600001)(4326008)(316002)(42186006)(36756003)(8936002)(36860700001)(44832011)(2906002)(47076005)(6666004)(186003)(26005)(86362001)(426003)(70586007)(81166007)(70206006)(107886003)(356005)(6266002)(2616005)(6916009)(83380400001)(30864003)(336012)(1076003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 16:29:29.1427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 489a7e62-824b-4709-d06b-08d921f5c43f
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.191];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2343

From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>

From Realtek 20200806_LINUX_BT_DRIVER_RTL8761B_COEX_v0202
driver package

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
---
 rtl_bt/rtl8761b_config.bin | Bin 0 -> 25 bytes
 rtl_bt/rtl8761b_fw.bin     | Bin 0 -> 35644 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 rtl_bt/rtl8761b_config.bin
 create mode 100644 rtl_bt/rtl8761b_fw.bin

diff --git a/rtl_bt/rtl8761b_config.bin b/rtl_bt/rtl8761b_config.bin
new file mode 100644
index 0000000000000000000000000000000000000000..99475ee3bad9502dca3dd92c38b47a229aecd36b
GIT binary patch
literal 25
hcmWGtt=ulmz{4QG)G&!9;OHyKhthx7$1^VB1^{HN2*CgV

literal 0
HcmV?d00001

diff --git a/rtl_bt/rtl8761b_fw.bin b/rtl_bt/rtl8761b_fw.bin
new file mode 100644
index 0000000000000000000000000000000000000000..b6b9f1fbdfb49e26926806790dcd1bf126d47eed
GIT binary patch
literal 35644
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
ZdL9Kd>^`MM5&zO}G?rx^)!h5{e*n^3dH?_b

literal 0
HcmV?d00001

-- 
2.31.1

