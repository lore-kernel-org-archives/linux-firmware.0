Return-Path: <SRS0=707g=B6=opensource.cirrus.com=prvs=55491174d8=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B757CFF495E
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Mar 2026 14:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8AE2BC19423; Mon, 30 Mar 2026 14:12:26 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CD6AC4CEF7
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 14:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6CD6AC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6pPAU3631092
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 09:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Af/tsqbi8ntRzoaE
	YKf0BJ9s6gJB43halABqUC0H1kg=; b=PUaryjVYQZW60YfPqaw8hwPrAXO/PSAJ
	Wq5bLY8peegidtAdDD/EWgB7TZizVpli8EUJKqZMxSGLLH7Z+326xG+tYlmCWllr
	ZL5F6LMfBTM7ZMsh+8EKqQXQ1S9D0wrzRKCr5k5q/Qa4XrKUjCO+qhECGW7qHSXK
	JtuT1SEzJk28jrSjOllKkd4w5/BWeMlhprD148vhtB/8LuKLav028QcPmEAymDFj
	+RQk0snq0qBBVESIs016BhnqvLKrgsh2XPDfqhVshyBT3270W9xEH5suby2VbqZP
	Bt3XJLu3+t3ubur0g07ZD3dX3glB22u+dkkEq6AXclfh4SP/QB/jrg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020087.outbound.protection.outlook.com [40.93.198.87])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d6bdh1x2g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 09:12:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQQln6XMdwoR7jHuqf10UkjR7TzFC2/7BeDH43zZp7yNX+N4fQ+XISjCBhJz0PG1YhUdHX9naU2DcG7BYfuSpwmLXAAfuGA6wMdJWpbWQZk0NRjtcUSjYGx878XTbV9t/OAZ0Xgs8879HymSNXTUIVy5lkeH0zPMNC1GYWofdR0rHI7qR6crirl6oehTYg3TNxbFglxK3d1MjMAhxpZDQpKbp2/riJZb9gg3MlslpBfnh6ffLcVOyptlkdQL1CSn6Di3vfEP7DdKFmKNqJAxxFIt5ub6gWFe2Or6zriXJMDjx27Gbto9qpBOF9Qp8aYWSGlWEN18hbyyDj/b9eXnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Af/tsqbi8ntRzoaEYKf0BJ9s6gJB43halABqUC0H1kg=;
 b=stf9/XjUCRNXLeuzMFsKn80eiBOLRDb4HZf+XHJs+9ZHnCOPGTF7+n3oZ5GYQSTJtPHSoOC63cBKiWw74BN1LpYnXvSYn0Q1k7nLcwYsufcjG2zz6KvuYnI77Wl6qY9HPaAVPjaJFToTjfISd//gmsUUX927m2Rg5iKzvMIP98P+u2qntY2n5JZ4SP3HuZeLfwWCQHGoBrWdIcZXciYXPrCOWCeMs1KngGTcOljGEpHknXY4whyoMPd+Ep7IiJRoE7dmkcXQ7fA6vjiF82cAld6pj0b1Jd0H1Jc+GLOP1xHIRQnL3mA+MqI8D/rP2Dhu3HwL3eiMnDPQVfKl+I5q6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af/tsqbi8ntRzoaEYKf0BJ9s6gJB43halABqUC0H1kg=;
 b=jfiaLF2k9nqKQG7ePn0Aif7C1C9lg7i2E6EA6s18K1tHILKcu8o3AQMfDvlQhxgQ5WUMC4++SoMpll+xiOKsXutflrP2iGP/mXxchvGPE6sruz3PMuQ9PVQZUlU5giWvNCbEf0LRZtu4SOHP+w2HujQf35Ye/mc6UUSUstaulqc=
