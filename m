Return-Path: <SRS0=TdAZ=YF=opensource.cirrus.com=prvs=4236a287c8=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504EFC2D0CD
	for <linux-firmware@archiver.kernel.org>; Wed, 21 May 2025 14:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A98EC4CEE7; Wed, 21 May 2025 14:49:22 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1D7CC4CEE4
	for <linux-firmware@kernel.org>; Wed, 21 May 2025 14:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1D7CC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeRlK009899
	for <linux-firmware@kernel.org>; Wed, 21 May 2025 09:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=3ZiyTq7Blsxk6g4kdhma9XleIovqyBukLXHRiLyMT/M=; b=
	AOXlMvhmV0pv3kEmUGlff3R82A3cEojuHT36OvXhb1MCyH0Bu/t85H3EewpobxaG
	Ua7M6fVq7mxMF5V+kx0CFNpbn6SAcJM9dHzO4rz3xTQUIgewzIORO9GncyuMlVVo
	4TSdtIMw5wkjIDZoDaSUZg+5dMEZXJ69MT2jnKmqK9no8EkdNcQy+V9PhMAByeS5
	5onNRYRdtgvvgX2Ygcesjk4+dClTGwuvJznpCtemkvxitOQKI6Go79oNQfCvVIs7
	lKPBZ2bv6s/ts4hAcdjjp+GWLO7zACcPXiatjo/Uc4PMZ3nTXUhgQ98ItpSJHN0j
	LAxhOJ1mYm05eN5ydMws8Q==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46rwfa9hny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 21 May 2025 09:49:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJ3+IPTVMjqJMJUyevPEpn0CeyuqWsEnZwrn0tUA4Kn9MsBuUouoXXsqp5WXzrwlTjj+5LYXhHcqUjLS6CVG9sOqEiPcwzC+1emBIyXZOU1VHqnfVTPhx8Mb4fN1E5mP6Bk6L2itmCiIaplCYSV47848lsA3zcARVvJzTbQdSAMytiGZSlNbIgLxUnDl1ud0Rad90IbuhTKuWa8PXPilK4ysbDJPsacWQE4AeYtvoZFjqtllzNbVBmCi0pyVdzVU6f+1MlBEHB2jStfXa9D6EZWNiaAN2rDC6kqyQNt4+UzMsapB/YCuHT6ocT1Xn2bYMcGexsIC/0fbb16ee1OYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZiyTq7Blsxk6g4kdhma9XleIovqyBukLXHRiLyMT/M=;
 b=HrW/ItCTAYUHvInt1O25FgbL7zxeDTh+dJNPx0IlxnRBbkhtpBH6b0EpUvKnaofSgSnJogIYu6UHCMuCcyj4ynXMB0v2YlFjdRQvoszALowew5uwQyl+KAP8Xm6v4CxAX8WoJPRki2COL9PtdM6BTbZHqTi3DwOkDQ8n+FBjXTOIzPwE6KIikEcEGmEF+Gaajlgw2BHHal92OuusTvmZ8bk8crZ0vhMlw6rYT3BH64QrV7jkf8cW4XLmZAlf86l5ApNtW2Nm4ZynfqEQ1LeK13sP47XoXyWHt1phMLdi0ZZpXn5UtTuC9muiJv9yLA7rnh1KHuJC0cJreUoSfxquTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZiyTq7Blsxk6g4kdhma9XleIovqyBukLXHRiLyMT/M=;
 b=GVuDtQ8zCaIETZ7uSif0f8JS2aSJbNZPa32RUfuWy+rbbbzaK9V9QCPB63ALYcT9mIAMbjUu5eqXh48DdrIqJ1gPuvRfwrGvAMV1s+9napAAtiiUGCXjiGtVwAvqblHcwFLx20+Es2+I9IScXgct2n1N/CpZg+Tp2eDdfs9rYOM=
