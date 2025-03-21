Return-Path: <SRS0=6DfQ=WI=cirrus.com=prvs=217568d9e6=stefan.binding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F437C36000
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Mar 2025 17:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF849C4CEEA; Fri, 21 Mar 2025 17:56:24 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDDCFC4CEE3
	for <linux-firmware@kernel.org>; Fri, 21 Mar 2025 17:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDDCFC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L5KkmW026985
	for <linux-firmware@kernel.org>; Fri, 21 Mar 2025 12:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=GwcM2mJv1NJ8BSDh
	XhavINU9tOVFmf89P+MAOEmJzco=; b=L8kaQzfdusdnuoSS1Z8brwyBP9wRiXlG
	CPpUO99nzswoV1XTT710pVemttTOpddV4Jga060meVWISiP9JMZkoO5LmjsYDNdc
	iuJqMeDp2QBYVTpNdi9BGZDPE0jHz8JkpnubLkTixjgkVCoJ2XMb7OpIeWXUrDWZ
	i4BB1cnazEyPeLhhM9X+SwuasVgnsjs+O7TkSVvbV6RZ9v3y/nTl6YvvkcQak7NA
	4ZjpC080Si4GZJMaJALPKl0W//HP5CQk5dTUyisDeS38RN9REryv4wwnsEt8nJd3
	qCKH/rrQll/BlOfHkcq+L/QKYYXyJO/WECx0Xhgd9XSKfsF7RF2W0g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45g9p6vc3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Mar 2025 12:56:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPMbyi3BipfAFbSESXbKCsTxjMzH93tlaNbBaOoEHLQnfvph8qMg7vLyR9IX9Mpyfhg7P0ODELboVzJMVNlWlS7mfWTM79xrR9Bka0uqeb8Udg+Na7FY7pjeEZyxCCdv2Y+ntGSgaVvuxq1oUOhUJagXDgB/tbZKsNglOW31ZBQFZaSQ6CVQsGJXAHkP7V3LhVDDjoR9eUZaWpiTkJ9B7G/+a5ggcY4OZAhFp28ZvYeI0hLjXgjKLnQdOPktXHfVaX5MNVVMrInUV21eZbKnVnarGCy//9iTuUnznSn/nprEdhkZ9+mX9zAEsRzRLLFwlHGNUSsoSa1CXhYcyNC2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwcM2mJv1NJ8BSDhXhavINU9tOVFmf89P+MAOEmJzco=;
 b=ihwN4XhbJuJYykab4UL5iiM6iZP6XN5sMYphSD6qYhFc22+99ruEUQrAPkslENXfQj1yKwUkBYCTyj5beeaVGkmbmAmQnx8j5Cvi86gcmq9PewI4Il6xvOkOJVNF4zQkC4LUOCLi3KbGlG+Xq8QW6XOZGsEJPE77EcyITrUrW5FdOD3OD2OB0jv6l/D73Bsk7k7qdz8dUG1t1ZXQUvntvZQXZYql5LrsEewwCFYs9N7ksTWbmbACcE8XNX4Qun/vfbatnO/AL/vLDMQnTw3XRJsUNXJQh1BgYe0HLhE9U86AiJwOfhpcqJF2iH3sM9mQXrb0bhx0UKEBBEJhn9SqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwcM2mJv1NJ8BSDhXhavINU9tOVFmf89P+MAOEmJzco=;
 b=f74rxHrg1quytOynkPXLrPRtcNiO9O4stHzYTls12xAGqGZltOu8fUJTutlC9XR/3P6RqEq2PoV+zP/FAAaRHfMFRw+CzyEcfy/SdonIUadeimrCk/QLduhk1vUK5wYCsUrmJGx4liIAfhA5kA6XsS5++anRXA2SxdoBGvLbbdo=
