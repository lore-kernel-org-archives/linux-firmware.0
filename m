Return-Path: <SRS0=T39p=Z7=opensource.cirrus.com=prvs=62944a2953=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D0DC83F17
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Jul 2025 12:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86431C4CEF0; Fri, 18 Jul 2025 12:27:05 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31DBDC4CEEB
	for <linux-firmware@kernel.org>; Fri, 18 Jul 2025 12:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31DBDC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IBLqbx031841
	for <linux-firmware@kernel.org>; Fri, 18 Jul 2025 07:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=9VMIZb3dor7aGhLbnXQYACyaPW7XvcbiFYRC8e2vfss=; b=
	gGEfmqExuE5M/D5Cd/mWSfekOfL3jmFrzR37sjbClIFybzA1Eq34z3S8lM3+FqBz
	iI3CJm5Vh8BjHt65Zolg1nNKux+O12blT3MOYWUrdI8z2k0/zeCigBkv1OvTYdOY
	OHg1vDfsKoKRrStBoytMahP8u1xM8aAahrjI1gl6TqlbaF88j9tL8OHv4lKsCnGG
	iHHqQ8HkdHrJCgCGtPxea588um5koG78MAvHy3VQmjAnGyMEh70BMXfVZr6KNAhu
	XbiVr7AUKvESgDzKIWsMQoaBSmh0LV/U8YkTqsdiDcSpF/yM14qmXGEfIiHATFHy
	cuzqFsjpccgs7dgZZ8I1lQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2098.outbound.protection.outlook.com [40.107.243.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47x7uuucmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 18 Jul 2025 07:26:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNgDlcDkfC3suiFvlHlDGc2QbOsuAO55r64Uvxsam4d0a0+JMZSGY4v8yaLZ7XunzjFUU99KEIGyjhG0KX8/eMXzzEhwQza2nlOD6VbMn1MId8capEZW9kepvRbbwXxx0725jzLnAKSwMdKo0lLVDhjOY6yYz9lfQ60dw1UO3U/UxQBNpRNIDG+Yf2rB4TrtdHEdjMkzWl0FSZvvbKcKmi4gcFZqA19dlt8dDXntNQUtPd4vn8z5kha6/BaZVJY3NPw3S6hUQP2lsa7Mu9c2aflHp5DrEn0Z3ix+cvafnujrdAxclMCAMie0AHpjlmnK57s+QWMM5gktylrN75RTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VMIZb3dor7aGhLbnXQYACyaPW7XvcbiFYRC8e2vfss=;
 b=TcGwt6W58c/a+CpEa876bjbQojoEnKFQzPFMmhNLlQUTyTrFbpP6zW/nvwMe+SZE2PFd/zZpN8hT0PZCay8/tljbTp34lxWQKnA0QjxyPrq+6TG0OG9yctI7xvCLyeZVzKwdlzVE0ZDc4GKt8CIKEQlPP0oBfD1CMoTjklJ0C9YSzwvalN8BMVLSlcXNtxmwDae6itp0gZqK1B3FGiPO7npuncWVQ1ZDRWf0t2DAPhNYmgksTmE6ZgJEyCCZ/PaC2jtUvQLTXcG2wcNQzMux5HN8KDXjedpfUjAa0Ob4InRQ5Myq+otmQvV71gvBLa2R9JaDaQKtC/M8i9bF+A0XHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VMIZb3dor7aGhLbnXQYACyaPW7XvcbiFYRC8e2vfss=;
 b=Cjh1piWZmZxhTP9sEWu5TAIitnpU8z0DxbThr8wyE905tnC0MzFyOYAUgMfg3i2ZnnQNUF/GuXsgGjs6UnRGxtSvBq4b0EuXRxLGIfuoG1yoihpTCzP2LcgO6lN5UATwCjc44Udqs9ySjjuNsOFm6yaHbmBv0qMmc+vcb+bdLVQ=
Received: from BN9PR03CA0299.namprd03.prod.outlook.com (2603:10b6:408:f5::34)
 by SN7PR19MB8004.namprd19.prod.outlook.com (2603:10b6:806:2e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 12:26:53 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:408:f5:cafe::aa) by BN9PR03CA0299.outlook.office365.com
 (2603:10b6:408:f5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Fri,
 18 Jul 2025 12:26:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.1
 via Frontend Transport; Fri, 18 Jul 2025 12:26:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A5246406541;
	Fri, 18 Jul 2025 12:26:51 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.69.69])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1CC2D820249;
	Fri, 18 Jul 2025 12:26:48 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some Dell laptops