Received: from SA9PR13CA0056.namprd13.prod.outlook.com (2603:10b6:806:22::31)
 by DS7PR19MB4566.namprd19.prod.outlook.com (2603:10b6:5:2d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 14:49:04 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::47) by SA9PR13CA0056.outlook.office365.com
 (2603:10b6:806:22::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 21 May 2025 14:49:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 21 May 2025 14:49:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A243C406540;
	Wed, 21 May 2025 14:49:01 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7F673820270;
	Wed, 21 May 2025 14:49:01 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Fix firmware filenames for CS35L41 for several ASUS Laptops
Date: Wed, 21 May 2025 15:49:01 +0100
Message-ID: <003601dbca5f$7d9f0900$78dd1b00$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0037_01DBCA67.DF637100"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdvKX3AbN/o0TlkRR1CpnkeUMe+1Ng==
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|DS7PR19MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 008f06e4-53e3-49a6-8e4b-08dd9876a0f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eXLEHDlr/5OTYpFeUEyhbyDlUvbkxwzS4wuzjOdtvfjfJdcwhrF2omKrXgjN?=
 =?us-ascii?Q?wEwNsyoLvuKCZRrvuKQp026J4PwNi3boyT+9P4k/BdeCS2E4p6Z6y7ZvXuRd?=
 =?us-ascii?Q?EcbHB5icvTplDS8TV5/brWvZq87zn/7p7AGAuxi/ie+56kt1sKbXmsGBh0Ut?=
 =?us-ascii?Q?CnZwJGi/rSDimoOooT96n/0Ioil90sf8AgVtrQV3p9x6TwMSWhAg+8tIrt7s?=
 =?us-ascii?Q?I1mmBwhA0Qec/a05pYoXmutxMuW6IH1c+WIBapf5M2QOjWNAcPtOl+gCZiAJ?=
 =?us-ascii?Q?8uxuJsBIS3ScR92cHHle0QIUNz8uiJ36jHxdg69gjoV4lSz3iJPV87omILkT?=
 =?us-ascii?Q?Dmlqk/WkCvqgvwfw2e2BljyNtPYt4CwCOzKdW65nDoxxxlVPfK19L89sjOf6?=
 =?us-ascii?Q?ZeKJ0M0e/pGwXgpT5gL12OTpmtCX8jrZ/4LptDvd/FyFq0aaox0Dv1qQm0pZ?=
 =?us-ascii?Q?QYv/bcnndQZnuuAwwhy4VLJCOOMA+CL8zFDw1bQjdt91C+pBs5pXdDDwydW2?=
 =?us-ascii?Q?ZJ93WJacBZTZQ2sWIHcJ+zK0cUZgMEMsX6wX26bBpgH3igTZMIhWFohVaW4p?=
 =?us-ascii?Q?/qSK7li6svl61OAvXq0I45QbIsbXp0Trdj/xKfDeOZyMp/r/B8T9TkeBlwzt?=
 =?us-ascii?Q?93HJoh5iMTr0eZyUzuz4ebH/KYTDoCuthsNvqGU9yXIp+XXHw4PAukC0YaBa?=
 =?us-ascii?Q?PW0csdvb9xNrmQDlXG4UXXlk6FmTqeRTHi0zoMssRUMhfhUHDj8MZ5nRj3jE?=
 =?us-ascii?Q?vfafUqPib2aJ3/MPccwBnuDanLg3KVj6ZfXWUmmG0FP0GqeQddklptEemhpu?=
 =?us-ascii?Q?HwMoxROq8NcTmCUZGEketK7AplutM7OGaPjOediJUkabBCqQfTxzFXY9XzRR?=
 =?us-ascii?Q?HWQKDhwboeRj3K6VRbpcf8291iOfGkCqhvNmS9QH9R2P4EPnwwKngpWkzYtb?=
 =?us-ascii?Q?HnlNQXH46jbIaXBIbkIKjggL+9eV2MZ6fjyScp87PqpUTm7wwg6bLwwdeoQP?=
 =?us-ascii?Q?Q4LhCGLUBEfcTj0qPAkgOUCzy73DY7imTCxBn3IaWXW77/gTkHzwzT35muct?=
 =?us-ascii?Q?lTP/KGyElP08otaSYKtzOtY9P3NhyPAjdr6X1HPMwNgBOMFIbCUhM1PkFNRB?=
 =?us-ascii?Q?Yevb9JFvyI+i+Vd9O9OB3JG6ita9jgQJBf+5DnnSqfGe20RgCHOYLQM4x3J7?=
 =?us-ascii?Q?vlk/E7Gf833o3sTUwYoxf5b/UGA31LiKSy1uoBGcpLGvq02umQG62dj2RX1D?=
 =?us-ascii?Q?FZsrIrE7sgHR2ZRsCusgiYpvv6YzqYUwVdH2u5tWUGFk6MazN1FEr12l04A4?=
 =?us-ascii?Q?HvzURHD/o+avsugeAjEpBfVzO97ot7y0Gbcqb4VN72flzV9oWvsLEJDu9AKz?=
 =?us-ascii?Q?hLjfp91niwDLFLXS0vFdqepngoJ3fP81wQzzkhkX0ZOxTNsRoCDSI1UuOVUX?=
 =?us-ascii?Q?mIS0WpTFPOIDPkYHTRubfaKtmDewjaaLL6rp5WWVWGWgcDdfsjXbUMgHCaO6?=
 =?us-ascii?Q?EkeXZJBYWIgIOCe7TWONs6OswJySryqmwjyupYMIAs8UnfV94g0FD1cv/g?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 14:49:02.7723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008f06e4-53e3-49a6-8e4b-08dd9876a0f6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4566
X-Proofpoint-GUID: z9IglMGum1Ea7BWbWdYUOrmzADSf3V3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE0NCBTYWx0ZWRfX8mDPuRW8ayYH zkZjPYCpmlhwbKpGS1r386ssSafZCj7dlj2onSegIfADpOeXXOZFluRfz8dxZ5/M8r6n2P1kIGS QlndqUJX0IRlfZrjYSH1dTNTM8wJVEGZgxjt8us5PsXOnvxs58FxMFZmXvrLo7zt0tUpntXglUH
 JYK9wm2OYuviyTP3wwqKWhFcnLKoILh1KYv6IR73rDme+LViaX9OFmwUNVQIhXPAe4Q6c43LeNv nBsviOZ8ovLEDQsaNiEkNSbEDoyt7xK9ijHL6ymmiJclKyo3bNhgqWWycWgTwOCOz6AfugQBojo Sp9IZIaF9qaN5zXo9GZQJixGk558nwAn1Vllh/xPFBy8A2PWnn7P7bk829SQSG9s8CJI0MoT9UF
 ybfQ+qrKPhCgJgIVhZmT1N6QXDt2uEBPMVRhvPf6MVx345j4NPAe/OqxSDx0Te4Ah9r6Edym
X-Proofpoint-ORIG-GUID: z9IglMGum1Ea7BWbWdYUOrmzADSf3V3O
X-Authority-Analysis: v=2.4 cv=YsQPR5YX c=1 sm=1 tr=0 ts=682de7ea cx=c_pps a=yfraj20uO1EtZH+TM7jpHA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=RWc_ulEos4gA:10
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=xdYzjEz1jTpJWsUiYREA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=anmA5_CQPENiMxcNzBAA:9 a=kSmm9fXH84ZMGTBV:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0037_01DBCA67.DF637100
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

We would like to fix firmware filenames for Cirrus Logic Smart Amp CS35L41
for several ASUS Laptops.

 

Thanks,

 

Stefan Binding

The following changes since commit 341b9e805613d1b4137032b488eec4a941d181f6:

  Merge branch 'robot/pr-0-1747749123' into 'main' (2025-05-20 13:55:16
+0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250521

for you to fetch changes up to 7966e448ac3b3fabeb9d3a2556a1544e312189d5:

  cirrus: cs35l41: Fix firmware links for several ASUS laptops (2025-05-21
15:42:12 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Fix firmware links for several ASUS laptops

WHENCE | 10 +++++-----
1 file changed, 5 insertions(+), 5 deletions(-)

 


------=_NextPart_000_0037_01DBCA67.DF637100
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
class=3DWordSection1><p class=3DMsoNormal>We would like to fix firmware =
filenames for Cirrus Logic Smart Amp CS35L41 for several ASUS =
Laptops.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Stefan =
Binding<br><br>The following changes since commit =
341b9e805613d1b4137032b488eec4a941d181f6:<br><br>&nbsp; Merge branch =
'robot/pr-0-1747749123' into 'main' (2025-05-20 13:55:16 =
+0000)<br><br>are available in the Git repository at:<br><br>&nbsp; =
https://github.com/CirrusLogic/linux-firmware/ =
cs35l41-20250521<br><br>for you to fetch changes up to =
7966e448ac3b3fabeb9d3a2556a1544e312189d5:<br><br>&nbsp; cirrus: cs35l41: =
Fix firmware links for several ASUS laptops (2025-05-21 15:42:12 =
+0100)<br><br>-----------------------------------------------------------=
-----<br>Stefan Binding (1):<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l41: Fix firmware links for several ASUS laptops<br><br> WHENCE | 10 =
+++++-----<br> 1 file changed, 5 insertions(+), 5 =
deletions(-)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_0037_01DBCA67.DF637100--
