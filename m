Return-Path: <SRS0=FEmT=LZ=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D62C4345F
	for <linux-firmware@archiver.kernel.org>; Sat, 20 Apr 2024 19:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1254CC113CE; Sat, 20 Apr 2024 19:39:13 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2071.outbound.protection.outlook.com [40.107.96.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD3FCC072AA
	for <linux-firmware@kernel.org>; Sat, 20 Apr 2024 19:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD3FCC072AA
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRhAvC6ImaeFp2MVUdRpqaImQgRAioLiIJYiizm8IFjjyC6PXiotnBxZZUCc8/26ePakSRbga1cm+TYaaJ9Qy5cMX7hKscTrF2K2O8PotcLvms1pt9hAGqS1ul9PX54X6OjeenFJdki6S/CnS1BDM9gHSW/z3v4Ekba8OkP6t6+2fsvFXOfYTXsG3e0l9OjaKUnxwGhzxI1VMTiaHYeBg2HyR+C1ZPHEHG2w05gaG1oCfbJ4juTuK26e9QKbewUGIKkghTHd7+eAD36rrNBQv+DU2HQLfmdNOWCQepdeyqqziuA0U0laXhU7Zc8aezV3gLRzt1Q7urSe50/y8jacEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZgyQrd5/MnfcChDC0u2nO0x4jaQlmSOwt3mFgsadak=;
 b=YrKw1bB3hCBihxpgwnS9AzVsq93k26kG3dDcda0UnhlWWlukAilzcANDJmObuYmTlHLbP+AGu6x2/44nhac6iQE6yiEQ02vFTB7oJ7J7ykuxpx7w/Z5f+BNV2jaePoyDxLW332TddK0zKD9h+66XeVmNxjOx8rP6IVVC81IJZWSORAzwcI5U+H/c2fZPo2E8uPbEE3Pdx/T64FTFFOkZLFaOutx6LzyS6mVHyrZ1Ln2y/Y2fLKGtYEtvZczl6dOwmftnbVUtHb/fABU868JmwJhe3pWwMLUybR16WntoVbjllo94XxQGE1Z/WNdZdg3+Gz0cfeusK/S4RHian3BxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZgyQrd5/MnfcChDC0u2nO0x4jaQlmSOwt3mFgsadak=;
 b=fkOw2d9XTj5yKifvBKILzlmjmGwJhhdOK2ylLsCrwADoAtc7G2/js1oGKPC12WYGp2vE0pm4vxPWnldYITC9I6nkuA90vNzb74pYDJiCwe1CnmHYBkZ/QFhb6wEqCSE3Qh9Wv9AzkgwdHv2ulShH/9woQj7PLlri/Hy3NSjguMk=
Received: from MW4PR04CA0066.namprd04.prod.outlook.com (2603:10b6:303:6b::11)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Sat, 20 Apr
 2024 19:39:08 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::af) by MW4PR04CA0066.outlook.office365.com
 (2603:10b6:303:6b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.31 via Frontend
 Transport; Sat, 20 Apr 2024 19:39:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Sat, 20 Apr 2024 19:39:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 20 Apr
 2024 14:39:07 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu amd-2024-04-20
Date: Sat, 20 Apr 2024 15:38:52 -0400
Message-ID: <20240420193852.3145666-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5d5f1d-8513-4ac0-5acb-08dc61718bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?821Vik2KREdgZURTD1+KQQJFGA5IN6wD/vuCZXdjg3eYzc2TbBcJlHqERUZQ?=
 =?us-ascii?Q?CU8wMx193lLslpJmxyFKCJ7+NtxeFpL06LL2CoxRJy92VNWB+9RXn1Tt8Ery?=
 =?us-ascii?Q?vMyo5yYjfEMcyEAw1tGt4mqluEpnQ87FexWY5vMqutyRe8n7oLH7P9j2gV1v?=
 =?us-ascii?Q?xyd0lWoazr/YrZEt/zsCVf0QaBBwKPjzW9aQb3dc2oFTLRksdt7pppVP0YjE?=
 =?us-ascii?Q?RYr3BPrXg0hi0CeCZAd6sCXY9jtMl6qAPVPnLGVSoUQLNwFDNuj5v8atjCLX?=
 =?us-ascii?Q?y7tJ/udrpPNYuEdY+nkDQoEPg9AyOk+PwIHBbrLFqe25l+ldj5DdHcQbEfEc?=
 =?us-ascii?Q?mN25JmRAYIbU8cc5EHc+IDLqRs0Q4qk/z9Q9G3pg3Y5wqprrRlQEnWJL+/aH?=
 =?us-ascii?Q?apYypxSckwXy0/6u5poJG/f+XuHoQAfDn/eLTZVzW8zq2MYXuqu/BPkRW9MA?=
 =?us-ascii?Q?B9dC3grruM2uZfpE2UOkWtBESTeyx18G7te4Hvsd4lneq7yqhn/pLoIiHcnb?=
 =?us-ascii?Q?hlWOFcxJ5PWhAvG3eB/w1M5rlaRkIqHsn3KwWJP+AdNCflQFIVElPq9/BBzn?=
 =?us-ascii?Q?q8U/GDyC9GmKDu6xkdiWHM7H3SB4Ra4Wumj/T2CLgoiUrUIXeTkHTHNHFFdW?=
 =?us-ascii?Q?hQ2xHMWAw/AKwUXIZKxxeZDs4rGC80Its5bqDVHO97rC+fMpHW1huAJMpkWY?=
 =?us-ascii?Q?X1OX2ce5fhRU9a6IMdKGFYtEjVH6rvjYKHqfgNgaOkVzQ/9oj2WLFlo4xd6z?=
 =?us-ascii?Q?02liwiBBLd4T3qjXXzjzj/uK8Tx04fmInsNFLkP0vzlLSCJi8r9f9hkjfzPH?=
 =?us-ascii?Q?ympZr2elVRYTM0jqgB6zvcwQJ6M7a4uAVABrIaTsUQvOklLJ4VA0PeiKxbLl?=
 =?us-ascii?Q?KlFzWeHH7cuR6UhgYQ3+cqwn1LU37ltOx2PiPWr3dWNp+2az0czmeyNO0Sko?=
 =?us-ascii?Q?7nJ1ngv6m2C/deSOG7/WgrJEeefCyslrLUgTK9IAgzA87BDU+psCJvUgH1AR?=
 =?us-ascii?Q?Mpf81wOFnuEmIs4EcFd4lk19tqOHBoxJg6yLYPE9HnOxzS2aTeq8uHemzJ+S?=
 =?us-ascii?Q?XdjiI81C47C77YSvT8AAx0FV/xcP8GPT9A79CrdFyQl1J+CzEfSifjNXjgVw?=
 =?us-ascii?Q?/fxmnZG4meoTebGUUM3fmOd67KjhoNheaSteoilNVBlOv8OsUQQ2T2Re5e0C?=
 =?us-ascii?Q?OOPeG+TqDwk+9sEYlba4RJ5PehCeqfAfDOFi6jJ5r3KMjy9FpxaWVxA2O+bj?=
 =?us-ascii?Q?3u7hqGsOHq68JeIb1QtaA7ZukysDsXotGRmaqrKqeIv+cO/noA9U7rTw+eRZ?=
 =?us-ascii?Q?s7NbvZNf+4clCyHZvLPlv7yw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2024 19:39:08.3747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5d5f1d-8513-4ac0-5acb-08dc61718bda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094

Hi,

Updated amdgpu firmware and update license date.

The following changes since commit 08c8fb2e3eee58aaaea6f2417d407aeb6a23d2c4:

  amdgpu: update beige goby firmware (2024-04-12 00:05:22 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/firmware.git tags/amd-2024-04-20

for you to fetch changes up to 8871667128fbe11d5eca636f09bab1db89521702:

  amdgpu: add DMCUB 3.5 firmware (2024-04-20 15:31:10 -0400)

----------------------------------------------------------------
amd-2024-04-20:

Update firmware from internal git commit:
bcb1a6a525d92c69eee29c734b0d9c050214e7ce

----------------------------------------------------------------
Alex Deucher (8):
      amdgpu: update license date
      amdgpu: add GC 11.5.0 firmware
      amdgpu: add PSP 14.0.0  firmware
      amdgpu: add SDMA 6.1.0 firmware
      amdgpu: add UMSCH 4.0.0 firmware
      amdgpu: add VCN 4.0.5 firmware
      amdgpu: add VPE 6.1.0 firmware
      amdgpu: add DMCUB 3.5 firmware

 LICENSE.amdgpu             |   2 +-
 WHENCE                     |  14 ++++++++++++++
 amdgpu/dcn_3_5_dmcub.bin   | Bin 0 -> 391072 bytes
 amdgpu/gc_11_5_0_imu.bin   | Bin 0 -> 132352 bytes
 amdgpu/gc_11_5_0_me.bin    | Bin 0 -> 263424 bytes
 amdgpu/gc_11_5_0_mec.bin   | Bin 0 -> 268704 bytes
 amdgpu/gc_11_5_0_mes1.bin  | Bin 0 -> 233616 bytes
 amdgpu/gc_11_5_0_mes_2.bin | Bin 0 -> 249536 bytes
 amdgpu/gc_11_5_0_pfp.bin   | Bin 0 -> 263424 bytes
 amdgpu/gc_11_5_0_rlc.bin   | Bin 0 -> 166528 bytes
 amdgpu/psp_14_0_0_ta.bin   | Bin 0 -> 230400 bytes
 amdgpu/psp_14_0_0_toc.bin  | Bin 0 -> 2560 bytes
 amdgpu/sdma_6_1_0.bin      | Bin 0 -> 34560 bytes
 amdgpu/umsch_mm_4_0_0.bin  | Bin 0 -> 386656 bytes
 amdgpu/vcn_4_0_5.bin       | Bin 0 -> 388816 bytes
 amdgpu/vpe_6_1_0.bin       | Bin 0 -> 25984 bytes
 16 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 amdgpu/dcn_3_5_dmcub.bin
 create mode 100644 amdgpu/gc_11_5_0_imu.bin
 create mode 100644 amdgpu/gc_11_5_0_me.bin
 create mode 100644 amdgpu/gc_11_5_0_mec.bin
 create mode 100644 amdgpu/gc_11_5_0_mes1.bin
 create mode 100644 amdgpu/gc_11_5_0_mes_2.bin
 create mode 100644 amdgpu/gc_11_5_0_pfp.bin
 create mode 100644 amdgpu/gc_11_5_0_rlc.bin
 create mode 100644 amdgpu/psp_14_0_0_ta.bin
 create mode 100644 amdgpu/psp_14_0_0_toc.bin
 create mode 100644 amdgpu/sdma_6_1_0.bin
 create mode 100644 amdgpu/umsch_mm_4_0_0.bin
 create mode 100644 amdgpu/vcn_4_0_5.bin
 create mode 100644 amdgpu/vpe_6_1_0.bin
