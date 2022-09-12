Return-Path: <SRS0=/3yt=ZP=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA3AC6FA82
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Sep 2022 16:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B47B6C43470; Mon, 12 Sep 2022 16:28:54 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85446C433D6;
	Mon, 12 Sep 2022 16:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85446C433D6
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6FYtmboOPGHmJ0vrOaMrSHtzg3l6vCnMwOUgLKZ4Z/Q2Og5de7d7mW1Jhs9S1kDoVSDDCwR3q5EWlINVPKpU82Ruq5cTHeg/099ZeN6o2uulGINXB+XHsIa2NO16K82RIm0vT2hEcp2dPXQa/8rUcO9MIdLHeux8WdMw+1WqtSxBOajbsIJXIdeH0aMsQ35Irvm0T9Tv+asfx9Oae10Kdmjh3QMjOT+2DUvMrYguMPC+6/HjvNjFIuS2eABl1qTpgJR4WsHP+GjDuukwv8aOCrQ9RF+leyWR/+yqlasHO0qdX1IKRp82aVFTHeI+N4yMH/SGarqkJihIW70C4+L8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vs4N/9jQ6+1i1ye89R/akmmU8Pl4vzBoSdhEuaC26w=;
 b=IhRWd9Zvf/cv91Yjt7t1Sk6yWyFrFl8F/2jWRVeHnajtLtJ5PwrW5KTM7mCYe52SdN1mxY0ty7TjDWOQKgZzv700U1Xk916dob3nAYqA06YWIBau0R7okF2Ez+COxZtwOcU7JAEPUgOkFIfTDV63Em95J+q5jLsmX6QxSMT6UDSXu+QY3fv0KTkyLYMDFBTWisEV2Z2/z1cEn31zWneYbi2FVchmgRM752w82lhUnUtLv0s+125Jqwz3muMEGJCguXaguzeRKxuwFVqViK9hGCp+ZCUzMsrhiul51xM5oZwZ7jYn7yupo9y7d/jN9iYEebHOO75ZgLsJVTbi/RRhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vs4N/9jQ6+1i1ye89R/akmmU8Pl4vzBoSdhEuaC26w=;
 b=VcZa1IgDFGcij0/gXUcNy2LMKh/tmMO25incA6gSQPKRlbHt+cf9DZNzvCdTpQEpe4hUfG1gdTC6Pv6N8o3GgxhFc+bnpihcVC8fDkvzyGdsHwfy26/ufPgjW+Tj+XmpNWNhYgBxEcHuk7mZGUTCrBkgq/vWyCcelx1PKCjIq2g=
