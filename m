Return-Path: <SRS0=k+2G=E3=opensource.cirrus.com=prvs=8642e0f1c7=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73056C43458
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Jul 2026 10:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52E4A1F00A3A; Wed,  1 Jul 2026 10:12:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782900753;
	b=nDGjiFAf8letFwxHQEyUgb06PXJapCIzyiNfl+fovBq9eTWr0B5k4+kbvQJDnF3Qhdqn
	 NtWm6wLM45Tfa/qBkGfxOqRoVLzg9VYCUS4AeSdEZLDE1HV1G/9jF6wsoRUAIJr5KTtiT
	 a1KRLvdPizHX5nzUABzbWdJvji/pj6lROwbYwuMRk8slDy62Aluvnk52qOVJFelxyi32D
	 DR6FaDPTMfBlDsK0GlGcFyjUuvs1cquAOEaVNwxHZk5iT/c4XBhDcro0NEULp8Nk2PuBd
	 D2g5wbACH/T6yNv77mzr4SPLuZA77FtrvQ1mpbE6z/+Ito38tffT8w9sGemN+oO/+Jg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782900753;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=g4GiuJknFub5tQnGBw5nER2B9szcBOMhkz17VO4kA0w=;
	b=VUlAeCDn2u0nwaLkA9skwZ98Ce3Rl+bTBZ3FZ43k1cxMmCh3i48hP5HyBOMktLj10XHq
	 SK95VATHbkmahzDTTKSwI+aTdNUuYY8aiOBhH/L56EQfujgeBDGGkQvVzzVW3APcNFYlb
	 fcbMec8lB4a0atkWmhAeWWOwDmuJmOmvK6rD32UlsG/1kk0TvF9BinS00CEMeMgyMOpYj
	 m0A619vfKKLcFVPsvOCR7xynZm+k5LY/ueYHl3gbp/sjjR4ydLsVeOjzzoxOwnCW9Jz8H
	 P6N9yxOkHhu7YGeJLTLdjb9JpzucALSbtzfRlaILW7vIfRGPJBB1ziihrItq7mY5c9A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=cohgM8j9;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=yLddXb9w;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A25B61F000E9
	for <linux-firmware@kernel.org>; Wed,  1 Jul 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=cohgM8j9;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=yLddXb9w
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A25B61F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615Ef0s1077491
	for <linux-firmware@kernel.org>; Wed, 1 Jul 2026 05:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=g4GiuJknFub5tQnGBw5nER2B9szcBOMhkz17VO4kA0w=; b=
	cohgM8j9tUb6wFr8ZsEJJZq2AvLIRfEv0+UZcC1Cikb5bxJni6H5bJ7kOLkdXnrv
	byvhM+DpJUweJtE/jjBGGawXs19PScjbCNaOVmNgaaClHRpohJPeEeDy35HnZvPZ
	d4upfz7gx59kf5rpKujJiWiXJBO6aLzRGlOpUeKbnzp9o028rvNOci7K5VSn6S/I
	HSbTZdu2qD8crFByXOBqCseZePYGQrgkIKOkRV1ay4UoYCIPhf4EOZEsXX6RVwzi
	9sUSJ9dPbSCToMzbqDqnFLHJANieFgOJq8K6P7EM3yGR6pEdMWIvicdXJgprAHyp
	j5r8bPqOWQdrPJJqdQRQeA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022107.outbound.protection.outlook.com [52.101.43.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f4e679ntd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Jul 2026 05:12:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6Co/fkrEEjJFIcV8pNv5F02/RICmQ2O123Y4qrX5GSlUz2IoLB3C9A6Ee1BwaP3T2jNnQ15jjMw4cSV5Rzdnq6xAaQFn1+Ogj1ORafKn7DAiSa1Cuxhp4YQhek7TENaIDwxX1NIBiBOeOrs8/mds+hq43Lg959uCF5IwDGv+1uLUXp3UYmBCYW63AwXNCLPRNU2D/OS0u44/Ii6N90sVafHzs8ri8aQWfAlIuy6PZOt1imlicd/s/OWLtdEzLXiZx6uQgtz1yT0X7X31ikjF6p9jcH6t4ZQYgcuySJaOeO0GcmZpDILPbzlxEyp0q4yUc439ryy6RlbtZgRLQuKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4GiuJknFub5tQnGBw5nER2B9szcBOMhkz17VO4kA0w=;
 b=NwNBnK6yj2LHguRpH6LHxE/8yjcGbEjLbELFzebz8uVliD45lrDURXvTPLaOBCJe52WgWERRoA41n77ooAYJ5GpPioIbgpDFP02a0ao9wDXNpUXsTfrnwzOHv2Xt2P96rdmCBIjPHylBc1CFZQsPVNPA1JArXSNtXKG7GKJpoo2YgTNalXtQT1o5jCdtUP87p1IIxOmBIHAK/z2b2F2gpDFseixJenWzYB6N6dsgq7P8UZ3jp17HYks5Y9UsBMOWtlMIF87kRAp3zPFWu5xNSXIid/JtilrHMPT8S0P9sumsiiracHYfHK/mMa2i2xqG6iPTY+th33hQfa3HT2IU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4GiuJknFub5tQnGBw5nER2B9szcBOMhkz17VO4kA0w=;
 b=yLddXb9wA2Q9xOtQjYFYF6djpY9ODX2ypy0r2jgQszM/ekzau/2FHgU1hy+I8Nk52MYJSJfHgFdnirynwlndac4Ec5KhR+0FEWrBIHFmu5aaOk11TuhdYx1FlCHKmhQZEwynO9+dKK2btvpYzkio76CAym7VUvXv2yvYsGUB+EI=
Received: from MN2PR22CA0026.namprd22.prod.outlook.com (2603:10b6:208:238::31)
 by DSVPR19MB143460.namprd19.prod.outlook.com (2603:10b6:8:37b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 1 Jul
 2026 10:12:29 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::88) by MN2PR22CA0026.outlook.office365.com
 (2603:10b6:208:238::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 10:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 1 Jul 2026 10:12:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C4F8C406541;
	Wed,  1 Jul 2026 10:12:27 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.68.74])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A1CD4820244;
	Wed,  1 Jul 2026 10:12:27 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Add firmware for Cirrus Amps for a few Dell laptops  (20260701)
