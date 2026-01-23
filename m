Return-Path: <SRS0=dJZM=74=opensource.cirrus.com=prvs=24836de667=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2CBD74EEC
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Jan 2026 15:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0341C19421; Fri, 23 Jan 2026 15:37:21 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 386DDC4CEF1
	for <linux-firmware@kernel.org>; Fri, 23 Jan 2026 15:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 386DDC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MNN2G54011220
	for <linux-firmware@kernel.org>; Fri, 23 Jan 2026 09:37:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=iW0tvp+XBg4EXuCjdQEydqxzG8tRuIpoR7WghslwMCE=; b=
	QmwNa4gUY25k8xZ2IpyNXYp5T7w7HOBGRhDr1aHFeCO/GlR4MDRfK4GlNxkjdjlq
	U1N9cds7X0gc5BZ0dd/3tD/OIMTZcVOnymMylGvG7ELLV2CU0qvzzFuwsyHf+Ys6
	2TdYTI5ikdwR7qDq15lV2RLC9qaLL+1K9kfskzvyy6wD4S8FHGvGsaLaj3LCsQqA
	MHKPOlOImO0vyuZdSBoaPkSftPuarH25WTsSFiHkVX0DYcP+3zYCUfsXKUe3AeE1
	7ZusPf9vKjYlnJY1l7Emxyf+0gjFhuA99YFXi221QvN2u3smH1BRk+peRklrqtzA
	3OCllwOI796ngG6jmcqu7w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020109.outbound.protection.outlook.com [52.101.193.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjywdm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 23 Jan 2026 09:37:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtE29V+zHzMd3VV1TeClh/gzIax8tlrs3uCZR+2vH4WLXbBcyOHFQ4IxA4QguvafaElniSz/0YIHjhNPrpI/ejrp1kUmsCEDK3GyR0C8+j1RxceIS4HtFQAZbDJrT2yb9q7LVm1Ncr16/YHaKsQowRsEHou8HYjnKn/adrpa+89JIFAkKuejEEWxpIuM+FeEpbRQ49K2kS7chTjnlSNPawW60aCs8lur2+jSuW7qas1ixC5nlQzdJiXhctKqPFCZNL+KWlNEZHOZScyY5viLU8PlmoWmWbBeGlm02OITPlgi/lYWRUiakAH54pcu96206NbgD1qhK3xSlHreyZ46aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW0tvp+XBg4EXuCjdQEydqxzG8tRuIpoR7WghslwMCE=;
 b=R4x3gjLqo9RyjpIuAwiAx6NGM78hAymR42RXT1KQrRdAHpqcPHxdjdr4Vp42EflOreTpimxv1azuFB/JWo3ELHWPkZ8ElNs8QoeNzW224paOLr4K65N0lcgiX6nyEegHJhlrtAOisNa4FKxuf4ERCSUgjRb5MMWPjpImMOfITFo0KsAVKzPEVzCL84rNMQG2c/L0LDC9O3x2kMI8GjE7b6Ru1GpFwWn0V1tIOI1dGJ+0YGNrvY22VuLU/bcZMUwo07CuK4HLM5+v3uRbdisoRBExmFJsJv6KetKgInkP1Mzq6KZw46Sw6wFE+1qIxKbJbTLQmynYUNHMdWc/b2Ha0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW0tvp+XBg4EXuCjdQEydqxzG8tRuIpoR7WghslwMCE=;
 b=pPuzqsmomqGMSP/mOe5iD7KriSUci72CxMNOJww5lPdMUtQOgO9PiI5h69dHqLJ0q6yNT91+0Um6cIjqB/MSb8xx2L7TGzPW0xIYntFMerJHOO/Z1Rnqz/IdTYOPKyBsYzxA+OexaXM53PAP9QEsW5F1lFtqtuqSyUMJkNKGyec=
Received: from SJ0PR03CA0297.namprd03.prod.outlook.com (2603:10b6:a03:39e::32)
 by DS7PR19MB4599.namprd19.prod.outlook.com (2603:10b6:5:2c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 15:37:13 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:39e:cafe::4f) by SJ0PR03CA0297.outlook.office365.com
 (2603:10b6:a03:39e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 15:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Fri, 23 Jan 2026 15:37:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A665A406540;
	Fri, 23 Jan 2026 15:37:10 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 788E7820249;
	Fri, 23 Jan 2026 15:37:10 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps and Codecs for some Dell and Lenovo laptops
Date: Fri, 23 Jan 2026 15:37:10 -0000
Message-ID: <00ba01dc8c7e$23a13e50$6ae3baf0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00BB_01DC8C7E.23A38840"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdyMfg2a9iiT6yGITPeDBv/vJySMfg==
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DS7PR19MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7a6a76-6523-4da3-764c-08de5a954740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|13003099007|54012099003|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OUUx8wZUywsHT/KWNeiTVTwPG9euxEz2ou3VDpeINjom6KuZSi9aQaB+ltHj?=
 =?us-ascii?Q?vO2B2+o67tpVsje6QH2eE92+oBZ8E9I/ZVbldb2F2BbZ4Qgh4Lj6hoKpIhG0?=
 =?us-ascii?Q?mlMj/DY+vq3qrHI63EXtiodyhcIvhs5mKA/2ffTihUREcouG3yoAeCI6JxrW?=
 =?us-ascii?Q?cb0nVcNu0kxyKlM6ntBDDB1Ym2D3q9RHVYLiogkpleX+G/jPFwkOcuN71VLR?=
 =?us-ascii?Q?Q52ZCOph7vA25dTfXt1D6kMNUUmabdmOSPeO4FScVNeCXfr5VsFRAEFgQCwg?=
 =?us-ascii?Q?Uur2Y4GvPcflXlEbAMWTtA117ZJPNIUQDlX2DLgCS1XYouU2swr6kyWjYirj?=
 =?us-ascii?Q?e4Az5VY7bwacMj12aEMqN4pQBHaZKYYoWGJyFb0gn7kHegOjhI3sYZBqO2Vy?=
 =?us-ascii?Q?WK8tfWibGC9LUwRsoWuzecfuGG9hLClm9KGgU9FvTJrFiyOUH12/XDCbFgcB?=
 =?us-ascii?Q?Nfg8Tcso+EJlrJJAj9Tq0USIbpyHLwFl3rXE3y5MW9EOwBDTbclZRwT7PEr5?=
 =?us-ascii?Q?s49aFLn7lgHjc06/HZrJlXf4Bglms4mFXqw6I20OXI8ItJ5X/8aMrzf5Pj6A?=
 =?us-ascii?Q?/e7nUw0fI/alBKx8i0mKEwGcLWNjhD9gJxblys77FvOrs5xMfbjokK7HLP7V?=
 =?us-ascii?Q?uMdVubBMG8n1SbEHw5S5FqdrbmxpAH6iYkwMMk+gJqArsJJO10N8A90c2RKJ?=
 =?us-ascii?Q?eTW3KoOIff8Mws634YErv9in+kaeMcZqt4u7H7R56IvY2d1Gv6ILo2ZUWsbP?=
 =?us-ascii?Q?FbM8qJVacxKUcM58faCuqmFtcuDr2ug+aco64e714+ipb4NVFKWYDkiXxMN0?=
 =?us-ascii?Q?6EjWmsNz308L8GOo1pEt/Hm94qQTZGmqK47ibPdooEytn2bgqmXiiPMDlR0d?=
 =?us-ascii?Q?XXsfNHV7t4ADYNyQx8xNHmyGjSTESJRulROzsKU/6hy5jxtxX3xnSaQ3RGy+?=
 =?us-ascii?Q?5/eK2ZyQ6zdN0xX19sC26szz5PP1Njs8xatOKJN/zVkn0m8co/RX5SZDvh1U?=
 =?us-ascii?Q?M+h0g28A0lX0huBVXJuz2mYvqguLfgxl71U4VeNxq+SFr6R/PzvfD8PkJuNS?=
 =?us-ascii?Q?L9wOc78zfDqCq9p/uBcWttb/S46kuhKMFCkCknFAdkr/39+KA7U2KcZRjU+k?=
 =?us-ascii?Q?+4nJAevuHNZxDWPXDQ8uLkngWJL4snBBND7Zla1JOo8nzzE/K5Jfc3K9C/AS?=
 =?us-ascii?Q?8OERxEax7pQnkj5OeRQEHHFAGT2nTzkM9BxQtTeGfq+UxSmUerovcuOfVvZo?=
 =?us-ascii?Q?afiZ4AavPeCXK5DBBJFrTyLtQoqIeFkMHgrI6342MZoSIIVYWurptUzy2IwQ?=
 =?us-ascii?Q?xbLzHQygwEKpsZLQYGQHfwmpa198+Mq4cLwqalNDdDguZneZF40uHXN+HJdO?=
 =?us-ascii?Q?7lwzE98IpU/cpgHAtgbolddUzZM0L6goXHQs9Xw4Ieb8T/FiGJRNLQUqz0iW?=
 =?us-ascii?Q?NgEzGc9SrPzeWao3SuZ5L34aQC74R3NFuops0byxXFMFCvWLUFZ6sIEeQm/z?=
 =?us-ascii?Q?AemIXitV+9PzOo9205HcevUub0d517iVURpgexxlUpUvAifRu6lhNCHtfjSG?=
 =?us-ascii?Q?0PZRCp1H/hdAlMeyN9h70lOQSG9ikCisK8a4J2yV5cu9z6YwWm1r9CUaFFoF?=
 =?us-ascii?Q?pY87fuMdbQqHow+LnOEKKp/zr3j9SbQjvqmrSg5yYV1pj/p5F/qcJceFugSF?=
 =?us-ascii?Q?M7vBqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(13003099007)(54012099003)(8096899003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:37:12.2066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7a6a76-6523-4da3-764c-08de5a954740
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4599
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExOSBTYWx0ZWRfX9OYEDlfUJnYM
 Y7eE82lIUbEjHhOf68F1EO9XTDPq1tn0y4qNc6zqCirzYuD0RkiHU+WrRagpun5ilDoI2gnq1q5
 7S+IMzS/Bn0p69Gy660WxJegJ1h5LQTxvT+lZQkTV+Be7oMztBXaH6E2gKcjgeyLM+1Wjj2JIK/
 MGDrPF6bn7/Y+JZeT4Ww/HjP1G/7L1clLrGLf+40qkBx+xllkO+9pt6GkwoIwHxmMK41lRiVjJu
 CTYa82uHRI6+IC6aMUFIwkO0F72gdZ6DQEr9+pIR4DllZvdTzHff5OfONBuajAHLmpyJyNT4WA7
 6QvTTgxP5raVjgK7LqpJjLHrCSYv9erA35h5RoYy5uNG4CRlVoJkWrJj6wfPCj3pE9L3Gnb7muX
 kbVvH+ZRyBcCeZvf6iuxhr7VsZEiSG8qzA++1kj+DxIQUP2FbK6c/77af0wIu7F7XlSHg26CF0Y
 AB4jcU55k9AR5CNyHZw==
X-Proofpoint-GUID: RMaLZNXyVlKuvb2E161vb15sb8xO--1l
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=697395ad cx=c_pps
 a=cqkZ7RzDZd4RD9VGRo3S+w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8
 a=yqr8nlKEaO3g1iXuulcA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=TOcuxFFTASfv1i56g1QA:9 a=GaX4XTk5i4sx6gK-:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
X-Proofpoint-ORIG-GUID: RMaLZNXyVlKuvb2E161vb15sb8xO--1l
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_00BB_01DC8C7E.23A38840
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

A few patches today - we'd like to add the firmware for some Dell and Lenovo
Laptops that are using a variety of Cirrus smart amplifiers and smart
codecs.

Thanks,

-Simon

 

The following changes since commit 1b7b9f6c3461815b4f656178d31a6b6a90e045ec:

 

  Merge branch 'robot/patch-0-1769048722' into 'main' (2026-01-22 11:51:23
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware
20260123-cs35l56-cs35l57-cs35l63-cs42l45

 

for you to fetch changes up to 53ec87319d287a837b1291a6c97ed93d759bd0bd:

 

  cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Lenovo laptops
(2026-01-23 15:26:21 +0000)

 

----------------------------------------------------------------

Maciej Strozek (2):

      cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Dell laptops

      cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Lenovo laptops

 

Simon Trimmer (2):

      cirrus: cs35l56 cs35l57: Add and update firmware for some Dell laptops

      cirrus: cs35l57 cs35l63: Add firmware for Cirrus Amps for some Lenovo
laptops

 

WHENCE                                               |  67
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------

cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampl.bin     | Bin 0 -> 10788 bytes

cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampr.bin     | Bin 0 -> 10788 bytes

cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampl.bin     | Bin 0 -> 10788 bytes

cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampr.bin     | Bin 0 -> 10788 bytes

cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampl.bin     | Bin 0 -> 10764 bytes

cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampr.bin     | Bin 0 -> 10764 bytes

cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampl.bin     | Bin 0 -> 10764 bytes

cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampr.bin     | Bin 0 -> 10764 bytes

cirrus/cs35l56/CS35L56_Rev4.5.3.wmfw                 | Bin 0 -> 27872 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin | Bin 10556 -> 10532
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin | Bin 10556 -> 10556
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin | Bin 12396 -> 12384
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin | Bin 12388 -> 12376
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin | Bin 12396 -> 12384
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin | Bin 12388 -> 12376
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin | Bin 12392 -> 12388
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin | Bin 12388 -> 12384
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin | Bin 12392 -> 12388
bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin | Bin 12388 -> 12384
bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u2.bin | Bin 0 -> 12456 bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u3.bin | Bin 0 -> 12460 bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u0.bin | Bin 0 -> 12456 bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u1.bin | Bin 0 -> 12460 bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u2.bin | Bin 0 -> 12464 bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u3.bin | Bin 0 -> 12464 bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u0.bin | Bin 0 -> 12464 bytes

cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u1.bin | Bin 0 -> 12464 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u0.bin | Bin 0 -> 12572 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u1.bin | Bin 0 -> 12572 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u2.bin | Bin 0 -> 12572 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u3.bin | Bin 0 -> 12572 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u0.bin | Bin 0 -> 12572 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u1.bin | Bin 0 -> 12572 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u2.bin | Bin 0 -> 12572 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u3.bin | Bin 0 -> 12572 bytes

cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u0.bin        | Bin 0 -> 13404 bytes

cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u1.bin        | Bin 0 -> 13404 bytes

cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u0.bin        | Bin 0 -> 13404 bytes

cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u1.bin        | Bin 0 -> 13404 bytes

cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw                 | Bin 0 -> 25808 bytes

sdca/1fa/1028/db3/42450005.bin                       | Bin 10764 -> 13796
bytes

sdca/1fa/1028/db9/42450005.bin                       | Bin 10764 -> 0 bytes

sdca/1fa/{1028/db9 => 17aa/2352}/1.bin               | Bin

sdca/1fa/{1028/db9 => 17aa/2352}/2.bin               | Bin

sdca/1fa/{1028/db9 => 17aa/2352}/3.bin               | Bin

sdca/1fa/{1028/db9 => 17aa/2352}/4.bin               | Bin

sdca/1fa/17aa/2352/42450005.bin                      | Bin 0 -> 13796 bytes

62 files changed, 61 insertions(+), 6 deletions(-)

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampl.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampr.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampl.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampr.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampl.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampr.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampl.bin

create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampr.bin

create mode 100644 cirrus/cs35l56/CS35L56_Rev4.5.3.wmfw

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u0.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u0.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u1.bin

create mode 100644 cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw

delete mode 100644 sdca/1fa/1028/db9/42450005.bin

rename sdca/1fa/{1028/db9 => 17aa/2352}/1.bin (100%)

rename sdca/1fa/{1028/db9 => 17aa/2352}/2.bin (100%)

rename sdca/1fa/{1028/db9 => 17aa/2352}/3.bin (100%)

rename sdca/1fa/{1028/db9 => 17aa/2352}/4.bin (100%)

create mode 100644 sdca/1fa/17aa/2352/42450005.bin


------=_NextPart_000_00BB_01DC8C7E.23A38840
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
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>A few =
patches today - we&#8217;d like to add the firmware for some Dell and =
Lenovo Laptops that are using a variety of Cirrus smart amplifiers and =
smart codecs.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
1b7b9f6c3461815b4f656178d31a6b6a90e045ec:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'robot/patch-0-1769048722' into 'main' (2026-01-22 11:51:23 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> =
20260123-cs35l56-cs35l57-cs35l63-cs42l45<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
53ec87319d287a837b1291a6c97ed93d759bd0bd:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Lenovo laptops =
(2026-01-23 15:26:21 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Maciej Strozek =
(2):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs42l45: Add CS42L45 SDCA codec firmware for Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs42l45: Add CS42L45 SDCA codec firmware for Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>Simon =
Trimmer (2):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l56 cs35l57: Add and update firmware for some Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l57 cs35l63: Add firmware for Cirrus Amps for some Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
67 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------<o:p><=
/o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampl.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10788 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampr.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10788 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampl.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10788 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampr.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10788 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampl.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10764 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampr.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10764 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampl.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10764 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampr.bin&nbsp;&nbsp;&nbsp;&nbsp; =
| Bin 0 -&gt; 10764 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev4.5.3.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 =
-&gt; 27872 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin | Bin 10556 -&gt; =
10532 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin | Bin 10556 -&gt; =
10556 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin | Bin 12396 -&gt; =
12384 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin | Bin 12388 -&gt; =
12376 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin | Bin 12396 -&gt; =
12384 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin | Bin 12388 -&gt; =
12376 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin | Bin 12392 -&gt; =
12388 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin | Bin 12388 -&gt; =
12384 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin | Bin 12392 -&gt; =
12388 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin | Bin 12388 -&gt; =
12384 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u2.bin | Bin 0 -&gt; 12456 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u3.bin | Bin 0 -&gt; 12460 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u0.bin | Bin 0 -&gt; 12456 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u1.bin | Bin 0 -&gt; 12460 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u2.bin | Bin 0 -&gt; 12464 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u3.bin | Bin 0 -&gt; 12464 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u0.bin | Bin 0 -&gt; 12464 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u1.bin | Bin 0 -&gt; 12464 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u0.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u1.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u2.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u3.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u0.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u1.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u2.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u3.bin | Bin 0 -&gt; 12572 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 13404 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 13404 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u0.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 13404 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; | Bin 0 -&gt; 13404 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 =
-&gt; 25808 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db3/42450005.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | Bin 10764 -&gt; 13796 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db9/42450005.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | Bin 10764 -&gt; 0 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/{1028/db9 =3D&gt; =
17aa/2352}/1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/{1028/db9 =3D&gt; =
17aa/2352}/2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/{1028/db9 =3D&gt; =
17aa/2352}/3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/{1028/db9 =3D&gt; =
17aa/2352}/4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/17aa/2352/42450005.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | Bin 0 -&gt; 13796 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> 62 =
files changed, 61 insertions(+), 6 deletions(-)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampl.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-00-ampr.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampl.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-01-ampr.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampl.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-02-ampr.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampl.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b2-dsp1-misc-10280dd6-03-ampr.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 cirrus/cs35l56/CS35L56_Rev4.5.3.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid0-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280dba-spkid1-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l1u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid0-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l1u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa2355-spkid1-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-17aa2352-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-17aa2353-l2u1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 cirrus/cs35l63/CS35L63_Rev2.5.4.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> delete =
mode 100644 sdca/1fa/1028/db9/42450005.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> rename =
sdca/1fa/{1028/db9 =3D&gt; 17aa/2352}/1.bin =
(100%)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> rename sdca/1fa/{1028/db9 =3D&gt; =
17aa/2352}/2.bin (100%)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> rename sdca/1fa/{1028/db9 =
=3D&gt; 17aa/2352}/3.bin (100%)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> rename =
sdca/1fa/{1028/db9 =3D&gt; 17aa/2352}/4.bin =
(100%)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> create mode 100644 =
sdca/1fa/17aa/2352/42450005.bin<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_00BB_01DC8C7E.23A38840--
