Return-Path: <SRS0=DdFK=BJ=opensource.cirrus.com=prvs=45285bb13e=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE40F417F3
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Mar 2026 15:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 342F9C2BCB0; Mon,  9 Mar 2026 15:15:53 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6191C4CEF7
	for <linux-firmware@kernel.org>; Mon,  9 Mar 2026 15:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E6191C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297UJtf984806
	for <linux-firmware@kernel.org>; Mon, 9 Mar 2026 10:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=3uCRxRBHV8YxhR8Uk+Wtsd6j+MChR74ArtPb6YsfjK0=; b=
	K4C8gidIVb+egJcvUlsE1O+JaAiBh/sTuoI7GpE2AN6aGPx75nmJUYboH6OSqe5/
	qHeYoi/GZBpk8zcw8qMMGmOWs+0uh77OavQP2lWtGWBEltQpc2QIrAaLDhedCYGx
	G6f91sjhaqHvCxhNX+8bufTqEnRHWVYBSD7lSLrJlv1YfWQp8AkSHX4ejDieE6qp
	1fnck3WXgOkwXqhALSsOF6uv6Iad1h48AplgbTSRTaSo/aV0ift55skCft92h+GW
	KFtdzgRLhFMexGWxdFKHcaPaGpdvMDYrnq4G5fItUQ8+RKy4W0NQN/oji6c9mJtp
	KbkfA0Esbw82Gcl/vJuJ7g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023119.outbound.protection.outlook.com [40.93.196.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja49ycs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 09 Mar 2026 10:15:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SU9+NcGu94aPLM0VQoOndbTcipDLlI0LiTs1hbXAAht4uToOFOzKQz1ESk7D8JsYu0KUoQTPcfTfK9kbwI3UrqC3AwWEh2XKqv4KHepjCDIaV1FM13gTneef97H0LZc8CGNHiUnDZ6Mg/4YHvWH/sPAiK4hbVbYRiesdRF+0R0k5hTlnjZ8XKO0wh+6jfURKVg+oBxHnwG6gAzj63uE3awnP8ujn1edBMO9pX8DLRKQO+sxSDFwVtEPyryqp4EiEetZo+5aNLf7GHj8cFP5nSw0aEw2eG6i5LTjtZOe9oAoPShI760XK4/D77ygStg3jnVPrNAHwnF8t9C0ONDkGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uCRxRBHV8YxhR8Uk+Wtsd6j+MChR74ArtPb6YsfjK0=;
 b=VTO5ZTPq8Ma2FopVmpR72uzJlzBOYL+GLU8XWfr6k/fRo0WYcJ4JfFFKmkPpinDWvsPVFwiqqgP26JIfdByBnVTrE3dmPwfMDKl4zJ4F+2QP+i3/F+dl4krRK9Dlfr2pA/V3UFV+Sd4DZWpgYo7QzluAr7Iv6bNB3cpZ4mN0nl70hTxJUHHVQFUUJxJxvSVvNtzfnCRYZLA3VIgMradV7ftQSK20hogJ9gwgpH7n0uEKlQOFQTUoXN1kS7tti/Zki8J368spcdSso+xYbPuleJMsdmza8cu3jLWsXaOjv0seXx7JghLgzjjU7nAruEOIGHfDCNT7VBuGUeW7CIecwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uCRxRBHV8YxhR8Uk+Wtsd6j+MChR74ArtPb6YsfjK0=;
 b=Uc3/MNnDgr/+WTDmW3CTf1D1AsLetbitZviiCALkQRU8p2W9mjNAgeYdAKMTnaq/8BMVKd9Q0JknjeVTnn0QiKLourYX2ur/yM3QQSrano+lmIrSDSi7udpaOHxI88sw501AMwt/DW79sp6s//unVulq+v5ylnot3K3Cgxb3U5U=
Received: from BN0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:408:141::32)
 by DS0PR19MB8490.namprd19.prod.outlook.com (2603:10b6:8:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 15:15:43 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::f8) by BN0PR07CA0011.outlook.office365.com
 (2603:10b6:408:141::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 15:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 15:15:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E3867406540;
	Mon,  9 Mar 2026 15:15:40 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.200.77])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C526E82024B;
	Mon,  9 Mar 2026 15:15:40 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps and Codecs for some Dell laptops