Date: Fri, 18 Jul 2025 13:26:45 +0100
Message-ID: <000001dbf7df$3cb69d10$b623d730$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01DBF7E7.9E7EAE90"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adv33wlJgv7sOfMiQ76wrN8b00gesA==
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|SN7PR19MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ccd7ec-1ebd-4d08-c9f7-08ddc5f6607f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b43Sbi6EU/77NVUsFVQ50dveSdnhBIj5ThYkZhUlho/qfPQ00EqiuI5xwsmz?=
 =?us-ascii?Q?6roYYwptr21JgJ3PFMEcWqb3NqbYpp5gy+ujo3aYTYTxyvFvNIIb5SMTvffF?=
 =?us-ascii?Q?g/lM+ENYwB2ubKoKEMA6qeM0DfEunsnoYjJV4kE/tkuVQDHGpjHylX4aVPJD?=
 =?us-ascii?Q?ErNITjZVnXP7LFeb4dAclo1VYMEF0JVS9i9ACBOUIZ11fX/ZV9TN/tGSWCvU?=
 =?us-ascii?Q?YvGkGL7t3y1jXgdHs1Jwuy6HUWNb1OTHtmeObMCbstVMlfIoh6dYjy3Zs4bN?=
 =?us-ascii?Q?nV4IEiI1VXznkISgDPoy/DB/hdxP3e5a0DJIDBk62WfCYLGubakqUKbJj0cL?=
 =?us-ascii?Q?DALsl/ycI5sSayJZ7jwV5AhBpu71YT59PNA7NAxxaaetEQSiiA3bnr5KGg2p?=
 =?us-ascii?Q?vmjG33NakQxImMcCtkCgSa/W8jMpI/NwCPg8XizTMCkt8PycipfjyxfzdTvF?=
 =?us-ascii?Q?5bqrpdjYDAAKe+8d2R+BI11HgzQAzX2IQb0EMJIfvnzI/a/dXdTg0bdJlC4c?=
 =?us-ascii?Q?JgQ5TNjpDz9EKZACjy5I8V/J4peacVqRhQR1VyDL2nk+MTr60m+9YGB/EoMx?=
 =?us-ascii?Q?PKgeeInTyO9lfAKEz5hZwvE+nla1iLxk1lKYAcguyKvGmdK7t2/r6s334viD?=
 =?us-ascii?Q?2IbN6vOIuJXqp+Hy6hAwYN/4j0Z6l1jbwzVL9ReKqfgKk/aHVECAIpAW13Zu?=
 =?us-ascii?Q?4VygovCbZGgIWQ9kUfjcX3jn4mD/hnXWc/jin0kL4GIwKVKsF8fpY7L+muc9?=
 =?us-ascii?Q?sN1k8HY+GFtHdXd+O7WOUbtEvHy7hUrhl/kDnFQ5knq37YKM2LD926OV0UFp?=
 =?us-ascii?Q?X7YDWYEv7U8eRrD/lKpaAyCXZDGb/S2L0l/SV/rHcFSKMrGNQhW2flY0EY6j?=
 =?us-ascii?Q?VaDVeMxYpT3j/JDTbzM8zNP73vs9ngiyvXm8an3nhu7VbMZGZwJJJ4e7HrMW?=
 =?us-ascii?Q?LprfbHjuDUlCmhRx5D8tG5oOcVeS9vri+RoAWwH104zchj3NLnEs3SH3bo2Q?=
 =?us-ascii?Q?St91dXYVQu+8aZvsigCr61Qp3puXmdG7jM+lXTrHvFZk+qBI3QG5rZxqe7CV?=
 =?us-ascii?Q?OH4Ghe2uR8L7wsnOGuKWKaMBAfUVlKj9BfH6JRQlGLmZkp0Ybiya1S+fJHzK?=
 =?us-ascii?Q?s4UeFwM9oj7yt3BJCJhEn182IbWBTBF+aVjBh5GlzX53U6HM9An75G3qvFFL?=
 =?us-ascii?Q?D1cKpOdyw4EzyOzfqCoTmlkk/P1a2TeSgFxevbS/I0w+csmG8wGEIN8EbECj?=
 =?us-ascii?Q?zYStWbAJWlbsbzr18k8sU+/3HzABNmrpZ2nGMgnxQ4FGuDR7DxLaU+UnpOvf?=
 =?us-ascii?Q?6X+X0W7YpNHOzfa75onzFOEmNRo3DxbXstvTX7ugf+JPowGSen/vLLFr39eJ?=
 =?us-ascii?Q?bwTgRVSATVqt5Jchdjpb0FG3kDikE++cGTp9WjcyEpb8kgBVyqZJWbHsXlrd?=
 =?us-ascii?Q?lNFzEhJ90+c95F+4DcxuFcnOGNGKBCXCop9D0HOAc2M1RmhZWcfzTXOzQNUu?=
 =?us-ascii?Q?Lv+SMGPkm7tZnT4ZVn4hAta8xbB9tSqHhBbz/BFAvVleViBaJCg7ahXXuw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 12:26:52.5940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ccd7ec-1ebd-4d08-c9f7-08ddc5f6607f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB8004
