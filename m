Return-Path: <SRS0=5Q+l=D5=opensource.cirrus.com=prvs=7612cdd9be=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5FBCD6E55
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Jun 2026 14:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B1241F00898; Mon,  1 Jun 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780325838;
	b=qnLWRGDvnTCtgHx6dcSU1py1u+c5DF4qBjqsX3AKUdYxSHZ2dPc/G+M+uDIxMUhQmlbr
	 K4MQqjsh8O3LNemuKfr9X0ayFDnW+fOOWILI3VA+U1p4g4qthuVVRP3QquT6OPO5ta8v7
	 uJ3+qRSe6/a7lLe05zQ84krBHWeLEMgEC/0AU4BekM9E4kefcPv5GFcZcglwCs/5pSKuj
	 ekRRZlR3nF945ZnpE1qGI0qVglCwt/Jp4LIj2ZCC3KNOqSt3WFjqE9FA4SwLkWwyVIn+3
	 yXOeNgIOx9TIkAVrxvrSI2S98dljX9gaz+8yzA5nkcEXgFibFhXtTg02B2K5JDdu0OQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780325838;
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
	bh=s474VN5wvUXUVvDEl5RpmSRC52z0qKaCZQDJbs9uzkA=;
	b=KNJO/Lwd9ywi4BakUJF4WzfBsOh6pvzK1LFYitOnA//fL4lvLowZfEPGY/o/hFyuZ02f
	 V5hOhCaB27XUMpOvWppAO1xZEukF+kR9inN1VDbx2Dz8779i/K1YfrKJR8SSUHKryjJjD
	 3bquUhtwvo387e3qOZ1ZfaaowyzEsFeG5KtofhM9/oxuYIVq/Vt2L5Ltcb2AUyLoQ2nfS
	 sv2pxw85usN6N1ndpLN/K93JQN6v+BO/UoeTnZ0Euhc2l2b813B3hsOgt0lmQpP96EHF6
	 wV6GFSY8SVomzlEXj2XtkpVqJA3CX1FrEX5K1WZ5jyLHh4uoFFYMlWaA+ecL/oZiYrA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="X/NyJrL9";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=w3vAFo2F;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC5011F00893
	for <linux-firmware@kernel.org>; Mon,  1 Jun 2026 14:57:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=X/NyJrL9;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=w3vAFo2F
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BC5011F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651D0d0U2000026
	for <linux-firmware@kernel.org>; Mon, 1 Jun 2026 09:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=s474VN5wvUXUVvDEl5RpmSRC52z0qKaCZQDJbs9uzkA=; b=
	X/NyJrL94W2qAO1G36KL1UkZtjLwPe3mYVwytGbQuq3O5jJp/MQ1RqYQs3ByV/Rp
	NzIFSB4BwfXUelvXoN7l9zpM08JRKAVTPqD/hTHMHBnroM5b+GyvDwo0LoQHQAV/
	H8F+4+dKvUbtPMfjKUmr9zjKCUiJT+JREjaKm1MPgjVew1oSYMo1DpwT5uYCj4GY
	0EKP45KEd43c/dArx8FrNe2/r/Fr1iQO8JrRDvnSiTrhFoWrNjTcSgiTg0+Y+PZ2
	KnzbGi+1ajwlv/ubZm2x963nWvNcBKMsLBCjOwWeQHFu+QNJKMIF6/oO7s6DEGVO
	lQuahO4UwQPlsrL1Mrg5OQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021099.outbound.protection.outlook.com [52.101.57.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4efvagaqtr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 01 Jun 2026 09:57:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m31d6Y2hTpAXbliCAs03DeJFzNd3OihY8cw2B8sD7KBrXaZXRzckt+yb5zoUNtfp+kXMMKPc+TdOM4kQzQQCviF/zLOxebUnjsnHfdtnKPytjU3X2iFBcMA/QbA6Icw9ehXrELPbcP5d012sffF9Fgn1TO57UEgTrghCngtss9BRBOnk9X5xjjIvrOUwRsPLxNJUYb36ga5r9QfYo+NcPeEs7H8XzUU5z255l2LtmZNAgc3j4HtRyTL9vddugZSQcLeQtOIE0ih9PGkNhLAGeZav7XRF5KyV99vep9iw+6ArDzPT0xug/s6mKglidwnNF5TdLpFWkcwOE89GGlGhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s474VN5wvUXUVvDEl5RpmSRC52z0qKaCZQDJbs9uzkA=;
 b=TXJuPuXGIBuAB99bL0JKOkI+Qr2Sjt1/mMx7ltrpNbaYugy2KQmdjZ7PhcdW042A0zc6OD2HB5uFO+l0NIp9sHSZ8x94/+pf7yKtx4LX3Tp7FMQ10BZ/06V3xUUfL6QHha+HP0BV8AgiqHOnafAlId6wVqg1Mb0FmYpLLKDJxMAnPhKZ6tFZgkfnqHj6CXGYsj1NhQ4iC9yuG/3TTZ2X+VYoPZe/GeVgyZSzlCNucQWvd9a118hoN7FYufqrEoZvrZ9qbcTtN2dw2KyCNe1iqrfc27o3nGN1sl1iq4gHPu2Xg00miEDsLyRygt/gHFn0197p8ixOTP1U2REbTRBvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s474VN5wvUXUVvDEl5RpmSRC52z0qKaCZQDJbs9uzkA=;
 b=w3vAFo2Fxfq63M7dJ/hA7ss05SLAx4w+rQjeRgG474Kz7ZXjXs6sR6RSkTs2B2jaVlDf1cfs21lJU2D/ZCaNHvA4hdUGfY02zzBg9YkuRcwqZ1tiVcHd5mvJb4zwZgW3iZWHl30XUhkbY6z7m9rgdr8+sRrDyTRxzX+z2izUFq0=
Received: from SJ0PR13CA0089.namprd13.prod.outlook.com (2603:10b6:a03:2c4::34)
 by SA1PR19MB8927.namprd19.prod.outlook.com (2603:10b6:806:46b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 14:57:05 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::8d) by SJ0PR13CA0089.outlook.office365.com
 (2603:10b6:a03:2c4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Mon, 1
 Jun 2026 14:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 1 Jun 2026 14:57:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 86CC0406540;
	Mon,  1 Jun 2026 14:57:02 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 59C0F820244;
	Mon,  1 Jun 2026 14:57:02 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Add Cirrus firmware and mappings for various laptops (20260601)
Date: Mon, 1 Jun 2026 15:57:02 +0100
Message-ID: <005a01dcf1d6$e7932db0$b6b98910$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005B_01DCF1DF.495831F0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adzx1UQlsYU67nReTzeknYnRK+z/yQ==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|SA1PR19MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c754cb1-6fe0-43e6-c64c-08debfee0b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|82310400026|376014|56012099006|11063799006|18002099003|16102099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	EMbZOpwASmsxPYz+DCrLw+GtnbzyVm4i0aMJtVDvBHl4COqEPsNwm6MpgLbTAd7YR73DtiE4VkunFM4P2waECAcsaWgJT2NB0hH7XTQXOMBE3eM68LpEovMuBrIY5jE1FcUvsxWR11dXIB4EEWLOegpK04DQ5s4snztRrrmS0zP/C9P7y8pl+/EoQxU8u1EvYIGEDhokj2BxHt4kRGoRnojqVv/O5p8H9tgicoE2epHlNnCqLs9nqFTEWcM6+BrTaOPEg4TC05efAn1xbWApVx4rYMzErPZjt0S08/AJNTOgFmhBbroyfwCawO63n9MzJA4LJiFxBlvyFEhvyrIldV/cXVpNWrGWd6+NlWGdrugaPDemKu5VaI+FCyCbzwV7G3R/625DSk7p+p5XXy2PQr8hmt4nEVUqExvfroeVWyLbfrQHn4v8oMWlg1ewbHci0nL6G1nXFr5gp8u+NdZccpNGKkJWvYCeQjS+XXtKqvlNx6nc8sgHXa6PjHPDpSfO0ywf6UdgCGsm4Lk6ApXvW9ovoirIDxEOl2l7kVmH+fjxq+UTvfmujJtrbM6ntnEb9LkZXWsmdxl1SkdJwuw/J4OeqFfx7q/bI82QghE0XryLVV2HSgMmpZa4TGKbm8CUHVZInBRmd53/gXNW0RttlomAqd1d5zgPUqP7lK/zpM/ojARdZ1qs0Y3t2J2IwAwlcRC1BZwzALCiFi+FjH+DmXeOeoN279jmkAHEPxELYrE=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(82310400026)(376014)(56012099006)(11063799006)(18002099003)(16102099003)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mlNrzkJvKgwdez+yhs6TLyNvkKZ8sazspXwcQwZaQ02KYIlETZl+atUP4K7QJrj0Vl1qeYDk8AXd1J9UTOI4q5HSRrO/iyH92Jm9TCy0RChe9cOcb7BLyK0Tm5eAqXumi+WFnN4mcsscx2DetwPK6DjYhhb6+a9vypScUu2W5xv7QZb0siVeZbKUVPo9MqGoaGB+cEXjhxk5VIKpliY4jEqIxMQk+G2lfq5rL7VUJDAeJv5Kdl8YoHROW3kwVEecUlxeku0qc1wEisWn+gduIHh9EUmTljHJELoG2EIlK4JaGouZ3BHaP63MZd2yAA7iYw0fbnGOZ4qmQ419n/eyO9jgZGfU3i+INmPDRdclAW1MDGSgYZdQb3C7ekz8sXb4TfwmOOLeozcjUOMUCU4um2OjfXo6pQAU3ON+pICZSQ8dqMm0e6A8yr46/lmyGvC8
X-Exchange-RoutingPolicyChecked:
	XOr8AEWOXEWbxvQ1hLvVgSFCRMJljtAUQm0Ohxp1ZvrgxO5ZS1HJxPlpq5xjGyP5FROxpSb+QexZoDQCFKgWXGBiCR9vQF4vOfnsJMqA2TCItCwyKXf7p9EjWjjTZk3kte6Z8Dx/j34BLUxo+VmF3CNG6MANwsIyefXEckA7ypPYeMoXCpoNKt20YC2onWDni0oSdjIMIpPgOWz6jCPPrCjWtaY60L8lcQ4FmI2NUWpnvP6qV9+HEx2nSPFQ63S+jG1RbxD63oggA96wTbj9fKQ3ossHNbCaWBN3D9Lj8FVwd8xboX3FSZxTVNgT8vVOm1vYBlwGe6i6x6Q/3r7/TQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:57:04.5230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c754cb1-6fe0-43e6-c64c-08debfee0b74
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8927
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE0OSBTYWx0ZWRfX5Hp31ldn9Fng
 zXmlwiGl0fa4zvY+8TSjpU6Svc/9PBIRWzVlsvuH6BuicnGuHy7RSt1p3ZijZiWkECpKiqxLLOA
 vwBkt8bB725GeOjsxjhDj+xJa+kcPFD6w4Y+Unk01uCiQH9fScC7tPTXJ9UE634p2rW8k/l7amA
 LL5rNU2/pMATHhnpqXwb47EH1teCOo5CaGl++1xAMHL5paqm66ZsZAqs6Dd0ZDO8xq0OkkAb0zq
 ScmE8o7ENo/xCbU8QWTI4tWmx9rHl5NBt+rhB1DNRT6sGxvK+20Z/pPnWhMJgQ8HrkmNp0BuYqO
 0bUWAID+vuSxTe7ZlJSRcuClt4irW+EKPP5M+5+o4e1sCeaVZgi8pzNtyQ1GiWUq8F29xXpcE+v
 kz1DvhpAQ+l8LlRZ6REO/eY72gk+1eoF7UzbwII890ybcffy9chZ3IHq9i8b1kj8odYWaj970Hu
 oQe590gG2t1T9qNBzDA==
X-Proofpoint-GUID: EERe2XAbYgWJcaPqC00gFRZoOZgcEOkN
X-Proofpoint-ORIG-GUID: EERe2XAbYgWJcaPqC00gFRZoOZgcEOkN
X-Authority-Analysis: v=2.4 cv=ddywG3Xe c=1 sm=1 tr=0 ts=6a1d9dc7 cx=c_pps
 a=R6UrSnLJfpfGpNf2BUW/2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=S415V4b3aSnFOSMU258A:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=iO6daxq66SPvm08QEOwA:9
 a=uqz1cRTuK1CuW-Dk:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_005B_01DCF1DF.495831F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

A small series for the first day of June - we'd like to add and update
firmware for the Cirrus smart amplifiers for some Lenovo laptops and add
more firmware links for some Dell laptops.

Thanks,

-Simon

 

The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:

 

  Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260601-cs35l56-cs35l63

 

for you to fetch changes up to 075a812eca30e3e8a21761562584462e40e3c757:

 

  cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for various Dell
laptops (2026-06-01 14:40:04 +0000)

 

----------------------------------------------------------------

Simon Trimmer (3):

      cirrus: cs35l56: Add firmware for Cirrus Amps for a Lenovo laptop

      cirrus: cs35l56: Update firmware for Cirrus Amps for a couple of
Lenovo laptops

      cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for various Dell
laptops

 

WHENCE                                               |  54
++++++++++++++++++++++++++++++++++++++++++++++++++++++

cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampl.bin | Bin 0 -> 11756 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampr.bin | Bin 0 -> 11760 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp1.bin | Bin 11624 -> 11596
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp2.bin | Bin 11624 -> 11596
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp1.bin | Bin 11612 -> 11596
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp2.bin | Bin 11612 -> 11596
bytes

7 files changed, 54 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampl.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampr.bin


------=_NextPart_000_005B_01DCF1DF.495831F0
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
class=3DMsoNormal><span style=3D'font-size:11.0pt'>A small series for =
the first day of June - we&#8217;d like to add and update firmware for =
the Cirrus smart amplifiers for some Lenovo laptops and add more =
firmware links for some Dell laptops.<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
d953ad875636676424a622ab91cab51b97a0f50c:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> =
20260601-cs35l56-cs35l63<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
075a812eca30e3e8a21761562584462e40e3c757:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l63: Add Cirrus CS35L63 firmware mappings for various Dell laptops =
(2026-06-01 14:40:04 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (3):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for a Lenovo =
laptop<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Update firmware for Cirrus Amps for a couple of Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l63: Add Cirrus CS35L63 firmware mappings for various Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
54 =
++++++++++++++++++++++++++++++++++++++++++++++++++++++<o:p></o:p></span><=
/p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampl.bin | Bin 0 -&gt; 11756 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampr.bin | Bin 0 -&gt; 11760 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp1.bin | Bin 11624 -&gt; =
11596 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp2.bin | Bin 11624 -&gt; =
11596 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp1.bin | Bin 11612 -&gt; =
11596 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp2.bin | Bin 11612 -&gt; =
11596 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 7 files changed, 54 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0-ampr.bin<o:p></o:p></span></p=
></div></body></html>
------=_NextPart_000_005B_01DCF1DF.495831F0--