Received: from MN2PR22CA0016.namprd22.prod.outlook.com (2603:10b6:208:238::21)
 by SJ0PR19MB5492.namprd19.prod.outlook.com (2603:10b6:a03:425::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 21 Mar
 2025 17:56:17 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:238:cafe::ae) by MN2PR22CA0016.outlook.office365.com
 (2603:10b6:208:238::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Fri,
 21 Mar 2025 17:56:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.2
 via Frontend Transport; Fri, 21 Mar 2025 17:56:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E815F406540;
	Fri, 21 Mar 2025 17:56:14 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CFD7D820244;
	Fri, 21 Mar 2025 17:56:14 +0000 (UTC)
Message-ID: <a5902c2e-5d5b-4c8b-b84f-d1594956bf80@opensource.cirrus.com>
Date: Fri, 21 Mar 2025 17:56:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for HP Laptops
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|SJ0PR19MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: 19201c6f-56c3-4366-083b-08dd68a1ad3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014|13003099007|4076005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUM3elVJTkFSSlZ6eWNTeEtLZS9VN0ZvTjQwUDFhUURESWtwMHF1SXZvNVBk?=
 =?utf-8?B?MVlxYkZiVm5KMkN2eCttbU85SnVUL2IwK0F0eFJRRDVzQUJIWkFtWGJZVGJU?=
 =?utf-8?B?UWF2RlltT0xRSmhCRFhXSWMvZ3Bqb1AyTFRlU3pYR0l4SWl4azBNajY2MGpi?=
 =?utf-8?B?bUd5Zk1Wc0FJOFFURnFhNTYvY0JGOXg3Zyt4VytScy9OekRrN1R3OGRKWjdi?=
 =?utf-8?B?OVVhWkRPNnc4ajZLOTZRNkhUZThyMXBlYnMxUjNWeTVZSlpTQitEN3FER1N2?=
 =?utf-8?B?NlU2dmszQkh5dUpRTnE2QW1vOEt3VnRUdGl5aTFhaDBXR0pxVWhxQXR1V1di?=
 =?utf-8?B?Z0NTVUx4cDNGZ2dxZzErUVRoWXptTStGUFBDbE4vT3VLVGNKZFQ4d0I1azd5?=
 =?utf-8?B?dEFyZWd0b1AzQUo0Vlo3M0xxZk9hQ2REQURpalVtZENiSWdkUjE1NmxkNnZp?=
 =?utf-8?B?dkY4V0Z6TmtmQkZMUU1Hb0VOS3R6cllCYkRqZE0xSGJXODBvREVYZXNnSG90?=
 =?utf-8?B?NTRYK0hsUU1sK0ZNZGJZdm84Zk05Qm1oRXFHT0tzSVpuSTJqdi9uYTZTSkEr?=
 =?utf-8?B?aDFSZG5VUy9tZTZySHpZdTJTSEY4OWVYQ0ZKM2ptNUFYSEVidWlvT3Vrblp2?=
 =?utf-8?B?dUNaaDJGVVZhbHBwblhFKzcvRmszQkZLU3BvMlFTdW9OOEQydHU3OGc4azZa?=
 =?utf-8?B?OENoRWc1T1RLRW52SGJNelJoTHE1STNCSW01SG9TMWQrWjBzV0V1UExGNE1T?=
 =?utf-8?B?K00xSkhXek5pR3ZMNmRVazNSbWFURStlRmZkSXk2Y0xTYUM0cklteUdEcFpU?=
 =?utf-8?B?WThMN3pjdnNYbFVHMURHcFhyM2VZYkVoUzhoZ0lHdFRpdmFuclBwc2NDdk55?=
 =?utf-8?B?T1hMQm05bGpFSk5ibzQ0U3dpbmtOVmlrcnJwODJlK0tkM05qVDBWVDdYU1dw?=
 =?utf-8?B?TWNmOVBCazB5elRvOTg2eFR2bWpTRGI0T0hjUk0wVzZJeE1sRlBQaEs0STY3?=
 =?utf-8?B?V1U2OU9zV2dCKzlmNHphcmZTUi9halpjTnlxVjhlSlBaTHNSbHFCZDlNcXhL?=
 =?utf-8?B?c3FrZXlybm1NR21KcE41SWszK1UvT3ZBeHFlMng2VHVBNExsSVFOQk1nYVo3?=
 =?utf-8?B?QWJSSDlwRjRzRkw1UUxwYi8vc25reE9aZ2pISDE5Q0NQc2J1S1k0djVmWmUv?=
 =?utf-8?B?TVNXZ2RwMDNpb3FSc2M4eng4WTN5cWkxOTFjUkoxVlFGam85SVVONGYrMWh3?=
 =?utf-8?B?Sjd5a3JGNDVydzF6RFJManVUcFF6NlR3YXBkVnVMQjVRSWt6WkVRN1JsUFFi?=
 =?utf-8?B?am9FRUdPUGFsZS84NWE2dGQ3KzdBQ2tVQzMzT1RXbGdUTHFUMDAvR2dlb0xZ?=
 =?utf-8?B?M0ZNMmY5NGNnOGZHajVvK2J2cEJuQkY0OGZCeFkwWDN5ZmVKWW5iMStwTENh?=
 =?utf-8?B?eGI5ZzlFZitaVUxOb3B5eWREaEh6RmtJalZFVWRHUWNYeHZHem1IYzY1THNR?=
 =?utf-8?B?QnExWG0rdG5KMUJjVm53aHVLSk9CU0V0eEVDM1ZRU1FoZnVUWUR2WSt0d29P?=
 =?utf-8?B?dzUzQmtzZ1k4OFl3aitSajVNaG9TWnNQWEgrRXBsYmhOT21GanhZUGVOQVdN?=
 =?utf-8?B?L3loKzJLYUNIR2RzZnJpZkFBOElRUHdZY2lDQ0Jrd0UxTXlGc0ZydWM0eFVn?=
 =?utf-8?B?cVJnZjcwZThNNnJQd0I3amI0eHpsKzZIaFUrRzFmd1RXUUZXSUxzcUo2N0VM?=
 =?utf-8?B?Y2V4Z1NycXRkYjVycTZsWm54UjVzM1RlbUZUUW9rckd4VVNjUTJHTWpQaFNt?=
 =?utf-8?B?V25EbjJwb1kvNnIvMUgzMEdTSExrMEdaT3Z4YWtQTktZQXQ0VnZVYzRXSFBZ?=
 =?utf-8?B?aDE1Y3E1S1VVYWhGVUNkQnNhRXpLWDRmQnBUQTR5LzRsYkFkYW9pL0JSSnc0?=
 =?utf-8?B?YlhnVCtBYlk5ZitHZUlmMWJ5UGhYSkxmeVBjVmhyNTRZMVZCZytpaTAxRXMr?=
 =?utf-8?B?S2IrN21LZU1KUmNIbFFEdlhUTVo0WVpOSllJWmx6Ukx1RFRwdmRxc3QydTRJ?=
 =?utf-8?Q?T+VVhH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014)(13003099007)(4076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 17:56:15.9772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19201c6f-56c3-4366-083b-08dd68a1ad3d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5492
X-Authority-Analysis: v=2.4 cv=Vcz3PEp9 c=1 sm=1 tr=0 ts=67dda846 cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=XOvZ-u7BoKXBYvrOctQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: oXvxf4OgoPNkKlZLLk7PP_pPjofz1DrW
X-Proofpoint-ORIG-GUID: oXvxf4OgoPNkKlZLLk7PP_pPjofz1DrW
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for 2025 HP Laptops.

Thanks,

Stefan Binding

The following changes since commit a60087f7c9254065efb9e641b66af67e4c57b29f:

  Merge branch 'robot/patch-0-1742462166' into 'main' (2025-03-20 14:10:05 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250321

for you to fetch changes up to 139c1b5faeddcaffb6466348f4f731533edaa008:

  cirrus: cs35l41: Add Firmware for various HP Laptops using CS35L41 HDA (2025-03-21 17:52:52 +0000)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for various HP Laptops using CS35L41 HDA

 WHENCE                                           |  51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin | Bin 0 -> 4704 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin | Bin 0 -> 4700 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin | Bin 0 -> 4708 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin | Bin 0 -> 4712 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin | Bin 0 -> 4716 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin | Bin 0 -> 4712 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin | Bin 0 -> 4804 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin | Bin 0 -> 4796 bytes
 9 files changed, 51 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9b-spkid1.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8d9f-spkid1.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8da0-spkid1.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin

