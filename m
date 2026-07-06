Return-Path: <SRS0=VBsC=FA=opensource.cirrus.com=prvs=864718f665=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DF6C43602
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jul 2026 14:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EDC11F00A3A; Mon,  6 Jul 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1783347153;
	b=VsZ9eJvUXItwgEOMRxmxDSaRvjYILlB+VqvOnwRGPjzKtU/KdiyOTSd7J55gyclOpp7r
	 ALGazukaf+Piu6OJxeEotZKV2RBYbZ6QUeME11AabTsrBQbb62K0QcLLxFzm6y3UD3jPF
	 2EYUQsSj9tuqILjat63E1NycrHDCa/MkQIYBW7EDNl3CTWlqTYPgpOR+8UaXxooGyEzX0
	 V/cSnbL6bSiqRJh7MFw4iOLkc4RCMYk0lrg9sJQOsQtXH5/K0xj/mKSKFdHvOJCjQzyo/
	 fTyWij0o6iHky1d2JoGeHk08nsf9PIEPJDCL0srfcyXz/la9Zy+JalnYdjZUyvNpa/Q==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783347153;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:List-Id:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:X-Mailer:Content-Language:Thread-Index:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=IhwRe55ydinjIBCVpDmgPTN3dlZy0rg2Su6Xe+1D+fQ=;
	b=pgz4MTCjPGunMZApQf1YXohP6tqvpNM0UmXW5taVrp8mNFmMg6FI2TPXMFKr7KW55usw
	 2C5Fs8vAZpMDphBGxzehYwghwjeUZPfUEPCTlbHj2PvzWSTx8blO5/zejqqTI4nrVThzZ
	 E7Hbqf+xzIpKGQqxecDMl6HfdYODrSgkqVeyqDBjZNI3Px+pU9RMYmrM3AbqyGKi71k9Q
	 QbuTxrxft1/0M/5NArHVvArNKTB4Sn9OBTb8jb0jwV78Luy+nEOMKqYEutTJEViZ+9i64
	 fplGSbEbXiyJP572lHqCfP1mF7MBd6PyoIOlNv9yna/vv1Wd/kh+85esUOiexfgkgoQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kTLO9o1t;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=YC+gofFp;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F14B1F000E9
	for <linux-firmware@kernel.org>; Mon,  6 Jul 2026 14:12:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kTLO9o1t;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=YC+gofFp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8F14B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Nnnbn437052
	for <linux-firmware@kernel.org>; Mon, 6 Jul 2026 09:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=IhwRe55ydinjIBCVpDmgPTN3dlZy0rg2Su6Xe+1D+fQ=; b=
	kTLO9o1tYM26vV/7zEYwqhzhl7JRgj+ac4lUVwZiFxICZuGL1yXeZK6ffjl28PkE
	xCQoieqD/hzYbcf77iiqnLal/+4Y+lN1ZNQ3daSr2HJBlkIlrIBZXuf8my7XecFS
	wl8exRKkqb6TgH4ziVMMbKwW2jTKTtCzABO8uqW0LdgwwFRDy5UMN9IvAtX0SZya
	noFJss2/QAk6q+NWi+w48p8rhP3QPpPnGLjYsv9b9UH4ASQTlKFe0P2A7DXafaQ6
	H+YOi7EG5PNsGnBKwpgr70mlP29QfFjNcvU7KMKv0F1I5yzlogVZOE2zwQacCT61
	TD95oUT1U8bVZh0xI8VUXA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022129.outbound.protection.outlook.com [52.101.43.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjjgk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 06 Jul 2026 09:12:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1pcZ/yNdeGMM0ZslSfr6w0toe+nAHPxjB1JE2dOOAvjpqywjJN+BY+qAEFodV7HMzDjar0PdGxKBErokHkI8HZihKf34q8TJwvS99X147rtc+ui7wwagda8zOn6KyZzx7E8QD8Hc1/W+yNBOyNIWA13BtkO1v01e2RgrKLIxUVSD47AEkRsoneKeOOWk+5HFKLEzlCHMDmPXP1/Efn1R0jvGD+lycl4CwL3lY8/cmPhvXD+dcGGysxvn3vdVmhCh2Cg7Hfgbcka20B9mTmO1mhc6JaIc2oCJcYMCSTtJAJSexA8cqiCFnhECDOzAyQn7lPIn3qG9YhXgto6Lerlag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhwRe55ydinjIBCVpDmgPTN3dlZy0rg2Su6Xe+1D+fQ=;
 b=LfCmvgvXeE898NTlYS1d0Hon3VKrNeqMQ+2SgJFSAJZMxsalJc47wpHIk0SaqnXwU5xehUvX8mFuxPLOJ0HrhxzI7fdfn/bSgOb6eazFwkCbRuOkcjAiKmwFo2/Gs3rfvxB6yzY+kRJ0Ua7NB2hgGD+TJjLfBwFhxDzs2iKo1W7sJTI3j+Il3w0lgsiLeAALj4eUHB4Vf6TqYY2iPz7zp8IXMianfucFdg7iVJV1wXZDrkjs3HpaL82GPmFuC/QbliHdGzQ98oYV1V4Ge9Lyc3KBBMbxQcQ06JIQCN+GEbpuPZd0papIPodHXy4xGcv+kECBp7JR1FJNb5CoDIGy3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhwRe55ydinjIBCVpDmgPTN3dlZy0rg2Su6Xe+1D+fQ=;
 b=YC+gofFp8hxcO9rmZ45T9ChUs+6k5DDCh62imQMYaaiNMNSOARouBXwiyhWp4VcrvKiINy8GQYGH9x2XBkI9C7V0h7KOjWQD8GrgUedg2++0n4w6Heazm19bBPHEXhmsK95JzpNSZsmKG2/wr7xRAlN+WXX62FVRPbE5bbjagWg=
Received: from BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::20)
 by MN6PR19MB7917.namprd19.prod.outlook.com (2603:10b6:208:46e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Mon, 6 Jul 2026
 14:12:26 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::3b) by BN9P223CA0015.outlook.office365.com
 (2603:10b6:408:10b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.12 via Frontend Transport; Mon, 6
 Jul 2026 14:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 14:12:25 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 07E38406541;
	Mon,  6 Jul 2026 14:12:25 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.68.74])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CC8E382025A;
	Mon,  6 Jul 2026 14:12:24 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Update firmware for the ASUS UX5406SA
