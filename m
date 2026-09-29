Return-Path: <SRS0=WcIC=HV=opensource.cirrus.com=prvs=1732759d29=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AED4CA5FA5
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2026 14:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F5551F00893; Tue, 29 Sep 2026 14:41:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790692900;
	b=Y0fQbLs+Q/jgPghz338p9b6u772ZZ8PGFwQgBS/lfqwJUJH0TKGYDHPjyio0GcR0s3kt
	 IIyzm1AghOtvwJE2e3hLqLBHCrpsgUI32BusWM+qIrG5v1DpJzJT9kHUSl8ALbx+m9ZEy
	 BLfKvSQiPb9uK8IgBphVktu6fLomcvBNUZ7PArME6tJlI/jpnXR1hxxT0Rh132DGJ8wTS
	 3GpjtejZiObLg6fzcdRFWoGuPgNqigVtPrktf4fFZVWgL2ZUVunv4WcC/AQpuG9mIqiog
	 wIZYaq+SW7vbaZVVer+Mk23aYgTvwGqSN1k4qgiSV16fuW4gAKlXJMcKq4BflJiKjVA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790692900;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=Yn2fGaPIUa1p1J6mxfB4L97Nd44kfc+BsGfDUJEFJ2w=;
	b=MAajhyn2vPHl94OW563yT47CDg4Ko2aHMCnJlmlyj2oI0LTinteV/rdgs7ORiNkkgylD
	 j7OQLLGK+dNsoaIDT3gd6v877jbjsH7lBqjMA9buxOG1L7AjOjEZac9iYcuxSo5Qs4crI
	 J1DDrXOoAu3480zhr7fVwc8LcNBNlhVLs7lhFHFmVJ4EzjeTuM+K9Zz2zRHHqelzK0St5
	 Sqq5L3pknK2ZLnibV6+o0e71gatVWMXkMXBGaVFlxnAK1zWF2ZszrbvShKR6WQ6lzfADl
	 uHthkNDfRpgfee6xS+qauXpiIa4cG7GIVkm6hKMnB9YNhg/7j33JeMr8Cwu4mkdBvjA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="ItwnhS/f";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="jtw7R/ao";
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC2171F000FF
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ItwnhS/f;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=jtw7R/ao
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AC2171F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TEDaWt3443161
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 09:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Yn2fGaPIUa1p1J6m
	xfB4L97Nd44kfc+BsGfDUJEFJ2w=; b=ItwnhS/fNcUi9iNWDKdpFBn/Sq0Pg6/M
	e16FvcijM5E2/Xaaop9bX1fPmF4ITVEgB7TWBm7k2LcepjQDOdTDNOuwf8k0GpVf
	5C6Lsh8EEMpawlihhXssW3eW40utaGgyZ1Buo5idhfk+QVIeY5s9QwLQo92tGn/J
	V2BJfaZL7RjYHkevHIF32wZK0KYxjRwhsVWMWjZr4N73JO6JGhzqvpOlCATBeD/p
	TjvuuBxhQU6iJ/BVGysZOT1Aj+M5cV+W2OORMnBf5YzVf2SxctDPwTB3C1U03Ha5
	I7BqY+RJ07O0FjEK6GyFGmLM1pvo4DG8kPs7HqCBph64XKo2gN2UzA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022134.outbound.protection.outlook.com [52.101.53.134])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gxbf0kxjb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2026 09:41:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3EOTwYkdWaqqMkNX/4pT5EHYLMzuHAJtbPuSvIJ70uVFbgKXdkP/0htwXh0xPILV1jTPmn4oIa7cGMoBmj0uuw+QgImUrfseldzTMQ3r1WX+BC2tH7MaTprLao3nLF4zDlYvoIeOBApVJez3PzID9ouGuTU5MI5T+hEHokLpuW33154nN6/ezgZ0PWFOayaMoPua46KyvH6GAxRAzfBGUAIXTGoxrHDIkUXx8wCM+MV3C5f8q5vQiV6EkkFecjfgJ/huNdDTbjMwkYQcTL/shzVgqyD21f5GhukHye8Zalm+8Vz3TKj2BM8k4aVg80U22+d3LgjFWKnB7vA+yDZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yn2fGaPIUa1p1J6mxfB4L97Nd44kfc+BsGfDUJEFJ2w=;
 b=zEX77guiDlkbfGX9K0eYKjxnFpeCJsuP8huBxFDm1REeFbrV1WWZrDbtkvE43PFzq/bv+UjPGjeF3NFlasehzpytxH+aVYgauNFJ6tgJnPtU6CofwOSSyW+S2to+SpWwngbi2KuJV9CsuIAtZMTgjMybkT9x8ezK93kCbvHU5Rkp+rvD9n0QvsYbEdWmE03pURoiRrOp/bby+QE34W16TKM6OGxkinsglk8OeygGNzyZr4sqds0Fx785E8DbQpLZKGz2fCNQQmGHG19StjP+3tAJicRJQoSAY4mVRnQ0nF9u1d0/q3xZnvd7ZNpSky7/8UU97mY4nJirTHZlW5T1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yn2fGaPIUa1p1J6mxfB4L97Nd44kfc+BsGfDUJEFJ2w=;
 b=jtw7R/aoD5wYWTmBt0a6OmE/JCwzpxGiEtaoCgzpA0sGOzM2LJRjf4BA1Cgqkb8pyU/2MzWnBzWvOye2FjPED9WE8cYmrOCY37iT/D0JuKMmyjnI8Eajryw+k+EbDSjqpkxTXPXDJO0O9GZG31VRK6oVn/abavnjirWyvhMbSzY=
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by SJ0PR19MB6655.namprd19.prod.outlook.com (2603:10b6:a03:44b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 14:41:32 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::3f) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 14:41:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Tue, 29 Sep 2026 14:41:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ED344406544;
	Tue, 29 Sep 2026 14:41:26 +0000 (UTC)
