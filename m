Return-Path: <SRS0=gT1r=BS=opensource.cirrus.com=prvs=4537844990=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B810775F1
	for <linux-firmware@archiver.kernel.org>; Wed, 18 Mar 2026 17:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6516AC2BC87; Wed, 18 Mar 2026 17:20:51 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76D57C19421
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2026 17:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76D57C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6mou51587983
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2026 12:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=wZ3yrP3iHTl6vHV3DCACMLoISszyN6wdWwIhp8o0sR4=; b=
	q7qfq7mJ3YrdxBt6ALf4P1/owYnhiltuPengoQNQOurrpFIbnUwlVes5KHqfwN9b
	iF/3jZkHGYXjqqARWQQHdJlA1Q/kV5EbJEDxUXMPDvytlzCdmkJ08NGG0SWAzeRk
	+8E0bOHAbK9rN8QvOHV5CrlwmaYKgd4Kod4h9HUkZBtW9Qw6/rLsocyssoHQn656
	a1U6cN9+6wYl8oAV/9wknqDaJu+Npj1Xq/C4bEjdY5Wsp43pNbpZR3do3dro4Cm3
	T10ztwyzBhh8jIZsA3ofs2aM4SoqwKzwD11KlPMTlIBLQ+tYHN/+FqICo8f6CHU0
	Esl2EhvfYmeLBQq229imjQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020132.outbound.protection.outlook.com [52.101.201.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cw52v5kvx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2026 12:20:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg0TQZKXMuV6cb4GoTys66n7IQfcnVGVFzVGp1xGnE11i+X0Tyr2K6Fb3gz20B72zNQJlBdLDvu8S6Qt3vl3b017Ip/cw0F4CqjGBWyllSSdOntXb21AIvgRfdZKX55+8C/zNnFoFjrwwhXvpDpUimVq7lk5o21XaObnfNKSrt7gJrTb+J0dchcln1ioWuPUaLaU7lJfGbYoVB+rylfdNF1bM430ZnU0PUy3wrPylup6j15Bg0NbN/tCbusJRAkA2+AJe4MAZeu1HZy4fjPbXn9tl62W9CjvxA0Fv7BQW9KIRCOlrvLc6+XfOGR2QUw3XEOLQjmObsjw9HNYbRXBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZ3yrP3iHTl6vHV3DCACMLoISszyN6wdWwIhp8o0sR4=;
 b=dWXWyn8nt99kmvIyjTTf/GuPOwTlEYDtW03KAucga6vvEtKrG5gT2zOXuOW2OYFos4uxt3KaNg4BTY7AUokuf43MbSJ2A1sgec+f3k9J7x35o0fM9Mo5N0+7ykfSsWr3XRAmLYWY0S3IzPjBDluuSAAowGrJTp7HDxdE4q/FFG6l/8IxEgNQ9QPFNRMH+HBlgUqjfbc7Y74Z/furNXDrbhlMvNY4XAxVpfo0EQbkornKFVfUjOnhSM+RLTXAQtaBwWqZKiNu3WPcIr/r7k2DzNKkmsIlcbA/OVTAN6rYXZ4nDT72GdGVbxoX/T+9Ay25j8BPKf/D0fyzeYf96t+YQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZ3yrP3iHTl6vHV3DCACMLoISszyN6wdWwIhp8o0sR4=;
 b=bSVeVdzn1TqsMSwKRjN4Z5+0h3mrj6hTDsYSO8cTD57rN2Bl7TlgrW0xV6hmfToJqPkmhLvA4j2c8Xpgi1zGx0d6skgGP8O5HQE2u4Ew7TDxka78F59Ae8zfI1I7JjmMA0S8jvWmU382m9Pyp2/zRplKlv7U+c8RAAl99SUd+E0=
Received: from CH5P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::19)
 by DS3PR19MB9464.namprd19.prod.outlook.com (2603:10b6:8:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 17:20:38 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::c5) by CH5P220CA0021.outlook.office365.com
 (2603:10b6:610:1ef::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend
 Transport; Wed, 18 Mar 2026 17:20:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Wed, 18 Mar 2026 17:20:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A2EC740654A;
	Wed, 18 Mar 2026 17:20:36 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 808F6820247;
	Wed, 18 Mar 2026 17:20:36 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Update firmware for Cirrus Amps for some Dell laptops
Date: Wed, 18 Mar 2026 17:20:36 -0000
Message-ID: <005801dcb6fb$890ba300$9b22e900$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0059_01DCB6FB.890D0290"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ady2+2k84nrQqZuZRImwahlrKLle5w==
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|DS3PR19MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 64aa03e2-e72a-4b3e-0a95-08de8512ac44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|8096899003|13003099007|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BHTmXHNq2cZF/iy9EiSziYL4U2eZbPskMD+mmKWClSleqtij7BM+ppdfMEOpI9AhVjuGood/4PO467p5NmsU4CRBv2PqVPRsIUZJrwUuA7JswgwPvvfoCSLMx2VXed8Xoe/OTf4wkihc9w9uKP9K5jSfUDPHuYYeRuQUjRXgVK9k7gt9W784f80go+aU53mf9A21YTCnU3zZ1WlF+46gmBaxV1gYMkq2ylM6+7oHTwmEXfOe+0yYOR1OVzzyehRhrz1ounHhnTW/XuQymZoTYr3/tfea2HH+GIcIrNIbG4LgFGjh4/m3MLnDUv1vivUGOZHMaudh3CCJjOFHQd7bn2gn7pXP5gdh00lGjdR/2+OWuQgqufXxTYasSFOzihJxNpYamyKRFvaX78aUemSP+lPfV+LSzrUGm8mjrvRj3hCzkzT5VWPnMbfh6qBKezfPEZ/coYaG5QISqMuw1NhV49CpyXJAVvhH0mc1DPcopzGqjjzdwf7rVXqopA/R72Ibr6SKyZAiDjjDNNqwiE4GbhYrsC/Uw/OiEFnXcJ3FNiuuLAZ7wGGXyKqRXt51fEXIECpWveFwcEZdHfeyaR+UGh6iDzz2MrjZqby6mG90G8jsn4sIH+hHvlnLYhGeoKYFIVhCDmtWSG8u/8BYBEh7OB/SJpbyTsBtFEvjoDQCYVV6jyLdsBkxTRqW4adNKVRoQ7arFeOuzc6zOBt+dwSwA6oz0o1ZffROueMPfKIMRPVsS5OVP7FBcYUZynUoMehEucd51AYcN0JI6/u789036w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(8096899003)(13003099007)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jkjhhvdDavHfnR3+/nC8Qp05t6N6HMBI044K902naFHuzljgm7C9SZfYskP9eT1nRcuev3PsRpsi3uhl2jv2rvO2CF3qw4TeEPnk22XCLEV9XJOMSqXIdvDGVp2NxVa7DpkeB4qVCOaWc3lvBvxPtKwKtFGp270bcgC+VrXpFecZrNbl1MYIXUdQCtmc6FStSrPHMNfDFwLA1aTfjZSy4N5fl378YzoN772Q65aSGIGSH9ANfkizAeh1A82ZYb4D3I+FKii1MJ9inEO0W9+n4JY+uoC7uAv2DIOJZGHCmlxXNywrc/KL4Sg2L2RvZ41L8zlPZGIHKivfTwGqj1AHR1M5FWuGV7V7hs6HZRT2JZlpL56KpgEGQUa0nTC5IAEK/j72mv97AM8u1XYyoCGN6SdjTgeYlGaUUSzsv3CoqglPLgVdmC1aQvjKRSUOFCuB
X-Exchange-RoutingPolicyChecked:
	lu/gs5kdQZcDddP5mNHbNRw5wkIQTjgiprloR5QucRdb0wNjmaItGSGQ+btqvMbyuyUwDpaCUattJASW0k9GR4ike5LIUNEh7xZ+J5KjCEfjNwte8VOR7ZSFfeQRwt+AJxF0fkorxFggJD+PgZcvbqRUUvwkmqwlBh8Fe8VJlGfKLz/Ab1BHqX9zNwf6GsTqsvzh3DnHhU5UPJmT/zUCfOGj/YdXW/f+hlEbRXl7HSlscJYwpkHKMcRnUA6dsKWXJKgJLoEbP+O8H8x8vGcath4xVF99bgpLKf2bJ0MIQ6o8qMQv7KGRrkxjLn/p8L6Xc3g+IAGgxKgKAwGYTAMyCQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:20:37.6866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aa03e2-e72a-4b3e-0a95-08de8512ac44
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9464
X-Proofpoint-GUID: j0VJLIU2Fv35s8UUksMgeXc33qokjLhS
X-Authority-Analysis: v=2.4 cv=MpZfKmae c=1 sm=1 tr=0 ts=69badee9 cx=c_pps
 a=h0UhqkblQSf2I4YTj9MQng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=HT84t65PACdb9kB76MgA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=lqEhLkbuGGsQf3kmqjgA:9
 a=hz8rXyd7UOuzdKK9:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-ORIG-GUID: j0VJLIU2Fv35s8UUksMgeXc33qokjLhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE0OCBTYWx0ZWRfX+OhAj/0bINWz
 XVa51rfgzZAGVyzIOMT1NisgxHeJc04YaW8COafWg15bk8GmB5SAD/N3sVFB43kUg854NuRpVW9
 xfTGSSDKXNVv88csLG2VbOtEpghatOr+VXjn0tpV+7GdRedyvPfjCsHGfPMjrpvMi/Y5VHcFfo/
 abKTwMSOeQjbGO6UpVG8udKNkYi8zvEy42aZoV6I0wgxkKh8S43vm21rReZWemvDkkrs9bblBxd
 /AB/Zne0eR9WjJRtOm6D13QQ8a1vxWnY9GhpnLlZg+Fb1QiuB0azM9JvJJ+wiuLrNCMeDqro65l
 xRc7SgQslOdNp+3HaY6JZ+khIMGTTuawBZg54vZ6xBGQ0bRrj4/4l5NHTHtYsHdyA8iE8Gjt4PN
 UdfW+tHwHw81BgsYM2vQNZ50IaBUeY86Hc1ctIX+QtodvbIfP5KHAMscHFbCVQ3hrNkIvji6fae
 EsNIrHJzMKq6B2O8/mA==
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0059_01DCB6FB.890D0290
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I couple of patches today - we'd like to update the firmware for the Cirrus
CS35L63 smart amplifier for some Dell Laptops.

 

This series includes a Fixes: patch for some incorrect filename links in
WHENCE.

 

Thanks,

-Simon

 

The following changes since commit 66ca9a5b63a5b7ee14ca382f6b5a21a72e0a3698:

 

  Merge branch 'robot/pr-1-1773782672' into 'main' (2026-03-17 22:15:12
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260318-cs35l63

 

for you to fetch changes up to beb9508e0328462712e1c277f9daa028fe5e067f:

 

  cirrus: cs35l63: Update firmware for Cirrus Amps for some Dell laptops
(2026-03-18 16:37:55 +0000)

 

----------------------------------------------------------------

Simon Trimmer (2):

      cirrus: cs35l63: Fix Cirrus Amp firmware links for some Dell laptops

      cirrus: cs35l63: Update firmware for Cirrus Amps for some Dell laptops

 

WHENCE                                                  | 250
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------
-----------------------------------------------------

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 11440 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin | Bin 0 -> 11440
bytes

cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin | Bin 0 -> 11440
bytes

29 files changed, 110 insertions(+), 140 deletions(-)

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin

create mode 100644 cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin

 

 


------=_NextPart_000_0059_01DCB6FB.890D0290
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#467886" vlink=3D"#96607D" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>I couple =
of patches today - we&#8217;d like to update the firmware for the Cirrus =
CS35L63 smart amplifier for some Dell Laptops.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>This =
series includes a Fixes: patch for some incorrect filename links in =
WHENCE.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
66ca9a5b63a5b7ee14ca382f6b5a21a72e0a3698:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'robot/pr-1-1773782672' into 'main' (2026-03-17 22:15:12 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260318-cs35l63<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
beb9508e0328462712e1c277f9daa028fe5e067f:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l63: Update firmware for Cirrus Amps for some Dell laptops =
(2026-03-18 16:37:55 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(2):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l63: Fix Cirrus Amp firmware links for some Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l63: Update firmware for Cirrus Amps for some Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 250 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------=
--------------------------------------------------------<o:p></o:p></span=
></p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid0-04-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid2-03-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-03-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1b-spkid3-04-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-05-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid0-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-05-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid2-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u1.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e1d-spkid3-06-l3u3.bin | Bin 11440 =
-&gt; 11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin | Bin 0 -&gt; =
11440 bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 29 files changed, 110 insertions(+), 140 =
deletions(-)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-03-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid0-04-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-03-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid2-04-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u1.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
create mode 100644 =
cirrus/cs35l63-a1-dsp1-misc-10280e23-spkid3-04-l1u3.bin<o:p></o:p></span>=
</p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p></div></body></htm=
l>
------=_NextPart_000_0059_01DCB6FB.890D0290--
