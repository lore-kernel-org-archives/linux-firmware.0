Return-Path: <SRS0=3oD9=HC=opensource.cirrus.com=prvs=0713dae7aa=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CDCC79F9F
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Sep 2026 15:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F04411F00899; Thu, 10 Sep 2026 15:08:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789052906;
	b=VyzHQ8ZAGIuLBZQjHpYe4wlwt0+zH31UK7Wgm0VeoWLifS2s9OPUW5v4z0fznGPwv5cR
	 GUcKEgiki8OuKSwhlC7XhxXSpn2lc+y2ODTlA/MoA5BmikHjbz4vPkRqILwx1BDkMCMMr
	 cPRi6jrWfIm4RZUqqMB6yLNQbufMXY5wcxNnwXrlq5U3e7lxdGpsMttUZCUUfqpLqkLST
	 cuBjhKqCcQ6uuU7Hx7ZTIaDqQF0bmYTU/Q0ub+tt8tx3qgv4aAuJ6E9Gz4k/QFq5+VhUK
	 TIbF/dZv+JJGk4dSd10azDGNHteseKa4x0DIuvIVe2EzTRY/w/AZe7Js0yUBQeRx/Dw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789052906;
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
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=6R6LoMT7rOYaewD651wE4k6uw6xoHaQ2BU8B54ylIuA=;
	b=gASTInwPEQl0eiPfyRu5WnEnkZTslWlMwi2VkcSoidbAPJrafa3hafeDOC2jv1dBQP0t
	 Jac3LZP6j2Q7XRuDfbdidKPei6AP7no7YhgMgIQU5g2PvcDQVuEnLH/xQtn0XcSGpYLB/
	 1xBbQAYKFDztRm0wTMXMPJkIRRBluTaJvCwUmgAklc6eOpM+Uk76ArgnPKr1HnIOe+30e
	 vnFyk45yx138XGJ6tRK7ck8cvpfUOAwuDCxTbKJUQQsMje4Xgw9aATSYka+EJRLNECQIH
	 6SQfhizNK2kGsWDNPP6jjKw/szab6/Tmn65rFeQ4ZmBNFIro1/y4/sVTG2zJKA+f9Rg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZLYVYwPS;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UfWH7XfP;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43BE41F00898
	for <linux-firmware@kernel.org>; Thu, 10 Sep 2026 15:08:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZLYVYwPS;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UfWH7XfP
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 43BE41F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADVJYu711609
	for <linux-firmware@kernel.org>; Thu, 10 Sep 2026 10:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=6R6LoMT7rOYaewD651wE4k6uw6xoHaQ2BU8B54ylIuA=; b=
	ZLYVYwPSm1x9f0fpGq3k1yPzkmjLoGrtlBzoznBzE1Ie5kZGepyxFzjWsLAHoAdX
	fg1SJxs25nnvJQGMOsamvkeoU2kw1m6wBfVH2WokEhuNiIug7dqR39oF+G5TSDxw
	3EaTjWFhxuj8olfiKy8eXz1n7LR81mJqCIwGbCXD4qgAhh5Mt8Wb+jo7oXnm0Ca1
	1YBB5MNPk9aNBO0apkA3SV3Uq8VTMx5rpHZoVRAzZi4N65RmwOoq0bzRbZ3P1DtF
	Lwpqqz+JGOhn4mclEwl/DcB6JxCiAlNFH3blHHDckP8lQl+TtnQj+X1eJzuOpV7g
	ba5tnK91lm6oE+mR5STw7A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020072.outbound.protection.outlook.com [52.101.61.72])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gkcyp9dpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 10 Sep 2026 10:08:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4+EDdN15uAJasJUn/KxwhRyiaP0uVRETG0waJxah5TO2wGMa4FMGRv/+ZJz2tBw5GebkLpa1cniUuzebcVT+E89tICUEyyNBuPnXzqWQdwpHwfO46qo8ulJJlUNhDiC+3KLGNIDvXOMQ5rwxozNdK30/ZfuY95mSgemiVfEcgUbR+ljlDuH0saGeqPOITQZYbCuj2XOlfMj1ANbOinz2+Oxg1KXHDD1jvmkfGlhgdW5ojA2WJnuoZljH5sfdeLjtm2qr9nNB4Zns2e1q8Gwi2p4E9xxPVz21D+5ShmdachVYTISxlXNAi/FlcSygMNOyC3QhMfQ26RxIC96r8/hGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6R6LoMT7rOYaewD651wE4k6uw6xoHaQ2BU8B54ylIuA=;
 b=kHSpoMsxFQYsY62sePxlpPdJCQf0ZQoLnwSei1VhwXR2iSHBNzI5iP1BUWMpu/u0lcymoDN1sA50s0i5V5UIYmbMtRe4USGUVEsIplGE4Q5IZbOM3KTubM/P5fjPKHgvAasoJPZy8sBIhdU+rlHZ0QTWolu2PJ3VrIzUz62Spwko+5bmMHysxel9aidJfvnGpMUbMEn9Ik8k/Vm1oLTHg57fcrCLg3UlN/ncQbv8j9kcahjZwLTpVNF7el/0kV4gw+aSJV6NVK4HlRBoFcEFpPL5EIH0Yl/jQglHpiSqoW1ugkF2v5136p8giDdJCl+HWa4cdnGzLpox/O4OE466CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6R6LoMT7rOYaewD651wE4k6uw6xoHaQ2BU8B54ylIuA=;
 b=UfWH7XfPq95UVY4K3ZwsJlLv6bE7hjB6ATEkilHetfRgHfOFxTSYjST8IM17EUgDDEoJwDY4sVsSL1gIMPvLauX3cCZKARe+ZAJ940oyHUBk6QuXBJ3eAV11leQO7e3JGVoox7skcU8rpUXskBJn9e8jiLfuzLIOCWJcUTEUTIo=
