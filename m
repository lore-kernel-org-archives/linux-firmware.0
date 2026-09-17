Return-Path: <SRS0=FELQ=HJ=opensource.cirrus.com=prvs=072070c42a=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9DEC982D6
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Sep 2026 14:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A8711F00893; Thu, 17 Sep 2026 14:10:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789654233;
	b=BU2jadvcUQgkyHwvm/GzyDJ9nAZDCzdl1qpLdBLwpYk8eci7gfdE9/rRFXzUoqmfynB6
	 Ok08FSMS3XANZ9HZBmSBjRuAIQVPe64dKyXgftWJXmeOZMU2C72hmR03nuYNV4liwUJg+
	 d3KaLR0MvwIVCjDDEW2uGlIg7VI1N7lumX/3hCArbM8GxFirTcP40PP51eKywF/CF+UYm
	 mgOvHEnWa0wU1BUZlKdSZvw8FKh3dV9Id0rIfUIOPjoO5nM705MdM/HJJCJ/zaIjRKnSj
	 h+W2FcMQEgysrCEK4N2c9mQltAYTwF6+zzG/EcFk1L0NPuL8+bHd7lS16sxMIIGqCXw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789654233;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=qP/dFVbLiZbmFBjRRTq0Bwf0H2UaM96nOZ2Y0yzhx5k=;
	b=ugDpumeq1MOyK36zb0pP928LT49mfnpd2Uh1xANRhhWhqYkgTSymoc4k9IfrXKg+EMP4
	 L9BsXSwKXfybTzNPm0QI256vhzZSbw12mZUJ3ay3DyJELNOKCMB6oUM/qGfPWWI+V3JXc
	 ZjiKiAf1hUFTHHJqE9eWvZmbI5FlEd80XrmXuaPNie4sOP7x8Xv1yhffONNgdrHs8bydi
	 c4v5cixpbowARtCCEzoO7+eyrveljGoEgXRi3W11O/IRY+C3yw1cqB0j0kjfmr5bp8bCz
	 Y1qh3Y4LYu7+d2dT3omcWC2lEGgJ9G4ANIxP2uECnHmlms7gOYnws2cXdCsVo9o53Wg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HMTTI0uz;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=G4Prc00W;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 637CD1F000FF
	for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 14:10:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=HMTTI0uz;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=G4Prc00W
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 637CD1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDLYN4110484
	for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 09:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=qP/dFVbLiZbmFBjRRTq0Bwf0H2UaM96nOZ2Y0yzhx5k=; b=
	HMTTI0uzS4K2atqcSAHGlDClwblMptHYe8i59OufHeDMMzD9XV7Vn5DQ5VuqKJvL
	pm6QGVDa7TcwhzhW2yxyx+PnBM12DngnPCZOsC4yj35wVniRD1swGEj/Gz0Obyi/
	4WQMHNEYwtypu5jD9TcEDSi+H3uZIMh4XQLCww2jfntXEjIkZJhhTYrVUuBzfxYg
	TGSMjenBx0JE9s2UzM7hnWO5xdcvoujaIWKVtphJfKLVNSXRB1w2lR6q5lMTvGgZ
	ZDezTtkM6bOxlCJ7iCcxVpBFY1amDFZPXXmF4R2gyIEUdxbK2v5mMNHmRa0S8cNL
	dm79Hx+TCbwM1J6uEVkkZw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020140.outbound.protection.outlook.com [40.93.198.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35hew30-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 09:10:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAwBFSysuJ1BwgfIAhCgqWAZ/KyIxlN4c3XnpdKU7JN2XfJ6wHARsf1lIb591AZJX7PNb7hXmflmXda0tExGTFM0YtXyzR9Frt2MIwGSLsB4HuSjj9ebD8+AQpPHVGM7K3K/4uKAzRDb5xsfLbOQgOjHIin7SfI7Ng4XK54/17FiKclxxjgVk6/Ls2RCRoIMr7wfH0ePS8QozCcn5hzzORi+B4UXuhHm5Nq8kPIjp/6p6As06O1SIWmme7hrBCjxhuBSZxDrbFcs2qDtwyoq7mEAb9SM6lDRHzBUNNmD+9vTydFyXBwhHnH1n5eFZpgRJHtIUKNJvlY1VaI4Yx5jjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qP/dFVbLiZbmFBjRRTq0Bwf0H2UaM96nOZ2Y0yzhx5k=;
 b=ERwNVtyT9Wqb5WyjzAoKl92DrSFmWiOml/u4U7uSu18Rc2t2b6GybFlG/NYbG6TmD2R9u6WyNhyySrK7goed2XSIwJwLduWjK8Na5cG9WjRV6AN1VnbEG5Oi4xEicMz79QQEWXJoZwPlsl8isGgVUWOs8XBBokzZoI9AFwBtIU1gXJv6yGLni5dZiUxYVjILDhXiECILO4EXjknzcjq0o4A+74w9QUjmEgOPk1i/PdGl40B6DbuwdpkznY2B2joRKNORzj0/RBxRbCBUAxF2PXqiv0cwlCenovsVXKvZVM2ToGrc0KYt+qwn60reQARnDhjDuyiEB19Aj8HWckkjpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qP/dFVbLiZbmFBjRRTq0Bwf0H2UaM96nOZ2Y0yzhx5k=;
 b=G4Prc00WvS7HTIk8bn0lFjdH4uASRr24HnlNECrs0PGvoRZcfAgioY0V55IMfAhrVNloLz2OLlziK49rDlwHyKWAXdf2Zx3Mmr2jTPvanUXR/FqcTqB2sPSkkuEmNwyn6Qgo86uxjBtyeAw9TOlOYWgptfZesZMyQ4dIfEEyg5Y=
Received: from DS7P221CA0032.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::9) by
 SA1PR19MB8861.namprd19.prod.outlook.com (2603:10b6:806:46a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 14:10:15 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:8:25e:cafe::3e) by DS7P221CA0032.outlook.office365.com
 (2603:10b6:8:25e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 14:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via
 Frontend Transport; Thu, 17 Sep 2026 14:10:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0EC1406541;
	Thu, 17 Sep 2026 14:10:12 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8CA4D820244;
	Thu, 17 Sep 2026 14:10:12 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell laptops (20260917)
Date: Thu, 17 Sep 2026 15:10:12 +0100
Message-ID: <002101dd46ae$416959a0$c43c0ce0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0022_01DD46B6.A32E5DE0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Ad1GrjRZXHdvW4nQRcOKjmBHNwHOhA==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SA1PR19MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a2474e-1bfa-4f3c-6abe-08df14c564b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|10067099003|16102099003|18002099003|11063799006|56012099006|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info:
	QILs49ABWsy68rq0E5Xf/A6o94GUHAZlUeyJPSGNcz2o+ADeHeKfyIYgcAT6m8yfHrqKImqS8dUX6uAYRVuRdQmu5gp3OAvE84A8QQwCM3io1ZzT3uirWbSe66m6zSIE+5Q+466oA4guXuOpY9WlYPQC2rOuIIGhvWSbnO7TxZq7upq0MypBaxUzWEF/xI1r7bqIAsAeQgeexpkJ68gNPEpQddJbbUaWOwnRDaGGoUfYXDCaFrO11Pvqd4m4RnTRkQJRx0qOUtd+KyQrWXYrfkwaEMcweA7OHkX5f1FVF3JkWvRUVdgXOBCRvakPqfHTKgOb2D1SBVmI/XKwtHUXJY9prU5vOofq0KT6CYtK2sgCy6oZLZ4tYS10DOQ9q6zFVu5KDnr+QAPt1QuoSJqRDxDwvj7pYsT8Kp2OG/Peu4Or7oV4sUG0ZZuDN5mnHQPvTcqw4DVxFSk3dFGMnJhwG9RWYa5lU81pzygRgIAdZfsnLscD/mlCpUSxltylMKaJOk7BrBdaFxr02/O5XfxAPuGEVRKjMUYI4umM2v0NX1MdK0xW1D9L9VQm2lp/DY/t7djEP4DOYWxHxorMN1FAXDtljOj697EhZLIJTWaKfq8dmJXYcx66dqOa5JmMhrS8Z28SyNbiJ6HU+XAfdyMeIvL1N1B8fxzNfKDaXC1TtEBfSvbQmNYOcCqSfqKnHuP9cOQgqX++gNYcFrXOjse7SA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(10067099003)(16102099003)(18002099003)(11063799006)(56012099006)(8096899003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+rjMuzMH/RVPEslWhXQHE1xIzWCxvj7t/pGwl8itplHY0iyShYuPR3iiKlI2Cgdrwxp29o5Ibp0NQ7+dpoYeEWS8rKT9LxhXTmdyNsHMUAARZJ6fCikCcFFjN2DDuyYu+Brpvn5FgavK0yU9TmvB4t3kg5H+/+PBllk9DkYWC2k4xPo1FGnFP+OnfAHLRYJHWtrkr2hIK1m79I1n3Ht6Yi7rPCR+vw2+kGUraGFNtEYq5KWQT1145FWlirF+oaRtzaUyPrSZ7NdTOCFyF8w4Ek2mUB/IsVZsSWy199TvpMJvPmfcO/cN5dZSlFwpTt92H9xSPSIgT3ellWMf5BdV2hRclSXqEPDphEXHE0AqXVYSN9VU8ibH9NQKcv22ycH+/0zRw//rvv9rjwK+0ZZ31UwKBbR3BpG1771/6FIEzsUMNybfhA4EkKc3Nb7pgWIq
X-Exchange-RoutingPolicyChecked:
	MlPOVLoFU9GZn00w+hzG52ajMYfZUz51vxPiBq64wrJd0aj8ljy6u+ASAb6L+hUx6yblowD3TrPrBfuV/7fe8m+Q9+rUwIvlOeXxbOYZ+jtVFVfdP9ZTdWceeJftEtBymSFAemq2X67Yq2Zg6BLn/cEHqy4NwLL3zEbztoq/2A22fioTBKjI+OjD+oDKjxvtt6CVVr3LeMKCacTYpyKiOoQb1crgsY7FQ9s/FivbaGCRp7MkerM/Gs8PCUcgIit5ofFRxpGM4oWoUMYcPslwfD+F7gsd3DdSYf/x7WH6/hnTMmmAMbpF2qocbG3cJj4u/3SeUyjXNEZspDuezOHF0Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:10:13.7949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a2474e-1bfa-4f3c-6abe-08df14c564b4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8861
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIwMCBTYWx0ZWRfX+Ds1mpToFFtd
 Z4GpegDpFL16DC+aodRG+GGEmgrj4iTw9ljuUFXK+n+8wKD19xy//cf4l7HzE+KjLKEeimtBRJ0
 nQzeNMydE4js5xmKzYcLEEzN4smSFa8=
X-Proofpoint-GUID: V6PDfBj4iO1853c5W7taFCjnWwB2dSiy
X-Proofpoint-ORIG-GUID: V6PDfBj4iO1853c5W7taFCjnWwB2dSiy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIwMCBTYWx0ZWRfX44f3a/1AV6p8
 MHev0eLihLa9crUrf+53rq7PH4AyzTGNEXnU9S0i9oa/0VRTnmn9M44/pvf5e1cHUzez8CjFGw8
 64QG9jOcRTAJiHVC5OtyhFXtNSjUZXBbrHeO2Rg2WYZ2d8zs57m0ArQisK3zheTR7dTBz6wB2CV
 Lk+4nTzjRk8Mu4rcsyEIzgZtkRUWrVNcqzBkiUCSIHWn804Zx7JvhVguMHwcBTMMjhZvf++vHCB
 csDokVBf7JB6xa0Iq6viJcrI1Gsjiq4LC1ltACy0zpkrQPbE6QBG4BSVe0BsPg5eSWvtxFtqCXl
 lTU2DMtdLNxdVddRbzOXXnALj9WKE+WesDkDnTVPAfCW48zrsYUdY+ouPScieD+M/TjdGpE5jJq
 uYdSSXlT6HQB+wIrn6GIeFYhB0cJ47qc2EN3iOrB0iOrsqJlWoLZ1hPVYX0gAbt9+Hc0uijetaK
 shbJtMX0bXkNpJ/V43Q==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aabf4d7 cx=c_pps
 a=PBbaNSpV8Z2umfVkjBDg/g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=MWnIZ382M4VD4EU7hhMA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=CjMnu39Sd_Bt_U-CiqgA:9
 a=FUJ1RLIq4BPm6ioc:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0022_01DD46B6.A32E5DE0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'd like to add support for the Cirrus smart amplifiers for few more Dell
laptops, this is just a set of WHENCE links.

Thanks,

-Simon

 

 

The following changes since commit e289868675d1071935ba4dac48acb6600f278d57:

 

  Merge branch 'qca-qcc2072-clnbtnv10' into 'main' (2026-09-16 18:24:09
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260917-cs35l63

 

for you to fetch changes up to 2ded07e3da99f522881039f13595f34d54acdc74:

 

  cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell
laptops (2026-09-17 14:07:18 +0000)

 

----------------------------------------------------------------

Simon Trimmer (1):

      cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell
laptops

 

WHENCE | 88
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
++++++++++++

1 file changed, 88 insertions(+)


------=_NextPart_000_0022_01DD46B6.A32E5DE0
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
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Hi,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>I&#8217;d like to add support for the =
</span><span style=3D'font-size:11.0pt'>Cirrus smart amplifiers =
</span><span lang=3DEN-GB style=3D'font-size:11.0pt'>for few more Dell =
laptops, this is just a set of WHENCE links.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
e289868675d1071935ba4dac48acb6600f278d57:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'qca-qcc2072-clnbtnv10' into 'main' (2026-09-16 18:24:09 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260917-cs35l63<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
2ded07e3da99f522881039f13595f34d54acdc74:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell =
laptops (2026-09-17 14:07:18 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l63: Add Cirrus CS35L63 firmware mappings for some Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> WHENCE =
| 88 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> 1 file changed, 88 =
insertions(+)<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_0022_01DD46B6.A32E5DE0--
