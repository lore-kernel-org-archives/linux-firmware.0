Return-Path: <SRS0=OlbR=GR=opensource.cirrus.com=prvs=96960177e3=stuarth@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F1BC5DF81
	for <linux-firmware@archiver.kernel.org>; Mon, 24 Aug 2026 14:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 692CD1F00A3A; Mon, 24 Aug 2026 14:57:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787583432;
	b=tPuYpu2OKKAM32+wR02d1y4GAmZctaFQ6Hsm1SHrbAvAtwsHjzsSnlhijApe6QBmRGsZ
	 5GBD88zLMTZgVgRULD/WVn+yA3twtZAH029vW3gYVdtoSwrl1H0zzKBQWlLBsOHMprGE6
	 Z4qmkKdSlC2rN7PJbltKeNK1lyRDfe4asFxwV3vqfHzYRyVERsHoEqI0Tduf4i8opPNRr
	 M8kcj5QV0V8RZMQrtuJDVkwXHy4hoFTso++S8REcSs7AzMhJ6hmlYbHvrkypqovXRE1Uz
	 DMH5511Niwg5XQ5hE50+N8+l3SP8JBEE8Nl1NkHb2C9qpdGGiIR8+C7crowBit4EHzg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787583432;
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
	bh=1MB+W0NY8Mgl4dDE+8J+XyCX6bMEpyvdZPBmcKl5ibg=;
	b=1rADgv9wJ+B1RxMzHTchkFOhWlKCeEZMjy/O8aatKiFBbwC+2mVkbhGPBcZU/RUcVSXg
	 hfHIR3CGwaWeyH+ymWsZ733by2yOXPmx9dIOiRnSZtZvyT+JsaQrObCIlL62LC3XyIJ8y
	 75chyfLYyvB+M9Vxmq/ld4rouTKPSZyQ7tBR3Jqp6yHCfD61iOc74ux9yFkepUIzbWoCZ
	 RLH5dB9aPfWYZ4FDbEOLxeTYOujhZNVn1UZUXzA+r/1k6iOfGHoF7BQIXSDa7ZzmaYcUY
	 JVJT5c51QIncTIDhidgo9+vl5/fFclLpRwk89g9dqbtjO7LIqqMwve7dkr591pqWM8A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fdNYSmMd;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VBWsP5vD;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B08D21F000E9
	for <linux-firmware@kernel.org>; Mon, 24 Aug 2026 14:57:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fdNYSmMd;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=VBWsP5vD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B08D21F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ODbXCj2671922
	for <linux-firmware@kernel.org>; Mon, 24 Aug 2026 09:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=1MB+W0NY8Mgl4dDE
	+8J+XyCX6bMEpyvdZPBmcKl5ibg=; b=fdNYSmMd2leJB0FGQVupdMf63CfPWOhA
	xJXfmSCRh2q1aGK54E8HFoE7P6xL61eHUbLeCV+qv0tpmdDgens/uAITESmEVypQ
	pGXI0KHOGtJtQru3OlJo9vYMdcCbnA3SGfa18Ct61x7MYEMTcRgzpaHRm4mKrH9F
	s+Rt8sFGksODZBS72D+MsP9ec5XQdmzRd9ZndW82YShW45+6XeSAvPkN+CUTKY3M
	xDGEGuU7xiCoOYqmWVyFSCyUHL6JbLjtVLvW1B5hnpE9n2LIG2HXXykt9KevACFA
	KniIud/BzHW7vYIjRVrj9DFZ9llf6nMHcdCDdbvpUuOxyS6/HwnTKA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022111.outbound.protection.outlook.com [52.101.43.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g795utnk0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 24 Aug 2026 09:57:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKdSyPFzS06GeObxcKBG9qbPpxgPbmw6gx18bzYKXWvwq4Dz6CTe3Re1ZnKF5dH2VEvlysW2hHmvhWpPVc00OzSjjso8OntAwiT3h/KcTs/vGN+avQtW9zzZUxt8m4Tdwzft8JJiFNBn8luxs5XSdacGS038n47/AUEEFilsYy6obUW3usnV7tyAohDejEM5Ns36PejUwqhalS4hEO2lK683hIGrBLVsbwMr+7QRPZlS5dqn8u51ekvseOvi8DQl4KMcf+wHwQOgPcVmpZ3/GmGClq8NKOqWg/eXSeivmN2UZKCgM0uNt9Ys1yUR7D2UA/mGp3CxY9f72sDw5JxC9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MB+W0NY8Mgl4dDE+8J+XyCX6bMEpyvdZPBmcKl5ibg=;
 b=Nvgi1xG/SC0lOWfl7fILcXeCHPOyfQI346jYj92FJGyHutRL8l+awRkbpAKcfYSfTdn6ERB9ttZhx+HL+FHD0Zxy6mMOijC2mpbjbmYivdJuprKtGjoOWiIbsIaBXu8qkIBxbkQm+mgOZY0jhsgQ337GZXHqXfKwh4+o44DU786UijfK3iqkBg6d5WxTQ1bCo55I5DScEPKwjczkSNnBaeKtX+isfmiRrgxTx2eRFO/ywHAts+rPZSfYWBdKWU+ICk9BI7xBkOwn1/JM3QGvOxqss7tCCfycFpqBOWl2XDz1ZnKNmiyOL9IQ//UtiqoTnNteBnpC7QxP2tSTCXBkIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MB+W0NY8Mgl4dDE+8J+XyCX6bMEpyvdZPBmcKl5ibg=;
 b=VBWsP5vDzvflL21LRp5j5JG0Aa5UaheIrw0bCU0piH4w3/aLkFTtZd8o6Yh3XRfB1M3H0/TT7kUVj2XsoB7NEye3xdzgDZ6DNIrxu75Umobi5cFG2qKOTLa5DSMHss85J/fO33xmTC27G5iqA3TNHpXCArF5HDyEdnRkjBCm8l4=
Received: from SA9PR11CA0006.namprd11.prod.outlook.com (2603:10b6:806:6e::11)
 by EAYPR19MB524090.namprd19.prod.outlook.com (2603:10b6:303:2dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 14:57:01 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:6e:cafe::8f) by SA9PR11CA0006.outlook.office365.com
 (2603:10b6:806:6e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 24 Aug 2026 14:57:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Mon, 24 Aug 2026 14:57:00 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 23FAA406541;
	Mon, 24 Aug 2026 14:56:59 +0000 (UTC)
Received: from [198.90.251.23] (EDIN4WRCFY3.ad.cirrus.com [198.90.251.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1562882254B;
	Mon, 24 Aug 2026 14:56:59 +0000 (UTC)
Message-ID: <b5813b12-dcdf-4418-870f-c331bc62a313@opensource.cirrus.com>
Date: Mon, 24 Aug 2026 15:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stuart Henderson <stuarth@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l54: Add Cirrus CS35L54 firmware
 mappings for an HP laptop (20260824)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|EAYPR19MB524090:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f50d0bc-065f-4530-548a-08df01eff3cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|13003099007|10067099003|56012099006|11063799006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	sLZBc5Y5SvFpRNVFD1ze1jRI9By0b7nBg4FghFG7AFcXJCgQHGRHO4RiwJC84mzerPvn5zzavpcTDqBanU0W+PlOwKGLI5TYcQjyNaGRCgGq8BX1VqgHqATSlaN1qSONS0cOtjSnms0+grJKX7PpZVyu0EP1TWmxEfLluqM6qOXdqLC6zAzbycIcj+ht3094qv2I0O3sXOdKgv2EisG91j3cHgyi0wsFLikSy7m3PqmD+CQYDf6ojTad0cSDBuV8ath+FG1z88gNGZddTNwsNsoS4AlfP+SvHXWywdRx1JkKuedqq/SZAthBdPfMLizuG73CRjYmlk8zIXtMCxwCJZr8ZvgPqPI3aHSjVigj9n/h8EaqljsXQZ2KN+HG+dkfUrZfbmJYS0vwib6/hHkGTIoOnSLVAzO7emzlr/LKVwuJMUHTVQqN3nBuNtWocM14c0m+mcj7D/iJRHNJTHqYSrqGq12OQBcgNO7w06orddwLny5sg18zbclfXRSUlX5aXWuXvBko14X+LsNoIuZzIVUUR+iHneQd2uMsvzSkbCr1EIM3Dx8EidWoroLmbcJb6wdp5fx302Q+rzsJW/1e443UP/qndoRoSoGQ/30iCDn29tuvFpiF/UfmgsPwL1l8p04WlPmvey5SY7PT1PXCJ4Xl9faN+0xsNp7hfCy+XTQ8VUDDTsxoDnTgifFmNWKN6ShNMvSDGCpDC8iREgLyKg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(13003099007)(10067099003)(56012099006)(11063799006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U5qVXIGZiGzcd/NedS5jOhb6F/kF/sGuyiT3gJ722SNAoTem9cVAa8SbHzfs5pxN2n4ImJBu2HxwfW7tKMz2LUOmf079Hu+nG8nmDmUYv0JIfCKE+0arwo3xJaYovbLGOavR97b5V0VAWORdqSk8E7cHiQdjvLqj1lCntEnuQ2bpW24kWsEfgATG4TQ+ogCzX0r4TSF3+VsXpEn+841PNqh1r7kv73KXAZy1ZY6+dT1kAo0pPXGeZIa2hltd01BEfLJ6+uIdbDNP720ZfzH04WihSPDDZjUUHNcLyhqBNQj9zjI5kzvAzF2rp+sh5dy/zzPQKmyycq9SwJX4g4fDhGZNoNAEaOT4Yyn8f+uPNX/achihOX7AZUPQK2K2lS9dYV1prv7NWHlsuzCM/510BpqRtBdE6yHkpDqiEQp2saCY2VdRTG3rzvOTelXZvfAS
X-Exchange-RoutingPolicyChecked:
	Ppn/pgz6mRerhbGitLz9Lb+y7eG2JrN10pzgaeoVvAp6ar5q14nP4zVhgo4mn93Qnhw+UFRrvzKI+VCmE9QczPtkRKzayPGr0fPOwC33tjI2Mx8ruDLGErs2VEUXD3vThc2wBd1vtZNszNJmugkwu0ft2HDSsYFaObM9+pfmXzTnhQnH4UJTm2ENGbATV0tuEl84irdVY3DUcMB1GWPQM+JWQJ86if9GngNEhzznz5tugTF22Yt4UpCetQZpisdDPR70SIIMowmjhkAnGVDI0Imvt3EeY3X/H9o2wih7mK6VYltRpIm/80ElvECQHw3tR0Xfcn76W3faWsXp4gpvXg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 14:57:00.6313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f50d0bc-065f-4530-548a-08df01eff3cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR19MB524090
X-Authority-Analysis: v=2.4 cv=aYhRWxot c=1 sm=1 tr=0 ts=6a8c5bc0 cx=c_pps
 a=Gg7HfhqIPUY1o8E1DfVvqA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=Wqnp5VaeO9nywbhDjq8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX2NOi5xbfVmSF
 s6aq5GhDGkY2PBBX9gOTIobuA3oCRU0s06XrwDbA9PKIuce4G/o9gMBZVwluvkoyEca8pq4z6ym
 8ata58hYsUvMdasPpcZft8Nw3ZNjaByctr87cAwZzxah4rWmylX6BoKHvpZcIsBm3fZ6GxRIqc3
 Qi2dbqiBrz5/QXdeWH+hhALIqqVWvHMJOfhUuI9IulKW4QOmY1g5b+gohYa9NAnmGhRX5jo80i7
 GG4UsIfZjygcwLm7deOJRkyESE+RshEGKobAYwh36B65NOsvp28cQ2aZCw137yOZBGdB0G2EBy/
 /uMda2lKn2RQCW1Hh6MvryzO6qV/jJd3mnyt3aLkWdnaDwxeTNiggIEf9qc6MgvGZ1Ni/uS4Yl/
 OKk7OQJmDFeO/ly2+bF695eZ87K1RuvPOjHSY7a8Qo8IkWjXaSxvrrpnOM3yyyzR0XVvrdfM+v2
 59ZXueyRoOn7qwRhveA==
X-Proofpoint-ORIG-GUID: 7ROF63N6fqSFEKcMeCbCalbkw76AOrA6
X-Proofpoint-GUID: 7ROF63N6fqSFEKcMeCbCalbkw76AOrA6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyNiBTYWx0ZWRfX9ZVlNU/O8NIi
 prG07IX/kNmW5hD397mKXVGCr6MN60c4m61CRZ4TFaXE3PRJhwu2nHdvp2CROZxRSFaZU/Y6Meu
 +wuVFhtFD6dCyuk/bKmK2wSV/K9YiCw=
X-Proofpoint-Spam-Reason: safe

Hi,
I'd like to add support for the Cirrus smart amplifiers in a new HP 
laptop.  In this case, just a few WHENCE symlinks.
Thanks,
-Stu


The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f898:

   Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)

are available in the Git repository at:

   https://github.com/CirrusLogic/linux-firmware.git 20260824-cs35l54

for you to fetch changes up to ca34678b6c470626f7b9d4bd115e33f7e709c302:

   cirrus: cs35l54: Add Cirrus CS35L54 firmware mappings for an HP 
laptop (2026-08-24 14:23:37 +0000)

----------------------------------------------------------------
Simon Trimmer (1):
       cirrus: cs35l54: Add Cirrus CS35L54 firmware mappings for an HP 
laptop

  WHENCE | 5 +++++
  1 file changed, 5 insertions(+)