X-Proofpoint-ORIG-GUID: dR090ZxFibbBInWq4_kjEt-hbFv3Svhq
X-Proofpoint-GUID: dR090ZxFibbBInWq4_kjEt-hbFv3Svhq
X-Authority-Analysis: v=2.4 cv=IIwCChvG c=1 sm=1 tr=0 ts=687a3d8f cx=c_pps a=5N+ZmODHLrjtpHeH7ivgPg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=kbK-KqFIj4LbCbh1wgIA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=JSyaVXB38uh6LRHlGHAA:9 a=bkQb7rFmrTMQd6So:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA2NyBTYWx0ZWRfX/c2c3ATkA11C JMdWHVmaMsWvcDx42T/YNn02uRDUE0WL0uGy0aHWNGddTBHfcC86Pi8Hceo57xUBb/BvItLUcjD HEN7w8sPEW51p/uo9WRxzn9qaQNBhyWe2sKZOBZcrtTklZO/0tavEDHtz7vhnjlON9H8/pFiFRX
 9WD8VhhpnJcEM2cYYO0RfqV1crguCTPzJE82CIltCKyoxfFgnFVXHgPwWMqJendYoN95wcmK2NM q2fJGZKbiBnMfpnfVYUiZQ1F4ZfMFWDA8dHOU4D8GLgvVISTxcyUWELCwaH/Sgy3EZciKqoIMcv L5DWy8jlWgHY6rthqvEVyKqgsC3BZwBqSPYzzAQJnQbKLrjGkTh+yjQw4giqShqrBVQzvOPy1Yq t8lCxLnf
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0001_01DBF7E7.9E7EAE90
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add the firmware for the Cirrus CS35L56 smart amplifier for
some Dell Laptops.

Thanks,

-Simon

 

 

The following changes since commit 6fc20e018cca0ab954fe249afb60ac5af69f102a:

 

  Merge branch 'license' into 'main' (2025-07-17 14:40:28 +0000)

 


are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250718

 

for you to fetch changes up to 66cc5ebaae28bcc0428b329679b3c377734fb483:

 

  cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell laptops
(2025-07-18 13:17:26 +0100)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus CS35L56 for various Dell
laptops

 

