Return-Path: <SRS0=jSMG=HB=opensource.cirrus.com=prvs=07124d618d=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F8CC79FB6
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Sep 2026 14:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 920C41F00ACA; Wed,  9 Sep 2026 14:04:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788962652;
	b=zI7BQpm6PqLsjEO1pUanFBLAi3Ehd/vVtUHSkPO2gr+ml0i76GXEGoZ8loj85bZqEWXP
	 C5zKtZBlYoc+RPODnKGb6fe4IRAvMyY2dgNPUIHGhn3ckwk5gnkhHKbmuNKEftDWNX9Lt
	 ne96sM4DM+sAb6VoQ0mPy4T20fpsp2HS/GtULu0/xRusAjcJ+InVV/ufY6M8lMyzYqxJU
	 /bzCHpCajWrVNMYRnoHjz41dbLC/V/SBvTQvcSnZ8U4BPmZmPFUt2sHPrNvQf9HwcAY3e
	 3IGsSWYG/76UGfq9ZihIiA9sAOJVDP4y9S7/gTFsNhprS7GQ3zgFFRZedEw6ASm1Qvw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788962652;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=rTYX+k2YkBzGbsFYcsbeue5HyjHCcjnDnM30WX/Cwr8=;
	b=mTbEwWHuX+9pSjBbP97wKK/6ZoXe/ylW+4j2yzXJsZUiWSnho/NQBFnmCDSoQKOpJ8pM
	 vpG9/oGXD4U1pWbs5wGt9E8OMRjGC8EhQH8j8jLKjUwmdvbl1EGpV/i0XTDIxfSY7w+mV
	 KV9DrD+mqDrpoCxBNPgUcpfXYY575PKo8PLLUjuyd4zWI+L/3ge6hXrbS0sP6Ra4l7dQO
	 JFrc//e4BvI6UezHhl6mdX3/sGsaHTmUkqlmt5F5H5rOUDSVJHplreJqOxeEONIeYCvsh
	 Uv8P9kbBKvyppYB6v9UieVVTs7dbyWIaJONA0mpZQWv3E91Y+4uqIp0qGXx7BGEXk1w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Q2qw1A+I;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=uNysMQjR;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBC001F00A3D
	for <linux-firmware@kernel.org>; Wed,  9 Sep 2026 14:04:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Q2qw1A+I;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=uNysMQjR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BBC001F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6895Qt3E748719
	for <linux-firmware@kernel.org>; Wed, 9 Sep 2026 09:04:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=rTYX+k2YkBzGbsFYcsbeue5HyjHCcjnDnM30WX/Cwr8=; b=
	Q2qw1A+IdtvneiYcXtt105IqjgVeriSCgOG8ra4WojJhPKsQCE1vpSNs4o/wL1aS
	k+8YiCwRL0w+PqvumE+sizFXfH3C/gomK+CbRkHF4ZVc9if620bDy9lzjlKteQpk
	XcUCZnfEmkY/Re/JuHSt9XzBBA+1ts1t2suZNjImdMaaER810MWRGfhMv48pplpQ
	G4204WM5NoFTRyfFnR5M+aZjbyPNVtJNRNxQTB77JLdNtQ1cNrs7OpuFlwJUPsfs
	K4xkqTBOM+c524132AtWPJMcC2Hq/vJawOq3dws+MUP/Y0vIZD/wstWkXBGRX73U
	aWZvn+/849UJNtDcjHL+tA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023104.outbound.protection.outlook.com [40.93.201.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjw3sd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 09:04:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xb3XpZ3OaW4NAs1iAOT8pYVaPqw8GduHo3Tk11tA9DHGT14HJy3NhQe3Pt3Fb6pvo6Gd2KRh93MX32AOHH9CLQm7A8y0ntfQmzHLwOa2N9kzP332D42YCx5wnQtTP9r4HXWJm5g51xJDEX4FMJaYrbaKK8MsT9E3HncAie88pMYCCN7sMhAe4++wXx43ooUlv5HN9BeJOzX5riYruDJxZxsZ4pYu7vMeJ4vZCC4p6IoQyad3C6D6KwPm/+fyOYcVnLuNiMmTTARucf/RGbt9q0BXtsuchZwlVnVamJgkvS4tQogizyOdGa3v8eKLGAKJ4eBDknkF6No2OmdmTsROZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTYX+k2YkBzGbsFYcsbeue5HyjHCcjnDnM30WX/Cwr8=;
 b=uVnslsrXGf6s0A5aSY6fTcMaIoFcSpQWYj0c8rAwnphFJZDixFFxNcIivuIUVT84qRTVs1z10BIup0EE0KflRIHiQoxK6m0xJ6w7bVeXwZiRdK/HLJDm8dO4Yu4MKWJ8S1YVydJedENE0C2zBF4dQoTPPFrmw36MLKDcdASqqt/KB/Tf48dcd6dXxHUOm5JxrbsV9gH6t7j9auw2e7I/LlzoqdQpbnvJGoWkXS+/725Byhv2yqtVFhdHiZZ3LQU0qpCSUrBPCEvINy3FLTLfzoOJJazyAGYnsCWpdEBFi/UCuPCqlz3XzTthC+sEpeJBbl62qeGJBXuMBJkqM6VGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTYX+k2YkBzGbsFYcsbeue5HyjHCcjnDnM30WX/Cwr8=;
 b=uNysMQjR26wIkYIriE2dAvJmJerzZgYSNCS9ruGD8E/txeLnKx08erahgwm+R65hj4q224txYFWg/BC3es1NbgTdmOlG2RRJkcG3oIslBveQ4uIuhIVKd1aSQwjgd7KxoEabqEwvbfN7IbTezUXLVkcmJVwYx3rbvAqbybb593w=
Received: from PH7P221CA0078.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::9)
 by MN6PR19MB8743.namprd19.prod.outlook.com (2603:10b6:208:4f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 14:03:57 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::6a) by PH7P221CA0078.outlook.office365.com
 (2603:10b6:510:328::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 14:03:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Wed, 9 Sep 2026 14:03:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3961C406543;
	Wed,  9 Sep 2026 14:03:39 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1644982024B;
	Wed,  9 Sep 2026 14:03:39 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for Cirrus Amps for some HP laptops (20260909)
Date: Wed, 9 Sep 2026 15:03:38 +0100
Message-ID: <003401dd4064$03929bf0$0ab7d3d0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0035_01DD406C.65577920"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad1AY/CnsuJUdyDCSk64/hepcVJe3Q==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MN6PR19MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: fa370411-bab4-45a4-7574-08df0e7b2cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|61400799027|82310400026|10067099003|11063799006|56012099006|16102099003|18002099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	uAWj+oXwB06GqQg/vxDmm5DNRQ/D9n9Hqho7NroQUdTMLfybE+4bdx0pD73vRjLxUgd7bOXDrQTjpK5vP89ofc7S+ymNoyI0er2G1QpXg2SeUILJYyMt6GDCvkTOTY887CfM5Gmp16jdPIDA1B5sEsonheSsqjuX1raqvyi3vTZsL06z+abF+54oj6784HVIpRuCZTbh4kUNMHAcAbzbNyKjvFjQlN8AOzrevsBFjv/njFFPp7E5U8ItzIgkhwazQbBUdWFb59kzxvQHuoZBWp5KLNGyqOrb2SRfZVRK3A/ZKtnPQhPmcXH6r84d+7W/M+EBGxPhFvSb47rEwBffm36YR0aC5Ie65wSzzJd4OIqfOLnpcerHAFiaymqfGOsBag/uxaoYPYrMPEQ16qrZ2+yaaeJUI1R9x1hzEz4J3kyw/R4v9fw/v3Q7br4dfI7ITxjT7nQJoWEUQR7TcolmH+fiC40NLdILUYE1S3iy+6P9VN0lPy2qjkUJJ3rqVumwwZEfXOG87m4UgXHhk5FOeklVnNGKkeHHJaPDJ/yKSpNmHXv1X8wDkRefKONv9dBX9cFzi0cFe2b5NbDgXw3M0++NMNvqGb8yj657ctkMn+hJ0VsL/ztfcDYC6tXy2WV7lcgOhdN9IpQVBybRUQhvr6LArGDzzJRpALeG5tLxLn+nahoQ0AP9C0GrzBjiuz24ylxVddOgfhHpCY/eLNsxlg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(61400799027)(82310400026)(10067099003)(11063799006)(56012099006)(16102099003)(18002099003)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	602MxvJdvPWE3cChZCb7gneTTq/zeDJ2Gz/vLyuLHagTK/NHl82VPk3g7trBRFGAfQzxm/FalwnN35RtwxhJR9LFh3kMZ3vRzxHCfF7My7Z/R/xCgJyh36L/7v/sZlfi0uptTc6QIMq2WZ8ttPdz5FrrxnCU/zwrUNwTwxc0i7BI5R65Lt9idZ7+vUvlGWx8ALgk5huZAVwOni5OntOpDh/jB0sVTX5M4ceAaeVPZMTaD0U8POrP5+LqDx12QA6kLIzFDuZmJ1Lka+sGuGOEiZ7QIEI4zqlirZj0TJO4p3u6dUam0TMzJ7mOdh4tGSiLTTZSzGq7Wt7rIs4e5YH/HrzI+BpR9Ix4S0vLMGsUUCvkhLj/UBd7iaxRCtZ0D2s902vxMTFZKDHdkbGBYvdQN25mCf+SmN2ucHiNIGsf8EoNd1qyhhUvRGr6fmbwPLYu
X-Exchange-RoutingPolicyChecked:
	KC9z7UgvR4nm26Ui/V86BklPVnccXJkGaw2qF84R+vmKcvD2rAdh6W2G7i3CbODGIiRnhBYSiZ2KQYd5x2iPiom64uoF4PBMc6d076EoDyD38eLBPcV1o6mzQ3x6/1U5fFLRKsYg/eCKIvhmYScYxq15EUGMsoZve5G2RaVWMlg/xpEHl5YQUYW4KAH+YEQ+37SntHDEvwrF2SHgFtMH6cyIykVZRb0IjnT/DrbxFMru5IYKp0YU2e7QgqBAgOGFz5E8s1ny0iXMZ1lxhPuN7j6c0S9PAyG1H51ZOeJSRRv9JPtOsB4iwy2977UDVfzQRP9urVEfoI0fCOxAFQ1Qyw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 14:03:50.4367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa370411-bab4-45a4-7574-08df0e7b2cf4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB8743
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6aa16753 cx=c_pps
 a=0zbhqlog1HYD7RdPDvTXcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=OBh7_NeILqKwH3EUQXMA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=uAPu5FWpYs5Q1UqaeAUA:9
 a=KpPxt3jBg75jPWC3:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1NyBTYWx0ZWRfX6mYwMBHQaNE/
 WQ3GF5/kAjGzCnL9E2eRyaRHbLuW1HWXZBvZYJSPk9nRCWN75Dm/Py9YPZXue7lNEqUgCbeg6vB
 6F/6fVV0kSbcQq/73ZuTyfvrNhzvB6dqUW9HbA6NQdoyIR8m9C0G0e3ZR1gMzQbUvxYuV3HYB+z
 8YDnp1gnAnbYh6ZPzwia/Ut43/lHmCxz9f1ko3B83ncLI2VUEpdF4Bij5WctL/ezoKk5EnSiglo
 Eoj5GuGHQcNfGIFq698OiLqwgFFCw3boQx5cBzUTn+ZXCVULkAfBcOSlZ+3wUlhUcBIi5qvY6jq
 xLrnHS8c8xjcC0D3pbzNenKVCjRxA3qqQtnXDFMfwFUau7LYROZ1CDIbcQSQ8iUvMexL3kLmfLI
 Za3KdAQeBoWFAnhXm77hxXrXT/2fiYWS/i6tYgRyuiaCVPD3IcaWVW1RwCxntFCPUk60K2Ncmxz
 9w9byPMTFa0wYNPXqLg==
X-Proofpoint-ORIG-GUID: eZU1mZEbj8A7T4RHRQ2NI_EXBvPIS2hR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1NyBTYWx0ZWRfX4jsMS8lQ1kBD
 /fE8aBXyM0JlOJ3J21I5O7+uHtzMMF0t8iwRuwzunMpe7mdrEO9z5mwxd8BvCPCNx0t5HR51fpZ
 Sl0pfVPtf9qNCxAp3r55EXmaKrZQeQE=
X-Proofpoint-GUID: eZU1mZEbj8A7T4RHRQ2NI_EXBvPIS2hR
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0035_01DD406C.65577920
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus smart amplifiers for some HP
laptops.

Thanks,

-Simon

 

The following changes since commit adbf9e5eaa7f94dd9a9b62330a24eb0ce79ff509:

 

  Merge branch 'lemans-monaco' into 'main' (2026-09-09 10:31:19 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260909-cs35l54-cs35l56

 

for you to fetch changes up to b33a1bc023aa70652b791380061b25f0d73cc21f:

 

  cirrus: cs35l56: Update firmware for Cirrus Amps for some HP laptops
(2026-09-09 13:27:47 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Update firmware for Cirrus Amps for some HP laptops

 

WHENCE                                        |   8 ++++----

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin | Bin 7680 -> 7464 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin | Bin 7648 -> 7440 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp3.bin | Bin 7680 -> 7464 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp4.bin | Bin 7648 -> 7440 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp1.bin | Bin 7684 -> 7268 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp2.bin | Bin 7656 -> 7248 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp3.bin | Bin 7684 -> 7268 bytes

cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp4.bin | Bin 7656 -> 7248 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin | Bin 8136 -> 7600 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 8132 -> 7572 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 8124 -> 7600 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin | Bin 8124 -> 7572 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin | Bin 8132 -> 7604 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 8128 -> 7572 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 8120 -> 7600 bytes

cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin | Bin 8120 -> 7572 bytes

17 files changed, 4 insertions(+), 4 deletions(-)


------=_NextPart_000_0035_01DD406C.65577920
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
class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>We&#8217;d like to =
update the firmware for the Cirrus smart amplifiers for some HP =
laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
adbf9e5eaa7f94dd9a9b62330a24eb0ce79ff509:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'lemans-monaco' into 'main' (2026-09-09 10:31:19 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> =
20260909-cs35l54-cs35l56<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
b33a1bc023aa70652b791380061b25f0d73cc21f:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Update firmware for Cirrus Amps for some HP laptops (2026-09-09 =
13:27:47 +0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Update firmware for Cirrus Amps for some HP =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 ++++----<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp1.bin | Bin 7680 -&gt; 7464 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp2.bin | Bin 7648 -&gt; 7440 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp3.bin | Bin 7680 -&gt; 7464 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d85-amp4.bin | Bin 7648 -&gt; 7440 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp1.bin | Bin 7684 -&gt; 7268 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp2.bin | Bin 7656 -&gt; 7248 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp3.bin | Bin 7684 -&gt; 7268 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l54-b0-dsp1-misc-103c8d86-amp4.bin | Bin 7656 -&gt; 7248 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp1.bin | Bin 8136 -&gt; 7600 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp2.bin | Bin 8132 -&gt; 7572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp3.bin | Bin 8124 -&gt; 7600 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c52-amp4.bin | Bin 8124 -&gt; 7572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp1.bin | Bin 8132 -&gt; 7604 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp2.bin | Bin 8128 -&gt; 7572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp3.bin | Bin 8120 -&gt; 7600 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-103c8c53-amp4.bin | Bin 8120 -&gt; 7572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 17 files changed, 4 insertions(+), 4 =
deletions(-)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0035_01DD406C.65577920--
