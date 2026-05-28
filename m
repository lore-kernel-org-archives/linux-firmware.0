Return-Path: <SRS0=OXvu=DZ=opensource.cirrus.com=prvs=7608ca7908=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E685CD4F54
	for <linux-firmware@archiver.kernel.org>; Thu, 28 May 2026 12:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68B041F00A3A; Thu, 28 May 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1779972823;
	b=fTyL1LtM8FIpykQ59N+aOWcwTOUuju/4+vs/6Zd3eQbtNlvPySwLCY/vA/jgvJi7o5wK
	 bUAm4slJEuripgJ6Lenmpom02flH0rNasHVCRe9Ez2OYvwPyF//ZUS79X6rlY7Wd4Exng
	 HelxlrzLsbZnzFMRNwSdtekPm93Xc77hMZoUGrt5XGnAfq2FyOmGTwHZ1QIpXSJAlurd7
	 fgnNM7WW47i6b1m3w5LFZOswMLQK+8WkvR2WjomoBKZnguFfsa8rlXwN3n6mT4JUtV5ts
	 0o8cIUq+kvuVD5VT6gb+QcNnX2e47/WkC1x0QBEY7MMs4gx1LJcXDRBwu2KhsADXGJg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779972823;
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
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=mkc0EdckvZpb0V3W03HVjM5R1Lq7oRRkX5iuQMJxxM8=;
	b=RsXmIbUe1vb6jv99294Z8GUiPmn5GGFv0dYh0QSWQAfv0PpBe7NgyE4Amtk3lOieAOLw
	 R2XtHkTOEtQKDEhZr+sGnqbTsznI2oLodeJLiMArcViW/RQWlBkChZgSeN9V/iI+kTZeQ
	 sZ8ZFIxqAmh5RR8UvPWxHqhgrpZyJiwIkU0duOx8rlQRYIRW531gm/KAou+E7CQbIJ7IU
	 4sIokbldoJVA9o8N9a5PejIds6aHBKbg6OxVFg6g9bQXNW6VsnZjRsNxIZRKT3d1s00L1
	 gWqX7crzWM/lMavSbayqR4nlXP8lBbx+LPdm6JVBRRunmB4NzCv9jc0UpE8+IAXa/vQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HfhybuwH;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=w2uDnnqx;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A21E81F000E9
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HfhybuwH;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=w2uDnnqx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A21E81F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S81FQx2994770
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 07:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=mkc0EdckvZpb0V3W03HVjM5R1Lq7oRRkX5iuQMJxxM8=; b=
	HfhybuwHzFZVUaLaNSTLzK5/iCkaPEaBGTAdGShXI0gLbsFtiuNO7wenv5omqqT5
	oCMjmaCWalGzz2jtgv2Wc3VPz3IF7IeY0LEGuOWwIOTF4WmCwJt4Ptj0rJ9h8wJ1
	QXze/ldl2ERDrYQFjQPk+fDP9DU3Fk9sUBS9QhRanhWH8vd7TXn8fCdFbAva64gx
	l3zIY3E8+6yQbyZid3M8MQq3VDv0wOh7SlM+jinAX4lyuOpW8w1AT3HT1HXYmU0n
	7F83WUs45ztnwwazGp2XF1lbOLhSrpNxNTArleJ+hBSHu4AozFhYAhLVoTctBWTw
	Lv1or2EhTDEcTiplO37Luw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022111.outbound.protection.outlook.com [52.101.48.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ee7x20tee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 28 May 2026 07:53:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGqKIAZsyf7ZkbxXHWzx+jK4NiZjzB6CZWcWqk5DQBZsnnYMsCkJ7G/ryqwIHBqtrPgHpoELwbCeGf6hEojPrwm9VdLuGzOA9l/80uPDrB0XkLK2XnV7lW2+NoyLq2hFLRKo6rgAz8RDmgixA56GM0nbebUnsH2mgPotRPDd3eYmfCHqlXsBDUuujpHReYA/rFvVMR42PITqhYKnSSkxLwF9cZZOXaNujQ9rH8lE9goGT3l1KuX/+VEPFRsYG2WanV+KfGkKu8rlRuQZqyzmGF6z+Uj8wIVdKiEeO7xf1gCnrxAQiipv3ZM3VpcXWIVWFGlhFOqXsF8PgE+kaJfNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkc0EdckvZpb0V3W03HVjM5R1Lq7oRRkX5iuQMJxxM8=;
 b=GBtr8GBvZyRmdGkGNOS7GOt6sg3nnFUfMDNtliSTQZrUnMOGvwE5h6FNgP/DEPWZvUbnN9c1myEauZxqhEALyQo1uloy+kuqcHQY1U6SK57D+1glIcYQ8tjt/xAa5OkSX4nYiZ7LFknWhyrW/vLb2OVV+O0jKYEKlaDf5MFby/P8baMR5RBKDmo7e7WfA6Wl0vmB1XVqpREeq7ZTqZcYcrd8JsV0Fs7VTA4vDYzEbuko/u3W7mqntTL1z5nA2l7tgwWAVwqXMmRfXAmYG3YcX1fmHFqFg6VZaMWvhLoAraCwLzZxE02SiWYjft0Njv6RpoSRnoP7fN6SYXLUI/JA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkc0EdckvZpb0V3W03HVjM5R1Lq7oRRkX5iuQMJxxM8=;
 b=w2uDnnqx/uGtMTR99Mi1o9DYfJexj+NzfOPy3zogspQx/+XogkW9lWsEIsHNhRpfRiT42/L1gKv/MXWqIyB8uepCkeQ/WxbjwiKtX8uqnMA3gWo+ZNwKTsjsCu22H3XX2aSfYPJcVNuDnb7Gy9NX9Txc1lQV3G2DVLhBOxbgU7E=
Received: from MW4PR04CA0323.namprd04.prod.outlook.com (2603:10b6:303:82::28)
 by DS7PR19MB7651.namprd19.prod.outlook.com (2603:10b6:8:db::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.14; Thu, 28 May 2026 12:53:31 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::50) by MW4PR04CA0323.outlook.office365.com
 (2603:10b6:303:82::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 12:53:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 28 May 2026 12:53:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0A029406540;
	Thu, 28 May 2026 12:53:29 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.68.74])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DA1E4820244;
	Thu, 28 May 2026 12:53:28 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Add Cirrus CS35L56 firmware mappings for two Dell laptops (20260528)
