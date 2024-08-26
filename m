Return-Path: <SRS0=Tmar=PZ=amd.com=Zaeem.Mohamed@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50D1C5472E
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Aug 2024 19:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78C2EC8B7A4; Mon, 26 Aug 2024 19:35:58 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54614C8B7A3;
	Mon, 26 Aug 2024 19:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54614C8B7A3
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFkb/26lrsGQa0tlew2/Zjj/aOKe9UAYCx9ShFl+j5reoXZfviT8PcEJvC4fWDXRTit3e3WyQA1OJ1D1NGdxpwlMSKGY0z9JYdDECCwOD3Lij9J77Tvjl3Tm7BumiDSNVA8Dt8fjfWTlUpca17Uh24d9eY+HHLwOa2yuOoCJ6mm7Fh3Uc0Z0ZLckqZ9BpC3YOp+LdUpkYKfo/dFZ1TwT4STKAuhd90l8QaykclelpThu0Vvio5NG7e1TyRpbLQc03NmkvjHqSxbiqDhY9Qr/tCYR9U8j2ADmU6Rea86/3T7T0SzeJq7hFTteR79hPo2qrBg/XJ4x5c/Uh3jqwGvf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEspQ2sIBSOY/ULYIkWQHny9BEqr+JIpIMDHeOJicSc=;
 b=DM4giVRncGCK1kRzl3Mh0VmZvY37vd4+gtdvfae/QYSkMRsa9RnoTSLKSQCqYrGJjwwlGAYoWazQUcWih1/MlY2rZ8cEaDqvrHcdI4PBpHphgJaT9DhH/fhQlrsZG5rqvfXTMY4iTjatRjKMPeuPa0JN7XiPPmUvhyNRb40dILmhYLow8tQdkS+0C+i/+MJaCIF49tnG7NB5fQ8HPqIVAiWLFMYZJV9vkt71X95tpP4FjapX9jECUq6lT0oYvZADlJdKMPB2TBsUSxcZQ2Am9tjO1TT8BGufJdlHwDwBvK7eV2tOyLT/eyzcTWRpoFYBCaRo3A0XQz5d/jZ7TmoTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fEspQ2sIBSOY/ULYIkWQHny9BEqr+JIpIMDHeOJicSc=;
 b=EeWSDStzkkk1598AH1yDXifenQxyIpJWDFOC+YwBnKNnzPlVTWUgbqZRnLAuydMe+fK8HJGNHfe9p0vQa/cIu/ZQ9G2VNLVwfXSl1C3s5VMuiLj0xc5+S503GJtIUPlfAiP3bk/lTV8FMbUfrt914G7YbDoGv4F+MD6ZzYFhl1c=
