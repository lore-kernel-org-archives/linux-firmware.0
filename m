Return-Path: <SRS0=CYOG=5Z=opensource.cirrus.com=prvs=0416dadd91=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01CDCEACEF
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Nov 2025 10:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB36AC19425; Mon, 17 Nov 2025 10:36:53 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A559C4CEF5
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 10:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A559C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH6RkHk1987677
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 04:36:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=bsPZVI7/TWE0tMtkiCD8nLvgrZcnEm6arp/J99KimLk=; b=
	imY5ElLpK4jvCdC8klE01hDEs1HcczBkoVc/Rm1gzKf5vk2owYpFALUpf0/bpd2r
	FQSPO8lRSFB90QtgHyRXZLfL+j8XOoJkU5ls+GFC+KvpXpqlxSTwBeq4v8Jiv0f6
	Mqa5k9YdChaIGZfhhHbcH009APjKCfM8Mp8Lk4XJP496ERtnAEqfzwYDOoQFoSnh
	6Ws9ktHAKUcU56xylMQDpajMPMELt/xTxA3oC7BSI7cTq9l9ysnxXDvGH49pkdrM
	h9s8t8BVMdgMS/y/DwwwlidUY227PAP/d46BrHD8bCL/wYtXo0yhhaC3fUTEroG/
	GPn7x1gQJ6i2jAUsJ1Si6w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021118.outbound.protection.outlook.com [40.93.194.118])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt19uut-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 04:36:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzQHjTlWgRCg/td9MxtREHbzjqpkzAn+WOdCHdRJzrt6rzwkv9hdpdGueqMmjJNORTHh0kmbHzoptHVm4cqw1Pb8FYpBZxJNigX2cEuxd9ywwa5MOZjY/kC3qaX6WdgC4m83yxUCSCm/tpMtC3bXNHPDetUnlf3bXdudGZpz+1R5vLBL6fKywQd3HLDLYe8mtIRa5aiHcpo8qC+fWbXPV8nj1Q6cYlWDHerBx4aM7K2PuWo0W5zbGfaWshNjuq2CQVM1ffxpTDMsVT3yXNe3Iao3DHbEmWgcB/sPjUD/7poekmX48+9iZ3PM8AE7G8S1BMU9Wl2UU9Qco/RrYIaxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsPZVI7/TWE0tMtkiCD8nLvgrZcnEm6arp/J99KimLk=;
 b=dlaXdIQukUrHKOXKx/PIcRbNw4MDT3l6vf1+fm8XlC7cqkOvwGd0TICm3rEJkLlVkMHRT4iN0X0BEn4p8lmO4nP0IK0EtU7JR+iwg2uNodoM/bMlwA5L/vG4Xw4l8seejXTtTE32sr2PyohcbIHzaudpaidktGYQq4V3LB9M+odLRNyDxDYQdNWOlh7YVpytAtKouwnPvunOROT2l5XbPRvNgfk7jt5CGXOBD6I7mdP28x8mGUSXabXGOxFevlSP9TyXdapgQpxwLxxfc83e4afNEHj/GziZco54KFiEdwXpOcieUucbPP3wp20yvP5rxu75AmCQewqG6eXYVzXcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsPZVI7/TWE0tMtkiCD8nLvgrZcnEm6arp/J99KimLk=;
 b=d2Dubd5S2/sDjdy5tK9YQpWTe+4Gl68UyQL2S89801aw5E6XBOmZgD8EZKh6Rq/w9u+Rx1NaEJUdVnqHsr8Ou+ZTuWGALkMHXnhEQMK1wOysrFdJpGPyeB/0XmiZQduYDQ+eWIpX6YrGSEYtGSeK29nvA3nxgiODxaq6kAVvDP8=
