Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5986082BED
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Nov 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=eqBsojZK;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=lQwevkwp
Received: by smtp.kernel.org (Postfix)
	id AB4C71F00A18; Thu,  5 Nov 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793891990;
	b=uPeSUJn7ErA1iJvpwTLHwYLGucRCV5nkHN/HlonIdZkFWiULyDfdhyM2hl+k+fs7nYzA
	 /ty+Xe3lCtjxlhKgKj82+tE+Wwz6eLLUU2CIiDMhQ0wtQh3//HvrGZuQP8YYJMkpBEeVw
	 0u0k7pW158g5Ija6Ajhlc9btYNsUF9wIlR5U1wgftyiVX/aWhQxzdCef0ZESTKlWguNZA
	 GSMCQ8tWRQrpyda3is6TSiD4ip78xuwso5jxM1wvjgja7dTIOdCYyxzxc8hM9oGnlzutX
	 g4rkQaNKAomLOIemdzhfF90FT0ZRoY5QJ52jyixn9PEfJ/F4jCyasjT9MjPwJlC5xQA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793891990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:Content-Type:
	 Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:Cc:
	 List-Id:To:X-Mailer:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=L3GN+lPl3hH4jQPP0gzVkX8EJA8jXMkzqP5rZkyw38c=;
	b=Cw1Q//kwbKeZsby+OnIyZyo1dSDD7DGOyVTbdq6bjpP931YNklPkfBkUlnimevSYuwYg
	 6PZFL3idSvlSX2cxMH6DXR0WGiqJiTiiSKIOXSXebgvP9YX78whIHjmaYr5An00cEprBQ
	 OdsB7L50NPqWHdQsViMS1D0sR8O+Lzq2Jz5fQgwJReJPA3hsuXniCIXJ8T9Puz2D4/MuC
	 QUtmXbuHnX+nleHKw5qpcUbJ/SKHJA7EZOWXYmQpC+Q1l3exefTAw94BCKKBylhCrszrS
	 Sd2W/mEB3ZXIp7XM2LTxBFMQhpyAKk5o2ahky2vvTCpJuNGmFZBh2JdDt5lYXoUvcFA==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=eqBsojZK;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=lQwevkwp;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A9871F00A16
	for <linux-firmware@kernel.org>; Thu,  5 Nov 2026 15:19:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=eqBsojZK;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=lQwevkwp
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6A9871F00A16
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5DM9fP1567639
	for <linux-firmware@kernel.org>; Thu, 5 Nov 2026 09:19:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=L3GN+lPl3hH4jQPP
	0gzVkX8EJA8jXMkzqP5rZkyw38c=; b=eqBsojZK65ZzDOxrV7zZfGpUbCdFRYS1
	Uj/zl8jpxBHv0+MZEU9KbEIC0aOHx4+cnyYoVEHBRbF3W3aJRYptGvTOtF5cORuM
	NvFeiRt+fUsN6s9HRTuW9stH1HGipg5sx0/8Y+wj57pL3XcgdMxjPUtEmxpMe8Vl
	YjjWTtfiX8IKP66OxdDyDcTOlBVkPAaqVbNcDul5bzb09ivkTGaOjS6NpIg8I8wO
	CczmZqkI7Md96Lpq+ZSPojbmSQQxnrblIAI2BM9jI2e3F8EarnYutnayq7Xx8c+j
	hKnzNOLCHqs1igBe+DGAN+bmyqXCqfgcprVGZ3iUDD6NxVAZbJkKDg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022085.outbound.protection.outlook.com [40.93.195.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hr7c79u1v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Nov 2026 09:19:47 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzUHFqXodAxA7mhDOEP56hYvSDxTtVCbUxWGnwQ+oq7pnGSw/ZfX4SVLUQ3SMPw+60mL0pfNstZENoFSFnG/Bk0mycdRYGmmT5BpnQWUseXphF7+58kO9pppzaFRySyXGzNauNSRD+5Hw+nHeITlgp2xi+9pF+6yaLSFILwJ+wowttvKKkoiwFdhJZ6yXiy4qQoZb7gM6bWShAhOs8ypkcwfuAtoephvuBEcDmFVqLCi0EKZBhheDXC23l2qpu4vdpNleK+64jk3vkTAMmCyIFkgGt5pKO1H81An9SvS1u4NRbcnMcwtxv+HGLlpFf7Sk0xCIWJdU8CA++/bcoXe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3GN+lPl3hH4jQPP0gzVkX8EJA8jXMkzqP5rZkyw38c=;
 b=N5n2AuMVMBHrfYgp8PCsvgWl/CfBEajaNc2Gwc+uPs2iWwkMrfhqp57XzU+l2NCiWEnqFcq63lBA6XwVDlC0+Xp3hmAXNKRLvg3ts9mmOCN28CfjGsYUh6zOS8h46jO/C21NgMyAFlyc3R0wtfC+weNRoesjD5nNpjc8yjDubJHM7iFUXfYlkLgDwn+/zyIKhcAmx/8jkWUHIVoCzB2YR5Dq6HE6KAyULV6F/uhb8lhqXLTU3XglY3QDQVhc9ER8me+BJ1dV5+BkxT0nJwGX+mM8d1UGTMHSslImgW6kvP4iRQWJlHT+UuTpaT/zyG+0ha4LLmTbAk0INHuoL21Nyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3GN+lPl3hH4jQPP0gzVkX8EJA8jXMkzqP5rZkyw38c=;
 b=lQwevkwp7JqxFU3UgQXDlbSoa7DS3CPOSqmIBG8xk+Wz4PdedfFoXhWANDW3fwf9/MPi8xcor4MNVH+OGVex/oxtdXajnGOO3NnRrKEWU0ycqzbcOv/MkwwG1ZQcSdEjZ+R4JlyLZ5sP2uZZRkZLF5QjBerfpI1BQPm562nGBhc=
Received: from DS7PR03CA0055.namprd03.prod.outlook.com (2603:10b6:5:3b5::30)
 by SA1PR19MB6670.namprd19.prod.outlook.com (2603:10b6:806:259::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 15:19:24 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::96) by DS7PR03CA0055.outlook.office365.com
 (2603:10b6:5:3b5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 15:19:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 15:19:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 938AD406544;
	Thu,  5 Nov 2026 15:19:18 +0000 (UTC)
Received: from smtpclient.apple (unknown [198.90.190.235])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7888582026C;
	Thu,  5 Nov 2026 15:19:18 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: [PULL v1 linux-firmware] Add firmware for Cirrus Amps and Codecs for
 a few Dell and Lenovo laptops (20261105) 
Message-Id: <A4B28BF4-BCF2-4414-AB13-B58D3BFA6734@opensource.cirrus.com>
Date: Thu, 5 Nov 2026 15:19:08 +0000
Cc: patches@opensource.cirrus.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|SA1PR19MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 7287a93c-1761-482f-15f9-08df3b502a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|36860700016|82310400026|56012099006|11063799006|261102123227099003|261009221727099003|261021121427099003|261009223327099003|261021123027099003|261009220027099003|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261009221227099003|10067099003|18002099003|16102099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	l9C8wkTVuL7EXBzYhkfFYGChiv1l6Es+qSUu/spgZkMOXGcU33etJ1m9afu9IHzHTPRXhR69FVOMC608PDy6AQ+Jv5GIRmKPv3SP9HQdo8qKWvYOA/GsytAzlkcVn/eloyYtyPGnuq6b8YilTHeCSqgGjxehuHN5U3xXn4zwqzYeL2i7QDV/vBFRm5VrpkgTkvOIQQmHfBWNiRaigY/Z0j7g3gNM6QzPzuLAC8ynWEvWZFO+1Oh9m4G3kFZYD4br4j2YSVZKf5vjl5DghGek7ZorEbVHkHKzzKHpITe0TSEiGTPeqRzeJ3wfuRc+jMal9/0uVVEgbE/TSwqJxazfqKrkhzzfaR6gtZj7hjIEYzKzqS5+ErR8mflEuWVz/MNwqKLhS6QOF8L3pmGgP78FRz0x/Y0+MwHSC21B79kEV+2iqXU6JpZDrIOwnvQOW+M7Ea9J/1wK5XNy3TeK7WSwlGIKtyLqsW1q4XNsFP00XA9apOEebyo23gqQpvUuNT5NRZAb62zH75YWy00zrjjTMCiUyzYvcMHmNXrmv0daEad+2h2ZQ5xeNpT8rpVsrA4n7Wg3x6jWDibZiR54YTZDJjF7fyxqN9FjvMe49iF7Y+Zy5G9CAaG3BZRV/NLK7hTKpwNsQK6e0s2Zg579y5dftwL+bNIBouGR2Q1bU+s19M+//n+sG5eHmROJWAHYFg+TV8xxviOO2gFqZ06k8ydl7Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(56012099006)(11063799006)(261102123227099003)(261009221727099003)(261021121427099003)(261009223327099003)(261021123027099003)(261009220027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009221227099003)(10067099003)(18002099003)(16102099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dmMxYYLOWja7IZ9YKrqdH6oJStkFWt2J1dfYZR3Sn+h8QGptkEOqS0z42hUehjfDMxK4B1g1G40H9hqzxsVwqLdAq2+JG0GnNgmkd1eB2rkeJw0uuqbeKb/FPnW7wHe7v8CMrL7JUcm4/1nvVDo0aO4geBJ8fmzUSa5xqgz7ZXKwYd/NmmZTVX2aFaKMu7YyIDxdQufQyUb+/w8jji4amRFWIL69eudTAKXWsvFagruhOVLG4MPlUX4OCIlgmHoOk1XxSETp53ujB6UxDBFqKo3kVDb2PNmBh7sGVAZt8+wEtXaPxIDFtEKaGG+lSy/vYVhW1FK26q47VkXkTPLFim0pa5b+6mcr8hLWXqIvL0lh/0a6nbmb3aUZabomWNI6+4QrvaZ47CaJ3/eE8cFZNIpXExeF4ZuUPpsKLohxBvvcJixVFAIZAMIwMVhEhKxg
X-Exchange-RoutingPolicyChecked:
	YQ0LfpS3X6kxxdq9+A1zXQIVw6tMW/bBEoIUboJKCeqycnnSJQZ3iUAcOuRp929K4s0aZnfCs4Iq2hQCh1O71OmVgmmCErvKquh3fAJV2MsOSPekNFu8IUV5d8m34wU0JMziHd680UPc5pWP0JAdHrCLZ2awUyCciBqrHJlyZGalEXRNY8aTOVNaaaz+RTlsGw8A7ED9qQ/DkBBi2V0ztwOpmFKj8PH/dqw+ZBmjvJuRFB9pte4LLoT57Z6shmaMX+Z2mxTHrxl0dxuDzwgwXpIiuDw14yCEbN8p9W11ucDZI6jX8hH9Psq8H/Nm7mrmML94k+EcD//CLO29+srTTA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 15:19:19.6020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7287a93c-1761-482f-15f9-08df3b502a05
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB6670
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX+PrLhjmpLVqf
 O4jyDo9DJqNisR151aOmbzQE4M+810A4jE+ibgrCLghpP9IwM5IMF3mO0lasP4yBkKxNNi7xtvr
 q5jtJpx4IG1ajwEEq0Oh39/qLuFJLdBe+vaFh+5lAabydzwp7ZXRcfmKdWzEstNgjZTEuWIvnxU
 Wr/GEwPgUvDzfbU0hXnDncLp+ARgZ3penzJE/6+PR3IB+w2d4NwbXQZIeo21Xd2pv96pqf4GM6A
 KP+9wJ5U6hj3phHHZRG+A9Am1bGjvuL4dTLdGySEjrBTAmZYqExOIMvJr6hK9MOsZt4xsnHZ75I
 k2ZKabnutd9bhAYN1NxTwTrfQViptN1bp6YxCVN4GLcHC7IIwXhVuN+gHwMVbRbILu8NRZHlWOF
 EMFUJu58zAQ9PjYVPRD6qMvyUpS0GfkjAZKg1MIij92Nk5YrcPkUYEy4G5z2+Nc/pCnP8fQnNsp
 kOMeWA++/tt/ytYtgrQ==
X-Authority-Analysis: v=2.4 cv=Vr62kO2n c=1 sm=1 tr=0 ts=6aec9e93 cx=c_pps
 a=IrW4GQFFt97Yz6NwHc2cjQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=TG_bWCyoMVgd7kiMJ7YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LMIW51xqF27Vo3dqiWAJYTI8kVo9tYJE
X-Proofpoint-GUID: LMIW51xqF27Vo3dqiWAJYTI8kVo9tYJE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MCBTYWx0ZWRfX6ES9HMQXIEi1
 Fueg1EfPhEiCc0rmEkLDKvhiugOx3am4kqCqr8kgnOCNLX1YlQ9+jnNPuLMGIdkwtz+OWsmosCb
 mNrdlvgFYzOqK0pbCHXjLt/IPMCP2Zs=
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
A small series today!

We=E2=80=99d like to add the firmware for the Cirrus smart amplifiers =
and codecs for a few Dell and Lenovo laptops.
Thanks,
-Simon

The following changes since commit =
bc028c505cd77ee52de8a0e0032eb640a57001e0:

  Merge branch 'rpi5bd0' into 'main' (2026-11-05 11:37:25 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware =
20261105-cs35l56-cs35l57-cs42l49

for you to fetch changes up to b5cb6db823453a8a34b46658e2a718da65010b70:

  cirrus: cs35l57: Add firmware for Cirrus CS35L57 for a Lenovo laptop =
(2026-11-05 15:12:05 +0000)

----------------------------------------------------------------
Maciej Strozek (1):
      cirrus: cs42l45: Update CS42L49 SDCA codec firmware for Dell =
laptops

Simon Trimmer (2):
      cirrus: cs35l56: Add firmware for Cirrus CS35L56 family for =
various Dell laptops
      cirrus: cs35l57: Add firmware for Cirrus CS35L57 for a Lenovo =
laptop

 WHENCE                                               |  30 =
+++++++++++++++++++++++++++---
 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid0-l2u0.bin | Bin 0 -> 12916 =
bytes
 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid0-l2u1.bin | Bin 0 -> 12916 =
bytes
 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid1-l2u0.bin | Bin 0 -> 12912 =
bytes
 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid1-l2u1.bin | Bin 0 -> 12912 =
bytes
 cirrus/cs35l56/CS35L56_Rev4.7.17.wmfw                | Bin 0 -> 41928 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid0-l0u3.bin | Bin 0 -> 12844 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid0-l3u1.bin | Bin 0 -> 12844 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid1-l0u3.bin | Bin 0 -> 12844 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid1-l3u1.bin | Bin 0 -> 12844 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid0-l0u0.bin | Bin 0 -> 12444 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid0-l0u1.bin | Bin 0 -> 12444 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid1-l0u0.bin | Bin 0 -> 12428 =
bytes
 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid1-l0u1.bin | Bin 0 -> 12428 =
bytes
 sdca/1fa/1028/cs42l49_v20260921.bin                  | Bin 18032 -> 0 =
bytes
 sdca/1fa/1028/cs42l49_v20261104.bin                  | Bin 0 -> 18388 =
bytes
 16 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid0-l2u0.bin
 create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid0-l2u1.bin
 create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid1-l2u0.bin
 create mode 100644 cirrus/cs35l56-b2-dsp1-misc-10280ee0-spkid1-l2u1.bin
 create mode 100644 cirrus/cs35l56/CS35L56_Rev4.7.17.wmfw
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid0-l0u3.bin
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid0-l3u1.bin
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid1-l0u3.bin
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-10280f05-spkid1-l3u1.bin
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid0-l0u0.bin
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid0-l0u1.bin
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid1-l0u0.bin
 create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa3824-spkid1-l0u1.bin
 delete mode 100644 sdca/1fa/1028/cs42l49_v20260921.bin
 create mode 100644 sdca/1fa/1028/cs42l49_v20261104.bin=
