Return-Path: <SRS0=+2e3=H4=opensource.cirrus.com=prvs=1739addc23=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2FACA5FED
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Oct 2026 15:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD8091F0089C; Tue,  6 Oct 2026 15:55:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1791302131;
	b=O701vr/jgR+r7mpEU55xfhuIzWK1ZwpWUZklJeJkPnceLupErGS/ecUbwGSk7aiUPvwy
	 GsNq7BKqmhPMG6Sn7L/trSpcyWtD1yPOV6Y7BS1MlvDUbRt56VKesccV/WxCoFICpLJ+y
	 TSW8+1cc4kw+PfI2uEEmfnp13rSqYFzm3bw+GweHJKS+T70Tw78FCWkX+6t1t6JfDIZq0
	 sv8lSW5AL00GCX+bpPCmg6E6HZ/9vuLLQ2oyjZ5U2cxP3KTouB+WuAQXS0Ac90iClPcgK
	 FYAvUs3ekX8zaFQ8dC9lOTI/sKQtqdSKcJZ8oJgm0KhwRQNMbAO2xQABDfmYuXa7UTA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791302131;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=o6r19BGfhqpnmFnglkzaBb1ka2PjtK/i6SFxUi0IZVA=;
	b=HcHvVfSmQOVwRF97cmvU2dMJfPw6IH7px8dey11mPtD/hdxx0NHPfGvdoPjrzuCH/Qt6
	 xVmLYJUToxDt8JcN/V7X3MtKju8Jw0peNLuBBiSdryDKEkdxy2qaKn1OVKRpI55/RlqS3
	 wyloglpBKcNmhlXCWHiNX3vQlEWGajyinT8kv+F1T+QSx/j3WoPXLIL8wLtnntisCvGs1
	 TYJc4Ozywmyrro1S+MHeKUQwquvNpz4yjPp43XPYMMF/UbpP4LRw41vGUB4TmRrwWV6J9
	 ilvn9DhqmF1aoIw90xNogaCYtmtQZn6aVf92k2ff0IYyded2DMPLG6yY87MRdoq9HSw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=c5UmnV+G;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PejOtapf;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 126481F0089B
	for <linux-firmware@kernel.org>; Tue,  6 Oct 2026 15:55:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=c5UmnV+G;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PejOtapf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 126481F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696DgHnM055534
	for <linux-firmware@kernel.org>; Tue, 6 Oct 2026 10:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=o6r19BGfhqpnmFng
	lkzaBb1ka2PjtK/i6SFxUi0IZVA=; b=c5UmnV+GViY3JKph/dGApx73zfJxg4T6
	KxbY2dDvdwjolcyAF95+kQ+14Ykr7W/mqAwSE+XemNgJPv4ejtrPGBEj/9/c4ckc
	YE2yP7EWylli5F/Z2trgxMW4buVrV1rlKFMEClJ7zlIQ8JDjxTD/Z16aIJLFfGc9
	9v+uDSw8xW3E2dDWgq9AaAsOhh6xPPzc7+Kg8tGNWGPT1YhpLRkFMjAoV18XUUAQ
	x8RiAH5ktuWaruWQQuEDcV0tTBRZASVCj+W84HmJ4Ac1KhLGFPlDiZj7vDpWC22B
	D1GIMC/Ed9Ff4q5G/KwCbnlUs6nmKEvyl5aYpkhEfHrjncYRY8ltsQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020080.outbound.protection.outlook.com [52.101.85.80])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4hbwg2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 06 Oct 2026 10:55:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwEWGGO1BOizDnbstQF1/StgwsXvawfIl3PYj5Nwew6DAI05fHWdnjfK+LkC8sSqR2GQQp/W0ptviyFEL2Mup2WAJcDmNv2NlyZSWVFW2hR6mg+6HuXLCqVFpHYnXay/GJoMNfEi2fh5g5wqGFo5qkPG0OQ1+nfpHfrXwlcmH+NfDA/6g6luQwdS/i6EggmJlh0cMOKeoVQC6SfdPxNnHcEj7G+96wGcbaFbp57P+U8v2/GjOpeZoEg/7ls1MyeZo6nZIw6Kui/RF6H446kjYQ9Sn3fUKKMnC8DHfb9dFpW52+J/O/uAKIl0mHIMb3/cM2qXbgAspZMw1gq5ZDPKMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6r19BGfhqpnmFnglkzaBb1ka2PjtK/i6SFxUi0IZVA=;
 b=JsoGDNGPljsTzAsnPs/YU1OYjj1nXCJ1pusaFOoAdR/5X8vWCLkVku7+1Z46dNIYhpvkF7wI84yCsuWS4/j313H85bXUzKsdaWq0DT146RfzjkAPGYpfKGTHVUnpKnElX9IshvsD7r7PisUhi0vb3788bU6l5sPBPbmAxiJfxiYQYHakno8cwGT7ZBT3eG7ghJSeTo7uRAMuzMAUFmVPHzQbavydtQiZQnZ3mJOdaiDZS9u28BDvjli2v2zE0yuL1caL4AGakTs5GMIER7MAyq5XDp73fvbv4knk2l/630/dWAFv1krGhmgFwsjEW11OiI1XmtX17RkblfTBVEEelg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6r19BGfhqpnmFnglkzaBb1ka2PjtK/i6SFxUi0IZVA=;
 b=PejOtapfvCVQa05JPptLUXV1yxPcitWzuQzQ43fQkbEPPE4XHd+SuaUM8tHiiRXrcLztbFTQadvU1PbDECM/jJkpEjetsfkivevcriXCgQrJh8Vp5GbMb9JXC9YLPt80PJ3Oz6jSa7roPeCyfXIDBUb/k9wRk6t10Yk1WgWNc9U=
