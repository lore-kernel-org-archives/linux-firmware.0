Return-Path: <SRS0=AuGJ=XR=opensource.cirrus.com=prvs=42166ed331=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B13C3ABA3
	for <linux-firmware@archiver.kernel.org>; Thu,  1 May 2025 11:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84EE4C4CEE4; Thu,  1 May 2025 11:03:48 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66DBDC4CEE3
	for <linux-firmware@kernel.org>; Thu,  1 May 2025 11:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66DBDC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5416OBhY012431
	for <linux-firmware@kernel.org>; Thu, 1 May 2025 06:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=iL4CGGhlDf1m4naOR8QIby4Z9TirOtympW9QXP97+68=; b=
	oyK/pWT8eb99TRjqSMmLVkxDl5UTqCW2a2X5dIpw5aZju82Ew+avti2r680R/InT
	inc6dfcprqY6ji3ya4RP6MP9trSX1eti8/4n6QbS8WphMOnWmtWS5LSzfVl1quDn
	zdwN+3qWXDfhbE6CL6QzZH8JdPovt4X6GmRBGsIIIyzY5OVJgTupUhPHlcVBMBUI
	zDGTz1QvAcmXTEP03C64cRnnvIbSNx3R7kZYIubcQtBIjwEJldm48Ct5RU+xsgIx
	6HBABR3FG/PQlXc/iwmlNw4aX4Ytp8Dff2gojPa7nslcfqDQzNKndd01vcjHcu4i
	eFOqZXAvGb6TxsdKN0/D5g==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46bqj791w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 01 May 2025 06:03:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsVHXgnyls/fpXh/Mxvp4Qp+rlVmG2yHqAeRLqnuMWMbA/k+q3SAeEj/DoeAwKCmCweJnYwg9Kg+N9A09AeoA44mLM7NqwCdhXqZDDcD6sQOdgKoVxLgefkPzlszdUS71jTYJ1zB6jfC2RMWn3+80flGdCNPH1/g/vVn/6w9IkzPEm47+reGpC5VYQdI+dAcjc5i2XybzqIV0HBW85/nEygGDcn78IfP7ZnySEk+rxs2ogSQcEepCEYYnJVNpa130hldwIkE4hlWoVn0enpJ4rH32QCFRDQgSK9G6ZHZPoFtQR2jpgGEzgmRCqJwml4qNnQViYALLuh+lMgmkihZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iL4CGGhlDf1m4naOR8QIby4Z9TirOtympW9QXP97+68=;
 b=UBaMlXeqc3DjUugEDcCi1RXaielJZT71Cbd3oFrK6NDqVxMadekAHc2ZTDycktOBehtWwGJlEmkO0QZWqgx7s6G/1BtBWV0lX5EdeEQ/m7yuAZAQM7SrxsE65yEH831jstzq1RSRUWRCwAaCnqFzDmFlkoYJRekRVHWQvNlQFddh32y9/4gh9LxxFQbn5SNMmCwHPo7iK0fBneczCPXqTO/Tw1GYXvZnCxOk9bkedoRSRdA8Awj0Yh94qshpYeMO02ByjxRlxu6+a8rD+7+Nfi2A3twP8K2seBXkerDAC7PDbjFrlhqj9TNh8reZWVdO0IumfY1avK3S53RPCakJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iL4CGGhlDf1m4naOR8QIby4Z9TirOtympW9QXP97+68=;
 b=kwJMLVLOtPZhwQ5bNQiHXwKuKZbfOcxlQKIdFjyBiP3ahl3ce9DIwxVNUQ4q7EODHldrvqiBEZ624/leHCjD/lmq1b/wz/CBaJN9kaa95qxmPiooVCFK0H7DHpa/X8LudlyXfPQPRmGHs6X9BaTjeNIy3iKPwH+FzS49w46t45g=
