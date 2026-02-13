Return-Path: <SRS0=uFuW=AR=opensource.cirrus.com=prvs=3504a915b1=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DD9EDF17D
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Feb 2026 17:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBEF7C19421; Fri, 13 Feb 2026 17:07:19 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A66F2C116C6
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 17:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A66F2C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DH73wa3154815
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 11:07:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Ts1nFkQc2yhZ8myk
	6wgpJQKJbH8lPHTACcOTvbyHYOk=; b=YaiSrlCNRhdJBQCLcYBOgM9l54BIASK7
	o2GA6tJ+LncwqfdYZaAwaOi/q5kDpNkkygApr8Sw+8WnIQYfWCKS9B2d2TcIDYFQ
	IDaQUlNcLP07DSJ8ArP+srWaHZrJMBBt9Xn/S8Uqn9EHmex5etQidLPivhr0Q0Hl
	gDSG01n0gQHYDRSLp1m/d5DwOiAUlXwnIa0kRvkPqADuulnqWVvZy8ok5aY4LNxJ
	v9mRdqN32S/E8rBWgVqnh3dp8UzXgHtI/5wGyULotPFGv+49DRN6ftCaxiO23igU
	3oVNss6QLMOtGViPhiTwI2zUzeu08YmPCFTXpRl2AZ6VZ532CViTWA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021119.outbound.protection.outlook.com [40.107.208.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ca7bgr20c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 11:07:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rc3+dBDblEXYYADRhbDbOCnrQ/00oq98u1x2W6xYoopI7qreWCOY69/QhUD4lUXkXWlFrX7K3C7nwfrRpIA6x/JDGRJ7qoW4YEfBF4+gD/Q8qRwVzs2VDAlr8zRvR1x5i9QnY+CkhSwSq1By3f+N9YDOODyC43YrG4Il70ZCxTHs9D42RzlAYUQsAquXqh55kIGpokb2zbr/o/1i0jL2vRgdALau/3gKutQQ3m//RGZcZLT/Zminq9df+5GV7Q/+HIFmWRewip5vxm2KvZb6uVz0YT6LUUiRUxeFTrN6XfMkUc03whXzmRM4oKId40v3F9ZypN1WakPx56trpoG/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ts1nFkQc2yhZ8myk6wgpJQKJbH8lPHTACcOTvbyHYOk=;
 b=BkendbOsxcT+rnqr6X9k4RzoSVyebxYfC25N3ocn+EdbQbYMsVA3Wn4XXPLeYH6Y/a/K3/dm2b7vawZeRZj9H3y9JG3cnQ8P8mfFU92zC73vX/Yr54x7zjzAgs6Yqx6iTToaz78dA7gQqybA41LVeQELrhDjrt8Jn9y7Jj1wL8sa+O6Tc4Lfmlfp0aMnRwVOMAiMi2M/YSo60kAXugNV5b0WwdQIEth0QqDLCocQyhlkb6sxK8KuW2MhMB181da3q9HxOokIYe69fV7dlwNwtqzCqWe6UrreS0GRIY2R2FtWwgl+ek/BLL8f/W9jCmgVimu1yTSNQgQ7Ck0r69ogrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ts1nFkQc2yhZ8myk6wgpJQKJbH8lPHTACcOTvbyHYOk=;
 b=BQNN4uTTaKWEjF2HmO9BBwp856mwDhnhlNv5doT0z8RKkz6KLI5ikiXh3CjJ+3Ph517nBJ/pqsk3QqpbxGGGnCYvFX+LdXSiWPlemilkc1Y/mJxxPa0LwOU+GgSdczXwMu3A9Es6FdVamZbMNuBjnMkxIRt1Teg1fyjpY3nc9nE=
Received: from MN0P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::27)
 by PH7PR19MB7171.namprd19.prod.outlook.com (2603:10b6:510:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:07:05 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::8f) by MN0P221CA0009.outlook.office365.com
 (2603:10b6:208:52a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 17:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Fri, 13 Feb 2026 17:07:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BCFF140654A;
	Fri, 13 Feb 2026 17:07:00 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9F3A9820249;
	Fri, 13 Feb 2026 17:07:00 +0000 (UTC)
Message-ID: <7cd27e9f-49ba-4493-acb1-d25aa9d186f4@opensource.cirrus.com>
Date: Fri, 13 Feb 2026 17:07:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for ASUS Zenbook laptop using
 CS35L41
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|PH7PR19MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: b88f99c6-2662-4021-7ab6-08de6b224e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026|54012099003|13003099007|4076005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTROZXB6STRDTlJLbkpyWGdhMXBhTElMdk01dGpCbU12WHRtdmJ0aFFkSzY1?=
 =?utf-8?B?b21vTDl6eFZSc3IvWitBeFdBaEJSVys5QUNUaTN0Y0RtOHRZbWp1ZlUzUEZH?=
 =?utf-8?B?NzhKSzdrWW82KzYwT1BrVjFEYUtMTzc2eFZ5UGVIZm1aVzFMbzRCY0FmL0c4?=
 =?utf-8?B?ZE96Y2NJOFJGbW5ZelpRT0tEVEFyMVAyTm9nMEhBRjBXSzA0QUR3NEFsc0tD?=
 =?utf-8?B?ZFlma0pDZVgyL0lyaUtlRzUycWVFMGtHSytvNWdqV1g5NEY4MlVROVhzVE1p?=
 =?utf-8?B?MWJxa3BpekZ0a2JIdStnczdrR2N0aDlJdGtsM2NYZnNDWit3MGhjSTBKMmR1?=
 =?utf-8?B?Mll0MHY1SkNyeHhmdHdqVjR0UXRvV0hoRjJ5TEYrT29oZTV2TzFncXdNWEFQ?=
 =?utf-8?B?TDlKZzFNNFBrZG9aaWQ5c3V4bExiajNxOEMrRDYvdEZlMEQ1ckhSb3NGMHNT?=
 =?utf-8?B?NUxmTW8yMFNTNVkvYkZWYXRwdHZQRmN5dzRqLzJJRjk2OFZnUGlVVnBMd1BH?=
 =?utf-8?B?c3B1Wmx6VGxpUFVlMmJqWmp1dmNNVWtwcWxiVUtVVjNZdTh6d01VNWpNSUNU?=
 =?utf-8?B?Wk15cDdQNkRtMklRZ0JLNi9pendXNWU0SjJNbmNZdVkvMWdYZE1ha1c4WFNw?=
 =?utf-8?B?SVdUM09BbUR0ODdqdmZHTlR6M3k1R1lIbWdqMExieVJKK2kya1BkSkN3QkFR?=
 =?utf-8?B?T0lqenFvKzh6MGRFcERndEZidmJrNmhPcjVLWGU3V2NuVG1QV25KN2ZsVXUx?=
 =?utf-8?B?VTBRZEhzTy9IaHZPanJwVEJiZEdPK1RwVUdyT1FENlFWSGNobEJvaTFGc1pz?=
 =?utf-8?B?a1ZqY1JpOVQ1OGExVG5WcXJYUmxJZG9jUDB1YWRYVldKdGpaK05FeTBKR2R2?=
 =?utf-8?B?bG45aVhCM0dIcVlVNnFUZXJCYlBTNXpDK2xkZmdaMGY0MnU5M1NMbTVLZGhN?=
 =?utf-8?B?ZU5RSzhML1czSFUyVE1ndEpvZnBBVXlzVkxUMk5VMkxvcUYvVWRDOXlXMGtJ?=
 =?utf-8?B?ako1OFo2RXBaRGhpNjFRa0hXNDRCYysycnY2Sm1MS0F6TTBLT0RITmRZTnBm?=
 =?utf-8?B?Z0hKdFdDT1dROTlwQ0NkZVo4OWlrN0xGcGpOVWtvTnF0T09laFlrSkNrMXZC?=
 =?utf-8?B?K24rTndnUDByMEtGdGRkY01EVk5INTFxN0RHbWs5ZitoU1RSVjJvd2ZaMWVm?=
 =?utf-8?B?bm5ZaVlmdmJCWm5HeFV3VlFBZWdmNFM4L3RRb215SVFySVRqeVNhaFFvR1dh?=
 =?utf-8?B?M1lJR2Z0dml2WEpVRm9pL3BXZVZZRzhtNlQ2d1h3SkpNRko4bHJMN0swQ09G?=
 =?utf-8?B?dHJ0b0h4WmtVcW5DRm9IVXJQb2cvUElaNnZpak5HM3FHWk9PWDBMOFlmaktl?=
 =?utf-8?B?NS82NFZuQW4zUzNyVHNiSWtFODc2N2hWa0svWlNLR1B3ZU1aL0tVcTFoNm8v?=
 =?utf-8?B?QVIxVFE4cjZhcFc5b1VmSlQwT1paUHVlTDBNeWdvRkNyK0FNY01Sbis2dW5t?=
 =?utf-8?B?T2JiWkppK2IxV29udkRYOHhUaSszUGc1SFFTS2MzSVpmQngvaThJMHpYK3FL?=
 =?utf-8?B?WGplQkVaeUpOcUprT0ppLzFFUnFWOGVkNEx3ZzlZYlFUWlkyWUl3NEQyTERa?=
 =?utf-8?B?NEpJT0RMRGRaaTIzY1k1QW90S2dGMXlCUlJtb1pqOUhRWElHWU5UYm9PWm55?=
 =?utf-8?B?ZkZhM0U4R0VlZjYrZDF1NG5pK1k4T2RzajBoRVEwazl3UTl0Q3g1OVB3L3B5?=
 =?utf-8?B?azN1YW5EbWM1UFBMOUNORzhLQWZLck5ZRzhGbVc5SDhoUVBFNzdBSkRkQ0pw?=
 =?utf-8?B?YUltU2dtMmdMajhWcWJGa2dNTjMxWEl1eDlEbzN0eVR2Q2pPUE9zdGU3QmU0?=
 =?utf-8?B?djhwUVpLeXBlM3JkRFgyZlo4V1ByUzF3emdYNWsxb0JtWk1sRVg3ZnBpbExx?=
 =?utf-8?B?UVFLV1FSU0lxWHA1b28wV3IweWI0bTRJS3NNS0lQcXdiZktreHcxWWpNYnp6?=
 =?utf-8?B?ZjZRc1dpYm5kV3N6VDlHUVRVR0JZTzJkamthTmtUM0JWSWRVY0RjV09nUEVR?=
 =?utf-8?B?cERxaXpXcW1ZL2dUelphOG1TMkhybUUydjh6YWVyYm94UUdCcWc4Z21wSDNq?=
 =?utf-8?B?Y1VTK3VGYVdDb1k3d0tPb3BWUjFOSnRTQ1AvMlZxcTc4NGI2amtjdTdVdTRJ?=
 =?utf-8?B?eGtzOEhjdTVIbjBXcHBRVEIzeForZnkzZE0za29CTGpMMmxXMjA1MUtuNE0w?=
 =?utf-8?Q?Y8Y8X2+56orTws6vSFCfQULk45DoqRsLkR7mtLAHj4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026)(54012099003)(13003099007)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EWTRc6QtOJQhg+3h2DTmCvxVojXrfvDdncmCBOyj2mDtl3ovUEMHHbBpQ59GywZRbi5xTUTMxmyuzsUOiD+MWcZgMv7DX2JbRuckFBh1eWasyXJYbaL9x2KhYLKCSWgFgVYcqw/rv5Y08upayiQ9T/edNwk8DjcHzUzgpQR51y45oRSvLIzgGxRP+O10CoUukLPYFzL2g/7+9awpz+DogH7Co3vyT47ksziMsodmoObydkinf3yVd5evPk3LrvB/nK/TKzZVaiczSfcngiEYiNYgbp+zY5xml/6NxNMY76OtecdQ8HaSh9RqmLL13lb1cYyY+jZMMDdt+70ICNIgHfTCajr/foEbKqrtVvfePPZWUS0MKfn2wDD2b/oLXXlpftl+jA1wnQGcj2j/4ReTi184SAZlqhCOa2ziDhl8Ft9k6Y3x1J/0JwdGX4AxUxhD
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:07:01.5408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b88f99c6-2662-4021-7ab6-08de6b224e27
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMSBTYWx0ZWRfXwIwQ42K+1mNf
 O2YM2VDz0OOAMnnBz7eoFoCvwIYiJPD7hy/PAj0NWJl72mkXoquyV+vuQqvsWQykMzaa1QVRKFj
 VUIqvCWNxNmtv99zkIpvA5HGd5i7p39vhhw85bu7KoOS1towrcRsXickTTEGquPcWYUuHSc7vYe
 BMUv9G0QZFVtHbAJwL0IkQw85AIepm3LyuY+Oqad8CTgTCtsHEqenrXyOWZudHTFToGcJfiuD2O
 LJGXXhVakqfjxJwenzb6XM2fCx5yhDd+I8k6jL5ZUJmmmhtk9p0lWfN/nkezZ9m0IyVQJPzq9Jj
 jwx8/IoFVRzw1ReaZCjhB87MaTQXfzxGY++jn9OQ8YKQLKdU3Vov9xKjaOgWiHd9wKq2z8Hnqba
 jg5KodbsHAaidtXvZ5RsE3ZN7TyklmdwsII3EIUtWOz0s6H0ep+yU8spKpTr6FtHZ8kVFSZVj6v
 yGlJqPwnFTFT7XqO3Nw==
