Return-Path: <SRS0=lBd8=WS=cirrus.com=prvs=3185720b6a=simon.trimmer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D4DC3600C
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Mar 2025 09:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEA6AC4CEE5; Mon, 31 Mar 2025 09:24:05 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C90BC4CEE3
	for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 09:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C90BC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V4v7W3005791
	for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 04:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=8XavAQoXjwJFf1CXiOYlsSUkxvoU67DuDg7F86qitKM=; b=
	PWShk6wC1kRQCjywTsXlXvY8qdsvoJ7ovSO+kBLwN+Rr5HGPmIiCACp6t4rQHjK8
	g7Y0d3LdrgesqbPWuYRw663t+jk1RjauXhBHOWNIpWaJ8NQMZcGAGbYp/278yhP0
	NS1/y0B0IM7xVg+srj36Lc5W1gTd6whWjzoHiS5maxlASBaikwu8SfV2ZJO4IIZ2
	C6CuJTdxyVkPUhqPFmD7OCjCX4YFZr8mNnMJvYbj3hUieF8oLhEFU0zyveBiHi2n
	Hmvcu2AP0bPYnyywoyFZf2kDzfmtuCONGj5LVRM1WRIfpbprVh7Sl9H3LmuCnncF
	yrnAcwxNCNDLpHq8Mf+mwA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45pe91a90e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Mar 2025 04:23:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7YLSVzExtdaohW0/U0n9ZIZk+EDwOptPeItDROLVw6PoCe/stHxFc0/FGrRXPgcYJ/oFC3zOeeYa2HY2NMBKcw05j7O5VaROdJ452337bsYR9tMI8Z7aovXf1GBduKcYtLUAke5TsHebizq2Jes/obob3OTiid2V34Hng408+CXDGFevfXywnOWuiy4cQMRmsRHw9OzoxepcBSzvO0hIyqACwgjYOgZ7w0SQzkIwK29qXfXtwmC0Alyix2vJJSkztT3mT6W7JN9po597CjodnQ7sRRhCTrx43NpQAP3kIwRYkRDKOmvu2jqR/lq63o/nrH//8HEPLGynth+Bk7vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XavAQoXjwJFf1CXiOYlsSUkxvoU67DuDg7F86qitKM=;
 b=S948721IGwsIcfqTz3WGANOCWh31EVWPxw3erb66lmkG4BZ5j9s4MsCGNwf2TsvjVVD8eNw2343ncCvukcqUtdpZdlfT7i19U5SaF6lynfrzXpCMlfU6XbB6lknxDP+71zuXVHiMjySUzNqCraVq7XVwgQ7uzGCrzVErEGOiOQOcfi+VONj541uID+D/oV1h3K+7Bi/a/dzUoOw+r+cB071HFzd/fkvfqG694NYAmHZc4BiJ0teInZpUeRI58E8kUJTnKE5cMGawMktJjf3pkvdK0m75Cjk5cTH0tMpEpIqyP+chsZkNEM58C/n1/V/XzrgdZaNcZ5VsL5cuqg+JPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XavAQoXjwJFf1CXiOYlsSUkxvoU67DuDg7F86qitKM=;
 b=xWEQij2xik9aIFor+VtG2a6y8SEjy/qQ8Su86OjJymzqmlZ5xGZTbkSa0ql+oQIkiNZZu3QWbLP1En5ZaBAu2jo0OItAk0S7dNrxfA1o8SI9K+sGw0mtrpya+Y0mkcchh3XtAB4s6rVLcIeZ8EFnETSZ0dH41XV/W6tytkMRmAs=
