Return-Path: <SRS0=2yde=HG=amd.com=ChiaHsuan.Chung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED799C61D9D
	for <linux-firmware@archiver.kernel.org>; Sat, 25 Nov 2023 04:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC050C433C9; Sat, 25 Nov 2023 04:27:50 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C886C433C8;
	Sat, 25 Nov 2023 04:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C886C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFHNI0O1oHLkdQerzM2oKMkCfrTVAY021aufjegB9XNqKULTBWE/gbK83+FnIsQ9+Borw+O3Uah8BUAWoVLLwadk+w9y/HXWFAaFqze5ro/vhTLJDUInUKpzHCFixv+dIDnJrOsnw0tI6KQ9/MsGsU4JuDUbKaME3/jbspscgNPrZBmDIiMN10fVFOlzwBX2YfOwd+IgY7VsI1ZPi09FEuDAmscHDC41BUihVFb83u6Uotc2MCUFXxe8Gwz4Lpo1VDRw2RhPDI06GUi2+dqOpMQAJz/+UkRs8FZq83NtAyByOJpB4xRqQ0hgvk5qJjeQCFBj33Txe3tgFlnZCE5XyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zU4ZGTcpoQHSubmazsKAoCjo6lgZBbxJTuM8oSVBOBM=;
 b=ARGgs4aYSd6DmGFyiZrYFex0IDLbtRQIIchIUlRt3a41Sxv2IGPD+4Lu6PO4U3RWNl9V4xWhqxKd8NgXvVeYnCpucSTtRBssk4V/m187BB2WJUzXFlzNAS8X98t5U+VKaacm9+uO/aClhR92vc1zA7yGlUW1XrLL/3rdYXrBkXVRnbKUhVAhDfPC0y9YRczhd+ipYjhinGRPDHubEEtw2hKNIEmAKxumhwNM4dTu5eV4UMlzmlKUXUbNK+IYDdIMzaqAAxSGh4VGjI4SsmWv6u6C5AAqFCimLhVbS4wqFjj8kFS/hZVnCiLRZFiv+9GRubBxMuNe/h28T4C3pE8Izg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zU4ZGTcpoQHSubmazsKAoCjo6lgZBbxJTuM8oSVBOBM=;
 b=SQYet9IntdTn97iwEvZTvyEjO1btrk40A7I55DEZGOxxHDtIA3OOiNMEpJaM1WxLCg9Gqmd8UMd+9qp/5x2FbaSJwoXml7Ayb+jW+BvHd4c6K80wLtR3Ew2F9IB2i/vPsxEzkYvZz371qgsshiCgMKWZgJzTmUkk0zjPNYvOedw=
Received: from PH0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::19)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.24; Sat, 25 Nov
 2023 04:27:45 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::46) by PH0P220CA0016.outlook.office365.com
 (2603:10b6:510:d3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Sat, 25 Nov 2023 04:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 04:27:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 22:27:43 -0600
Received: from tom-HP.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 24 Nov 2023 22:27:42 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.194.0\n
Date: Sat, 25 Nov 2023 12:27:41 +0800
Message-ID: <20231125042741.112038-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: c50376b0-345e-43f0-2b28-08dbed6edee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3QVJEzAhgsr/Nkc9JgD2FNoAo3Q4QHMifYyzlWKzLuUIuFjETXlaqk96lWdpcEbgAk6RsgZOTKnY0mw2uc1tvzrhC5W1XYDBOr8dd8wzOaXkgOfzJM7VB21e1OhgjAig7s+4PdJ/y9aH9ropIvQKbrE+I9QS+THGdWG1kbtMAjHGH/jqha839AHmD7f/4Lbn3Mbv1+TMDat504HKNCpDUE+7mOY2LKOdAOfd5T6xd64fO4NHusi/qXaRVIOXe+z36x8sw+KByzF44DWpNAAKL6OcPAiaMwtWCtYIZ6t9dWfYy8T7EbQxZ/usii1Q5hBggllBpa5b1jGp5oxHJ4G+GE7p6aZbL6utF2QAKVKlg+DKGEm0BJzQ8zz464qMMg+gJbEfH3M56kABMsCXBJelPrSHm0cLjBb67QH1vOgByTlFWOFZTtDO7YAJvTZFTHXClqxlMRvpUcJxH3e5FDS/QOYr/YFL8dUvbRnNE46gx3jo0eBHnSaAFP0H/rTXbrPbvou7G/BsrBEvOuuop9gLfa25vQEBZssg9XjZ+yEa+/y7QB4+EKQNx6fJBthPMsmM8KYE1Nv7aI5TtIX5AtV+Gxcr8g8xqWOLQBqMfECwzTe2w/CPTG/WnVGur+DxccKgtOKiYn6WiHOD2DEmNl8ObVpbZJdadk4ncaY5nsvQb+4eeI0m2kMHroVEgnbcfgApoK6pu1NqUuF1cUQFO7XrmhXLuSg/PxRXndWQbyog0nGG1Ap9eWAaf35oiAwcQfnKAS1r3/wQ+PazwNUsdslOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799012)(46966006)(40470700004)(36840700001)(110136005)(316002)(70206006)(70586007)(54906003)(478600001)(40460700003)(15650500001)(5660300002)(4001150100001)(41300700001)(36756003)(4744005)(2906002)(4326008)(8676002)(8936002)(450100002)(86362001)(1076003)(26005)(2616005)(40480700001)(83380400001)(81166007)(47076005)(356005)(36860700001)(82740400003)(336012)(426003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 04:27:44.3850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50376b0-345e-43f0-2b28-08dbed6edee0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065

  amdgpu: update DMCUB firmware to 0.0.194.0 for DCN321 and DCN32 (2023-11-25 12:14:44 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-11-25

for you to fetch changes up to 87427f23282eb587a375c0e6e89f15e2b7a06db5:

  amdgpu: update DMCUB firmware to 0.0.194.0 for DCN321 and DCN32 (2023-11-25 12:14:44 +0800)

----------------------------------------------------------------