Date: Mon, 6 Jul 2026 15:12:24 +0100
Message-ID: <004a01dd0d51$7817f150$6847d3f0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_004B_01DD0D59.D9DD1CA0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad0NUWM2Ukj3yPTDTOi0Ey8hcBfO9A==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|MN6PR19MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ec0c9a-aade-4431-74b7-08dedb689b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|82310400026|36860700016|13003099007|18002099003|56012099006|11063799006|16102099003|8096899003;
X-Microsoft-Antispam-Message-Info:
	rUbl2jhp/a32dqHvIgisuvoZzRVd2zLnYUiVHvsGayRgzjYp+tvl86AEUvEOpFAgShrzSPkFxnEZH/BHne2ULtNVi/JggxkW5nJE0PamPxr3lokmRxNLqKEZRgT1IFnfYysIyyOsoLQ2iyJHpphQNBaj8HSYvoTGX7n/cPzWTmTvEHndq0Dq+c4uM2EMd3tGy+qyTFk2WO/YAMqF9Dm8m1YdnEpGaGWn1EiUfTZujEbFBxNSTHpDY5yym/kP6MHtz4C/9COzeeUQo8tErxFgsnCq/+1V/CRbTUVllSl96p0f3YWjFgkes2qEQ/nE9SGjPlcbpKE3VQwMyIeu2aTq6dk1jC9ftaMe2ew19BCjyo09gUJCnOol1+jIPJsKH5ZR7biiW/qglX0Xetw7GJKo0SvWP8Ny4hQiRs7yz2V5Ko6V6Bnzbro6v1nAzU2v77BdyJO0IrmOrLaO2L6xTRjqTz+XOHOORCl3lpAWM9nHtUXUW4fsiB30nWkuGqtn9d2/KFuyG/w3HeG2qGqUh1yHCxhPXjTQsSmb+1p0jq6jJD/9xizzxPhrRXMdBmU5pL4kxO3WMF4Hsq1UW88wXXJflqvDdaey7++4xTBe/OlGTJjdOLrmg4n7KVOKKT+XwXgjm/yv2mc4/VRzn9BGwTJC4f3z4LPhq49/tlrRq9ZPoEDEm+vu2plSdFAj5H7xT15T2wfFBOHE8iiEPC7GtpsPNA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(82310400026)(36860700016)(13003099007)(18002099003)(56012099006)(11063799006)(16102099003)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vlOqm+x5gQQlDUyRD/gD3n3m6V43TPg2JZw9KN30VcBOYg+fhqSz1m2PcZdLh6OUSDpva48DOdFXlUZ6V8roKUuLrcwklPdhZ70gejlEljRfLoC+8MiwKo5N+p/8iVc5DMcvqenw/CL9o24zXxoNaGJANHD9WIzf1XhHmcnG2r6VC2OuLa8fhF+ClKsEtLvx6pGTce+rhbBGuKhvJreUWUBTnE2Jo2REwMDQTZ730j6b5wU5jHRT5BGwmSY5Yv1OHz0cDsYLmMHMf1rCHsOXJLCEhqeo5a2kLPnS0NaSpAsiIL9C/pXXf+oPtFmycMGg+daUUnTJI/l61ejmfH1UNWGfqWm57mzI+y1/8sKrzOBwKKikOwHSYyivZ9epE3ZrsbcvzmBAPMbV9Bihr5o4Nlqp3sfF+LXiuauMxTOgOfLInPx7kobrzQjnplves4sT
