Return-Path: <SRS0=JPUi=EA=amd.com=Mario.Limonciello@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2004C0015E
	for <linux-firmware@archiver.kernel.org>; Tue, 15 Aug 2023 18:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4555C433C9; Tue, 15 Aug 2023 18:00:42 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37A58C433C8;
	Tue, 15 Aug 2023 18:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37A58C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esA9d4ecDBudvaXiHpQxP/6ogRrEifvPW5b21RKYfDmBou5GzPTn/4NJ6+TX49U6HPkSh2rFuWF/Iwnj+dSu36vwY4iIpyZX7a++vSXIteBcIEbjgl56yFnEKL54P2fvGEOd4uAs001X0E2CEIx67NRULLH2HtioEfzwrUZneU9/0bU/BtqD8hLEnNsWNH2C7pdfC9d0nhFjzurZf0EWKFqiDc51dJqmPj+faIeCLeQ8oAJeGhYu7DEzwHB5C+KPta38+gg1u+jzsW6TiWLDbmX1KdOJ7A25ZmJeHwg7G9l+lJ/rHGkF501Gj8+nNotK8qzehBqL2vVee8qkVqAwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guYShohJJpm6QPWbTd/v67BvnMUZaM/A3Y1vrm2p+Tg=;
 b=QBAklvJv5WUG1F9Us2cc5CTX5JAytf8yFJlbv83UyyS0oPqu0pAIiGhGVzaPQsUVxR1phT8EvIQJaQy3K68xNPB3YS1zJlDj4v2sbt2+vONaOiA+PFBuCb9SuaPU1JAWe2Q0NqL8xcajKoTLrTxx+RH9MNs5/kGk7NTunVoJ7m57Wenz+LUOAnjP+/jfNQx76aY70kwrRXBPpr1f9ga4xO3BhNu7PMEFJ/rcxqrHmIh/EYXi4ld5qzZVfjMlSAPrxF0DdmsQRm1uukKgeiUJMsB7KQVqWsN6Z9ZSCnxlwj3w7SIhQCOV3TPS0JU3i7ZoGhKYx0e7zW1eJJjE6TtEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guYShohJJpm6QPWbTd/v67BvnMUZaM/A3Y1vrm2p+Tg=;
 b=4/EDPYGRwYGLOfiUUxZXZk5H96b2umKqj5vF3UynA5bY8FhUHWzXBv1/SGGD6tMM8Xe0v0fBTMLMKqs1IY15dLuI2lVAkNgtp/0dvR5PVUFaAGKz7+iV6NOFcfDlAF8+5VS3YLhClDB79MY/NTAdUmXDQFUeGcSB+PPFiXUzFO4=
Received: from MW4PR04CA0345.namprd04.prod.outlook.com (2603:10b6:303:8a::20)
 by DS7PR12MB8273.namprd12.prod.outlook.com (2603:10b6:8:ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:00:38 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::86) by MW4PR04CA0345.outlook.office365.com
 (2603:10b6:303:8a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Tue, 15 Aug 2023 18:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 18:00:38 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 15 Aug
 2023 13:00:37 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, Josh Boyer <jwboyer@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 03/20] i915: correct typographical errors caught by codespell