Date: Mon, 9 Mar 2026 15:15:40 -0000
Message-ID: <000401dcafd7$977ccc00$c6766400$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01DCAFD7.977E0480"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adyv12AQxZXSXxqdTa2qqYAeYwNbpg==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DS0PR19MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 926de8f0-fa23-4b26-d187-08de7deebb08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|376014|13003099007|54012099003|8096899003;
X-Microsoft-Antispam-Message-Info:
	hkvkHtl7KEwfPNLGqcM0fQ2fxn7Ud8EhdriJJX0u0nAMzMiyHt0dlwsezfLnJEAQHwgJbLhDHBlyk7wSEaDk+TH0mDsgkyvnBwLmES9Fnp1a173YylQjt6gJk81+rSUEwEQzYmAK+i50DdCRmM4cRUdI/1ZXdX+YF5CybU89CmYkMj6dFYLfbMBqvDP6v1nEUhomFcZivYm9qLCRGgTZohYPsx3WNjcrr37NzGCSE5zcE0rTLNXyoV5P0XUgZ4m9aztDLgPUVFSO0IHKi7EOQKFY3ISFBB+1YzZgEoxhKBJRTfxuIPFHMntA3ViOvSzC4FznqEjqkIcWku3e5zl0ikzhmgwapztjjCyxAkQYS9GGY7/zZzvewEuIPAmxI4MiHAo84V7LOPMF1i4YwAWWuwvyqIpnOhdpRdLYFqAsL1Q39Sv2YZZGvYJs+mzQvcAZqp5Av6MRtmTekkil+WcAytj9Q6HvHCxvF+uE6Q9HZ+Y/B5TFXnLSHpocGQAAkxA/Ul60FiT7ruJBUuuglr7Me4kGetCrKKxeEzYLkeOa18cnxbjrem1cTgJ1R+2s+XVOkUP2xn249xCEI5NYmIJJPFcFL1vwo7VNlvf0n8G2PmKwbR2yrtB23fH650vsouCyIzqkFOYkBF+nm9tIofHfaw2Iz1QTtL/TBIwIYL06wr5QOCZ5KEpDx/e63IRGeiRqmuCkzs7q38z8xYGn3ZXPwKldf1iQckqM6vgcCdncQVg=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(376014)(13003099007)(54012099003)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t/g3NpJ8W62q6xO10KaNwfzlykPI8usaKM1qqk4cLTj0pdgowtKBvjdfdqTv00F4s6kudesdjqRnNZBKJzmhX8T6ULgWWyxsyjYI3lLuGIZHEHABsXA1mZxUCTCJykPgR0dZD2bD9Wr7SD1kmUkPNf5XnB7beFQXfPz/4/5/j8q7vU1uG/yRD971iafZMCSqhiEazXNTlIlFrUITsiof8xV9In8Pfn/eR5+qiozroa7BnxzL/kfhEhtSoq1LaxtTSEx/tSuovE/p3Cmzan2Uw6E3GOMdKts606F/RB3TNoJkVTdfV0/Y29SmST8YP/I7wZZ44zRiEOeRSv0xeMgrFMOKaYrrFGyx6O4wPy4eQz54De3DlmwALwj12Xu7yn60xKE8fCSWOcGxJna/xkxplgbenHqoIkz67l3Eh9DsIv2+ReiUmwtTiaMtqvy8zcKc