Received: from SJ2PR07CA0013.namprd07.prod.outlook.com (2603:10b6:a03:505::15)
 by DS2PR19MB9267.namprd19.prod.outlook.com (2603:10b6:8:2d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 14:11:08 +0000
Received: from SJ5PEPF00000209.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::a3) by SJ2PR07CA0013.outlook.office365.com
 (2603:10b6:a03:505::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 14:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000209.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 30 Mar 2026 14:11:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F03C540654A;
	Mon, 30 Mar 2026 14:11:05 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 06407820247;
	Mon, 30 Mar 2026 14:11:06 +0000 (UTC)
Message-ID: <ac6be932-c320-4327-8922-194b6d55d47f@opensource.cirrus.com>
Date: Mon, 30 Mar 2026 15:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add Firmware for HP and ASUS Laptops
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000209:EE_|DS2PR19MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: 116937fe-695b-4ce0-7ebf-08de8e663027
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|13003099007|18002099003|16102099003|56012099003|4076005;
X-Microsoft-Antispam-Message-Info:
	+3QjP3ZR1kguUlyV462JbtotRgwNf5dLeYNOKLo8OH0j/GjY4tQ6CsqgE+xnuX5IsC42eWgPsEvMLGpCt6E0EQ4ps42cai55K5ujaxxGkkarPiVGuoRjhACK6wLyHw7fyEMEOENSWimkMklbjE6oseq3DZBOUTbvJWg4HPhAXOwi9OxPh8qicQloQ62o1gAm3kc/MwWKaTPvmjpuAV8oxUxpi/MckWGonqKYJNWJ/FzQGUl7yw97zai2TjrYnuf/Ve7I5HqFsk16OuuSoFm9S2vRR0sy95lC+Vg7yZ7tLR+QRWjMXRUbrCvakSA8sOBDOZ4WC3s3gf9zVHRDpkDgitxeZm0tNVdWrAtrJQkTdJfaIOH3XLSkrKuFhPuYlCBsq0qlcFqc4T3w1VTgf+mnMmlDcOzNVh21YwuDAxjrqVNf9+5iJVKla9fP3zHILQ8macEIQRPCwd2UrdElu6GxHzhjV3E+RIYe5hfEUNq9HpW4yYfw/K23psrjgpgpvCmleHy7Ez+CYaUwzkTPdHahxW1yoaYjgmlf9Rqdez47NW5aiYmXImdFglYaIZUk4b9/41fnTV5txKfWgEJFBwTgKqn+JgCvRlZwxbpCn53NsOp1cuyl58uBTaNIRRA2F7tbKbCFq2lcxUWjqI1+wBAwvUAbfWpXNs5lrRW1y+tKcGxOBKiYqUzXhYtKVW/sZMBlem6YIp24r4X+/iGeWIgbH4narIV0FBX10ss0PXCIfwl2KPoRalAbdP5UG0/I6q+79crna4x8nwymOAUfuiaf3iWVj098pTH6n8Rl7Ma0D/8x9M6FUJyjkMsIe6J36BZjnN0g/a0aCxCGviHIiaMkHw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(13003099007)(18002099003)(16102099003)(56012099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	funSuyKN/inTfX4AZJHEwvZvRlWz5/EbJugQAp/ze7D5yoMJCUsHovtvXbOaLzMtdS2BKhvQ18PX+9hFqaQApfM/UDOXIDhR+soGSLsoG7jP/2L0od44pyS/KPHOccPXuABJXWj25hLza+NGyjy49c1BHQaRwGoBRmzL8//G2eN5ihoKl2lIFKKjXuxGYjFFDOIe1m0+zwIvWjnXN2oPOdhiQTUUTruDBWex9q1t90WGFbpSSJLSiYLUXPOpjxtSLyeX1VdDfxJ8h0vZM2iphTm0IxQKF8aU0xB9VGBjOEoW7EvYjBmry+iXne6wt+zTP+oK0muE4iWlGLoRTzAr/li+mysVzGf9HfiL979R6a1LwUFbkNzVfTZlua4crIYnHmwxkkjGtcHB/U88D9zLTUvIGapxgT7ylw9GWUJqakHA6hlvnV2JR4Lz6oFK+X0U
X-Exchange-RoutingPolicyChecked:
	CjDjC6q7S/T5GK5SU5EHCPk8609EAoIGkHoPd85407xcLCK03rCYotzUXokHaYeQt3gAxKjVBgNW5KtZA9CNUmS2EP9QOrtuYu6OY54Z5xH/t+rSY+bA0guJQnF1slel9jGAOfWwyz9RHAeT8tw4NNAxR2qjAvZLqnIrn0N+9S2ljJFnSnbmVMwX79HSTq9fUbdRsytpnoozgkxHjSZaAijk0D1vIJa9CkYNbcAuy7SeveyFVu6cPCdhOCpU9Y9RyxuztErL4IUopvvXeJdn94Oonkl+I3Bfc7Erp/22OvZCvc/4x2OCA/TEubUq1U0TSZ4XB04D2+BekTJ9tf2WeA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:11:07.5602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 116937fe-695b-4ce0-7ebf-08de8e663027
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9267
X-Proofpoint-GUID: 4ysQFkXBUGT6Hk-iCwLo78Dp2tOjAGj5
X-Proofpoint-ORIG-GUID: 4ysQFkXBUGT6Hk-iCwLo78Dp2tOjAGj5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExMSBTYWx0ZWRfX+altc0V0Vnox
 w4sX5CocalcSfx12y144fFK8cQSccirszqNUwdhcGBOl1TQx3HpeKElpaiJGMskE83GxH7ECGFt
 W4XUhdYmTviq6Az5IG+4VRYP3olZ5R0D960VmTdIt03206QtcWExoBCU7gW9IDYEgL5uS8jClgk
 xWRddiw2K2JKupy7GmTaEjL9I9sdF9TWpk9DyJ1oAFWom6YLOdPvkHbG9khlQ5y/wetrKukW/hn
 d2FJWT+Gh55Vv+NsrBRBLOEm3FyFAD4CqJerrXoyGnByxU0lUbor1IUpj+zUxP+/cL1WZndPY3d
 UFP6v+Dq9oEraqrHZyLpQgLarbGIxCvCdcCkfKg12l0TAyEwTvitfGuQBh6chp4DOYthhMvo1CH
 +CQn1CNuCAoROtGJyiqoF85JOkabJS+xiI4S+Ax4X0AI56b3bqYGJ+6Hwu39ZUpo1nYyQFVtWos
 35XZziVeeRkX4h7hGig==
X-Authority-Analysis: v=2.4 cv=GK0F0+NK c=1 sm=1 tr=0 ts=69ca84c8 cx=c_pps
 a=Gy9E0H4ZmoUkNlDDtfVv6g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NEAV23lmAAAA:8 a=3VFD0hcKuG1hwyFTjhYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

We would like to update firmware files for Cirrus Logic Smart Amp CS35L41 various HP and ASUS laptops.

Thanks,

Stefan Binding

The following changes since commit e09aaf21f9183cce4baeffacfdb1dd9de0ff733d:

  Merge branch 'robot/pr-0-1774868898' into 'main' (2026-03-30 13:36:35 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20260330

for you to fetch changes up to ddf93e3a0384ccab84babab89918c43dbe23fbd8:

  cirrus: cs35l41: Add support for new HP laptops (2026-03-30 15:03:38 +0100)

----------------------------------------------------------------
Stefan Binding (3):
      cirrus: cs35l41: Add support for ASUS GZ302EAC and add 15.5dB bincfg
      cirrus: cs35l41: Add support for new ASUS laptops
      cirrus: cs35l41: Add support for new HP laptops

 WHENCE                                            |  40 ++++++++++++++++++++++++++++++++++++++++
 cirrus/cs35l41/bincfgs/cs35l41-dsp1-15_5dB.bincfg | Bin 0 -> 32 bytes
 2 files changed, 40 insertions(+)
 create mode 100644 cirrus/cs35l41/bincfgs/cs35l41-dsp1-15_5dB.bincfg