WHENCE                                               |  51
+++++++++++++++++++++++++++++++++++++++++++++++++++

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp1.bin | Bin 0 -> 11524 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp2.bin | Bin 0 -> 11516 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp3.bin | Bin 0 -> 11524 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp4.bin | Bin 0 -> 11516 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp1.bin | Bin 0 -> 11528 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp2.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp3.bin | Bin 0 -> 11528 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp4.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp1.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp2.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp3.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp4.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp1.bin | Bin 0 -> 11504 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp2.bin | Bin 0 -> 11504 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp3.bin | Bin 0 -> 11504 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp4.bin | Bin 0 -> 11504 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp1.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp2.bin | Bin 0 -> 11492 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp3.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp4.bin | Bin 0 -> 11492 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp1.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp2.bin | Bin 0 -> 11488 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp3.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp4.bin | Bin 0 -> 11488 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp1.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp2.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp3.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp4.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp1.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp2.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp3.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp4.bin | Bin 0 -> 11520 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp1.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp2.bin | Bin 0 -> 11500 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp3.bin | Bin 0 -> 11508 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp4.bin | Bin 0 -> 11500 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin | Bin 0 -> 11516 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin | Bin 0 -> 11504 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin | Bin 0 -> 11516 bytes

cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin | Bin 0 -> 11504 bytes

cirrus/cs35l56/CS35L56_Rev3.11.28B.wmfw              | Bin 0 -> 37404 bytes

42 files changed, 51 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp4.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev3.11.28B.wmfw


------=_NextPart_000_0001_01DBF7E7.9E7EAE90
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
lang=3DEN-GB>Hi,</span><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB>We&#8217;d like to add the firmware =
for the Cirrus CS35L56 smart amplifier for some Dell =
Laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>Thanks,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB>-Simon<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
6fc20e018cca0ab954fe249afb60ac5af69f102a:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'license' into 'main' (2025-07-17 14:40:28 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>are available in the Git repository =
at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware/">https://github.co=
m/CirrusLogic/linux-firmware/</a> =
cs35l56-20250718<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
66cc5ebaae28bcc0428b329679b3c377734fb483:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus CS35L56 for various Dell laptops =
(2025-07-18 13:17:26 +0100)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus CS35L56 for various Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
51 =
+++++++++++++++++++++++++++++++++++++++++++++++++++<o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp1.bin | Bin 0 -&gt; 11524 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp2.bin | Bin 0 -&gt; 11516 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp3.bin | Bin 0 -&gt; 11524 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp4.bin | Bin 0 -&gt; 11516 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp1.bin | Bin 0 -&gt; 11528 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp2.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp3.bin | Bin 0 -&gt; 11528 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp4.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp1.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp2.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp3.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp4.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp1.bin | Bin 0 -&gt; 11504 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp2.bin | Bin 0 -&gt; 11504 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp3.bin | Bin 0 -&gt; 11504 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp4.bin | Bin 0 -&gt; 11504 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp1.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp2.bin | Bin 0 -&gt; 11492 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp3.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp4.bin | Bin 0 -&gt; 11492 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp1.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp2.bin | Bin 0 -&gt; 11488 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp3.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp4.bin | Bin 0 -&gt; 11488 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp1.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp2.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp3.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp4.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp1.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp2.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp3.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp4.bin | Bin 0 -&gt; 11520 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp1.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp2.bin | Bin 0 -&gt; 11500 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp3.bin | Bin 0 -&gt; 11508 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp4.bin | Bin 0 -&gt; 11500 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin | Bin 0 -&gt; 11516 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin | Bin 0 -&gt; 11504 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin | Bin 0 -&gt; 11516 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin | Bin 0 -&gt; 11504 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev3.11.28B.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 37404 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 42 files changed, 51 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid0-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce5-spkid1-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid0-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce6-spkid1-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid0-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280ce7-spkid1-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid0-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d32-spkid1-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid0-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56-b0-dsp1-misc-10280d33-spkid1-amp4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l56/CS35L56_Rev3.11.28B.wmfw<o:p></o:p></span></p></div></body=
></html>
------=_NextPart_000_0001_01DBF7E7.9E7EAE90--
