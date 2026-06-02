Return-Path: <SRS0=jmJs=D6=opensource.cirrus.com=prvs=7613b1720a=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E734CD6E4A
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jun 2026 12:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5198C1F00898; Tue,  2 Jun 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780403218;
	b=c6pI+0fK6ZpiPtqVktYz8PqP4WVn39/2c27DqIbIXCukrcJHMw2wBOgXGSZZiCsTKlT9
	 LGm0o2+4TKqE7SevOrXWXjVmR/NSpgik8JJtG4FBRKeT4wlftNo1qo+xl25WhJGgQZo/V
	 KRkj1LpozpxhuED/zbNhMWQdelBncHIR0YNHcmI67f9GfrlBC2OyaXZQqPW+gykP8EFsq
	 rGrBu+cs8dGhYSvrwYS4w6FCk9Hy/bxlGKpcvu7zR6f8ViEmWGcsE7lRG0kRRrk6l9thS
	 j5IJYB3hJcAs3ZaguXy/Z4KcI5sZL/C3XF3x9HB91Q8bsKGht/eJrQzEQ2192UM6QGg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780403218;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=zGb7NJSoPxxrYP1jBq1wgYR651dOoR47D6OwhON99to=;
	b=E5hcjG+0u5eFwgrmCOJW6mGCXu/AyxGXC+T01lY0rI0VlKLzVKyNVn6NAWYdrFqvxNbx
	 SVp8rgqQO8R7sdtlIVx3Ar8ga5FF16lfSp78igFDHJdlrKGpEV41VKfYxU7rlKAVc28tp
	 UXtKWuGhWha/WkjYIVd5em71Uwqk26dciM7zLFtrgdNH3/RHOptZvQqfIRqPU/D83m12G
	 6JXZwXB/1cAldbvJdNrHb3rNrzt1c4JUUCwgTdBOQduUk6z0k8r8EfeCUMhGIXjn3w6Oi
	 CsVga1CvJl02d0u4hATnx6gnexntpSeo2rQnkKXCG8lBahIvN3OPu+AZgkwdqN1BhwA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=JV6adZ0q;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=dRC6HhEf;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87A861F00893
	for <linux-firmware@kernel.org>; Tue,  2 Jun 2026 12:26:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=JV6adZ0q;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=dRC6HhEf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 87A861F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524LRfG3559645
	for <linux-firmware@kernel.org>; Tue, 2 Jun 2026 07:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=zGb7NJSoPxxrYP1jBq1wgYR651dOoR47D6OwhON99to=; b=
	JV6adZ0qSrps2Jmh5+TpxdSMhxtWio3rmR0ewuj0W1T0wFfZU3+Lv76LfqUxrzze
	7ozivoU2tUm57ua1EQEscTdmskCoHCyWyO8ZgQBd7myLASUcN7P9Icv+Stx8lXV4
	lfcojL7I8uJaard1PJ9mjciAjqh36DZyCgmlV/tsKptG+kfHv2rCJTJRiEwoKURI
	oXWOaJtrPI8iofm47/NglB9XiHI1I3Cf/IaQ2dSmLqBhVB0hrM65dvfstU9x4Is+
	dgck/usiVYvT37vHb3Sc9fjozJb8aEG6FTrRTtY+PJre1rzMPzWJ5D83Ro0ADrcS
	/RiMDIVHmPXZkHSG4dTyWg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022086.outbound.protection.outlook.com [52.101.48.86])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagc84f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Jun 2026 07:26:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRCzOGxAFF93BZ3bsuI9VHfEdcbvOZvZNg5+9rZ546poJKG2ahA3cDS7GZn/nU/i4SWZ68g/PYwae+PWSUcGiW/IOL5arpvOJkbCXQHeuDCCb4tYtbvOajpr0Q2/OAyFsOWeRskwU18Weev3BB83VsvZbMESUW6ccRRX8AlLGMsoMyiE+LvTzkoJpniBEz+i1iycdquCBWpVnKqKWUiQgDWyOaFaCr5lucZGKFG7IDRJOlie8vvcDouU+1vz0sODZMc3drMVm9ME+5vCZPh1QZznbGdy/6MzWwkoOG8Z2Cvz9Zh+xw3mRQdtNiletVD9zXU813jzu+eDVaDX3laLJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGb7NJSoPxxrYP1jBq1wgYR651dOoR47D6OwhON99to=;
 b=j9zx60mJDxarZoimzwWs85clcWg4bGFhQnHed9INPIFCIE9Hdrj/97KZAWR1bPrSdA0b9rlAuQ/BTRpPjKbdVKnRaLzFW+cYJFuZEANWG9YSI4h5Sd5sp7jb4bF0FR1mLA0TPbHOUbSfluAvV0Cubk7lxtgNSiQM7eiJJebhLzlpMEEoU0exB9yhZNI9YglOsDl+BPRYL1HCjpmsG8u7O1Lcgd8ngcmIBLVyaWrgV+YvkUrVmZhMA20q0pLt6ycpAtBzMxL4nGDDCKlS7pB24Yp3vNT2vcUeIZyaJ2/ZroFXtnxvPGUygMnTbyXi8duIpzYgAhHSnhitKg2TT6zh2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGb7NJSoPxxrYP1jBq1wgYR651dOoR47D6OwhON99to=;
 b=dRC6HhEfhZiSW482Or/7y7xXYt/hpYyG/xpK1ifVr0fksQmevmL4lfDQPQHoAS5UWd7BdkNr86MFe3rqoGGb9eqpBGkxVzBO5S+BgmNUesjVtnVi2/BaZa02bog471m6o1lLdQLR28fJGP0IldeZtD7erZI6+pNA5DBs9bH/YyA=
