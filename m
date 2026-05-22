Return-Path: <SRS0=q5k/=DT=opensource.cirrus.com=prvs=6602c9666c=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E88ECD5BB0
	for <linux-firmware@archiver.kernel.org>; Fri, 22 May 2026 10:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6043C1F00ADE; Fri, 22 May 2026 10:23:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=fail smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=fail;
	t=1779445405;
	b=OFZuj7zSMnb7CWxi8Us7uoHhYhAkHSxPvxnj3A0b33KJwemDymPyYxDslb7uboXkRB6e
	 8Jqgi3hb+2QK0+JE+v0gXNWDmY09TaIA0yC/PFHXTGAhiOJfzyLwa/E7lN6ugCLgpVjqA
	 4+hnokdXSB2sxC1fUuCDF0HcSnLt6blrOs9TAJlgHE51OW+4PCDKOwxK/ODYwzwXVt6N4
	 TR1v0v/aqIoPghcFFuME+ntNEnxLEg8UjCfT00CYgSrhjZYOF4JGOmqr7aAO9SY4jz71v
	 rFco6Ao01fKOzdl3iuXx8otAPzxTS+Q8XX6wpeAdAnXCyegVkhf0SafL7WgWEwHw+CA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779445405;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Reason;
	bh=xhCUaoaoERqvz3Wuhd2zQA7Ql1zxC880rdRTtexx7UQ=;
	b=SF9yosVns+tZFcbz/bZPnUh8YymcZJ4aApf4oL65akRsQZKccNwC9o2eXfNpUfYJZhV/
	 9/PhEksJnN2INzQvNJPpM3N+oqfIXPR3d69ae3UtSoHNLHdQXfU7dfotQGpec16sVCxO/
	 IS79djMXQuIyNPtVbzO4ciC1I4owAH/JihvlH/UgxWCXHfMKLfeuVKdurMXzNYcBqPc1n
	 y5fsr6MnJlAcZnXPmiGRZG9f3hS++ho1vpie1IufmzHVklTgU8ABcug5rZ+paey3NGDr9
	 U1JcEV62JBiydO5Ty2yg2PINQRV20kAYDwxk1XZrMZgt7vH6mV8w7/siyLX47VbsLxw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="jHHS/dOm";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=AS0y3Low;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=fail smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 90D2F1F00A3D
	for <linux-firmware@kernel.org>; Fri, 22 May 2026 10:23:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=jHHS/dOm;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=AS0y3Low
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 90D2F1F00A3D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M3a4uY718396
	for <linux-firmware@kernel.org>; Fri, 22 May 2026 05:23:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=xhCUaoaoERqvz3Wuhd2zQA7Ql1zxC880rdRTtexx7UQ=; b=
	jHHS/dOmsifcp2fE3C+IGV0QhaadXaNrL5hFufKW9MsSjXepPM6Mus2fwttsWugh
	+RLFl1r7hmeQtjTUmrWkKfwFPgIPeby+irG9eelw+aiG8E+Q6gj+zTyO8uqyfZVq
	eBK4fCh+WuAPi+D46xVymVfX4SA6n8OE36gIPasl0+8RyR9KnE203QFohs+CAg5D
	L+xyPMANYBLq7lisdCKx8t6WOnSJTNRCnIWGAcKQ71LJV2Fjy/UubvVWoB9hkjl4
	mdl7cm0Fam+4b1I2fg2tJ/7ljwYres9ZrXSOORApMAFEG9krGiNhozDakKc21cAh
	/jgZ76xbMNbKne/tkwj7Hg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020100.outbound.protection.outlook.com [52.101.201.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xckssx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 22 May 2026 05:23:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4PrGrHfHd21GEv/F6wCDaccsxRYl2QCv49JaUgDCt8WNsNbg2AzxAK+Qq66LqJgeNlXhZpP5dQ5Zvr4nheKYqbKHeUDqHNZZ6GNedZs+T2QnSLt6XOlqkKJW/X2B2cmJMhGNrWoJVxTIJfFsiQMlF7MbdMTGjshLt2D1JJOH/WddghJBaBnSoKWhMdyNlX8I0l3eimFae/tlvcSCC/KTyJAxXzgk1A/Otsa0sZGSJWccWmHs9xod5/0Zv4faq+2iUp8txVRWG2R2lNZ0qwdo/PVC8jQDjdKzO/TjTOJF4c2I1B24Nt1XVRApP/Lic7tNS0OD5cgdOsHIHZeKCQAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhCUaoaoERqvz3Wuhd2zQA7Ql1zxC880rdRTtexx7UQ=;
 b=KCQntDNW8XY69IOAJQ5qd0ycyEdDo/MB5RfnSlQ/mAndq8QqMntSr0DiYqI3AE68OqVm+ednuI/zGco/mNkwowzvK3PVtbrlX291sc9ODZGsd5A5jDmWldDj+NtdqF4LLldCku1Cu96JWb9jSVlTJr9tvjlN6eK96w0/9Wud2GBLyHvZrynm3mJCOmExqHOFLH+zXJAAK9+GKfqjNtUE2B8zvI9Gb+PPzN8D4y4/iiGAv8ykPDLT+kvxXsE/V3B8sVwLBeYvv0JQ20DqvpkBf9iQCplb2qXjylWRWDvkfYbPQDDT4ZsO8teBP3WTvdWK97ojUrWHs0liaRoIhqPttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhCUaoaoERqvz3Wuhd2zQA7Ql1zxC880rdRTtexx7UQ=;
 b=AS0y3LowEqN9BMFPtvWLuF6n9N0DENLgErEquMuyvnep/AMT0FCLo4guDtr41L59k0QdNaK1dd4UgMAUsIcWes67xlPbka85QYzgtz8hBe4LnzvD5MlkLl4r7pfRP+AqDoNv7OtSWkIhWXLO5mhPdkXbEDsMo8Vcw3pnUJReKMM=
Received: from BL1PR13CA0012.namprd13.prod.outlook.com (2603:10b6:208:256::17)
 by LV0PR19MB9614.namprd19.prod.outlook.com (2603:10b6:408:31f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:23:12 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::1f) by BL1PR13CA0012.outlook.office365.com
 (2603:10b6:208:256::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.6 via Frontend Transport; Fri, 22
 May 2026 10:23:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 10:23:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C68D2406544;
	Fri, 22 May 2026 10:23:10 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.68.74])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A9F33820244;
	Fri, 22 May 2026 10:23:10 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Add and update firmware for Cirrus Codecs and Amps for some Lenovo laptops (20260522)