Received: from BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::11)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 19:35:50 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::d9) by BY1P220CA0011.outlook.office365.com
 (2603:10b6:a03:59d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 19:35:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 19:35:49 +0000
Received: from mkmmarleung05.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 14:35:48 -0500
From: Zaeem Mohamed <zaeem.mohamed@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.231.0\n
Date: Mon, 26 Aug 2024 15:35:35 -0400
Message-ID: <20240826193535.121596-1-zaeem.mohamed@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: e32b7316-f440-4e03-d301-08dcc6064a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3t1CiPEmTe8aQBTWegA8TkyBj1ux+T6QF2YpyWN7WUOXVxYTLkUjR9JdJsZb?=
 =?us-ascii?Q?sPmzT0w+jmTZiWTbngYg8JBpTUjUWszi+gAtwJ9tBhN+WIbmnKT9di8mpXuI?=
 =?us-ascii?Q?5+1Jv5j5zNKWshWnYPBWYvPu7tgfOKYnWIUIimW/oQBWOedoHRHGl4e3qq4k?=
 =?us-ascii?Q?uKFDnPrrsIDpyCvrI2lv7i13udeAKlctupnFJSGm3KAw8dS+qxyMfYA8toFq?=
 =?us-ascii?Q?x4GfPCzDFCIBQQbROTj4dY/Tm8NlJC/33q7yRJpy7qbjUOWQuccGhzxSPSpE?=
 =?us-ascii?Q?ZokoeGCMXXUfMgrcbBXgWbxXQuXfoGODPck6xjDrNmqJS1xtvim0GpDuDh7L?=
 =?us-ascii?Q?retVGwOanOHtwD53Q0lxbiq0Vs44R0OfaUioHvCJ8cno6t8J2V32q5IhA953?=
 =?us-ascii?Q?FvYvIbWaYOQ7QkyWPVG7/lPTawMrpCSECUSATYiJe4gtMzSgvqFoAEo+4dcm?=
 =?us-ascii?Q?t71BEatjWmMk48DXVxzVCHh12BCuR55r+vesaWDaxojxubjLpyRi3l7CnhyP?=
 =?us-ascii?Q?PM916LHjaJaYgTau5xX19iWvJxt6pMOHeN2BDCLoU3bUfFPwk+Rtc5RIxzLn?=
 =?us-ascii?Q?8e6Q8zTugPRy/JpfH0Q3BzmOyhdqSyPHKemWl3WK6Wf4TGREwYLyEp9ZXEjL?=
 =?us-ascii?Q?smJMs51t/LAdTCAbNxPqMtRLuIhtW17leD/PF3q6dIkvF96n0h2moKh70uaE?=
 =?us-ascii?Q?Krqc0cPf0jBevN4RM5TmSahRmQ4Sp8wY1PkOOs6E8S3TthM6ripFgP4JDRE+?=
 =?us-ascii?Q?RwM51nzdpm8ssO45rKt6jNB6qfiQD3WCBDgVWFCqZxnv4+5r4df59dWz0Jvh?=
 =?us-ascii?Q?c2ZyAlAmrI+DtfhKYMNjmqqkvLMtCSCHVRYoadcdiXHz4Umi2E2LUqVAkiuZ?=
 =?us-ascii?Q?5TG6hti3m+w7i3rm0wKu5KigctUyaohUCk3leiX0vcM3/4RNQQSc99FnTREP?=
 =?us-ascii?Q?qTFhfaXrK12XxCO4Z13ZCmaJ40uR1BLIIz6fP7PEA0pVT/2D4pefLokbcXg1?=
 =?us-ascii?Q?8Ilx2x9JtFhucz8E1+Plj8JkhC80MqiQb9p1a6N8FqSgrT2OEiUvQzwSEu/O?=
 =?us-ascii?Q?iv5vwd0vLzeyxdGYc/qMUbZBr4dxlTJo8I59tYvhVXVAuh+6CjEcq6nRf5nj?=
 =?us-ascii?Q?sqSPB32SmxlX1u3iCYkSOsZFH5nCFmL2RfdoT4Y8ZRHqkRDxbP/FpVLmZe/J?=
 =?us-ascii?Q?EjfAy21q3wjAJTNkULS60Ck4JsBAcB+UiYIAzt+5pT3o4STcyI3DoW3kFG5d?=
 =?us-ascii?Q?eJqyD7Fa5B76D7B8omTVjLoxbl+1VivKk8IynHIg4wWM4Soq1SzbrjFzV4u7?=
 =?us-ascii?Q?sD3hyGQcZ//wMmuSSMJVk5bTSvYMUOvNkwg5ga7akBYXBy9nslFWymX7bz76?=
 =?us-ascii?Q?t/RxyiUDVHsVpCp7M0USWb4vOQyT+KSx9rf7GiDPsFKER0HzMDMFndIQjpTX?=
 =?us-ascii?Q?7VuzdHge3n/3Vc00nEEW1vu8BLLQ28jE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 19:35:49.6943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e32b7316-f440-4e03-d301-08dcc6064a5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962

  amdgpu: DMCUB updates forvarious AMDGPU ASICs (2024-08-26 09:47:24 -0400)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2024-08-20

for you to fetch changes up to 3bddf4ddcaacdb4737fe2e59903a21556dc2eada:

  amdgpu: DMCUB updates forvarious AMDGPU ASICs (2024-08-26 09:47:24 -0400)

----------------------------------------------------------------