Received: from PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::13)
 by CH8PR19MB9144.namprd19.prod.outlook.com (2603:10b6:610:271::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 15:55:20 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::75) by PH8P221CA0065.outlook.office365.com
 (2603:10b6:510:349::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 15:55:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.3
 via Frontend Transport; Tue, 6 Oct 2026 15:55:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 497A9406544;
	Tue,  6 Oct 2026 15:55:17 +0000 (UTC)
Received: from [198.61.68.159] (LONNCK4V044.ad.cirrus.com [198.61.68.159])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2592082024C;
	Tue,  6 Oct 2026 15:55:17 +0000 (UTC)
Message-ID: <2886f631-f339-4ea1-ae92-78402f226927@opensource.cirrus.com>
Date: Tue, 6 Oct 2026 16:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add CS35L41 firmware support for Lenovo
 Thinkbook laptops
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|CH8PR19MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f1dc28-126e-48d5-42e2-08df23c23897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|23010399003|16102099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	msxCWSqmcZc8FH1eIMkCGH0NSNf4AxLRvR9FueAJsyy7/6CcTibDhhIYM0a9qrLFCygCVqvCpn1WYgc64qO+1hQGDHhN+HuBWVLE7+nC/r3M+NlyHLREVFIwEzQ6gTEURyO38gPZ9RMlrkkNLeV9TEMsKkiGAPR7SF/U2V3ugNN6W9NkJGVmZ94Ma/IZPHj5gubwP7mhaz4U+6fOwtXsMBsvGrnHH0JSmol/obGSCQhru+b1aMw0AQ7MSe3lxtfVth+qJ2BmjspWdkMLH7TTz2AXhn9eph6T4NyypOXeX1bntEGzpINZb4p3YJvuzOqOj+5QRgSTEkXhIEyI6HGnw0gf9BAaIIP5l2fAPYNz04t9n4aE6LbKJsz7Cu1Ktaku24KVmtNhJGPvdowTgeIEdRLGwc6I/RQ5PX2MnwKmJK/UuUux4XqFiLv4hNpQZgxNW9FM5MakFOeuzMQRjmgvOXYF5FZc8KkxKMHjDOIzt3gUjv3q2KejOPqKvDGKFt6IWMY6ZIP6+UM6rTbpUcgYp2rgsUsFyGXjhs2BmFIwY2cXEzYzM4fCObOg1P/Q5bTk6Yr//nXIbFdj8kONGhR1Yb2hcpC+8FY0l6aRlyskfGMLxJKtHv3nm9afb0nAfINzBzAUzsrBcJjYh1Ye5SSuxjFWYwDeH/LHXKLB+uU+/2v3H3Sg+fTrPW3aHrKj4UBp5srGXW5UaX8qFwD72Dtk5A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(23010399003)(16102099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	60Yg9FNjiY4ttWG87UkbvryX7OuBAqprpcfJLH0kMVdoAvhkuvjYhlhlqTrfw7YqHVm1QBQlEu1OYsAuLzGl1mMPAGNZI7VcnGwzgzH/Ui5SeWlRJIihqEqjGTA4ZAyX+s+CMVZGW1gZd8DF1Ohgd40tWlkczSph7RoKmIWLdry81qM7JB6JbSdLJ1Jd33j9g5RPYfQ6CNYgF0H40BRW/OVggNgqpeGotumzFFWlF7LPIOg8G9kM41mlsajdSoUKqPCR8Vg5lPhZ6rFSnFkYankEVkYG+H9eecknuhsgmUpZNwJh+NUOC3LPA/otyQvKrNkH6nNj81dcuVDBw5KCTjCJ47Ua03PQEbc1/XoJrZ7+TaUekxxUK8n40n7nhjdCDsKAi54ToXu1936MimXoh131QDHlBUMlkeetiu8T8gEijdnNX+uigE7gDvYjVf1F
X-Exchange-RoutingPolicyChecked:
	R0iIUEnAUY8OADuwAT20hncPdpPLG3PO1EL/A8TsgMyqYFlsHm/JJ83QXLcJO7/OqeCdNERNXYnhVrF1SapwXNQ20IlHnHqPr3KOzsp5BnAlEHuw+aMAhGhA9G8WqHconouefUSpRXqyxKr4EKuyo0y4bfLog4iCF7EUPg+B0cJL0jgt7W3IcdglVQ5g9f3k+j0Y7FRrlAIKsCsskvZwU17Ea9tydYAwhNd9ktd7AqvLtiTLfU9MwNdl7DYgi7HU7+EB4apHjzF8O+UiyYrDmwvArAZVNrEWA6OpUp/ZU07brOxdb2bzqfvfls4d5AOvFfu6no9cepKJudZifiT8OQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 15:55:18.6711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f1dc28-126e-48d5-42e2-08df23c23897
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9144
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac519ec cx=c_pps
 a=GE11VYRMVHt3yMfnQg1OWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=NEAV23lmAAAA:8 a=vg4udRMbr7WAV8lscZsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA2MyBTYWx0ZWRfXyW5xh4WrqBT3
 M8kPLxmY3+bx/WRt1PsDk78CqoD/O3PqD5p0Tw1aTyVWkCYUmAeszxfz8Gp/7b4iDAW413dq0zw
 l3B+BpuLdKiONJn6/zBd1H5qFe+UMVVSq9+zf7tqdpxnTG2Dq6328grBeDfGx/uQuxkQb+ei+da
 pFHwyniXw5n8+sGt8OGJI3+an5qE4kDVmo9o60ITjyUn9VZpMU4rN1iykFb8MRNBZkBHC9joi9p
 O31JMcXnlN7o/+uxWlOZPzc47CXNvV1d2b4awpreOpb6mXE7tXl+nTdjIIIBkjE/ZYChO4wMT0n
 43NqQ8K050rrIZ6BHTUxW0m1CLLgpgu3yjkw1P2faY8wk07dZEw8umldkQe/fM52HeS9ZcKdNse
 ncHTGqMIUaGEAUNoixx2NL3RZl9+B/mv8+QklpgtUD7qfGHMXR6Iu3ssbe8fNge9/l4FxTwir5B
 ldE8wcGlBUatzesJpYA==
X-Proofpoint-ORIG-GUID: 1Bha3M5o4Util42lr5uiFUrgMGMoCSAO
X-Proofpoint-GUID: 1Bha3M5o4Util42lr5uiFUrgMGMoCSAO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA2MyBTYWx0ZWRfXwWsyNMP+5XVM
 5VJ+ndjpbO8/LRWVn7symGegnOTdIZcZ+mRUMAAjs7nG4d9Owz8+SHzTCVl0tMpgu8dFDIFBn3Q
 FDWNt5uVayl1ew+yTN3ZLsypOH5nj8w=
X-Proofpoint-Spam-Reason: safe

Hi,

We would like to add firmware files for Cirrus Logic Smart Amp CS35L41 for Lenovo Thinkbook laptops.

Thanks,
Stefan

The following changes since commit d947e4e8e314e9254a1242dc1a5d9cede2cce33d:

  Merge branch 'fix-qcs8300' into 'main' (2026-10-02 13:40:44 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ 20261006-cs35l41

for you to fetch changes up to 55500172fe1028eb11cfe691efbbb991c084c58a:

  cirrus: cs35l41: Add firmware and tuning for Lenovo Thinkbook laptops (2026-10-06 16:51:49 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add firmware and tuning for Lenovo Thinkbook laptops

 WHENCE                                       |   6 ++++++
 cirrus/cs35l41-dsp1-spk-prot-17aa3845-l0.bin | Bin 0 -> 5492 bytes
 cirrus/cs35l41-dsp1-spk-prot-17aa3845-r0.bin | Bin 0 -> 5500 bytes
 cirrus/cs35l41-dsp1-spk-prot-17aa3846-l0.bin | Bin 0 -> 5448 bytes
 cirrus/cs35l41-dsp1-spk-prot-17aa3846-r0.bin | Bin 0 -> 5452 bytes
 5 files changed, 6 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3845-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3845-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3846-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3846-r0.bin

