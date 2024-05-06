Return-Path: <SRS0=nIG3=MJ=amd.com=ChiaHsuan.Chung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C2C4345F
	for <linux-firmware@archiver.kernel.org>; Mon,  6 May 2024 07:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9B4CC4AF65; Mon,  6 May 2024 07:10:47 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2053.outbound.protection.outlook.com [40.107.96.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA033C116B1;
	Mon,  6 May 2024 07:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AA033C116B1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ24YnfcqO3hWt33PssddjiDFV8QOowMByF0GoZsZO5tzdwYNFTA/np36x+5vsaMdPOxvYCQhcOBeghMwPG5UhS+CT8oW5xNFRJzv4CSCefuFxmqFYuaIq/qZU0FEUXVqcMwWiPqSS6uCqWfpwdWGRSDKULOesmdnS1q6KTmEhQmV03hzzfzH84AbeKNFLQZi5ukuKP1/7uL+0d024o82VHZUFB72iHtFMXDIBRhNDcAaiuJ9pzVLXTSogc6W+AKfsIkc/mxGQtrO76LGyGzWkKWVpGIPp+3TCFaH+otSfFmewcJVE3JrQsCfOXiQPiXRS14GJDi8SbxrwdWQocIYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2G3fLa7EmsmvjEf8PSdATm91dUZ6YZCmuU10wIWOho=;
 b=gXyXDPm82EZAEuvtPiqc8lDPtekG/8IRMZUUcVkWaVMPMGqcEj70GhNIUlYBA8TUGHLR6C1wSSeFRHsvwywJY3Sr5WwrKjmEo94tyHGModHzZMUyHtXMxe7vJKRLFyDui/18nl5Ajn9psrvfO/1OTrx3EMWVp+1OO8CC7ait2PQyoipNa5gxGF+LFXwUpf6FpVPitSZydG78F3pyjQetjA1UFNE7ks5gCfEsqpYdkbR+DGydqrU3vt8IODh6VOevAQZNDY4ZuMn5mgz4jGg0YcK0UVgVoZHX60sRnz2+jZ/ObWaXoLMqC07S1QCjSGmJ0m4jrfr1A3+cYqTk+MlJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2G3fLa7EmsmvjEf8PSdATm91dUZ6YZCmuU10wIWOho=;
 b=B0NYpRCxyvf/jWi8Ou09oUu1j1D5SZbVbHngSh1IBjsydanFOSGWUjDgDf1XlyioKr2Upt+k6vTCVdsjvNk92TxnaQuW7oS/jPOSN/KH4CyLawRfXTjjjEnU76jfyg0IIkWzy3wL8EoBoQ3linuE+Rm3HVuI+HMQNKKEwS6O40k=
Received: from SA9PR10CA0008.namprd10.prod.outlook.com (2603:10b6:806:a7::13)
 by CY8PR12MB7266.namprd12.prod.outlook.com (2603:10b6:930:56::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 07:10:43 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:a7:cafe::b6) by SA9PR10CA0008.outlook.office365.com
 (2603:10b6:806:a7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 07:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 07:10:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 02:10:42 -0500
Received: from tom-r5.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 02:10:41 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>, Tom Chung
	<chiahsuan.chung@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.216.0
Date: Mon, 6 May 2024 15:10:40 +0800
Message-ID: <20240506071040.3759396-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CY8PR12MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a68a00-a1fc-417e-9ec6-08dc6d9ba508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C5TUOWA7HLO/wrlzDtsguEoVvhSBLuzlWpBN63hFTm0jE87axAwDdz4y6hXk?=
 =?us-ascii?Q?78/u5MF3nuAoPWGUgHUDpLJHl4veZGH0nu3Jx/lhwC0iarK/QVJYOr3o0g7A?=
 =?us-ascii?Q?q++hhsNV8sJ8cWlA4qBC0oB+KX0GNjQ/2AJib7o0TMX8kzb7Fk3V92BOu6+U?=
 =?us-ascii?Q?2DO6XzRJAbochofuJL8st8BDoGqyEnjutqH9GUHCvX3fE5e1r0EzmYjfbKaK?=
 =?us-ascii?Q?jNOe5HBgIbnXvV7BcSdFaCKQ91foLsRp3STrEmvDxN9TqUJ4kWAvIcga0b40?=
 =?us-ascii?Q?Y3tk4cRKu02xrqae0dlmKuXcqo3x0PoOPGIbInEtnrL6PsNrea+R+0Enf4kK?=
 =?us-ascii?Q?3GK4BChaCwCn4n7fPHGRPdN+RE3V8U+Gvn7TPYtoQq8B286y2J1M5Q8iflWd?=
 =?us-ascii?Q?sSDN1nTDlsXCeHK0tEnKBX5fGQ4PTK8VdK+kWyPlGagtCHSIqQzMFhW+Tkxv?=
 =?us-ascii?Q?HdDzO9OkClNQ4X/GZdU8dJNPcHbyt8RKl8RJOq5kLhhPIUPwjmllvLsN77lW?=
 =?us-ascii?Q?mLcXwOKphBSmeoYRc2wijeYIsjr/fs4iG5Sy6bhkQqZfZjPX8KetP2/dxQuH?=
 =?us-ascii?Q?ykYiwJcMQ4ECc69HRV/8/R4Mk2l/mdsPpFrAgzaPF5lxKZDQmyITA40B8AC6?=
 =?us-ascii?Q?Vdkutlg6w9a7YBbjnixY6NrZvM5k1h99C4ABN/MmJ7xVfxQca7JAXjulj19T?=
 =?us-ascii?Q?CpOOEtpl7RTu92AzZyLCQhMPFX0OCOtmJmAFoG0iuuCWdFg+hjWdKT7g361v?=
 =?us-ascii?Q?acwIxdrvrCcjNNjia6jas9pKY6lq7R2UNsnOBT1OG67/kn7BWPDxgL6XjLPh?=
 =?us-ascii?Q?AIh3r/5R3g1d4EHQzIaXMNULiBx4/0BoT0imHSAClWynPyV+x8pJsgJkmFjg?=
 =?us-ascii?Q?avu8aU+kFx/q+N+E3fL0fXcYhpMg49CV1hl+NJYo4FWmgblW5vE5VBbx1/g2?=
 =?us-ascii?Q?J9cbtJODe81EmK8XfRyAJgbKRaObVnVhsRykVIi5KCnTRSONSacLBag374zs?=
 =?us-ascii?Q?dlGyhCxBgn+cuJqNujapLPxd6zOSZgfM/gaswtFq9bOrq27sXktOSG1iNvRj?=
 =?us-ascii?Q?oNoVMAck3libxilkmncSG/TYnn8lzkbfc33rIQWgZ356BPGp22SldiGKn6/A?=
 =?us-ascii?Q?gQQHrRv7D4cON0P67YvzrGOX0kpjSwEOhsf7UwsFuH6+e2ZKm1+kB5stjVlx?=
 =?us-ascii?Q?ZWxbp3JVO7/uXLTVdO6gcET+l3VFrrzCO4ced2w96jBlq5YWs6AMIgElJ5ne?=
 =?us-ascii?Q?PnC88fb373xzWzyXF8BGJuKoAr9/tnVx68oBVdFWYlAP2lVl40vOw+fxLlru?=
 =?us-ascii?Q?iISU5r7LvOvULZxhvpBaVR/Qmq2xc7vUQtemgAMFsxDWwD0+R/7gBTDS89OP?=
 =?us-ascii?Q?pNUOztMT77N0idsNKI6dXSjkP5C3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 07:10:43.5150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a68a00-a1fc-417e-9ec6-08dc6d9ba508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7266

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-06 15:03:45 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-05-03

for you to fetch changes up to b011b09f9f6e74cc941241349276a22a512c7c46:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2024-05-06 15:03:45 +0800)

----------------------------------------------------------------
