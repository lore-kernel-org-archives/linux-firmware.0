Return-Path: <SRS0=YL8M=GP=ti.com=shenghao-ding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CE0C5DF97
	for <linux-firmware@archiver.kernel.org>; Sat, 22 Aug 2026 02:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A7B91F000E9; Sat, 22 Aug 2026 02:51:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787367089;
	b=uPVzoyOUHGC8DIhVgfjBFv9EUfKuGixHROUPP3r7zR+OWHcC4G0JgFIAM82+YzYDEU4c
	 JBkv3K0sHQK/UBhmFeoo6ekfbba28U7WVu3YOLBMkH+YcPaAv/ZA3SxWe69C0P6ZkT3Li
	 ZmrHJpneZmRMrIHqGMql+9jU8T1aE6+yZWzpz8wmcNbb9Ph/VOGPyotM5HbynWCdx8ISI
	 d/0KwsG0lQi2SKngJZDMODryO9ZUzVX0uFWkVq8qN4L6zTR9hZ1i6tEaJP1D+jOK9Byw0
	 WzqT8aP4WKrOxEwo364wL5exf0g1unIiIMKN6pYtXLbRHlV19E9xBVZwxgbRgoqGBIg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787367089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:List-Id:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
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
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x3Q23OWchotKn9qBOz17v1U5KzQCbksjspN64AQHRW4=;
	b=13OcofV1TgAecKN8lIhiRJqNQC863vdAzsgq1+MAyY8LkLSPHjF+D+INGJRlPzCJmPa1
	 56F7vgONtAuHku3/lFikT60E6YyO4+KPY0ibN6yHsxM5zyHOjGJkd3+wwWKlhrNvPkeig
	 z5BkgbHH3akjBJUj7PbdFfvLXizYRnFRXOyLDhaJAOYdQaOyuDVu/RiCiKn8txfcccrzQ
	 mMnsZ6EZ7NQTr3dBG/IZ46jvQ8k0e3AL1M2lqcit/dsnRxsEYkn93fZSJo04lwoOZsIim
	 tLnv2eiuMcGldYVlYgK/dzOorC0dIcskwYYTCRyoMEco7VDKHQdefVk7eV6b1KuyTYQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NI58kPfO;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=evS8kUr1;
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81F321F00A3A
	for <linux-firmware@kernel.org>; Sat, 22 Aug 2026 02:51:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NI58kPfO;
	dkim=pass (1024-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=evS8kUr1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 81F321F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67M15pl6843080;
	Fri, 21 Aug 2026 21:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=x3Q23OWchotKn9qBOz17v1U5KzQCbksjspN64AQHR
	W4=; b=NI58kPfOXDmrBXveDdn9vlmzAKc/2Q5ja3kMflW3LTneAZ3KpN9fxQ/Nt
	8GFFy0eoBW926LTXDRQEqO8bKKbiTbaID3joDQtjFpttitYOLe0+0PKtxs3ux0cP
	a9bvXiAujk/5IoDAK/+crSpkS002clWce/J0NpaTIoAITQ+GEf5cYlEyWU2g0H8u
	Vw3da9kmCV3t4DCrjuTkVn0YmdR3DmHVD6sjETCIArAW2Z8UDcWHPVNtHAPbcggj
	OZMYInXDqHlk9Wwq2P4OljG0Zidhl50hUobA7/SP1N75tBwGRrjyydqxomrE4rt9
	Pa1jEF+iftFsTgSxQzOpEEif+K1+w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010009.outbound.protection.outlook.com [52.101.85.9])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g6hfk58pc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 21:51:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNmPMYdHYpRe5HQD3pt0+jssZ7F9Hjw9v8Xb7UTaWfiymzHLsnpuKcmsl9f+gWijuM8dvt74sfO5KIDuXi/vMcBWIIPVxAwxgz48juqX8Ywt65z3sp13VxEmwZzmWXVw+3IzoSc4caCNxRcG/9ZeAVkz0LPsLyQEmXpIRnVxuSjdaEW6kAPlnSvt+MUKky8UADLGyIwstVXcYn+h1JzMQDoA6s9MORI15REl12URzN7WZ1WHwtlf3omN+8bo8e365BvK7YonhN8H+1paciB+ykjUw8GDbDKj1f3qZfaR0ChshCmXHfld7T21gIPDDHJ/+GipW4nnhQXgjFyMX17uog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3Q23OWchotKn9qBOz17v1U5KzQCbksjspN64AQHRW4=;
 b=xJwVo9f2v2B1BNYnib4MgIg+JmJ6tRuzhUct5IpRefEVHdfNNdTS1fLEyL6SCn1QK8RdoaP/LCHqHcjEFaDljLrdSKplunXUyZi0BmmjQa4rCszDDPD5WGd0eRItqRKk0Q7t/kmTwfzWulvIzscaPYIZkEm9VhcOMnthLlEgo2MR81824ppoZBXZTRQEBpux78R76IbGbMIjPs+YoMse5q9Kfv/syukgB1Lha9zK++YHF/mjodJM2euttINwe24arzA/zcP27gUFlP06Kga2EOFRHUJsArkeoTCCdb5BO8CK0v/yoh6YuTriybi9K/uf1jsyklpmOP8zdsChcPPqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=qti.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3Q23OWchotKn9qBOz17v1U5KzQCbksjspN64AQHRW4=;
 b=evS8kUr1Ivja1xUtSoVG9m39tETEA8zc+nMRqxJlWQ6qDpjJDeHXixishWQm+0UkTyTUbdGMbmMl1vXcz2R5x0dQhNkLzz2SnGDTlHDI2DckakeGct4Az8aUp/9l0Q7XxUdKNM5d4xs3sTusZYflr/QtoZ++sbsXWf5Xg5fMlpE=