Received: from BN9PR03CA0540.namprd03.prod.outlook.com (2603:10b6:408:131::35)
 by DM8PR19MB5304.namprd19.prod.outlook.com (2603:10b6:8:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.50; Mon, 31 Mar 2025 09:23:52 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::10) by BN9PR03CA0540.outlook.office365.com
 (2603:10b6:408:131::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 09:23:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 31 Mar 2025 09:23:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1E643406547;
	Mon, 31 Mar 2025 09:23:51 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DDC17820244;
	Mon, 31 Mar 2025 09:23:50 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Correct filenames of SSID 103c8e1b and 103c8e1c 
Date: Mon, 31 Mar 2025 10:23:50 +0100
Message-ID: <000e01dba21e$9d5280b0$d7f78210$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000F_01DBA226.FF1784F0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AduiHli664xsVD67Q16nn3HooVlkog==
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|DM8PR19MB5304:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb5139b-f10a-43c9-3c09-08dd7035c0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e2HosNUi9r2vpUY1+/5YFw0DF2dgi7fkpKXj7z7FCDWmh4pfDSy7ZZPxZOoA?=
 =?us-ascii?Q?nJvslqdFPivTPx3nJioQtqHqt1pMQmVOoIznQ7dKa7Q+1eGZHF91dq2rAPLH?=
 =?us-ascii?Q?IANGubvl7ET7bvPzq29jieOXY074N/0XFXksZHJDEMPznH84ffHa96dQwuBM?=
 =?us-ascii?Q?NymW61kk9kPx2My4Rsvmw0uSkSbAd763KavnzZji/gn3r+bXGtHaProqy9rl?=
 =?us-ascii?Q?iZAZ3Kq5qZM9p0FbWoF+M64JiIvz4bblVhzLdwFgK0gIzozjXaOU49us3afA?=
 =?us-ascii?Q?pda11xCi/WG0/Jab9OCdtlofvRIrs8bAxohSrk1h2sfhlzcVX3SERIRZOUFZ?=
 =?us-ascii?Q?nUxMFtiI0BReARvbwSo1fKB9o6MHgBN7jqDzO1rS7l/1vnijdmyMbkdCCfHu?=
 =?us-ascii?Q?scZxqaKdlsPcCWQ80yVt4ugilK2XAN/kXmet1XGKq4qkW22acWnRvXp6a4jn?=
 =?us-ascii?Q?Y5LZUpkutGAh+/07Q2Af3x+UoPBuLfYhGR2vDi8rbwmZCdiVEdpBD2QSVJv7?=
 =?us-ascii?Q?v5ZsWBxOMhMRiUCU0BnCWvdBC83+RwRvb93A8j/1gPUI55t6sLQ7a9HTcXHJ?=
 =?us-ascii?Q?6VudBAqur2DeGLee8V5TXRJ6CNfKhp5/gCvt9bmGCEgm2eu4Pl1BnymrSbOJ?=
 =?us-ascii?Q?RT2SKJwwZjE0wKU6LdhcIUPbLAYoI7RISOr7simvWV9kWUbsvuCzawm4RKGt?=
 =?us-ascii?Q?0rygDJQIUjNLsLLZeCSJxzdbF/Xp8UXYUW8m1gGUH26XDJNR7mOVYu6eUviI?=
 =?us-ascii?Q?E/Y1bVB4Mud2kLcVT55iHi38gniKQ/T3VJgpBYTT+0bTO9SD+ylpZx1w+brb?=
 =?us-ascii?Q?qVZWdtZuig/BFlpDiE4OGLs1m6yVdmx7oRTdX9pCf43IcM8cx8j66wCV2eho?=
 =?us-ascii?Q?IIWJ9DVgpZHwBD8wf4UjuTMVWQGrWYmBL9GF8b0WLWOuoyVbONeGuUBUEE7n?=
 =?us-ascii?Q?9lA676GStxGAW72zENetg3UGlViKiAzBMH3r2gd+7QIMQ7L2dOYxYXSP4HyU?=
 =?us-ascii?Q?kAqEwaViJ+aGvrxUG3I1QepIZfw6ttdToRW40GOqrXdyeuqhavzSmCQgDBPX?=
 =?us-ascii?Q?XWW/7t5IW6RF10WBsXzkI5c1ARCZJYnR9enhEtmA1iiOJh5bjjQshHSFX/+K?=
 =?us-ascii?Q?aljCprr/qhofgDFDzdcEPo8Y60Es6XoPmJ/iDs6+56I3S5dopYq+lYJN8UfB?=
 =?us-ascii?Q?gfg6G6eOjtM8MtAwXjZ9LmwNhKayS0jNVOakbG4U1l02xL+CieThN3ujs82t?=
 =?us-ascii?Q?yJ7HAP89z2uaVEjhhB/aaB8IARE+MaglSs/ExQy8EcTWW/PYU+ZyLC4u/ilp?=
 =?us-ascii?Q?IOjE40VQu88z+NgPpHe9u7D6EhEkKivCSGGsAZhrflwjgPxMQ9a5oBugf5z4?=
 =?us-ascii?Q?/0LOEbhbZBqsr52Y08SAWHJ9VgQ6OlYzWSaiNk2qmUQaNrOf+RkRg8CiR22B?=
 =?us-ascii?Q?h5zj5BKnOQkpb4AQuEGcTsgzvhX5flFOsWQsBA2aPTWp2wkIgfiBtQvnXxOz?=
 =?us-ascii?Q?izXXO9oI+vHcBRI=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 09:23:52.2381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb5139b-f10a-43c9-3c09-08dd7035c0ac
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR19MB5304
X-Authority-Analysis: v=2.4 cv=Mapsu4/f c=1 sm=1 tr=0 ts=67ea5f2c cx=c_pps a=r1LLKbupV3Dgd2n8fS09vg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Vs1iUdzkB0EA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=9kMPOcd2xXx0611lyHEA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=U04OyVuqcr_psuGgvKgA:9 a=tIaedBDrHX_tpu-z:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: wujgxtJ20Wd82l-JAgCJybWuua-V8Pko
X-Proofpoint-ORIG-GUID: wujgxtJ20Wd82l-JAgCJybWuua-V8Pko
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_000F_01DBA226.FF1784F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to correct the firmware naming for the Cirrus CS35L56 smart
amplifier used in

a couple of SSIDs

Thanks,

-Simon

 

 

The following changes since commit 4bfa7c6351ab64e5f1429f30df1e478e2bd9df36:

 

  Merge branch 'amd-staging' into 'main' (2025-03-28 16:39:59 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250331

 

for you to fetch changes up to e1f0996657cf8900dc60a8df6fd6eba276a822ea:

 

  cirrus: cs35l56: Correct filenames of SSID 103c8e1b and 103c8e1c
(2025-03-31 09:18:41 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Correct filenames of SSID 103c8e1b and 103c8e1c

 

WHENCE
|  12 ++++++------

cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin =>
cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin} | Bin

cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin =>
cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin} | Bin

3 files changed, 6 insertions(+), 6 deletions(-)

rename cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin =>
cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin} (100%)