Received: from BYAPR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:40::29)
 by DS0PR19MB7901.namprd19.prod.outlook.com (2603:10b6:8:157::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 11:03:39 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:40:cafe::57) by BYAPR04CA0016.outlook.office365.com
 (2603:10b6:a03:40::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 1 May 2025 11:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Thu, 1 May 2025 11:03:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DB069406547;
	Thu,  1 May 2025 11:03:36 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B15FA820244;
	Thu,  1 May 2025 11:03:36 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Update firmware for Cirrus CS35L56 Amps
Date: Thu, 1 May 2025 12:03:36 +0100
Message-ID: <000801dbba88$aff46670$0fdd3350$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01DBBA91.11B943A0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adu6iHfWUtB55AohT42AASVSHW8jYQ==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|DS0PR19MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: c457f418-0a8c-45e2-c4b7-08dd889fd383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v5mCdu4aqlCTTctGUv9ksTFmLJ1cxC6S8V0wnNZI9Tgl8W6veTEza9NNcroA?=
 =?us-ascii?Q?sAsKdARBNWIV2YdHE/dVAUTJoTQ6/JhaizcmlRx2ToT93cm1hqZLBjoT4a4j?=
 =?us-ascii?Q?WDYs5zmacThtnIVW+djCESlmImhhAsxoQaQHBURes/Mx+aSHDDfJ5CLJ0SsK?=
 =?us-ascii?Q?ALlUIBbNvb9Lu/X3/Cz54AbHM1SFkqTKTyqMmpnSkT8pBtTv59cT9zfOSeEi?=
 =?us-ascii?Q?YB9s4Y2LYo82oRSjyhsyGcIzE7uP9rY32G8VNx1P9BSoVOXVAUJOvNLXLpJQ?=
 =?us-ascii?Q?rsmP72RHQxNS9Ws8JTD6jhf42AONcPxItKbHySwIxW1GAyKJwvK8zr815yBT?=
 =?us-ascii?Q?4ntZtJdrFyG0KTvNL6LuY85gRMSNBiCfNjPR4lT22OEaTiQSkfTDoRTg0zXw?=
 =?us-ascii?Q?TRtbvcibwIJuY6dUw8QexhuiFQJe/bKVqIbXoAWaTffVgYkk1RbKDvatpTwX?=
 =?us-ascii?Q?Nb0+3YkYrLezWXsxw/QNlpRdh7wHpOvjxO9EqCYyXWXx3aEkj2gcGilKmNsf?=
 =?us-ascii?Q?nPPZ0viuYP2X/J2DLaG5ox92c+oe7LXqi9LBBhpjQ6NWu4ls61MsFzl5N9NX?=
 =?us-ascii?Q?Xehr6N1IfO7QUmaEjlopPtduMp1g8OWgv32O2fBcEHwyiLX00xta/HXgE2VJ?=
 =?us-ascii?Q?cl+1xvSZXcrdYOeKFSFhH/eR6GEA9ou36CVvhdVcqgVo4n6o8ypSECARd+Mc?=
 =?us-ascii?Q?YxVdCua4F5iuj/UbErPEXOj3P62chqjg96BGHoD7JYwKdLzLKOPldHotJv5/?=
 =?us-ascii?Q?AuNwRyhnx6LeT9+xE3j9q6OnfUGw4K8kOjFtibNnY+1KI2DWP2wWf2mp8Lga?=
 =?us-ascii?Q?AYoXtvSRkUMNbTo05JYiCJpn427LNJw/vwfkjE8JbUTvV/xVKknVPZV+XTmn?=
 =?us-ascii?Q?sUkS95XJ9f7dMgwUGjQmpOQwVEqHEw74J2uPLePOhkFXMa+jmBVuPnKQf/li?=
 =?us-ascii?Q?W+PsHFACn7P0ohTPuME7ZVOGRbIX6PeWbXaSuoUNSTB/8iZkKWYjrijteLUt?=
 =?us-ascii?Q?Pz0Cy2MS8DZFzZhar9iZkz4JY77zP3koEPcqX4j0FGMJLqpdLALcnkjrhg+p?=
 =?us-ascii?Q?D6BZblZvMJnHXpUVJfBfnFDiw0rCvsVTIHgU0/szeJb/b4xh2Hn5yFJFBpbA?=
 =?us-ascii?Q?JOFG2ExzA9hxLb94oHpZ7i7ekLQEgz+TgXegZoNg4G6UT+1K0o8rbsjC4XZj?=
 =?us-ascii?Q?M1DsIkWiNPrzrG6NJ0q8bEa0p/JGuH3FKznjLAHq6ctbvg1tb3SJoTXIZ5FG?=
 =?us-ascii?Q?/bHTHzZL2VxmVl2lmTtdM6LvVW3GEDJJGmL+xi6wjz8igcUquLV22snyiSs4?=
 =?us-ascii?Q?GhNi9HptLMCFP0vLkFe59TKSDifwNKTYeViadT490dvR6M7G65SRMyaGB9dt?=
 =?us-ascii?Q?u2D7z1y5UaJxGuqJaOYb4qAXfJ75PTwHha1KvxpJNNLjgSLzQawelxSnM+EL?=
 =?us-ascii?Q?iz+tAB5pXB9dasDTN/17p+gSQuq6/AHFkigxHTBQ+if76tGAOAfUkHjT6sjS?=
 =?us-ascii?Q?AMSAmIm09mYDxZQSz8IENSAKR8F56z3hygp+Hs9RWZvpoQ+aYTGrF+I5yA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 11:03:38.2825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c457f418-0a8c-45e2-c4b7-08dd889fd383
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7901
X-Proofpoint-ORIG-GUID: J3AZUPkSRzxU7irjoVDcFeXngJJVfktJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA4MyBTYWx0ZWRfX8Hs24gh8H+Yu D6rsDITWToN+THtgg2QfI4te0fTk9ODvyPWz6H8m4hvqL3ApL9jYfztSK9YE9Gqu65DzeFoXsWI LHWtRwx0HAfi/5JTHUIXvQSUqiriLH4QDg5R4xt/by/BAUnMjqJQRmAQuYmYMvAXlFJ1xJMyt24
 +wSrustiUz6l3bR/fF+mcmUDRohY4nj+g4RoaUYR+w1LPW2BO2F8ZcrV471pjOZz68xqXAtuMID 02I1bPMTEjYx0NYLukqgMtcLaQ/97q/4DqHr51vZxfTmH4M/9S+08kYlcaGj26PwHto0P3HXfYn mg5NAaLL4LqNHB4RI0ReXyb1J+kkzOtEtlpfpunFUz00xyLNaP3FZSLmYvpjvgJMOt6X97nttvJ
 MezXglHccoWvIkbNb1YNiM+/KbELYPvAZnR4UcdwxhVX0L2E9X1ZjX7bivSUwwPgVkvN1Yz+
X-Proofpoint-GUID: J3AZUPkSRzxU7irjoVDcFeXngJJVfktJ
X-Authority-Analysis: v=2.4 cv=CfcI5Krl c=1 sm=1 tr=0 ts=68135511 cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=O5F7AoeSDr8TkSznyQgA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=l-oD0-2gGzu182GfeB0A:9 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0009_01DBBA91.11B943A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to update the firmware for the Cirrus CS35L56 smart amplifier.

 

There are four patches today adding and updating support for several

products from Dell, Lenovo and ASUS.

Thanks,

-Simon

 

The following changes since commit 4a0f825b83e9eb9439245503399ccbc0d7e275c2:

 

  Merge branch 'mt7925' into 'main' (2025-04-30 13:17:57 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250501

 

for you to fetch changes up to cb876e3622a96cc805c624388e2c8a64195c1b5d:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
(2025-05-01 10:49:08 +0000)

 

----------------------------------------------------------------

Simon Trimmer (4):

      cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell laptops

      cirrus: cs35l56: Update firmware for Cirrus Amps for some Lenovo
laptops

      cirrus: cs35l56: Add firmware for Cirrus Amps for some ASUS laptops

      cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops

 

WHENCE                                               |  46
+++++++++++++++++++++++++++++++++++++---------

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin | Bin 11532 -> 11536
bytes

cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin | Bin 11532 -> 11536
bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin | Bin 11524 -> 11532
bytes

cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin | Bin 11524 -> 11532
bytes

cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin | Bin 0 -> 8256 bytes

cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin | Bin 0 -> 8256 bytes

cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin | Bin 0 -> 8256 bytes

cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin | Bin 0 -> 8256 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin | Bin 6772 -> 6772
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin | Bin 6776 -> 6776
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin | Bin 6768 -> 6768
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin | Bin 6772 -> 6772
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin        | Bin 0 -> 8288 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin        | Bin 0 -> 8284 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin | Bin 8348 -> 0 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin | Bin 8348 -> 0 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin | Bin 0 -> 7216 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin | Bin 0 -> 7216 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin | Bin 6200 -> 0 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin | Bin 6200 -> 0 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin | Bin 6212 -> 0 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin | Bin 6212 -> 0 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin | Bin 0 -> 7220 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin | Bin 0 -> 7220 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin | Bin 0 -> 8384 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin | Bin 0 -> 8368 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin | Bin 0 -> 8368 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin | Bin 0 -> 8368 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin        | Bin 0 -> 9448 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin        | Bin 0 -> 9448 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin        | Bin 0 -> 9448 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin        | Bin 0 -> 9448 bytes

33 files changed, 37 insertions(+), 9 deletions(-)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin

delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin

delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin

delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin

delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin

delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin

delete mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin


------=_NextPart_000_0009_01DBBA91.11B943A0
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
	font-size:11.0pt;
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
class=3DWordSection1><p class=3DMsoNormal>Hi,<o:p></o:p></p><p =
class=3DMsoNormal>We&#8217;d like to update the firmware for the Cirrus =
CS35L56 smart amplifier.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>There are =
four patches today adding and updating support for =
several<o:p></o:p></p><p class=3DMsoNormal>products from Dell, Lenovo =
and ASUS.<o:p></o:p></p><p class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>-Simon<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal>The =
following changes since commit =
4a0f825b83e9eb9439245503399ccbc0d7e275c2:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; Merge =
branch 'mt7925' into 'main' (2025-04-30 13:17:57 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>are =
available in the Git repository at:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> cs35l56-20250501<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>for you to =
fetch changes up to =
cb876e3622a96cc805c624388e2c8a64195c1b5d:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops =
(2025-05-01 10:49:08 +0000)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>-------------------------------------------------------=
---------<o:p></o:p></p><p class=3DMsoNormal>Simon Trimmer =
(4):<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56: Update firmware for Cirrus Amps for some Dell =
laptops<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Update =
firmware for Cirrus Amps for some Lenovo laptops<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus Amps for some ASUS laptops<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: cs35l56: Add =
firmware for Cirrus Amps for some Lenovo laptops<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
46 +++++++++++++++++++++++++++++++++++++---------<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp1.bin =
| Bin 11532 -&gt; 11536 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280d12-spkid0-amp2.bin | Bin 11532 -&gt; =
11536 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp1.bin | Bin 11524 -&gt; =
11532 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10280d13-spkid0-amp2.bin | Bin 11524 -&gt; =
11532 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin | Bin 0 -&gt; 8256 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin | Bin 0 -&gt; 8256 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin | Bin 0 -&gt; 8256 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin | Bin 0 -&gt; 8256 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampl.bin | Bin 6772 -&gt; =
6772 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid0-ampr.bin | Bin 6776 -&gt; =
6776 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampl.bin | Bin 6768 -&gt; =
6768 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3838-spkid1-ampr.bin | Bin 6772 -&gt; =
6772 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 8288 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 8284 bytes<o:p></o:p></p><p =
class=3DMsoNormal> cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin =
| Bin 8348 -&gt; 0 bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin | Bin 8348 -&gt; 0 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin | Bin 0 -&gt; 7216 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin | Bin 0 -&gt; 7216 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin | Bin 6200 -&gt; 0 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin | Bin 6200 -&gt; 0 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin | Bin 6212 -&gt; 0 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin | Bin 6212 -&gt; 0 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin | Bin 0 -&gt; 7220 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin | Bin 0 -&gt; 7220 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin | Bin 0 -&gt; 8384 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin | Bin 0 -&gt; 8368 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin | Bin 0 -&gt; 8368 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin | Bin 0 -&gt; 8368 =
bytes<o:p></o:p></p><p class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 9448 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 9448 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 9448 bytes<o:p></o:p></p><p =
class=3DMsoNormal> =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 9448 bytes<o:p></o:p></p><p =
class=3DMsoNormal> 33 files changed, 37 insertions(+), 9 =
deletions(-)<o:p></o:p></p><p class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431034-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> delete mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> delete mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391b-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> delete mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> delete mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa391e-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> delete mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> delete mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3921-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp1.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp2.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp3.bin<o:p></o:p></p><p =
class=3DMsoNormal> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa392e-amp4.bin<o:p></o:p></p></div></body>=
</html>
------=_NextPart_000_0009_01DBBA91.11B943A0--
