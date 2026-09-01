Return-Path: <SRS0=wrZL=GZ=opensource.cirrus.com=prvs=0704dfa9da=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F553C624D3
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Sep 2026 15:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 028C81F000E9; Tue,  1 Sep 2026 15:55:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788278110;
	b=jEt2KFz27L0cdeIcQ5kE0j4IP7sg6HfqHtZOROLbYKFt4r+t/05EcFjlWASDbUjvIp3x
	 Gcj+aJdxgMiGCvWlFECFaY5jXlx2+TKioGzT/Tz1qL5fbaKxaqF8+XvaFFWzmxGQpA/8F
	 xcYrOWWW4eSwSus1MknvDiZHmKiuskChBNcQeXcZ3S+QphsoOp3jVptSiP/s29wFJkGOZ
	 RlEd3obSIZZt6HhNd3mvyY0lm80KRDfiaktxXEJQhOLNMTF84gel8heU45U9jkJJnuvPy
	 oXK7serJnXvrATV4NbP7zBYUYgoltEBa99PC5jUUQVcR1I7y03QKsWCnyeWUa5XZTbg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788278110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=pMTVw3gKs28zVJDVZFDs3Vy4cHvx0c0AX+FEHe9NqM4=;
	b=EHBfbHPWCn6iLK/eq7T9/fC5sFK/mmNysvA7AMuR72gCDZM9KyYVs5s7Vs2g/r/zbozJ
	 oO43woiU9l5EOR9hp605aVA7DSNFoHPICDRKQ8Unhl7S3yO9PKTnRE2UXBhjWBD0uH0US
	 8Jr38AG3pxUpZ3x2SlGml7wi9aaGs+SjE/v1VRvgjQY3iGEd0vMb6AhXNm8dKiNpLonFI
	 k+OxoAF1RFDzv1J/+qN8iSjzFwwPyfZI4uk529A3eFu/6ctlMhtjrVx/3CVH3JE2QPv8N
	 iXw3C8haSWzpobNhsFGKPk9fbDQwCzwwr6uzryBtRgD1VVQlJFYidA6XJsCwk4vRLog==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TkCJRbUi;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=YTXKIKad;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 408741F00A3A
	for <linux-firmware@kernel.org>; Tue,  1 Sep 2026 15:55:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=TkCJRbUi;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=YTXKIKad
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 408741F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681EMbJC3139177
	for <linux-firmware@kernel.org>; Tue, 1 Sep 2026 10:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=pMTVw3gKs28zVJDV
	ZFDs3Vy4cHvx0c0AX+FEHe9NqM4=; b=TkCJRbUizeLxA0LpRzCQrX++n9bmLYHh
	+kO13YQLWTzqTQk1XMA2rFGEtr2xXWSOjC9YxbjYewYABvYWFrMbAu6na9nynrme
	n/hPlLxMANzNhG7ohNjUSCWglkbi2NccAdnDPvFuWPM6biwWe79ocwkvr3yOqXJW
	0w3sGRUj80x8bkKMH+Bdmp4T2mxSbTEA5OM7K42KIH1MuVZc0dTmadG14Ip76XIX
	T36ERUOLGZPXSMLeSzyu0pUrJDncPhpRRttMpuzvYZt1UInHQVDiJhm5vN4QhI1y
	gpvxFcUZwwvpU167CC6IwMfaiK5d4rHwro0Eo5k2TkOjm5K6ui/gHg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022081.outbound.protection.outlook.com [40.93.195.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gduntgn23-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 10:55:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/nBxUUWg0Zy+3sQ71HVcVt0hUCbYDoahYMmpF6hQvjS3Bj+tzMiezCirwXdNgbgMQ3MLcnnkiKWFBdRFojDPbURkO69Kkxv4hZofWrYGNXKNo9GhAhyoKgpkcZwm2E6YS1wUPG0b21OnDljFqxWsmPwgS1EKjR00YjKJtagLTrsREJceL6KVUEgfnmZVMUdGT5UEBgtqz7SJJ12BcVmRV62IwRzUHOPWVWZRbLIzh9ANq+z3NSXmDz4+OvsQXk79eKI29BUqcpOA4Wu8hBIkxRWmhExUgrQx60KO5RtKefCFfr/ea9VtxC65cXo7UUeCym0PT7t+BC/5bs1exNwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMTVw3gKs28zVJDVZFDs3Vy4cHvx0c0AX+FEHe9NqM4=;
 b=hnI3S/BfcUTo3iU84MELamaTfKpDGz3FWSBT3+hKsDoYwYi4nrteZlboREfmK7Sx+N2S05AfDhDMDg6a30ESOfvLM7xtGyp31OtOXSKe6NJmFrtxz/q167kXnSH9k2ZpYyiynjdPxXsOu5JcaOaQlr58t8cq44Jm4NAV5X75JPwjPOtm06pP/cpNP9MHL05zQTxQbvgbyQ4WU27LRyS8yTe3K69/8sKDz0lTezsMr5x1yx0WK7qyQ1pbGseTIcsavAgT5dwSntZoX09V9j/7oJh8kzvD4rbymhIZK365EY9n1qCqMOOYu6hJsqDPql9LJSxpTAOUTEveY05lb0+a3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMTVw3gKs28zVJDVZFDs3Vy4cHvx0c0AX+FEHe9NqM4=;
 b=YTXKIKadV2cmjzcJeLr14tJAm6uXOwynxOpy1Lme87KMcvr0xYs6/sE+UYiAtK0AahCaFRnSOVNoeetJlCsETXAYNPdDtsUqSJEMRmlixrCNVKJPniNgpbh4bi9WTK99m6QipiKTdG2whs8ZhdUUGAi0whB+IOfjKUNcTuhWM9o=
Received: from CH0PR03CA0214.namprd03.prod.outlook.com (2603:10b6:610:e7::9)
 by DS1PR19MB8608.namprd19.prod.outlook.com (2603:10b6:8:1e4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:55:06 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::3d) by CH0PR03CA0214.outlook.office365.com
 (2603:10b6:610:e7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 15:55:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 15:55:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7C399406547;
	Tue,  1 Sep 2026 15:55:04 +0000 (UTC)
Received: from [198.61.68.151] (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6000482024C;
	Tue,  1 Sep 2026 15:55:04 +0000 (UTC)
Message-ID: <8e8bb6c9-c6c2-4682-ad6f-6d4f5d41ae38@opensource.cirrus.com>
Date: Tue, 1 Sep 2026 16:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add Firmware for ASUS Zenbook UM3405GA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|DS1PR19MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c65e9c9-b5a1-4356-7828-08df0841642c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|36860700016|23010399003|61400799027|376014|10067099003|11063799006|56012099006|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zNT2L5KGOrwGQc8ZH/6BUOaR11GCw2x2JFESAsgsTZjeKP4P0qgP9j1uMy0N8L4wT2DDwQKz+dFd/eEmzMYvWF6U4I8mJvWcVZdZ9Ajq4X8yW7t+hrRKnpBfKJTKjXwreVbkstjM0sJwajU0AOpQwMkv0pgtDfKnS7Ul6XqmKsYWCBT8Rq70ne30e2U/UYjeuUJA85lm9INYQ1Dr4ZPTtXpOPSfA290pVq5DbnEDBkNUBc/7tGRSCy3vjw0vjC2oZUhUf4uBNyKfeObL0lFczqlRnImV7LPsA63FRossNUKe+YqQGpY9L9nfwk+8GZsmZR7/q7Zfe1awSuN2Gys4ZuLTfL5rv95uHJGkiAxNodXA9wdXc/EIpwBxsITXHL4IMPMefX+iHZET9mLiXIAXEuXWr5KkDuEBRCZ4VvZpdN74TmWbGnCpDtgoIWD6+VQrJuFDCRcgIwSa4NtScOgHSF7eQc0ffmQw/Dy7XY6h/yluLoLCPoyzM/QhCzuGr4ZiAhGp97Fo6eEflovdpBto3ymlzgy8EehAEShxzKcFPV8IiRrLlJih4A/brumyec3i2tHJE1S43c+md6rHOYAJcFuMJd2zzha9n1V/HMGvEOJEP1HDk/sxla2sPwzyOFqTlIQSgxOAA/jDDSYU+KE0OA8Ef06SXFuvM8gdrOFaV/FfXtNflLssJc/VR1jEBQoUM+vwlamfMIcbvfRWDa9Ckw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700016)(23010399003)(61400799027)(376014)(10067099003)(11063799006)(56012099006)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gkL8obvOIuyjb9PON6O9k71m8Drpo5PBAy2ZJgaupJbvnk8aZDyTEbxpKUluKqGvWWMuGxTt03RGmkBJJeI/8STgObJvdi0+DzarpJLK7s4SrcxFDO+Ylur/1CzYKXspv2pHa9NcwFH6aDpZraGXW/1yFO7+CFdq3JUSNzAxwSpJuJ+oxywEUW9FwzHbHlxS1OB97brWtsXG+/Fp3z2YMYPXiVypaAFzEB1ywn6x7EaLXK58sUgbCRivlg6Qpzz6rgf6PYtF4HcTiPIDWDPjVReQEH7bDmlfvQleVefDe0lRsAtPvFVS8OPsUYfqQheq9JVaslvG52DhEtfyEzpASHgz9lUjMUCbkJptaJyZKxeb0QZH2jOAqlB/k/9FItNGYwLClKLF9CB2Y2EFelEDgBtGHl1LLmin+wWcNLX1PSTG2GAqkZF9EevNQX2yypk4
X-Exchange-RoutingPolicyChecked:
	XhfHd/W3uvjwkl0xWMSrr9V4fPwQzUfEh7RIzH84Rt0iZipG+8LwkzUBfHpp5ex1cBDFuymAwq2qPfMhF9YJ3ak2eR0jAjdMjIT0woXCGjN5w5zVQCNWrgqGZ2+bFkAyFgo73cOV/m2vDFnfBivfT7dvSTf+CpK/tTdLz5Hztnlnf5WiJrf4H+GkKxhGtS3eoAnGpXTkhrBjyb2kgtAtuIifmAYzs+hcdXvz1ljMQznIFZhbBY0S0IzzY3gys0HYR5xWrejD0LgptUdiLmLmYSKL3AIbIpNXNbM5bO+7TWkYgzylZTXaRaJyAEVRVLAepCKXkO4KhIvDdwWPgt7V/g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:55:05.4117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c65e9c9-b5a1-4356-7828-08df0841642c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8608
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX0bIIRKVFq37n
 vQo86/VMFgiRvaT79aP5my5VW9Fw2jqS/Fr5gATYyLNAgqwEMCd/PFqvxJRLkIMsN92Z1PuVlFu
 bcJngvKdNZUhpwx4jnWjX2EBu00jZqYlk6velvLx6Ap8Db+Lz/L05q4k+hvaMjrnPoZuLrelVsE
 A6FzmKiamzmZMwCz3Alo67ZFltWMQQXjrFDW00SOsrGryQ+P2ZhVe2okY7l92lpJbWN5v7JHc+I
 HBpWhLLqvupZ5ma8zMpKS1/zrIx2jQsGO63uU5PRBBakRqH4D2X/3y8MCRI3pmfLhcRHu0pSaUh
 SHLXeDZgx9kOf+tEslg92AGT3jQERcLS5+UcOIOgE4AfZMJs5JDdG+l+5hWtNB82qSAeos0Nj7W
 MqjDKaVKBZkUZwt95xhFjKik/RtXB8Ow2KqzMmTgaJnwPtUoLXYPa5tfKBeUiSmDjcoT95tbsd7
 sUWToI7fFDlaebDyPEg==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a96f55d cx=c_pps
 a=kzlga8Pj6Xs+ezKxcisf3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NEAV23lmAAAA:8 a=Hr1OGZq6mH_zsyXcZGsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXythwjVWA12oM
 PYOQiRyCPCpcyr7sTtR3a0wpsPCpLk3GzGXOPNypQGqOQ8skHXGQVJoY8qvUnJhgEQNF9E7oSBa
 7SW8lsstQaB+g4tisg8KpORRQ1Cj4bA=
X-Proofpoint-ORIG-GUID: ILlGjspiiGHUWpwC4kUUaJk4MYkqwcRN
X-Proofpoint-GUID: ILlGjspiiGHUWpwC4kUUaJk4MYkqwcRN
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files for Cirrus Logic Smart Amp CS35L41 for an ASUS Zenbook laptop.

Thanks,

Stefan Binding

The following changes since commit 63fa520f8f7ee44c8ef397d9d6669a835fbe6f34:

  Merge branch 'ath-20260831' into 'main' (2026-09-01 12:23:15 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20260901

for you to fetch changes up to 0f386a489272e0aba3675ed54380b8db4b8d70b3:

  cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA (2026-09-01 16:51:21 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA

 WHENCE | 5 +++++
 1 file changed, 5 insertions(+)