Date: Thu, 28 May 2026 13:53:28 +0100
Message-ID: <000601dceea0$fb2116a0$f16343e0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0007_01DCEEA9.5CE61AE0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AdzuoMc7lczSE3wwRvykmXtM3xSEkg==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|DS7PR19MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 983ebe39-65b2-480b-2b22-08debcb81eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|13003099007|8096899003|16102099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	GmRqy8k8SDMhwmqJ86ZxSEVc+v4DnNs7OPSy3WaSfXhUyJKQ8efMBxwYog6yaaJPjAqhv+trxG5V8kJ8hwL3lBcwYtRT2Z8lzJBPhUaq87k1DHm8nGMXVGLdiwc4czPHIHqW1s7MWUGAhBrMVkP0bPucW5HJaEydI+CF9PIN53MG5dwPudOINgYYsUup5kL/frQaHv+WouygJ4bRyO4raB5UtRPKuxPL+2RdCGTbBcW+CtiRxYVxlNQSjNvuW2u9JSiFTE+m7WWB52PwM8I2rs1V6uK84n3M5IKr7JCUSaEw26iTgxH6q66xIMjBRSvY1By+aUHP+PVkPaE9TXgVmW8iz3KNmfo0Uk0A9IacXBGsH+qgx8THxroAZsf8fYPjyqIPwb0vJaG15DkKJEymIsMh0n2oTVxePskG9JGOobpI2fdG6tkV4/IEJKgEyxWSGmblxNt9rew03MyKAPQe6roXzeYx1cRWVcPcstHAjBLEMLSerEwW2pUi0PWhjUcZjRbiHF61UBamJmWRcfYbEcroQeIOuOxtXxYpKMYJwO3BP5R4DM+vcl42ITx5J+rQti/Nuq1+O0PI5CwC1OFf9SJYpaxiJfnj7e3TIlK8cMhZkZfJsYyMAlzFgBEmxczzF45Od+HpauEIfrUgnaChtOc/BU/U0ZPJpnMrltSyQg//D8KEhR+zsXJZQ6RDbBEqR9zJTHsonzkuvER0gEoAtY5T4qSUJdGj5xG0VvZ6mo8=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(13003099007)(8096899003)(16102099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2OeOfxYkcYEifpU2HD5oQDa9L8C4RavtVjkSbz1VyLZqfarWZXF/kp0CN+2g/WbeXtlEL2NZW6ZON2yK2gCw6uZt378SaceogLMujkkSqby4AzKqtvPiKQA0gg0j6qSaoeaXXsN43eVn26phmJPwhJ1YDA/UqD2sqEnSM1e5Fx6CtOZnc/DNTTZushtJIrRfRuRdWv/2HlvXh8xFkSmSX0KjKpFzr3f6+oO+YHMHBFhBKTRx1siWpMVEEID72dKHs1OGnDvJ6eANxahE76PXy8y5xhRRrgTNasOZ9JbhwOOJmoq41zP8cUnKsyPCTmaJpIcjuQJXm60OWmuFh4tAf7dnSAiNQ+o6DM9XUanp8H27Q9zY6+SeBVIzyYCXQFNC4xsKuNGOqBYJMizbGC4ceT2vJ14d+ie7++vFVK/cV6qRZAcEGZQ1WPSdp7TmxqzR
X-Exchange-RoutingPolicyChecked:
	Sc1X065icS0bc+i4RTqVSOGm6uQl8ljk8flVk/F9asPv8fNJ4Up6z4c7ZVRMGzCo779jCiJNUj3SNWHBNPDWCfmbYcdn1V7qZFvLgvSn4BlyUp1t+JR5i+WREpwBHIGBi/RTgXtEqzsG676OKACQWoV/WNjEfJo3qg3ybFID17LDcE4+qGFkFNrXaWvvrP0kkaRD04qxLjVpKWccjp9AF1mH3ywIhQXKMzpDOsg+L+yvBh1AaY8ddPaALs024RZihCnXLfX8KsJKfXEtmIiAlz//0T4BDKykzsqiMMJvyRUFT4I05LOUM3DP9Zhp80wudaXQmyVDrVlE2dSyPOM+/Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 12:53:30.4513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 983ebe39-65b2-480b-2b22-08debcb81eab
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB7651
X-Proofpoint-ORIG-GUID: Bs8IlfmR2Nr51XL5qg3ZCXdlLNaqB9W8
X-Authority-Analysis: v=2.4 cv=H/frBeYi c=1 sm=1 tr=0 ts=6a183ad0 cx=c_pps
 a=ucmUxximRHcyFXWH+Z14eQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=C34cQhL6mkAXrr07TYQA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=0aci-8rEdFE36lf7xzgA:9
 a=cfel7A4klIYr3_sd:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzMCBTYWx0ZWRfX/J+hVRGiZTU+
 Lo14JM5FD//OnuUDK7KtiEYtaQNok/BoJjSkPbTIU4EQpi8C5BnBvOkEjvIZ9Ox2UyNDpj6CWmB
 biB9E7hEzbZg5JCimh3xZ8yzbusGXFtfkGVZNY5f9JKWeQOWZifTvINIlkR2mBo6T0tpYzFbQ+4
 RS1vv9FvdjNYMYKCECN9/mJ+RqHvsGy94UFp95Fih93uBoMUkrr5qLEg3RagJjfBoOToK2WN01r
 lDU5xvQU5wviAtrsanEi1qmKVwbq2sRQJOOXk9BQWqJAoJ3uR4qHehlvIASej71l5SMgYyDbr/b
 MrIowGV+ckWzDcslLLgvWfFLvxnoBSuEIcKtUbRQvfYxHnTS5w/5quWO3CXj/KioDwcUUInERx3
 JBUeAb4+iFePdy/4XhwgMGb8Sa+hO2n4PxuyTkAlrHNjFt6pa0Wxl0SX69OP83yGmAfB23m0+0t
 rL1MySQLU+oEu0OjyNA==
