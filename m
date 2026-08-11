Return-Path: <SRS0=9Z2T=GE=opensource.cirrus.com=prvs=968377eeda=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD620C5AC67
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Aug 2026 13:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB5CC1F00A3A; Tue, 11 Aug 2026 13:54:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786456494;
	b=WP16oCpukD74dl10mrHEpDY01bn0SopJLT8QvNR7TVV1DeqQNhZ9Ovk1Ck58PCwETbkk
	 a8mYyxKMpvgscbjqWzfsaklMAvZ8PVTiewrdg8O9fkTyy8ngUxP7l+WXQjCW5YcBIvdvF
	 p6PPnrcfEQlMzKjtqGj3NP4Otj46X3PtRSzobI+69FjS+s7cgLH1E6hvH9WFUUeAXWkeS
	 Bhw6VItz+2+YGbblpyDoQ3mRvqQD71zBLFsC9vOGzRkuetFmNrR8rs9ghuk3byZz5BQbv
	 saDv0Y8cUiKIyY9adeK0zs2qO6cQnHrSOesUjVqdhZNzNlfRIc3rfQa3gsWPon9iQcg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786456494;
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Reason;
	bh=NedBjJ+O0+yucli72WqK0G0fzhqh+WgY2HHgdsP65uM=;
	b=DgSUfv136QoYVahZgfFmhdCqtl0laQpdOurly0hhBZyeBMWpt/KLuLVoc94SxDOkBRFR
	 d2XOvMlcLTOkLONwy+aTvwntwNlp2Wmyyho1tVQpXQJpHUC/2DhaQGaAqy3VX6nJLU/Xs
	 ghItPvhNBMh+EVP5iCqreeMYAkwBtKMJZL+7gho4Ywx8XJNlvMOfP8wBVni4qvF32UaWN
	 g6Z3JHOry/oBsP2UKwJjCp4E6XTiTHa2hSgsY/l3xClZoLpRkzVYLtbLshrOjjRbWbr3k
	 rATngudI26HbkxUzK+/mMFGHzkK5g5B38rcrFM540mRr0eRW8HdoXK/rANUQYkm+f4g==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="O0AlB/AD";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RLVbp1tX;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D85891F000E9
	for <linux-firmware@kernel.org>; Tue, 11 Aug 2026 13:54:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=O0AlB/AD;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=RLVbp1tX
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D85891F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDEqHx1185733
	for <linux-firmware@kernel.org>; Tue, 11 Aug 2026 08:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=NedBjJ+O0+yucli72WqK0G0fzhqh+WgY2HHgdsP65uM=; b=
	O0AlB/ADkHFftbECjq8fHx+lkOSUqIo0Xm8W81pE1hAtLe/YQ9K0jQ+W3zTaVr+H
	l3+rLescgi17dOW8fzU3uUV7/l5S806GYPCUIoBgDnVUrGYTtepIhkImVvYqK4Nk
	2NyF54l1IIZyJqUD9WUjkVTg8l0VJ35uMLHquN+q9DG6Qk73brl7xRLxy7nxBJ/b
	DZiS8y9TqGm6TYkyBBNdAuFTn2AwvlCYe6esbDs4MUzng4nVQrgdOSARQ7vzQ1LF
	oGaZm4H7fsuaMSMPpJ0AY9pggtC3RDiZaU7J70ZLaBsP7eSy3iAFYeJ9Yfo5d96n
	7yhd24s1CIxV+pexd7X/Iw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021082.outbound.protection.outlook.com [40.93.194.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg5f5s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 11 Aug 2026 08:54:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bmbkzlzi4SvZgvEyz9OCsz9NErGNPOZww9XWNbgIoLvhihdDpSL1s9NduCYKvkZwYQ3KbLosAtXaZYuSu0JXFV7r4ZqrQvNlI3s/QZAON+jK9L6Np26+DQTXgmWvnDcXDnZ1AjuISfFaX/d49QcuJ9qe79K2+/ZaRBp49Cdx3P8xKCOF95TIPRZCaRSGmmyE/CwuuB0v3pzMv9R7qMsDDXxhuhlbRgOmWgKpc5NvHj/q6btW5ypP2gDpqqpkXIhXRDBbv1IjBzT1K1J6I93aaxCttZGqf/FpOqwxvDQwkn9tQ4UFJnP3K03RDjz0pk/BcjUTHjP83Bv9DkUGX6dNGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NedBjJ+O0+yucli72WqK0G0fzhqh+WgY2HHgdsP65uM=;
 b=VdIoFO+7cIGjJFuY8sIx8Jf1en6x6aJbm764Fn6S+zpwiWyYU/WL33sGkmoRjjc8qzfIc12qm+hJCoGg7TTrWurcyKIx25LxEb4oXiC75VxPofzSJoK9j2UrPvzl68U0UrTaEpAHnhgdjycuYMsuB+SCgJ3UzG8M0jHBC4Rl5/d3QCXmcWWa3A/90waRHSSAKtuetjff/fQOLxXQhD4tuT0Qp7SYfR8ORiDolmWuu4LDmx4VoTneBC8Zi89DDVcqGHms28icwjRpwgBGerpkL0NNKunVyS0PoJOMXXsf7vUEzTIdNmMdm+E7gNSQ3oXu9crCSrj1T/F6MKUWOb7+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NedBjJ+O0+yucli72WqK0G0fzhqh+WgY2HHgdsP65uM=;
 b=RLVbp1tXQRpkRK0MIHeADpYoyBsHxzzfPBE11F10LO2CwfPuOsr+EjL1wpt6APc4JLoZ161fFYfXzPzDfGVbusCJGJu7fwJnLD79Ntg+NZ9jYKqMMC1XwLAfUnuCrP3Uyf7wFYB061ZYa90XiziE+gtmDgmNBM2rfkkGJI57XxI=
Received: from SJ0PR13CA0058.namprd13.prod.outlook.com (2603:10b6:a03:2c2::33)
 by DM4PR19MB6271.namprd19.prod.outlook.com (2603:10b6:8:a7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 11 Aug
 2026 13:54:47 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a8) by SJ0PR13CA0058.outlook.office365.com
 (2603:10b6:a03:2c2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 13:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 13:54:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AA820406544;
	Tue, 11 Aug 2026 13:54:43 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7DB0582025A;
	Tue, 11 Aug 2026 13:54:43 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell laptops (20260811)
Date: Tue, 11 Aug 2026 14:54:43 +0100
Message-ID: <000801dd2998$f65b76a0$e31263e0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01DD29A1.58202CC0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad0pmOOwMihlQqgOQoaf/4y9f5mENA==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|DM4PR19MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb78017-64d5-41d9-b7fe-08def7b01a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|61400799027|56012099006|10067099003|8096899003|18002099003|16102099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	Bx4/hQbGG1s9LZXblt4cC8HL7KviDl0U6Mj79nGt98vL/x7hWGrUv2oFG8FzAymyh5Op3Oc9NGGMlR75JNJTPIbLdLUw6ZTNQbaJQb9VOOdknkH37diyQzIpMyiuIDtwKlcbVqVkVbPq2bIFIvcENDuvSpIHyxWmrwNh/SCZVfErr4T+iaXqmvCXDhc52T4HAIUkC3/OYNwVi0lBYNR+y3a3V8yxErQ2shGXRKNtdr4mkO77ZNNYkx3DJSo/zRh0kTX646RQ/tVMycr7QPwfkBdhu1E8bFO5IU8liWenFHi0D4UnyKdz45D322J4rBfOgVgB3jlit0I6UMU8EH4PnznfiOuwSfhN5rCe2ujPUeAyEoKfvXxMbn2jA+jd8385lIOGkdExjbyAKU8WjsnTcTNmuO1nySuVavQVRM2Tsv0y+ReVCQgr602e5r8jySdgAHCoLu6c548pXXEW2+3GPKtVKXApKeEhcNr1OfTtG7K5rcqxUnuc2xGrnmVGYkxEM2a3DkpdaLHo35X4VaAhAQiJEHCW+mIGh93tsUbN8NBHCyAx+JUu9XmXhDUAzzZjyamgzVfrifdqR583KfEO2i5wNIPeYcyMOTiI2LtJnJ9/bKzBhrlnL0v9LnWMgV3qeS09ZmU8syylpNfVlzpXE7KojeLgo/gKxNnmxtZgjOmfKkYM9EJuSSCSsSTiiZJQ/8q8C1RLb53Uz6SMSvdDIw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(61400799027)(56012099006)(10067099003)(8096899003)(18002099003)(16102099003)(11063799006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eH6ZZWKrbx7IypyzV14ew9616CIieCzV98j+zsh0uicg6j8vRV1H/+mWGnWORNmClvpej7oJKm0f8iAs1GWAyUqMIZCIEy4U+Eev7XoAu2U6Ycz8arYI5jBEDkOtcwqy81cK/QbOVtzw9Xw5cIMXPphRL8uTigI0/p+f4lRDgYopr0dkmty8QFtFkRH7yJuGVXFFJyM0oC+0EjtiqHam3GLBzTvfJJ45Xk6eZ9pc2JdN0Hj/Ax5umpCCVc1SW04HNr59VCP+Dfy4e80lrfBYEDpC8u8rxuUKTLl4ruVBUPxEutd0ceZJ3ab2z6ZZW4ScCwrKDq4jaQPQ6WAgtA1EzIR3Jr5dyP69khmUMeXpBdJmgVI8+z1SgIQTqeUc06Pe0fl/YJb5RfHMLxFY5WrhnLkdW5gkIoUZrh1JA8fjJJsWKtTi8B6a2V4ddk+p8pdM
X-Exchange-RoutingPolicyChecked:
	QWlKjkj0QzItq8G7yOG3MpQ7lKa1MeX1aTk+eyK46lHyZZoQM4Mfzm5T/hFq+soR+yZgemRPe9/lcmBcSjfNhMT7zywcXGovGDXbDpfCingYNWBAE/7g9gTMuV+tAfw3BAMKzv/H/hlpuYm9u1ZmePaRyIA1XSCugJAHpJtichVCVi13xolXAsU7CKNLRUSAqi8FUZZl10BAkEB1kNNl28H5yKgeA4zeilXo/v0RtnoIP/9JYVDmAzGXLj8JBBVeMZBEx7i53kUXYCQlPuHepOpGb90Mp4dSqWi90av0vdlrrIKi4Xw9Z8++vk/tlNOU4Zsy6y0/wpJ5XHXu2xS1JA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:54:45.6228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb78017-64d5-41d9-b7fe-08def7b01a38
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6271
X-Proofpoint-GUID: Gx8BLm5cuj0mbkefM9Ba2y74lLSKCyhj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX9iTNrkSK1hj1
 CArS9SrR1alb4e/J4OwBM5YzBPS5/N5Z0LBhmEUw44YNb/+b7ll8BNtMx6tMAg0N+Yd2fbYsBzc
 jgrDRywZAP2ngYtURQC5eAV4v55wqmY=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a7b29ac cx=c_pps
 a=A+KY2CRJZE6laZNMCPYSqg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=qVhiSjjGRwXB8dJYy4AA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=5CSy31clKq_aQAcd1uoA:9
 a=FUJ1RLIq4BPm6ioc:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-ORIG-GUID: Gx8BLm5cuj0mbkefM9Ba2y74lLSKCyhj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfXxiIbKOsMIX4H
 E/NxNEMARkW51u2rzGKNcN6x2IA2dPy8/FAOoOZWb6TuJNLkPRRY1/VJNGu19FI0DpGT8M8g56n
 iGX2pYCo3makbee504dMPQzJpkbMEviu3vuIAkBrkm7v0JXxvIhFsk+TbQvpzE+OxGWG9ypmMmZ
 NmYic9/6S/eoPNjPbBBNcMo7fkYLgvXYz86WwNWI5TWX5hqHRJisFzfTzUtUICzwJ2KzAg89YU8
 EOesrtNKdHkC8eT9zbAYWMxan4lgufVEJrd2ap96NhuN6Q0W5/aIVgggFZQe2I6lEWIQOc6x4+k
 m5srchpLb9MxzBsZeMlpDH9RmYjEFj6PBpK2XRdf9vV+AsDoH1H4mWuRIVmWeukhcrqtBBuapcH
 jSZLgMCHf6qNQtj1OceCpxG/p1OAXxaKh77Ev3l5xE9zgwTN+Pxnf3PCtKZVkMmymF4W6lDRzqb
 zFWLAdg2fT4fbCSfLww==
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0009_01DD29A1.58202CC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to add support for the Cirrus smart amplifiers for another couple
of Dell laptops, this is just a set of WHENCE links.

Thanks,

-Simon

 

 

The following changes since commit 2135b2f7714a3a514c989b9728f51f36144cab6f:

 

  Merge branch 'robot/pr-9-1786388085' into 'main' (2026-08-10 18:59:35
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260811-cs35l63

 

for you to fetch changes up to 4cfb1cd751cb5e0d943e79e4240472436255603a:

 

  cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell
laptops (2026-08-11 13:50:02 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell
laptops

 

WHENCE | 24 ++++++++++++++++++++++++

1 file changed, 24 insertions(+)


------=_NextPart_000_0009_01DD29A1.58202CC0
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
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
2135b2f7714a3a514c989b9728f51f36144cab6f:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'robot/pr-9-1786388085' into 'main' (2026-08-10 18:59:35 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260811-cs35l63<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
4cfb1cd751cb5e0d943e79e4240472436255603a:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell =
laptops (2026-08-11 13:50:02 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> WHENCE =
| 24 ++++++++++++++++++++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> 1 file =
changed, 24 insertions(+)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0009_01DD29A1.58202CC0--