X-Exchange-RoutingPolicyChecked:
	dctxHye8x7tPuBQsg81JkgY7Y6cjkNDvhOz7+TzjGFDqoL8TRPrI845r+Z48Qp8qe4v8OoYrQm8Y/Y8oWFOqbT8hb0fZyACors2KJsOTZtmVVCcbpru+HK/2AvfSfgiwZ9YhRcBK2dRIKV23Zk86JusnnEyZcNNFOsgyaup5+2qahU7qXX7KU82EMsdrz7IuKW2BxUz0coMSG9PtnSZX6UcNo9Men6aaMBObCyypCxIcD2yRJJdwH+SgiXSU0xd0A1QDyd98Ph2mjWCS28eJr+oORA32n9o6/sg4yx1aqq6Qh4hScIEpctCnTlhXqkvpArnKPu1otgc5s/HRTtphOQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 14:12:25.9437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ec0c9a-aade-4431-74b7-08dedb689b49
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR19MB7917
X-Proofpoint-ORIG-GUID: 3qLZG50J7uoV4tCnPM45juVxs7eHVBEV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX4HRRcIwiB5PR
 b9cAB/WDoepeXGVI4J4VuyjbROsuKbK0UvnM2GVqa81P3bz9Yc1griOxlu1zJwE85ml9A3/t7gh
 k2bKdWMOs/wSO4vRouTD+aSJUSCE/SM=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4bb7ce cx=c_pps
 a=PUkDgjY5UzxrOFLFu0zltw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=MCAjcTvQuvROVihi5YsA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=zigb4aE2mWowSKf4GrcA:9
 a=-u_K__6KIVjllADf:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX8PqBZF5aS2go
 fGFAeeC4Fa5ExKCCyrkilJNz+zhHRGdTGr7K5rqo9UsZUlREdjUz62avjyyS13bn6VxE3L0IGEm
 DnniPKdcJrSNmqc+GKo8iCnEvVh0kIV/7E0bJXvfp9OqK1zDcNZbLmA0nEJhKR+tRwdfIEmCJNC
 hutaHtlfpu90XcQ7byof4Ab0qM7hxcHAZocewT4JUrf+WqkoBe4tcHJ3B01oFNYz73oY4q1aka6
 hky9K3UdfApflfH/T0PlfISzgGyCcB9L3fPsm3qNGWOXUy9U+5czzknGa7dqWoBjwfT+Ggzi+aL
 nlWNiv4QR0GJ6BALWOtjFuQ+8gNk9emvOsOtDshakffN4318dR3YNWZj37I4qAFGeIoO+kRm5ra
 OdG8Dazi+JREfAZL4yQ0MWXstjpNuJpkt23ZqVHntljAJz7UyAw0LX9WYJ4g3maFn+L+m7DgGK9
 crDDDqEDGW/xX9lrrag==
X-Proofpoint-GUID: 3qLZG50J7uoV4tCnPM45juVxs7eHVBEV
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_004B_01DD0D59.D9DD1CA0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to update the Cirrus smart amplifier firmware for an ASUS laptop
(UX5406SA 10431e13)

Thanks,

-Simon

 

The following changes since commit c95059a3774b1164a2d6a4db5371fb8406b22692:

 

  Merge branch 'cs42l45-e13-e14' into 'main' (2026-07-03 12:49:43 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260706-cs35l56

 

for you to fetch changes up to 79f5f18b6b8f04832a80fdd8e219babc11483d24:

 

  cirrus: cs35l56: Update firmware for the ASUS UX5406SA (2026-07-06
14:08:50 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Update firmware for the ASUS UX5406SA

 

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp1.bin | Bin 8980 -> 11480 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp2.bin | Bin 9020 -> 11456 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp3.bin | Bin 9024 -> 11460 bytes

cirrus/cs35l56-b0-dsp1-misc-10431e13-amp4.bin | Bin 8988 -> 11488 bytes

4 files changed, 0 insertions(+), 0 deletions(-)


------=_NextPart_000_004B_01DD0D59.D9DD1CA0
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
class=3DMsoNormal><span style=3D'font-size:11.0pt'>I&#8217;d like to =
update the Cirrus smart amplifier firmware for an ASUS laptop (UX5406SA =
10431e13)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
c95059a3774b1164a2d6a4db5371fb8406b22692:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'cs42l45-e13-e14' into 'main' (2026-07-03 12:49:43 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260706-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
79f5f18b6b8f04832a80fdd8e219babc11483d24:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Update firmware for the ASUS UX5406SA (2026-07-06 14:08:50 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Update firmware for the ASUS UX5406SA<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp1.bin | Bin 8980 -&gt; 11480 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp2.bin | Bin 9020 -&gt; 11456 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp3.bin | Bin 9024 -&gt; 11460 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431e13-amp4.bin | Bin 8988 -&gt; 11488 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 4 files changed, 0 insertions(+), 0 =
deletions(-)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_004B_01DD0D59.D9DD1CA0--
