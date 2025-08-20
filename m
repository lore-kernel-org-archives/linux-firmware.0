Return-Path: <SRS0=kDPM=3A=opensource.cirrus.com=prvs=73271348e8=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F14ECA0EDC
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 12:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 402DCC4CEED; Wed, 20 Aug 2025 12:14:23 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B7A38C4CEEB
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 12:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B7A38C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57JJZ2fu732044;
	Wed, 20 Aug 2025 07:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=WSmaZY4lCKqJoSr/MHQYt/4jaHr95SFk4v0b3J41J/o=; b=
	HJfkVvnsIkLuDhLhCZD/ipKSe7Kz/krCjrRHCLGBOR0cyM0vJmP0Y69PqlGfM8sw
	1xIbdNrgAUG8upx5mBqnODSHFW1OJLC/MxiZjof6xRKt05b3erDeXa8h/mp+9odP
	/wGyEvSLLMDBrfbVb1r66d5qwbOCfnlxsx/FgZwUSjdxCmsdLDe3DEjEVc4vTDsO
	8RnoVV4qoBxh1GtpXQLXtcbdk1avq92oT4M/18KVl5gmOSEkYo9W0b/AHCEwqAkZ
	h9INyoQFVfTza7qpcdSJX6Acwo8UPtplpBazfMTxuCD4lxpqPXqVy5+90McKGtCV
	ZUFgjxngdaAT1ykW4jODCw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2117.outbound.protection.outlook.com [40.107.220.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 48myd596e7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 Aug 2025 07:14:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWgwwCUqOoQnB+mHEVYZ0L2llIRo0CEs7vJwha9gn3zr7QAGrRqMNV7mPVWCSnp1ajbikwvysvVhQwANXSXuVlTqGCk98Z30J2WsYE4BXIfBFG7nM8QLWSa59P4n8aEBYW+UI1FGLNfKu+YKWwRCZ/gRO9JYzbcxP/tKUS1aXaK13J7gk3qEB8BBcSIAYUTWl7nErh/lfLqcho4kX/KPr9ZuH3glohFBNYfcq3eupfaxilQK6zSaaaYaX0RIHyf8fcfdCXdVGA+XHBkM0nldzvxQ9LRO+D7pqzlV18MYF7HOuWwFjOXobJpx0CQ8WDR0dIZoiJX4pQPfAgVNSgmudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSmaZY4lCKqJoSr/MHQYt/4jaHr95SFk4v0b3J41J/o=;
 b=gvGl7w0wW02vQK1llePpX46aGMY3X2UvHQufLy28xMUjGYDC12bxL41cquoDS01i9v9aywHg3RoMNx3xt2wor3btv9b9NDp1yZ7m9+auVx3AIKDdUkV2/GU3J458KPxpp/9sHCUxpdKf995wA0aN2vB4ik5Rdsw8z5VkmMlCnEFgRU0zPV7THWtK/jaCtPsUTTl2zvai9lvk1z7ie4chfGFIHKlheUjdL8uL3FJvvPtjO1OEXkKGMQVMwaTUpumMhc5fL5d6nSlT1VJQpUMp4mRTKszkNnJ7Mb7M1ofkND/XY9/UIG+/zh/5T13H9YYUpbSgoGk9s8HPzQNOrsM9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSmaZY4lCKqJoSr/MHQYt/4jaHr95SFk4v0b3J41J/o=;
 b=VyspDSwXBqCmKPUMvzRUqpI9Amu3bSVFFYR+0axSVdaXNXKYy+Q7f4mwHtKX5KVR/R4ryj575kHzpuDJmT5OZxLgAvSIfVEL87G/nvPyCvT+++lQ/9iL8SFJhgSwEJhUDOFhFnejUzsHhhO1Y2FbTDrO1B4kUnN2bgdqYJd63O0=
Received: from BN9PR03CA0615.namprd03.prod.outlook.com (2603:10b6:408:106::20)
 by LV8PR19MB8493.namprd19.prod.outlook.com (2603:10b6:408:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 12:14:10 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:106:cafe::99) by BN9PR03CA0615.outlook.office365.com
 (2603:10b6:408:106::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 12:14:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Wed, 20 Aug 2025 12:14:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E2C49406547;
	Wed, 20 Aug 2025 12:14:07 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BA4ED82024A;
	Wed, 20 Aug 2025 12:14:07 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>, <mpearson-lenovo@squebb.ca>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some Lenovo laptops
Date: Wed, 20 Aug 2025 13:14:07 +0100
Message-ID: <000001dc11cb$edb66860$c9233920$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01DC11D4.4F7B93B0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdwRyzebkA+iHm0ZT16MREY1tIgrYw==
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|LV8PR19MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9d5bc4-0cb7-4fb5-7190-08dddfe310d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9wY55O105omwCHjSwi2ltRCD3s5FE7zNFzuweM5DVo0sjmrDB8nuUA4otHOL?=
 =?us-ascii?Q?7iZ0XO0toHXJ+skdQqSD0pQLdq0DHEuV5vUUFceHD5Er33X3g1D/puVdX2F1?=
 =?us-ascii?Q?cEPqrL0eFHNeDP1ewBUo8byXqn9h9dGTq8O1Y1hmsQzRqh0iCMDySRaAj2B0?=
 =?us-ascii?Q?obNpyw7e2UlnM6QrAJ2kdeWDv3QWZOGQB++RDo6rA1vFF6cfxJh+0jRHzo8+?=
 =?us-ascii?Q?MXnneMvCwsC25wgrupisp3XMpxTOLVipOBEE0Yg0bxVphg4nArXbmVjjkuy1?=
 =?us-ascii?Q?1AoSPuHzTRAAijkbdCIpBQsddEeQ+k0ukovNeNB6Ki+8EoAqCX9LTHyuErMn?=
 =?us-ascii?Q?TooqYxBssIDnWFFhPTFkbopr+pp98Kf6ARI7/5w8lX57eMu7v1zW09CHlnHZ?=
 =?us-ascii?Q?KHohH1zv1lcgS5Fj4BF9gpm8reDGJqaZoc3pBAUzsoUvYOPLT/SGMoJ9+Y1Y?=
 =?us-ascii?Q?TDfgLZGWVzhd4/5jWhtcslricgHqZXAUsrRTPGBiwD+bNeB9JbRLoJgmEsZS?=
 =?us-ascii?Q?LIiP2cs8PozTw7KzALul8S1tlcnTQk3i8z7WxxL2C3G4zMhYpPwYiQLpuynB?=
 =?us-ascii?Q?sspRgaqHkObuuCZWVGp3eBTK0bF2AjAQmjoH9Wue1LEZZ0GQfgK1WWJmOLSy?=
 =?us-ascii?Q?WMfq139bxFAs2QU4UcdA5XHCN0q37ElpQ37ElOfDBJKbpOUguQHH0UFK/xps?=
 =?us-ascii?Q?yBlE4U245wN/9xjp0WKTC2cvdrfrdsQ408uyc5bPlL/B+VsS6x19MIoi0CsE?=
 =?us-ascii?Q?ujs78FepAhjK+n5V3LJNE5JlZxwP+uwC+3HuYqwBShJ7pJUyh5XI7xRDGWZC?=
 =?us-ascii?Q?RtIQudi1R0epqkR+vCHRhp2OXXMcZvqjkIaERvR6LpSC2dV/5s93PFVDL/d3?=
 =?us-ascii?Q?81q351f034B5R+ZU5pJB0daaV/lC4qZWEURR/RSCcbOO9ORvjoG/5hgVluls?=
 =?us-ascii?Q?CkoNgqDni00Fj2QuMHbVVTfPfWno3ngMAACDiWjJVMQ2s3qi1d74+VV0gcvw?=
 =?us-ascii?Q?lxVihf0Hj1GIrY+gCXbkrLdcZb2P/+yK8KGbF8Y8gJD1jxaYkE1AsUfrjBeu?=
 =?us-ascii?Q?msXrqcziKTvAgsgnb/vc3AduDiKKBp6vVpSmRPUzUb/PY1tShP1Jmliiww5b?=
 =?us-ascii?Q?twOBM4uUABe5DHSpgS6l5wknLBYf+msXIo3jj9s9xqcNqhBhysTd5A+v+4e8?=
 =?us-ascii?Q?p0bZpSMBjuLvL7pQYDcdVEmLrw43n8h50cKxU/gQ4SOuWvQDpfMD8XUwr6KD?=
 =?us-ascii?Q?ki9+ilyA50cKXAuRi4qa+qLXhGcSIsvW0HlgvF/P8vPkVkVIWjD+Nod1MRRD?=
 =?us-ascii?Q?2j4ugj4tmYv3bsqBfozNEyrUH/ZHR5PNf8zt0+n57/Gc/9o8+k6Nps+HEA6W?=
 =?us-ascii?Q?zqBlDOyJZPEX7e/XszqmRFPf450WXFGhUbFMH1trPYDarTxCy2Wq6VwMuyi5?=
 =?us-ascii?Q?lqadd4gloXuE2H/hvFCgCz1rxYgCHOUaSKQzLXZqPmNg55/EFcdwYFBHRt5x?=
 =?us-ascii?Q?FFR3oOZynzzBKMtIZTQqQ7EczIUK7YnrPbNS?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 12:14:08.7327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9d5bc4-0cb7-4fb5-7190-08dddfe310d6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8493
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEwOCBTYWx0ZWRfX9FwKIDNxSwVg
 tUAtXXopWIgG4dWrN1f76Cp311IhF11uL2AbfygptqlCNOPEk8BkZBUcIwLYIQhW22MoD4bhiIW
 VYNtJSEv5g/KixkSK4MR4GD0nuuwTKnmgs7XlA7z/w8a0Z4ld4shQTZSKeqD/Bu2kdZ0TlhVLjr
 ufoPEbbwua26qEyAJs3PapegQqmr33d69fza5+lCmPpuMuEe8wBn0B8s9AY7MWqKZjV0mL0sKDp
 e8fX8/w9uivP3jouCHo6h/fFInlw2w1Vo6aQJVDF1e3k1D3BsPBjC0UN0t3PIdge71H7yxUzOG/
 he4nXPVB3BRKSpaOC1Gu3fg3ExP1bBYQpoNG2IEvR7zbIVrgs1qT037yT9biQoI3hHXQt1XVSDP
 4TE7tA1DTeI6tqixrda98YO4x3TFaQ==
X-Proofpoint-ORIG-GUID: LfKgMbBS4jZXDEqT5E_P23ShDf1krOeQ
X-Authority-Analysis: v=2.4 cv=EpWLbScA c=1 sm=1 tr=0 ts=68a5bc15 cx=c_pps
 a=Gqw+4yJV85EtGHpvYtJK2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8
 a=-Yoxg_8d0LdZ4P--8xIA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=EYmayr1Vh9B4-qiTEqMA:9 a=7QF3LofRTDWaAMrd:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: LfKgMbBS4jZXDEqT5E_P23ShDf1krOeQ
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0001_01DC11D4.4F7B93B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus CS35L56 smart amplifier for
some Lenovo Laptops.

Thanks,

-Simon

 

The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc96243a5:

 

  Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250820

 

for you to fetch changes up to 8362841c38da7548fa306aba4d1e899a2437ba2e:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
(2025-08-20 12:04:51 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops

 

WHENCE                                        |  10 ++++++++++

cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin | Bin 0 -> 10928 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin | Bin 0 -> 10928 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin | Bin 0 -> 10928 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin | Bin 0 -> 10928 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin | Bin 0 -> 11220 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin | Bin 0 -> 11220 bytes

cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw        | Bin 0 -> 41364 bytes

8 files changed, 10 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw


------=_NextPart_000_0001_01DC11D4.4F7B93B0
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
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>We&#8217;d like to add the firmware for the =
Cirrus CS35L56 smart amplifier for some Lenovo =
Laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
697065607ca2e09fe02b0d6c7c2bf7bcc96243a5:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 =
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
cs35l56-20250820<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
8362841c38da7548fa306aba4d1e899a2437ba2e:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops =
(2025-08-20 12:04:51 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 ++++++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin | Bin 0 -&gt; 10928 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin | Bin 0 -&gt; 10928 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin | Bin 0 -&gt; 10928 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin | Bin 0 -&gt; 10928 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin | Bin 0 -&gt; 11220 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin | Bin 0 -&gt; 11220 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; | Bin 0 -&gt; 41364 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> 8 files =
changed, 10 insertions(+)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw<o:p></o:p></span></p></div></body>=
</html>
------=_NextPart_000_0001_01DC11D4.4F7B93B0--
