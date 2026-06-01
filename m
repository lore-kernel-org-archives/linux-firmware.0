Return-Path: <SRS0=9ZLL=D5=amd.com=Alexander.Deucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C1ECD5BD1
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Jun 2026 18:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83EF71F00898; Mon,  1 Jun 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.39
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780339430;
	b=pOzzM4cFHLOM9VV0gI4zZVkNuFr8IOcx1OXoQgJJ8dklxitt3QwylSRNHOVHVG0RxiFo
	 bYX2lLaOaE812MhTvLRD8TycGUDNvbly/oo9/g0YekV8DvFn7XRzAg9/cl7CteF0KBc6C
	 qTFqxFDoUinn0hPSlQ1Jg3rA/OCx+4+QvLOWNif0OKOx9j16GdDpVUt0Pcl88JKaP07R5
	 l0sz/JxRaNgtavVv80OOVKDL5y5MOKix1OrgvxFOua5t8hmCTMdFny22lb4dworbOZuG3
	 Xu09a/gJpnGSl1HIlIiDI5UIeFjx93v4W4mnTZ5YktUr6BCN3p8cbKtuB57CeRfha6A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780339430;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:List-Id:To:CC:Subject:Date:Message-ID:X-Mailer:
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
	bh=gY8STEvWESJL6R+IZR2kncoROIyeZwuhqMZrI/tTD6g=;
	b=IBD9TykB55+gY3mUEjMy8IeT4WKWsJ2Mte5XF0CF6DCLZii2/5//6mykj8Zi6vkx1BND
	 Qc3zUHWO+qyacz4d3s9Xsc+SFbI6jav1f541NZmzGWaykFvfLxnXorKOy3w3Xf8YfK/SD
	 kfO3ySxvO79QvuNiPn8ScnCD75qG/fEHq9OC1pJkpEZ2Hqz03GfioQDPx5pKtkbFeBbdk
	 JtgOLGDzh+edCE6Tkok1Z8KjbL5kYe7jJYJqZIaK6jyKGAKU8sjbPLyW0TatbWPZtGVjH
	 uD1XeiX8McBDNUVbrl4FeeQrMnZESecmA77yd7IffHe7iKnwf8wi0LO2jq4ACdaH8Kw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tTGVLE3z;
	dmarc=fail header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.39
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD1D41F00893
	for <linux-firmware@kernel.org>; Mon,  1 Jun 2026 18:43:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tTGVLE3z
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AD1D41F00893
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JszNbvkbgPi02rNNlWi30nO5oEgfFq9hIhsWuOrLUfH6CyhTL2moGEJQjtP4FEIg1oQdriGO2+90iT7rOwVRgth4ITAxAJ99f4xg8on+R0E9i6imU++/fT3LYrViTVIMAqEAsMJYUM/nOh9UA85PxGCwHijpShRr7KNoj8CTCNJ+xrkG1OON3SIrZGdESx2DvykFzreDmknCEF42C4TY/GToyPJkCFunNsIgj1u/vms/Rx1sB6BLmoGK6XXprYShm8XSHZeQuRylDnIO5YV1emNji7vNDrUJQ8FXjUIhNQ9hkoySIJ9OTNUxqQ2E+0UznsK+90MEKnkcg1Fv6K/pMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY8STEvWESJL6R+IZR2kncoROIyeZwuhqMZrI/tTD6g=;
 b=DvxMqa6ky/3pUq90oK2DiodSMSDpFOBNr8Hud0cUPYfP5e0ME+bHEQxO9OZOY+VwaAm9GRu17/a+ALUJeco2rV+yI9s8P04FRjucQNXM9U32sxt8taoKD/6dQuVBCYMsKm6Y8q/d/qptu1MzRjFncJBdRiQiusaLwWNquuPSTllQgWkJBOH/bTzus9MOtKt0llNHS9oudKkzcHJhcwqTCUetCL5qVNklHRCFh0U8UZg1YXOQWWBdN0FLU8MeQixgX9g5+GucvKPcXJAinyibkGBPpOMSmhmDmWVi7+yrv4W8iB34fPlWDQL1DEWubutGzM4pzQGIulAGQ7trAq+TOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY8STEvWESJL6R+IZR2kncoROIyeZwuhqMZrI/tTD6g=;
 b=tTGVLE3zIikMPuFzmob+RTSVl7+xUexUu5KW2MThddtfPlqSVclx40zdI+OfheRdCEtKJlBg/hpZe/FNJd2G7XtbEauRyws1EpUYhczIWYycWdAPMWLrmrXOqd1xdPo5VPggukv6BoDyc7pOEYmP2AmEn2vuqPMTK4UumjSOElI=
