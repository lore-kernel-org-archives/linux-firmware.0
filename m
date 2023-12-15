Return-Path: <SRS0=xnSj=H2=amd.com=Wayne.Lin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AACC4332F
	for <linux-firmware@archiver.kernel.org>; Fri, 15 Dec 2023 07:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0284C433C9; Fri, 15 Dec 2023 07:03:20 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62F34C433C7;
	Fri, 15 Dec 2023 07:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62F34C433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHEVLUEoTQ7HzrUN68FJIV0dqu8NcqOVMhNgJsa3OZvI17IUo99n1WEQZLCLeIYqg0vmLehm84Ph4xli4a/kHb/P7xKtaNktkWna/3KhrizXKXsPrgTlzWUNuhsW3L/IzBLmd+wva2STMJyUF9SMIfqH4RvNeGRM38NkzecbMQ7QxRjlHa+eyiN/kBx+MihNlT/xslg6EF36+pR5mWx5Bmcd3BaWkuDmXeWtbguice98Qs9ctYnehxgid1baCvWyvPnJqSnmenPf8Q21wVRGqSyDHnCKctWAbYbrjylv5HdbI2DBE9U8C6/ea5b4unG6flSGZDlCCE5QGtFfvzTTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2KB81ClU1uYVJAywSTw6ocfY9zMs38xTKsn2xAzeGU=;
 b=kXGFGEccq9hQ/C1D+bwR9AbKRhmbbkEJOtx3iqME9MwjO/YpMp0M5IzSYgzVD7O/jwS0XnwBVUWyBqzgFzS6+yd5ILRoGjAAECvA6YG0ylLwZnKUkAi7iO8PYVaQzLwbW1zqRjqZeT+HgltB7Ov/dFFqo1JITf0jXuQli1Xi5TxeEVOORimx6Mcm8YbVah+fnjiV6x+Ur4PfMmoGcZbXC+aRHIs2XIqieH2mhqlLDGlqhCjRmbBV/QoSMuCeq2wuhHlMaTnHqgrievJbzTc4GxJK+3kqoYWF0vKhxSZELKR1aqlI9KtOtY0otysIvyZ8VJmmMCPj6jJaG4JmX6k/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2KB81ClU1uYVJAywSTw6ocfY9zMs38xTKsn2xAzeGU=;
 b=kVx8EwoWyxI1xXMHVYl/PRa4IB3emPOFAhK3XQsoq4zKzlA/tVXDeCr+uCUP1Fx5cmYWXHRr27uxA3rl4T5OfIJVul67v+wr0X2kDnm3UIYDWBIvEtIxIIrW0mU6gtJSLkKDoAqiYNtKZ1lUesq2QX83WMv9vBIxDJ3sbTZeKck=
Received: from SA1P222CA0101.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::9)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 07:03:16 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::84) by SA1P222CA0101.outlook.office365.com
 (2603:10b6:806:35e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31 via Frontend
 Transport; Fri, 15 Dec 2023 07:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Fri, 15 Dec 2023 07:03:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 15 Dec
 2023 01:03:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 14 Dec
 2023 23:03:00 -0800
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 15 Dec 2023 01:02:58 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>, <linux-firmware@kernel.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Deepak Sharma <deepak.sharma@amd.com>
Subject: pull request: amdgpu: update DMCUB firmware to v0.0.197.0
Date: Fri, 15 Dec 2023 15:02:56 +0800
Message-ID: <20231215070256.3850993-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: e487cfb5-82b3-4b2e-df8f-08dbfd3be97c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3G3cvaRV34FFnWew7slLTxX8ubiC8woe2SoZ5PqyG3FFdbNBehZvyrRewKtnZIDLja+M49Lik+TWc/iWIOMq64ZG98QWPYi3nzehDOXvbjd3skpbNs/lK76mCkG5NVmBKmKTWbijfResk0C9PmKTlyoJbGS13K66QNG9fV6YMqPb8asOX2ye6BNcPCR3t4qwyrNWio7Izxx/eAkcSoTzrvj1EfQvpNY7nEjFkOid1QJBAP/hea1+/cvaQObLwwj6xQ0Fv9PgdA8+3z0WjX8Azcjx5u5ODzlkZYoPcBuVohZ6Fmg5E19oDEDcdwGgfQyHZPQmSNCoVgOS51gmQx6Jr5wEmqdn8Zdks/MAHjVKVKv11XV1FuHV7KEWg734VRNm3pXMSX6gGTRrkcqppEQpJEzak/arguHr9R6ohjeUNYdMEZx80f1qtI0ETBodG5NofdzVrTD4/DQREA8HE/VkZaRuZh+8duoUkcy9D7PZ2QBAKoxE7PDWetwfror2WhJ5CzmxAsqaEY/y2UI0R5lfS96iZgSGNzF+jNLiD67ml9Zi2vqVCat1m3X9eFb1l7tQ3tp9NDvRfcy9yGx1XFOPSPXY/UPHAL4XOyq3jFFIIjaz7CWI/jfPhebm9K+bWy0szlv8YaUgM/ZxFTdH6li+ZXPsLRpYYw7rIzPW0OGAw6+caWYXGYs5duNrAcmteLBC8la/DOeHB1GqGCdwVMTCiBWMuiSTBqs20Q91u9OtGpKi/XrDOwXLWWd44kkYyLIuAOrY+SJxbnkiP2bJWZvW5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(36840700001)(46966006)(40470700004)(4744005)(86362001)(15650500001)(26005)(36756003)(2616005)(4001150100001)(1076003)(478600001)(7696005)(2906002)(336012)(83380400001)(426003)(40480700001)(8936002)(47076005)(82740400003)(41300700001)(8676002)(356005)(450100002)(110136005)(54906003)(36860700001)(70206006)(70586007)(316002)(81166007)(5660300002)(4326008)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 07:03:16.4448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e487cfb5-82b3-4b2e-df8f-08dbfd3be97c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-12-15 14:54:01 +0800)

are available in the Git repository at:

  git@gitlab.freedesktop.org:drm/firmware.git tags/amd-2023-12-15

for you to fetch changes up to 87be457c2e50d35caeefc00cd590af21c29a8b83:

  amdgpu: DMCUB updates for various AMDGPU ASICs (2023-12-15 14:54:01 +0800)

----------------------------------------------------------------