Received: from DS7PR03CA0298.namprd03.prod.outlook.com (2603:10b6:5:3ad::33)
 by PH8PR19MB7047.namprd19.prod.outlook.com (2603:10b6:510:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 10:36:39 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::8a) by DS7PR03CA0298.outlook.office365.com
 (2603:10b6:5:3ad::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 10:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9 via
 Frontend Transport; Mon, 17 Nov 2025 10:36:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 04FA1406540;
	Mon, 17 Nov 2025 10:36:37 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B9784820247;
	Mon, 17 Nov 2025 10:36:36 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps and Codecs for some Dell laptops
Date: Mon, 17 Nov 2025 10:36:36 -0000
Message-ID: <000801dc57ae$0d17c5a0$274750e0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01DC57AE.0D199A60"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdxXrd6VDNZYvRMgRJOgnv7tNN9eJA==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|PH8PR19MB7047:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c06a844-88ad-467e-06dc-08de25c5308b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DBxcK8f9/tGz+4ZoC05AuoPqqWf1/dmgUagvXVvUgjaf+cfQydflJXkbDbvw?=
 =?us-ascii?Q?HJyUncbTYUtfd84Qturk6gVT41BEDo2AwWtIoWKmxfPGhsJiBLru0PGjnL3B?=
 =?us-ascii?Q?hItAYxR9fXZb6H5JvKM+AGPVHAXgrP7gfmiQPuBB0jQquNCfWGk6f+CDZnKt?=
 =?us-ascii?Q?869cnY5CPhVK9Lennw0Ccck1JI7rQVhFg6+ZPFPtjpKbKHfUgidF8OZDEmoP?=
 =?us-ascii?Q?89yxiuVLrq88tew8/5+m6vtP58dlTFrB1rZsvNHJwkZr7OdWXMlPy+nJz/s5?=
 =?us-ascii?Q?tMYmi6YdfAwZaTPBKJ7Qb1K7zXaKT5Zvf6slKQJnvHe6wnWsSz3bXW7Ribj9?=
 =?us-ascii?Q?NM8LbmjRIu68vR9hw+cgB8dq0f/PyimFuJwDPi3KUC8d/a4ayU98kwjQuxI1?=
 =?us-ascii?Q?OlTmTgyP5WEf3SuFyk9YPbs2sWq0RtTkY6wF6mYBCOZsLix2tNlrxotjMOmX?=
 =?us-ascii?Q?6yTNLOMpK/mNvaPvG2lHLRtnXvaf3gJhDGX8cldEkWunFlr4s2MyoqYrp9tN?=
 =?us-ascii?Q?U2FkGs04+FJPH70tGCnOsw9hTSiPCfEzhhrtw9NPtqew2w+CHGf5TrvbD4ii?=
 =?us-ascii?Q?eIqcfTDi5STXWaHJgy/o/8sSWu+A9rw5nzTRrZW3g/tuZgb+b0fK/xalOpMY?=
 =?us-ascii?Q?W1qHiZ4HqP113/UGfgwDKuvIIQ3lv9BsOXffaG+VmTQ/CMskLBrYn2CAbmQU?=
 =?us-ascii?Q?qi29eEUzTnpIQT/hTuMj37AeKA2SQo3yfGpk1yw77awWQf1euWcKAPxFUx5T?=
 =?us-ascii?Q?FcISxsGOSujH3pSBN4gfCwJ8ElIT7rlFILxz3wTaOKeCFIQaKsPNnjS5F45K?=
 =?us-ascii?Q?GCDq7i0MV9yPQzJ/IlQvcC5mQLu2Fys7sU0QOBuYr4RGuIGQqPZmAKDP/pfu?=
 =?us-ascii?Q?e0oiA4f3/8oXHHETaK37yTcIJe/gyfJuh8EoLN95cmUbKl2qDQ1TjaNh3+1U?=
 =?us-ascii?Q?W7T6Y/UZsEJqwQHvw6l9ZOenqkzIKb9jB+Oes3LYD14BMKE2n7iF9nEwl2/N?=
 =?us-ascii?Q?b8zrmDtvUl0YvjEouIyGYtZBAliKzRAjCK35HLIXalarMF6g3kBmST60wj4u?=
 =?us-ascii?Q?gj8VC5FpgMVrebIVbMqLafs/BbNDM203iDg4WgOQfUIG0phN5Gh9vLVJIuLg?=
 =?us-ascii?Q?E6aPWWHADZGCUOxrj5eqVfDTpbKAnBY9ynppEONqNaab278scp+vGndp4I0I?=
 =?us-ascii?Q?gPpy3knXNLl85tLVwoSs9XeJG84USNP4OGfy3KN6lGuts2d+pvZsXnLfezeA?=
 =?us-ascii?Q?1pBed1Wv674Ccp5ZQh7T4gLYikSJ3GfQuvNC1S00HQ2YL0UtPRAYhFaS7oL+?=
 =?us-ascii?Q?svcFAjDgU4xDW8NiLStfVA+yzeVkb8NJyEbaqvib9zbvttZQqqUrwsWFADPY?=
 =?us-ascii?Q?3t8NXV41nlN09PbKpu346Y/b+hDaS3Zo2XP+wqHacRvDTlfOsd6FpqpsEhqM?=
 =?us-ascii?Q?aysHaBb0ilQP5Frdez0NHrIF64N4DNARdAuz3KWgyFqi2tQE/0VIPGkQWrZN?=
 =?us-ascii?Q?1wOdk6MAqA5JMCVLRYEmRJfoIUj9/XUE85xD5J5PbPkHx0OXJEdIQ1zzoFLf?=
 =?us-ascii?Q?RwwYN61J0bHM5Ap7YW8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:36:38.3600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c06a844-88ad-467e-06dc-08de25c5308b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB7047
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691afabb cx=c_pps
 a=SIO/v8SSfaR8RXaXrLdUYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8
 a=PHGmhUSCwxL2H5B0pM4A:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8
 a=fEgNjgSmuduIBhj85BIA:9 a=rETD22M5_FJj3Ue8:21 a=gKO2Hq4RSVkA:10
 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: fVi7DI6ohZKTT_t7JS1fAbOLdZWmFK37
X-Proofpoint-ORIG-GUID: fVi7DI6ohZKTT_t7JS1fAbOLdZWmFK37
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA4OSBTYWx0ZWRfX9wVR+Rb7LWeM
 gaVwHz9viSw/gyAOPbO6HLxXFQGxXGCcxJdWYg1EIV7zJ+NwUISy5KpQhf/CcVClR1O+U+N59ta
 53Ks80r0OYcB6pr4pTLGZNaAL2rXU33MOLrfQUayA+aXkEATqcxnNjYOZkMMM8FTBsJqRib5KJP
 RPilhwqq+vcACj34AZke6u+icegR/1xhgCRTJo+ymU6BTufMTTvDgwUwcCX9HikHB1Bc99YQhp4
 khPboFuiMNi1/zxQSkMapdb56NoNcRmt4z/Go9eL0wbgtZaY1jH4vJIyXx16QJoHKNJC4nX+LrD
 ERgjLRuvdofci5jM2b19NHgHzLYnVoapSvE9/rJecT7nFqxifreOQq4eIxPJvtooeRUit7k+1ZF
 sdOAf13EZ7LQoDWt5ncxlcQxrKkt9w==
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0009_01DC57AE.0D199A60
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I couple of patches today - we'd like to add the firmware for the Cirrus
CS35L57 smart amplifier and CS42L45 smart codec for some Dell Laptops.

Thanks,

-Simon

 

 

The following changes since commit fb0dbcd3011839d85920d1e4aa956f6a84700caf:

 

  Merge branch 'amd-ucode' into 'main' (2025-11-13 22:26:11 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware/ 20251117-cs42l45-cs35l57

 

for you to fetch changes up to 251bc9c4f9d16a2c9ada6e4768f5abf9b01d3a06:

 

  cirrus: cs35l57: Add firmware for a few Dell products (2025-11-17 10:25:56
+0000)

 

----------------------------------------------------------------

Maciej Strozek (1):

      cirrus: cs42l45: Add firmware for Cirrus Logic CS42L45 SDCA codec

 

Simon Trimmer (1):

      cirrus: cs35l57: Add firmware for a few Dell products

 

WHENCE                                               |  59
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw                 | Bin 0 -> 31296 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin | Bin 0 -> 10556 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin | Bin 0 -> 12396 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin | Bin 0 -> 12388 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin | Bin 0 -> 12396 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin | Bin 0 -> 12388 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin | Bin 0 -> 12392 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin | Bin 0 -> 12388 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin | Bin 0 -> 12392 bytes

cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin | Bin 0 -> 12388 bytes

sdca/1fa/1028/db3/1.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db3/2.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db3/3.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db3/4.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db3/42450005.bin                       | Bin 0 -> 10764 bytes

sdca/1fa/1028/db9/1.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db9/2.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db9/3.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db9/4.bin                              | Bin 0 -> 16 bytes

sdca/1fa/1028/db9/42450005.bin                       | Bin 0 -> 10764 bytes

36 files changed, 59 insertions(+)

create mode 100644 cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin

create mode 100644 sdca/1fa/1028/db3/1.bin

create mode 100644 sdca/1fa/1028/db3/2.bin

create mode 100644 sdca/1fa/1028/db3/3.bin

create mode 100644 sdca/1fa/1028/db3/4.bin

create mode 100644 sdca/1fa/1028/db3/42450005.bin

create mode 100644 sdca/1fa/1028/db9/1.bin

create mode 100644 sdca/1fa/1028/db9/2.bin

create mode 100644 sdca/1fa/1028/db9/3.bin

create mode 100644 sdca/1fa/1028/db9/4.bin

create mode 100644 sdca/1fa/1028/db9/42450005.bin


------=_NextPart_000_0009_01DC57AE.0D199A60
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
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
--></style></head><body lang=3DEN-US link=3D"#467886" vlink=3D"#96607D" =
style=3D'word-wrap:break-word'><div class=3DWordSection1><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>I couple =
of patches today - we&#8217;d like to add the firmware for the Cirrus =
CS35L57 smart amplifier and CS42L45 smart codec for some Dell =
Laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
fb0dbcd3011839d85920d1e4aa956f6a84700caf:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'amd-ucode' into 'main' (2025-11-13 22:26:11 =
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
20251117-cs42l45-cs35l57<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
251bc9c4f9d16a2c9ada6e4768f5abf9b01d3a06:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l57: Add firmware for a few Dell products (2025-11-17 =
10:25:56 +0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Maciej Strozek =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs42l45: Add firmware for Cirrus Logic CS42L45 SDCA =
codec<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>Simon =
Trimmer (1):<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
cirrus: cs35l57: Add firmware for a few Dell =
products<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
59 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++<o:p></o:p></s=
pan></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 =
-&gt; 31296 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin | Bin 0 -&gt; 10556 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin | Bin 0 -&gt; 12396 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin | Bin 0 -&gt; 12388 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin | Bin 0 -&gt; 12396 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin | Bin 0 -&gt; 12388 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin | Bin 0 -&gt; 12392 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin | Bin 0 -&gt; 12388 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin | Bin 0 -&gt; 12392 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin | Bin 0 -&gt; 12388 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db3/1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db3/2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db3/3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db3/4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db3/42450005.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | Bin 0 -&gt; 10764 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db9/1.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db9/2.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db9/3.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db9/4.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 0 -&gt; 16 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
sdca/1fa/1028/db9/42450005.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | Bin 0 -&gt; 10764 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> 36 =
files changed, 59 insertions(+)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 cirrus/cs35l56/CS35L56_Rev4.5.9.wmfw<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid0-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db3-spkid1-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid0-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db4-spkid1-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid0-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u2.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l2u3.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-10280db9-spkid1-l3u1.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 sdca/1fa/1028/db3/1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db3/2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db3/3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db3/4.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db3/42450005.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db9/1.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db9/2.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db9/3.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 sdca/1fa/1028/db9/4.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
sdca/1fa/1028/db9/42450005.bin<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0009_01DC57AE.0D199A60--