Received: from SJ0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:a03:2c0::14)
 by BY3PR19MB5155.namprd19.prod.outlook.com (2603:10b6:a03:365::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 15:08:15 +0000
Received: from CO1PEPF00012E84.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::6a) by SJ0PR13CA0009.outlook.office365.com
 (2603:10b6:a03:2c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Thu, 10
 Sep 2026 15:08:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E84.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Thu, 10 Sep 2026 15:08:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 38E41406559;
	Thu, 10 Sep 2026 15:08:11 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 142FA82026C;
	Thu, 10 Sep 2026 15:08:11 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware]   cirrus: cs35l57: Add firmware for Cirrus Amps for a Lenovo laptop (20260910)
Date: Thu, 10 Sep 2026 16:08:10 +0100
Message-ID: <001a01dd4136$31de6200$959b2600$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01DD413E.93A38D50"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad1BNjFpqnPemIWnRJu0eYrqjgqfDg==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E84:EE_|BY3PR19MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bdb74ea-4434-48b4-5026-08df0f4d5562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|56012099006|8096899003|10067099003|11063799006|13003099007|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	/4trF7r2KoFvmF1EIT7yur9FDoRfZTWwVEHciDmxwXReWQpP9RE63vz8ISDlyQ6FZyQbTFqBW9zUjgLnmlwfBB4xsL64U+tdBszEppDTrc3mZk8wSRQo57EgR2B/Ke/EYGwdrEf9+K4cG5tY3c4nRDZALZbkbH3T8txTRqB/UcfSOg1mSRtLGPdQQuOurNUyV3rVqKnX2wCaeeF7+XKuxyIhYZPpEVVTFJcjs2v1bl3Yznigjlb+XCjQW0gGfuRcqztJ18Ra/fgre4xEX4JCrb2fMictIZW78fzEYW19dW0wZqup7cXq0rEkN08VFCEYI0VwJqve2RG6vT20AxHpRK5Y5yLTJckcqPAWusUA2Zt9/WUwIyyQHmpqIAv0XdMs4/BpEYw7X3RNApk/clorUHCUZfGRTu+htg6SqWDNbEevaUGBaZpRAXnTljsI+1X7UEsFWAS7A5FWjyuLjhb8aNEMMl9C+OLPuGwZU5FnE7vwM5+M3G28fRVhDZdbhizYji1eRWs2rDo569bem820nmt+xyehaxGVZCYP4eROPjubIM8DW9F+GQskap8jQ9b2hWQXmuRX0PwYP/kChj8P/wJwP1OPOAtuvlMeYmi8sbQYgih/NaKjtPm6vKLVYCejoJgFIBemS/8nAG34ML6Ty1WjbqyicJRA7y08DfeUPqsLZYtfr0n5Fip2AxhCWq/FaIidK+0Cwf2hxmuu9G/JsA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(56012099006)(8096899003)(10067099003)(11063799006)(13003099007)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t4IPQHDwq8gOegEgFvWWUCRhSiyRAYb2T1qyjk1W2NWwM8AbxAX8KsZLo1m2YYgSPpicWSON6E82srNNnFns2QnchOu7w1d+duGkWp+sX/E3g4zH1T03yHPmlnFasV4MKZ00HFiiESWVJoBlqYxRQKikHxEaSvZ0AdwbpNOwEeOJ6e0iaI+ClQNH5e9D5t0al2KwiGhLAHbVZ81YnDo67o5WLkEKHb0Wwi0i+t/LENz54/+xqZHIe1CrXe7iB9oZgpvKBu1M0n9lGyGtOb7iQMLPxLS72a74aKmVBWTGejRC2NZZWz0bhYMvWtdk2zDd0d/E+tnd18X8u3BPOL4oP82AmlLyJtJ+P7JFvNEVQ+ye8U97SJz78APp3PYFHROnQzagtFy4XN4cPRkwka4nVcG8lvZU2UNmHC2dPkcm7o6xhDxiApYbMLFkjKs7Jb++
X-Exchange-RoutingPolicyChecked:
	CyeM9uplg1d+LcOOa30uClZBtQKa2Y3ufAmilo6D2qbx8CC/Oajgqnt6NyV+PfAW6YUfKqQU1rdbv5n+HrtErdfUM+dWMmcl35Q8QNPX2jPXJy4Akbg0bRzaQnmPiLHfK9diE6tKEG8rS7OWjfF91eLRfxelTgtJ1lmGS8pF3uk4w8qGIIrYmRFuzoONquwqVAAmS5GmHbSavt3yhponJw3mzR9rFa0zd9rDJBbErwHW1VSNHpjs7qzlhjTs0HcKCOnRIsSoajQCzx0OydppdOWmGyoyF2BpcJhN+G0dkFpjqNoSfpdWAs4SiaTU8wD5Fj8qG1RlFsr/9lNEpJqpTA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 15:08:12.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bdb74ea-4434-48b4-5026-08df0f4d5562
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E84.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5155
X-Authority-Analysis: v=2.4 cv=f9Xdl+yM c=1 sm=1 tr=0 ts=6aa2c7e9 cx=c_pps
 a=X6maqUYi4TRmWrc0BQwc/g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=gy6YCTGOSgrDlGbi-rgA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=UIEa0DSmkcGf0bSMRv0A:9
 a=xKO9lH90FF7f8IDb:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-ORIG-GUID: qdxgplt84AbpuItRc-6f3tZ0yMB2t3Jk