X-Proofpoint-GUID: Bs8IlfmR2Nr51XL5qg3ZCXdlLNaqB9W8
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0007_01DCEEA9.5CE61AE0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

HI,

We'd like to add this patch to enable the Cirrus smart amps on a couple of
Dell laptops

Thanks,

-Simon

 

The following changes since commit adb6dceb45b98c4149e1ce68fc1a5f394fd67695:

 

  Merge branch 'intel/dmc/xe3lpd/2.36' into 'main' (2026-05-22 18:20:47
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260528-cs35l56

 

for you to fetch changes up to 831ea4af30e1bd9788000fa974cbacf5925cebe7:

 

  cirrus: cs35l56: Add Cirrus CS35L56 firmware mappings for two Dell laptops
(2026-05-28 12:47:40 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l56: Add Cirrus CS35L56 firmware mappings for two Dell
laptops

 

WHENCE | 12 ++++++++++++

1 file changed, 12 insertions(+)


------=_NextPart_000_0007_01DCEEA9.5CE61AE0
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
style=3D'font-size:11.0pt'>HI,<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>We&#8217;d like to =
add this patch to enable the Cirrus smart amps on a couple of Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
adb6dceb45b98c4149e1ce68fc1a5f394fd67695:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'intel/dmc/xe3lpd/2.36' into 'main' (2026-05-22 18:20:47 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260528-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
831ea4af30e1bd9788000fa974cbacf5925cebe7:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Add Cirrus CS35L56 firmware mappings for two Dell laptops =
(2026-05-28 12:47:40 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Simon Trimmer (1):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add Cirrus CS35L56 firmware mappings for two Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> WHENCE | 12 =
++++++++++++<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> 1 file changed, 12 =
insertions(+)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0007_01DCEEA9.5CE61AE0--
