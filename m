Return-Path: <SRS0=U55h=YA=opensource.cirrus.com=prvs=42319b5bbb=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DACC3ABC9
	for <linux-firmware@archiver.kernel.org>; Fri, 16 May 2025 12:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F30CC4CEEB; Fri, 16 May 2025 12:11:32 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41381C4CEE4
	for <linux-firmware@kernel.org>; Fri, 16 May 2025 12:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41381C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4M7ii025992
	for <linux-firmware@kernel.org>; Fri, 16 May 2025 07:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ct6thWZeAN6nKq0i
	9/mufTWzLNQ0ADShTog8LQacHmY=; b=p2se3YfQtRfAkrRo73n4I3JFJ4TNsLVD
	SYVpZLifzcviafNv+zIgVWPH6eIOLtvkdpUbhfIRNQ0yE8hDQlRgC5JbqLQYlkKK
	OJxYB8ma9nOhKqu77MW5XOtgTgSgX+CmkYmW9HZAQbegd9ZNAMsJlVfl0+SjvObi
	wbSzSE5SPU/xcSf6A56tDoiI+UogEFdg/2wu6TeEQ3HsRRg3ori40Wdw7ludvC4i
	mYmQVdCx4s54JdSfZbYmjeRL2jA4cj/aKKRCG24etY/sPBmsW0kiiHvIXKcqfgU5
	Fxd5oNAGb+1iEMoQnOJSl/ThVHQXwfVNmI4xp9O/+h5wHXEGuV18Wg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrcmjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 16 May 2025 07:11:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXuq0nwVgVCC52aPVcwMcdtFkamemP9dZECBxzjmMUEFLPzMiuXlfeVRh/4r0MN6kaSntjCGOu+03Hc3BDGgqmDunmLT9U0Rk0O8n7Vb5pouzatLgAudNCXCJ0FTru128nI660Co+JDefA/LvM7nq6EqT83INeNhZD7U36+UHGPJS18oOgGEghJ2AuHdzj9hie8XOGMYzUbbwfaPai9QFjzYx+Npi0/XEzwvhj6SBC9H2mKlo53X8NFQeKPvPQZPgNDWT8qV+bMCfj7KszrbyFiYkVGRXNLHfrImAh131uOfLXeQHBxgvzNfGuXWmI+D/8k9H4dkWAAJJLaAzGZhQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ct6thWZeAN6nKq0i9/mufTWzLNQ0ADShTog8LQacHmY=;
 b=yXh4NQkNwaqmb6Lmw0yviT9c8dwrkG288RiOAUaYD3bHfflYCptQIm6Bomid9LWlgWzk8SjDX+IyBMfAgyK3hbs8IFchiQFtNU+ZxCgO4WYFa8Nt/vf5rL10dF7IC4asXIgEdkBkSPCFK/SEENrYtFh/GhXWihV428NMS7V5mw3C0+37phte4Ms1YvOJv0I/WCYQ+4LV6kc3LhJ6rKfxFGAhyNpvcrnnJvDvnt+BOGF2Xd/VFcswD3zfSTeQ11FzwtM7HkaMLLuVtlYt6bHUgFCuHq2E+qvU6Uv/4IQhLeuNxeRv1L6/6l7s0O4NBysFg2ME1JeFruRxZF+LC7EPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ct6thWZeAN6nKq0i9/mufTWzLNQ0ADShTog8LQacHmY=;
 b=lWaeT9RduC/CpjSBN8LgArpbEt+YyUY65H/1a7nArxAI62HoWPu9LipHBwRkP/7mGRHxe+TtwV9EluY1L15+abAN/Hj5HHBEE9pghx4jc83JdaOYEe2X2PyhruTX0XcX28MnD8YZ0H3KQqQC+KyUp02v7hB/FluJqrZ9ZxX2c2Y=
