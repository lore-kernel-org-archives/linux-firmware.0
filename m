Return-Path: <SRS0=060V=CD=nvidia.com=ttabi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD41E88D6D
	for <linux-firmware@archiver.kernel.org>; Sat,  4 Apr 2026 00:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A3A7C19423; Sat,  4 Apr 2026 00:23:17 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF3E1C4CEF7
	for <linux-firmware@kernel.org>; Sat,  4 Apr 2026 00:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF3E1C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQerVW9nbzFfGmcP3ysdXAuZ+Zze8k7hruqbFVUPFnN9iwSJrqoq567gArvpHmh8SdK7LXFpzDXUyaG0kiBNOvaL0z0OnnL97Pfr1drWMI9cL4CT1kK/XNgakPtaL+Jcp2Zb4fv1Tnn2A7CNsC/rMo9UH4XTHv74+3NW1b0OjmB/NDI231IzNkk4V8hBpkIOcWw2HspTJe67F0jtGzCmpO0LJNGmT3ikbBAfyiqUyQjYMpHIn2aQyztuSdQrDPCNk9h4enxPUTm3tGaG/pHhJeTuphb9konkdSzmn1phm8M0DgbDfxOOGo+VrMDF8xSWPWuuiW4I/9CW59N0FzxR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTL0OoOFiKj3uPShW+3F+lrX0xxq9fEZF5WrWSOtX9Q=;
 b=L9P4Asm5tvWaYG8AGBTWaaTglMEd5jOSMeAQFxqqsdGIJSUiTsF1ch/naJtjiCz3Bq0aZE+CsLA2iComn0/FAvOUznlpa94mDO3WebfEIFbI36OQPXanfd59iesLTqhPA2ognsyg1a5s2XkL9e21DDZu7H7hnYlx0q6BRSen0vURTwSkt+T+CxtW9Ots+RVeaHmezk7lAkifZEk5Vd8qSqHFxhxjv4f7KtIJu5YuajQXBZOkvR3OhSnYcphTkogVxFecXibikskunCCA/qKebrZJoZ2//s2YfMiYmOfF/fK356UWEJOZm0sc/erB2ztDYj2RGSmLyvXSHgQUff6ejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTL0OoOFiKj3uPShW+3F+lrX0xxq9fEZF5WrWSOtX9Q=;
 b=VaTFWOO3880BjH7Q+AeH34KCxJ2K8rgLUo3UBP2gYv45tIlmjFI7Lsx9SO3iqUZSdc7Q9+uKo+iTbJRqGq/BGhqXY1yBOw9upF1Vl9/a6N8natK+56Yb4y2wOPMaYqrCjSF2GGocf0c8iIHgBEAdg1dj1q18wTrW/nRSvuOIMyvdkPcV/hAoyTbgZqC3Kl8pzds+pcJfpgu/P68gV7IJNh0ahWfI/J89meRoUO8RJCMG2OKB+xaeyoeX+pj217I/LgNvSWafJK5NN93+NuEl1MT9uim6NiIiJShTjEzd2TSJolXCOBMrbAHUuV1/zZFxqJqgqzF786PBobxqfR72GQ==
