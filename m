Return-Path: <SRS0=T+kP=IH=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FCACCF2C1
	for <linux-firmware@archiver.kernel.org>; Sat, 17 Oct 2026 17:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A3551F000C4; Sat, 17 Oct 2026 17:48:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.64
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1792259317;
	b=LWEvMCHyGERq17zyGh+8BGEyuiXQez/jXeVWNLVHRBTKVOS06sdj3me4l9qk5y2gTunJ
	 c82ErrkbanIySkC1XASXUReH+ugWvACaRYsBWpwYqnIyLQpB10ooOzUAwAFhVxeim2i/C
	 kcL05tetPkGhueozvkORUtDhoIE56rY4Rm8Ol8vD0BLfLThpp6CubE19+xPe4V7BlilVM
	 oJw02LFth2LztmUQIs59nUMLHXkAWsrU5mdmfPWqIVAWzzL2Q8Kb2o04RmKE1cEdUghku
	 hRXhynQ9+zR8g9g2sZH5uHEtczYgPfjUeUaHmXJSlS7Uje/sdWm3hwWBd5KpHJ7qg+w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792259317;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UGvHqEKSKxNqnYKGHy7SRPFqWL8FxQoNkCyRaDa2sdw=;
	b=X5Rsh8xcBjnOzaQXMoORdyQ77Ssrr5L0YZdG05ABpQvUXIyvH6fZZ2m5cEf7nqTZ1GvZ
	 pHqeofLorBkj5UTjOpkNozf15ulrTLP05n/VSAi6PlWA1q0oI0wASogHgP1k/IhU3Exo7
	 OnmEgtcfVbMhMnTqtrRwLSaBP+A7c1cWN1A3BlODNWJtO/dCH0wfwx7Uuh7JN7PuoVjAP
	 iwDttjuRKSeptDUos/8VcunWrvTB05ObEjpYT6vd7rJjJFq44Yv4I7FLF7RvvT+W/rW4W
	 aw6Hq2LV41nQmpb237EjECptVP6MMhSKpIaXz27KWuSdBq+Gr/3uYl1pjPu0ICE1apg==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DGx983kr;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.64
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B83411F000C5
	for <linux-firmware@kernel.org>; Sat, 17 Oct 2026 17:48:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DGx983kr
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B83411F000C5
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEXHQWvhVu3bUREUK4OBfwNgim9RYk+li9jqvJ5P+6jG1j16Lf8Tv7yuA7VlylaOKNJRnZmtZc26IbYRIc9izo2T+zGDHlNViLW+hQ1yD4drA0GRG8PLXlTtcxL9IEyQJSAsv323AkRwB1ECu025XZF1WEVVla4DcC9Dhu2/L9bCiu5hsc93n5uIxIgY3hfKSQRx/5vzo9v7LnvHIx+3NZMDR3k4FKsxGh9RZTGEdzT6xrUtMUrEZlLCCL+AD1wv14fZqFEK1YEkbHqcZeArsSg7H9aAMB8GkoZ8w+f8eaZ+lUxSslYLPmZHYJsgSj3gpBueW2pgmgOPh2z2sadLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGvHqEKSKxNqnYKGHy7SRPFqWL8FxQoNkCyRaDa2sdw=;
 b=En4yLEZ/Nkk3kbAaK4heLCl4REm9Vj821LMroiwHN6ThHoLGbNCNaIleUjmCsKMLX7RHWjSpOHTzIcTzK5LXIl6lzhjhXNZb8wo/jqjEVAkII9guwH3L0KTCrZ+toMbln/fwxHmp2w2xo/FwTGR2kaijbhK6G30hS6Sag7URhReX6yir75GmRyh1X1Qr0OW3F/zU/0YAc801zKqbHPUtBn2Ga1jg+nb9WZDtxrzj49VH3YB2A5JZn92eRtKGQgtmWjdhaOiRtmIUjt2DryCtUirxl0MfVZEsAU3cvUZI+G6Uf8AQikVIdKVLqZh20L8CmKYcgjZbYqcEy41QFq5VGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGvHqEKSKxNqnYKGHy7SRPFqWL8FxQoNkCyRaDa2sdw=;
 b=DGx983krc4KKxnOLtRO9Jkfr7HQz9iXng/ytsbT5WQho+U+1TMTLt6swM5ITYqXSWemSXcaK1nq4yQ7ig2NXmH8ruQiUEF6O8juvZPHvcELH+xrO434zEXRZPX4w8qK1uZR6TkaeOw6yjBtsqp69fva8E+L+agJyCKK6DE5PoPk=