Date: Fri, 22 May 2026 11:23:10 +0100
Message-ID: <001601dce9d4$fd62c740$f82855c0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01DCE9DD.5F2819A0"
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: Adzp1LcQ+pMXkHcVSZSLUGTt8goZeg==
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|LV0PR19MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: c8b99175-e37a-4117-ac10-08deb7ec20cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|13003099007|56012099003|11063799006|18002099003|16102099003|8096899003;
X-Microsoft-Antispam-Message-Info:
	OfPQ+N9RJrNPqShQl1D7dGdwnP5M8BgfbT/UKO18PAfke7lUh5dfRBLWzXo+DviMbYh2pkquBid8VftD2U/vZ+wAGftMTeZihWuxmneDt3w0kRWbhAMqgWIEYv1BvTIt6esCawA8WFsL9olyk7rIOg/drTtxAtvsJ/Xt+KcCF6XBveq4rmRBGzEod6gUEIxBIqg+r6eYGDvslTiyFrzDJNGDGFl1ST9YYBcSQ7ivoI3J4kYlAX4924ZLAXoLUz3WWli9aFujmrb09PvFVzfYMehKcRzC+qu5pN85qQ3yxh9e8SV5RHwnSE0zEjLM7zCQkRHihRxsDqUlaylTaTZV6AtCby8G+PyqmCGVK5wJI/JLySTT5uGla5B2H6my1vX1IhvqEh7p4u8On9J4laAL9F8fGufxgD3cPExbGCVfbDEzy90hmlzmICvz4hXRKCWk6eGmjuIg2ecJBcVXwbZ0pYnOoDCwhVSgkhEymSWZb+K1Jt+kH/ihyE3kF7qc0xgy578RXmuOz15YJeSjxlr3ckFim+R/mw4NoJfq4IV5TtuJzoLfwt05h2w2K5hnPX2YOwSmOT29Uo09sAlu9SV2q6XT6Xc0RbIZnsipA1tcCvX9yq2arSB58UeMNhrdg4ZXeLLZplHVWUaHh5e/4O7n8Buha40h50ufGplKxQD3n/bCFHq6T4Szojt8TL0Dg56T
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(13003099007)(56012099003)(11063799006)(18002099003)(16102099003)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Oea7s6jHYR3MQdVon21JdnM5QnVMEjMfRZ5PRFLhqGXauuw8kspj0EBHDHU0K/bDFKT8aKCXSAfpBdMKZoipNuiyZrS4s+nrq3fnzaxS1HP5IiQeCdOCNeV8LuUQVLr+74c6//F8WALrWnZilX0CstycJyhER0imaQ3rQLasNvKVul7oPkdqyGEcAA1PQUxTGWavUoN0B8GQFkOxIODrbQ/Aqh2lOP3tN4oci+VKwJ0EgsLTPvHjMi/V4/4JzhOJP2Rv43OsvPxcefufsBeSPsuluK9j/Nb2cZj4/w7iImnAEotvFLy/lZLUaiNNCH50w+BUrENeLiLJMsZLa0G876qN1aYfKN3KN3IobTIXCOj/xnc4Hx0Q8y8n4WLjyOulixUai2TidaQDPhcQ8GGEJgWo0GQAqyVoMG5AtuSweWG0EEThZgNwiFu/p1tp10UJ
X-Exchange-RoutingPolicyChecked:
	SNf/FV1dtRfttOl5uJOSNS4PporIbQ8fk0dviJb9NZZNPCP0/qfPwjoji8+fwzuFM3Cudzhuj8c20JXECE402c2oeD1VgKuU0v60MLR4hPEJp0jZ9KNs0e9spi73OapWsU06ScZG+2PzW0aafFOT7qJjRS/TQY7HOAjVnoPLrabN+hE2YAv6zw2KQEZl9Tbbb+FEPdmMIgZ2AgAvCfxvnCFRMQzasrv8Q0hslwLcTNQTmwYMBViFvp1KBe1AtW3XpuTWRX9OQrRzEOJaAZVvZ4iz2/W7MNb5zMpcRK9RzFUi1fbemtP1+rniofAbAelBAIGHpDi5oxNDKKexnxSZOQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:23:12.1657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b99175-e37a-4117-ac10-08deb7ec20cd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9614
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMiBTYWx0ZWRfX7CDdhM8ROfe+
 enjKw7FtIqfJUsSAimiGl9p3o3kPZNsjXLbk9NHKOvPARmMuWothAAEgbG27i5Q1b7MtXKzSAIj
 5xfucisGweNxJ6haeUzwPjGp8vN+JztcOI7t+Fcg9hRJL84AGS2C3giJw0R9ooWxrRB9Q67m5sg
 SecRtWezuO0PiIh/u4m9KHADHikTULbK6ypn1K4Fjo0275Byz7QZfQbFdg52B3SHud3zEktIB5w
 9brHrhyYo3yE1i2liA1E+/Vb/3QbB+R8Qlzkwn8kmYpDjwK/wPJnuMpagv50HIDZ0EFz/qiSpRv
 WfcYyGSocB8Ax1VX+11n4Y1okDmtcVqpfHquGSWA7wUfh1PwCTzdbn3N6oHar5JuVF1jZDTYb0Y
 +qjOnAxVdoevMiPnxslmwtf4R0ovql90n+HmwDjZx1lc5yhUbbrxmmwUsTcCQ9+GDhZumVl5htE
 H70c9KYFGnoGTOoT8YA==
