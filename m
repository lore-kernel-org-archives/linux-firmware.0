Return-Path: <SRS0=5LL7=FZ=opensource.cirrus.com=prvs=9672424621=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C73C5516D
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Jul 2026 14:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 749DF1F00A3A; Fri, 31 Jul 2026 14:09:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785506989;
	b=lCqc+g6n7qv0qoTPDNX8q+c98R9AwpZqvST0ETQBIlmyljNi8eb6OHAWSpHfPsxoH4bK
	 LtrcO0J+K037Fs/q4hnvD5qzXR4PjqxIKYEbhkC20zeDW2N2jm1H7ERAXAjMhlCc64FLJ
	 sGYZ4vx+E3aQvwYtRQdqtao/dRsnzTAsErz0k4aeDdNL8+0CLFm6OyaEyv8vaaKnv4FF3
	 Eo3QJhAfkT16JPeKZhJ7J2gWp8wav63oQD8Rhpnn9Xsyf4yYKU4odkKBNWECxf4Cy2QrS
	 VwB+tPXq5cUkOAutp5DL4WCbjmfi2UvkLI6oxu+BJ8qq7+oA3ygo3BpuqVbwWwZrOHw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785506989;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:List-Id:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:X-Mailer:Content-Language:Thread-Index:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Reason;
	bh=PzWVbhBFP00Tp+f/zmTgnVkY5MoPH43u4RicHBv1p84=;
	b=Aa81SkExKOwrj4y/DGqqBillAkavDK0Dwuw12h9+H8856Xf8bu/kY5YVL9cGINkA2L7y
	 9nYmwv3x+WkQPPprJ5MD/audoA18FYScQol10Z5rEMa62q1s9zrg7xaGi/e21eOzkFT2t
	 IKqdcRvmNgBBpLxIYyK+1D4zC9VHP4QPdX013yz2H2JBrbm7eT/wXmVGderq1VX8m225j
	 vF7Wj6VcruecrmlksOR7P78B5wQ3a3xnZNNRdT5TBvGXgpJm0qdfumj6rkPUWPAdCV9Cr
	 9GeqJ7lQX2LjiE0fawH6WNOXe1Tjci4O0x6yz0prBOUim2d3B0ourLgYTroqJFejpZQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=b08aYYPi;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QXY0UmeR;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD2721F000E9
	for <linux-firmware@kernel.org>; Fri, 31 Jul 2026 14:09:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=b08aYYPi;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QXY0UmeR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BD2721F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VDGqTm928474
	for <linux-firmware@kernel.org>; Fri, 31 Jul 2026 09:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=PzWVbhBFP00Tp+f/zmTgnVkY5MoPH43u4RicHBv1p84=; b=
	b08aYYPizVdW3cmaVqs5WcAEBxk8E3zkJy0E9wbSluNBvimShr4ODpbJ1s7MhxkW
	WFNTzbjDrJn5flDPZYa201I+iJLw6QJKTB7euVjPfCrIL5vQAPdBP4hIUEwbfAff
	/l7gsRzaba3jVfUu7gxWFCRU4TqOGPRJ18On6aiXEGsok9Fdyu58yGIvXXnkrboX
	/FzCYE5cLkT1qjZjNSN6Aw3oXTDPmNyCFWODh4KCgGJ3Kfw9r+SOWGFcob8Pt3eN
	eDKfo7hHZz1TUEZ+DotdLcvJXZsiUUbvfpnEYvQvOoq16F74+tOw1g2NzTNh7GCL
	PmCkM9thlmyMdgHv8HBkAw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020108.outbound.protection.outlook.com [52.101.56.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4frtrd85k5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Jul 2026 09:09:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN0fnkniJW4eRXhiiIOvKKUHxhtU3cYr7QmO+/qqF4/9M5ZdqruaP+SbaYyptVlcHsNiNxZhingtfyqTZHdxjSpmosHs3RhykWxlS+2G1YVo02Smgr/3dDACcttG0f25FHvuAyr2/IUq2hTAOgXmKaV5lU2hW1Frup7HlIFALi4s5wkYlCqZew13wIyRr0UA1B1UIRzgW54F3czxmy2FWiyjMeuWPR8OVoXvxl698ovRoKDGwdqX2QrwpGEDQvFVupl6nVmqKDkH1uUnF0duuO8qjqLm5zaQlTueaNd5Ycap/8KJtGBQks6UgXINlRbLguzbOv90DMbPuQeJ2P4x8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzWVbhBFP00Tp+f/zmTgnVkY5MoPH43u4RicHBv1p84=;
 b=yF7j3Vs/H7QWr1bkLzz8m72E9SiqW7f/BoVwEtg8bgX/TVdPSuYJqqFZ+XEQxkOPFDu9k+Z/7m1A1/g2iPRjb7po5yPlrFNf0iz0PGHcGgMqwN+IR5JyG6idrYSXNxQ9qCPgGA2DLlbH7hpAyjZJ8FKeCicw8vASMCnDwzG/pOFuLf0EWCFu66wIOt8w8SqNRF5QUNeRAlgApfiykKx9tBe6RVAlPHC7W19zScC0HqtwWqSqBeoQ9kDWTUuS+WoAqwNTAwOZ7NmMnPzNyVnSSFBw9RmX1akWNu6SZ+7W/NjQxn1WZVkbPWdF8MYs3btO5zUGgGEbBf7G4ipLku7/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzWVbhBFP00Tp+f/zmTgnVkY5MoPH43u4RicHBv1p84=;
 b=QXY0UmeR8BHffPL5tf4M/DJwXI8BUG1XH8Tr7qwLrzTB2ydgYYhxMCGIljfwtWlIQW/d9e5xpFz8GSiwavZdY1hPB8cZLnhvGBo7xKyow90+FLU/TiOeh8+g7oXTVjzl+VtBeH7B2aVS8RL76O7q9SAvg+DScLcG5XI+s3mrCok=
Received: from BL1PR13CA0215.namprd13.prod.outlook.com (2603:10b6:208:2bf::10)
 by EAYPR19MB240806.namprd19.prod.outlook.com (2603:10b6:303:2e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 14:09:36 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:208:2bf:cafe::f) by BL1PR13CA0215.outlook.office365.com
 (2603:10b6:208:2bf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.10 via Frontend Transport; Fri,
 31 Jul 2026 14:09:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.1
 via Frontend Transport; Fri, 31 Jul 2026 14:09:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E9DFD406541;
	Fri, 31 Jul 2026 14:09:34 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C84D082024C;
	Fri, 31 Jul 2026 14:09:34 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l57: Add firmware for Cirrus Amps for some Samsung laptops (20260731)
Date: Fri, 31 Jul 2026 15:09:34 +0100
Message-ID: <001c01dd20f6$37130560$a5391020$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001D_01DD20FE.98D8F400"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad0g9dFbtESRuV6MREK0ugRLZXh18w==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|EAYPR19MB240806:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f11e4ec-ec87-4b5a-91a1-08deef0d5a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|30052699003|82310400026|376014|61400799027|23010399003|13003099007|56012099006|11063799006|10067099003|8096899003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wFRfp4QO2HSgWYzPgZiNG7zVmXuDHarftQk3wtmKsoW64GfHdtAEPyz29FAOq94AgxQglmmvSQha3U5qhl19agj0KeozPufU6yzz5NAdgiFb9Z/h47kVrHgQr+45wlAc02oWGhZ+UQcNKREcyOHMuU1nfoqge2tSqM3CGbUcMKkPAoytPo8ITNiqX5ZfX+xzr99jhj6bc1rVIE320XyFDIRDC4EdmwZ0jOPDkVeprWiJPH4C+dlBX+2VIeGakt9P12E30wVombXl4zjQlmgtD8A3Ni1nI3Q+71EFeAtVOgBq5Pq2L37oEDpb8/896HCAxfKyrAkz3eQInQL7OGDFZba9V+bm2VBMvT8H8rjgyZjYMtTB0XuZTRHMdOjZfxJf8jSrwnlcgOPdcTTk/ff4NobedGyEOD2c88Gf3U+tZMxiCeO8LKELUu8vnocfIQUHZoY+x939qX+fxbZUrAdJSAQhcduSD+06+cdz6RKuuT5PbV1ksDvZBFmh8c3dSwqQl7Q5vMyxusK7hOtjPwZajg2ooJdCAw0pNGUDGPy0jTr/MhHNvLoQRvbNhwzGMSSiFhBI3XaqEQvB/fruSs8eo3QOpBSzUxsWi6Cp0ARxwphcdUJn0uxTrljfrjfUcWrd3fpj+WpQlPKDKucfIliu2YHeZL5mzExMl82IPN0dId5X2xllaQxayHevpalt7+t/cXVFwA2VPC3pmndauIqi8g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(82310400026)(376014)(61400799027)(23010399003)(13003099007)(56012099006)(11063799006)(10067099003)(8096899003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b52tq0zFZyNXdKQZ8hYcyGX0CxsxgVhxdusFiKz6mM1f7/8VhEc5guGMyNhx9cs5dWth3y+78BDXchnGm8eJ8Zzzk/lq5K4fzSx6kXmE2/NXymoMi5v7gn3ZjvKEX5MrZjh0bHAoHL+bTl5c3sqwdAEJBM3XvZS9GVYC2n/2dqmvoShlfjSpiJGD4Mqs9BuBY5fV9xMULtIwj6gh2TCDmKA/S8jU7yTGOLfjVlTKkLGiuuZBYd5HI59UpZ9KQUx4hkYf8RlWQCSQHJpOtJSFdNptbv9eaT2H17qAUh48+tmYJ1H1B0Y0QW6aKfr/6X0uI6cLkg9QJDf1OzWAxx2fudUql1Ic50iWpLOYmJ6oUw3UuTtx7zIcCz7TWrENgH/28wXRD81MdxPnVZtTGhMTV6hfxlCglE0ExSDwOQqthmM8s+zaDlSJpNM8aX7uEO5f
X-Exchange-RoutingPolicyChecked:
	L/ZwG9jmvzoZ9twmgJcm5O+ICPwEkg5wmAsX2PStrBjJlEIaoyky81VN4tIYiXNpEpA7RpOTYCqpeaR8hkomN3Hb26ryhZHXLunSH+G7GQd1Mo67kYa7Hlrh+f5JONyu3HRQh+C8hLkJvrVICiiiKK1bm6kUZLehhQqaDjErfPJZ89Tn8Nks6bNML4Z+sOHOmLDytrtrRc6zgT7bGwxbnyAmtPN259A1KvtOOs5fiTJtaaHXU5oTzyShTb6NRJwBNDpAx9abcMT1gZmQ15a+LIYFb7eirI8kwM7B+Y20d27GVzP+Wl5nJTSHTx2RGC/VIVrgfxPTIThC/5/7KKZRLw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:09:35.8723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f11e4ec-ec87-4b5a-91a1-08deef0d5a3e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB240806
X-Proofpoint-GUID: iG9qA_RokMMQQ1efaRPfZoU8UcABMsRC
X-Proofpoint-ORIG-GUID: iG9qA_RokMMQQ1efaRPfZoU8UcABMsRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwOCBTYWx0ZWRfX3xAB3UH3e8T4
 P3r3FRq0sKBsjAAD3KmJJCqYVd+NjSUlg4J59NxZnrt8e9r8nlCTas5aQSciLKQkL8Uxkh7QJe9
 snA/7EvcWx53DHGhJPNdPQorKHSrBSOnr/hOS0HJiL18NLzvxJ2eevdmkDanc4iQrIGIWjfKRIO
 7WXMUk12ChcfGgf9LuACDFRSgSvowl+vvg/dGvajVn69HMC5upcok76zgdFmxkqDASquzRHS/hn
 N46w8C8EJfRH5ERLJMIj3EKhPRWCi+vizouT0FcoyjvfprWXJ78iDsxX8u9W9CT+nhKFYEoHTNv
 GkcEPy7QfkVkGbV1k4px6icIGGTIRnxccdtlmXepnzQK7jRzhD6L1+w7PQqa65KG61bVY2qIQAg
 uNY6gB1QFcvMw+4bcwUcyPEP0z4uvCPe2TpegXE26hfxOAX6OYHPdsv/KopEyNh91eG5bn+a5jW
 lUuNCY7Tg39PZN+UbZw==
X-Authority-Analysis: v=2.4 cv=L8gtheT8 c=1 sm=1 tr=0 ts=6a6caca5 cx=c_pps
 a=BYyRvCY9Lsi29fIAjJxbIg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=iOTopYWwhqR6aY8FbNAA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=Wsh59ayDCq4gWLXZy6sA:9
 a=IbHDtB9L6pgjYIJA:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwOCBTYWx0ZWRfX/kNjZnPkyyfP
 LnWRMs1o7T7Pck6wvRcV7iTnHsydUfujCeay4A4uKotyR9kXD6dC9WYXxeSrfqpsly8Xb8Rlnb6
 rtWXnWsGPBtg3NYNhmNu06tVOO98I7Q=
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_001D_01DD20FE.98D8F400
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to add the Cirrus smart amplifier firmware for a few Samsung Galaxy
Book 6 laptops.

Thanks,

-Simon

 

 

The following changes since commit 9cedbdc3ed074797d0a2ea7355ed0627a14ca5d4:

 

  Merge branch 'main' into 'main' (2026-07-30 12:04:54 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260731-cs35l57

 

for you to fetch changes up to bb7c02330655a5025a9bf0eb3741d49c6407b9e0:

 

  cirrus: cs35l57: Add firmware for Cirrus Amps for some Samsung laptops
(2026-07-31 14:00:42 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l57: Add firmware for Cirrus Amps for some Samsung laptops

 

WHENCE                                        |  23 +++++++++++++++++++++++

cirrus/cs35l56/CS35L56_Rev4.7.0.wmfw          | Bin 0 -> 35256 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u0.bin | Bin 0 -> 12412 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u1.bin | Bin 0 -> 12412 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u2.bin | Bin 0 -> 12408 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u3.bin | Bin 0 -> 12416 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u4.bin | Bin 0 -> 12416 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u5.bin | Bin 0 -> 12408 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u0.bin | Bin 0 -> 12416 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u1.bin | Bin 0 -> 12408 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u2.bin | Bin 0 -> 12416 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u3.bin | Bin 0 -> 12408 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc910-l1u0.bin | Bin 0 -> 12376 bytes

cirrus/cs35l57-b2-dsp1-misc-144dc910-l2u1.bin | Bin 0 -> 12380 bytes

14 files changed, 23 insertions(+)

create mode 100644 cirrus/cs35l56/CS35L56_Rev4.7.0.wmfw

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u4.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u5.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc910-l1u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-144dc910-l2u1.bin


------=_NextPart_000_001D_01DD20FE.98D8F400
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#467886" vlink=3D"#96607D" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>I&#8217;d like to add the Cirrus smart =
amplifier firmware for a few Samsung Galaxy Book 6 =
laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
9cedbdc3ed074797d0a2ea7355ed0627a14ca5d4:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'main' into 'main' (2026-07-30 12:04:54 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260731-cs35l57<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
bb7c02330655a5025a9bf0eb3741d49c6407b9e0:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l57: Add firmware for Cirrus Amps for some Samsung laptops =
(2026-07-31 14:00:42 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l57: Add firmware for Cirrus Amps for some Samsung =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 23 =
+++++++++++++++++++++++<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev4.7.0.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 35256 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u0.bin | Bin 0 -&gt; 12412 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u1.bin | Bin 0 -&gt; 12412 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u2.bin | Bin 0 -&gt; 12408 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u3.bin | Bin 0 -&gt; 12416 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u4.bin | Bin 0 -&gt; 12416 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u5.bin | Bin 0 -&gt; 12408 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u0.bin | Bin 0 -&gt; 12416 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u1.bin | Bin 0 -&gt; 12408 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u2.bin | Bin 0 -&gt; 12416 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u3.bin | Bin 0 -&gt; 12408 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc910-l1u0.bin | Bin 0 -&gt; 12376 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-144dc910-l2u1.bin | Bin 0 -&gt; 12380 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 14 files changed, 23 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev4.7.0.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l1u2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u4.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1dc-l2u5.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l1u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc1de-l2u3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc910-l1u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-144dc910-l2u1.bin<o:p></o:p></span></p></div>=
</body></html>
------=_NextPart_000_001D_01DD20FE.98D8F400--
