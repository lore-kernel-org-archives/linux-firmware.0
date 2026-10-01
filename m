Return-Path: <SRS0=tK7r=HX=opensource.cirrus.com=prvs=173446e828=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F9CA5FD2
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Oct 2026 15:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 358ED1F00898; Thu,  1 Oct 2026 15:18:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790867905;
	b=x++LOrSKZPtrrrzY2epE14elWeETQopHgVfQDaDKt6+9YB/85xU+eQaHYIKs8mZysj+K
	 65aSmW9e9SdkzUcl6WA7T0RsFx18kwiU5NLIvgNaU6hyImZyjIzpLJrPLS2blKbE2Zxck
	 z6f8TC5pZ9d4bUiTr9C0cSKOiQdYQV9tY8Jj0XHCb784BZVfib95+GzyE3JSLLmKHr2JD
	 Pt0yUdiONYw1l3RmcX+XYRCQnHOVO0FUZq+1Un3dntJ1w49kXxNM1PaUoLn1ZMyIrL3fy
	 z9aAJIYJ0UPUxFUih6fkfXbZnVCZvIglLEb5ErvFdFhZCPGaBKPKKwp4p4dihhlD5fA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790867905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:Content-Type:
	 Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:Cc:
	 List-Id:To:X-Mailer:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=Mo5fL7wHyHr2v5f0+Zu+XLdiCFCV91WfASufpmLBWYY=;
	b=DiI5QiaN5Upx4Qz3r/Qt12RB8+SMLtgRpJwfKUWNURWic7lDkjsEdd7bIMgrdSMTBhcY
	 iRIM/69izeeuuoYmXk5oPn59EduDiV9N9TvqnRShKJ5l69nDQ9+S49tAqZKn2cbC5IipO
	 vv7PWfWdUgMKIdE4j2TIcpZ0HcruspM0aybPzCOTASjcC+IZ+kaRFqMibsV34+uEC70y1
	 Ir3s3cCrM8UPNegx3y6cLOg0H3lpkz1evZCP9T8xOGQVYyq/9Z3ImFU7gtBq+/D4MzGpM
	 f4r2ca9HpLmtxMmwDXu8cqGfVhQuwin00nQUCTpB0sAjzziFkC1VxjfnYXwuGXkBUIQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=akEZR4OR;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jB+wj97l;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9050C1F000FF
	for <linux-firmware@kernel.org>; Thu,  1 Oct 2026 15:18:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=akEZR4OR;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jB+wj97l
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9050C1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691D24SR3843524
	for <linux-firmware@kernel.org>; Thu, 1 Oct 2026 10:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Mo5fL7wHyHr2v5f0
	+Zu+XLdiCFCV91WfASufpmLBWYY=; b=akEZR4OR3EnstckVErxnIeJVErQsCjqN
	r+/5QQrII/8sZn7fu75UG0R/2oOvtxVPyc9WkmM9XKjdbw9wn0JVlSJzlf7gZMSK
	MRHGMbKwVJYYPn2RVgUcozw12RDm7dpVwfBgvclVOh4/WvXLJ8mNADxoURqS3umu
	BcAWi+EvXkhJcOqLnunxNfGlGVvG6h9iLNoHFlbb8MkcTPCzPb20x8/ic/lQordd
	PD4F5ljCtNZF5PSCKKu1yHV5aGU42bGjXqaMBmtHdcw4/oEP/b2ZysSslDfuZJoy
	5ZFB//rYfnlfmEIZ9s9SpJVTx2XkRPf2UZ9FYl6/ya9ATLCsYE7ipw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022131.outbound.protection.outlook.com [52.101.43.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h1gv7gqa0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 01 Oct 2026 10:18:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ch/6rAcIBD2lA61Iyklc1D26Cln5t5NdPDD6tlodhBqVkkYohcFeZo2WHCFVxBVZTKzFxxQTjI46FoiVOGvCicRDV0dwVEJ9AQ0qzszolsAsXAr9B3S1xgRcZ0QLzJ0lpF3c1B5tv2DV4G2oraxtPDFmREGSfK5nHD3i5kRYMq7ScbnUClaxzSoWc60jcVvA3N77cXiBUPmprbIq4CO+8r9ULm9zGLAXQXtFeqPB/yTZ+uf516F4irckWFHgRnDkbXSXOQBywgOwDVyn4lxI0KNO7ceQ73YPrjb+oK14Zv9deEspUfi9Waj3ukX5SHLiA16wDmWviDZRGxPK8PzJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo5fL7wHyHr2v5f0+Zu+XLdiCFCV91WfASufpmLBWYY=;
 b=gdZRxCVU1kDIOXnHRq4TKazuUoNnNQhwD0n0Sk1vjZSSHbvIJxe+uEzZOP/lqGe8AIJfPL1S85QMmHX0HX/3sZmAo0A6o87hEQw9JMZbqkSg9L+BR0EfpUVTqdBMCjgPtYdp7JG8aF+QuRx5X7+ut5IXiEn6IDWAMc0B4iz0spzoCWvdUROq/fe+WHMNE6PhuGMvgbzVOABPBqxlcL6FTQ91h7fLHt+UtOyiiedSqN/t6Dka6ScuMCZCQ6OIVKJWDi5JmtMq89GM+8/bPoNju7AJt/NbGEUCvamyWDrj4hM6mczryDZPHQQjrr0N0aKwo/OltbdauNd/Okfefe962A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo5fL7wHyHr2v5f0+Zu+XLdiCFCV91WfASufpmLBWYY=;
 b=jB+wj97lYPkA4DhMt3B4aND3K1BYOMDsNj3kRKbbC7DAdvfN2FE1X3VpySjcVCuNPWPS22yZUQ321Vdu/eRj7n/vG1n80nzIq8knPJt4lHUrIiFC9tIHDae7ybCuKV8o+iT0WSG2Xj0q4Ai6S03Zqwa8MadipXzI6OJzVXkoug4=
