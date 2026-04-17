Return-Path: <SRS0=j+0h=CQ=opensource.cirrus.com=prvs=5567168045=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC6AF436BA
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Apr 2026 16:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BAC1C19425; Fri, 17 Apr 2026 16:09:28 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4799C2BCB4
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2026 16:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4799C2BCB4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HFmmYJ2370837
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2026 11:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=TcjdoH4ppoAuU9pA34wcsU97l3njsASlU43C4fkdvBU=; b=
	SAwUlOznI119yWZ7ZTnXA5MH6t/TW3IFWRBMoYX9rbiqWcQKq2OshG0lHcvibkSx
	13fIORxLydA5+dj4MWIj3hyIr9jyzmp6Y+RHulnrZChJZth23K+QIBQGIf6jm06I
	FglRWuJzavPOL0CAQCZAcvGPeuMrSpqsIi2HOyPxcvVuKHo4f0+pnV6gB8xPNzCx
	zcKIuyFbgq1lsKUK3cuV4s43uu7h0MP0aAWuyc1xQUJypn7oHYSVBgtnYLdR2y+2
	gwdFCZmZS7t5OZP+1jVhN0B8ODLz2jdHdYe9bRnuWVEQ+tOBPKL/9S29EPxhKCds
	EeNyC1Q156visqIanPcEYQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022092.outbound.protection.outlook.com [40.107.200.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dh876nav9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2026 11:09:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yXvby9vpW7REiK8T80qptA/DAQdjMsvG7znm5I4DYY8455zJ7gwe/91mMdKT8hfE37fen1obxCGCcWTsh39A2+lB74EOzI/E7qkPk+rzN/o7M+c8M37L+bF7mFWI1n1o+FvDQuzuGtCmc/dN3/BqYbOI87j9EASlJygOjU7hBfy76GahoD+5pogcfN4jOG6TexAZZeepY6BWmIH8UBVpLNOEo4/HdGOPgim/3lrLKcj/VrirduW1cGxSvN2BV3ucWNXasFwUKpr8u3VFkBOgCuGItdrR4ksXnpJXNoF/LAEkWAPXZfa1dsnl5wYlS8Gp/UjS14HV/pSqF8HG/F6Aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcjdoH4ppoAuU9pA34wcsU97l3njsASlU43C4fkdvBU=;
 b=ebr+k5n6g5nnL07gQcwoyp1sM4BfNxP6LvwN7luTNXfSn924W237ewEjuOYOvav3XudoSchCs8PQtkHnHb4lygUz50RlnKP/Dw2MctLTGVzASFM7IzhWVC2nhTLgZWrOOIb/JfnNJsMa3w2PlMBsqKuQdnRumNbg9AgRErHupZ3knkNe+cAnqDLivXmIi0INu1xjtAWJnJ33K3fy7uImr1/y588seih56Yv60HOLNExVNRZh5j9S3Ve6j498C0k6ICglgoJE7VtCTRq2EjR42TYxeYxDFH2d7NAFJK5ocUYkY4ipDjt6hoJL4tqf1NkZEzsZOV/ICCUXKoPGRhBYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcjdoH4ppoAuU9pA34wcsU97l3njsASlU43C4fkdvBU=;
 b=FvqsUJz5XRXAlarRVyy6Pe7REf2tDV0XdUoOVXCde9dCMOa9Xx0ypMVPmnTDzMBGwGSpU3mt+Z1diKXPsYUHZWZ5yGtwPBIsXXE0sAupbXFkMf/sijnQFHTgJyK9JhqqJFLa+BV2oWTWkYj5phMv49a51xKtgxEQmxMGfVTv2q4=
Received: from BN9PR03CA0800.namprd03.prod.outlook.com (2603:10b6:408:13f::25)
 by EA3PR19MB9522.namprd19.prod.outlook.com (2603:10b6:303:2b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 16:09:22 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::5b) by BN9PR03CA0800.outlook.office365.com
 (2603:10b6:408:13f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 16:09:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.0
 via Frontend Transport; Fri, 17 Apr 2026 16:09:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4EAF8406547;
	Fri, 17 Apr 2026 16:09:19 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2E84A82024A;
	Fri, 17 Apr 2026 16:09:19 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some Lenovo laptops
Date: Fri, 17 Apr 2026 17:09:18 +0100
Message-ID: <000601dcce84$8becd030$a3c67090$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01DCCE8C.EDB2BED0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdzOhHPCl6QN2pfYQcyfzJyER7C52A==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|EA3PR19MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd94ad7-e07b-4d52-6e14-08de9c9baf6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|376014|8096899003|13003099007|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	RJ1TVfbO5qWZfwEmc4RlawtBGu164/9BBscmTNCuPozMRSoyvd+9A5ljFyHXC5iQgYMAcamtRNSQJVir4KwLibCOiyVVdOPIvqqsUDGsiyPMGtEBccY81zsqgvagWjPLTXIopb6H+N6W2c3kLmsrdDJ3maPKDTPBHS1I7Lv2DwjaZVb25/BVjn3xCcmczq413EqIEyQVQXJr35cbqYPUjAZOKy32sxo+vlEm/cszjxIkZ4jWVqtYZp0TyNGdKFf35Okk+Ab5qkaJeyQOTaL5Gme8UedUI18NMXvVWjfXgHjAO6Gu0msz1bT18oZVA1Wll3otbPmi6gXkbO7MIXCOAoyBeuNDUXb4+Tqz1TgOlOnBHo9QVpRAlCuGeyEvOfpEeWDmzYkxOMLvoZDum9gJipyv9fzUFlx4iXZCDr4tqk+mUkrUObnSeI/WzeliifrQk5d5Z/40nUacdSF54rYNEU8aV1KGJDGay8YporafhWpuxrNjny4d0NFXYiOFQUuTkAWjEbfbHtFQZjoY92yQ8s2I7aLJo7FvI/QqzFYanDdqNPqeuzNGPON0bI/jLAQoobpQ/0s+althxp48o0VcuBy6Q5tSuDRoX7+/4kUtv4EGr3GL5QBP3Rdvf9KM7jLMcH4HeBFhvoen5hZuJL8JBpXW1jh7c0BWPosgw/iZ1Jl9QTE1OG1Ke6mfI4P5RvmDNwbKeyTgxHAQz4Oj8YafFAr305LhUFKLIGq5cf6Qzz5bizfBzrk3Qp3W73pOrj68PykEgqyD4XyEDtc4ACSGoQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(376014)(8096899003)(13003099007)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RHVIbrshDsjec1iep9jFYdZK6nGs7WomMNXHxx2ocf2LAXVf8kvO/2YKlABfInBxq7y48ojUSYzzK8rrkfVoBmBBRAJ41oea7ol9920tbqtC7oPVVN0pO+hLFjHyATJXha6e8C3fkIcTOVV83QEinX32zx+3KzhCKH05OgUmqKU9YmiEsHBpKFj+J6mzv/QyDhkYLmfhgmTAi0NvWwgnCG9sfkjcHLKjTjdujsLiwDUFe9ojgDctowFmHK22CG8NJ8No8vDaGqytJ//dmu0mm2F0CjmKjO5xDob7uzCPzgd7MJb5d9bZlmeqf2jb0B32hbJeDdiNBxFohVafwexnyQ2dErZlxOu87I/AMDh27GlKWwHHKmasID/kmCj3EX2t5ljQ8nWyf4BHWDd3sFaM4xHhC6Tyy/vqK/aBDEf620yS//BM6fauC5Sj/eCZyZvU
X-Exchange-RoutingPolicyChecked:
	SlIpQoiUo2bb52KbwT7Rt2AZPsVP2VM3FLzxESavbEh1jZFcrcuitmK1a40FDk2D1z6VSQBJ0jQPZCfFdxS/J1ab/Wh8EG5syhg5baEVc7j80nOm7h3DDjsaHUwnlEM/+H5hbbQWZegXiIiyqKILRyr4VQKRTM3z3qtnaJZwQJwXMunoJx/qC5OQ1/Rm/LSt6Bx6ckpnswPFCIpkQsDyzfoccJTbRN2C7xXd5jBYRdADEipyjE436K43IcPZFGrfy2mtHLQOd/+mc84EVHRQeA8KhsvjmwLilUenhgHJ+JlLupr+LvK+pJx/swcT54IJc1vDEvC2lDd7uTxsfBXLbw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 16:09:20.8253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd94ad7-e07b-4d52-6e14-08de9c9baf6f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9522
X-Proofpoint-ORIG-GUID: zea_OXpTQXbK1NUVTInpJoU6v-Hyd67F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE2MiBTYWx0ZWRfX8X+W6DamyiCl
 GHwXuDtXOQ0I7yt4uXxD8+S01CxTcGjqneFH89ri7uoWEjDXlTTERxHG3Ixz0YuTTdOHus/RziA
 ZfVLxbyHxLwEjVHi+rWVU3okAgFpSOpf1vMbaA5fD7d/s6lJSo/FDeNinIcgh6erxGvRM8Vr8Xt
 oNfo6YzWAesJFOWTY2GjqRVNRSSrRggX9p0yagR22Z3Wms36O0Ob2dkWTqlVvhrTEpWAewlv8B0
 U6BQ8w8st7wZokeqytiBt/K3H4AWI5G3Z/EKVOElYIFhfwx5yL/hI5E9URiq6DjroqX7UfhgFqK
 L4nNOyF6SfBAcyKWsHWZsUmpZCGz+x+16R642iJV/OMrleevtL73AAeWvj/7GeNdrITx2NfE/UX
 xO8l6it6jq7c2RdnFja+u32WLH/OJEMXsSFI0Z7k+zHShd661AI6GB/fE/6yd5mPxHN9zJXRAKw
 GvIieCwLzqSgpIActvg==
X-Authority-Analysis: v=2.4 cv=Iq4utr/g c=1 sm=1 tr=0 ts=69e25b35 cx=c_pps
 a=GQpUduAn5o7mR2pN+hR1ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=GBKYsqsYzViLMB_sIZoA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=xB9r5p8WoM-TgbvB3ZoA:9
 a=9xkiBLD-VU9I7GrH:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-GUID: zea_OXpTQXbK1NUVTInpJoU6v-Hyd67F
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0007_01DCCE8C.EDB2BED0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus CS35L56 smart amplifiers for
some Lenovo laptops.

 Thanks,

-Simon

 

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

 

  Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260417-cs35l56

 

for you to fetch changes up to 8c4ab259e638a6cf53cd7528f82b8e7cbd031b0b:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
(2026-04-17 17:03:00 +0100)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops

 

WHENCE                                               |  10 ++++++++++

cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp1.bin        | Bin 0 -> 11592 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp2.bin        | Bin 0 -> 11592 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp1.bin | Bin 0 -> 11624 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp2.bin | Bin 0 -> 11624 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp1.bin | Bin 0 -> 11612 bytes

cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp2.bin | Bin 0 -> 11612 bytes

cirrus/cs35l56/CS35L56_Rev3.13.0.wmfw                | Bin 0 -> 35896 bytes

8 files changed, 10 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.13.0.wmfw


------=_NextPart_000_0007_01DCCE8C.EDB2BED0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
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
/* List Definitions */
@list l0
	{mso-list-id:814764469;
	mso-list-template-ids:-1637942232;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
Cirrus CS35L56 smart amplifiers for some Lenovo =
laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
3fc7117bb925983bc39d7ba957ce5fafe1f65d41:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260417-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
8c4ab259e638a6cf53cd7528f82b8e7cbd031b0b:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops =
(2026-04-17 17:03:00 +0100)<o:p></o:p></span></p><p =
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
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
10 ++++++++++<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11592 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 11592 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp1.bin | Bin 0 -&gt; 11624 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp2.bin | Bin 0 -&gt; 11624 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp1.bin | Bin 0 -&gt; 11612 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp2.bin | Bin 0 -&gt; 11612 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev3.13.0.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; =
35896 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 8 files changed, 10 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa395b-amp2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa395f-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-17aa3960-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l56/CS35L56_Rev3.13.0.wmfw<o:p></o:p></span></p></div></body><=
/html>
------=_NextPart_000_0007_01DCCE8C.EDB2BED0--