Received: from SJ0PR05CA0180.namprd05.prod.outlook.com (2603:10b6:a03:339::35)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 18:43:45 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::67) by SJ0PR05CA0180.outlook.office365.com
 (2603:10b6:a03:339::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Mon, 1
 Jun 2026 18:43:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 18:43:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 13:43:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 11:43:43 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 13:43:43 -0500
From: Alex Deucher <alexander.deucher@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>, <Mario.Limonciello@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu firmware
Date: Mon, 1 Jun 2026 14:43:30 -0400
Message-ID: <20260601184330.3325262-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 047273e8-a3bb-4b51-d318-08dec00db5b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	SdeMi8OKf6pTsjc9XXUK+557sjnolpjTz7t/QUioFYlagaHQf4wk3/K7vTouPd73IMy1LrNF1M99+7+p2wP5Z+emwfh85tN488o6TpXRTcLQzC5MThVW44VUW4q9WAF2vM/q5kEOVcBsYXZJcvQ3GZqAnAPCHFtU0aSoGfhDFS9AiAAypRJ4k3/RxXM54EUWzGsasuil5M8V8qBOog8ojOYQmSZHUlL9zN2Ht9WvtS/1yOKSITA+VRf3Ou4l9wlSmA3BLzIXVOpUVyMjfp9WX0AWztdgFepywleIXm/P2sZsEFxxxoKsC7J3fsoARtTuG4li+UPVju46POZc7b9NrAI/ZrIO+zFk5jJlxwP7ttz/4Ql5cbkQTg/gJzaK+EoE9Dwyj4/2mVm00HAN6s7UoOlCgSbjEbSSVsV7CBgWk8rzh/DQ885Pt0Z71cBOe71G03M0tu+GocFmbuW9qk9efANtBd/sTWr6v1JM3VQGwHBLfSGnrgFIsdQQEhP/8mYwbAmMhUVQPCKQ3j1PwGGMhcPsa3zegtQMXtY79IeA75KiXnqecx96EPOezpCztLr/viMtrCmY28Zs0YubTwDp0P4yhZ4hLfb+kuxgJgxaYD54m+DR1Ls+QL4H8V+9Mmal+ZwhLTjxwoS0BS4rv68gBWgLmmJ1Pwic3wU1+1gYRABdN7Hndb8vLQjmJwqrikzdjuxJT/Mz6HJsrvqKKYQ5T1348RM6BV4gSieaJR6M3hw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2A73l7wrxmsnemiziI4uarx5uzZvzkSctmbKwz6A9DYsmSPFGMHeyg1mVcd5KEYBSs4gL3cqt9JrZcJxUbNjcoSMxvIIrULO2DKwKwkREsf715ORmVQYN0CH9vucddIXn6E8jogXhTvfBl5uYKeFUq2wgOugWTZ0+YrxK5yy/olwthlZD8NE8msQecqx3B+Y6y1m5rMkRkZ70Vkd7/4Bygg8e0zoSVaaTwh1/ERfrOGlXh2RUtLb7yv+bwAHt9M0Mv1ffhHz0Y7uqhC+Q6V3HzZ1KwGd8f2/xdeGfCZVIEfhiiGBwA9ULqVWS0noJr29wh3dhhLhfKtr48zujQGEkQBd3KhBbZlz6sNBUt/aUOoSdFOJ5wOZtpPgjBziya/m4tv7VbiwUT9kAOrnpwYBpTqZg0Zp89gCnaz1aI/H+Ab6jpHibKfrTjGZo+woB1hy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:43:44.7462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 047273e8-a3bb-4b51-d318-08dec00db5b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841

Hi,

amdgpu firmware update.  Revert some recent VCN firwmares to fix a regression.

The following changes since commit c8c796dcdd3b8d1ec71de2c7a71d3d7b1c8f7a68:

  amdgpu: DMCUB updates for various ASICs (2026-05-29 07:50:47 +0000)

are available in the Git repository at:

  https://gitlab.com/kernel-firmware/drm-firmware.git tags/amd-2026-06-01

for you to fetch changes up to 475f6f6d19ba253c5e03b8b51adf78bb704cddd8:

  amdgpu: revert yellow carp VCN firmware (2026-06-01 14:29:02 -0400)

----------------------------------------------------------------
amd-2026-06-01:

Revert certain VCN firmwares due to regressions.

----------------------------------------------------------------
Alex Deucher (6):
      amdgpu: revert beige_goby VCN firmware
      amdgpu: revert dimgrey cavefish VCN firmware
      amdgpu: revert navy flounder VCN firmware
      amdgpu: revert sienna cichlid VCN firmware
      amdgpu: revert vangogh VCN firmware
      amdgpu: revert yellow carp VCN firmware

 amdgpu/beige_goby_vcn.bin       | Bin 580240 -> 580112 bytes
 amdgpu/dimgrey_cavefish_vcn.bin | Bin 580240 -> 580112 bytes
 amdgpu/navy_flounder_vcn.bin    | Bin 580240 -> 580112 bytes
 amdgpu/sienna_cichlid_vcn.bin   | Bin 580240 -> 580112 bytes
 amdgpu/vangogh_vcn.bin          | Bin 572368 -> 572368 bytes
 amdgpu/yellow_carp_vcn.bin      | Bin 572496 -> 572368 bytes
 6 files changed, 0 insertions(+), 0 deletions(-)
