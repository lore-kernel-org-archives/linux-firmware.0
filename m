Return-Path: <SRS0=7Icv=3B=opensource.cirrus.com=prvs=7328bf21b3=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B3ECA0EF8
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Aug 2025 13:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33632C4CEED; Thu, 21 Aug 2025 13:02:48 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCC13C4CEEB
	for <linux-firmware@kernel.org>; Thu, 21 Aug 2025 13:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCC13C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57LAjuYT368910;
	Thu, 21 Aug 2025 08:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=dpxkvdJIFtQ3zk/SZzjZQpGCQY/5RL3gryMdhNfaC7M=; b=
	TZ/TzcKKNUB4Ia8wfsXa2lFhzcH/gonTqemFyXPHfjQXZuppC9C+3j8HI+zeyh3H
	GKWAlZPM1zWf6qnevMaN+U5nBUkG5fM7tYcUXiVFMfu2HSF/z/GHx3bkOShK4WHm
	qrthNuvycLBjUxO9EYkRoOFBE/fAO11envVuupdjNSaY5pXt/q8Na39AiTY95v9P
	fN0Nwc+a7AL2/3+uEk+F+lfFfJShb0B0ukGfwCKU2pkw9JrgLf1S5WLSiW/wP4Jr
	Dj6ON0vHVWPqYQibsXWzXiqkhSG5OR+/gJ7mCLl2KvQVZtpvU29VOXktN/ZpQOLF
	So6+rtyN/F7jPzv/JI8/qQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2124.outbound.protection.outlook.com [40.107.220.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 48myd9awpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 08:02:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUIty8xavxrXAnP2FGVZAZ1OnM72jceD2FPd43hmh9vo95X/g009uDXQot7Jw3dKhEORTMLYG/QFsOS8ZyWMS+HU1Gt5DvAu8pe9Js7jQR+j6l1XCV422QUOQKgTA3+yMWyTfbT1ep3JDqDXRrh+CCsEkmp1KDqx/ioOvEFOGYUj0nFeAtGHqvjIJgggpJh7GvmXKXDFi9c6FiTAKfrceU0sG68ePPrVLhM2SXExbuF2SkwbVfbqBNsqnnmsim+o+2CoJA2fUdesU0fJEKRIxXjPYsM2YijTYC8ndDpxHFy7R9jef0dHs9M65x7/PdUuaSsZE+4dGxI+nSzDu132Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpxkvdJIFtQ3zk/SZzjZQpGCQY/5RL3gryMdhNfaC7M=;
 b=sejWih9Kj2aQKTjPzZfRE71vS1HaklaBNozAD6Pbv3KL1LDZ1YM7TEwJkokQLL5A3BLG1h9xu14NZzOjSe4LQUuDMYJDBurxBpWFQAZHBllpFj8+7ntYYtlU+RJ56cTh7WKkCSzgh4G7kvargynRSOKzEEfgQjK7+xL4V3SpnlpdjujWXStof9G7RHAlmej4oqHYujGH6cZykilddmZ/GheuPPvFRJdHqgg1gwjn8ya5Hwwx2L42jh5L6sILGfG8AZHs0cbLqTFTutnkwUGoUD/4ibsd71+6WiwwVbHcgNbsBDdj8Pqv6IO29j2826sH428Jlmx6QpNPHvYhDqHV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpxkvdJIFtQ3zk/SZzjZQpGCQY/5RL3gryMdhNfaC7M=;
 b=bTSg2zYaspb1ouuB14cMnYk8Blj4Gb5kwHUZQAVmfz66Spqp0XUaijBZ39d1gtU6TciK4px9LxWb05QJI4ZgJ1ImwxkANuwc3alNDtS+mmGcb+9M4OMmV6tuv4VWjFIrw7f/9UybX73r//eazWHHHmnZ7KS+x68uj8kC4eHdCt0=
Received: from BY3PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:217::6)
 by DM6PR19MB4296.namprd19.prod.outlook.com (2603:10b6:5:2bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.28; Thu, 21 Aug
 2025 13:02:42 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::60) by BY3PR04CA0001.outlook.office365.com
 (2603:10b6:a03:217::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 13:02:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Thu, 21 Aug 2025 13:02:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1224A406547;
	Thu, 21 Aug 2025 13:02:40 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E336F82024A;
	Thu, 21 Aug 2025 13:02:39 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>, <mpearson-lenovo@squebb.ca>
Subject: [PULL v1 linux-firmware] cirrus: cs35l41: Move entries to correct driver section in WHENCE
Date: Thu, 21 Aug 2025 14:02:39 +0100
Message-ID: <001401dc129b$dfec7a00$9fc56e00$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0015_01DC12A4.41B15730"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdwSm5g/sI2i0xevRx6zeqJAZNwC1A==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|DM6PR19MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: dae69f4a-fcc3-4bd7-6b97-08dde0b3037e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?clv7IvpDgxvEaZWvUAakqi4yYBEBTq9+kn4XF+LgY4DAfGagPFAeGApHDWWK?=
 =?us-ascii?Q?+WXbY97A7LXsB93pINZezr4LXttSN4C9fhLGJJoYSwRQZ2lWMPm0LIgcFQ6Y?=
 =?us-ascii?Q?3BDigMHsJJnR9cID1BxQ9OgQizF2CuxqXs2sIZOtEZ0+6U1dtABw1lov7iRX?=
 =?us-ascii?Q?NiMTVXNwmm+iyijfnB9kqd9LHW9VszKE+9HinC63fOrMBTAL4hGPU4vSXzEg?=
 =?us-ascii?Q?mExKz/F3ycP6PP8dYgXtjxHjrFgOgFMtuRNiILB16oSdFtlRv9lSVuopqJ37?=
 =?us-ascii?Q?AFheYezuHgWb3+LXBVrOkVb95F1bVI3nOAkyRJzIbdWR48sT9lZxwJuvGxTj?=
 =?us-ascii?Q?7NqWfZCQPOCaLIrBsk7qlWlaZ1TqK4bt2gOqPcgFw58WHJRhxgxmDWSt9pvy?=
 =?us-ascii?Q?ZL2/Rua74gxueWjhBGOFq5E3cjkYsPqbzto3YeFplmMlyuV/Jc4cCAG/Vv1O?=
 =?us-ascii?Q?WdU5kIQ/M2TwVPeJsJ+j3s1oraWzRkeuDbyPmAp3BUpVWaD/SNUEio5t5EwC?=
 =?us-ascii?Q?yQbzozt+x+Jmchj55VM0Ey+U4uB4NDVbBYafhkGZV+7VxtGzIxncW2+xzfi9?=
 =?us-ascii?Q?cO9HjHAsC/vEWU3hvI4TD13qPcIl8OaZbrsnG4g/ev+QrC/fAYK9XWsVKN3L?=
 =?us-ascii?Q?1nE8SuwIc/iLNX2z+VFlleH/O1GfCVauthcZG0WfDsOOUrNO89OB+Uoc9GJ1?=
 =?us-ascii?Q?4HvqBuAUugFTYhhj1QdcxwUuVyYRBf6HLSLTqVh64R6tlgKEQf/H0jeBdKK7?=
 =?us-ascii?Q?Ti+nqGRHp05+cgUJYGEdjL2/PYk/O8f6koNjkfCJLogp3YmWD0AgtUHkjPd1?=
 =?us-ascii?Q?MeO+Q8TrhIlRCIhsVH5GPVBuBXXRHKTYW+uj2xKUnto2uIBnzaEd+nTztzVX?=
 =?us-ascii?Q?aGV+cV4T0LtKeNdq5S9C+g/8Zm35PUkpHEbcFlQcplRbjoSTBTZtUxqKMHL5?=
 =?us-ascii?Q?nGjwIi1S1jQcHtEGKYWbw5HNW5T4XySLrouvOAN8Er5mu/csMeAzLFP7EO+o?=
 =?us-ascii?Q?RlTHYP5IDwwkp8c2j5vr0gpJE8pO3Fl3jklwG6A/eBk5NRHkLYFvq0VsTA2h?=
 =?us-ascii?Q?8TVg3U6llEtY5fwOJtStXtiGcjjmxAsGpVCZneo/86jiqIxG9poCP+9if3Bn?=
 =?us-ascii?Q?hZeDTr5qOkzetljmbXrBBsMHTsRvFs6/LpQvhbVBSAUxNnpUQbxpiASKKPLc?=
 =?us-ascii?Q?8YPWu1meegHYevTJpYOGJQX4lxxJ1rnrT3v7WtyOUxHW2qgsArWURzDjicXd?=
 =?us-ascii?Q?Vb1EPe45Ck1N2+AYTMFe24DQQH15ub+8XeDt2gZ9bcJyK51IzaoSdy9G+HGN?=
 =?us-ascii?Q?yDGK86Uj7tx7WvbFpkXKFCxihtysb0gWhUXEvApo/IDvbu7BOBS4jfhz+BPl?=
 =?us-ascii?Q?yBIqxTK1RlYqQnY7hKu7mR8DWUjxRJiUo2cdradyn7nBm+vntQ0Izs/oq2xf?=
 =?us-ascii?Q?Qh+oiTL6Ozv70kj+bEIQZGkPrPprsoGxkXiW/Ai8O65BFEORqzYwNZZs3bmu?=
 =?us-ascii?Q?UCFNHZzdXYutsRmz00d5XOv1LMpTVooo2Q56cjeYO7LapYFLtqdNGRf0nA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 13:02:41.5499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae69f4a-fcc3-4bd7-6b97-08dde0b3037e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4296
X-Proofpoint-ORIG-GUID: UpWRw2aeEiIcu5PngES93UwsAoqm1mDI
X-Proofpoint-GUID: UpWRw2aeEiIcu5PngES93UwsAoqm1mDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDEwNCBTYWx0ZWRfX+WxNWClu5FQm
 82QmrXUjnTC3GMcQZuCM72qdvyJXZV2N2qhmbzn/lJ3U+odBK+ozk++g872FwnAgQVGwQksCkBs
 y+odgAWWTAhL6bsPzcG51/i48497RjAGvbM3/pNlXqIF7vx3n1dX5ZjcAyyeNvM25Qp5X+ai3aE
 syZbrr2v6iDJgV/YNo2gXmdKDme9USzFYXdFZLmmnWgDe6Gmwykx2Spmg8g2M+At435VenXf4uN
 uVJERwKXdFu1DU96j7angE+h3zdRWhuUMI2Kz6nfGT4ZIgrNbcM53pK0AbaYHaP/X+0tXsbK6eP
 1NNkzE1rhBmKcJaO19+Eiadkshpy6vY3mBCxNs+5d9YAbcC34YkSscvghe4kSf+7//jIGSb/uMF
 KuU443GKqx3kPNTHuw+Un083pXuFKQ==
X-Authority-Analysis: v=2.4 cv=WIwmnnsR c=1 sm=1 tr=0 ts=68a718f5 cx=c_pps
 a=vjxJhJQncZFfyFE+Ha1XfA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=2OwXVqhp2XgA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8
 a=phgmtrwdjLZwrBc5lDEA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=JtdIXUO9lx4Uu3uPLWEA:9 a=JW-3XlM6N0PSevCc:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0015_01DC12A4.41B15730
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

A couple more patches - this small chain updates the firmware for the Cirrus
CS35L56

smart amplifier for a couple of Lenovo Laptops and we also noticed that
there were a

few cs35l41 entries in the wrong place in WHENCE.

 

Thanks,

-Simon

 

The following changes since commit 70dda28e509833f07a7191c363057ab056ff0906:

 

  Merge branch 'robot/pr-0-1755703547' into 'main' (2025-08-20 16:16:47
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250821

 

for you to fetch changes up to fa855bd9ece7a6ced493ff22d8fa5028ac43c38f:

 

  cirrus: cs35l41: Move entries to correct driver section in WHENCE
(2025-08-21 12:57:36 +0000)

 

----------------------------------------------------------------

Simon Trimmer (2):

      cirrus: cs35l56: Update firmware for Cirrus Amps for some Lenovo
laptops

      cirrus: cs35l41: Move entries to correct driver section in WHENCE

 

WHENCE                                               |  20
++++++++++----------

cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin | Bin 8384 -> 8452
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin | Bin 8368 -> 8436
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin | Bin 8368 -> 8436
bytes

cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin | Bin 8368 -> 8436
bytes

5 files changed, 10 insertions(+), 10 deletions(-)


------=_NextPart_000_0015_01DC12A4.41B15730
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
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>A couple =
more patches &#8211; this small chain updates the firmware for the =
Cirrus CS35L56<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>smart amplifier for a couple of =
Lenovo Laptops and we also noticed that there were =
a<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>few cs35l41 entries in the wrong place in =
WHENCE.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
70dda28e509833f07a7191c363057ab056ff0906:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'robot/pr-0-1755703547' into 'main' (2025-08-20 16:16:47 =
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
cs35l56-20250821<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
fa855bd9ece7a6ced493ff22d8fa5028ac43c38f:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l41: Move entries to correct driver section in WHENCE =
(2025-08-21 12:57:36 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(2):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Update firmware for Cirrus Amps for some Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l41: Move entries to correct driver section in =
WHENCE<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
20 ++++++++++----------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp1.bin | Bin 8384 -&gt; =
8452 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa392c-spkid1-amp2.bin | Bin 8368 -&gt; =
8436 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp1.bin | Bin 8368 -&gt; =
8436 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa392d-spkid0-amp2.bin | Bin 8368 -&gt; =
8436 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 5 files changed, 10 insertions(+), 10 =
deletions(-)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0015_01DC12A4.41B15730--