Date: Wed, 1 Jul 2026 11:12:27 +0100
Message-ID: <001001dd0942$1ea0f760$5be2e620$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0011_01DD094A.806622B0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad0JQV8gnOFaGF5mSwKMCOyzwwpyoQ==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|DSVPR19MB143460:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9a5205-6eb6-46c4-281a-08ded75941c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|23010399003|56012099006|11063799006|16102099003|18002099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	R34Vka8o7WRmWAOOVXZBgdj1YploMKFgtOoBrrdF75AIx0Ns49uWHq8TMdriCWpQOJmtV33Dj6jB9IBTUsxOiW3ils0MDRC7CZEb2F3CAHZKbcW4x6FuqNMjDqCKMUVArV2wUcx8nW0K53F5zVr0P48oAnWUIexayovumjJYoqVRbDjvHwaFg6YJ/rsKbDXPqKUqWq1iOdFzCni/fz+Vo4/Zw6dAcVic+5BiMa/Zh0wRbD/7i0WZESztsdzHBmaxzgZnkosxw1aXcPNYwCgjlXECzBjpByylXIdKMtLjVKYNS16PQqj2vk0XoH5vpcjOUpe86tTbksr1wPUuMNiBmD9pKPq1RQUONrX1gb8BjtCu5gYu4l8ZXiCla6VtXPWoK+T9yZS41MUAF3A9Cm76d0TwGiuPh8zBu1dudGs5H9v7Brd2WPBVSrMOJvkfBITOb5GISlFzzLIKIqORaiq2HGooY0Cbv6hKYBah/x3Iz8X2q7uzGmzRUI6xHHxfKkA0SotLjo+cMM4DViOHPKqxZ3MrQl5EEkYyMUiBrFNotX2dAMgRIrYPgzZ1w4ZARZSpyJICdjrMMrmPz4m5uC51gAO/DZ2TxsgU5KrTEMytu86a/6Li+jZHSlfN19TMvWMqIP+KmDfXaCosXRzJDj9tXuAgrgtWvX1jW60YZnS3RDZ1ZBS+GSaQaXXK6bo2FniBFN8rNL28cpVpP3Jdax/zGQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(23010399003)(56012099006)(11063799006)(16102099003)(18002099003)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i4BAu25iOiW/bZTo342XfhroEVrZ7yjAS2YLp/FVF0W9M/A3NV4h14F7iYhOzzfuzFYYxYBCgnfmON9kXg5Y+u6fsemTEYJ+D3mNKd9IBnkyy4HsxePnEq3glWrkuEjf9VVTCFcl4EEL98FKstiForZoTGQYHQbh8AcSgLFMgm3N22uoGNm090V2WwYW+BZ5HecPmQN7o/0EU+NuoH38wyqXweuKxmYGff4jiUiEBgqet8rDVhI0HoUJXsXfGOX9xh5MxeMUEw8ZPSfD1/G2OMC8SXuEec7eVtrtaceqmfXCDXsUoyp31L5EwOXvQB4uxJscuP7o/lm/1NNC7CKLaAWlaDQjH9WKHDJ3q2TSQzDfLIqH1HZVtx+9qJNOoMKkkS7qi5QjlcpWJ6zXWbA3EKy/ZT5d2YS2ZeFwftdj2lSrE1AFC7Nda8SCgF2kzLXG
X-Exchange-RoutingPolicyChecked:
	klta9PZuomx4bErPL42kwGhu1u5fm67Ru4b95BZrHb4ud4pd3xwt3GmmJfqtsFiU3F5DRyB6iId3bc4deumMnrgHwGdVRItdIsNhGacd7cTJ3DjvTsx4rT2/mMLQR5I1kcPF1OVgI1E74Ma9xUi8+im5INHbbbopu8cdsObB1DVrFBuW3iL3xyDZBGGY/hdwalgAmikRqHOsT6p/gWn5CaPdojFLpZ0zra05wseDjRB1vPKt4yU8P1m5YsbebiXjKKVhZpbZVyurPxFsRHcxV5Y4p3A0U2gdHB2Sm3vYbyCAT4t7XxrSz/DSrMuPsTnMKO0I2rr2GCCXDbzduF4u0Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:12:28.6379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9a5205-6eb6-46c4-281a-08ded75941c1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR19MB143460
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwNiBTYWx0ZWRfXz4LBpQSQ07lv
 ZMxDXnQ84iVboecTNYmW0oAFgWDhXhvwMD8bA1mxrJ8CXpeZtycF/jT51QDYINiMoFupiIRExXy
 pA9ZQnfYaFH43dgiZoaBbYGRxuxZ+Sw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwNiBTYWx0ZWRfX5d3kKcBNTq9c
 EtZQtLi6tojt3OshXDx9jriAV5LQuw8LtCrf1KMi1K9+XYEWgGlimKGpTvySGF05U98outqK0mg
 BIejxmHo189EsmOKMVjiyuJZGc8AVN1F4Qw4iXQEQ/mKYK2Zjj0RZv+tEi8X0bBN+rx9CSmE7ub
 JNGPd2wNUKjzq9sHS8Vf/C9tOfLyaPN1ftWVnZaXavrb2/1avAEB2WwGRuT16d3skokmo5KGCol
 MBF6hDaKYsCNkASYoIWWpeIoI2+0ooh5vSa2XDbBfoLjGOx8VbnpaDIZXAjsv7nRKcOk3RitVXa
 5u13ixwG01KRUerJktPOQPre7QN7z7Z/eIVfV7bYU2KUJcXenyoFj+Fk1MpAO3uZafZO3a2J/m3
 2xyzVTTlT7SGIoluAr334K8LjjzRRxG3QNqxy/Q0acU18b4NtTQvlhFhjwh7TpPdoA3y9Vm5xyd
 dPAI1e95YBm/tQRYFww==