X-Proofpoint-GUID: VGxCn4A7qLxo1gk4ZtigF801FSt8nn1J
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a102e94 cx=c_pps
 a=jBnIPXBCpefHP6rz4AJLnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=EJZavnjLwxhRD7tuco8A:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=q7lBFAdQTAHtIUPh704A:9
 a=95w4YoUIpnZz018w:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-ORIG-GUID: VGxCn4A7qLxo1gk4ZtigF801FSt8nn1J
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0017_01DCE9DD.5F2819A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

We'd like to add and update firmware for the Cirrus smart codec and
amplifiers for some Lenovo laptops.

Thanks,

-Simon

 

The following changes since commit 7bf283bcc2947c74fc32e78a6a689ce203380a67:

 

  Merge branch 'robot/pr-0-1779391380' into 'main' (2026-05-21 20:12:14
+0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260522-cs42l45-cs35l57

 

for you to fetch changes up to df472a73b917abafe34169b91c7428c54d6c5d7e:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
(2026-05-22 10:14:34 +0000)

 

----------------------------------------------------------------

Maciej Strozek (2):

      cirrus: cs42l45: Add CS42L45 SDCA codec firmware for Lenovo laptops

      cirrus: cs42l45: Update CS42L45 SDCA codec firmware for Lenovo laptops

 

Simon Trimmer (1):

      cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops

 

WHENCE                                               |  22
++++++++++++++++++++++

cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u0.bin | Bin 0 -> 13652 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u4.bin | Bin 0 -> 13652 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u0.bin | Bin 0 -> 13660 bytes

cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u4.bin | Bin 0 -> 13660 bytes

sdca/1fa/17aa/2352/42450005.bin                      | Bin 13796 -> 14792
bytes

6 files changed, 22 insertions(+)

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u4.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u0.bin

create mode 100644 cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u4.bin


------=_NextPart_000_0017_01DCE9DD.5F2819A0
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
class=3DMsoNormal><span style=3D'font-size:11.0pt'>We&#8217;d like to =
add and update firmware for the Cirrus smart codec and amplifiers for =
some Lenovo laptops.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>The following changes =
since commit =
7bf283bcc2947c74fc32e78a6a689ce203380a67:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; Merge branch =
'robot/pr-0-1779391380' into 'main' (2026-05-21 20:12:14 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>are available in the =
Git repository at:<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; <a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> =
20260522-cs42l45-cs35l57<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>for you to fetch =
changes up to =
df472a73b917abafe34169b91c7428c54d6c5d7e:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops =
(2026-05-22 10:14:34 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>Maciej Strozek (2):<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs42l45: Add CS42L45 SDCA codec firmware for Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs42l45: Update CS42L45 SDCA codec firmware for Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'>Simon Trimmer =
(1):<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for some Lenovo =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
22 ++++++++++++++++++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u0.bin | Bin 0 -&gt; 13652 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u4.bin | Bin 0 -&gt; 13652 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u0.bin | Bin 0 -&gt; 13660 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u4.bin | Bin 0 -&gt; 13660 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> =
sdca/1fa/17aa/2352/42450005.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | Bin 13796 -&gt; 14792 bytes<o:p></o:p></span></p><p =
class=3DMsoNormal><span style=3D'font-size:11.0pt'> 6 files changed, 22 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid0-l2u4.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u0.bin<o:p></o:p></span></p=
><p class=3DMsoNormal><span style=3D'font-size:11.0pt'> create mode =
100644 =
cirrus/cs35l57-b2-dsp1-misc-17aa5158-spkid1-l2u4.bin<o:p></o:p></span></p=
></div></body></html>
------=_NextPart_000_0017_01DCE9DD.5F2819A0--
