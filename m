Return-Path: <SRS0=1GHk=G2=opensource.cirrus.com=prvs=07058f7a52=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCCDC61DD6
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 10:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7422D1F00A3D; Wed,  2 Sep 2026 10:32:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788345131;
	b=uh/WCVMd38dY7pktpKXYcOlAim72GIQM4eKH1HSbmYtL6tOqpJHesAsukQ9Qsn5ifkew
	 rzSuu2pp2PbWzsdROwqgbvXbdj6yvlN1ow0wJqjH9j4LurBCX714sEHbG03NzVfS52oZF
	 zbA+yPgh8z3IyY5g1wbS/HvcefcRLfch97ahNhv5GL1VW8YQ8BtUO8SSSSJngiv9LtDd+
	 W0gt+O+sWgNDpWzJfsAA9boXCaHqv/11756AsYcZgVipMgAZ1D35HhADq7+h+GY+A8Pe3
	 i64mSI+TKKnnSqj4YVg4R56Dsfu0QuCEpC44zZCbwONbjefXHrm6QjuA8hiixTMGIkA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788345131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:List-Id:Cc:References:In-Reply-To:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:X-Mailer:
	 Content-Language:Thread-Index:X-EOPAttributedMessage:
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=fhU0IJb33MG7XOgGJUq+bCP9Z2PSt9ZVaJTseNMHtfc=;
	b=ol5jwio/46pC5/0EKlx2Uzk8ZinQTTfE7LotzT3Ifv392Cvse1g7s9uMtvnN9/a1NFuy
	 dy2E8mbJ+gj7OVfeBO/FO5WJa3kxBmxFJmAwUpqWFML+NYV+8Jz3UkkaDDdyhIYgfDa13
	 yiDDcozStlL1rkKU72bTsr1Ou1/X1UienwdOYvPK0GcRiZgUuSMvaxtx1Y7RF7Lno7U27
	 MLwmsNDcpmSICGHuav5dRy9Qh6l8URkxvxZrjHuNohuFJuEdBiy68hUGm+BJrccr7SMs5
	 BTe9yZsgBExkkb/dgCx7Sz+mqFlFki939xp89FfCFywaKYIHN9I0DFb7gpddUbS6D6A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=B8YOml9m;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=yd2FVvcT;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68E111F00A3A
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=B8YOml9m;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=yd2FVvcT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 68E111F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829UX1W3139166;
	Wed, 2 Sep 2026 05:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=fhU0IJb33MG7XOgGJU
	q+bCP9Z2PSt9ZVaJTseNMHtfc=; b=B8YOml9mMredw9o8wZaCgW4xcD12aFAPp9
	jeF8WHOYfu72AVcnSA75UApYlFK+Gefnf8RlAbqvT9I1Ikzvhl8fgKQC+0PEpxhV
	JanNsQ2yKwAVrLGn+bjd2Y3RT4CcfRXDBGp3M1FOS1u5v07trEC4+Yx+K+F2Bo8D
	Idj67iwaeKIx7zS1/e7+gVMr1Syyqf/fhRwmIr1c0iKVDEH+ThfNhJZUihCnalre
	k69WUkf5sdlqMmf4jTuVE3S3+dz74zGQDvl8woZBeuayxD1DmzADzi0MVscrpXhU
	IrgPbq0qykeUTdXj/6wI7aib8dTrwu8WXyCfpz3U0HkF3yo8KLNQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azhn15012013.outbound.protection.outlook.com [52.102.136.13])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gdunthu2m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 05:32:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYuG8nzFYS1BSnz3ZFXRaY96NrWMPnjvbnmlDtjZDthk1LHyqIPX++199j0waOL28LgWrmcSgC5+e55kRUXN+/C2M/LfqAVHRZtIs6NzDZlRvrdXnUImSyXn65xA0kkUMi0ZbcTwrrvJAzuRzUcltZ4x7FdF2UFWb1NqkeICNFZENiaQWKAQZnhus/luURbzcV5x93YtLDZFKr2wg+2zPHGrFP3hoMKbllikQnx1aW5E9nCuraUYd7M32qvmfQzxHDNMT3dDa2QOoqKnWVAS7/f3gJbqHPS2HPDoDirMTU6M9xPKOfieZn3pFVKGpc1heuHxypHH/XUlQItA9VI5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhU0IJb33MG7XOgGJUq+bCP9Z2PSt9ZVaJTseNMHtfc=;
 b=iHfLOxSLSCc2BUJnGDq1n+PPrFTh9c8g3hjVikCev2rM/pfWP3POp+VHCybCxobPClQ/lpWf64a9/O3EYi5j+BmvR8BPqLLcuUboc+tkJ5JUBJHj/lceacieOioED7PTlnzkh0XM6alCHL0LJExhTAf3/SaubcE6YEyrFO7Kjsyt+3pobBU2rSu2vB8aAxb4uLELsuDYK/VSwsyJG0ghvuotNWoSyYh4iZqIFt+rsdtdLXN2NOqTJzan+9oqpJ987EL8KoyIxu0jXosuEKkCa3qrK1x6B1opbt3+mhLjzi0kSM3CEEcaz3+wDFCg0LyU0GYvIyJvRJ2iSJEnvqnGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhU0IJb33MG7XOgGJUq+bCP9Z2PSt9ZVaJTseNMHtfc=;
 b=yd2FVvcTjmP3Hh6KXA96k8odXwcw2tztInYVOdOPsU/gA3ne150M9gFEIfXBSrFxhqrTHQm+BvEZsZXMMqZgKIuJPWIi20eeKecJU4o1eJvZZzehrfz8CGLeMYrZqgC6+Fmqwn+/93+KlU5VP++io3tRgcSImgpjgv7MWTX5/+Y=
