Return-Path: <SRS0=U0mK=B6=opensource.cirrus.com=prvs=5549173876=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316E710D149C
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Mar 2026 11:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E02BAC2BC9E; Mon, 30 Mar 2026 11:00:01 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 501D0C4CEF7
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 10:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 501D0C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U4QacS3392694
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 05:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=SVFeNS+QEPPxvr1asBv+/+KmWTCoEqmH5Aag1S4cxhY=; b=
	UG0iwJ3ph7QeXwfsWwwKdXEp3ULdeQAsjeT6XyRM+lMncwILZAqruTnxH1nnkSId
	m6hltPwagWqVbfoBt6wvP282XXC7RsUJxsCrJWUbb+ZpuwFnwbGb43sueekm2g6z
	wew64TygCMwDaDcjJbJHvsjEWrZdtcSRQp7H1xKAlN5v/bmMnyjAm+Sar9xm3ngg
	Dj2eRyGrBGP21oaXnJM26MMnDwqnOqNcVVLQB22urBvyUuX2ISKn1mXnJwOc8A13
	Bba5QtevlwyWU/tWEX3RQVlqwYGZEEbRNcRgjQU5ehoO3AK9/QhKPItQl1l1lqp1
	PhT26JwbfqcVi2tgKWF0iA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023101.outbound.protection.outlook.com [40.93.196.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d6bdh1q6t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 05:59:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqKOEHkcEMlnPkP8EvNfVVJ+2U3hcQ0Jseq8sUGrkfdt/l8OtYKEz0I1mN75n+uudos4Ysqv+AnAxRd+yFtcWe1YKhgcrIdev+6IvIg7r7fgByk9OnHPyNW6A5vEPrO3xPxX/GIeRk8piLHqWCQH2WUgN2g2hbzWm9gs5dC+w6bGI8+oeL6CRA1SlRocvi0cLaV3nagX7A2L+EXqfUsSthk4MlxIh0URL0WqQJ2pM4ZxgIwbgfBXhbX0lu4+VJyQgO7yTnSc75YACnmCVEi+jq4UNnRqcTx5Lyd154x7E+EQ+UwxQDioxYZDog+hZXUaG18C0Tgwf9Trf8/C5Eo82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVFeNS+QEPPxvr1asBv+/+KmWTCoEqmH5Aag1S4cxhY=;
 b=DRC2x759MFnMWvNszDtIKLMEYXKrxNf1BZQijBPcckNWfscDqpZs9G1zfdHPHlr6NBvIin9ARdruFSeWyvOiYWjf9+heaZhwvUIoTxN+nfR0jQ8FwoU5j05bG9g8Yze3S7SOlq9QaVMfVwL8qEO2IU3MVEZPRMVzQP/kVFFMO1thQ1kxNH6xcIC6/E4/SNIbec+YT2F52wntg6RZ0VkoxPK0NTPVNdkci0f8tfSxOgfQOtUkfAexySXzE+oUv/ubdPQ/4qyZ89XmfBTARu5U73s6kkRhcuBLFNmoQXlt//KnM0PlsuEiOpVdsf1f6dgjfwylStaRVRsXcmaQbTLPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVFeNS+QEPPxvr1asBv+/+KmWTCoEqmH5Aag1S4cxhY=;
 b=twqVD7mVMRKPl0H62RTY3Y/x1ZtzD+H+0YIsRukKQdGmGPANfnfe3G7FgUyrcIGvX1xTWA280jYS4HDAroneqI1UOWzCuEiFnwlcoJBs18yuq+iLeUwwli8rhCiUPR7KAbh2Pt5RpotEHq4gkK+Us1Kh0G/c4SbfRM3cs4SX9nw=
Received: from SJ0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:a03:2c2::35)
 by MN6PR19MB7867.namprd19.prod.outlook.com (2603:10b6:208:46f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 10:59:47 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::c) by SJ0PR13CA0060.outlook.office365.com
 (2603:10b6:a03:2c2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 10:59:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 30 Mar 2026 10:59:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F2A4E40654A;
	Mon, 30 Mar 2026 10:59:44 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C3BEA82024A;
	Mon, 30 Mar 2026 10:59:44 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some Lenovo and ASUS laptops
Date: Mon, 30 Mar 2026 11:59:44 +0100
Message-ID: <002201dcc034$51468240$f3d386c0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0023_01DCC03C.B30C70E0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdzANExNhkX5uNCaSjiUeA1OpmX7ew==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|MN6PR19MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 759730a7-5678-4b9b-a8f7-08de8e4b74d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|61400799027|8096899003|13003099007|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VQ5rHl0mpcEQSxCQhKl0JSmW2roZLYm+XI8rOBG/+yDYt+c+tczi+tn1huLyTRXmR6e6jBLgwHvj4//5cob8melxvJfZ4P3LbQLXeUJxtHjNuiHcCDrVmFt0DP6oLRZP+Flg9gYe+RA5ntIpLImuvabLLHx8+Jc7Hz+2UWzzQLah4ZBL8FV7o38yEneZrr0dluwIFBN4dncbiEVbEUDmBGjayDgnDQIZKOYODGYqF51G1AnF6NBL2F7mWzzLXoZNXsE2ZH2Y4N9K6PYiQyH1MZnpGNTDiVI1PPXjc7TI+CTlR5F1MYPq9ZBA0+rdoh7+SuSJ0xidtf+rOTr6n6DtAPQRP4c10oFoJvyFHSyC2xnECDdGHeD4MCQ5MMSdg8FiiF5jvArsM6GNakyt67+p16Vzr6XwTuuTpQDTp+4McYSGYU9j7hAd5u7FpUkkqWe8e296qRbMStcMuWD+GtIU3LLyiOpO4baMVcq3ka4cDmT5caU8bB3k6k8NNQTbdW4WwkO/P4pojU+tBqCRhxs4Kd8Ml8m60Sgwcih86HPZFOBK57PDmaVLgZ5M+gkAykL/+bL+qTt/XD+bB+nVjkvuyO6kE2FHVZD8GyTIxjeonXo3rxFXyl1zgQp/QcG95pszqxCQwDsWpbu8aAIEc+R/JNRT1dGHWaA0flVUhg8ba8okERu5TwjsfZXKxIe1ko+TDVkOZgjM+nP54R/Z3SEj8m3+uceYqyG17HHFegQLxitRQvWiE9vW5O+uxHc/ct9/GIhRnJNkEj82nAeJkRVzqA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(61400799027)(8096899003)(13003099007)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OdszmKc863rjnMnU0GGJNY02rduIxCS2dGXCYAAFKwPiwSrcYsfuBNTDgtKBb6RcJaZJZMSKzN0zxr43aOqNHr4tQyzHEpviHl0RZ5mqpEqKthkK7ha6sXWjbvSkXpRRvGoTEAlvcjFORtTp9U7XOJ6IHCW09y/qoKPNdEFpjNHqhb32VeSH37PA9OAy78prx1X+JrEC3cdyMm877PfPyEMJOnoOQeT8MLwpMjOjnTnjnp8kgM+mBXsd+tp0byProJti8HzEDewt7P4xtCsFkYBZLZ8M6GGdsF2XzbzjGcpkD/p3I0Sjz7pRf3l/b1tsRDlR7RDyMkueprRej1HmSyDa961KiP/4J4Es7YgRlp5qBGgWFud4hSy3oW/zFJG3w7A5l4mlSGxU7W1EqZ05HO37j4HAvxWoWOr0G2hR9hbiWrx9IrLbMTTRPoZ603+3
X-Exchange-RoutingPolicyChecked:
	WEBVVPr4NXUR7B4B27JgeX6PkeU7l/tHGL3e8IigMYZPRYZKnJRAYM1jbylnRInnHg9B36d/bWUqre5EPPE9pOj8YPlmLsqNJLobZSAtYDrEm5gBvQbGITg9V/tMhfTUkn9nellTUcC3K2YtavhOlcFJmQUBDjynp86iv17C5cp7dOM2HhSkSEh8apOAGrm2HbY5as/DndhW0G7a58DhyYCHlYnz7ID+QxzwJVsuB535N7W4JCmppeUQ3DC4VFVnKzjFCRayEyxTbpOltvvvZabe9nQ7iafxVdBaMXFc8mHs0N4mn+no/YEi6mv8Mk0ICIuzU/gHV4CeGZRN/ACTmA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:59:46.3580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 759730a7-5678-4b9b-a8f7-08de8e4b74d1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB7867
X-Proofpoint-GUID: CvH9iYtxMkC8NuYKaPcdhpdfi2ywiNj6
X-Proofpoint-ORIG-GUID: CvH9iYtxMkC8NuYKaPcdhpdfi2ywiNj6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4NiBTYWx0ZWRfXytpw3xAFYMV9
 Fzi+hDeTZ96ttOaHDJ9uECFj8Ihdrrip5FPzGE7cCHUlXIsimNYnu90JWbCGY77qao0y44EobXS
 twv98sLiJ1/Ye/BToQo2mLdulEhMVhrLQTXusU3YEhzwjOJvgKqrlVPONf4jNiy5IbGQoY3w4rB
 PZZaodUcPxPG5mhosI/GleaBSizRMzonsS+fllXy2YiWP0BDCH2KTTBMWZ07CoSgLQiOtMU2Mhy
 NWFJwUruQme0S22Ww/DUp3Nn9Rnz7MLZtfgUxzscPb96uIgc6HGY2F1tJ+9OUqO6ifMidFcxeXI
 CxhbZQGkxhNophcmULG37aNo7BlrHHiMuBjahF+z74OjDcNAW0c/pwOE5MK/SgHt5XpP9siXjbN
 QXNy5SNiT8HTX8SGunYykmCQ/reiBkAg9zTpoDBjgd+B+0iYmEnn2LFlfpXGoiemkIUNVJiY+Bw
 lJmCr+eG2toLExIUEeA==
X-Authority-Analysis: v=2.4 cv=GK0F0+NK c=1 sm=1 tr=0 ts=69ca57a8 cx=c_pps
 a=8P4KAFraM2L8FVmDPFuExA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=BwnafgVgKJK2bvpt4HsA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=PPPb8S1DveNVis_FlaMA:9
 a=ak1TSchK3oLfCImF:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0023_01DCC03C.B30C70E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I couple of patches today - we'd like to add the firmware for the Cirrus
CS35L56 and CS35L57 smart amplifiers

for some Lenovo and ASUS laptops.

 

Thanks,

-Simon

 

The following changes since commit ecbf7a454b33eddd697114ac008f48f8e18b5810:

 

  Merge branch 'robot/pr-0-1774767912' into 'main' (2026-03-29 20:14:00
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260330-cs35l56-cs35l57

 

for you to fetch changes up to cc2cb17f5ed9ee233273172c601bb1f012551523:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for some ASUS laptops
(2026-03-30 10:54:19 +0000)

 

----------------------------------------------------------------

Simon Trimmer (2):

      cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops

      cirrus: cs35l56: Add firmware for Cirrus Amps for some ASUS laptops

 

WHENCE                                               |  61
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

cirrus/cs35l56-b0-dsp1-misc-10431444-l2u0.bin        | Bin 0 -> 11700 bytes

cirrus/cs35l56-b0-dsp1-misc-10431444-l2u1.bin        | Bin 0 -> 11700 bytes

cirrus/cs35l56-b0-dsp1-misc-10431464-l1u2.bin        | Bin 0 -> 11568 bytes

cirrus/cs35l56-b0-dsp1-misc-10431464-l1u3.bin        | Bin 0 -> 11556 bytes

cirrus/cs35l56-b0-dsp1-misc-10431464-l2u0.bin        | Bin 0 -> 11556 bytes

cirrus/cs35l56-b0-dsp1-misc-10431464-l2u1.bin        | Bin 0 -> 11568 bytes

cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u0.bin        | Bin 0 -> 11720 bytes

cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u1.bin        | Bin 0 -> 11716 bytes

cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u0.bin        | Bin 0 -> 11432 bytes

cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u1.bin        | Bin 0 -> 11432 bytes

cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u0.bin        | Bin 0 -> 11652 bytes

cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u1.bin        | Bin 0 -> 11652 bytes

cirrus/cs35l56-b0-dsp1-misc-10431634-l2u0.bin        | Bin 0 -> 11692 bytes

cirrus/cs35l56-b0-dsp1-misc-10431634-l2u1.bin        | Bin 0 -> 11692 bytes

cirrus/cs35l56-b0-dsp1-misc-10433451-l1u0.bin        | Bin 0 -> 11536 bytes

cirrus/cs35l56-b0-dsp1-misc-10433451-l1u1.bin        | Bin 0 -> 11540 bytes

cirrus/cs35l56-b0-dsp1-misc-10433451-l1u2.bin        | Bin 0 -> 11544 bytes

cirrus/cs35l56-b0-dsp1-misc-10433451-l1u3.bin        | Bin 0 -> 11536 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u0.bin | Bin 0 -> 11768 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u1.bin | Bin 0 -> 11772 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u2.bin | Bin 0 -> 11768 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u3.bin | Bin 0 -> 11772 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u0.bin | Bin 0 -> 11776 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u1.bin | Bin 0 -> 11780 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u2.bin | Bin 0 -> 11776 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u3.bin | Bin 0 -> 11780 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp1.bin | Bin 0 -> 11568 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp2.bin | Bin 0 -> 11568 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp1.bin | Bin 0 -> 11588 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp2.bin | Bin 0 -> 11588 bytes

cirrus/cs35l56/CS35L56_Rev3.12.2.wmfw                | Bin 0 -> 35428 bytes

cirrus/cs35l56/CS35L56_Rev3.13.3.wmfw                | Bin 0 -> 35764 bytes

cirrus/cs35l56/CS35L56_Rev3.13.4.wmfw                | Bin 0 -> 35764 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u0.bin | Bin 0 -> 13500 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u1.bin | Bin 0 -> 13500 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u0.bin | Bin 0 -> 13488 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u1.bin | Bin 0 -> 13488 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampl.bin | Bin 0 -> 12660 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampr.bin | Bin 0 -> 12660 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampl.bin | Bin 0 -> 12664 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampr.bin | Bin 0 -> 12664 bytes

42 files changed, 61 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431444-l2u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431444-l2u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431464-l1u2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431464-l1u3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431464-l2u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431464-l2u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431634-l2u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431634-l2u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10433451-l1u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10433451-l1u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10433451-l1u2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10433451-l1u3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.12.2.wmfw

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.13.3.wmfw

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.13.4.wmfw

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampl.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampr.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampl.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampr.bin


------=_NextPart_000_0023_01DCC03C.B30C70E0
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
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>I couple =
of patches today - we&#8217;d like to add the firmware for the Cirrus =
CS35L56 and CS35L57 smart amplifiers<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for some =
Lenovo and ASUS laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
ecbf7a454b33eddd697114ac008f48f8e18b5810:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'robot/pr-0-1774767912' into 'main' (2026-03-29 20:14:00 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> =
20260330-cs35l56-cs35l57<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
cc2cb17f5ed9ee233273172c601bb1f012551523:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some ASUS laptops (2026-03-30 =
10:54:19 +0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (2):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some ASUS =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
61 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<o:p></o:p><=
/span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431444-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11700 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431444-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11700 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431464-l1u2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11568 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431464-l1u3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431464-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11556 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431464-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11568 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11720 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11716 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11432 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11432 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11652 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11652 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431634-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11692 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431634-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11692 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11536 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11540 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11544 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11536 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u0.bin | Bin 0 -&gt; 11768 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u1.bin | Bin 0 -&gt; 11772 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u2.bin | Bin 0 -&gt; 11768 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u3.bin | Bin 0 -&gt; 11772 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u0.bin | Bin 0 -&gt; 11776 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u1.bin | Bin 0 -&gt; 11780 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u2.bin | Bin 0 -&gt; 11776 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u3.bin | Bin 0 -&gt; 11780 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp1.bin | Bin 0 -&gt; 11568 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp2.bin | Bin 0 -&gt; 11568 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp1.bin | Bin 0 -&gt; 11588 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp2.bin | Bin 0 -&gt; 11588 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev3.12.2.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; =
35428 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev3.13.3.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; =
35764 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev3.13.4.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; =
35764 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u0.bin | Bin 0 -&gt; 13500 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u1.bin | Bin 0 -&gt; 13500 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u0.bin | Bin 0 -&gt; 13488 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u1.bin | Bin 0 -&gt; 13488 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampl.bin | Bin 0 -&gt; 12660 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampr.bin | Bin 0 -&gt; 12660 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampl.bin | Bin 0 -&gt; 12664 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampr.bin | Bin 0 -&gt; 12664 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 42 files changed, 61 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431444-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431444-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431464-l1u2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431464-l1u3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431464-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431464-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-104315d4-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-104315e4-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-104315f4-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431634-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431634-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10433451-l1u3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid0-l0u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3806-spkid1-l0u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3953-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3956-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 cirrus/cs35l56/CS35L56_Rev3.12.2.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.13.3.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.13.4.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid0-l0u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3809-spkid1-l0u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid0-ampr.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampl.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa3821-spkid1-ampr.bin<o:p></o:p></span></p=
></div></body></html>
------=_NextPart_000_0023_01DCC03C.B30C70E0--