Received: from MW4P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::27)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 16:28:50 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::d4) by MW4P220CA0022.outlook.office365.com
 (2603:10b6:303:115::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Mon, 12 Sep 2022 16:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 16:28:49 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 11:28:48 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>, Josh Boyer
	<jwboyer@kernel.org>
CC: Alexander Deucher <Alexander.Deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH 0/6] Updates for amdgpu
Date: Mon, 12 Sep 2022 11:28:46 -0500
Message-ID: <20220912162852.16815-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ffabf8-e179-4f5b-698e-08da94dbdfcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	149YmXJN8270L77pmSb0hJm9+M7XpX4RXezWrs0PUmLRR17hyrJBuNlZ+TC243Ev/UXWvRcF1Pe4ZyWMS3MdU5ck+zmaQRgEbbSxoaSazAv5/WAUllzlJzzKYTzoGAJKgLpX8VztcIrqptJnhawLIUfD6d53QZvjEUNihtUhihHi5Wb/TzV6LzPUiN8gL3+pm08D8d1azEkvPusnSiQXZxHeL4Y+tfPodRKmCOuqFKQnu2Ms4wVyZ0Qj6M2bal+BVY5cl9ykXdRHFmaPcSC1esbZhXxVvjlBj1gHdBKVd2ATkVPInnqYxmGOj2i4EWueB5fWusep5x3jE6a0X8uxK50JTztKLD3JFnNwxULqJ3ZbYhB9M0mlZJH2fu7vOhVgV2P0QnTk7wlfUGiBlQZtMWkyUR0OCY3ZmUHbQht1m5v/6IhrR4ju0dzcfd4Ah0Pi0e6AUhHxnM+2TzPkxonT7IOUzvRJSllj62oKermIlhAKPIX8dL543QLwGQbqTDAs+oaeImrgFXkFmd0nLDEoTmh9cIPn1Yy6XndZVTJDcmwx12gXWuT8KP9OBlsTWWwmqoUfveix+h9UQm+In1lZh720LlGGU6lB+Dve6hMZMrhnE9cwS9p/XCD2zLXnLu5wdXxxylVTespYk4MvXIa0xWwy8tJTgA8Kr/YVoxqmuk1sMf8FpfE8VXSjN1A1IOD+hrqKF1KCs5/KKraae6FOe0/EhG9lOQAS8a/DMaQ8hw6FmE1+lajpDxnKnXo3krTFucKiS6ckKc7AkjFjUP+Igvn8fG8XF/ztUNjc2uJxWJE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230017)(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(40470700004)(36840700001)(82740400003)(316002)(54906003)(110136005)(26005)(86362001)(41300700001)(36756003)(36860700001)(40480700001)(478600001)(83380400001)(336012)(47076005)(8936002)(70206006)(81166007)(1076003)(186003)(426003)(2616005)(70586007)(16526019)(7696005)(8676002)(450100002)(15650500001)(82310400005)(44832011)(5660300002)(4326008)(2906002)(40460700003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:28:49.8157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ffabf8-e179-4f5b-698e-08da94dbdfcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580

Hi,

In this series it introduces support for some new IP blocks that
are to be used in upcoming programs and with newer kernel versions
that support them.

Also a new Rembrandt (Yellow Carp) DMCUB firmware is included that
helps with some problems with USB4 DPIA.

Mario Limonciello (6):
  amdgpu: add firmware for DCN 3.1.5 IP block
  amdgpu: add firmware for GC 10.3.6 IP block
  amdgpu: add firmware for PSP 13.0.5 IP block
  amdgpu: add firmware for SDMA 5.2.6 IP block
  amdgpu: add firmware for VCN 3.1.2 IP block
  amdgpu: update yellow carp DMCUB firmware

 WHENCE                       |  12 ++++++++++++
 amdgpu/dcn_3_1_5_dmcub.bin   | Bin 0 -> 176912 bytes
 amdgpu/gc_10_3_6_ce.bin      | Bin 0 -> 263296 bytes
 amdgpu/gc_10_3_6_me.bin      | Bin 0 -> 263424 bytes
 amdgpu/gc_10_3_6_mec.bin     | Bin 0 -> 268592 bytes
 amdgpu/gc_10_3_6_mec2.bin    | Bin 0 -> 268592 bytes
 amdgpu/gc_10_3_6_pfp.bin     | Bin 0 -> 263424 bytes
 amdgpu/gc_10_3_6_rlc.bin     | Bin 0 -> 177088 bytes
 amdgpu/psp_13_0_5_asd.bin    | Bin 0 -> 168448 bytes
 amdgpu/psp_13_0_5_ta.bin     | Bin 0 -> 201728 bytes
 amdgpu/psp_13_0_5_toc.bin    | Bin 0 -> 1792 bytes
 amdgpu/sdma_5_2_6.bin        | Bin 0 -> 34048 bytes
 amdgpu/vcn_3_1_2.bin         | Bin 0 -> 569808 bytes
 amdgpu/yellow_carp_dmcub.bin | Bin 231696 -> 232720 bytes
 14 files changed, 12 insertions(+)
 create mode 100644 amdgpu/dcn_3_1_5_dmcub.bin
 create mode 100644 amdgpu/gc_10_3_6_ce.bin
 create mode 100644 amdgpu/gc_10_3_6_me.bin
 create mode 100644 amdgpu/gc_10_3_6_mec.bin
 create mode 100644 amdgpu/gc_10_3_6_mec2.bin
 create mode 100644 amdgpu/gc_10_3_6_pfp.bin
 create mode 100644 amdgpu/gc_10_3_6_rlc.bin
 create mode 100644 amdgpu/psp_13_0_5_asd.bin
 create mode 100644 amdgpu/psp_13_0_5_ta.bin
 create mode 100644 amdgpu/psp_13_0_5_toc.bin
 create mode 100644 amdgpu/sdma_5_2_6.bin
 create mode 100644 amdgpu/vcn_3_1_2.bin

-- 
2.25.1

