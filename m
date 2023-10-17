Return-Path: <SRS0=/ssE=F7=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385DDCDB483
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Oct 2023 19:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05A46C433CA; Tue, 17 Oct 2023 19:12:24 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF64BC433C8;
	Tue, 17 Oct 2023 19:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF64BC433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHlGOP9hhwS/1OSwi7w8o2AgPnYtufm3wk4bIteqZq1pY7PnfzDTde0DfSLjjJRTfrWVOdsVjAz7Ulnyt+6fr5rlCyLgJsPFkl9rTKE4seJ6ZRrFboXliPu/wRay/G0eyddCd1uRFiyOhR8+skkQytuEelrrdpCDW4yUZO1B7JeNC97FZSRGgj4AltoOcr984Ima65cvtMSQq2vZ3VxMLeX0ZWkk+n8C5OZRsDtibrOycPsdy4/ianmkHKf/ESAw6oJ6lIQ/BSTsKUbDUy/G5b7u8kkjx2om/ZWgFDqNJj4vboul+c18Stuiukp7NDbqfWjtok4AFRw1tXiNvNDH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW8p42L6ZYWPIV8EfcyNx6/yXjw2gQGUl9XQcO74+O4=;
 b=ajRb6syFqs0aoMiSTXY7hLJfQbbAU7ko8x4rLP0TFHoes1NlAztkUDIv089SDqym+zzsuYE+JQqfkH9ozH/TfUPbvTj0sikzD2MEISl7XttpWkAUXjhUH4Epgd6lE6d0A4PtJzRzyb5Bs8s4UT1uAlHNfqxvafH3B+4nMVSIrjgKll9Vg1qemxZgxoPydJL5GYdJoOaZQKu2ojB1AnL1wq5pdB4Ibk44eEfJOhl4c2maD0B41Ul/fMNZNBZV461P8w0ZvE3EWM5kCxxtfIaHqnybi34uJ+wi46S5Suj7i08lRWxDiMxknH7tFUuI6WIZ5UHOn9BgDoaX6ZrBspXKqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW8p42L6ZYWPIV8EfcyNx6/yXjw2gQGUl9XQcO74+O4=;
 b=dCzpbOh55GbHkhe5tImQ+7DtRRZMSvNWbXMLGcJsojYffpX+LeT+QWAIZjepqTQNfnHcnFd/JbIdhWT4d6NJLRO0qNZq/poPfHBPhlOXVa4tc+qRHtxSAhtOay74e/mLp/VMEOB+jp85pjU1lNkicdW9ItTGJJw+iGGCc/VU7Gk=