X-Authority-Analysis: v=2.4 cv=dpnWylg4 c=1 sm=1 tr=0 ts=698f5a3e cx=c_pps
 a=Dn5GTbaAjVxhKizcS6VC0A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=pqnIo5ed1NapJCom3NwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gPUx0G8anOkTktKeryRJ9FoAm8ccXek-
X-Proofpoint-ORIG-GUID: gPUx0G8anOkTktKeryRJ9FoAm8ccXek-
X-Proofpoint-Spam-Reason: safe

We would like to add and update firmware files for Cirrus Logic Smart Amp CS35L41 for ASUS Zenbook UM3406GA.

Thanks,

Stefan Binding

The following changes since commit e6786848c80e773b742b04fba81ef237a4328df7:

  Merge branch 'robot/pr-0-1770957462' into 'main' (2026-02-13 09:57:23 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20260213

for you to fetch changes up to 39f04545b26fcb3581c3542d3b069453fbf72960:

  cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA (2026-02-13 17:02:34 +0000)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA

 WHENCE                                              |   5 +++++
 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid0-l0.bin | Bin 0 -> 4948 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid0-r0.bin | Bin 0 -> 4948 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid1-l0.bin | Bin 0 -> 4948 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid1-r0.bin | Bin 0 -> 4948 bytes
 5 files changed, 5 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid0-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid0-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid1-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431584-spkid1-r0.bin