rename cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin =>
cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin} (100%)


------=_NextPart_000_000F_01DBA226.FF1784F0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
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
class=3DWordSection1><p class=3DMsoNormal>Hi,<span =
style=3D'font-size:11.0pt'><o:p></o:p></span></p><p =
class=3DMsoNormal>We&#8217;d like to correct the firmware naming for the =
Cirrus CS35L56 smart amplifier used in<o:p></o:p></p><p =
class=3DMsoNormal>a couple of SSIDs<o:p></o:p></p><p =
class=3DMsoNormal>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal>-Simon<o:p></o:p></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
4bfa7c6351ab64e5f1429f30df1e478e2bd9df36:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'amd-staging' into 'main' (2025-03-28 16:39:59 =
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
cs35l56-20250331<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
e1f0996657cf8900dc60a8df6fd6eba276a822ea:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Correct filenames of SSID 103c8e1b and 103c8e1c =
(2025-03-31 09:18:41 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Correct filenames of SSID 103c8e1b and =
103c8e1c<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp; 12 ++++++------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin =3D&gt; =
cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin} | Bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin =3D&gt; =
cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin} | Bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> 3 files =
changed, 6 insertions(+), 6 deletions(-)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> rename =
cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp1.bin =3D&gt; =
cs35l56-b0-dsp1-misc-103c8e1b-amp1.bin} (100%)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> rename =
cirrus/{cs35l54-b0-dsp1-misc-103c8e1b-amp2.bin =3D&gt; =
cs35l56-b0-dsp1-misc-103c8e1b-amp2.bin} =
(100%)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_000F_01DBA226.FF1784F0--