Received: from PH8PR15CA0024.namprd15.prod.outlook.com (2603:10b6:510:2d2::9)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 19:12:18 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:2d2::4) by PH8PR15CA0024.outlook.office365.com
 (2603:10b6:510:2d2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 19:12:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 19:12:17 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 14:12:16 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <jwboyer@kernel.org>
CC: <Mario.Limonciello@amd.com>, <stylon.wang@amd.com>,
	<deepak.sharma@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware amd-2023-10-17
Date: Tue, 17 Oct 2023 15:11:58 -0400
Message-ID: <20231017191158.2247834-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|CY5PR12MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 952998db-1234-42d0-48c1-08dbcf44faf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VL8kQgYsVkkBkZmfNgkM6B2sAJtPjJyzwhbG+vXDbXGeKpqcGckNu6dQPN7piX7DQUKvxxTjIN08to11gQrd8ThfceFVtuLGaPev0/6WvMOERrhrJBPNhE46sXbXkqi3i2NlVMeizgHOeiJF0gpJ+aF4n62Gr1WZBkVSN6BgZDTfaaeiSkfQQRFc/3sCHCOEWtuEQFfMCd9sofygV/aw5KkZx6eTmJ6WA2DAES9NLwQZnGOqvTxtN7yMp7I7Zm+/KFvV30wfiwTI/t49HNrJqIctLekAbRBBrKZPZrpsB2Y8w1Q3l/PLKiLVy2jl9ArRYHB86vm06xmLxB3GS6m0w+uE9Cvkrb6bfgmw9OWq3S6aQJ0B2wuM51Fb2qFNJ/hfKpR0TkXi5bXJFbgfNUL8sUD+WO5vy4YUd70y+JspR8C4rz/tU+uEiUrsTG6ZN34e1ZB6gec1LMQ8J1zOFqvpmKixuhkTLTnQVHEd2wR4dzXom0n9yeBeel7paieAT+lVbgb49mbVeBhl8iqUFJ6bOfaZi6AEPB9wHLhMINxkcfSA9NLTb8+8wISX+4aQXMW63VgAkJ2U02NMBfkoLBjkjckPxtkL5s4tZowMtmR+YJWDshjCHbls5zB/ThvQwABosPjlapRvSsdzKqSdeUvvS3XCE6Cd+yXl7HuA0rodsnaqxzyczIIe4pghlR7l6n1af8b890980JoeNdltXx5PfHYzVYWYl8jfiqJpfdJ9+dWwFm7LfTpbHSOn9pDNfeFO
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(64100799003)(36840700001)(46966006)(40470700004)(7696005)(40480700001)(5660300002)(6666004)(1076003)(40460700003)(2906002)(4001150100001)(16526019)(83380400001)(2616005)(426003)(336012)(26005)(30864003)(356005)(82740400003)(86362001)(36860700001)(81166007)(47076005)(316002)(478600001)(36756003)(966005)(41300700001)(110136005)(54906003)(70586007)(70206006)(450100002)(8676002)(4326008)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 19:12:17.7667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 952998db-1234-42d0-48c1-08dbcf44faf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549

Hi,

Updated amdgpu firmwares.  Please pull!

The following changes since commit 2bbca647e4aeed3813ba7776d309c4525e0ad841:

  amdgpu: update DMCUB to 0.0.183.0 for various AMDGPU ASICs (2023-09-08 22:30:18 +0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2023-10-17

for you to fetch changes up to a3bcbbf2e5d13b49197ecd39ae47715515bf38c2:

  amdgpu: update SMU 13.0.0 firmware (2023-10-17 09:31:52 -0400)

----------------------------------------------------------------
amd-2023-10-17:

Update firmwares from 5.7 branch.

----------------------------------------------------------------
Alex Deucher (44):
      amdgpu: update aldebaran firmware from 5.7 branch
      amdgpu: update GC 11.0.3 firmware from 5.7 branch
      amdgpu: update PSP 13.0.10 firmware from 5.7 branch
      amdgpu: update SMU 13.0.10 firmware from 5.7 branch
      amdgpu: update raven2 firmware from 5.7 branch
      amdgpu: update navi10 firmware from 5.7 branch
      amdgpu: update yellow carp firmware from 5.7 branch
      amdgpu: update GC 11.0.2 firmware from 5.7 branch
      amdgpu: update PSP 13.0.7 firmware from 5.7 branch
      amdgpu: update SDMA 6.0.2 firmware from 5.7 branch
      amdgpu: update SMU 13.0.7 firmware from 5.7 branch
      amdgpu: update VCN 4.0.4 firmware from 5.7 branch
      amdgpu: update navi12 firmware from 5.7 branch
      amdgpu: update renoir firmware from 5.7 branch
      amdgpu: update navi14 firmware from 5.7 branch
      amdgpu: update GC 11.0.1 firmware from 5.7 branch
      amdgpu: update PSP 13.0.4 firmware from 5.7 branch
      amdgpu: update SDMA 6.0.1 firmware from 5.7 branch
      amdgpu: update GC 11.0.4 firmware from 5.7 branch
      amdgpu: update PSP 13.0.11 firmware from 5.7 branch
      amdgpu: update sienna cichlid firmware from 5.7 branch
      amdgpu: update green sardine firmware from 5.7 branch
      amdgpu: update vangogh firmware from 5.7 branch
      amdgpu: update navy flounder firmware from 5.7 branch
      amdgpu: update picasso firmware from 5.7 branch
      amdgpu: update dimgrey cavefish firmware from 5.7 branch
      amdgpu: update vega10 firmware from 5.7 branch
      amdgpu: update vega12 firmware from 5.7 branch
      amdgpu: update beige goby firmware from 5.7 branch
      amdgpu: update vega20 firmware from 5.7 branch
      amdgpu: update GC 11.0.0 firmware from 5.7 branch
      amdgpu: update PSP 13.0.0 firmware from 5.7 branch
      amdgpu: update SDMA 6.0.0 firmware from 5.7 branch
      amdgpu: update SMU 13.0.0 firmware from 5.7 branch
      amdgpu: update VCN 4.0.0 firmware from 5.7 branch
      amdgpu: update GC 10.3.6 firmware from 5.7 branch
      amdgpu: update PSP 13.0.5 firmware from 5.7 branch
      amdgpu: update SDMA 5.2.6 firmware from 5.7 branch
      amdgpu: update DCN 3.1.6 firmware from 5.7 branch
      amdgpu: update GC 10.3.7 firmware from 5.7 branch
      amdgpu: update PSP 13.0.8 firmware from 5.7 branch
      amdgpu: update SDMA 5.2.7 firmware from 5.7 branch
      amdgpu: update raven firmware from 5.7 branch
      amdgpu: update SMU 13.0.0 firmware

 amdgpu/aldebaran_mec.bin         | Bin 268576 -> 268560 bytes
 amdgpu/aldebaran_mec2.bin        | Bin 268576 -> 268560 bytes
 amdgpu/aldebaran_sjt_mec.bin     | Bin 268576 -> 268560 bytes
 amdgpu/aldebaran_sjt_mec2.bin    | Bin 268576 -> 268560 bytes
 amdgpu/aldebaran_sos.bin         | Bin 442080 -> 442080 bytes
 amdgpu/beige_goby_ce.bin         | Bin 263296 -> 263296 bytes
 amdgpu/beige_goby_dmcub.bin      | Bin 112116 -> 113908 bytes
 amdgpu/beige_goby_me.bin         | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_mec.bin        | Bin 268720 -> 268720 bytes
 amdgpu/beige_goby_mec2.bin       | Bin 268720 -> 268720 bytes
 amdgpu/beige_goby_pfp.bin        | Bin 263424 -> 263424 bytes
 amdgpu/beige_goby_smc.bin        | Bin 244934 -> 244934 bytes
 amdgpu/beige_goby_sos.bin        | Bin 205984 -> 205984 bytes
 amdgpu/beige_goby_ta.bin         | Bin 218368 -> 226560 bytes
 amdgpu/beige_goby_vcn.bin        | Bin 579568 -> 579568 bytes
 amdgpu/dcn_3_1_6_dmcub.bin       | Bin 215568 -> 215568 bytes
 amdgpu/dimgrey_cavefish_ce.bin   | Bin 263296 -> 263296 bytes
 amdgpu/dimgrey_cavefish_me.bin   | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_mec.bin  | Bin 268720 -> 268720 bytes
 amdgpu/dimgrey_cavefish_mec2.bin | Bin 268720 -> 268720 bytes
 amdgpu/dimgrey_cavefish_pfp.bin  | Bin 263424 -> 263424 bytes
 amdgpu/dimgrey_cavefish_smc.bin  | Bin 244902 -> 244902 bytes
 amdgpu/dimgrey_cavefish_sos.bin  | Bin 210416 -> 210416 bytes
 amdgpu/dimgrey_cavefish_ta.bin   | Bin 218368 -> 226560 bytes
 amdgpu/dimgrey_cavefish_vcn.bin  | Bin 579568 -> 579568 bytes
 amdgpu/gc_10_3_6_rlc.bin         | Bin 177088 -> 177088 bytes
 amdgpu/gc_10_3_7_rlc.bin         | Bin 177088 -> 177088 bytes
 amdgpu/gc_11_0_0_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_0_me.bin          | Bin 189520 -> 197216 bytes
 amdgpu/gc_11_0_0_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_0_mes_2.bin       | Bin 289280 -> 239136 bytes
 amdgpu/gc_11_0_0_pfp.bin         | Bin 207984 -> 211104 bytes
 amdgpu/gc_11_0_0_rlc.bin         | Bin 184992 -> 184992 bytes
 amdgpu/gc_11_0_1_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_0_1_mes_2.bin       | Bin 289152 -> 235072 bytes
 amdgpu/gc_11_0_1_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_1_rlc.bin         | Bin 160592 -> 160592 bytes
 amdgpu/gc_11_0_2_me.bin          | Bin 189552 -> 197216 bytes
 amdgpu/gc_11_0_2_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_2_mes_2.bin       | Bin 289408 -> 239136 bytes
 amdgpu/gc_11_0_2_pfp.bin         | Bin 207984 -> 211088 bytes
 amdgpu/gc_11_0_3_imu.bin         | Bin 132352 -> 132352 bytes
 amdgpu/gc_11_0_3_me.bin          | Bin 197232 -> 197232 bytes
 amdgpu/gc_11_0_3_mec.bin         | Bin 407072 -> 407072 bytes
 amdgpu/gc_11_0_3_mes1.bin        | Bin 216768 -> 211792 bytes
 amdgpu/gc_11_0_3_mes_2.bin       | Bin 235616 -> 239200 bytes
 amdgpu/gc_11_0_3_pfp.bin         | Bin 211088 -> 211088 bytes
 amdgpu/gc_11_0_3_rlc.bin         | Bin 178832 -> 178832 bytes
 amdgpu/gc_11_0_4_me.bin          | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_mec.bin         | Bin 268704 -> 268704 bytes
 amdgpu/gc_11_0_4_mes_2.bin       | Bin 289152 -> 234048 bytes
 amdgpu/gc_11_0_4_pfp.bin         | Bin 263424 -> 263424 bytes
 amdgpu/gc_11_0_4_rlc.bin         | Bin 159472 -> 158752 bytes
 amdgpu/green_sardine_asd.bin     | Bin 172544 -> 180736 bytes
 amdgpu/green_sardine_ce.bin      | Bin 36608 -> 36608 bytes
 amdgpu/green_sardine_dmcub.bin   | Bin 121608 -> 121608 bytes
 amdgpu/green_sardine_me.bin      | Bin 69376 -> 69376 bytes
 amdgpu/green_sardine_mec.bin     | Bin 268048 -> 268048 bytes
 amdgpu/green_sardine_mec2.bin    | Bin 268048 -> 268048 bytes
 amdgpu/green_sardine_pfp.bin     | Bin 85760 -> 85760 bytes
 amdgpu/green_sardine_ta.bin      | Bin 33536 -> 33536 bytes
 amdgpu/green_sardine_vcn.bin     | Bin 402880 -> 403136 bytes
 amdgpu/navi10_asd.bin            | Bin 172544 -> 180736 bytes
 amdgpu/navi10_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi10_vcn.bin            | Bin 402112 -> 403136 bytes
 amdgpu/navi12_asd.bin            | Bin 172544 -> 184832 bytes
 amdgpu/navi12_ce.bin             | Bin 263296 -> 263296 bytes
 amdgpu/navi12_me.bin             | Bin 263424 -> 263424 bytes
 amdgpu/navi12_mec.bin            | Bin 268592 -> 268592 bytes
 amdgpu/navi12_mec2.bin           | Bin 268592 -> 268592 bytes
 amdgpu/navi12_pfp.bin            | Bin 263424 -> 263424 bytes
 amdgpu/navi12_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi12_vcn.bin            | Bin 402112 -> 403136 bytes
 amdgpu/navi14_asd.bin            | Bin 172544 -> 180736 bytes
 amdgpu/navi14_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/navi14_vcn.bin            | Bin 402112 -> 403136 bytes
 amdgpu/navy_flounder_ce.bin      | Bin 263296 -> 263296 bytes
 amdgpu/navy_flounder_me.bin      | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_mec.bin     | Bin 268720 -> 268720 bytes
 amdgpu/navy_flounder_mec2.bin    | Bin 268720 -> 268720 bytes
 amdgpu/navy_flounder_pfp.bin     | Bin 263424 -> 263424 bytes
 amdgpu/navy_flounder_smc.bin     | Bin 244902 -> 244902 bytes
 amdgpu/navy_flounder_ta.bin      | Bin 218368 -> 226560 bytes
 amdgpu/navy_flounder_vcn.bin     | Bin 579568 -> 579568 bytes
 amdgpu/picasso_asd.bin           | Bin 172544 -> 180736 bytes
 amdgpu/picasso_ce.bin            | Bin 9344 -> 9344 bytes
 amdgpu/picasso_me.bin            | Bin 17536 -> 17536 bytes
 amdgpu/picasso_mec.bin           | Bin 268064 -> 268064 bytes
 amdgpu/picasso_mec2.bin          | Bin 268064 -> 268064 bytes
 amdgpu/picasso_pfp.bin           | Bin 21632 -> 21632 bytes
 amdgpu/picasso_ta.bin            | Bin 41984 -> 41984 bytes
 amdgpu/psp_13_0_0_sos.bin        | Bin 268304 -> 268304 bytes
 amdgpu/psp_13_0_0_ta.bin         | Bin 242944 -> 242944 bytes
 amdgpu/psp_13_0_10_sos.bin       | Bin 355808 -> 355808 bytes
 amdgpu/psp_13_0_11_ta.bin        | Bin 271808 -> 218560 bytes
 amdgpu/psp_13_0_4_ta.bin         | Bin 271808 -> 218560 bytes
 amdgpu/psp_13_0_5_asd.bin        | Bin 172544 -> 184832 bytes
 amdgpu/psp_13_0_5_ta.bin         | Bin 205824 -> 218112 bytes
 amdgpu/psp_13_0_7_sos.bin        | Bin 248496 -> 248496 bytes
 amdgpu/psp_13_0_7_ta.bin         | Bin 218112 -> 218112 bytes
 amdgpu/psp_13_0_8_ta.bin         | Bin 205824 -> 218112 bytes
 amdgpu/raven2_asd.bin            | Bin 168448 -> 180736 bytes
 amdgpu/raven2_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/raven2_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/raven2_mec.bin            | Bin 268048 -> 268048 bytes
 amdgpu/raven2_mec2.bin           | Bin 268048 -> 268048 bytes
 amdgpu/raven2_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/raven2_ta.bin             | Bin 33536 -> 33536 bytes
 amdgpu/raven_asd.bin             | Bin 168448 -> 180736 bytes
 amdgpu/raven_ce.bin              | Bin 9344 -> 9344 bytes
 amdgpu/raven_me.bin              | Bin 17536 -> 17536 bytes
 amdgpu/raven_mec.bin             | Bin 268048 -> 268064 bytes
 amdgpu/raven_mec2.bin            | Bin 268048 -> 268064 bytes
 amdgpu/raven_pfp.bin             | Bin 21632 -> 21632 bytes
 amdgpu/raven_ta.bin              | Bin 33536 -> 33536 bytes
 amdgpu/renoir_asd.bin            | Bin 172544 -> 180736 bytes
 amdgpu/renoir_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/renoir_dmcub.bin          | Bin 121608 -> 121608 bytes
 amdgpu/renoir_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/renoir_mec.bin            | Bin 268064 -> 268048 bytes
 amdgpu/renoir_mec2.bin           | Bin 268064 -> 268048 bytes
 amdgpu/renoir_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/renoir_ta.bin             | Bin 41984 -> 41984 bytes
 amdgpu/renoir_vcn.bin            | Bin 402880 -> 403136 bytes
 amdgpu/sdma_5_2_6.bin            | Bin 34048 -> 34048 bytes
 amdgpu/sdma_5_2_7.bin            | Bin 34048 -> 34048 bytes
 amdgpu/sdma_6_0_0.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_1.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sdma_6_0_2.bin            | Bin 34560 -> 34560 bytes
 amdgpu/sienna_cichlid_ce.bin     | Bin 263296 -> 263296 bytes
 amdgpu/sienna_cichlid_me.bin     | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_mec.bin    | Bin 268720 -> 268720 bytes
 amdgpu/sienna_cichlid_mec2.bin   | Bin 268720 -> 268720 bytes
 amdgpu/sienna_cichlid_pfp.bin    | Bin 263424 -> 263424 bytes
 amdgpu/sienna_cichlid_rlc.bin    | Bin 132960 -> 132960 bytes
 amdgpu/sienna_cichlid_sos.bin    | Bin 227440 -> 227456 bytes
 amdgpu/sienna_cichlid_ta.bin     | Bin 345856 -> 354048 bytes
 amdgpu/sienna_cichlid_vcn.bin    | Bin 579568 -> 579568 bytes
 amdgpu/smu_13_0_0.bin            | Bin 292452 -> 292452 bytes
 amdgpu/smu_13_0_10.bin           | Bin 271520 -> 271520 bytes
 amdgpu/smu_13_0_7.bin            | Bin 287080 -> 287080 bytes
 amdgpu/vangogh_asd.bin           | Bin 172544 -> 184832 bytes
 amdgpu/vangogh_ce.bin            | Bin 263296 -> 263296 bytes
 amdgpu/vangogh_me.bin            | Bin 263424 -> 263424 bytes
 amdgpu/vangogh_mec.bin           | Bin 268720 -> 268720 bytes
 amdgpu/vangogh_mec2.bin          | Bin 268720 -> 268720 bytes
 amdgpu/vangogh_pfp.bin           | Bin 263424 -> 263424 bytes
 amdgpu/vcn_4_0_0.bin             | Bin 384336 -> 385232 bytes
 amdgpu/vcn_4_0_4.bin             | Bin 379056 -> 385232 bytes
 amdgpu/vega10_asd.bin            | Bin 172544 -> 180736 bytes
 amdgpu/vega10_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega10_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega10_mec.bin            | Bin 268064 -> 268048 bytes
 amdgpu/vega10_mec2.bin           | Bin 268064 -> 268048 bytes
 amdgpu/vega10_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega12_asd.bin            | Bin 172544 -> 180736 bytes
 amdgpu/vega12_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega12_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega12_mec.bin            | Bin 268064 -> 268048 bytes
 amdgpu/vega12_mec2.bin           | Bin 268064 -> 268048 bytes
 amdgpu/vega12_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/vega20_asd.bin            | Bin 172544 -> 180736 bytes
 amdgpu/vega20_ce.bin             | Bin 9344 -> 9344 bytes
 amdgpu/vega20_me.bin             | Bin 17536 -> 17536 bytes
 amdgpu/vega20_mec.bin            | Bin 268064 -> 268048 bytes
 amdgpu/vega20_mec2.bin           | Bin 268064 -> 268048 bytes
 amdgpu/vega20_pfp.bin            | Bin 21632 -> 21632 bytes
 amdgpu/yellow_carp_ce.bin        | Bin 263296 -> 263296 bytes
 amdgpu/yellow_carp_me.bin        | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_mec.bin       | Bin 268720 -> 268720 bytes
 amdgpu/yellow_carp_mec2.bin      | Bin 268720 -> 268720 bytes
 amdgpu/yellow_carp_pfp.bin       | Bin 263424 -> 263424 bytes
 amdgpu/yellow_carp_sdma.bin      | Bin 34048 -> 34048 bytes
 amdgpu/yellow_carp_ta.bin        | Bin 205824 -> 218112 bytes
 175 files changed, 0 insertions(+), 0 deletions(-)
