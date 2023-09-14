Return-Path: <SRS0=21wz=E6=amd.com=Sandipan.Das@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B2EEAA4E
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Sep 2023 14:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0617FC433CA; Thu, 14 Sep 2023 14:47:09 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2A11C433C8;
	Thu, 14 Sep 2023 14:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2A11C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bEE8U3AYme3s86j9jNcFbCBVTvTthDFF/fyc+zOqdkKu/bmg28uY62x+XC7I+G1vKuPalI3HiXttQ0cwsQqZQ+8ode38lUtGoN1sd/cFRC+Vs08MKDJ+Jiurly/50rudOw7gngMLHCC17qut1a7tWgXe7OeiH9855ThailNuTRPM7q5VpWjPn8eczs/Dh0PPX2JW4catRobMlf+L7kElmhkhJhHB6vupLZu/lM4KW7mH2qxcIKGz9BCTzl22HD/B1R+bh1eRUSK+B928qa9yiJXCGz3MDl6NOvdbFQWr4imCJDYmDXw/Z0KnNKmLzWdGvu5pnxJUVE7SvC0r0F2DQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7hOj1zJrDhe/mZtPnFG0ApqpbldJZR+RAH+otF6AV0=;
 b=ZmtFcUWF2s8kiZiYwOGgR7LWLsDEBRKI75yqV+rhWav7dt9CXE7Gt4ldqalgy04D6hI05lPDzjtJVuknppdiExaH9BpsUFWU3M/Q0pc+wWw4C6eVGjru7KBSP3oNn4nB+FMAyBu3G3LxDZjbJxKCNs7Javy6WlpgC1EwThHWHatZgu66ygfRN28Nev2+8f4Zrjuf4RVHtQ49KQ1LwKXeTbX5P396IicbhBRKnhV8BnZpW6cubchsUqwc6/l9N14LMCzrft7DmrVZqKLzR/vzpZ7PCluDOUGSSJ6sxq72vzuxpUmQcdLJm9ErG4MA8wziaL/vAmCy5uT+IlUrQEe3PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7hOj1zJrDhe/mZtPnFG0ApqpbldJZR+RAH+otF6AV0=;
 b=c78mtlvf0b9F6Vj1o9xL//Gsg94sHiqXk0lO1J2pLgr2KbLtJP8PXPj54J0nO+8u0aXb3itDJQFsR1LlLuQ+O2NvLDVB1EoRMWVFoEJS6Nzq8nuNIZBhCyW3tOO3b7fCXdgTuLdmCVw40y+n55K3ub3rWZuzXJO4L4DGr2ttsV8=
Received: from BL0PR02CA0103.namprd02.prod.outlook.com (2603:10b6:208:51::44)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 14:47:03 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:51:cafe::e5) by BL0PR02CA0103.outlook.office365.com
 (2603:10b6:208:51::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37 via Frontend
 Transport; Thu, 14 Sep 2023 14:47:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Thu, 14 Sep 2023 14:47:03 +0000
Received: from sindhu.amdval.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Sep
 2023 09:46:59 -0500
From: Sandipan Das <sandipan.das@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <john.allen@amd.com>, <bp@alien8.de>,
	<suravee.suthikulpanit@amd.com>, <ananth.narayan@amd.com>,
	<ravi.bangoria@amd.com>, <santosh.shukla@amd.com>, <sandipan.das@amd.com>
Subject: [PATCH] linux-firmware: amd-ucode: Add note on fam19h warnings
Date: Thu, 14 Sep 2023 20:16:51 +0530
Message-ID: <20230914144651.272047-1-sandipan.das@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 500c85ee-6a51-4c03-7311-08dbb5317597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R6iKy3opPc3gUm0o/AJ79Z+OP4dWoFxDDm4MzuriaeYun0CT0o49DMdRhYvPUxADq+AIsFzLfrszOlqBAjuI4gx03R2kbLEnetbI6Cs/sRnaa6jyFkMIusr2sXa9IVHV858gvhaDs5v3knuxsjQlvdgLCRC3XmzKiR0Qu8t0CfqHDKpwWQM31CfVceM2bqYvwbEDrFCkQ40jRX6BkpPiR5Aa7QDlrGimRE6klNO9aGltCrdoVUZcpXqqVKtmHDQgcBGqKDYnhxUABObf48k5zT6mz+SGqKJJIK+ZDGB+1imYa4rmBCHp5V1YXpvqRYeYE0lOWQ60Q16DHrUK+Oj+4WRjgALQgvtt+o1ltb6vjzaAsEsAZJ+M6Vd2xKUpFGDixD3gQ9LKeeThy+QT4+g0lF/1eqCrNTm+EKGkoCHogETbDli1AhAyydPDlNKXtZ4WxzZz6IYZ3qM8uoIzBemueptGgsp4EDt3+8kwWAoFRTMfUe/IAUOfpbEs9StrfX7LPbjn9wLFmLZw9KCnLutG4OqsLRx8GfouURHSy6moQREwwHMSc87/pURcVu/aeRRkdJ7KLqKgyd5Nq2wpTH5psaaI1XhJQm5jnYaJ2+oakWYQc8uVQvVM+S8L1206Y9L1eAYEgHv5AO5/WnM/wd1Fi5Sdrka69G4IlrOAA6Omy4v5nBBLf9HtxLwjdD74//0pOm9Go6MMnBLY6SDAL/pBqydUwrLDXnFuA3do5x/lsj8X1zV8LqrKYz8ecatbsCGu5I9GJTRWWH6V52NnJ+z8oQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(83380400001)(82740400003)(86362001)(2616005)(81166007)(6666004)(336012)(426003)(47076005)(478600001)(36860700001)(70586007)(1076003)(16526019)(26005)(40480700001)(70206006)(40460700003)(8676002)(4326008)(36756003)(41300700001)(5660300002)(44832011)(8936002)(356005)(54906003)(6916009)(316002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 14:47:03.3629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500c85ee-6a51-4c03-7311-08dbb5317597
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453

When running 5.19+ kernels on Genoa or Bergamo systems, some microcode
patches are known to trigger warnings in the PMI handler. Add a note
to list the required minimum patch levels for addressing this problem.

Signed-off-by: Sandipan Das <sandipan.das@amd.com>
---
 amd-ucode/README | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/amd-ucode/README b/amd-ucode/README
index fac11524..f47743c1 100644
--- a/amd-ucode/README
+++ b/amd-ucode/README
@@ -53,3 +53,12 @@ a32b0f0db3f3 ("x86/microcode/AMD: Load late on both threads too")
 When late loading the patches for Genoa or Bergamo, there may be one spurious
 NMI observed per physical core. These NMIs are benign and don't cause any
 functional issue but will result in kernel messages being logged.
+
+NOTE: When running 5.19+ kernels on Genoa or Bergamo systems, some microcode
+patches are known to trigger warnings in the PMI handler. The following are
+the required minimum patch levels to address this problem:
+
+  Family=0x19 Model=0x11 Stepping=0x01: Patch=0x0a10113e
+  Family=0x19 Model=0x11 Stepping=0x02: Patch=0x0a10123e
+  Family=0x19 Model=0xa0 Stepping=0x01: Patch=0x0aa00116
+  Family=0x19 Model=0xa0 Stepping=0x02: Patch=0x0aa00212
-- 
2.34.1