Received: from BL1P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::10)
 by DM3PPF954CD4387.namprd19.prod.outlook.com (2603:10b6:f:fc00::746) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 15:18:04 +0000
Received: from BN3PEPF00022BCF.namprd03.prod.outlook.com
 (2603:10b6:208:2c5:cafe::8e) by BL1P221CA0023.outlook.office365.com
 (2603:10b6:208:2c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 15:18:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BCF.mail.protection.outlook.com (10.167.248.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 15:18:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 554AD406544;
	Thu,  1 Oct 2026 15:18:03 +0000 (UTC)
Received: from smtpclient.apple (unknown [198.90.190.235])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3064082254F;
	Thu,  1 Oct 2026 15:18:03 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: [RESEND PULL v1 linux-firmware] cirrus: cs35l57 cs35l63: Add firmware
 for some Dell laptops (20260930)
Message-Id: <B464DEB2-ECAC-440D-A96B-3B8FC0052B7B@opensource.cirrus.com>
Date: Thu, 1 Oct 2026 16:17:52 +0100
Cc: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCF:EE_|DM3PPF954CD4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 9271d31c-f297-4521-1e7d-08df1fcf309f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|61400799027|376014|18002099003|16102099003|13003099007|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NKJnwRtj56BMXkzWqN8gAsIJR2HNQO3Ilx17DI+ZzaileSp4lF9waorXKsW3wpwkGmJhx/UwLJM58Aef2etiF4m/LbeHDv8jRc/cFsUODaHmamnu16ZQsPtmcfFnNmOm4HsPGtuHANamcb0cO9CaCUXZj8pPYlUo/GZAPZol/D4q8UHXy5aitjlC02nQAxOrkvWgWrbfWVBYzd3uxeuzLZp4iSsz0WDjyvpqfFbFqKvmblifotUmCBQvE0tMQRGI9dyX33xjov3vI3BRMu1laLIuLE8+1K+2yDx77q5kNOr5TZSohiCmqYErWhXAbmKQKn7Mv+ULOoHvAnKoCGum9ZYifesXC9QiNDI8f7tJnWfJfCw0D9x7uG8o9XtnTSURgCp/FqWnNNZj1eyTblJpJJs9MBr0vsCv/QbRCxuZ2ginErLQh/otLk5Tstsl0QD7gi9B6xz1+QotDQ1gWczPjaDaXQXy0tBlewRrOrh3Yd3m5utbwuTYFx0owqno+461XvFoK2NrH+/L9h5lrhnP+k+YltAUa6H0oegrNxtiL8X97+myuo/dT9i6/gf9p0gty7SVuOPOxzn/4hG/ZWYc9gQA19f116aYDpMynGjBFs5AMLe7f5z2y9Uj3ViRh6lcZSmihjNdRmN7u0eLqGBayEJlfbyO0ODDxxVedsk3RmXvbd6YQjNE15WPgJCF5BuySkB0TXDyb7yRRqow1mUvRQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(61400799027)(376014)(18002099003)(16102099003)(13003099007)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o8PL1PHIigZaH0oMUw5xponfWSFhIfDuXqAZLWK1E9XwAopDwZUia0lLVZSL84mU17VRO03SfoeAOeBADxveMjF148AYPG/bh0qHzhb603+JNkyCVEvlqK8znVmsKvAf3TDPlQ2O4tf4QP5mmdF9fV0qdB/TxL/eHi0NJlPHcpZ+S/RW6RUWEfYjKJ5jQMv7+zIQgQYr4XLiVMk2I4PpCWb8uo9gtjKjLCDC5g0rgbagH3Y9ToB1ubg66YoVB8vCwgLRYk48vDVIvHvAekTAjP5/U41d8JiPaITM4CfNWUklwPVUfkyO8UJ1ISBjzlMOcry+/zU6/dVk+6YF2jxFcOsrvmnSO5MUVpzPUrvAmup5XiwXvWeF6Ue95NO/XNR+gjhuzX4mUBdre10Bf/LGrqHJlitvlX+Qn9vKHoRG+ZWinCf4UHPrfmvibD8w/TQD
X-Exchange-RoutingPolicyChecked:
	qXrGU/cPF/vfAjl15JOxPM88SdjXdJF3E/xg22QZ3e7SxhBcdehnwyw4VrtaHeObNOo3xDa/yBeogOlnl266xcejMbP2XXnmOyCfuXOaaaOKyD88YzPe71wy4AYb5VPgfv19uKXNsbaCCdbEgzCU5tjdgUZ1XamBPYdNo3T9O4V9O/fpYvIOPw/i9qBXcHLYYT7hQdcqc82xMVKaYu5IfpaA8FZqq9LtsVFUbTUCsHP11q8E+Z/OefsbfQYgBvEojXzaLtycOqmdXF9A5KZ39q/GDT4nbZVceVH+CMJWuNqQioMZnMbpxKc5Pn/AozvTbT9f3nmhj4kGFsFUekLgzg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:18:04.2201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9271d31c-f297-4521-1e7d-08df1fcf309f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BCF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF954CD4387
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6abe79bf cx=c_pps
 a=WiodiXt0wH02q4ozJLtFAw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=-mhOctSk-lupDXRt30AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX8uttCpJSy5Ns
 ze0nX5ksywPBAusGpnxbljwTD1HJliW9RacJPYAJrVXXyhMaMrNVT9UpdJi6yLL6WV1zg05Gre5
 3VCQ4kqsQ6oqnfcIIg+CPXFJ4K+8tOVFX0O6TcSj/C+6TkVkS4uu40P7hJ6JYDpCO0Ltm8d6B8l
 TESud//QEfIsmwXZBr1F6/7oQ+5UfW4g9x8gZvWBuLJHt8ZD5dXcdwjpSMEQ9VUjhXWVBdJGLRZ
 o7hAOyFrwn6Ck8jddhW+AFXMbuNZh3Y+ryQxrNYVy2ylWGvbijPBUDNTO/Ca0yKjn8nearOlTc/
 6lYl+SlWtbTN8hhZ5nItXcMkIIM4Z0rmLccYEF2tvo6P/MVaTA2xuYauKH0XpCxF5Y4PMyJ/+d0
 59nWJ9XAK497lnZnXcnyuAeLaMIUDX5OQciHurlQ3+sk3whad8VSjZex5J9rOR6IJebWjUeNErT
 xeJqrL3JU/G27+vKy1A==
X-Proofpoint-ORIG-GUID: 1o-O3w1i2U9GxEQeUmtLR-0heEh-nus-
X-Proofpoint-GUID: 1o-O3w1i2U9GxEQeUmtLR-0heEh-nus-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXxkRWVnt1puwL
 Hhy8/H7p+hAAspd28oxy3EOly6jafcKn9Vo6fqb7IQhQezTZ6FCC8gP7QgL6iZOVNZ1d+2qadHm
 Mi5DnzTMxEZLaRIOGWcLGIiUGAhzRLI=
X-Proofpoint-Spam-Reason: safe

Hi,
Seems my original email client decided to do ungodly things, hopefully =
this corrects that and is more intelligible.

I=E2=80=99d like to add support for the Cirrus smart amplifiers for a =
few more Dell laptops
Thanks,
-Simon


The following changes since commit =
33b68e2c701198457657c2e656ef9a9cc4272d01:

 Merge branch 'robot/pr-0-1790661570' into 'main' (2026-09-29 08:17:06 =
+0000)

are available in the Git repository at:

 https://github.com/CirrusLogic/linux-firmware 20260930-cs35l57-cs35l63

for you to fetch changes up to 8d76bcb57a5930197886eadee9bed90d9e0b153d:

 cirrus: cs35l57 cs35l63: Add firmware for some Dell laptops (2026-09-30 =
12:39:41 +0000)

----------------------------------------------------------------
Simon Trimmer (1):
     cirrus: cs35l57 cs35l63: Add firmware for some Dell laptops

WHENCE                                                  |  48 =
++++++++++++++++++++++++++++++++++++++++++++++++
cirrus/cs35l56/CS35L56_Rev4.7.9.wmfw                    | Bin 0 -> 39020 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u1.bin    | Bin 0 -> 12952 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u3.bin    | Bin 0 -> 12952 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u1.bin    | Bin 0 -> 12952 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u3.bin    | Bin 0 -> 12952 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u1.bin    | Bin 0 -> 12952 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u3.bin    | Bin 0 -> 12952 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u1.bin    | Bin 0 -> 12944 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u3.bin    | Bin 0 -> 12944 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u1.bin    | Bin 0 -> 12944 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u3.bin    | Bin 0 -> 12944 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u1.bin    | Bin 0 -> 12944 =
bytes
cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u3.bin    | Bin 0 -> 12944 =
bytes
cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u1.bin | Bin 0 -> 11440 =
bytes
cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin | Bin 0 -> 11440 =
bytes
cirrus/cs35l63/CS35L63_Rev2.5.11.wmfw                   | Bin 0 -> 30888 =
bytes
17 files changed, 48 insertions(+)
create mode 100644 cirrus/cs35l56/CS35L56_Rev4.7.9.wmfw
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u1.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid1-l2u3.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u1.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid2-l2u3.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u1.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee2-spkid3-l2u3.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u1.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid1-l2u3.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u1.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid2-l2u3.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u1.bin
create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280ee4-spkid3-l2u3.bin
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u1.bin
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280edc-spkid0-00-l3u3.bin
create mode 100644 cirrus/cs35l63/CS35L63_Rev2.5.11.wmfw=