X-Proofpoint-ORIG-GUID: bTb9pdI3ZAPWYJIS8m3OEIYEpcVY1Fu-
X-Proofpoint-GUID: bTb9pdI3ZAPWYJIS8m3OEIYEpcVY1Fu-
X-Authority-Analysis: v=2.4 cv=PrSjqQM3 c=1 sm=1 tr=0 ts=6a44e80f cx=c_pps
 a=sUbwXUxkMQNSWKNRO95rnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=qVhiSjjGRwXB8dJYy4AA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=5CSy31clKq_aQAcd1uoA:9
 a=7mY0FpPYFzy1zxib:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0011_01DD094A.806622B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to add support for the Cirrus smart amplifiers for another couple
of Dell laptops, this is just a set of WHENCE links.

Thanks,

-Simon

 

The following changes since commit f6f0f3874c0695f9dbf92709a99328f5324309bb:

 

  Merge branch 'license-criteria' into 'main' (2026-06-29 20:24:29 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260701-cs35l56

 

for you to fetch changes up to 670795153af54960cdbf516534a1d85675459189:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for a few Dell laptops
(2026-07-01 10:04:09 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus Amps for a few Dell laptops

 

WHENCE | 12 ++++++++++++

1 file changed, 12 insertions(+)


------=_NextPart_000_0011_01DD094A.806622B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
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
style=3D'font-size:11.0pt'>I&#8217;d like to add support for the =
</span><span style=3D'font-size:11.0pt'>Cirrus smart amplifiers =
</span><span lang=3DEN-GB style=3D'font-size:11.0pt'>for another couple =
of Dell laptops, this is just a set of WHENCE =
links.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
f6f0f3874c0695f9dbf92709a99328f5324309bb:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'license-criteria' into 'main' (2026-06-29 20:24:29 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260701-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
670795153af54960cdbf516534a1d85675459189:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus Amps for a few Dell laptops =
(2026-07-01 10:04:09 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for a few Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> WHENCE =
| 12 ++++++++++++<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> 1 file changed, 12 =
insertions(+)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0011_01DD094A.806622B0--