Received: from DS7PR03CA0084.namprd03.prod.outlook.com (2603:10b6:5:3bb::29)
 by CH2PR19MB3973.namprd19.prod.outlook.com (2603:10b6:610:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 12:11:24 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::2b) by DS7PR03CA0084.outlook.office365.com
 (2603:10b6:5:3bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Fri,
 16 May 2025 12:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Fri, 16 May 2025 12:11:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2DE01406545;
	Fri, 16 May 2025 12:11:21 +0000 (UTC)
Received: from [198.90.188.46] (LONNCK4V044.ad.cirrus.com [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0E55B822563;
	Fri, 16 May 2025 12:11:21 +0000 (UTC)
Message-ID: <31fd25aa-587e-4adf-a33b-109335b46ba9@opensource.cirrus.com>
Date: Fri, 16 May 2025 13:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add Firmware for Acer Helios Laptops
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|CH2PR19MB3973:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a804c66-2dd9-4a51-c203-08dd9472c627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZC9rQko1ZnI0VlVPNERCVFRORHlUUytOY3NSN09qQkhEV21uR3JzR3BBT1Rh?=
 =?utf-8?B?N1JnSnlhL1dSRlRZRUZtbUlIVlNwOUNTNW5DQU55QU13dXB4VUI0RU5NUjJk?=
 =?utf-8?B?aUJodFdzZDlOdDc3a2lOMkFKV3RuWmlKSXZYRHJFUE01R2V5V3BOdUVONlc4?=
 =?utf-8?B?b1JrWm1NcW5iVDRaOGZUSENNcElCT21qUk5vc2k1SVBxR2ZkVW44UlNtWmlF?=
 =?utf-8?B?Zk94U0kxVWtwSy9PcVNQSG1ibkFxemFXUDRBSEpGMno5bXNqdlplNnpXRVVz?=
 =?utf-8?B?Ni83blMxamhXaHk5THB1TFhYOGY2bTFJQjFldThTTWNsL3Y2bVVTSG9hSnFk?=
 =?utf-8?B?bXQ2d3U2OWVaSjlkZzVLUi90SEJTVTVvelYyYStZTUZCUy9qNENRMzlHRzlK?=
 =?utf-8?B?b0dJZUN1am1CUVFHYUpOYVhZSVpwWFREUWRQcjdWMGp0b0IxbFY4b3NDM0Jw?=
 =?utf-8?B?dVdwdW1GRVU0KzUxS3lpc1dMb21hWC9oZitiWTdmcjZlQkE4eXRqWHF2QVZu?=
 =?utf-8?B?dlhldzdpSWJ2cW5iODk4SDJYbU84elZ4ZWw0ekVrdEE4dW1uQVlpazJQT3Nl?=
 =?utf-8?B?U29DL01mNWswbjlScitDZHplT2hudmY5SFhHREVQbVh4UTBFQmVqcVg4UFpR?=
 =?utf-8?B?cFpoa3g5aFlDamxrZGpXUDlURVU5R3hGaFcwY0ZCUS9tSGErYmlMVnJzU280?=
 =?utf-8?B?NFJRelY4azZaRG1aZlJ3NEVCUXZwOWdQNzFlV29SVGtSa0VhZFpmOTU4eTk0?=
 =?utf-8?B?QSt3OWZhTko1bERXOUhyeDdpd01hUU9DYUJjT20xNzB4RHZJSGlTUUt3Nk9Z?=
 =?utf-8?B?QzZ0SDZZKzI1QytlQTcrVzJaRlI1Ni9LbkQ1aWFqVG83TnVpL1grN3FEVmxp?=
 =?utf-8?B?V3pIVHo0MmowMFozcStkMmJoaWJhSzMreGJhQXNGQ08vOHdscEhXWGpjS0lt?=
 =?utf-8?B?OG5CK1REMmwveFhvNmd3dksrTzJ6cXUwQUFrTC9ZZlJqL3lOQ0dGd001YjdS?=
 =?utf-8?B?MlZQMGNiTXZOM3BGZ2duOG13dzh6aVpzSTg3TGllK0xMc09jYmQxd1ZnM2lr?=
 =?utf-8?B?YlpIMlFPbHl3eXJJQnlOUDVUTU5UQStsSk1xdSs2cUlic2FiKzlGRE5pc1Mr?=
 =?utf-8?B?WUQxRFpaSG9pRG1sdUUzbmNPd3dqdVY4TlY3b2hjTXlPS25XVU45enYzNmxL?=
 =?utf-8?B?UXhaVkN4SS93dFpuQWdpakJJRkMwZXRhSXllV0dnd0t5bDVTYWpRcDNSdlVq?=
 =?utf-8?B?dFFHRzZOUHhvL1drNGZXQUw2UEhJSWJwMjhBVFZ3ekdiZHZ0SW9abW1UTGZI?=
 =?utf-8?B?OWJLVDdzVTQ2V2d1d0FtYklwRTRSTGk5SVRJVnZ6bG5mR1RpZ2VqTGQ2TXp6?=
 =?utf-8?B?Z0xpOEJoZ043MEtJeXVteGpGK2lNRWFVa0F1a1d6Q3VpMitlVmttd21zemVa?=
 =?utf-8?B?NHgzR2Q1aFcxNG56amlud0lHampGKzZOT3ZTZjdlWTZFRTRiZnNTTEhDUzgv?=
 =?utf-8?B?alN6YnBCblc1cld2UmQ0UWJZZk5McHRxYUY1M0pxb0ZBV09xVUxuaFZaWm1t?=
 =?utf-8?B?Zm9TZmRxczdFdkRWMGxhWkhSU0tueGcvUkozWmp5T2xEa3BPTUlQWHRMbkpR?=
 =?utf-8?B?L0hOaGplT0pGN0pKVUVLVjBGZFJvYTVvclBGN0lUc1JHbW4xYnBDdWsxaFNX?=
 =?utf-8?B?c0VOYnY4WEY4aWNIYXBGUnVvQlQzVklRVVF6eVQramJxR2NqRFRhNis3Snhu?=
 =?utf-8?B?Q21OY0tzVG51VW1TcUowN2FEbVdxbE5aYkJCeEZ4QzFyUjhiMWFodzdaYXBU?=
 =?utf-8?B?NWJZMzZTNFVrY0RTOFJiOEpRMExsWnZ4dDZjQTc3SVBvSEU1b3czZFBzampK?=
 =?utf-8?B?Smk4Y1RFUEJYcnNkRFczTTd4Y3ZBU1FDVXRQMVpUbG5Cck0vbUh6MG9DYlJh?=
 =?utf-8?B?TFhhVWlBZklWQnBicXAvVWFsNTI4WFdNeklTbUxIMUZXSnM0ZXY3VkVieGRr?=
 =?utf-8?B?QzJvOVIySitBPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:11:22.5377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a804c66-2dd9-4a51-c203-08dd9472c627
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3973
X-Proofpoint-ORIG-GUID: YMev8j_6pE4Uif582Jme5Rco49RKm7rR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDExNiBTYWx0ZWRfXxo2HFWMxj82Q 0qq9BwguOPhPW7SaAWhXaabyl0nSgfaEPPTQ711jQl/u1xyfM9cH00YXzJXgSH93px3O0ZptNhJ J1Dbe6aw4jabZrtYlx8IMHdtZM5jxAVGlk0LRDxcgNe4qUH2om9I6xCUWDj67BgGSvwkyRnpsY9
 TJ0Lug3mZXf28+U/L3JqdTddnHQu/UC4OSZ/HY7pCY3MX798SB3iB8+fL6hZQGqf6nCWuAgW85w VDFfFKVyBzUET2eTcxZ6RczMRwokWlaRmsWCunOhLt0ZS+3qVvWpx1Oh8bi9qN+lkQ2dp3dwO47 eMqiJx2j/VX1qfBXMSYPgywnrNa6mgYwvq3CmCJ6fNZdq2hdErihKGd+ys89Ex6pZv7clHiCbkA
 biDU5rsPKpnllkfRd3secdyjgiaSiaW0it0kw2/+FjlmoNdme5AzNkKMScWXFeqoWbrmOOPi
X-Proofpoint-GUID: YMev8j_6pE4Uif582Jme5Rco49RKm7rR
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=68272b71 cx=c_pps a=ur2hu7Zt/Tb0cWAHmjvzJg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=gFa2sauJy_5YTNvdVD8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

We would like to update firmware files for Cirrus Logic Smart Amp CS35L41 for Acer Helios laptops.

Thanks,

Stefan Binding

The following changes since commit 64899f3955a043f1506e7720881d8f850381c900:

  Merge branch 'robot/patch-0-1747309101' into 'main' (2025-05-15 12:22:28 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250516

for you to fetch changes up to 034b673fc6bc06e2b5c9f4eb1ffd6c725e3b0eea:

  cirrus: cs35l41: Add Firmware for various ACER Laptops using CS35L41 HDA (2025-05-16 11:46:23 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for various ACER Laptops using CS35L41 HDA

 WHENCE                                       |   9 +++++++++
 cirrus/cs35l41-dsp1-spk-prot-1025182c-l0.bin | Bin 0 -> 5500 bytes
 cirrus/cs35l41-dsp1-spk-prot-1025182c-r0.bin | Bin 0 -> 5500 bytes
 cirrus/cs35l41-dsp1-spk-prot-10251844-l0.bin | Bin 0 -> 5196 bytes
 cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin | Bin 0 -> 5196 bytes
 5 files changed, 9 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-1025182c-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-1025182c-r0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10251844-l0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-10251844-r0.bin