X-Exchange-RoutingPolicyChecked:
	lGdoHYfxI9UK96yRB9P7mUxRbNkSIcQrN03JxXUe2D7IWEa2uC8ryOKnBIzON1FqVjrIdN+2cI+lKxH5WkelroFvpPjKv11qNJkH43wjLrIpW+x6QrPHtI+pblQUVefQ4ktCJ7rCkqmDdCmOClJqoAHed4PxNaI+RUwE+SSVCa3v7vtBD5053zaOLd2GcJLVm6CJ7bJzPjJ0GW/KtcOvplkPSdjqNAjOb/wUdweJGI2A5r4yMA5mNnTwIGzE/sSnKRMppBtBAyOmP2sKcDAP6efMhkt18gQ4HVkQJwZOtJwGz1SyG+9E9Z8nNAuZXRs/OHk0oUDFwXUUuPwfS0q03g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:15:42.4664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 926de8f0-fa23-4b26-d187-08de7deebb08
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB8490
X-Proofpoint-ORIG-GUID: zo-qGaA3tuMwJsML7xgBFR2iJ_KlItnd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzNyBTYWx0ZWRfX9e7Qj2n4ufwB
 z8NEvCD8EaL+qUe/KlvytwtjjLBF/nHQCN/QXTngLiJMpQqNlfKZMshtx/UwBdLF9GArEUYx++I
 8rbBAo1aUl4uBIx/kGcQZMyJv0brebeIuZ+5erf+pA+9WHu/8P5trvUgSFP1k1/iMcqoedUiEiw
 t4E9jhl4bTdGh3HEZ6suGcGfimIBpydNZDZscpwdyH86Tot8sVjdxxFQm4O/aGrEWFZTXGUZqjR
 UN+ncJMa32OVGInZMdYRGgVZzXvec09OFDexQAKYDeHzYvZFjTzQUxnQsejsLRhfnigO6WnC5/V
 JR26hh0+aIUd84JF/oDF7yoiriU7JMX8X16C75FHYoElqklXYjj5L5l0ymRPpr3xU6vA1nUF1Bh
 25nKQ95l5SlvI6d9Ene85Jn7ZfPoaXx6RTHfp1rnXpmOIZ0G72YTNU2sdQbcJLqSgE2UcnpCXcF
 cSC0+bBKfaCppWHOtmA==
X-Proofpoint-GUID: zo-qGaA3tuMwJsML7xgBFR2iJ_KlItnd
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69aee424 cx=c_pps
 a=SNRzDqNuYCMO/bT9QdJRMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=d-lohF2T1sOpDvwn4ugA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=QHh5SagpRDpqhWqmMsAA:9
 a=pYhyuy5AFfOhGktf:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0005_01DCAFD7.977E0480
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I couple of patches today - we'd like to add the firmware for the Cirrus
CS35L63 smart amplifier and CS42L45 smart codec for some Dell Laptops.

Thanks,

-Simon

 

The following changes since commit b3929cfcd543c4f388c4930175f442be94bbcf3b:

 

  Merge branch 'lenovo-fw-rename' into 'main' (2026-03-09 14:21:13 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ 20260309-cs35l63-cs42l45

 

for you to fetch changes up to 21d670224ad1f8ab2956243c0b381eed40338b45:

 

  cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Dell laptops
(2026-03-09 15:08:59 +0000)

 

----------------------------------------------------------------

Maciej Strozek (1):

      cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Dell laptops

 

Simon Trimmer (1):

      cirrus: cs35l63: Add firmware for Cirrus CS35L63 for various Dell
laptops

 

WHENCE                                                  | 361
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++++++++++++++++++++++++++

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw                    | Bin 0 -> 28676
bytes

52 files changed, 361 insertions(+)

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin

create mode 100644 cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw


------=_NextPart_000_0005_01DCAFD7.977E0480
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
CS35L63 smart amplifier and CS42L45 smart codec for some Dell =
Laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
b3929cfcd543c4f388c4930175f442be94bbcf3b:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'lenovo-fw-rename' into 'main' (2026-03-09 14:21:13 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> =
20260309-cs35l63-cs42l45<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
21d670224ad1f8ab2956243c0b381eed40338b45:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Dell laptops =
(2026-03-09 15:08:59 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Maciej Strozek =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs42l45: Add CS42L45 SDCA codec firmware for Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>Simon =
Trimmer (1):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l63: Add firmware for Cirrus CS35L63 for various Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; | 361 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | Bin 0 -&gt; 28676 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> 52 =
files changed, 361 insertions(+)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid0-02-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid2-01-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-01-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1a-spkid3-02-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid0-01-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid1-01-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid2-01-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1c-spkid3-01-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid0-06-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid1-06-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid2-06-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e1e-spkid3-06-l3u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid0-00-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2b-spkid1-00-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid0-00-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e2c-spkid1-00-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63/CS35L63_Rev2.5.7.wmfw<o:p></o:p></span></p></div></body></=
html>
------=_NextPart_000_0005_01DCAFD7.977E0480--
