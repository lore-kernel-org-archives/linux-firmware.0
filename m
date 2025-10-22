Return-Path: <SRS0=W1v3=47=opensource.cirrus.com=prvs=9390744c6c=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDE9CCD1AB
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Oct 2025 12:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95119C4CEF5; Wed, 22 Oct 2025 12:41:28 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 475DFC4CEE7
	for <linux-firmware@kernel.org>; Wed, 22 Oct 2025 12:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 475DFC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59M3j1bM3660649;
	Wed, 22 Oct 2025 07:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ML6sWzrYD6ewk3QA
	GT77s9zR4oJXY27Z8bGecz7k37E=; b=PBW23gqHPEmHBH5HjK3cb+Lp8wkc5vNT
	ONx2nvlENvVUTpu6D7AAAH6O9kSq99HvG0ZD0QP7IHqXVks3LjZFFHYY/nuuLezV
	g5aOBfNgt2B3KvPDAmpumaFN/c3QmF4qFjvTzpvws9oEqdwuLBNmbnGGaQbQGFsb
	8A75kGqaiYyl5s5dMKrC1EMf8QnIDjvUk0aIAT2Hk3LAWtS8HZ6AR07jB7ELyIyL
	vG1jQURFgR7lva5E6K9+4Oa8JdD/O4KbCtaFb7X4/uZiWgN03thTBXYOp86CNLtS
	wA8j+GYEr1q9xZXQRw69+WAxFYI0OdYal0e71m7QtLCQaf+vvSXF5Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022103.outbound.protection.outlook.com [52.101.48.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 49xqmqrfwe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 07:41:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP9Nvq4U1LrHihokYQw0sU6CPYNmKtRLwerFf1NtYXIruo2Yg5ndl3HZu+ohuNPh9l50dx642g7EcP3IsQqLXJFm146U55fgnElWW+RUWvwjLKVsK1/f9iPkhT5pTzFuqxBJfz6p/MtMoAEEOOW6JldsRkAWkXWdoVsdZ+AMQereh1Ir5ehPS6uI+kbZmqATv55j8jjKrrzidHWhC5kU78K1JGGjZ1NQWOjSxbpReRVizpozIMmrZb01JkNdmsVa3C8F3IRwrpoUxMf+/auqRfwk3beEX8+TUXIRapj8PPjHdoatLgyNchlSnH8F6IL05x9Z+Inoo7c90I3DkJQjpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML6sWzrYD6ewk3QAGT77s9zR4oJXY27Z8bGecz7k37E=;
 b=LdvLm02p2aeQnUiXuD+lzVEps74oYd5tDmAFDrnV5ceOLZ1GB3mWDfd8rz6tKPAKnK62aIYLr2NCluvQJron4pgidPyS0yrRnWaveUQvECYCm6+vlM0LksbphgsTFIyw3YcQ12bgIEltJ283PvBRVWtUz2nR1yL+ZsqpDyVTLPPcQUN2IVrRIlOh2s/eBSNS0uHP9HyzCBHDbTPeouRb7WOyAQ9DTqurxr2p1Xz7F1e/oErhikj4K5O2rijYGsbzug6zPn+2iogfSVWb9eseh/eDKp/GGBq9uhTh5UcjsitUQlZQQfHjTwbGX7t/ROoS6jLClqPmu2Aw9VzXB8qppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML6sWzrYD6ewk3QAGT77s9zR4oJXY27Z8bGecz7k37E=;
 b=yceclr10WDf3OEhrMYsl2ADl4iSVPkZga4ap/rCDIhlRQqCBFeQN1HxQ4HLA/fsAMO4lx3WtBOXtKC299YG3p/aN7yRxbIIv+j5Z0wW0GGQgdvj0V1lUT4gzeQ32FLPBwyT6xKTlpquV/b4eyLnbwFo5gbtvvm3VCet7tPEDdqs=
Received: from DS7PR03CA0235.namprd03.prod.outlook.com (2603:10b6:5:3ba::30)
 by IA1PR19MB6418.namprd19.prod.outlook.com (2603:10b6:208:3e6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 12:41:22 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:5:3ba:cafe::7) by DS7PR03CA0235.outlook.office365.com
 (2603:10b6:5:3ba::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Wed,
 22 Oct 2025 12:41:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Wed, 22 Oct 2025 12:41:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D12ED406547;
	Wed, 22 Oct 2025 12:41:19 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A3008820244;
	Wed, 22 Oct 2025 12:41:19 +0000 (UTC)
Message-ID: <2bf2a966-7fe9-4e48-bb1e-c2a6b65d2b19@opensource.cirrus.com>
Date: Wed, 22 Oct 2025 13:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com, lockalsash@gmail.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Rename various Asus Laptop firmware files to
 not have Speaker ID
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|IA1PR19MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 640299a9-5e9f-4138-e8b6-08de11684dd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|13003099007|4076005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDRIaWxCSlFNY2o1ZThoZXpSWDlIRm5jYllmV1BCeXBCT1hDWTVOVW1PNDFY?=
 =?utf-8?B?YVlJemJwVlg5TzJrUFEzeHRXbWY2YkRUK1h4NDBUbUdGajZFYjkvNHVZNzFP?=
 =?utf-8?B?RDRRQ25HT3gzUWFaWWxrZHFoUzNwQUxxSWt1eHMrdm55N05JOXdYNGMzajdE?=
 =?utf-8?B?VTI0b3VIOCt1ODYxendaVjJqYVFuZHJucDdVWExiQXZWSURXMS9KOGRvbTRX?=
 =?utf-8?B?V3ZudElOMHVLaUdGekQ2cnM1VkV0UGpoaHh5SHZHZjJKWHhHZ1BZSkxkL1Fs?=
 =?utf-8?B?UGY4dHNMUjVVOTEvOG4waktQRXZVZWYyTlZsbVBFcjBrNnlCYmtUdDYwVlds?=
 =?utf-8?B?UkpKQ1UwNHBvQ2FkKzBISEN6VnBpNHdwQ1hRdFVUeXJPTUJKdng2NmNTTkpw?=
 =?utf-8?B?c3Y5VFJPSkZJWjJ4cTFyZ1VhUFZUSmVacjJMMEVEZHVoZlc4Vmdaa0FPSVhU?=
 =?utf-8?B?NmVzZFNnZXhUa0QrcmVxTUI1SHROQkMvY0FLbkRPUW9Uek5QY2lXS3N5YlVr?=
 =?utf-8?B?QjZGd2VRSnRGZk9zWHlmNXkzSXFkcGZQd0MzZFVKSEFwMXhHZzlxM21tMUNN?=
 =?utf-8?B?VXlzMzBiNmdDeUdZWXVFYyt4ZlB4dVdqNU0vajVSWnE1RUZxOU1hbzZBYUlB?=
 =?utf-8?B?eXplb0xoUVU4aDBNM1ZPL1dXeFdFMTZxZnZHQjh6SkU0N3RLUFRKMWNLV3Z2?=
 =?utf-8?B?Q2lXcVpGd1dJNzFyMGQ0U1lYcmEwSUR2M1kvYnZuQUpKRS93QWVteFBlQit6?=
 =?utf-8?B?ZkdSWVhlS3lEZDVnQ1BaMzlud0RzT3Z3aVp1VE4wNnRBdWYrV1pPSHBlNDJn?=
 =?utf-8?B?WEtPYkxVQlZZdzlaa1VCN25QU3hGaUF0MlpPSHRVOTFrSDlsNFFDWFZHdC9X?=
 =?utf-8?B?MndGRFJDUHNtSnJmTWdveDRVby9aT0d0TUhBRG9JYXZUNzA0Y0xtMFNtdTVj?=
 =?utf-8?B?OVluYzFJNngzNGRLelFjMVQ0WFd2M1NTbFl2Qk9zMVMwU1gxdXRIRzJRK25K?=
 =?utf-8?B?bko0KzJ3VlhnUExsbkVwYzNVSExuV2MzV0JxcGRjNklabUJwanVEeEpyUHM3?=
 =?utf-8?B?OHY4U3ZYbG0vY3UxZFU4RktUZ2FNbXhWYlZqRGJYaklvRUN2MUZMREF6VFhi?=
 =?utf-8?B?RElibFMvM1RRbnZPcGhqRTVHS1hJOHE1cEVJNXRSYklrWGdnUm9VcUFERVNL?=
 =?utf-8?B?N2p3MVhKbVZVTzhUUWhLS1hjWktydGw0SHFKV2ZadHdRU0REY0h3T3l6N0xn?=
 =?utf-8?B?VW1CN1ZsQ2p4TUZYeWNwT0pMUjk0elhpR3kvZHJRNitjaFB0K2g0RDR5RnZP?=
 =?utf-8?B?dGhJRjRoVnBsTlhRZzA4YmFKU1BuWEhPVHNpKzk4WXFBZ0dLTDNPNHVmRHVs?=
 =?utf-8?B?SVRvQ3lzcnRiUG5hcXFWb3h4U29uQzY0bzE1Zk5YUXJqYVJwMjhjUmkxMmtX?=
 =?utf-8?B?eGJ3YkxpNTJvbW5MaUYrcnVkbkRGM3p1QS9nK3dqZjVhb2tlSHRBYkJVd3g4?=
 =?utf-8?B?Vng5STArdFRmRmp6Ty90enN1bVNleGpHOXJpWnM1RjM1eU1IZ290dEIzQ0xo?=
 =?utf-8?B?WXl4Q2NmdlU3RXc0bWtqZEswTzNwTDBZeWw2UFdxajN6cFpjV05NSWpKQW5U?=
 =?utf-8?B?dlNlZmpXaWxqYm11NUVPUG1raDFhMzc3d1MwSUxOcC9ES2JPaUJjZTNoY1Qv?=
 =?utf-8?B?dFN1b004TlhRempwYW53NTJEbzNYOFZGZktnc2RxNkNNMkFiSjgycjhYU1lD?=
 =?utf-8?B?R2RPNHNQc09wZjlHNHBVRkdkTzFveXlETjBlREhSd1VsbjNFMWpTS1VJSjZa?=
 =?utf-8?B?THk5dWFpTUhSdUhveEJEcG0zUEd6Qmw3czFnQXBpODlXYWpSM1d2N0s2aU1V?=
 =?utf-8?B?UGV6WXZvVmc3cXlrcFFNcHUxdFU3R3ZrRmpabmo2R2gwWjV6eXZ1VlRNMUo0?=
 =?utf-8?B?c0tlbHViNlV4NU5ic2NiZzFtNFpGY3BFaWdQdzFabUxSbWdpUWFjMHZObEIw?=
 =?utf-8?B?ZHlnam00eGhHQ0Q5N25GNkxaVHJNNHh2MkNORXl0NUt0d0V6OXhyd3g3OVBh?=
 =?utf-8?B?aUkyVWhMQ3QwRVZTSHdYTTN0NERPRS96OEFzRXJrblJzVzV1RmlrU3Y5Z2E0?=
 =?utf-8?Q?IgBQEYWbIN4ZMWzRQ9kA8hZ7K?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(13003099007)(4076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 12:41:21.0485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 640299a9-5e9f-4138-e8b6-08de11684dd7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6418
X-Authority-Analysis: v=2.4 cv=G6gR0tk5 c=1 sm=1 tr=0 ts=68f8d0f5 cx=c_pps
 a=i8qEvMrBxaw5Z1xwZgH5pQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=y_iHv1jqmSCVMg7PrDQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hQDprEAfKz68v2QovcGCnnMN5IeFEAf-
X-Proofpoint-GUID: hQDprEAfKz68v2QovcGCnnMN5IeFEAf-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDEwMyBTYWx0ZWRfX1bKMsJYJ74e+
 cL+6qJpqgriWBIw11ho1KxyPI9ILNG+FU3r1Bl9lz8ikWdXaRtrAaziiD2EVlVsRK3z5/scJnPs
 LfHYu+8P31zskAzlvvhL1+WfN1jFyDCQ9K/jiP5nnovwvVY+iCt1owdQwAd3kERQAKD5q32J4cj
 5hUlo3B24rxQdpPD0ZZCU4Ue5ZT0SJIsLqCeoXzKriC6Uhxor4M3Cc1KNWnngeBFy7d+y9pLEur
 jiz5NTcPIxIGvKoBF1VEEpOQ3fmkRxtleaqqRk8Nv1TqHhyuq/vpHkteEI2OXKUknZ4UTJsMqih
 Awl/ytLywedDJ4HX+vGNy81kpwqPFOSiInS06KzBh6GfPCsKtYhCVt30V+IZZSMIRP9ycYNrPl9
 NGQW3ILVoE78021bLvUya8xF1WjobQ==
X-Proofpoint-Spam-Reason: safe

We would like to fix firmware filenames for Cirrus Logic Smart Amp CS35L41
for several ASUS Laptops.

Thanks,
Stefan Binding

The following changes since commit 6a0152a5d1a9d7699e13ca7ed81df2caa1262a77:

  Merge branch 'revert-WIFI_MT7922' into 'main' (2025-10-20 14:11:17 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20251022

for you to fetch changes up to 34d17f09fc425472f2784f95cee47b53e17a4f26:

  cirrus: cs35l41: Rename various Asus Laptop firmware files to not have Speaker ID (2025-10-22 13:07:14 +0100)

----------------------------------------------------------------
Stefan Binding (1):
      cirrus: cs35l41: Rename various Asus Laptop firmware files to not have Speaker ID

 WHENCE                                                                                         |  30 ++++++++++--------------------
 cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin => cs35l41-dsp1-spk-prot-10431fb3-l0.bin} | Bin
 cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin => cs35l41-dsp1-spk-prot-10431fb3-r0.bin} | Bin
 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin                                            | Bin 4432 -> 0 bytes
 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin                                            | Bin 4432 -> 0 bytes
 cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin => cs35l41-dsp1-spk-prot-10433d78-l0.bin} | Bin
 cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin => cs35l41-dsp1-spk-prot-10433d78-r0.bin} | Bin
 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin                                            | Bin 2096 -> 0 bytes
 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin                                            | Bin 2100 -> 0 bytes
 9 files changed, 10 insertions(+), 20 deletions(-)
 rename cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-l0.bin => cs35l41-dsp1-spk-prot-10431fb3-l0.bin} (100%)
 rename cirrus/{cs35l41-dsp1-spk-prot-10431fb3-spkid0-r0.bin => cs35l41-dsp1-spk-prot-10431fb3-r0.bin} (100%)
 delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-l0.bin
 delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10431fb3-spkid1-r0.bin
 rename cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid0-l0.bin => cs35l41-dsp1-spk-prot-10433d78-l0.bin} (100%)
 rename cirrus/{cs35l41-dsp1-spk-prot-10433d78-spkid1-l0.bin => cs35l41-dsp1-spk-prot-10433d78-r0.bin} (100%)
 delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid0-r0.bin
 delete mode 100644 cirrus/cs35l41-dsp1-spk-prot-10433d78-spkid1-r0.bin