X-Proofpoint-GUID: qdxgplt84AbpuItRc-6f3tZ0yMB2t3Jk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX73rCjLDaDhFq
 2nqaMC0mId04moMo2G4CldbGHv3Xuji2nvJKmerVwwrD71zwK9RBHRefBCWrGTJgNGymPi+JI3Q
 JDA0/UZoMLmrPGhcpdvQjO2yF9WcQEFarRzHyvU312QPrOUNBkcQhbNvrOKGQlz8Q7cMGL887BI
 dFSTmoDrRKopmSRao3NuWHPSI7U08GQgfIaRT8iXBVhMV0LgbvjR1ewn7+nYXKZZUQEBsYobGAk
 WGLvzZC9bxzK+xoZMNiT/oU2ETRpaxETI5zCSMyGoe58vQnaxcE00wD6pneA94eYumIg6Pm3+pm
 uBaVZlDEfNu5kiUrUXDH0CvgqowvMwpSuCh7AiE1gyBnJcC3iSn6c0i9MFA3P4EPxxiQZs0t3sI
 N29JHmIieRcNDSOFU0NIm6QoXAx2SFvGcAHZrYZGMAoul0kvLZRBurv7/IE8o+QuIxnrYP48+R7
 kDwQCmMo29/sJybofQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfXw9MgFDnU9qu9
 PYy9XNXl/6eCrxQOiABT11OE5gC1lU942/0g/vwyFrXoNWguMw469Bk71nchqwpSYP5jGTUWywC
 BJjD/2H+rhAiv93ftXXiOuXLxorIojQ=
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_001B_01DD413E.93A38D50
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus smart amplifiers for a Lenovo
laptop.

Thanks,

-Simon

 

The following changes since commit eeccccbe83daf22e1931e3557ba05b2c02427e4e:

 

  Merge branch '20260909-cs35l54-cs35l56' into 'main' (2026-09-10 11:14:56
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260910-cs35l57

 

for you to fetch changes up to 04cc25e90460f438fd8a1d808c3b0526aff264e8:

 

  cirrus: cs35l57: Add firmware for Cirrus Amps for a Lenovo laptop
(2026-09-10 15:02:42 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l57: Add firmware for Cirrus Amps for a Lenovo laptop

 

WHENCE                                        |   6 ++++++

cirrus/cs35l56/CS35L56_Rev4.7.12.wmfw         | Bin 0 -> 40464 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u0.bin | Bin 0 -> 10896 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u1.bin | Bin 0 -> 10896 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u2.bin | Bin 0 -> 10896 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u3.bin | Bin 0 -> 10896 bytes

6 files changed, 6 insertions(+)

create mode 100644 cirrus/cs35l56/CS35L56_Rev4.7.12.wmfw

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u3.bin


------=_NextPart_000_001B_01DD413E.93A38D50
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
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
add the firmware for the Cirrus smart amplifiers for a Lenovo =
laptop.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
eeccccbe83daf22e1931e3557ba05b2c02427e4e:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'20260909-cs35l54-cs35l56' into 'main' (2026-09-10 11:14:56 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260910-cs35l57<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
04cc25e90460f438fd8a1d808c3b0526aff264e8:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l57: Add firmware for Cirrus Amps for a Lenovo laptop (2026-09-10 =
15:02:42 +0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l57: Add firmware for Cirrus Amps for a Lenovo =
laptop<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 ++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev4.7.12.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; | Bin 0 -&gt; 40464 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u0.bin | Bin 0 -&gt; 10896 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u1.bin | Bin 0 -&gt; 10896 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u2.bin | Bin 0 -&gt; 10896 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u3.bin | Bin 0 -&gt; 10896 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 6 files changed, 6 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev4.7.12.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3843-l1u3.bin<o:p></o:p></span></p></div>=
</body></html>
------=_NextPart_000_001B_01DD413E.93A38D50--
