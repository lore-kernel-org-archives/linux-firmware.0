Return-Path: <SRS0=nhV8=AD=opensource.cirrus.com=prvs=34902580fd=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C7AE6BF1E
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Jan 2026 15:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54FE4C116D0; Fri, 30 Jan 2026 15:25:39 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41C57C4CEF7
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 15:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41C57C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U7QMRt3276726
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 09:25:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=/QCztUELKztvmWwbf7uEePBN7t1nkwJ/6y7T7rylWKI=; b=
	b9mPTgsGrunL4Vg7oUQUYPwPD2J8RW4l8Y+kDnhNUsUAN78T3C3KToovcAUAP8QO
	0SfWx0TaueQ6VwG/PMiD4kOGiq62doX7pOVQtJkeULqTAxwhoLCDY6s9UVn6W296
	HZbI2tj76ghq6pqeFpsmfnLEcuulxRcHDMp94EvQtre/3axBY+CM8xa/JtHzy6h4
	8toJprhpPbHmk0wHDXPIQLXm8xlU5r9C8JOE0C5MzZg+AfRvJeOS+un0VlOUWtJP
	LXyWupA06aqZHozt4Geg73tD4PhtSgsRUcyz9FdVb9QigE3d2rUP3B2poGJTYVWS
	kPpu9wrZQ+pf1ALZFTLdfA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022090.outbound.protection.outlook.com [40.93.195.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bvvc06w3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 30 Jan 2026 09:25:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhQbAEPLraBSOxfawYCYIQZvZcrdzXBImETmDPS4ET1gr9NDPKPBo5E15H0oXbTIaoxjR4oguUiiA6Ci9DKWO2L7OT3N+KpQdOfRv/TFppXhAtBUDe13v1KcY5FTF70k6pRGhTCxeIJPKzY4YyrzzT08P3NBK7XV+ZpA2c/OVVgfd/ZdSeCguwkz3esmoIqttSvHrXsj+ueI/g71v9iA5Y36URUfwqxVfs1RrdcQK5TZ3OhFW5sK2T5XRr7BzmMATDqAFBTbjdWirrsUMMEzIELbW/Wb0+wgEMLkaGk4D2Xz7NB4uN/8qsm7H95vSegreRZ7jFpJcC8rm8pXJJASCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QCztUELKztvmWwbf7uEePBN7t1nkwJ/6y7T7rylWKI=;
 b=edQYYpjRCDyxYVWfHfaAyAURfdAF1uTGzDtjgq6m365+P/EtIjrbdJpLFYGWImZ0S3dLiS9kK7gy42qJQ3sGct+VvEbZD3jFfb33GpUFH3yfgdTwCr7gRGY73kYUiGHTaOcIG8U4DsVd9Aa1GzlrSNtr2mC6k/ioNCiINAh+r0UilRP3HVVUHYa3I4dRQ8oirxnD0BlgsKrul+s5nK2G4HhRTDkWDWI2WZHgIzeysctuBVEc4BMB/0wMxMMeudukUoQJHOwVUQz3tYtdz+2YnVfM1rqO1vT+MMajTHX2B7VqMfMmErdg+cG24rF2y8gu1ufaM0s0OmxZAZzRIG9WDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QCztUELKztvmWwbf7uEePBN7t1nkwJ/6y7T7rylWKI=;
 b=XtCE3ytGqDjdCjmqe5r7bxsR0YZkdRxQDbNz1AOTjS1QRMf83BBlHStzxSTdMaYI3fVLZQZLJyCAMDapprmeEojJeCl6PaRXcKowGiMvmG29ycFVeuzXvRwoldgR454bj3kQOxc852SwVPTaQjAE/tSMgc4bLL3kCw/MtXEGwXo=
Received: from SJ0PR03CA0084.namprd03.prod.outlook.com (2603:10b6:a03:331::29)
 by CY8PR19MB7715.namprd19.prod.outlook.com (2603:10b6:930:6e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 15:25:33 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::a5) by SJ0PR03CA0084.outlook.office365.com
 (2603:10b6:a03:331::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 15:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 30 Jan 2026 15:25:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 35402406542;
	Fri, 30 Jan 2026 15:25:31 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2B812820259;
	Fri, 30 Jan 2026 15:25:31 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1] WHENCE: Correct 2 trailing whitespaces 
Date: Fri, 30 Jan 2026 15:25:30 -0000
Message-ID: <004201dc91fc$abbe3df0$033ab9d0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0043_01DC91FC.ABBEB320"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdyR/IkCJykFIDP9QJabMWqV73fplw==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|CY8PR19MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: abbfc3a2-b51c-4814-f996-08de6013cf26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|54012099003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L+tfGt1TrwKR9DlSXyFMNpkkJorBMn8XYISE6NbHnTK89YpYo99Wnd/oetGr?=
 =?us-ascii?Q?/TPU7f04MNnBRtptuW18Fci6CY46WEBNUDP8fqJQ0ilrS5mRz/S/d+/SIAwh?=
 =?us-ascii?Q?r8W8rt3t1TKU1pHas8XcerSpUbg67n6bhcElsHHcfnCxEd2JXy2/E2I0KuW+?=
 =?us-ascii?Q?crPXDucUH7zQ2qNl7fjkgDKjNyhCI3DMMn78/Sikx5En4MLpisnwzuFiNmvw?=
 =?us-ascii?Q?kOsBKgveMSp6SPmaC/YmMuKS5yUmsahr6kmgy+ShZpl0X1Bx7Su0INkMX2EI?=
 =?us-ascii?Q?i6/CL63bp0S9mHcXtUMv2c0evYbT2VbGLxgXjSIXzjiHWjyeL0cR+Y9VFcKo?=
 =?us-ascii?Q?SNtKt8ve2tc4N7sjsuG5bNPEQt/vp2oeUVj9wINoOpm3fs00IJhlAoyZMLRY?=
 =?us-ascii?Q?7rsxCY6GpNUNMtjpygtzoII2mq7cGhcUlp7i4vkgZC+HuwgDjHkD4n4XtgPt?=
 =?us-ascii?Q?XEwtv7gFemb4DaCOOl8QkRMN8Oa/Rt6cqZgc6Iwb7SQbLqXVbeJwGOyjMfh1?=
 =?us-ascii?Q?ft3fxDU1HL/HthD7UN2JQULdfrFaKecywe86JbQtBsUYtHKmJPfwM+R2e1Wx?=
 =?us-ascii?Q?k9HZMjAFftgkzIcRhjglKYr0WcLV4wAcM2V5kacFswIaiZJWX/PxyBUpqpxt?=
 =?us-ascii?Q?KEpBEeLe+rxfGT+GqlOa63ioUa5BdxPbd7pmd+/XJgxpYrqz8gTRjGr+KWQL?=
 =?us-ascii?Q?ekwyIAU+DP5G00o1owfZ+2vTjz9lnXFR9EE5kBdCUmJNVsXZZjnaqo4ZGtUB?=
 =?us-ascii?Q?kxMwoAJ5rUeIJmGJO6kro7Ap8N5ohZu7KJ397BbhAd9qxkHNkCP5hAtvVicH?=
 =?us-ascii?Q?NmpY2sZtZJt1AvUsX4Gz0b6mNO92H2oqn7DadT41ASeueoJMV5whsgfKhpv9?=
 =?us-ascii?Q?ZSql2pZQDR2/W9DE6m/q8Hz2mSHs3B/yKEVfh7ClyVAI5mSmlLIEhKwWo+bR?=
 =?us-ascii?Q?2OhyI2CYOZP+hf/BX9t0Uf7xPuJ2IpZ1PYx4YnJrCRJ5z6RcSEsuISjmFhgX?=
 =?us-ascii?Q?2oxGlLRIAbtz9xBU+J+vE9thCsiABgNbA4je+bN4mwfzStVcnUSPR6UWdepl?=
 =?us-ascii?Q?32rAkJb0gsfSsFg8dEslAyGrw/3AiK1FtV0zImJTiJKgvQybRM+mRv2/Txp6?=
 =?us-ascii?Q?3+xc5wQl8mrDHGZiOYFg8922goS+x37qE+Q/TrFQk65mAs8XPNVhLqQsVm/5?=
 =?us-ascii?Q?YJR/8cUEIU0A5ZyMCBoffEr5kXE8SQjKUwpstJCSmvasVT53e5Ej4+bM7hie?=
 =?us-ascii?Q?e1/VP1flPfCx9Gf5MveqWaa8AbwSQVPggiKfg4GJSP4SfeP4KpopzTkBFsmC?=
 =?us-ascii?Q?moDjfKWxo9seY0GTgcfyxar0vvKx0i+3PzWQoJDjmmsKEVpi6/laMzVvT4Mt?=
 =?us-ascii?Q?f+uPhhmkxfDk3nwb6pqJCtUJSosLToTCpzXTS7xeMEYxI39Ou8Oqiamk9VXo?=
 =?us-ascii?Q?QkaJfDWr7OVJk4TJ67+ruExz/n8jm1Icgg4HX//jiD3N8G0T9ay6ZiGSwfQl?=
 =?us-ascii?Q?R4ppJYW1pBujggKAB0SqBx2CyjowaUkWeEIM6Hlyz4GaBCTTnutkfTYSLCcb?=
 =?us-ascii?Q?MsUuBu1Oi+YgIRAU4svDrtcPzQctPGjU9XrBkWSMpkGVTN2u9Hi71XiAtcic?=
 =?us-ascii?Q?cDwDmMlnwXHuO2qOjwMincgFv649qFd+HpMgmfljnKxRURI85JwIgvY1dp6n?=
 =?us-ascii?Q?KDu8CQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(54012099003)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RRZHFol57Oqfg7s0Qiz+6Oa03KoJ/3NP8JRAfkNy9I2DHctq8skaIcPH2JAfgqO9/m9BuVjQIcdBScf4oqTx6GkBLyC9MEEboEytPck0TNbIZqV50eCqyeAT+qLfguYnJ8HqkZ1RpWVcMX0mMKl3UrqALaenYo/9EbsLnlnQ3nTHXWkDtotTaXQ+QNYMUvDPoyrz923z/sEsC4lOX6eppWlN0tWBGKFW2F++psWzGzcg0p9Pew59C9eVV0XjaDKTrJC7Y7RmF07WBzzsYKCXMRwdq5E+jqrK+G4flRKtxEr+0glArGDQRcS/L0UWtwXNogbzca6NuyQP0H3Im5RWY1A6zuehFRB06PNThy6bE9O198dG1yRtmyORyr68/JZRVl3f9pNLtVpDlzhmJa2OV7X4bXC2e4Mhud1z9Rzg6B10sNiGxZsfM56H3L/d420e
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:25:32.6007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abbfc3a2-b51c-4814-f996-08de6013cf26
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7715
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNiBTYWx0ZWRfX9kN2mnpdcSBH
 2OwK6mprpSh6QmkSZBwTKMKQX0E71qZW/BMuPTTNOQAos/rzIARAKxh65HkHgJAlifNsMpHfeCG
 BpuYSumf/cLMZiQHHF82qNOut3Dp7G+qZLLBpSs9YDps46fMjY3Xxl1d7CR5Gw4s0jdkZnqeBlA
 j9mf6hPe1ZXWRyPSTQ+OAQKcSAhJc8JY2YJp7YI2TxhO1gt25tZ1RCbkxysvKEVNeyDL5OXR40i
 foESKN2pEhH/98I20kIuJH8vuEDtPBtAo9tl/a2/rPaiP9Wx81eL19+5uG5Q8tUrMEmoGUZhX+d
 sKYctSo1YhQ1Q5jXM203WQadw8dpX74lagaKX1F/tDNlTQT2TqHByiJUnqhcSANYu5jIEOhuHuO
 9+UzEPXToEU+pOHrJbGq50iwtYWtMys+Z4w2OSWmCjhS8SWhbNYodR5cYTmFXHMSCjcG4gtN5WH
 eqfzbGk/k40i8yGMghw==
X-Proofpoint-GUID: jZVKTBUny5TgYX4A-JU5kGOCYeUSlI31
X-Authority-Analysis: v=2.4 cv=KvBAGGWN c=1 sm=1 tr=0 ts=697ccd71 cx=c_pps
 a=hcVEZFb6UyxxfUjrL3vAww==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8
 a=lzVgCNrDic53N6XCG-UA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=wvwORPMj8wLl4XIS9BkA:9 a=QHAluAPCWs2n2WXy:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-ORIG-GUID: jZVKTBUny5TgYX4A-JU5kGOCYeUSlI31
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0043_01DC91FC.ABBEB320
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

Another little patch - from Maciej to remove some trailing whitespace in
WHENCE

Thanks,

-Simon

 

 

The following changes since commit 5f391573e93d59823affa9785e19a5c9fe4c9799:

 

  Merge branch 'robot/patch-0-1769587466' into 'main' (2026-01-30 14:42:00
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260130-WHENCE

 

for you to fetch changes up to af03e44a2029a93ddc95dcf3c9e2ffabafad3fcb:

 

  WHENCE: Correct 2 trailing whitespaces (2026-01-30 15:22:06 +0000)

 

----------------------------------------------------------------

Maciej Strozek (1):

      WHENCE: Correct 2 trailing whitespaces

 

WHENCE | 4 ++--

1 file changed, 2 insertions(+), 2 deletions(-)


------=_NextPart_000_0043_01DC91FC.ABBEB320
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
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
--></style></head><body lang=3DEN-US link=3D"#467886" vlink=3D"#96607D" =
style=3D'word-wrap:break-word'><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>Another =
little patch &#8211; from Maciej to remove some trailing whitespace in =
WHENCE<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
5f391573e93d59823affa9785e19a5c9fe4c9799:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'robot/patch-0-1769587466' into 'main' (2026-01-30 14:42:00 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260130-WHENCE<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
af03e44a2029a93ddc95dcf3c9e2ffabafad3fcb:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
WHENCE: Correct 2 trailing whitespaces (2026-01-30 15:22:06 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Maciej Strozek =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WHENCE: =
Correct 2 trailing whitespaces<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> WHENCE =
| 4 ++--<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 1 file changed, 2 insertions(+), 2 =
deletions(-)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0043_01DC91FC.ABBEB320--
