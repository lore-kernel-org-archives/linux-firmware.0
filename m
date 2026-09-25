Return-Path: <SRS0=1Q1t=HR=opensource.cirrus.com=prvs=07288374e8=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE37EC98324
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Sep 2026 13:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC07F1F00899; Fri, 25 Sep 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790343090;
	b=amHtrjsPPmbHUpVXuI9IgSmsS4iNGsueDis4GwJuIWiglDxjmFomtPdZnK0Y7b3to+Xo
	 puPpFjjb6rQpP9clQkzA3d9kjcyn2t7GEhizVK8fPtde2bWQRhGahwrVAfjYLx/flHSGq
	 /u7nDSHQ7vu7mZbrxCfGblMVW9iHJnhsRK9j0oqLG/58Ws4N37fUIbHl39rYg2b/urbce
	 t6hyPdQOB8jZ9ri4NolvKkQGYhg7LJIEzKXhPBUTflfQR9FO2e1N2KkfFLgI5heW2SCZv
	 01lovivHseVO3m/hcTk04lwMwIUaPMOw9y5gbpx7FJTEGkhyx138hbA8qOnnhqjMQxw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790343090;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=Uy8CZWF4Yr8TZWAHiUPCUgGVozjoqJZ79/jMPw3nO2I=;
	b=O3MI+8vZ0YUSJ/rmVDzIAbUEMlSoebIpsE77mV1/mZ5gC7444G7yLUbkyz+IAwKfKjOd
	 g3nkaibm26uRVuRRVb/f6MLBUDrzKnemJeB5M3ypaKX0CnfIDsFvine2qm580cH2O1Cqr
	 r0Hw0Ntp7AtmOtFy0hCn3Fa0yIzkf2nNuAUnWhXFXK/jRZhT920165kV+j3sGPpnyIfn3
	 wbrLBP5ph8M3yvdlb6nAR3qQVcsH1VcFLSwghDJ6g6qBtHHZId/oj9Q3loZ1BiAJzxnRa
	 827sjWHtxaYHiupzMp6AmGnSsTKBLDEpc6+B73TogkQswW7MQEA5DvWobidgv0vTDyQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nlON7GuO;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RGdyz5bR;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DECA41F00898
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 13:31:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nlON7GuO;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RGdyz5bR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DECA41F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P6AGHE1731876
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 08:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=Uy8CZWF4Yr8TZWAHiUPCUgGVozjoqJZ79/jMPw3nO2I=; b=
	nlON7GuO2+H2KhQJfjltLYYMeCDPv8rRoZJiqKgDl+Vn/Ga/WkdaNxHqAQaXZOhX
	vZKpJgv3eExUzlgnLtabHdhnE7k29GO4LB6Xrf3cFWou+9DD2KmxXQtJLY9VZcYE
	b+TcslcD7Zm0j+PxL+0oDUs89vk+82FgqWTvbCvKLneQHvNBjZdA/9PqJpqzKXGH
	xjZFh3TwDsTfoycGzvHaJNHFt8bBz7r18hewW25Y/gHwZG/HBMNwMBJyK0ssAKPv
	g4aSNy8DXnjehwYmt4CPp2plTeNGiHnEMZIuhc0r4a/vQfBsEhNaaB59nW8KPGmL
	P6eXcGO92Pm51j7fsoJWEw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021111.outbound.protection.outlook.com [52.101.52.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gvkc5b4gg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 08:31:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/F2HW3GY9Xfy/MZKmAU+SQlBKHOd6MoOxbh5tir6LLp1REWEIo9U4lcgraTB2ZKcRRDI9UKNRdnk81UMH1Pa0A43ltkH8PuD72PTB/8ZwhhdvZ6/Pv2ZUN20SlyNrhtw5wFqvJK6i/l4vEycD1HhZ04D90jF6Gy3Yb+yF7OiN9XL+LqhoZ1nYSCJBrV8aEpCUawSp12xs3rTeQJAUS6LAYLTY9ayGue8ZwPns3xeIQo2Zau+vrqokax10m3WnpFlmnB6bkmyodH6WqXiZVmnbtjYklaDuL8i8ZemlOJrDW3gfNIm+kWYTaM+qtZqhDrzooczXmnR545i+u25rmtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy8CZWF4Yr8TZWAHiUPCUgGVozjoqJZ79/jMPw3nO2I=;
 b=qNRqQRlh1Y1oKkyB7IA6WOEgRLjNU2v1dMCzeHN54+5znRCumfhvtURCS5PMHa1VXrudiEnOjjHndDydwYsMbPdPbjngK3WOu3YVp1tk5B5kjzVRV0E4aqPMQqHrCvLcmn0gSRN+2/N/ZPNhGKya8czJ5BxQXOry6on0CXOdoN9177kYy9dHF5/yCgTT2o7Jb8RlzEIDRcQqeleNfTMOHksRNo60sQmPI0JKWTdrlxI+gkc3AyA+wcUXjtFrz+fXgC/lfdNFVidZek42/ukMNhsXIcZ+UlJ0+mQJI5p3SB2MJQrjUxpVHf7gnpESPuh+pF9Qm2uG6t2L+oWylvxmkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy8CZWF4Yr8TZWAHiUPCUgGVozjoqJZ79/jMPw3nO2I=;
 b=RGdyz5bR1rODuCocfzzrfUO3TVq/BWVRqOOo+vgJW8NtXDxX+3AQ1FIPCybz26161+iCLaUiTwhPdbz448ybynsNRXg1YxOLNkQxAUViRg4YWnQOXmRLNCBKcq+TaSm7TyP1gBN23OXluBXUN9Bm1nTOjICHyokDgfezvXD+cA4=
Received: from BN0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:408:e4::10)
 by LV5PR19MB9180.namprd19.prod.outlook.com (2603:10b6:408:300::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 13:31:18 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::61) by BN0PR02CA0005.outlook.office365.com
 (2603:10b6:408:e4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 25 Sep 2026 13:31:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 833E5406540;
	Fri, 25 Sep 2026 13:31:16 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 55A22820247;
	Fri, 25 Sep 2026 13:31:16 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: cirrus: cs35l56: Correct firmware instances for 103c8c52 and 103c8c53 
Date: Fri, 25 Sep 2026 14:31:16 +0100
Message-ID: <001601dd4cf2$244f8250$6cee86f0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01DD4CFA.86148690"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad1M8gssid1fy9TjQv2KyQLhJoJ5cg==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|LV5PR19MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e2ac4b-e5ef-4474-2935-08df1b0947c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|82310400026|36860700016|13003099007|10067099003|11063799006|56012099006|8096899003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P/TR1lF98YApq+zCQrm3novLvgYB4NuDw8yh5PmL4n8eIcAgH5jHltBfD77FGm9u+0voffNHV8Moq46eWS3QcFJeP1ShU2gtiH7h75CzFfLS0nBW4dbW5t2ndrXW65C3LKRcE6a1By+y2LTSSCsa3lq28nY7YOJ/ZCo8h5d0NqwC1qgAzJTtb4+TeR+8JiGMCdpkpHYkkC739Z2EZtC3s32E6sbneIxxpgW5keoErYuGrL47ucbwJyC7ezZIPZjmGA4Ov1ufewQgvnUskp9GCcf9R0z3va3PTQlk59GdGd6vlfFnHIxAtqbRWnVc7ZnLtD2Fb+BJCRxdAU1n/c7KJ2rR9hETgVVTxHcFuNvGRjedb++/lRWmwotebL2PWp23KB5fLHKzxP8bn8U6KWvQHzR0m0afZzPkA0SxtJCg1LqqzRgS5mPd7qyu2rJcEMzd+lXhpCQJdKqPxFRyOq1wOt18ceacxr8/QAWaXaxNPoZAhVXSBtOKK7WZSzq1QEvlOGhikOmjnHUS0OJcOE5WQ3IlfSDeUNAz0tONO4lMwmSKOaUn4MvwGYWhhZ9UgZ3sD2mnv+FtzgBgLgwOxMUBRp6euCVBPiK3XzzFhEes6rUqRbwLhgAoI0uNm4vamta0i+N1S+JXsDADVD3Z3cKf8gSACGMS1BzJFx+TnceTJQV3wsvz1crTQEaeDomxw6juZW2irG4o/RNFSZMTChSwPg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(82310400026)(36860700016)(13003099007)(10067099003)(11063799006)(56012099006)(8096899003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NlRqLLVdWKkOgs/1sMuuzwN26Crci63S3waWJSf1R4zhj+IKmpyxvxaqDwfP0LDmzoFxlWO0AHyKaztr3OfjxG7PAc/9MFLGVmdq+pK+QypchEJSAS2cJ8kncpSQfavwtCwCuTNjWJ5pGGadEtmSnEnKfIErKgsY2cYVZ0XBQ3qRQwX5FxkymPaBkqsQcwrVonciCRWaRbz+im/zjm/zZ0BfMtTNNf6qIW1aK6rQawIjnik6uK2aON3S5+58yD1gVl6NvYO3vHpgUaP8ijpvThA3u6bTm1CjrieCVlz3oXeBAVSAVYq80IUV16byMocP9tQii1tuCy3SLZ/zrJBERFEf5Fwc1JjzauX+F/qydTYhPN0whJYimowmBQTk0XIcdyK52ktErKTi7JyYwGTFf650H7KO1NCpJXMlQJhcAKRwJPWsHKx9DcQ1zOfqTSHe
X-Exchange-RoutingPolicyChecked:
	xYtJ8OpVHeXWQYS8uch0r/EOc7YW0tgxrCgURjIQKnZ5KotyrGossK6pY6IrpMrQRmDsGy/CrG5+Oe0tU0hz39bGOe4oO6iUx6TDbjgJLjGKwxNDwUqPPqahXQScoSwlDZesSBooPR8kji5I8qLA5R/hwqnazqPgcpYK7pAlrtMAdeJLi/g5K4oPhgLfjEG1cqkTyIi82jgpx+IU4Dxaqenu6qmS/v9j88CTNQVqV9AUnnaJYFvexx3vym8izAyyIDCBSd/JiJ2hQhXAnb+bF9bLeaVw2Mnk5LbULgxu2RR7fMVz9VJFvAHka5NI0KHAUWseWwTx9c593LSucnHO0A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:31:18.0518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e2ac4b-e5ef-4474-2935-08df1b0947c5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR19MB9180
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX2IwxtxqiJ3+W
 PJp+vXQt+fbX8n3phTmCC+H8vvSC149b6oOMggwcLTFqEA1T+m1WSRrngM/U358JRiCmIgilxOI
 f4cRUxngPRMT/6qzPl9sKONaUALyDf+SC/c9bk4ic2GuwyDaFW6TRCr7ua7d1kkSGO//Wrz0BRA
 9akR0dpiMMNsr0lUSsE8NHfGnL27f4KmkGC5K5jKvfgU6zCUKDHF0ItD0VZYfOtxr0h6803hfGW
 VLlFrOXG1pqpqeXpGgboS1r3L4HOcdbTrTk5BX/figrV38sB325GtYkAm3VCF4AG/SCuR/PLJOD
 2yu3abFRU2CRAgOYw3FTAk0dH9ddLHWeModoWehxrRn175N3e9aBRpfyHRQ9s/xd2KncPyycUxy
 S8wqPR9Z0yZw7EyDc3S8G0rYouo3025QyHb2zkawjR14VPYBAgHpXI2qJbkM2gLEvhWuP1qV0jT
 J7g2miplZOHOB3kDGcg==
X-Authority-Analysis: v=2.4 cv=ZcyIpcVA c=1 sm=1 tr=0 ts=6ab677aa cx=c_pps
 a=OyM5tLSvZCi3BtZZ++GVBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=L_GCzSe7A3LTj-_K8W4A:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=llXRko7Nj7Vfaqg-eCIA:9
 a=yxOwJPIC1MetzJ5P:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX3nsOJ4DnHnJY
 IBZdCny/FgcVGFb9W3rjbKHn9+TfGgNAsgyoGzp8QqYi79iAzLWWBJ5EAupTH/fqUakDi0wxCGh
 sHRX9Lyfgz07oFLCgN+hyMi6YWvpe6g=
X-Proofpoint-GUID: FgWyzGfplenAVWTPUy8vaU2z37jNJxts
X-Proofpoint-ORIG-GUID: FgWyzGfplenAVWTPUy8vaU2z37jNJxts
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0017_01DD4CFA.86148690
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to add a correction patch - switching two pairs of firmware files
around so they match the hardware.

Thanks,

-Simon

 

 

The following changes since commit e8a8bc636565a2874b2123684b8ef23f30687c27:

 

  Merge branch 'fix-repo' into 'main' (2026-09-25 02:34:08 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260925-cs35l56

 

for you to fetch changes up to 4203b9738f727ea866786b9fde285386076ab014:

 

  cirrus: cs35l56: Correct firmware instances for 103c8c52 and 103c8c53
(2026-09-25 13:27:02 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Correct firmware instances for 103c8c52 and 103c8c53

 

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 7572 -> 7600 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 7600 -> 7572 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 7572 -> 7600 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 7600 -> 7572 bytes

4 files changed, 0 insertions(+), 0 deletions(-)


------=_NextPart_000_0017_01DD4CFA.86148690
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
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
style=3D'font-size:11.0pt'>I&#8217;d like to add a correction patch - =
switching two pairs of firmware files around so they match the =
hardware.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
e8a8bc636565a2874b2123684b8ef23f30687c27:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'fix-repo' into 'main' (2026-09-25 02:34:08 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260925-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
4203b9738f727ea866786b9fde285386076ab014:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Correct firmware instances for 103c8c52 and 103c8c53 =
(2026-09-25 13:27:02 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Correct firmware instances for 103c8c52 and =
103c8c53<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 7572 -&gt; 7600 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 7600 -&gt; 7572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 7572 -&gt; 7600 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 7600 -&gt; 7572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 4 files changed, 0 insertions(+), 0 =
deletions(-)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0017_01DD4CFA.86148690--