Date: Tue, 15 Aug 2023 13:00:01 -0500
Message-ID: <20230815180018.25554-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815180018.25554-1-mario.limonciello@amd.com>
References: <20230815180018.25554-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DS7PR12MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 764c6faa-8561-4c05-2de6-08db9db9887b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sJuGDTR6UBomJJ8bnzksb5ZoLFhZFBbACamNPQMVGxQog6x8wH8+4MfHVwgSMfJ68XUGkJlsaXtKR55wcFVdie2WvA5ezY6k1bxNFHEkfMdk80QjXee9x0p6ZlWduXiVAq/hmiutTrXepb7UuYVnYYwR3A81GleH+S9ounZdlYOO03aSPPL7V6loIbGqY3NFs6A7E555Jzqm1Yup8vBdqGx6QQkDmtl/MpCG6RXIqZ5PxIR6u/0gJH4LroTg7haeuPKN2eJxMECkbsgaEi/hdeSuIRC01HEEBpJWWff1pXF0jYxfm/d4JmLI25CQ3gJ7YbjHQiNzyniNoOEj3sqQs77oSOeSFkWK7ErpDXkEGUwDxxU5rtlnNWZrTRxFktA6/+ZlZUMzOVRrvTZM4TnO91N7sptdu9frlHA1mxYyFKGgXDoDikFkmpnTRAsHE2lp10LR96Z+La6WsCmfHRKLUvkrkSb7BDHyx2rIhtSLdo1tATxpdXDUJ/85vjNfvHi9RiNr8UauS11CzxBq4XXQ3wmnPbpuwojmtIpFcZyYW+aLxKb3ckpVHfpD9+NN8IsmMm0zQP6UvNgtwuXFEAKyCUPp5EhC0+ZnAY2doH2SuJCVTigI1sVvc9a703GljrRZ/mbyNX3t/lvl4MFexrhBuetpqGJ4HwBQRTEf8iPotpF3Saxl7ay+R4D6+QExxg7ZOO3Hr781UvA0y9Yf982mrNcS86YxwYSZR/yNIagcWOJsz/ECUSlC7t57RCaxvmww
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(110136005)(2616005)(26005)(1076003)(66899024)(83380400001)(41300700001)(2906002)(7696005)(356005)(6666004)(450100002)(40460700003)(336012)(426003)(16526019)(82740400003)(4326008)(70586007)(40480700001)(8936002)(8676002)(316002)(36756003)(70206006)(36860700001)(86362001)(44832011)(478600001)(81166007)(47076005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:00:38.5935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 764c6faa-8561-4c05-2de6-08db9db9887b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8273

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 LICENSE.i915 | 78 ++++++++++++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/LICENSE.i915 b/LICENSE.i915
index 2492b8d8..3a05d151 100644
--- a/LICENSE.i915
+++ b/LICENSE.i915
@@ -1,39 +1,39 @@
-Copyright (c) 2015, Intel Corporation.=0D
-All rights reserved.=0D
-=0D
-Redistribution.  Redistribution and use in binary form, without=0D
-modification, are permitted provided that the following conditions are=0D
-met:=0D
-=0D
-* Redistributions must reproduce the above copyright notice and the=0D
-  following disclaimer in the documentation and/or other materials=0D
-  provided with the distribution.=0D
-* Neither the name of Intel Corporation nor the names of its suppliers=0D
-  may be used to endorse or promote products derived from this software=0D
-  without specific prior written permission.=0D
-* No reverse engineering, decompilation, or disassembly of this software=0D
-  is permitted.=0D
-=0D
-Limited patent license.  Intel Corporation grants a world-wide,=0D
-royalty-free, non-exclusive license under patents it now or hereafter=0D
-owns or controls to make, have made, use, import, offer to sell and=0D
-sell ("Utilize") this software, but solely to the extent that any=0D
-such patent is necessary to Utilize the software alone, or in=0D
-combination with an operating system licensed under an approved Open=0D
-Source license as listed by the Open Source Initiative at=0D
-http://opensource.org/licenses.  The patent license shall not apply to=0D
-any other combinations which include this software.  No hardware per=0D
-se is licensed hereunder.=0D
-=0D
-DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND=0D
-CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,=0D
-BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND=0D
-FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE=0D
-COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,=0D
-INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,=0D
-BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS=0D
-OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND=0D
-ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR=0D
-TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE=0D
-USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH=0D
-DAMAGE.=0D
+Copyright (c) 2015, Intel Corporation.
+All rights reserved.
+
+Redistribution.  Redistribution and use in binary form, without
+modification, are permitted provided that the following conditions are
+met:
+
+* Redistributions must reproduce the above copyright notice and the
+  following disclaimer in the documentation and/or other materials
+  provided with the distribution.
+* Neither the name of Intel Corporation nor the names of its suppliers
+  may be used to endorse or promote products derived from this software
+  without specific prior written permission.
+* No reverse engineering, decompilation, or disassembly of this software
+  is permitted.
+
+Limited patent license.  Intel Corporation grants a world-wide,
+royalty-free, non-exclusive license under patents it now or hereafter
+owns or controls to make, have made, use, import, offer to sell and
+sell ("Utilize") this software, but solely to the extent that any
+such patent is necessary to Utilize the software alone, or in
+combination with an operating system licensed under an approved Open
+Source license as listed by the Open Source Initiative at
+http://opensource.org/licenses.  The patent license shall not apply to
+any other combinations which include this software.  No hardware per
+se is licensed hereunder.
+
+DISCLAIMER.  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
+BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
+BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
+OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
+TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+DAMAGE.
--=20
2.25.1

