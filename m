Return-Path: <SRS0=Orn+=G2=opensource.cirrus.com=prvs=0705c2058f=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300FFC61DD6
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 10:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08ABE1F00A3A; Wed,  2 Sep 2026 10:57:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788346632;
	b=gEZj+By0KY59VxglA/ccE0plQ/ret0/qXDhuNT253H9/j6ROnrpKMmKhvpVQkqF+2TSA
	 H+kkylxKU0LZ51jFQJm2UQIqXU98HQFPyeShr/vsJkJ6Ts/QW6kcYaoDfNKnUKihXkxjD
	 HeNnbmzqzUuM5OoM3GOq5OV09mdcav84zbmtU8iUxQlgRJ9VzgtipzWaOLjZm9uVNcahz
	 DCDdNZ3uRsQj29zNYRGTzOUV42UcUXSn9xUn/RhIrImNcpXz2b4LqW8hs6sV17/PGiOiw
	 aHn7C8hu1x3r890CE2v7c8614Qt7aIzz7uB5TAp7+jYVslOhigPaiZ4LhBoO8xvfBsA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788346632;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=DYJgRc3QCeRnuBvQlHUbf5xICB5SEg6KfWmkyqma2mQ=;
	b=aJdI5SRia8rVzYccuJLyNzUyYUmh887XrXlzOlMHOYW2fj6m/ucXIG3OIq5Ni9byv20A
	 0hZz+GDcBrGnnMsd8hYwrKEISWlIKn/cNqtYi4g9cFfZZb1iNSb42ccNgXHINovEhdAGK
	 fGAgmXN7Kj6jqh1YRX0qoiC5gTdzOj0QXv2g4edbz6Oxyu4gWW6y+lVtcZA5i1w3XWKgB
	 gZiN+0TzIGE3RSthTYYfoo5yc6EOzxbl6luuLTsUsa7ioxApVS9JYdukP+IVx6EnHcCAX
	 mLLj2jz0+DejFcIvtOnXtm3c0VT6C7zcC3NCSTwUqYN0yVVeuSSZdMWD/5jzc8j63eg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=BQyZ7Eu+;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=h6JtTdYx;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 503991F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 10:57:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=BQyZ7Eu+;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=h6JtTdYx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 503991F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6824pm051990286
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 05:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=DYJgRc3QCeRnuBvQ
	lHUbf5xICB5SEg6KfWmkyqma2mQ=; b=BQyZ7Eu+BQQvZITkuSw9pue39WUzQR+g
	AztjyvqSDlXr1vCNRYD+EA04L8iTDXoyPwTEVNjFfCWc7RbdOGSQOZDqX9US6UWm
	R+vKlTYyTjKu9L2MbUweMS78DkrSgjhektv64dYD1JDqES6hSj3msyPAOCMgMBRB
	DQcjSJvqGvr8Q5/SyrieXRszboj41ecxAjt4xBwKapwJ5xs1wkyim/osZ99oYbw8
	DBRSANKr7xFaMy0K8e8t9JRtflOGDePLejTH4Oe9ILID0LhnUzUAQNgNo/o+J5Bg
	VtaY2drtSVJ6tq7kHRlCNzHJswqLf87f5s6sqwPH0lyc1zrQHBk57Q==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022100.outbound.protection.outlook.com [40.107.200.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyw975-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 05:57:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRXmIxMslAqKU3V/eFlotn78PgFBSihryC86Okw8TMgnm1rGfPIRGMMuaQjvShWkixfZInXoIC8+dRYWSX0crCXCjLhJAdBCqkKWQiVLWi9HvPg8LWAMydmLl7Bif0nxmzbc3nrMCsueDRCl8b06iGwTZ0PvTonNL/KM6tuyRcLiFDzGFN1hDCYTP+DhleAcNN2UEpm3vHb+IJz8SIW8v8sab0UfcTQ7X2czIlAbBRUrDfkagZY9Dl6gpaDmWKwB4qJy1UDeTYf7Hq2iV6Y5MULl6OAI3RMnGByn4YkrIo00izPzR2umdQUykz475hu+OrbTLWCEA244W8SBDgnQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYJgRc3QCeRnuBvQlHUbf5xICB5SEg6KfWmkyqma2mQ=;
 b=X8B4zlgcN3fzSCzMS28UQ4xbqKP3zf4x1oiRVrEngC+XkU2x6ThOHsryp192awPwR+ch32sweH8lkDgflF2kEjOo5ewtchAfm8XjoiO9dCnHzc9mgAAVTLtywXLlBqoJCGJs/yDZDJNG/B6v/VIj0ZW//TmdbdqXJWcyPuAKDTGYOKRXQ4R02rupYtIayXaNCRel460RgGBrg+u9I0R7ECf0+jHsNllYd+sOuMMHke4m+KRF944xtEfYnOaccW9c3C3vu5WRDzp5pO9L7oYV6Z2GU49x1l+FfgVFwTHB8wFzhvK1BuSBuOVFiPUjotHYLN79WCR91VEfG8n2+/0sPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYJgRc3QCeRnuBvQlHUbf5xICB5SEg6KfWmkyqma2mQ=;
 b=h6JtTdYxID5D6qgRIb0oHhiucUuEHzFgKofuV04y5HdwEnOrdA8aNIKTt5vEOCaUrdeTZq7locpmlkjNEDcAIrjnU+6P15twepjmm/Jh8WVrDSaNEQCgBajrfV3VmC9RxshomS7UipGmQchUZMUVWht9OzU2FnVYcAr8MsJ3MCg=
Received: from IA1P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:461::12)
 by SAVPR19MB997257.namprd19.prod.outlook.com (2603:10b6:806:4e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 10:57:07 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:461:cafe::65) by IA1P220CA0011.outlook.office365.com
 (2603:10b6:208:461::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:57:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 10:57:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5EF2F406545;
	Wed,  2 Sep 2026 10:57:06 +0000 (UTC)
Received: from [198.61.68.151] (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 43636820247;
	Wed,  2 Sep 2026 10:57:06 +0000 (UTC)
Message-ID: <109de689-dc30-4c2b-9552-74a85fbdbfd4@opensource.cirrus.com>
Date: Wed, 2 Sep 2026 11:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v2 linux-firmware] Add Firmware for ASUS Zenbook UM3405GA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|SAVPR19MB997257:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5e4db4-d6bd-4473-fb51-08df08e0ee53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|23010399003|376014|82310400026|36860700016|61400799027|13003099007|10067099003|16102099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	RXtMz6JwUPOhTy69ZW/nouqYmdZiAXJ9RnGRRbuildjpJL/1+grpFZwUL7YO5IVXQh/YKxdHEq2yFN/Hr9D5BIA8jFk2HxRlO3LvEsFQZNQfVLkQ8gPVinioBpCFtVLFJZAhtLr24wtks5lfuPp5an1a0w6KKyO4bst2q+7vfAAiWVjzKJVh1xcS2wG5wX/wRvm7PGHmg6qsosz2ho4mFm6QZov5otDDWq1H1xEIlFPti3TEhLXo6i6H9TVMcpsPSJbTkxzeNaD9Z9SLbc6Yv9VbPezLsimwW6hdMCSVm7K5/LrPBgT2P4Sq/SdwR+SXvFDEQhcj0v5/oP6pmx9JEzQHr123QL+u5hluy6SG+rtPC28i83eRNMeGDZo+cuAbxruzSWBtVQPkb+xug7ncVn3zqCurpASIKOn/ncVcrWLa6YrwCevQhQBtnDD7DCYB6XD0L7MHbTII0B3dM5u+F2egzxeg6XqLI8dFRXHB4p6cS0Y79Onkm2vNe39SO2TufDrnqJKMuDAg6fLbReSL0Sd+61ILJHUpHkYTdPw2mwaJz+251ihRBu3RByPCOMdIxHcnwZCM+U3WMN8CHJl0hPtOU91rodjZbXevP3JRiVrsf7XTxnNkCmJPnFuX8nUZN4HKpwCymDfaZ3vAyqTrjfjg38jCe/CAJCTBwLziSDFPG3cNuIxSPtTzlUiLMtpwwRFD8l40ey3P0weHnjx1Lw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(23010399003)(376014)(82310400026)(36860700016)(61400799027)(13003099007)(10067099003)(16102099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qiQnIEPxIPvGs/IwVuv9YP61xhzy2zyFsoqX2Jb+SRXRF966TLsUrTloxrUGqBXsyt+5Me/CgjssjFsa2kOLpLgMo2aAiaHcfatkaMchPiLlAep4RiH/zdWY7H2t0xFEjXh3e5FrXUifKArzKG1LUY0FEmEOsUVCFdjY0KdxB+csM47wCNUf+ndV8CeVUPFHFUF5pgg43Pby9cSDRIrTbWRBwcBH7u9BT9gBqWoL1SrfpYOP8S5nxn2kYHaNlsReTkDU3dJjHLGlWgnUCo1KGI/4zChFpccZbqSfnY2yi9Vg0e2dSWJn1+0lg+KQhOT74O2gJf2SbJsQJQIe05PVp6M95PgilBFhmZHadtP+3LbkPDT+Ki4Gnqxvh340zezf5mFZR4XlXZ8HYa8z1psmWvYdRR1L5ex9VBSviaXC6umvJw9qirczZEQ2VJOjlvYH
X-Exchange-RoutingPolicyChecked:
	fddHm65VwaDO+hpweA/EtXlcnN7GpISy5J5+zSChdkP4llv9URSmgLQ6MluyYXxuCcQvGdFRBbppNfoaBHs2ucR7I9pW/2ctvbqXTSmBmVtl+GNx1stijqyc1KGBxwWKpc/bjT1Zdgf38ljxTBfKjQu52Uq8kqMciXpSH/uDkvN3wUqLgCSECLvygtwJWC9qjUz6TNmbStPpUaRrL13jyU4W68sr0fdnWcBl5kKqAqmcjItECxakRdUZezOyoP4X/5pUXn+5FH+aVtdIy8WIWJjpxY9JZ+uqnW/1R+/k+tg8FpzLeRqkMwUQz6/zQdnJW1wr2Vu3AlbJ0H2cX/8c0A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:57:07.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5e4db4-d6bd-4473-fb51-08df08e0ee53
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR19MB997257
X-Proofpoint-GUID: vk6x8cqQeEEQOrwdWsw1jweF_JhRCHOI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5NyBTYWx0ZWRfX2pStTdmq5DLg
 ypytXFdcuR8LB899gydbJkZAvlQ+FAlHzQTRlzlaF7JFsSMGJKee8kMWUFnjT6x3mzuRN4BkBkV
 pcVTvuOhFJv+Aai2Xtll38WAeKxah7yj30esZkCgSZlS2fjskTTy64Z6FYuIbdo+EU9j/sR+mIv
 6u7mgZGkYZijOihgDh21YetONw1v0DFHg9xBZ0G9Bg6OYLd1vapi3AEj+fov9GsvENY+9A29dPp
 KBiCKBSIPQ+R4NVX/3TQ4bA3zeKwFsZ1Iga25O7sBPY2stAUKBxAzUTsB/A+Rwj0quWIGM37Mde
 ypPCvJBYM8CUy0ol5nkEghyLTwr0W15YUSHGDbXfjsCh99YkX0Ke/4rUfDCwWwr8SEWzhQ0PJTO
 Ft4H1UXBBG/9/GBTTs0nwk+23K8QLsltoKhYpJ0dDM/UZ72jpJbQb8DsuCpwstIBLFY1XNl4HlV
 UNyb7sxMaXFatZna+UQ==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a980107 cx=c_pps
 a=eFEjX9j3IP+CJDDqlGDD1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=vhIoYBMz6BEBEa_ewvwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: vk6x8cqQeEEQOrwdWsw1jweF_JhRCHOI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5NyBTYWx0ZWRfX4zncCsELj/aC
 Oi6OMN8urxdWaF6Vwrf7Dt0RExgZdIzJxzFUojUfuzxsx8JD0jNqn3LADMNKPi7P+wv8KJZlCKn
 C5TRsYIxpSG6cNMCORulzHEhF6R+AZE=
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files for Cirrus Logic Smart Amp CS35L41 for an ASUS Zenbook laptop.

Changes from v1:
- Fixed path to symlink

Thanks,

Stefan Binding

The following changes since commit 63fa520f8f7ee44c8ef397d9d6669a835fbe6f34:

  Merge branch 'ath-20260831' into 'main' (2026-09-01 12:23:15 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20260901

for you to fetch changes up to 46cafb6123123cf7ef60a4ac52678b8b7881f376:

  cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA (2026-09-02 11:54:14 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA

 WHENCE | 5 +++++
 1 file changed, 5 insertions(+)

