Return-Path: <SRS0=qDB5=DS=opensource.cirrus.com=prvs=66014fe453=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9600CD5BAC
	for <linux-firmware@archiver.kernel.org>; Thu, 21 May 2026 13:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C75CD1F00A3D; Thu, 21 May 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1779371088;
	b=TuvZutppjtF7nyXdk4U+mVBi16tDT1nXIQaO27vBgwDpwbUNEqgC9T0pJarwcBWjkm0c
	 7nL/3L2bxjAwEfWOwv4K8qAbyG9XvJzus5sNf3RRCs+cz6TcyDcyI+mbWZj4PEC8TXRbT
	 B+dGtvg71WM9TjJviYYxU3y4aT7XIrgQQI/T25WrX2STRQmZfyV/64irPQsfJGadRWkbd
	 2gCRUQ6OsrPPRdJFBkhqeN4hlja7gAHbg/t9rMCqljcE0svdxgcN2nTX1EHT7Ux6ccji1
	 Zj0PmLmAPioCblV4VZJutIeatHb14k3fXDYHJuBHBz012OLzrh4FAyKVtivoAQ9NbXQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779371088;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Reason;
	bh=J67eBZrQSBBncz89WoWHVcdp3OMjQdAuON2vH51XHQU=;
	b=iabA1yf9juaIGOFB8HoUOjxKp+uSsg+coafFuHk40I1M3lZB4F3jAK8o2hBD+M22hmaB
	 zz76Py+6p3M1KaIlTvNzZMSaBcdqgUxIQ3EHDB00QBfZfhlMFHXS2O93kf83McSx64t7j
	 WhnlrvbUTw4LVj27tANwauSVeuPNa4XXGhAX1cd7xjXBInal/HbrcRCgVpbG7IhGtGn0K
	 1/54HUNmlIrZYyC9ywaPUMs/nm8OAQejaVbhHHE+rEj8QSAe03WAi8f0DV5fH52F4tL0h
	 aOLTmDs4Tjp0wcPxJZ8XNv/v0I7mYKwR9v2SKv3T5Ur4fxEW4wvWMn1zfBNCNVHE/KQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=gaQV4ia2;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tDK7J+iX;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8901B1F000E9
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 13:44:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=gaQV4ia2;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=tDK7J+iX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8901B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L3ndkr2712738
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 08:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=J67eBZrQSBBncz89WoWHVcdp3OMjQdAuON2vH51XHQU=; b=
	gaQV4ia2ucAuxxsP8EaKgdIWXij7Kk6JleCxvpWDStSeR++P7agkpGEFSDnHIQl9
	82ySh2pKovqDzYdzZ7tlCHnmMKMhYEaeVICMxtEDOVb5S6863ZR7w93y1Xacn4Ef
	8+k3lPtEDnsflxWtZ4wT/YNbS06p5umvYCpjX0QuFRIUffgergRN8+VihwYICDu0
	k7+bRB+OgQIA9UYOvU0/v33ihbBS9zXoys+bKu41njEsw8OuXXmKVldUXEfX2zTF
	w1zKxNsidD3SH6RwDtGpdoGQoORb7I3sWncLVA1190cagUNkntMhfxiNzcUFPIrp
	i/ez9ZAC9sq9IDUnLgHWqg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021119.outbound.protection.outlook.com [52.101.57.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e93g1jf5a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 08:44:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uo/0Ow2LMKZNixVkjpgKiBRWCGU0Sm4JHzE9TNMbze30jypE+nyWhbSXXyJqlAkGn+bncVH9cKw5rDpdSa5UfoFjQC5WfvsxnCZ0eJ3y/07W8jWZFy9bsUalzY+3mr7JXS+m9jTLHZvnlSAhEQBWBjbkPfVrV+uCDPzqq4nyOGGKpafqf2rm+92IwN5yHMzPIxPvfFPWKTBdhTzPQMUmvFZZRG7GW8KmDrMcnH02Lq2ZwWmic37rsLCaHeMrhoMrO2Ryu2X/S2uZyTBs+ds0/ASzRWd1kiJb2q0atF5L5yf7Ok0g3GyT9BvU5chm+tyUQbF0AEgyUlZEEXUMXMaISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J67eBZrQSBBncz89WoWHVcdp3OMjQdAuON2vH51XHQU=;
 b=us0ZiwI5PA0gKNwTZVJJiZ0Ba+kkhK2KEyiEYNSNbtn/Ivwh34Y8XaHsK1DJ0H5FS8cCvl9NB0BqQDeTXa4v3OiUc/XJvpErhAjaYXIDafGJWOvkLi7xAAERXUEMQq253gKgxJy4Rvk4qxNlAjT0Bi+8dQSc/d4jwFu9k0z1d1zxQj+xy/AxNlOhMDt1k2KboYqI/sRwj2IFdjRD++QV4SyOUECfESWU9UhUJHUKkZCyQkhe7B7gLgnkgzbE9yspNJHiNtkbYEzseTmmBMR3l57I0VV7PWcpoKTbxrupujWLVNKv918OQwZz/NyUHP24HYA64LiAYUE30wLOfgDtaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J67eBZrQSBBncz89WoWHVcdp3OMjQdAuON2vH51XHQU=;
 b=tDK7J+iX1bDCeMeRu4i5FEEUx0KYbXiSBFRCEPe9NoEvE8LoBwKB9wYRnonvYjsRnE/cNi1Dx7xn0ZjwzXQFoPqVeAmTkuTeNf4p94yfUNwlHUfUy6w4omjjgAEZJuGy41CA1h/tj7185P7Z+D+WB2WbXUbxrvVX/GI0s2C+pzY=
Received: from BLAPR03CA0056.namprd03.prod.outlook.com (2603:10b6:208:32d::31)
 by MN0PR19MB6168.namprd19.prod.outlook.com (2603:10b6:208:3cc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 13:44:39 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:32d:cafe::87) by BLAPR03CA0056.outlook.office365.com
 (2603:10b6:208:32d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Thu, 21
 May 2026 13:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 13:44:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1F682406540;
	Thu, 21 May 2026 13:44:37 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F0F18820244;
	Thu, 21 May 2026 13:44:36 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell laptops (20260521)
Date: Thu, 21 May 2026 14:44:36 +0100
Message-ID: <003101dce927$f6f7bee0$e4e73ca0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0032_01DCE930.58BD1140"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdzpJ+XjOdd7XM5KTIexo6cFZlb4Fg==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MN0PR19MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ffcdfc-c7c9-49a2-7f70-08deb73f1a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|13003099007|8096899003|18002099003|16102099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	90Q58sI4J6waEreTQMdNBJgV62Z1GbR8VCmd0K6idbL5ghd+FgiCEWDZh5oBkvK7Rg5aydYiyum6kutF7LUVwIC5EFqNQsDAkMGBpw/6KpoKh6iuzNTvvynUHJwbbmDgBSSiKGdL6j8uZJCOJ0IxusawtU+uYpDwq9Gj9cD7FKPR7wx3EbGpe/ihR4f0lMF/Sb3VZSHEAIwSggj5RdRBjhKeSUzsCiDn2iGs2iR6vU3/bnp1mPdJzCjz1GwXrCyLcxHerwhfnYfihhgWqTeW+OwuRx+5RjmXzgamIK/+HquptYP//eTzmx4TX/q6ZVqNZY3U2uLJn6i4eHun9gnwliYVNwO06oqxQUXE3AXW0CatJRJJivnXisMYI8NTL+bPr/ZvEnP8J+6rriN5gRmNnjAJSXgvKSQVJ2vGIoxsFs2Xvc2q9SP6ISRovQFt+LKS34FD/f/mfLMHRcG3EWJpd58FDqkntdx4tC8NpfHad9NO+7VYwJbPvpzFjZt9OJ9HTqC7DM394XgAqAVEJ37vfZTXei/2IP1PP9xc33EuJLG7MJkVf2X9wV+iNdc1VEGu1A+OSpOuF42ps/oLYpzA3o1lH9nYApfkmYRmka+4Ztm+4eZs/b0eCI9Sq7xD0mm//pZBBU2iqv+30ndayPYzr1V5/j7ARlqyaa/qYm95TT6uQpbC4inzzooj79vhqGPubPklBNMA7oKmf3MsJJUBRTaPSpnF29UatTL5dWFzLCA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(13003099007)(8096899003)(18002099003)(16102099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hpox14mp+o/Fmv8dj9NDJsqK3BwD/5jK2oTh24hk5JMs/f9osu6Jjax+DxLNUcHNdYKPe+H2ffTEUVxK9V5OFYzjaSiI+jIrJSlIwoAnNfc9W/CQdjAtDAfyDBlLLAq0DNA/56q4h759YczPOb7U3nFFNjrZ7AtziEw5XsPoAjqumkAmCWPQQqXjFckCmzU8Rni2jyCxxgAY/JSFGn+udl6YvprBjgLw97MTto14pKwO0DxgXRIRhFMedcwiwcdXhIRgrofw+uOKkp/jUp2px0oClgHhlRXLfXuUE0pxXzXCig/NSmq8EjAuDYdIMeCBZ5Q4+WV5QEJM2dfBZYRPn/L6k9LbrkZhi1BmHesjdirQ4aD+xC+8cVFmCWc9m8cySJiS4GYHWgPDMjaOpD7Qz3OWaiOuYEdmq/AopbEbceWIILrHL5XZDaK11K/iylkO
X-Exchange-RoutingPolicyChecked:
	pQL6sQn3HriLGXZafNddvN9pJqa32biW95d3bOSYndq1F2ABYpjTrPQ8Tp6254NsYmfdPVhGF0zASN1tNS8moUOukOUDMz2gIRKnsKPdxAnTOkOtiUmwg8IkqYwOQPdWYEGmh4od4y4dBPKGuaK8ZrwMkMwJ3zMZRP5ST4tsgbmfVeJiO/w8UChtgx0cROO2h798m7dX8EGmzNwQC2gj1QC+lnGN4e78ENjIImxJLToyertTfka5lv0vF0RSp6Bj1qC1R0+bvbost8QuKihzVkkFk8segt09Xg8+riJ3XNdR7Gw2MFoZgj+G+Xj4wphMY4DmdfOkG/JG/Saq0WXRQw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:44:38.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ffcdfc-c7c9-49a2-7f70-08deb73f1a47
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6168
X-Proofpoint-ORIG-GUID: QNpF7x_DDAnQzGTnafn5GDVFDJlHDkee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzOCBTYWx0ZWRfX2lvaLC7Kreo0
 VBKAuoI55JXUYuzdQ9N6cibauTcfwkmWVD7peasGCvtAWTzVsaACu/OyFRn/JICk8ZCZoYMIPOi
 5rMpuMptITTg0Icz84t5iNul2Fu3tZyF3f6//OepqixpNCZit+EmPEfERZl6mxtLPswCdaMB24D
 ONW4e0U1jRsMWN+jT2HTzzAtoL+cgb2AyLkTG1lkXbataCgtTtNrPebY0eObEgjhe8OA007qit0
 P/pHFDVGTcjE0DinO9qEZa4Kk2RtzXFC0BHMnk+0yxRKXSpaeyQRAAA4kRI0ONXAYaaa0q+rzT8
 VnFWTlGO6coAVtWZ3j0FLye1iuF27ewFX6WzLc0eknDA4szhMbkA1BStRJm59Jr9h+CxphJGiki
 4yI1wuwmnYu4k4RKdxgQ+TfWvKc/GldpaRzzfpZxk/iweAmuDLW09ZJOeLTjodH0pgD4JTd7/7N
 l+fvic7YUtJmVxZx12w==
X-Authority-Analysis: v=2.4 cv=Wrcb99fv c=1 sm=1 tr=0 ts=6a0f0c4e cx=c_pps
 a=iRxRSAF+HohKiaZghI2QEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=87Dk9nXQ6mVkiVKrd6QA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=B5bsoIhRMA7fm2NJtAgA:9
 a=CEJ2vUMyC5tOQBpu:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-GUID: QNpF7x_DDAnQzGTnafn5GDVFDJlHDkee
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0032_01DCE930.58BD1140
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus smart amplifiers for some
Dell laptops.

Thanks,

-Simon

 

The following changes since commit c4e4f2099f32ae642eafb72b4235a196e17446a7:

 

  Merge branch 'main' into 'main' (2026-05-20 13:41:33 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware
20260521-cs35l56-cs35l57-cs35l63

 

for you to fetch changes up to 72a09795db6545946f1ea2d6955c9bfb9e02d89d:

 

  cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell laptops
(2026-05-21 13:32:04 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell laptops

 

WHENCE                                                  |  48
++++++++++++++++++++++++------------------------

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin    | Bin 11516 -> 11532
bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin    | Bin 11504 -> 11520
bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin    | Bin 11516 -> 11528
bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin    | Bin 11504 -> 11520
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin    | Bin 10556 -> 10556
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 11440 -> 0
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin | Bin 11440 -> 11440
bytes

73 files changed, 24 insertions(+), 24 deletions(-)

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin

delete mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin


------=_NextPart_000_0032_01DCE930.58BD1140
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
class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>We&#8217;d like to =
update the firmware for the Cirrus smart amplifiers for some Dell =
laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
c4e4f2099f32ae642eafb72b4235a196e17446a7:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'main' into 'main' (2026-05-20 13:41:33 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> =
20260521-cs35l56-cs35l57-cs35l63<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
72a09795db6545946f1ea2d6955c9bfb9e02d89d:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Update firmware for Cirrus Amps for some Dell laptops =
(2026-05-21 13:32:04 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Update firmware for Cirrus Amps for some Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp; 48 =
++++++++++++++++++++++++------------------------<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin&nbsp;&nbsp;&nbsp; | =
Bin 11516 -&gt; 11532 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin&nbsp;&nbsp;&nbsp; | =
Bin 11504 -&gt; 11520 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin&nbsp;&nbsp;&nbsp; | =
Bin 11516 -&gt; 11528 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin&nbsp;&nbsp;&nbsp; | =
Bin 11504 -&gt; 11520 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin&nbsp;&nbsp;&nbsp; | =
Bin 10556 -&gt; 10556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 11440 =
-&gt; 0 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 73 files changed, 24 insertions(+), 24 =
deletions(-)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> delete mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> delete mode =
100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> delete mode =
100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> delete mode =
100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> delete mode =
100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> delete mode =
100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> delete mode =
100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> delete mode =
100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin<o:p></o:p></span>=
</p></div></body></html>
------=_NextPart_000_0032_01DCE930.58BD1140--