Received: from DM6PR04CA0004.namprd04.prod.outlook.com (2603:10b6:5:334::9) by
 LV0PR19MB9399.namprd19.prod.outlook.com (2603:10b6:408:326::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 12:26:51 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:5:334:cafe::17) by DM6PR04CA0004.outlook.office365.com
 (2603:10b6:5:334::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 12:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 2 Jun 2026 12:26:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3CE5D406540;
	Tue,  2 Jun 2026 12:26:49 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1B08D820244;
	Tue,  2 Jun 2026 12:26:49 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Add firmware for Cirrus Amps for a Dell laptop (20260602)
Date: Tue, 2 Jun 2026 13:26:48 +0100
Message-ID: <002201dcf28b$15a7b2c0$40f71840$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0023_01DCF293.776CDE10"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdzyiwAA9GOnoDVuSFubwB9EYLpZGQ==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|LV0PR19MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 832fd549-0543-47ba-4b61-08dec0a2394b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|16102099003|18002099003|56012099006|11063799006|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	8QLp2V2R5KbvXG4qJhf4U6OvXLkI/4lMVa7VIuCTaUqrzruajaLjUkhfE7aozgv07Y7bvQQ8b3Y3lFwJu5A8g9umZkqT80O6AmknOfV87IjBt6xjt1wX750CLKBBnifJmDhv8vBnG0kGdkTRc2S6njuCynuZsk/0AXU4ze/LRLbvuYCp7UWfB/3kZF7L6HTJkRe+ULf8tAVHlo1ICFa1usePjCrJisSHfuk0cmAzxwi50EA71CT/3jT0sWZjOuYntigWIcX6muDebS8cH7nTrcVXaSUn3ppssNISWkmh77X40PQEbk5PIP0k8jH1BAbf6l0DNIJ3LJTLnzhcC0dDy6QYRorcTzgQKSNgdsv/DOxUXqvYkHkHFSwlPb85Oqkgc11m5X7MZZ9cNFVd+21R5PwCDTdkAXsqN1SXuYqd6DVMASnyrP6Ftu+XVH9laLyMsaD9aFgcADM8d+wP0U+QOmUTy3gN6Th19Nk9UZbBxzLGJNr8nrItc/SdG0WVg1q7759TEx2PKLs5K53xU/eJV5y6I+AXaNCFmmwuVKpc6xJiBRzQUJKGHPhVBeVTt1222BZmylAAxKs40PD6boOo4gmnzZsV9UWYF8BcKLr1pJ7tfXP6W2Jm5eVl7yks9pokNoF5wbeiEJtgFrPFjyUkd2Mmak47Gjqt/Zsu2drk6A3Ws4+s0ITqqRzYLhUMmhhSJZBVU0U4HnkqvKdg6AZC0dBMSVpBLW8xnKXmSPrCFZY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(16102099003)(18002099003)(56012099006)(11063799006)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o3jk9ea9s8dgdlxAm21ZcZFsNybHcaZ7vZuIQtrCnz/Rmzd1QNkwPwy0onZzEVz9kJ+wENWOUp0c1EYvE3KiI8caUNi706zo3ble1j9vdBrnwJQdcd3vSt95oO8ekSM7HTW+goCUdL2N5rjDhLzfNZo9qRNG80mPhGYTg6XpdVES2ac/SCPk7/9V4DO2VH++Qzf3lpbjuGysHdbwuYhHy+2A/6ZQZoVQx4utyjaIoi+Xrz9TxPzd3TgDu+fhYpUO/AjjU2CxzimAP+Rw7qcgMty3MT2IbFl2p+RUJCof+wceJqppTUuOdrT3NaChHKnO/l9TsFMgTO9eMO5CVHf3NAzmH514JQWGChY88ABPhLewusIK0Yx6NMr2rh7hz+GlDVllQTxk9mII4cX2T0OshW0BvbBsUH1HxKPQqztGM9HF+0cCZt7mi4Jj8/WPduB8
X-Exchange-RoutingPolicyChecked:
	mC4vgn8YB45j0d2jwNnC6EUdlZubnmJeXUcTUl8qSznNsMPnjnc7Fivr1+nSOwDiziTWeLHz3tQ2Uz/ecuNThcJZ8Q1pkR2A/PZqt57yAJsLakwtArWwkNU7uwOwCLmaqiT1TlLGEJHgt8yJ2QsuYm0cUh2yTWTpuNK0jYmoyJ748C+4NCDwbrOFO6DNfeMj4IVXs+nwyLglcJ9HZo2DhungBeRtqef8WOvCojoZ+IA4w8iLoIcAHQgz8C3+YGT0haci1GYmq8vIF/s4YcSVBnqNK5gNdJXeEFJgakNvQVVccCEbHbt0GLPBlPGAidpkAXsKc8cidBg5hNJxeR/FjA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 12:26:50.8695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 832fd549-0543-47ba-4b61-08dec0a2394b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9399
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDExOSBTYWx0ZWRfXwQm9+A8CRDDl
 I3iOABdQuOz3lB8y6wgKRheu2/+bawT7jGcg7rjZYvL9YeaFmzCiE7ISLJrrJHG0A2Uon64kZiF
 5KQMqV+isjxoB6KXK+mibFFKRZAkq5NclzcKw6E8nSQPpvcJo2HcxhHxzZWZMbhxdCJ4oJcyAFY
 +BBFx7WWzP3DQGTkq2pCKR2f6RyOVyXSYDddlXGSdnEfdbAIYajGVufk3kFoRHau4FjpBkkA9Kc
 PKfahHVzgiuXax+QYsSofkS1P4Ytxq1X2ME+0UXv34TN0sBNayOGarjajAKPrx2xJuEFxRARb04
 +gdLg6de5YV7YkqwKWf/Hq9c6+dMGjcNAJpguNjzUHP6pbiap5Na6DfJH/015GLUP3niMwx42et
 RVE5RekPRnQGMaNrVwyMEtz67s/J3Vwbn2FITa1taVbBNlUdG5ocM0BOsk3AuD3iWqXxgErShsX
 rGAd9E+vVxL8jqYiAkg==
X-Proofpoint-GUID: DQPxjjN5m_TXUo-ASZtdVmq0LRFQAboV
X-Proofpoint-ORIG-GUID: DQPxjjN5m_TXUo-ASZtdVmq0LRFQAboV
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a1ecc10 cx=c_pps
 a=fkVT6ClcRaXWu6jQ4rTLEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=_fk4PPaqE4vBno3IZRsA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=pMRTr-CROvfYJgUSqR0A:9
 a=Z_aRKDhOHDoB6JoF:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0023_01DCF293.776CDE10
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to add the Cirrus smart amplifier firmware for another Dell laptop

Thanks,

-Simon

 

The following changes since commit 77d64443a983b70b6ba851f05016ae22646cce16:

 

  Merge branch 'update-2026ww20' into 'main' (2026-06-02 11:28:56 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260602-cs35l56

 

for you to fetch changes up to 3dfefcb753c03cadbbfecafee3ede2240cff9419:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for a Dell laptop
(2026-06-02 12:17:51 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus Amps for a Dell laptop

 

WHENCE                                               |   9 +++++++++

cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampl.bin | Bin 0 -> 12688 bytes

cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampr.bin | Bin 0 -> 12688 bytes

cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampl.bin | Bin 0 -> 12688 bytes

cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampr.bin | Bin 0 -> 12688 bytes

cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampl.bin | Bin 0 -> 12692 bytes

cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampr.bin | Bin 0 -> 12692 bytes

7 files changed, 9 insertions(+)

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampl.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampr.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampl.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampr.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampl.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampr.bin


------=_NextPart_000_0023_01DCF293.776CDE10
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
style=3D'font-size:11.0pt'>I&#8217;d like to add the </span><span =
style=3D'font-size:11.0pt'>Cirrus smart amplifier firmware </span><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>for another Dell =
laptop<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
77d64443a983b70b6ba851f05016ae22646cce16:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'update-2026ww20' into 'main' (2026-06-02 11:28:56 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260602-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
3dfefcb753c03cadbbfecafee3ede2240cff9419:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus Amps for a Dell laptop =
(2026-06-02 12:17:51 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for a Dell =
laptop<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp; 9 +++++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampl.bin | Bin 0 -&gt; 12688 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampr.bin | Bin 0 -&gt; 12688 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampl.bin | Bin 0 -&gt; 12688 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampr.bin | Bin 0 -&gt; 12688 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampl.bin | Bin 0 -&gt; 12692 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampr.bin | Bin 0 -&gt; 12692 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 7 files changed, 9 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid1-ampr.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid2-ampr.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid3-ampr.bin<o:p></o:p></span></p=
></div></body></html>
------=_NextPart_000_0023_01DCF293.776CDE10--