Received: from [198.61.68.159] (LONNCK4V044.ad.cirrus.com [198.61.68.159])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C8BA482254B;
	Tue, 29 Sep 2026 14:41:26 +0000 (UTC)
Message-ID: <6e6ceb25-80b1-44bc-8674-339d273b5908@opensource.cirrus.com>
Date: Tue, 29 Sep 2026 15:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add support for Lenovo Yoga Slim 7 Carbon
 14ACN6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SJ0PR19MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c2e062-1ba0-4ed7-c4cb-08df1e37bf4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|16102099003|18002099003|10067099003|260925021911599003|260925021311599003|260925022911599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	O3gR51CoH3tEgM/NkDduvjPLHdPgKhJnW01Tvzg0/J6w78CCsEW8tYYr850d7kIYEyN7mJrD3Q4FI/vnElxhiNnAd1/Xdhz41ZA3oqkc+OYAZxRd/Qbsr2Kt6cxOQkA/dSmerid2YMixKPNsAu963caKWX98ItKlnn/d3jkiFFqEUKlM+pinh2JJYPuAbPKx2XekdVcW+ZrBdgBaOnQibqAHhUAWXmLRcImyX2QuUpfobk1sneQ1xGX8oDPKeavNxiCl8tGNG2MBXNpXZHtJ+hYS9vg+RnPdQxj5wIbbF9N1hSXCnrJhlNsl8nTA5o0d/8VovRJKSqblhm8hmIx7unEfsF7oGlvq4jaAoa8ZrzXX3dmNDC+docVfg5M7J4un+l60wPCd20RhI25bzznvl0vk/BrxsGR2UIU7A8yg0fYvS55az3Pe/ByZVMoUuUFvVwE0mxEunk38hSTbC+GqFKxEV+Nb9w4qfncjpTo35HIzosrans0eKmJzA3BvYZm6yBowTnegFE4OjA2ZnUPGw2Q1puIKsm2qLFOnfnO+HV/Hya30ap46kq8z3AOeU/ZA5kaEE9+EI2RoF04NTFFUOwAZxpBEE7asOJjzgxixNh9WJVDHpAy+RnQoYiZasR/GVSB4KqBIXbrFlsJJdp85NNMCc77YYOW0iI2WEK3AU/iW84NG+cy503cxrG7/KNmuwlDxpNoAcLGWaax5Osmvdg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(16102099003)(18002099003)(10067099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c4Nj09vU26Oa0vgYa4sXMVcXNmEuUsHCFL6NQIZsKk/6HuNN9xqiq2eIv7PCZoRt4IE1RSOUu+TRDgtXAGdyxGYHDYexx6Ic96Huiz0W8mzQ9eBC7Wjt+osf1cJxipQkAm9rug3w8dMBWR9VAY5P6Ku/bqrkgak0ln177yGO6MnZXFO2X0GHikpE5b9VYOJtpezWv9vXXph47A5Hg+rwILx+Igpi9rTeWYQ6KQ54AhWqCHp28iuopkQCWDC+8Zazy+xtFNwLbvreQlwzDRxVlsw49P12dx/fDE0WAwuXhOVOqvMNkIFnJcOzKKWncaVTte0StBS+iE3tJEmgOUVpwyQLWG7nsiTIaXNuiEFz1Yvf8EUmLIhaahOxgJPso18nR3C9JW2FoR8VhVw521fmBCHo58943kR0ALk4fhWLdJ0xeUVpdu1/VbUZT4xSOG1O
X-Exchange-RoutingPolicyChecked:
	lTvxSkIKUYK/wlJqhkFrevdCa/W6/2++J5yIuEKNuRhRhZ4IDFJx8u3I2j5j6owUTelq9WMD27X9VzJ0YzWOOYj96q8uVGbF1G7TN70tCJcJO1raAmp0Ix0MVr8kTyI0uhlEoQ4uBygEYOizOuq60VwrDVtsYv+s+vT8IpB1Zo/kCWHPw/gEC7jRnnVHwquUMAdrY1ZuVKP8Ktg+GnNmgBQyfRRlAp3UN/wImgIMjmRXF9sHepO5Z8Nw9bKFV0x90MWvdn4uszXtOq1OI1QnhaGT18BfxH2T38yf26BBcW2LEM4k9jS8UkJDTclJ23FhDfdWNvt/Htg+QQA4vRONvQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:41:28.8302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c2e062-1ba0-4ed7-c4cb-08df1e37bf4e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6655
X-Authority-Analysis: v=2.4 cv=GvLXaU1C c=1 sm=1 tr=0 ts=6abbce22 cx=c_pps
 a=sw9tB11567c3hJo8WHKnig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=8nDi3m2UJF4LRBe0DsAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VoTn38ET8cYiDSxlohfmXmew1fMz6Ujh
X-Proofpoint-ORIG-GUID: VoTn38ET8cYiDSxlohfmXmew1fMz6Ujh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OCBTYWx0ZWRfX905UG+0mxzBn
 //9FzcBgcjxLl0UHUT1LOmJLRSPcOY5iDwJsF0/TF+gNz4fNS57wscjL3E/w1dgGyWHatRGrgEQ
 70qHgYdld2eyA3Ai+LunSV53kqJ5eiI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OCBTYWx0ZWRfXylMPXCAWNFj8
 JUW4FeVU7zw3QZ4vSJPxglVfuMUDRIa+i0yszI2TsfbvT5ChiBKfea405Dem8DEGn2WBjLjkso1
 Eoy+k2FsxPdYXWyDajOKq1ZfNJRSm53y+RZ72p3P44W/QkXpUu8PpbQpe/W/mJAuF89Nco7s2aE
 Y8YMl4cRySxFbNPP5spTbTikOrq7LxBTVrsVAYY0qDU7SLYy4er42rnItGt7tuVp34cQR1jdb6/
 w85mpmPFCkxPAt1X+RAURa76UaSvJmHd5vfd7ZXLUYUg9Ikk+E61Z1ozG3Nd9Y1ZK89wD6aezWI
 xK7nYshLxeKVm0YzF1XpvfXAsfR9n0qb68Syh8QlLxTREPSozx4MM4CcTX6IIotcilfm36rPHGy
 AJ2MvAbR9R6QTa91bqQmmG2/lmQk1r9yY7VS49c8NnVHgRnW5N2Qyu2cH6lIPbZbo45jr1IAa6r
 T8cwQ9wfm/25W/P6YLw==
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files for Cirrus Logic Smart Amp CS35L41 for Lenovo Yoga Slim 7 Carbon 14ACN6.

Thanks,

Stefan Binding

The following changes since commit 33b68e2c701198457657c2e656ef9a9cc4272d01:

  Merge branch 'robot/pr-0-1790661570' into 'main' (2026-09-29 08:17:06 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ 20260929-cs35l41

for you to fetch changes up to 268afc81c2da1aeba97cc90dd0205a27b9cc108d:

  cirrus: cs35l41: Add support for Lenovo Yoga Slim 7 Carbon 14ACN6 (2026-09-29 15:27:39 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add support for Lenovo Yoga Slim 7 Carbon 14ACN6

 WHENCE                                       |   3 +++
 cirrus/cs35l41-dsp1-spk-prot-17aa3856-l0.bin | Bin 0 -> 4716 bytes
 cirrus/cs35l41-dsp1-spk-prot-17aa3856-r0.bin | Bin 0 -> 4708 bytes
 3 files changed, 3 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3856-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-17aa3856-r0.bin

