Return-Path: <SRS0=/RaN=GL=opensource.cirrus.com=prvs=9690d3d3b8=simont@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69415C5DF7D
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Aug 2026 15:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DB061F00A3A; Tue, 18 Aug 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787066392;
	b=JL0jPC46+++Lx6Gj3yZEkNkzhzubcl/reC5NgcTdAHGwsBD4eI718VtpJekplmLhUtQ6
	 iuxuyVYc5I6Qh4x7LA1hfqer2TObarR65DDdwAv/A4gdxRYXHQi43gBvmTAkwjP0FLZRo
	 UWXSljhVv8g9eyEPRDG6oah+1sj3fjVouauHTvHurbrNLOMMVwO8v7QPqjFqJ8eiEe3BE
	 j6nc7iyoW1NKD4qEb5l1Qq98fhAOcCJJp/Ss1Kr1WmI+rqgWBsuRwGF4I8z2xhdaKx03Q
	 yl2wGEJ42ySkulKvSRstrbAOwPSCPIQudcn14gwNzWgW+lieMJM1rYOmYfJ9mhkI9yQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787066392;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:List-Id:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:X-Mailer:Thread-Index:Content-Language:
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=+hOaLwVi8PTYq6m5nU+x7q04OavehiIrHvmOtM02NR0=;
	b=KlVmKXFYlA4zvQaf1b53Y23xUOCbmcPxDeYzfa8gj4mvOcYMroJ+SLbysDgdFbdGbMen
	 S4mdV3CTpvxvyR33Kj1C4W/EG/SdL/Mm+R86OOWnx1iF0Onps/y8WCPknnIe/SYEKqa+Y
	 erazTlUn3/pqy6hyHusvul+vpS+gj4NOXMHVWKk94LlEEmxPmzvhMY2IFhJpMbFQFK6j1
	 qe14EbSPkG7SainemtoOKrI7QDaoGwe1bLT36cNSxM7XU4TVuJOGWE5ZOPQBTE60EepI4
	 MzNDbVZNiBmIhTWcD5VjAKlM3znUdCXdEUrpXTZYPmyBFkCGzDMh2KxVAfRok3YWSzA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="XSf/Qmoy";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=zJd+ssIQ;
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 408241F000E9
	for <linux-firmware@kernel.org>; Tue, 18 Aug 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=XSf/Qmoy;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=zJd+ssIQ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 408241F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IEq0Zh2708154
	for <linux-firmware@kernel.org>; Tue, 18 Aug 2026 10:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	PODMain02222019; bh=+hOaLwVi8PTYq6m5nU+x7q04OavehiIrHvmOtM02NR0=; b=
	XSf/QmoyOHTNqxoKDRvxEStpqch0C931Jhks1g8HlggPOAEuIRsSk9SnVBR6XFqf
	Oa2wEl92WIoHC0Nx4kfBq6vnWcxDb3DFPlWmhcnhWartbSNoimfygZKKZcb8NOV1
	S42fI19GtsLpeePfXSzAQsUnJKW/2OKbgyElCG1Y0s0KvS9347QmjY676oZkfqHF
	acgJgSJVCNewKk6fg0wmfoaQME3uYC890iNGS+CV63vVloUoFY6BTe0B2QH5ZYeO
	fyfV2T+0QjXnoQpF8Cz9wn72pXshB8lZhWoejSBWE0ESGKH3QYgTPwLR3EwNCd/q
	p6s8jQymkivohA4rAFTULw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020118.outbound.protection.outlook.com [40.93.198.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g2mheva2g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Aug 2026 10:19:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ac3g713qyjbuceLmmvIw9+QLrHNojiWTgzgRgeLdSUaD3KE64YaidxGZUL/sqvl/rp3+gkhhGh88isYlLm1Ua2Vgp4KyFz+InSCru0yxKNRxlHWXNqS7IAodnSXewikklWoiqQZmUySDJitwYoGhlXca0X+tX5aig+RPKybnEtH43namVtWV5WpgP9a0mMROfy7JY0SqO6QXkO9GBotNUkMmhiaA2SprSuhIz/Nnq4rCL7N5ZhLhXOHvZrQJ2HGeTDUGO/SIWkTZmg/2Bc+S4p4nHOUFC43fKh6IkkyXG6OtXl2xcbkXarz/JPaLShkQJ29HAXOMaHFI1rm3BeG12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hOaLwVi8PTYq6m5nU+x7q04OavehiIrHvmOtM02NR0=;
 b=MkSfqw1QTYfC2y/y85wWh1nMm3kG0wYPDuMtya9pfq0KUoXEjTcmYswuTdDsYk12p/T1Cnu1ewUujfDl9Dnq4H0e6SHlTRM/NksCZGoLMUQpIIy3xS7ccgHTmx1rphw6YnixslZTohcbDr2UnPDwAtzagq+yQPdHS6Hgfen1dPntqZj8lL7uWMOvcyut1RXEOjHTLNT8yIJere82VbS8exQYl9KhQt4sxgkB/ncBxzAhIjzDF0v1VLusjXTdjWdi4O81yqOWcw4sg302B2XfzudARlYzMjRfsV2OQo271SaFTATnd/cGvy1qm8FO+s2Fw52ynqNsLYGh6S1VaoX99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hOaLwVi8PTYq6m5nU+x7q04OavehiIrHvmOtM02NR0=;
 b=zJd+ssIQq2KOf9upVUFQJ8PCU197K0QwTO4D/uJkRVQTDptVHsENXYxrWaRlPkg/8n9I/6UYzMgzTGWVWS0PZ16V2IQmuAVeA/dPN0CJkfjCZwsjVwsEjJ6IUIYcdbvHkm6MZKtw4f/rLx5T37yR9Y9AvjJmEkXZceUpeoyiTo8=
Received: from SN7PR04CA0186.namprd04.prod.outlook.com (2603:10b6:806:126::11)
 by BY3PR19MB5171.namprd19.prod.outlook.com (2603:10b6:a03:36e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 15:19:45 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::38) by SN7PR04CA0186.outlook.office365.com
 (2603:10b6:806:126::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Tue,
 18 Aug 2026 15:19:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Tue, 18 Aug 2026 15:19:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 6574E406541;
	Tue, 18 Aug 2026 15:19:43 +0000 (UTC)
Received: from EDIN6ZZ2FY3 (unknown [198.90.190.231])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 44ED582024B;
	Tue, 18 Aug 2026 15:19:43 +0000 (UTC)
From: "Simon Trimmer" <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Cc: <patches@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] cirrus: cs35l56: Add firmware for Cirrus Amps for Dell and ASUS laptops (20260818)
Date: Tue, 18 Aug 2026 16:19:42 +0100
Message-ID: <003801dd2f24$fef5e980$fce1bc80$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0039_01DD2F2D.60BAEDC0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad0vJMjT3UEWgDwSRRO77lncbli8GA==
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|BY3PR19MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cbf4dd-0e95-42f4-78ad-08defd3c224e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|23010399003|10067099003|56012099006|8096899003|11063799006|18002099003|16102099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	mrqQNRyexg4xNW0iKVhXHrEd93o5b99H6q3WcFB2x0DdgMUu9gsZbhvjmsyoVMi6cBkM5SQgB4DHOdNsO4qzKfvYK6qYBx7GpUjGSdQ5/t8tyFSOYW6Sfv8Ex0ZHqU1cEzUpKT4BlRfJlc9ZTg0Pz1BF6xl1KVLHOxPXkIPaNFy+v+lLqCO+3onJHkZ+w2pmrzkifYAz3ymyDQo4E+ncVjjAAuumIQcYk9B5G4aVlpsTYA9jqf/cur2VnuVP/eBJUDAHBXHs7k9/kM0JyZw/1ZqsMWNm84eVuLRFQzR91oEi3hbVPnU+CmaUOVgeXxrKVbDWVJsgaQeNFFJHMSNN80L/ISo/cKphwh/CjJnqFzhefcEs+nC9Iva73PXl1w1RyxrOXTuCPeNNh3In7NfS1uMBtqq2LKi1PRo/N1+iAvOtjRD2Y9O3NaupEQgjBCkND6gDLuanELy9/E/m93rofW6Di1fviDZA1FIKQqosFdi+VHMcH7HJPuXFEAmt33iD38lEb8aB/O0Soka1T5flImOq5GISz16X4WzXKZEYKcYzcODKywnaFVMXqM/n7m3cwQ+67jC+rqrYjlX3KSA9JKeoplZBJCODG30g4wHcRLdBtghlWB+Ju2IsUKlUM/R1Wa1zCDYCislWvblF2MNXCMR9E7glX2YctGi0JMOfwldOUlNUtmrMEOaTc+RF0TSKGQDWM/X3MtyAKfK2rnrY2A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(23010399003)(10067099003)(56012099006)(8096899003)(11063799006)(18002099003)(16102099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n9EDeDukhmgCorlNjoozqIO3XUW8imSLQhsBEQubUiA2fQqfx3uyNUCTpiRBEQxVdlWbhMiJgOScQ7SN6xzjc3mQTZ6vFMNbh+0ZkpCOzTGCiYokbtRsSeN10L39412ijaYG8coNf1tG48MeMvd3FSTVnaRrei4QD0NDzZ++ZPXmDygUtzmCaLmkpZKuH9Ju32q2xTDTn7b04YXZWZWahmZe/DdriFltVgZ/sGH3S0bfPa6EkKV+WeItNlIIFGmh9bwulZb2q1ijQ0D+WfPIuZkuXBh07xx4I7HnaoEJxiXzY7zFjUPNhNA+lDaE0pT/fCxGQPhX9wyOrPEbykWSZ4hWuH6e6Apuau/FCcoCO1L69b5NgNyYDok94S2Y3js2sTV6mTd/WRmrEAMLBWQ8NwRpwbr1ZD8HH5OLuT8beOO77JhedS9AK5cOTQrOrIaU
X-Exchange-RoutingPolicyChecked:
	HqSmFfi+6UZqqpvrldUGqV+k+I6t0yNenO5x4sG1dMRFPwUjnY5CRkq+1LySaj/ntLKy6UnHfO0+8e0fKosne6PisL6rtt25LcgOV4ZhEpm3eeQaA5SlmFncZt0hlxRBe2Ocf3LsyBe+5VQeBGfSi/Hb/DJXmxifdTT1aTGhxQcRZ31FLbFMtk2xlnEKqLpqZffFYFL5e3lC6We5hxu5bBy0Sb8O6U9WUYPzYHLT6ZCXQzuZEih3lYnzbm6UEfSls6MQTwUKMqyk8Oevbk3l9l08xHRDOZSmQNYfW4JQgVuNjaP1cEJYdDBdH/xGFPZxE9TwpnsCR21fLBj8m3BQ+A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 15:19:44.5881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cbf4dd-0e95-42f4-78ad-08defd3c224e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5171
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExMiBTYWx0ZWRfXx65wwdEXYR7I
 IxiCiAI8lu4ZyM9cGYLPJTmrpc2CMCzwdIBHv4Cxg3kUKQpfS5e5QrNfQJghQEqkYH80qtNNT+O
 kV2+PCHsc3HXMbMg0rS2CiYnPvwrlRp3ZDM+unqEfW77v/nr0rcdRLCuyfYNF+N9xqJyA9Kwi3F
 q6RlMD4FK+8ZQ+ZAT252DkaoqaksNRhQD0daAKxmx7bCjr0k6UPkdo09Qf6b1dH0q3KhIeeSayY
 9qWOmN0cs2N4XoUAK1XEMy9JHetPum2S/vf7Ju1bi+lg50hIgCyKZh4OxsE60d2XhAtmc8ZdJND
 Yvk2HfAjClNdL3GT/pQErDaQDo9255lDeEUz48n9krxa8KfuaLd0XezuVi0tUW5wKPfxSWQDcNG
 JSAoO59oWKkDkCngKqeIUn+FHh1+G9VdvWmMhfgbjhOaU9iVLTv7Ltf1FLkx4Gd3qiunQEcV0rn
 ecixK4F/7BCh32C0ZZA==
X-Proofpoint-GUID: ud2ISWomhAf5w97K80YnP87b9_xC22bE
X-Proofpoint-ORIG-GUID: ud2ISWomhAf5w97K80YnP87b9_xC22bE
X-Authority-Analysis: v=2.4 cv=FLMrAeos c=1 sm=1 tr=0 ts=6a847816 cx=c_pps
 a=LryC7IEqKcSdoWktnkYnkA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=DAwyPP_o2Byb1YXLmDAA:9 a=NEAV23lmAAAA:8 a=y2FnwyO_n39547tW2jQA:9
 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8 a=SSmOFEACAAAA:8 a=I_ErlNQj_Aum7bqjT-EA:9
 a=HuzvIwxi2Z0ipWpn:21 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10
 a=frz4AuCg-hUA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExMiBTYWx0ZWRfX2AD4HLn+Ztq9
 E/gBWtHzcktdJl7xZKjw/CbxPRzydRlUi2azjhlxJpHRhthq+5QsFBm1K6nihgeQO4sN9zRVrC8
 3OOrLLo3DGGhwH037Ck82HbmHS/JP8o=
X-Proofpoint-Spam-Reason: safe

This is a multipart message in MIME format.

------=_NextPart_000_0039_01DD2F2D.60BAEDC0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

A small series today - adding support for the Cirrus smart amplifiers for a
Dell laptop (a set of WHENCE links) and firmware for an ASUS laptop.

Thanks,

-Simon

 

The following changes since commit eeed587f5b5032c39b3fb01cf8feffff46f9967c:

 

  Merge branch 'WHENCE-qcom-cleanup' into 'main' (2026-08-18 11:59:34 +0000)

 

are available in the Git repository at:

 

  https://github.com/CirrusLogic/linux-firmware 20260818-cs35l56

 

for you to fetch changes up to f03e076ce0b444d87c4fc23154cd6ba37f4856e5:

 

  cirrus: cs35l56: Add firmware for Cirrus Amps for an ASUS laptop
(2026-08-18 15:11:47 +0000)

 

----------------------------------------------------------------

Simon Trimmer (2):

      cirrus: cs35l56: Add Cirrus CS35L56 firmware mappings for some Dell
laptops

      cirrus: cs35l56: Add firmware for Cirrus Amps for an ASUS laptop

 

WHENCE                                        |  12 ++++++++++++

cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u0.bin | Bin 0 -> 11764 bytes

cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u1.bin | Bin 0 -> 11764 bytes

3 files changed, 12 insertions(+)

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u0.bin

create mode 100644 cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u1.bin


------=_NextPart_000_0039_01DD2F2D.60BAEDC0
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
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>A small =
series today - adding support for the </span><span =
style=3D'font-size:11.0pt'>Cirrus smart amplifiers </span><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>for a Dell laptop (a set of =
WHENCE links) and firmware for an ASUS laptop.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>Thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>-Simon<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>The =
following changes since commit =
eeed587f5b5032c39b3fb01cf8feffff46f9967c:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
Merge branch 'WHENCE-qcom-cleanup' into 'main' (2026-08-18 11:59:34 =
+0000)<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>are =
available in the Git repository at:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
<a =
href=3D"https://github.com/CirrusLogic/linux-firmware">https://github.com=
/CirrusLogic/linux-firmware</a> 20260818-cs35l56<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>for you =
to fetch changes up to =
f03e076ce0b444d87c4fc23154cd6ba37f4856e5:<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'>&nbsp; =
cirrus: cs35l56: Add firmware for Cirrus Amps for an ASUS laptop =
(2026-08-18 15:11:47 +0000)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>----------------------------------------------=
------------------<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'>Simon Trimmer =
(2):<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add Cirrus CS35L56 firmware mappings for some Dell =
laptops<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cirrus: =
cs35l56: Add firmware for Cirrus Amps for an ASUS =
laptop<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 12 ++++++++++++<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u0.bin | Bin 0 -&gt; 11764 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> =
cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u1.bin | Bin 0 -&gt; 11764 =
bytes<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-GB =
style=3D'font-size:11.0pt'> 3 files changed, 12 =
insertions(+)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-GB style=3D'font-size:11.0pt'> create mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u0.bin<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-GB style=3D'font-size:11.0pt'> create =
mode 100644 =
cirrus/cs35l56-b0-dsp1-misc-10431c74-l2u1.bin<o:p></o:p></span></p></div>=
</body></html>
------=_NextPart_000_0039_01DD2F2D.60BAEDC0--
