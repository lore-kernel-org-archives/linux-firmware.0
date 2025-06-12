Return-Path: <SRS0=vDz8=Y3=opensource.cirrus.com=prvs=52583df007=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF1FC71136
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Jun 2025 16:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 309D3C4CEEE; Thu, 12 Jun 2025 16:18:48 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF87DC4CEEA
	for <linux-firmware@kernel.org>; Thu, 12 Jun 2025 16:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EF87DC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGI2OT023247
	for <linux-firmware@kernel.org>; Thu, 12 Jun 2025 11:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=aNL9sI4T3MljcIU8
	w2ZD1APGehcwhE1yyC0UdsYn7jw=; b=ggDvesUau1olg7I/xVFjDEdVl6RuyELw
	8FBdfQNBjvbv1vxY8OVXqzO32rXoaeV6shUfVhMlo6GLHJ4BBpDiTZjScS0yObBm
	p5LUTfpAtFcXxVcwDazlStWHGVyGN9YQkjha3NdvxqvKpGOT048Agk/eufX3pG6z
	RFHphXFPeEQMWArhJY8GsfAW29rbLENcx0rig5OZta1NieT0/hdUljzPNNoj744e
	p5WcuysKj/x3W5jdYTqqShn76BQG+rTQ6FLlmm3vU4vcQJ8GIBFP+kOhLHO2Q9rp
	sZvYdwKJPxrholn9h/Pq5Jqyl9lBC+d5np695t3nt3pojwBGMOjW3Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2100.outbound.protection.outlook.com [40.107.243.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdc5w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 12 Jun 2025 11:18:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9aSZo4ghvx9cj+QvEZuDPZv1EmTy4gnuQTqKCWk3YWbANMT/qhe0lzhbV2YWTPqPmOzBsY9MZj7d9gfWJnkNF+TZqYfXcV4paqHfQV+2xfmEt9nBmF09+hyNWh7HqW51mWrj4rdEvw4kDArJKruaefBbPeJBVuqAvgGlnsH7hOTNp7iEJEOgqzG1TPViHVjbL1bL+w8qJXpkJzbasZ5dDolP6Qy92nrLT9SP5fVUCj96iD2iD1YC1FBaM82OSh1PCjRps0oYD64I3x4n2R5OPecpk3ilOAcRgCFDkoT6Awg3cr+HXyMwd2zVqlBz+2tgFI+5cNthQT2HMAb/arbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNL9sI4T3MljcIU8w2ZD1APGehcwhE1yyC0UdsYn7jw=;
 b=sd4IWVo87UQCbdQB/qM33se2clBm4eBZzvcF7oWWxVba+W3SqMxtFLP0j6dMcaoWz5N4D0Fh74zXpFsA9p8yCJPcdPnRlf8fX4e11+Pvn2Y6JGV5a+9+ouJCXOfX7Uc2PAO/ZMU6rq7NngN5rF+97oixBopd2zF+G383DohMVQlXKLntpbUyCvmABkuLAtPLNoZX8liS5r2HXH7VCb8jqze+V+Jms/E3UkYyUKUXcm1y9SU8OoKNQET9QY63uwFofs8LfqS7g6voC4+lTKhibTgyNB7DvpxoyoJQke92LshYZapfwZju6uKfBgUAMeTh/ZBlkfepqpLAFR1b+fudDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNL9sI4T3MljcIU8w2ZD1APGehcwhE1yyC0UdsYn7jw=;
 b=kI44bDaJcVdcV5OZK2Sp1SdJLxpxlysu/EfSlVDBNysRjyx4nY+fGaED6Tygy3kZqcJ/+cyEAHBfBUSVoM8O2ln8OaiORb1lnUYMr8NSWhgzHSaNUkAUBPetBEsGPM0qE+bmDnNA/ZunXgjHMmdRmWEzhSAQhtham7muqfCJpYU=
Received: from MN2PR11CA0006.namprd11.prod.outlook.com (2603:10b6:208:23b::11)
 by SA1PR19MB8024.namprd19.prod.outlook.com (2603:10b6:806:384::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.15; Thu, 12 Jun
 2025 16:18:35 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::cb) by MN2PR11CA0006.outlook.office365.com
 (2603:10b6:208:23b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Thu,
 12 Jun 2025 16:18:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 16:18:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7B84F406541;
	Thu, 12 Jun 2025 16:18:33 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 54378820258;
	Thu, 12 Jun 2025 16:18:33 +0000 (UTC)
Message-ID: <b2c1fc03-4ba3-435c-9b94-9d719d3b601b@opensource.cirrus.com>
Date: Thu, 12 Jun 2025 17:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Smart Amp CS35L41
 for ASUS NUC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SA1PR19MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3285df-f4f9-4fdf-c3ac-08dda9ccc81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|13003099007|4076005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEZQYW5WSkZtTDNlSE1sK05SMjlJNnl3RUFRVzE4cHRvbEx2Nk9iWFptcXhW?=
 =?utf-8?B?dlk5KzFYb1RBN3Nzb0sxWXJrdlhYeURiSUhEUTYwTFVIczJNRUNZZkkzVVk0?=
 =?utf-8?B?cDJRWWpMZjJxcGZ5ZENJQXlUdWx4YlNwZ1BiM1NRMk5qUitYYzU0dHdycHJP?=
 =?utf-8?B?bnVSbVJidmhEbXcvZmp2bXhHSFpHem9vNVc3Mm1jMVFycnF4VFdnTENjR1NH?=
 =?utf-8?B?VXJzVkxVMmhiZXk0REpqZmx4cTQ0Qm5vdWtQMC9uVnVDS1hvM1BVcVQydG1I?=
 =?utf-8?B?L3FRQjMrcEtnQ0hTQ3NMMEFVMk95enI1U2Q0QUNoU2dSWWRFR0ZjQ2xSejlv?=
 =?utf-8?B?OEtUaUxNNFp6T0V4WW1YdEFxK2FaSUxmQXdnZ2RyY2tvcWhqZWxQcUduYzZK?=
 =?utf-8?B?YW0zbFJYRDFsNHQ2Q045UG9FMW5hamZMMUdjSUF6MnVBeE9jZnFSL05SRmpF?=
 =?utf-8?B?bFR1SnFCdWIyczN0bFMremc0ZEZSZDBjazRndTFCa3JYdHRTVU5tN1crSGlt?=
 =?utf-8?B?a0dpVmwrTUtXSXFWb0JyNGNUeU1xOUhBMEJMV2JIaHZYd2xWRjlTV3Z0c0Vk?=
 =?utf-8?B?cVZ1ZzhSTWRCVDRkWlVpMmlrRnFPcnNKcitoY2NMYS8yUGRDVGxmTWU1cWRN?=
 =?utf-8?B?WXpGeXIzcDdid0g5VkFLd0xWajdIaW85a1JtQmtWQS9JeFdBcXljWkp5ZEhj?=
 =?utf-8?B?cjlCL0N3VStubExtSmF0d2FQcXhLdzYyUWpURktiS0E3WitUdzdEUVpxTWNY?=
 =?utf-8?B?VTN1NmZPcFNsWGMrckl4Vkp5ZmlNdnNOODlsbjFZcGZ0S2JHK1lqNjJpaVlR?=
 =?utf-8?B?aWZ4T1hLaktLMEdBczBNMm95bFAwUGhQSzJFbndteEpHeE9QWjFTdjF0SHNv?=
 =?utf-8?B?SnY0OFlzZ0YzZkx6UWFZRC9DRnV6Z2REVkFURTNDaXhLbUpCQ3hQd3U1RXB3?=
 =?utf-8?B?eHdHQmtGa0VqbGc4aWlQb3plL3YycjRlbHdvQU0yNjlaQnRScjY5VzlZUkN3?=
 =?utf-8?B?bWVQbzBsalJjY1JuQ01RdGdRaUtVQWpDUWs0VFdyQlExcGNqK1hnbXRjTjhK?=
 =?utf-8?B?T2lIa1FMNXBnUlZVclM5NlZyNEowQjlsOXdqbVgvYWZESDE1WFlHd25JRmw2?=
 =?utf-8?B?UlhvYitzOHIvcUgzT2EvR0N3ZW8xRzI5TkdHcGY4ZStNa203NGxGNUtGVU1N?=
 =?utf-8?B?eFhYYVI2UDNoUGNYZUF6SUJqNmJnRmkwdTIvZTJpNVpTU0tLNEhoYVdPbTRI?=
 =?utf-8?B?bTVETVNuYXJEVFpyaWRpampGY1hqOEZ5YjZXWXFwcVBGRnZqdDNEenRWaHBH?=
 =?utf-8?B?Kzd5REcrbHBpbHZsVE1OZTVyWDBHWnUzZTdMNWUyV2Z2amZlbCtGQmhRd3U2?=
 =?utf-8?B?SGs4QUlQQ2xkKzdjVmJZenpNMXFneXdhdWVaV01FeDNBUXVva0lMMlhkRE9Q?=
 =?utf-8?B?UkhtWHRlRnRCTlZLTzcvWTBienV6RTh4aGU0U0ZWbi9Lbk8zZU9qZHdjYU1F?=
 =?utf-8?B?SkZvUHJ5L09US2ZCc0hxcE00ZERWVnQxVU5pVU1qc00ydFVwQ2xWUGF5Vnd5?=
 =?utf-8?B?VmJNd3orWFAzMU1lKzJDREhtc29yOEZuRHJYNjZ6UzlOTUVGbkhLWktsTlph?=
 =?utf-8?B?VWJ1ZjA0cnNHNGZkaXFSN0lxZHltMEZ4Y3huWnNPR0F0NGF4bFZYWFRLd2tZ?=
 =?utf-8?B?SnVDYlNZUm92T20rZFVXTnMvdm1ESnZzYkJoZUNqRlJscHhNRWFoNEFPREZp?=
 =?utf-8?B?VEJsaXB2VCs1cktmOGxaMVJHcU1OVHliMkorMkwzSXVpOUlacFBMNS9UdWJi?=
 =?utf-8?B?U05TNm9mTjlrcUM0b2M5SHlJV1JJemgrNVhpSGJwVCtWSTFCeDdaZUw5L0Rz?=
 =?utf-8?B?OWZwN0dnWEdET0xGSUs4QVJWWVhyUUdQYlRNRWFFNUtDcElXd2hCK1BDeVpq?=
 =?utf-8?B?WTJTY0E3VU5tOVVXc2tNM3RzTXVNUytxRVloamJDbGtzank3STlsTDVKWTNp?=
 =?utf-8?B?TmRsamVRZFdIV3diREdzQjhtVC8vVWx2WXJ5MXI3UkxKVmN1eU04SVEwc0lV?=
 =?utf-8?B?LzBqaWtpeHl1TkNEQnNFaGphTjZqMEgzSlorSTE3ZmFjT0VVQkZnY1dzWWxW?=
 =?utf-8?Q?vInw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(13003099007)(4076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:18:35.0204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3285df-f4f9-4fdf-c3ac-08dda9ccc81e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8024
X-Proofpoint-GUID: rCo0x4hTFGLjDCZPTJ2Irj5vwZyE6htf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEyNCBTYWx0ZWRfX4XJnVSZ+6L2m twkqVnafXxZtBn/zBDPrlcomtHUWnNvEvWe90s3eVTKA6geEafvdRHVLKDuNM8RiC5l4na3EO7m rD0BW2VFIdZ+j+V/WyTfEDJeegq9X1D7JRE03H008jCyjhIu/jlyC9H53KNCRiavAq7vS6mKhT1
 P1mexsLdEAK53a1K8twaZR59CqE2asJWTNYAlWkw+Ggzri4hMwfLo1+uTJmG9CnZQrVgwRUvbee /MiLhsCrezrIhcKGGfQXLXcdoi3Nl3V6/fAl12p12W/sRk0MU+JbTkFsut5pvxtXo+9gWDCHx+4 u3EVokjTCz14/Gjd+WvhI7LlqvsjCyVaeRFq2oRkfJr1XNSHt+lHNcrKg2cyeYtGJCtEj9Gk8EY
 e4USempoOg0gGIBhKKU43GplXUuvWs3XbxqK3Gb8AycGXsLVHK9I/DJjPfU4bZV1mjM3OIik
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684afde3 cx=c_pps a=gFXscbeP1qtukfYSu89ywQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=CxkbT_-XCEpFVxkhQ8MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rCo0x4hTFGLjDCZPTJ2Irj5vwZyE6htf
X-Proofpoint-Spam-Reason: safe

We would like to add firmware files to support Cirrus Logic Smart Amp CS35L41 for ASUS NUC.

Thanks,

Stefan Binding

The following changes since commit 0d92efb540f49e0aa254f0685b8a71b82608f5c1:

  Merge branch 'robot/pr-0-1749464821' into 'main' (2025-06-09 15:11:51 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20250612

for you to fetch changes up to 64823fcdf0596a630cfcf92408504fe2f813e23b:

  cirrus: cs35l41: Add Firmware for ASUS NUC using CS35L41 (2025-06-12 17:15:01 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Add Firmware for ASUS NUC using CS35L41

 WHENCE                                           |   3 +++
 cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin | Bin 0 -> 4696 bytes
 cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin | Bin 0 -> 4696 bytes
 3 files changed, 3 insertions(+)
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid0.bin
 create mode 100644 cirrus/cs35l41-dsp1-spk-prot-104388f4-spkid1.bin