Received: from SJ0PR13CA0120.namprd13.prod.outlook.com (2603:10b6:a03:2c5::35)
 by CY8PR10MB7339.namprd10.prod.outlook.com (2603:10b6:930:7a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 02:51:17 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::5) by SJ0PR13CA0120.outlook.office365.com
 (2603:10b6:a03:2c5::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.4 via Frontend Transport; Sat, 22
 Aug 2026 02:51:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Sat, 22 Aug 2026 02:51:17 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 21:51:16 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 21:51:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 21:51:16 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.224])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67M2pATj018077;
	Fri, 21 Aug 2026 21:51:13 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <k-lu@ti.com>, <baojun.xu@ti.com>, <13916275206@139.com>,
        <mengw@qti.qualcomm.com>, <honglan@qti.qualcomm.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>
Subject: [PATCH v1 1/1] linux-firmware: Upload firmware for tas2573 stereo
Date: Sat, 22 Aug 2026 10:51:06 +0800
Message-ID: <20260822025106.211-2-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260822025106.211-1-shenghao-ding@ti.com>
References: <20260822025106.211-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|CY8PR10MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: f0e8035e-1bee-404c-0724-08defff83ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|3023799007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zWKDR8W1rh2vIrJc1EhZqhsVdLG6UyLgI/4bh61snpjfuiMvvqfGGFPUQcPQcdEPeYvFylQ7eJ0T4D9c1mAm2nQQ9xkj8kTr4PvsSNSPiRCc7lEppQ8Q1ApY43JMN8TuJQsVJrcg4OsBiMljbJMiAzzFnFMpFt2P2crHDXlQT6/MvrVctymEIYKpWQaUXTTql/jg4pgAC6gLnQkCjYsHLDygtz0ygzNcfYWGJWXxKMy0ZdJu/yUzvdc4T9Bv9RWnHJvt+wgo+InSWdS1v8wiJLlS7qliaUDxZ23ZnFCBxlqVIUExgv1/K9slLYriF93CdEP6m99bOFbhmLiCQEn5PSzBUqn1W9vJsBlpolKMYhDTNOenv+H/1mZQtEer3YDQHl8qiZ8FiERNOQc14S5T1jQxIW+jNMde+O1PUBExE28LzahYTleI97nu+H0MfK1jRQo3PX+FSabUfbCaYgl5D9TZNSWoACDfzp0PWidyUJLPWpUqPCHoi1GvI6Qcyl4X/l8W4Y1OMU1/LYI5Aeke5I4+v1Gzl21qz/Jl1drL2KX3eLnU56G5fN/XRYgljPgx8kqOGY2XyEq1pMD6WUjf1p3zOQTywq35hOR+9JUsqDibphVxTDhuJebEGcUlTd9laswIrW7pgXtZUeSpAygv9m8z6+H5ueGNxFhDJ/LbCfc3nUHiaP0nzcR0bMrj9Ez1o1WnfHZGtcbbX/FWrJoVBw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(3023799007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7e4qvaSJSMXXVzHqTpwhdnySQOeV0UN17QRcPzDOC/unNpAKGkItrzyBfWeBl1b/+8nw+hi3OgxsX3q08Zen2JWJhPuual/5sfEZ6RopZf2C2OvhcCOjFneLVJabi5KtprQm0EPaP7746zRGBdxTcP9lyHEi+QWA9IST8CLhrHdJxrs9lx4gCmzR4PugzFr0dtBV7ORTrbxOvNMVAGBj9PJN2IEiHM+2ULHaXUdap8pMGH0r2MWqDSQg7RnXtEe+4IDQnxP09oqCskG6PoTIn9cEL/o05Uun5Zof/r7635IB9zjGVzGktpFbeq4uDDkm0BycZ/dTJhFsplXZx0AqBotCn79ZPmwrBAe5iI4hJsVtgenrqKIxGcTGk3uLx7TCgPgVvmoOWPNkzq+oNPZ1tMja3ZG2TF77H/3KgvlER1NQpJS4V0efZw/qY6T0eDtt
X-Exchange-RoutingPolicyChecked:
	HpwMD528fpC2hIaZHZClwiMv5KCMnSLQNF16EAPIZIIXeEq0K2BOEUrg2XJEejgRm6vyVOsi7z9P7VJ5xKA8nILhNJMhibbcmjV9I/LXHpLkyU7+WGqIn/791lrY8OEMiHGimTMaSPWn9DpEUIyBNGUWs3XS/vzqOltIbzLwE8MYSN4oL7WSwkPaV0r+9KORGSg2e3OYlogn71KIeKYaau2/JLY+1ATGTA9LKW4EQWii7oesBEvtyNxpBJrn21W8W69TilOeuap5Ug4z345fi2Rb/r4dM81Y7nP/ZE/K4S5O4xfnXe+nUICWWDTSZcUr+kYNT4MefNd7nXc2ed3UhQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 02:51:17.0396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e8035e-1bee-404c-0724-08defff83ce3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7339
X-Authority-Analysis: v=2.4 cv=O7AJeh9W c=1 sm=1 tr=0 ts=6a890ea8 cx=c_pps
 a=A+iiJIZ7q7LOtbDGyL1ITQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=OMgrei5yJYCQXTibcoQA:9
X-Proofpoint-ORIG-GUID: mFkQyldLfNuLqHIGyMUJ8hbQvN0ssrwE
X-Proofpoint-GUID: mFkQyldLfNuLqHIGyMUJ8hbQvN0ssrwE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDAyMSBTYWx0ZWRfXz9mB9Xv9h7he
 DmrrYM2Mg34aF4P/lc2J5wJ6mA1m75hB9A8fFTv0vDiEPg+4n0CZWJzakv6uH5YbCFs7X9wLHBq
 4nQs150yfduDeA9GBapvleVaa4pEIdk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDAyMSBTYWx0ZWRfXyYHUDg2ZK8rv
 vgcyb51Y3A7XdlGkoxZHkhW6TSHRXyqiZoxgn5qiuciLxJo273Z6+uWHPRumK1jJEUo+mLqadxA
 lddaWWE+01yBQ2Czr1aMSDygiY7zaIiNrpHeeZD9zg9VJ/RRUCP/Oz1YkScpy42xpIRaLUsv6Qo
 CxUmFeg1LtwXSrApSO5qwaVQuQkoV9VnpZUFKxFIIUJ8iKUX/vrVJy888Phjr9H6dDyiI7ZLfdw
 KUnstyU51zyWD/pGHN0VgUF5ImmE02q5LyWMTt9NHRedv0SQ2sjmtKnrFQS0l9Gpt1FShSdSKQV
 0SrKoBif3QJAgkijrrlh6WTfGxquTbyjUdN/7vMDZDDrsOYOWoFO9K5eTf2ofBgrtfFUIDedlLr
 qgRO90Q/4KLuHWADQ3Yy/foHR8bO5v+WlfRmalbz/YG92f5Ka7Lsx1BBgTZVM/30i5Unzhrx0d8
 EZKiBd930rUzdJs5J/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220021

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 WHENCE                                |  29 ++++++++++++++++++++------
 ti/audio/tas257x/tas2573-2amp-reg.bin | Bin 0 -> 928 bytes
 2 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 ti/audio/tas257x/tas2573-2amp-reg.bin

diff --git a/WHENCE b/WHENCE
index bbd31dad..66c10e30 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9792,12 +9792,30 @@ Licence: Redistributable. See LICENCE.linaro for details
 Originates from https://github.com/linux-msm/audioreach-topology.git
 
 --------------------------------------------------------------------------
-Driver: ti-tas2781 - tas2781 firmware
+
+Driver: ti-tas257x - tas257x firmware
+
+File: ti/audio/tas257x/tas2573-2amp-reg.bin
 File: ti/audio/tas257x/tas2572-1-1amp-reg.bin
 File: ti/audio/tas257x/tas2572-2-1amp-reg.bin
 File: ti/audio/tas257x/tas2572-3-1amp-reg.bin
 File: ti/audio/tas257x/tas2572-3amp-reg.bin
 File: ti/audio/tas257x/tas257x-1amp-reg.bin
+
+Link: tas2573-2amp-reg.bin -> ti/audio/tas257x/tas2573-2amp-reg.bin
+Link: tas2572-1-1amp-reg.bin -> ti/audio/tas257x/tas2572-1-1amp-reg.bin
+Link: tas2572-2-1amp-reg.bin -> ti/audio/tas257x/tas2572-2-1amp-reg.bin
+Link: tas2572-3-1amp-reg.bin -> ti/audio/tas257x/tas2572-3-1amp-reg.bin
+Link: tas2572-3amp-reg.bin -> ti/audio/tas257x/tas2572-3amp-reg.bin
+Link: tas257x-1amp-reg.bin -> ti/audio/tas257x/tas257x-1amp-reg.bin
+
+Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
+	 Copyright (C) 2023 - 2026 Texas Instruments
+
+--------------------------------------------------------------------------
+
+Driver: ti-tas2781 - tas2781 firmware
+
 File: ti/audio/tas2781/TAS2XXX0C94.bin
 File: ti/audio/tas2781/TAS2XXX0C95.bin
 File: ti/audio/tas2781/TAS2XXX0C96.bin
@@ -9891,11 +9909,7 @@ File: ti/audio/tas2781/TXNW2781RCA0.bin
 File: ti/audio/tas2781/TXNW2781RCA1.bin
 File: ti/audio/tas2781/TIAS2781RCA2.bin
 File: ti/audio/tas2781/TIAS2781RCA4.bin
-Link: tas2572-1-1amp-reg.bin -> ti/audio/tas257x/tas2572-1-1amp-reg.bin
-Link: tas2572-2-1amp-reg.bin -> ti/audio/tas257x/tas2572-2-1amp-reg.bin
-Link: tas2572-3-1amp-reg.bin -> ti/audio/tas257x/tas2572-3-1amp-reg.bin
-Link: tas2572-3amp-reg.bin -> ti/audio/tas257x/tas2572-3amp-reg.bin
-Link: tas257x-1amp-reg.bin -> ti/audio/tas257x/tas257x-1amp-reg.bin
+
 Link: TAS2XXX0C94.bin -> ti/audio/tas2781/TAS2XXX0C94.bin
 Link: TAS2XXX0C95.bin -> ti/audio/tas2781/TAS2XXX0C95.bin
 Link: TAS2XXX0C96.bin -> ti/audio/tas2781/TAS2XXX0C96.bin
@@ -10423,14 +10437,17 @@ Link: 9028-3-0x9.bin -> ti/audio/tas2783/9028-3-0x9.bin
 Link: 9028-3-0xA.bin -> ti/audio/tas2783/9028-3-0xA.bin
 Link: 9029-2-0xC.bin -> ti/audio/tas2783/9029-2-0xC.bin
 Link: 9029-3-0x9.bin -> ti/audio/tas2783/9029-3-0x9.bin
+
 Licence: Redistributable. LICENCE.ti-tspa for details. Marked:
 	 Copyright (C) 2026 Texas Instruments
 
 --------------------------------------------------------------------------
 
 Driver: ti-tas2563 - tas2563 firmware
+
 File: ti/audio/tas2563/TAS2XXX3870.bin
 File: ti/audio/tas2563/INT8866RCA2.bin
+
 Link: TAS2XXX3870.bin -> ti/audio/tas2563/TAS2XXX3870.bin
 Link: INT8866RCA2.bin -> ti/audio/tas2563/INT8866RCA2.bin
 
diff --git a/ti/audio/tas257x/tas2573-2amp-reg.bin b/ti/audio/tas257x/tas2573-2amp-reg.bin
new file mode 100644
index 0000000000000000000000000000000000000000..50d5f5190d2f6f07bf71be81f6d4487d91433b8c
GIT binary patch
literal 928
zcmd^-F$%&!5JmsaMp3~CF{PcoX9yxzf}jUT6*VFeB!ynW$^%$>4G&=}cmdDgA22Bv
zY?9ImpKNw#GH*T$*z5Uye*mUIne99Z4ItK{2#<>kb)&9d@%2BEW@%n?S}~q^^B)7s
z@M!{m1av1rkN&nhK)}6zAf7ood1K~H-MnR<9Fl!Jix<qU7M4s;mMW8wNjbReMr32p
zk?!yo2w;uRgBGRidOd`k0l(c^&f}AHBt`8kS>^FO+ntzPG3s&-**BzgMh>GhmVB~E
b*PEJv%BMcKJqrKihkq~Dxc)_7?@RwaXh<M#

literal 0
HcmV?d00001

-- 
2.43.0

