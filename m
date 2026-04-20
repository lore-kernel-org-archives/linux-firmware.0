Return-Path: <SRS0=pG30=CT=opensource.cirrus.com=prvs=557085b688=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5EAF588C2
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Apr 2026 12:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B2C1C2BCB4; Mon, 20 Apr 2026 12:53:17 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01B80C19425
	for <linux-firmware@kernel.org>; Mon, 20 Apr 2026 12:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01B80C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K5fgrW1613369
	for <linux-firmware@kernel.org>; Mon, 20 Apr 2026 07:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=Asv2473khlXBSLUXS/uifMC0uganYMPqRTYy8vToK90=; b=
	A8hpDyBtV74SCBt/Q07nbLDyI2+3+PtGyIlYd3QmMFE+/w+tZ9CG0Nxrv7Ekq2HY
	SbrI/JAZcn21Ht891CwRxLBHzPyVH+DNAa6UwsWwzxpF4XO+RMLXID0IV8DZqjEM
	kdG36KfU3/xx0k+3Lfs7Ebo1A+nX36ibO0M60WkYjgBjxFEZuN07H2dCmCGmvqKV
	Y2ywKnEAzNzZP564kGANzSHgV6rBHQwS7hGGDFvz4qsH4wnriNO59rr/KvjIg10M
	5UURSqePdBVrCH3zX9iG2MJ7COSj7+lAgEp9fEmfJf1oXPzhNjXYNlhNtWh2JA1g
	6WJPALF+HOMxXG4YwhQ92g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020134.outbound.protection.outlook.com [52.101.201.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dm6cfjfhd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 20 Apr 2026 07:53:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pV14j11vB5q1REf+/iKGA5wOF8KZRmq2wXInn823yB8ONKuFsMnv5ifQHdlonSGc5/QrWvnpM4byXMzXhcHWhBir3OFHaTNzjBShspWqfFLhQcZO3U2Ik+uMPwCjrgoTa2unH2d18IJPbePyj9jtIR4Ly05CDK0dcY0XP3WVkV36p87m7pFfjW95jKiqUAfpcFs1YN3BzBV/MbjzmZmHaUOVHB9rRkPl/H2c5JT1hbCwSacTuCzt3cepUllrEvp+SsMnmB0ed/NYbWkJSE06TdVKBD3DegmoVjGMJv+mj3qJ9CKMV8WkIjsTrr0OqFvY4azgAxJ/5XVIQh00cFWXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Asv2473khlXBSLUXS/uifMC0uganYMPqRTYy8vToK90=;
 b=a4pptEvEIjLvClOrsw64VKDvP599KvMsDEgFiaYEl8GLYLjLfe1ucWRnJGexk9ge7HegQUui2qhV/l+DzRcj/PFAeh93EAj+HKSMSFZ8Yf9PjFWciPRZlOLREris18pzJzWMHZ5M5BJxwhlZ7v5maGPCTbufYfQgBTyCLX2/nVV2Ni5eyCzaJ3esLz0CLTIOtLRUjKqJk44dirJ7NcDtjRaL+VgheXHpIHYcFGFF4KJrcaebu+POybNpNEujPszngbSIX6sOe5EV4xkfEKo1oG08Y3qmKusD/pk3GVNP+PV8jmE2/M4ia8+RiSReY5gIQRidRJVuPf0HMJLBdxG91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Asv2473khlXBSLUXS/uifMC0uganYMPqRTYy8vToK90=;
 b=j8S82XZLd2noT6wq5boedmZ/GSfBu3K1TwyD1KjWLUan8+NG+uRuzst3KXGGLKvvk/u32gj0SIg0q3XqrzsRLzLZM060ZHSDtoVaQfA30zfbi2Hz7InF4eqx0zKGD2sWgXhvlr45E2p2KD3/NtRs+XC+kfbQDQPpxCwLVoOqPW8=
Received: from PH0PR07CA0029.namprd07.prod.outlook.com (2603:10b6:510:5::34)
 by CH9PR19MB9490.namprd19.prod.outlook.com (2603:10b6:610:2da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Mon, 20 Apr
 2026 12:53:10 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:510:5:cafe::58) by PH0PR07CA0029.outlook.office365.com
 (2603:10b6:510:5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 12:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Mon, 20 Apr 2026 12:53:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 74677406543;
	Mon, 20 Apr 2026 12:53:07 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5400082024A;
	Mon, 20 Apr 2026 12:53:07 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some Lenovo laptops (17aa235c 17aa235d)
Date: Mon, 20 Apr 2026 13:53:06 +0100
Message-ID: <001601dcd0c4$a2976330$e7c62990$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01DCD0CD.045C4060"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdzQxKHOw7JRqPLETU+XJ92/JCcFIg==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|CH9PR19MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: ef47a8e4-1f1d-4f9e-d1b3-08de9edbc629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|8096899003|13003099007|18002099003|16102099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qetDoPQYbfuuH7rmQmiay+WWoU9KryoPEL7CWr2IsMHg9GVQrpe92/magp1oT9JA2MTfekW3ySt1H8f3IMbYmrFPkQRK9Z1w2rqqy5H09NACC1k2/eMQJoa+rCArIUgh34O2ttlh4e4zCn0g5NRnx5qSka3wkOq9EqVEH4/pX/1XD+Ldovtc7yYkvb6aj+oee9dUpcbspMaTCihZdW+ROBCkNIMjJt8VL7+8bKrfTv94enq0Zp44u/N4O+5x+nYQwikRrkI1iAAfMMPePsrr13B4IwZj6jWmqX22cmcyb9joi0KTxKS3krQqwQekWB+k3T74hXYS5RaE/J5aLIdk1ys9d8EWiTy3Wj1LeQZ/eEx/ylQu7o7cgEq8EUTzqWx4fCuZyDcURzEnBgVTB11xD3bMdv+ammJAD0Sbz7d4XhfPUY5il+A/eJ9vcRwob59HTYxWvQcgBxjq5s6YwXq6hFaOe7MIwXMpC3P26Uysqcnr3dbObs9x6hdRoMzk75syFtMNwi1e5jrP+isDm6tS4Zz2vEOQG3S0y6bndjJ0fv6nu70nI05u8q9fvKgaPFAlDq0rDWquzitdUJh4PEYhDYG7gwoiQ+8sGNQ8XX2FZIcBP0Pohq07+ImIS31NYSXO1lbSXwqpziJDKCwrLPKGINKYe0WJIlVhNwmX/uLES44SGZlQlr14YTOdxq97+pwueuFNVreszGSUDaoOb3dMbaQOpX/AFmOmfLNIa0+5NmAtLeLyZJaCRi+GlPDLQcX6jGDiZoA2PZX52C5asreN5A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(8096899003)(13003099007)(18002099003)(16102099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1fWEg+H8+IKVssBMB2c3tZhp6LE6S2jOI080cGx5CSPCBQBYvV3WxRQ1q0EFVPcYDOzP5q29bNObC36U8ouTm9tLqmL5nPYmXXHpmoqktuI7qZgF+1l0Sk/D5Abe/+DIVNeJ5KzfRdWWVZvXsCZjzEgC9RIGxrm8XC9sGUCVPVgz+CFqf2bAd2QVQakUskT6dhrOj1eCkK614549ZVwPIlgiQiTeluZDusncYxocktUpisx7POKasXoE6YZniJQ9ZC6a6I1c0kkEZtSAyhUZnpNJH9GeKAylCzNWfTiEvSBHfb/TJd6subQi7B6D2eS4Im3HJi2qC28R6Y4vp4tIUs0IizeBOrRbPw3BcBs7/hFry4razgh4jW5PKNkC3UzOvQ0HwGQiO9IrAeFzcnzrsRr78vQlPDaHpqOQp365N3d4FmKjWvbXIoJ4lHL5zY6s
X-Exchange-RoutingPolicyChecked:
	b1ZIv+STrAmn/wKgLDBCYNXVMlKaszjS0ghmskytedgo72mGI7zNYLBEuSCFtQmxB8klegL7k16SHDXDpoPaGwYtK72BLjJ/C7G19d4gN4i8SQgX5428A9/5j5DzWNkDq7rDBtofnHRB+jzUeWMd0Pxz4QcsQH2ldfhaGzF43yHhLwraYtFamNtZsslBlkPuIEed3onIarTN7pTlyNPBBci5DdfJAvKZt2sa1oghScCrR/d9InESLAuJ8zMxrqIFZ0q1Q5eAOBlyTyMaO+TQady3m3FbeotNs1dVKHcM6UVTu7tCh2FHcy/x7hoc9JbdSkpN7HmsPhDLY+ur4YPYIQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 12:53:09.0073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef47a8e4-1f1d-4f9e-d1b3-08de9edbc629
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9490
X-Authority-Analysis: v=2.4 cv=EdT4hvmC c=1 sm=1 tr=0 ts=69e621ba cx=c_pps
 a=h3Jk+6XEKCuoUZR+ZnWw9Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=BYnxRluM0qq1z8imhqoA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=8Mgw1AClMQB1keZqkH4A:9
 a=M1BFfIukhM_X4OSp:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-GUID: 1KEkzVrAEDk-Q9dX7-3F7SibsZiogsZe
X-Proofpoint-ORIG-GUID: 1KEkzVrAEDk-Q9dX7-3F7SibsZiogsZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNSBTYWx0ZWRfX5bc5/eRO7yRP
 EDchTxbyV8E8kkzqyoV8N8u5lYeJdJCn/DnTs2zruTi9QqX8R4Ne6Kv5Ya6IKJgwvcnqPRVqv9+
 zk5IirVSbF/fNK1gPOVOALSiju0LAs+beR1KI+5Dm7cOZqQ39cEDuBTgkV7sAwl2gTwfpzQwgRz
 hezWWZ6mhOTucNgyp949iWcOkD5BVvfs7MW5L6QP80OLNFRrIoMYCqNfAS1yFb19i1AEBVChvhc
 P4eKowBE2kRJMxhLvoKb8BJTz6D3Hdc3qf4KdUrzx6P2FF6w8xDxzspMBmPIs62tip65+e6DSyw
 jWobQK72xQPwKcdNULyz5AmIZcvy2nqW81FoeYZ8WxrV31GUuw6xveTDdi6VQRb/k18P758rcts
 SD+8NoXK6MsIQExaOxan2g/wXnZHiLooJc6M+3y5pKaNXqLNqWi5lRC8mVFPPk2jxEgf1kyggF2
 By1NEPYk2kfWwC2kyFg==
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0017_01DCD0CD.045C4060
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus CS35L56 smart amplifiers for
some Lenovo laptops.

 

(There is a different PR for a few other Lenovo laptops, I can apply them
here in either order so sending and not waiting till that is merged!)

Thanks,

-Simon

 

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

 

  Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260420-cs35l56

 

for you to fetch changes up to fd246bfaf9371547d83513137ce2c100816f2b30:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
(17aa235c 17aa235d) (2026-04-20 12:47:51 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
(17aa235c 17aa235d)

 

WHENCE                                        |   7 +++++++

cirrus/cs35l56/CS35L56_Rev4.7.2.wmfw          | Bin 0 -> 36308 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u0.bin | Bin 0 -> 13836 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u4.bin | Bin 0 -> 13836 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u0.bin | Bin 0 -> 13788 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u4.bin | Bin 0 -> 13792 bytes

6 files changed, 7 insertions(+)

create mode 100644 cirrus/cs35l56/CS35L56_Rev4.7.2.wmfw

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u4.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u4.bin


------=_NextPart_000_0017_01DCD0CD.045C4060
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
class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>We&#8217;d like to =
add the firmware for the Cirrus CS35L56 smart amplifiers for some Lenovo =
laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>(There is a different =
PR for a few other Lenovo laptops, I can apply them here in either order =
so sending and not waiting till that is merged!)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
3fc7117bb925983bc39d7ba957ce5fafe1f65d41:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'wcn6855' into 'main' (2026-04-17 13:57:51 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260420-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
fd246bfaf9371547d83513137ce2c100816f2b30:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops (17aa235c =
17aa235d) (2026-04-20 12:47:51 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops (17aa235c =
17aa235d)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev4.7.2.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 36308 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u0.bin | Bin 0 -&gt; 13836 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u4.bin | Bin 0 -&gt; 13836 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u0.bin | Bin 0 -&gt; 13788 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u4.bin | Bin 0 -&gt; 13792 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 6 files changed, 7 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56/CS35L56_Rev4.7.2.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa235c-l2u4.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa235d-l2u4.bin<o:p></o:p></span></p></div>=
</body></html>
------=_NextPart_000_0017_01DCD0CD.045C4060--