Received: from DS1P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::13) by
 CYYPR12MB8869.namprd12.prod.outlook.com (2603:10b6:930:bf::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.14; Sat, 17 Oct 2026 17:48:31 +0000
Received: from CH01EPF000BE94C.namprd02.prod.outlook.com
 (2603:10b6:8:44e:cafe::1e) by DS1P223CA0016.outlook.office365.com
 (2603:10b6:8:44e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Sat,
 17 Oct 2026 17:48:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE94C.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 17:48:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 17 Oct
 2026 12:48:24 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 17 Oct 2026 12:48:23 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware update
Date: Sat, 17 Oct 2026 13:48:20 -0400
Message-ID: <20261017174820.2720625-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94C:EE_|CYYPR12MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db0b41e-8db1-4631-8be0-08df2c76dbad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|18002099003|10067099003|13003099007|260925021311599003|11063799006|261009223027099003|260925022911599003|260925021911599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	FqTpp9RkvjfqEscyZBBjsYtwXjr4+XVb/lq7vOUKeb//HgJsGQLtBSp3iRRlvM+GeVNBW6YTaU+SIZfoI5Nac7IPXuVC/s36i4EYqFQz49CUerkIssiz7/WWIKvwbusA8K97u2UTMgXssJwO+A/J+aFLcNZ6fgXlCr4lrgktdKBgQ6Xz8Z+0L4hzgIyHZVoXEpAjkMQsi92PsaTV+2iBhC7jrWjZyngCUxGWs5VScsvWUL4noqP7yTxWcetL/SQkYcQZefNede0EX6dlyqdZQ0dc2TK8HrP5qOsFGnYWxLx2q3b0chpnvq9XoSIqLAngpF7IE+z+bkcLerp2+KIihJuGNBxnLj4I5C+S/aBRDWrdM3YspZ1jOER8vaqxz4oDx6ppvTKz3HByNncw732/Z9nlaergwhwDFfLf8tCWyBnzBcfN9ZB5Gz4mWZSyl04g3mNotaHYVqnzGJRj/E3uBrUZoX49etwqvZXoudPyARQ3FUM3KcWe2gnAtN5uOJd5C6/REXvC61lKMKBEgZnsNJxdhHzY/NlClmFh8trmg/uLb1sHVSBFKreXvtjZD/mH0pYsFSinzK9+lXpXnlTdiaOgQSvFuKExEmhwFLpWBOomhIwLqfAt84oTwYBs6RZb2eqRzKs35DlsLNSuCfsfHJfwrv7mYLLqSZdu0B8XCT0CRSq7C5RwjSqgklrPCjUI9/1+6buxAP6slaHtzq7UHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(10067099003)(13003099007)(260925021311599003)(11063799006)(261009223027099003)(260925022911599003)(260925021911599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XNG/UuorlrmQUOLbQQxXbDcZcQ/C20rqfJKmtZzptafVOFF/NwI4Z/yORezvBJAQHWsLGTxrlBqH7Erdf4irJnHw2djnDzdxKpB4Y33XZV9XN01JDD21DO+W/E1wtZcGfaOhm7tbhXkfxGPKHd8NhbcT8qcRUrj2LfG5ofUUjVsBvDGIDilGm/sJmny6UiNLY8B07W7wRd6IEnd3/DOceanJ97Ijbpr5l/djGPwbrHs1JVS3pkmFfc2E+TaHZhRL4/+aJqozh7JFauhIr8i286/JjsP9+/xiIGyQLNX5kZt6HZoiUxHFiAHEMp0ALwAGmtYebrgGxJ9elhpWgaU2uuhtrcAcSP6RbCCLL7/2nReUrVreZkummkMqlgh+hhe5LAcHJwJznXQMSVz/7hNss0aZ40nq01x1Fezqw0g4g4dIjBeQreBWjfl7/Xyrv6Uz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 17:48:31.2691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db0b41e-8db1-4631-8be0-08df2c76dbad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE94C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8869

Hi,

Revert a firmware change to fix a regression in some games.

The following changes since commit 6f9bc511052c5e990fe606445c175fc4f35d1b3f:

  amdgpu: update vangogh firmware (2026-10-16 14:45:12 -0400)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-10-17

for you to fetch changes up to 8e3b76a7083a6738ccc4fd83b8243931568f1f15:

  Revert "amdgpu: update GC 11.0.0 firmware" (2026-10-17 13:40:39 -0400)

----------------------------------------------------------------
amd-2026-10-17:

Revert GC 11.0.0 firmware to fix stability in some games.

----------------------------------------------------------------
Alex Deucher (1):
      Revert "amdgpu: update GC 11.0.0 firmware"

 amdgpu/gc_11_0_0_me.bin    | Bin 198608 -> 315120 bytes
 amdgpu/gc_11_0_0_mec.bin   | Bin 272720 -> 406528 bytes
 amdgpu/gc_11_0_0_mes1.bin  | Bin 171968 -> 220480 bytes
 amdgpu/gc_11_0_0_mes_2.bin | Bin 202112 -> 260624 bytes
 amdgpu/gc_11_0_0_pfp.bin   | Bin 107984 -> 232096 bytes
 5 files changed, 0 insertions(+), 0 deletions(-)