Received: from CH0PR04CA0042.namprd04.prod.outlook.com (2603:10b6:610:77::17)
 by CH9PR19MB9273.namprd19.prod.outlook.com (2603:10b6:610:2db::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Wed, 2 Sep
 2026 10:31:35 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::23) by CH0PR04CA0042.outlook.office365.com
 (2603:10b6:610:77::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 10:31:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Wed, 2 Sep 2026 10:31:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4077406543;
	Wed,  2 Sep 2026 10:31:33 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A9281820247;
	Wed,  2 Sep 2026 10:31:33 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
To: "'Wiza Jalakasi'" <wjalakasi@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: <patches@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
        <linux-firmware@kernel.org>
References: <mtj8kka3.730e0eb0-657f-4b6b-a45a-1a522c9041fa@we.are.superhuman.com>
In-Reply-To: <mtj8kka3.730e0eb0-657f-4b6b-a45a-1a522c9041fa@we.are.superhuman.com>
Subject: RE: cirrus: missing CS35L56 spkid0 tuning for Dell XPS 13 DX13260 (10280e53)
Date: Wed, 2 Sep 2026 11:31:33 +0100
Message-ID: <000b01dd3ac6$39c46210$ad4d2630$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01DD3ACE.9B89B470"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLxw4HNsz6lat8YnSg2mEXFFWUW3LSSAt4Q
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CH9PR19MB9273:EE_
X-MS-Office365-Filtering-Correlation-Id: 5815fde5-e97e-4a9b-c666-08df08dd5d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|34020700016|69100299015|36860700016|7149299003|376014|82310400026|61400799027|6133799003|4133799003|10067099003|16102099003|22082099003|18002099003|11063799006|56012099006|8096899003|5023799004|4076899003|13003099007|12100799066;
X-Microsoft-Antispam-Message-Info:
	rWMeyC/lwOfaP3YvxU30FN7sLkZpCwgQBjSIb/vgoWNWFJGVIhX9nKXBdQZr4p2VOCPIOd8hozF2GHymnTVUZ6HQk+0enLBSqRR/9sKvyVLVsQks+XEqGDZ41VBW0cupV9rYhQuZKfS384b0OtX2yr+XaiJavqTyJfJACS0zwuoFO/lFutDaRhMcSJRT4JuKeTGhrOYNH5OWGnxsT1KbzTY46NqylLRfgrDUDAYwpSIAwiBfbHerznQeddHoVaCstYOIYjvMl8bK4Rp84Jj8MrsomcRAICAIsMVI4MsXtDbiAGL6dXOSInTHM1iZiywogDpZuxUvKBV+iYOWChalLHgpd3Ff5PbcXG9qYr5QPpg6Hj0+JDiiU624N6fa5M426tQ9iPBP/Sw6CTOL7XK5P7ILBDtQScqhowCjkOpMIUMb0q105VUeaWZ/ShMR+hyu3KRGeprb4x48e2Db5Sj+KuSM+0HtovhkDJ2Xqzi3hKOwrEUWo5WMHo/2eO5JrqmMkDPS9amXeyHyDGw1djtFJ3hDSDr75OmmSFowaeiSVgoDaXMhB2OAx+hmcgjjn72qv9GvqTY+nNNjuqrKXmg68uLSbhb7Ngi97/+Emug6XJ/D2n3ffteoLfo43ACrn2Cx/U9g9scwKsvnXqwg+dnXrQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(34020700016)(69100299015)(36860700016)(7149299003)(376014)(82310400026)(61400799027)(6133799003)(4133799003)(10067099003)(16102099003)(22082099003)(18002099003)(11063799006)(56012099006)(8096899003)(5023799004)(4076899003)(13003099007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kEATmF1TfxUsFqE5NT6BYj6agGIWCxNSo7EM8hPBH06MtJWHgQ94OSH/AOUrn+HGuiMdD2dPfss3zX9X4wFogJ6ZZMiyXA9v8bISczwnty7/RQIxez2dKcbqhhiUpmIA5hAEbFyKyFgqaBsNL9ZcsVwbdy4mzD1TOFgH+I08hrDgsN/jdDjkFlvN1jwlfswd/GD+yF6dJq4L3lF61Kz9zdaOst9RhYRTlmNOoHYzUj9AyJY2w+Ccyncjsh8ly1zmTmm136gtBKIBA5NkvAQ8s+gAHrsihKp0oha3nOygGlxBYoise3V6u9WANA1ZFpLPGqDG8Qg7ywbULUeiBKgchbf1Qu81e6Osl35DQxiEaDNjq9G/d9m2quH7CdO4wXq54fnfC3CZLCfY8xVOn1BGzMlehrSqXEVtoWwY9V4HUNOe2er02NLXB1F6vUftC50l
X-Exchange-RoutingPolicyChecked:
	PjqJr1zwvMbH2nogD+npWsZJqXMgwyj3o9nLpXgAEm5hJPTt5ah7o+MqL6tQjTVgjhj5ciMG0M9LyX0cTmnd0+DF9cWLcP3LwzQDVp+zjpCapvG3dBl8JQVrf+3oTNIDvI91SchKU6oKRInQurNm8K6jyHFG6F25douQJXL378nWzcr3oK6RpE2ae0IQqbi//6JSNvhTPN6We5bG3+PCZOq+XX5ZBx7QIg7cAzQw9192E1o6xUdFQey6Cr+8LvF/5ouEnBJ/e13bV3+ea+7aW1qhUkY4yaLt1sz7snixpaVxEoFP+O93PLOBXTWo6YKrs/wdfO2UZedctgPF5jobjA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:31:35.3812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5815fde5-e97e-4a9b-c666-08df08dd5d4f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9273
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX08xXENnKeCN5
 DkGnN1nzgvty8rqW9RF55LtXFErMJEj3mkQOGkNqtQeNUHY9au/Y29hFIw6JwYGB7AIYo0zjZxf
 alR6DeeYmPG7dJnofvNouvqEon6LMUBOV6IBbibK5+id9jukLOJrvTPNXNGhDXmBGWcyTlCjana
 aovtCrbJKRWdHoME/NriykhkBqCuGRyc9MCclToft3yerlgMZ1d9iuSg42ENZo4Y/bdV7uiT/W/
 teyb49jYtkwMiGQhG5Xxj5omsiUzdUk4dvWJZuo+ojBgFTZFhiRC8DMw2t5Ee6LhCW9h4a2boi0
 0+mMvyNkwYSWVJLDiw1rkiZdq7XGlQXLUPSKt1OH5IRyek2QcTqMXTi2JcQjDV6hGJwH8bIiHAm
 0mwV3LWQZ3Ci1lsToe62G8L2nkhZVZry113xeWWJlmm706T4iQXyHrHGArf2o8K/PNhieIxZ4sS
 dG/MlAgJwLaLTh9c8Jg==
X-Authority-Analysis: v=2.4 cv=X4Zi7mTe c=1 sm=1 tr=0 ts=6a97fb22 cx=c_pps
 a=JBO1m3OZybHMqBf15U+9pQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=mTLBnP-4AAAA:8 a=zZ0l9ZY0AAAA:8 a=pGLkceISAAAA:8 a=NsfjQLilyuQkJemAdvMA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=u4XW-m9lbTY4FKuy49kA:9 a=2l8XzKQ_41Vbdf9-:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=c-rzU5R3X941FTS8pE0O:22 a=fSvI1hpYcrsqBpV3U3Mm:22 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX8J6WYoCFM9B4
 0BAcVrI5GpzzIpXcGd27cMLutZysnAKszm2wU6Xq+JiAbyamMc9n0YIfLTp/gGjbYUfTLIqp0Qi
 fa4KuKI969kou0yuwkdxQQ7+VAKRUCU=
X-Proofpoint-ORIG-GUID: jyN9nhB5BJf68o_is567dGpPO3v07BiO
X-Proofpoint-GUID: jyN9nhB5BJf68o_is567dGpPO3v07BiO
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_000C_01DD3ACE.9B89B470
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wiza,

Please create a bugzilla ticket at the below address and CC Cirrus =
Patches (patches@opensource.cirrus.com =
<mailto:patches@opensource.cirrus.com> ) to it, we will investigate the =
issue as soon as we can.

https://bugzilla.kernel.org/

=20

Please attach an acpi dump and a full dmesg to the ticket. You may also =
want to check that your system=E2=80=99s BIOS is updated to the latest =
available.

=20

The firmware tuning files selected by the spkid differentiation include =
specifications of the speaker hardware, the manufacturer has not shared =
details of a spkid0 variant so it=E2=80=99s not a case of simply not =
creating an alias.

=20

Creating a public Bugzilla allows others with the same laptop to find =
relevant information pertaining to this issue.

Thanks,

-Simon

=20

=20

From: Wiza Jalakasi <wjalakasi@gmail.com>=20
Sent: Tuesday, September 1, 2026 11:27 PM
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com; rf@opensource.cirrus.com; =
simont@opensource.cirrus.com
Subject: cirrus: missing CS35L56 spkid0 tuning for Dell XPS 13 DX13260 =
(10280e53)

=20

Hello, Requesting the missing spkid0 CS35L56 tuning for the Dell XPS 13 =
DX13260 (audio subsystem 1028:0e53). Problem ------- linux-firmware =
20260810 ships tuning for this SSID as spkid1/spkid2/spkid3 only: =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid{1,2,3}.wmfw =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid{1,2,3}-amp{l,r}.bin My unit's =
amps report speaker-ID 0 (clean read; no "Failed to read spk-id" or =
"Invalid spkid" in the log), so the driver requests: =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0.wmfw =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0-ampl.bin =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0-ampr.bin These do not exist, =
both amps log FIRMWARE_MISSING, and the speakers are completely silent. =
Hardware: 2x CS35L56 Rev B2 on SPI (OTP1 fw 4.2.1), CS42L43 codec on =
SoundWire, SOF sof-audio-pci-intel-ptl. Kernel 7.2.2-arch1-1 (Arch =
Linux), SOF_SDW_SIDECAR_AMPS quirk applied; amps bind and boot their =
DSP, only the tuning is missing. Kernel log (dyndbg on the cs35l56 =
modules): cs35l56 spi-cs35l56-left: Cirrus Logic CS35L56 Rev B2 OTP1 =
fw:4.2.1 (patched=3D0) cs35l56 spi-cs35l56-left: DSP fwf name: 'b2-dsp1' =
system name: '10280e53-spkid0' cs35l56 spi-cs35l56-left: DSP1: Firmware: =
1a00d6 vendor: 0x2 v4.2.1, 42 algorithms cs35l56 spi-cs35l56-left: =
FIRMWARE_MISSING cs35l56 spi-cs35l56-left: Can't read tuning IDs (right =
amp identical) Evidence that spkid0 should alias the spkid1 tuning =
--------------------------------------------------- This machine =
dual-boots Windows 11, where the speakers work. Inspecting Dell's =
Windows audio package for this SSID (DriverStore FileRepository, =
xucsmeext_0e53.inf): 1. Its tuning files =
b2_bridge_ss{1,2,3}_0e53_{lw,rw}.bin are byte-identical (md5-verified, =
all six files) to linux-firmware's spkid{1,2,3} ampl/ampr bins for =
10280e53, and it carries the same 4.5.9 firmware. 2. The Windows package =
contains no set 0 at all, yet Windows audio works on this unit. Its INF =
resolves the tuning filename from a GPIO read =
(b2_bridge_ss_0e53_lw.bin), so Windows evidently maps this unit's =
reading to ss1. 3. As a local test I symlinked spkid0 -> spkid1 (wmfw + =
ampl + ampr) and the speakers work correctly. This mirrors the spkid0 =
aliasing already present for many other Dell SSIDs in cirrus/. Request =
------- Please add the spkid0 alias (or files) for 10280e53 -- on the =
evidence above a symlink to the spkid1 tuning, but you have the =
authoritative mapping. Happy to test on this hardware. Related distro =
report: https://github.com/omacom/omarchy/issues/9687 This report was =
prepared with the help of an AI assistant from diagnostics gathered on =
the machine. Thanks, Wiza Jalakasi

=20

Warmly,


Wiza Jalakasi

 <https://wiza.jalaka.si> https://wiza.jalaka.si

=20

Sent via Superhuman =
<https://superhuman.com/refer/9o2pqxe0?utm_medium=3Dsignature&utm_source=3D=
product>=20

=20

  =
<https://r.superhuman.com/~kjQcppwTS_nQDGHpk2Vl31UnTvM_MT8DTWkPNsenkdt529=
-RpYu_t6zM0Ex8peEAYprWWhQi3pE0YYroii98G_j0EeuVGxpnnRdKNifh.gif>=20


------=_NextPart_000_000C_01DD3ACE.9B89B470
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><!--[if =
!mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Hi Wiza,<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>Please create a =
bugzilla ticket at the below address and CC Cirrus Patches (<a =
href=3D"mailto:patches@opensource.cirrus.com">patches@opensource.cirrus.c=
om</a>) to it, we will investigate the issue as soon as we =
can.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><a =
href=3D"https://bugzilla.kernel.org/">https://bugzilla.kernel.org/</a><o:=
p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>Please attach an acpi =
dump and a full dmesg to the ticket. You may also want to check that =
your system=E2=80=99s BIOS is updated to the latest =
available.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The firmware tuning =
files selected by the spkid differentiation include specifications of =
the speaker hardware, the manufacturer has not shared details of a =
spkid0 variant so it=E2=80=99s not a case of simply not creating an =
alias.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>Creating a public =
Bugzilla allows others with the same laptop to find relevant information =
pertaining to this issue.<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #E1E1E1 =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'>From:</span><=
/b><span lang=3DEN-GB =
style=3D'font-size:11.0pt;font-family:"Calibri",sans-serif'> Wiza =
Jalakasi &lt;wjalakasi@gmail.com&gt; <br><b>Sent:</b> Tuesday, September =
1, 2026 11:27 PM<br><b>To:</b> linux-firmware@kernel.org<br><b>Cc:</b> =
patches@opensource.cirrus.com; rf@opensource.cirrus.com; =
simont@opensource.cirrus.com<br><b>Subject:</b> cirrus: missing CS35L56 =
spkid0 tuning for Dell XPS 13 DX13260 =
(10280e53)<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hello, =
Requesting the missing spkid0 CS35L56 tuning for the Dell XPS 13 DX13260 =
(audio subsystem 1028:0e53). Problem ------- linux-firmware 20260810 =
ships tuning for this SSID as spkid1/spkid2/spkid3 only: =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid{1,2,3}.wmfw =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid{1,2,3}-amp{l,r}.bin My unit's =
amps report speaker-ID 0 (clean read; no &quot;Failed to read =
spk-id&quot; or &quot;Invalid spkid&quot; in the log), so the driver =
requests: cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0.wmfw =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0-ampl.bin =
cirrus/cs35l56-b2-dsp1-misc-10280e53-spkid0-ampr.bin These do not exist, =
both amps log FIRMWARE_MISSING, and the speakers are completely silent. =
Hardware: 2x CS35L56 Rev B2 on SPI (OTP1 fw 4.2.1), CS42L43 codec on =
SoundWire, SOF sof-audio-pci-intel-ptl. Kernel 7.2.2-arch1-1 (Arch =
Linux), SOF_SDW_SIDECAR_AMPS quirk applied; amps bind and boot their =
DSP, only the tuning is missing. Kernel log (dyndbg on the cs35l56 =
modules): cs35l56 spi-cs35l56-left: Cirrus Logic CS35L56 Rev B2 OTP1 =
fw:4.2.1 (patched=3D0) cs35l56 spi-cs35l56-left: DSP fwf name: 'b2-dsp1' =
system name: '10280e53-spkid0' cs35l56 spi-cs35l56-left: DSP1: Firmware: =
1a00d6 vendor: 0x2 v4.2.1, 42 algorithms cs35l56 spi-cs35l56-left: =
FIRMWARE_MISSING cs35l56 spi-cs35l56-left: Can't read tuning IDs (right =
amp identical) Evidence that spkid0 should alias the spkid1 tuning =
--------------------------------------------------- This machine =
dual-boots Windows 11, where the speakers work. Inspecting Dell's =
Windows audio package for this SSID (DriverStore FileRepository, =
xucsmeext_0e53.inf): 1. Its tuning files =
b2_bridge_ss{1,2,3}_0e53_{lw,rw}.bin are byte-identical (md5-verified, =
all six files) to linux-firmware's spkid{1,2,3} ampl/ampr bins for =
10280e53, and it carries the same 4.5.9 firmware. 2. The Windows package =
contains no set 0 at all, yet Windows audio works on this unit. Its INF =
resolves the tuning filename from a GPIO read =
(b2_bridge_ss_0e53_lw.bin), so Windows evidently maps this unit's =
reading to ss1. 3. As a local test I symlinked spkid0 -&gt; spkid1 (wmfw =
+ ampl + ampr) and the speakers work correctly. This mirrors the spkid0 =
aliasing already present for many other Dell SSIDs in cirrus/. Request =
------- Please add the spkid0 alias (or files) for 10280e53 -- on the =
evidence above a symlink to the spkid1 tuning, but you have the =
authoritative mapping. Happy to test on this hardware. Related distro =
report: <a =
href=3D"https://github.com/omacom/omarchy/issues/9687">https://github.com=
/omacom/omarchy/issues/9687</a> This report was prepared with the help =
of an AI assistant from diagnostics gathered on the machine. Thanks, =
Wiza Jalakasi<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.5pt;color:black'>Warmly,</span><span =
style=3D'font-size:9.5pt;color:#888888'><o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:9.5pt;color:black'><br>Wiza =
Jalakasi</span><o:p></o:p></p><p class=3DMsoNormal><a =
href=3D"https://wiza.jalaka.si" target=3D"_blank"><span =
style=3D'font-size:10.0pt'>https://wiza.jalaka.si</span></a><o:p></o:p></=
p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Sent =
via <a =
href=3D"https://superhuman.com/refer/9o2pqxe0?utm_medium=3Dsignature&amp;=
utm_source=3Dproduct" target=3D"_blank">Superhuman</a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal><img =
border=3D0 width=3D1 height=3D1 style=3D'width:.0083in;height:.0083in' =
id=3D"_x0000_i1025" =
src=3D"https://r.superhuman.com/~kjQcppwTS_nQDGHpk2Vl31UnTvM_MT8DTWkPNsen=
kdt529-RpYu_t6zM0Ex8peEAYprWWhQi3pE0YYroii98G_j0EeuVGxpnnRdKNifh.gif" =
alt=3D" "><o:p></o:p></p></div></div></div></body></html>
------=_NextPart_000_000C_01DD3ACE.9B89B470--
