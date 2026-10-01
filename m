Return-Path: <SRS0=tK7r=HX=opensource.cirrus.com=prvs=173446e828=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B7ACA5FCB
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Oct 2026 15:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BD521F00898; Thu,  1 Oct 2026 15:23:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790868182;
	b=niX7vzxz+UA4UGE2weEPk8Ysy0m2dP/wIvumgCM+PwZuKo4sm6bQFCwJ26AZEDCa3vO1
	 tizthNzZbPhOKqiLYFctPKN8V8eanp6QihBTcfoeXpknQBtWP5lvoHH+fj1iqrnaWhJfp
	 aUjnXmSJZ7xPrvMuQH1dhlOpOFyaWM/7numi2vDzCxYKDo2GUCOKa6xq1AVidELEs6yrR
	 2+pN7OTho4L03fhgJuumBkqg8Uo535Cw8XkOku6X1paHGjSPl2FXRLLcPI2ifDLERSZ1u
	 jxyfpRP+TXsDw4bfHrJZEohqmpplFse8GCkJTLW76iI0pSUaM2EuOL1EI2/FAmv3IQA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790868182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:Message-Id:Content-Type:Mime-Version:
	 Subject:Date:In-Reply-To:List-Id:Cc:To:References:X-Mailer:
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=ijsAKQILsYAAi4ujqDnkM4Suu5v1XSvd6j3NBt06RKk=;
	b=HKd9l+y78R6AwpAUB19qPet29QBi4Z9XjR5e7qRTJk3DH0+NvRvdf2hg6rFfCLMxlH4v
	 Ez28TOr5BJt//Z9w5QBqC00aQvM4btaD//kEtwOGzh6VxXrxISNp0dO6l/8YtlzkDXTwv
	 atcB61uoV1HYgOyX9q78CiFX0au+7kOsXuGT7vq18uNlA/V7qQxV/4JiXrOhij05ER5K/
	 AN/hvPGHz/BEIYhwsyp1eiA6T51LQF6oWO0WXTNQj/exDRtb059xIePisf3n1CVGMDgtt
	 bLitIp1wm2mKrbf0vdSLRdYE6k/1AZKHHyk9rnPMAEENegV5I4HLMwkxDpT+WaJ9HGw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kNMPbabC;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nq8bVQQ1;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC26C1F000FF
	for <linux-firmware@kernel.org>; Thu,  1 Oct 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=kNMPbabC;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nq8bVQQ1
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EC26C1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691D24T63843524;
	Thu, 1 Oct 2026 10:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ijsAKQILsYAAi4ujqD
	nkM4Suu5v1XSvd6j3NBt06RKk=; b=kNMPbabCRCC0zLG4TgysLvmgn6p+mmbAQh
	NxsVlGpq4H2mGJcCeSL/IG6l5iYXpbuteflAkQQmBN26I0KS+JWUUFZnikN53lRC
	3ZbhiPiRtUkAjtu5UL/sRgl3pxi3OdbvAFeF+0Svs8p9u5coq+nH4D0E2kTR6pAO
	ZMVWkuM2GRoM/lgGa8dx5n634kqHR9+98h6LNZ0nur35n74OuIw6yrMZZAz2446h
	3jeL9bLgvMIeEfRGHp35rNWU75l+mNsePlu8XNe17gD0F8EfObf5i6rFywSpbSD/
	NenQ8Lkqlt85TRxLby9WchllyiO7zFLH2AnNpwataZSl6KSmuThw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022111.outbound.protection.outlook.com [52.101.48.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h1gv7gqqp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 10:22:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNTL3QGJxAOWKPmjGQIxEmuAeyMozu5ZWoukV+U7daPYy571cBTojfV4P5XKtEkGvbjbtj3TpLpYNftGifY3tiABUJUk2uIcghAZUS3qlJ7HWmg3R2AeFu4AJ7qgKi8bpcsM3gRb/zCsk7KtyGTBk01UemAu56GceWGynM14Z4DwPcvZg5XJssxKmnbxbLnqpLg+6egJPwmnXKFJWfthcwQakWBLivhe/+E/7V5aSuVQ6rSGeePzosmXx+5sS+IH87V5n8tSk3lavkTd+X1w8Qr6wEJcu4BqK3CMQkzkyjRSiASDNh/WPVkjAly+x9rQpBcrsRCdn1QFZFjFZIQNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijsAKQILsYAAi4ujqDnkM4Suu5v1XSvd6j3NBt06RKk=;
 b=AQyceA1wwZT8+85sm8UPe4quF16SGbHpOny4YOe4DrxK/F8qnXvn/W0wvF5JSvayMK72Z1JbrSY5KqtqHydwYoTeTq05U8Ep/y/OinvkoAsXfhQ0hvvr0w8kugFlCXB1aCA9ucc1aNOKkD4oA7eD/JIeV93oW5dVyJ9kmSrDrAvrN6caIkieDx956vrU8WKKKasI0/VFcJ3PXEbU/H0FB7b5QiIruypOeZDBvGZ/bGAEAj2F/mhXbO0LZndPRK/oha+tDmZXNWK+BxcieBnBn6dkt0QrGmhMt4zy8VK6Rs5NsbEjnrJIGoImm6CXZcCITyXicnwO+va+0DIhIfqnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijsAKQILsYAAi4ujqDnkM4Suu5v1XSvd6j3NBt06RKk=;
 b=nq8bVQQ1KnhhBlAGAs0gBOlFB6jDr942UaeJYVusVbT85eWu6WI+j6QSWOmGmeBxl5JeVy4FmV+9NQsmOaVxKBC6gV53V9xd6UCm3RDuN9uWeFWT2cJ9SfP/Vh0YuP21SbVTAiiaN8xavKTParSQ/nvZ7Lla0WrKGsT0fT7l4lA=
Received: from PH7P221CA0047.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::19)
 by CH9PR19MB9348.namprd19.prod.outlook.com (2603:10b6:610:2e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 15:22:54 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:510:33c:cafe::3f) by PH7P221CA0047.outlook.office365.com
 (2603:10b6:510:33c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 15:22:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Thu, 1 Oct 2026 15:22:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9313C406544;
	Thu,  1 Oct 2026 15:22:52 +0000 (UTC)
Received: from smtpclient.apple (unknown [198.90.190.235])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 712F782254F;
	Thu,  1 Oct 2026 15:22:52 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
Message-Id: <DCCA118E-9C59-4085-B1B0-4E383A576C54@opensource.cirrus.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A8D01082-5BC0-4547-A348-E51C86815F5A"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: cs35l56: ThinkBook 16p G6 IAX (17aa:3921) requests firmware
 without spkid, linux-firmware only ships spkid1
Date: Thu, 1 Oct 2026 16:22:41 +0100
In-Reply-To: <5583ae55-f8b1-4d4a-a087-104d2086f888@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Sander van Delden <s.h.vandelden@gmail.com>, linux-sound@vger.kernel.org,
        linux-firmware@kernel.org, patches@opensource.cirrus.com
To: Richard Fitzgerald <rf@opensource.cirrus.com>
References: <CAPdpv3xfQiW-Fmn2ydPYSztbm7KV+f=E4dSAD=sT7TACugc-Ew@mail.gmail.com>
 <5583ae55-f8b1-4d4a-a087-104d2086f888@opensource.cirrus.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|CH9PR19MB9348:EE_
X-MS-Office365-Filtering-Correlation-Id: fdfaccb4-e52f-4a0a-a2c9-08df1fcfdd47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|6133799003|22082099003|18002099003|16102099003|10067099003|13003099007|8096899003|3023799007|4143699003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	ytEemUhKPlaHl6GW9KJRWB8KrJ3Der1EYf5/bbpDzmeYpXGymqSfYqFbkMkuMAYLfAK3gR0OlxdLIlfDOFmFKV9jg0hSbGDH69eSizs/gngMrGRRdvC87NG7wzRAW9cV/MmrUt0eJRy72HbjpmY+AQSuGKZeVpKGLyUiUslBDi8fyiQUl3a+nzwVYg9SwLMOzLcEx4oSw1vWCn5nogPre5YUCZaUi4qF1cNTAM6Yc86lRyUlI5Ot5tfMJpwhftqPnhX/eNoT7rDbbxwnv6FJKZ2pDLO/MQUEMZhjhA6Z+2htIcXqLmsqME6/Q/EGfNraKzvK78aZaCNpKCrlShx1Xok22aeodLjFhUyuYg4uRVj8aawZUXj99S7B7kIn7gsmswaHaA4pBf8EgYT/Lb+TxkMpd9KqYFZSoN7C5y9z1J1NCpbPo9lQGgVjYioV/urA8IskHWdDGLMshZxQNU/cRInuzrBRH5t2xhGUl1TPIZU36Q7iJPUtro0DdzcMhILdDrpxYL6XESAeiEZYu4AgXLCzz+67IzHD6uAEST7itqo6GVZiOa6X7D2Eka40dfKTqpofPRC+Y6u5XMTOlhEXNy4gIOyOS5jP4vbX7NcBvf03Rnv7mOIZxXFjdQYZ8W/cQc4kbmlG1vmUxfFcyTY3dgrQqlC3qHAe92AGq1KGTPWoI/97ZigNNhxF1P/ScSKDOosqAnOX+KDshzPIPewskw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(6133799003)(22082099003)(18002099003)(16102099003)(10067099003)(13003099007)(8096899003)(3023799007)(4143699003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A9EIbe/+soMs8aFR/8XDAmR+RY6SQkuX0QMrDnmqEDMM5cy1JnxF4hGBtqnin1Hvnl44jrwrztv72SsLefNGPZONEFuaD8gBCVpuo/qHS3fyPlWlaUqP9sG2LTULgGe1pxee7/VmWcmg9Ux5Iu1PwTdMKV21OoB0LDCXrjGHM8LCZc7sBlupLm4Re66j/hb5fa8gc4VIpctdKXxmiyJ1ljbjm7xO0Z+1Y4WuhSawlHdMirajt4mlLiWhesfMZ24FhgeDVF0VQTE/VCA9dLQ9+xYjHpdgHutzwlxMaZX/5KWmMLYs45XtS/nHPQpLJAM8nHs1GwuykLePjSNdswDanVCzMoi0+KXnK+krK+5IMQejjNAQDj9wIr1a4GGJ+1Crk/xvtIz52D14F6FTsoD53o0YG+odwetvPxw79uxjd+XvHpJWYgIzGydYvHli0Zzt
X-Exchange-RoutingPolicyChecked:
	xgmfEUFRjZmnNnzVNBddBuWW8yP+JbVHdVv8Zbow0L0TGl5KWUjLYeWGA2bviz2eDMdzSsUHuljA8F9Gnb9VlfgSO3v7Z9jsy3VB4avsJEKqGMMHriK58492LBMgKfS5N95Q2ADINIno3Yk7jo9IT5q9iz9o8xIwPRa8wFCZrdkb2aC9VRjussXNgvT5x7VbauoG9aOoydAtu+DMm7mO3uFd/2XWQu2BRmSdX/2ax4T+LRLZjcA2BdhygRL/o8WjrzqFRUwj79CYF5YMkUMzC8W8ppNIf6b/RJ/kwPvniCy+nI5CTi2ZhcGJz5rgre3wmgSd3ZbfgfCvcdI7+bR7CQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 15:22:53.8233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfaccb4-e52f-4a0a-a2c9-08df1fcfdd47
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR19MB9348
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6abe7ad3 cx=c_pps
 a=ucmUxximRHcyFXWH+Z14eQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=p0WdMEafAAAA:8 a=w1d2syhTAAAA:8 a=8oiE02_Lsusy_IxxngAA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=MuzRf5hersi3RZVCBVcA:9 a=U4eTznTfIMF9CtGG:21
 a=_W_S_7VecoQA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MSBTYWx0ZWRfX1vT2fKPXpyg1
 2TuVvJvuRuUFdySExGDMNMI1QprwaZNvap7crpxH43238v8cZCHOunOMVT79+fSwejs+nLkiklP
 NAN2RgS7IwwJ6vnFlj5q+zoSpwwoRtHVNp01twM1W5LbpM5LfUNiM58Y8sON0exp1Q/7RpyBams
 SeoLSzF+A/ciNHdQ/K6pyEJm45kwqFH5cwbEvHw/AYp8r6QYSiL//WphDQ/iNLNrkv02hIdx6f5
 OMNq5zWoUY4ByWB0Vg/1LETir5qZwlLoDfGMersvw2Wi8GEbnqeJXNgv7rZFMmmd4jxBhx7mYFL
 TabRYqAuWT2oD17r3VFGDBrQ3r0eEK0RyaG4aI3N6wC2aztEpuHqOGBBBmRK5MtrRe5iH7VXMyO
 MOFNl+EqToJ1UQKuRhJ70pi6I4w+QzBnGAiPAsCp+qO5H3WPE/ca3qTxizr9rgEAwclkTRZ3BGA
 Lih94tiHwIou9Z3v+DA==
X-Proofpoint-ORIG-GUID: 5eSaAkjpGrWrzMMFbGkps4_udk1IUMYW
X-Proofpoint-GUID: 5eSaAkjpGrWrzMMFbGkps4_udk1IUMYW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MSBTYWx0ZWRfXyvFSpA4sEeNd
 GQGN6moGa34tYUYl+shloUBWFrfJ3e0tE+//5ir0irSdot98Fr1Ncr4NZahlx5oXtkpF8jcX34L
 dX1yo/qq8JLBZ2QGJJhyH1IhPoWgX/M=
X-Proofpoint-Spam-Reason: safe


--Apple-Mail=_A8D01082-5BC0-4547-A348-E51C86815F5A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 1 Oct 2026, at 10:20, Richard Fitzgerald <rf@opensource.cirrus.com> =
wrote:
>=20
> On 28/09/2026 8:55 pm, Sander van Delden wrote:
>> Hello,
>> On a Lenovo ThinkBook 16p G6 IAX the CS35L56 driver requests firmware
>> names without a speaker-ID suffix, but linux-firmware only ships the
>> spkid1 variants for this SSID. Out of the box, no firmware file =
matching
>> the requested names exists.
>=20
> It appears that there is an error in the ACPI on this model.
> It should have a spk-id-gpios property in _DSD, but seems to have
> shipped without it.
>=20
> If you could provide the output of acpidump we can see exactly what is
> in the shipping ACPI.


I=E2=80=99ve been enjoying some email problems, but FYI I think this is =
has been fixed in the mainline by this merged PR
=
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/8a2964613ac50ef=
5a6499e6b0e0189d38e9dd1a8

-Simon



--Apple-Mail=_A8D01082-5BC0-4547-A348-E51C86815F5A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On 1 Oct 2026, at 10:20, Richard Fitzgerald =
&lt;rf@opensource.cirrus.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>On 28/09/2026 8:55 pm, =
Sander van Delden wrote:<br><blockquote type=3D"cite">Hello,<br>On a =
Lenovo ThinkBook 16p G6 IAX the CS35L56 driver requests =
firmware<br>names without a speaker-ID suffix, but linux-firmware only =
ships the<br>spkid1 variants for this SSID. Out of the box, no firmware =
file matching<br>the requested names exists.<br></blockquote><br>It =
appears that there is an error in the ACPI on this model.<br>It should =
have a spk-id-gpios property in _DSD, but seems to have<br>shipped =
without it.<br><br>If you could provide the output of acpidump we can =
see exactly what is<br>in the shipping =
ACPI.<br></div></div></blockquote></div><br><div><br></div><div><div><font=
 face=3D"Menlo-Regular"><span style=3D"font-size: 11px;">I=E2=80=99ve =
been enjoying some email problems, but F</span></font><span =
style=3D"font-family: Menlo-Regular; font-size: 11px;">YI I think this =
is has been fixed in the mainline by this merged PR</span></div><div><a =
href=3D"https://gitlab.com/kernel-firmware/linux-firmware/-/commit/8a29646=
13ac50ef5a6499e6b0e0189d38e9dd1a8" style=3D"font-family: Menlo-Regular; =
font-size: =
11px;">https://gitlab.com/kernel-firmware/linux-firmware/-/commit/8a296461=
3ac50ef5a6499e6b0e0189d38e9dd1a8</a></div><div><br></div><div>-Simon</div>=
<br class=3D"Apple-interchange-newline" style=3D"font-size: =
medium;"></div><div><br></div></body></html>=

--Apple-Mail=_A8D01082-5BC0-4547-A348-E51C86815F5A--