Received: from CYXPR02CA0078.namprd02.prod.outlook.com (2603:10b6:930:ce::16)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 4 Apr
 2026 00:23:11 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:ce:cafe::14) by CYXPR02CA0078.outlook.office365.com
 (2603:10b6:930:ce::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.21 via Frontend Transport; Sat,
 4 Apr 2026 00:23:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Sat, 4 Apr 2026 00:23:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 17:22:56 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 17:22:55 -0700
From: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: [PATCH] nvidia: add acr/bl symlink for booting GSP-RM on GA100
Date: Fri, 3 Apr 2026 19:22:48 -0500
Message-ID: <20260404002248.2074815-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: acabb745-8ebb-4b60-bbd2-08de91e05a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2u0fEpc73LCm0z8TDWsbs6Wlb7sOsxNgJgvcxgEeA2qk+r0s4ANOOHV0Fbpwsj8PWmfkbYWNMmkCN9RMbtaWfoF2c1ZEDVnWcbI7cZsRSHvlAy3xYtwQeLZXEP0QmhdPgMeAy15JIV3p+m7QuM7/NHvgIux6xXGnp5l4LoELtzAA9o9AjkGtPcECucwvHIZBb/G6CYbPFexYHaO4+Yexzot8VbUMmWZhFvGUVQzU9jL7AsFSlo8gWzS8O05BySOpePLRS/a6AXvCNE/j/ry8PLVCf2vxOAIMHzwKBT4t1N70k2jBP/lcuMURvU7npQGb42EcCQvP7gjfnuNahs3Vdx9DwAbtxYSqtoep2m3mo7/LJiYLVMpgTAw8XfJHAylvFelLWfeZ3SPwnfew4CPwxCJPMeYd/hrGh1TyNkl2OoiyHaPeY+n0T3m7ZyUGm4HwlnjQsAxmXvL4jyDdrvx62/E/SrjUHrl53KjfQBpPW6tzMA/2FAPWdr/Mzq3qxtBrUXsDWhwzCI1zuR/RVybEQJSVZKDD0MRCvYFyHn4cFFCCJrOBkidvYM1NU1dtw37bq6k560u63r5vd9Qhz2ZLe8zda9fHMQUpMhuoDWywKrCHzc/CASpfz+gRi7N3XcKwD1v4/luiO09azVmw/lqpU837tTm+jTkm9BzB86jHbp/NDIwlbCpA0RNiwkGzhw0MndQl6Juqg7ljaFL13AoGiDiOHrH5dVAqIb5M5kI1J09czj1KnTBycVlwPfUyX0QtJHwnVcd5ZfrSVILr82GRww==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6z5SUbLlfbJCH9h8UfgsZWNRxP5O66T2jFx1bp8n6P7Mlh/vOHN3xIlkd2wPVtSFpRqkB586kP7ltwoLm5PTfk6IRPJVGv7vo4HE4ic1DpT0JSYfmcWzh/KzsmarwcyB9FPMK6BbPA2xeJnwiHY3UIDc1JA4ieAxoQaVvv0d43m2xPJ9EWyBJHI21rXePtWCxYm3gabo/ZhneluXbLV/aIKAyqTJ/P+vaw9yi7cs3NbCvCaLW5sx2GCRn6WalDPp2k8hqfu36Coz7bNQr/sDuqHfygAEWT7N38uQRFYlHN8NPR6UmpWCdprOrLajDiLxf40YtN+NMq8oGT7ENkgJZsrFEeZtgQ/ZCfBmzcLxzpZIvc00Bsh2/wdPhTmxOIPJfNBbTpPUQegJxjNvS+CdqQ3N2F5yWASWiuVya0ElHkgnLIxUMspzWE3uALdBYJgc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 00:23:10.8001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acabb745-8ebb-4b60-bbd2-08de91e05a6e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

The Nvidia GA100 is a compute-only (no display hardware) Ampere GPU that
boots like a Turing (TU10x) GPU.  Consequently, it needs the same kind of
firmware images that Turing does.  Since Nouveau looks for all images
in GPU-specific directories, all of the firmware files that GA100 needs
must be reachable in the nvidia/ga100/ directory.

The ACR bootloader (acr/bl.bin, aka Generic Bootloader), is used normally
by Nouveau to support Turing and Ampere GPUs, both with and without
GSP-RM.  However, there is still significant code missing in Nouveau to
support non-GSP GA100.  Consequently, the firmware files that would
be used by Nouveau to support non-GSP GA100 are not included.

Since GA100 uses the same ACR bootloader as TU102, all that is needed is
a symlink.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 655c4cdf..1a6b9fef 100644
--- a/WHENCE
+++ b/WHENCE
@@ -5894,6 +5894,7 @@ Link: nvidia/tu117/nvdec/scrubber.bin -> ../../tu116/nvdec/scrubber.bin
 Link: nvidia/tu117/sec2/desc.bin -> ../../tu116/sec2/desc.bin
 Link: nvidia/tu117/sec2/image.bin -> ../../tu116/sec2/image.bin
 Link: nvidia/tu117/sec2/sig.bin -> ../../tu116/sec2/sig.bin
+Link: nvidia/ga100/acr/bl.bin -> ../../tu102/acr/bl.bin
 File: nvidia/ga102/acr/ucode_ahesasc.bin
 File: nvidia/ga102/acr/ucode_asb.bin
 File: nvidia/ga102/acr/ucode_unload.bin

base-commit: 265c1591178cd347d27f9c95b43c9821ac8572f0
-- 
2.53.0

