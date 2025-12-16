Return-Path: <SRS0=AvmD=6W=opensource.cirrus.com=prvs=144514c97e=sbinding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8FCD609D2
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Dec 2025 16:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 910BAC4CEFB; Tue, 16 Dec 2025 16:55:14 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E07DC4CEF1
	for <linux-firmware@kernel.org>; Tue, 16 Dec 2025 16:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E07DC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG18Htj4074181
	for <linux-firmware@kernel.org>; Tue, 16 Dec 2025 10:55:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=TzgckmLHFejvIqt7
	pGqeL89DWEnOjIGgx6wM2shVfaQ=; b=hm/GXIvrJckaei5CP1Q/aBEwSkLV/aSa
	BTrh5jQUyOuM6Bjo0/P9VH6iMi/ZprPjfxr28kgDw4RBBaG4K2BDYfuUJq6jePQy
	d2rp1Q0fJCLc6Dqr7vecDt1ii3zt9tXcgPDnHI63VGeDqajL4/YpglAe4KvodcXA
	FTsLcunau0ReZcasx3rZ4zAicXJT/jpTIkAIWz5qusG1l7oxLUBowR4F+HZwTjWQ
	UZ1Z7kc0iIsl9kgCBk/FlfyqPt7zlxfCRY0rtW4XwM/sXZg2kTiH+yY7c6Mb+8Gs
	iH5FZcVcEMX5OPdLudnzZaG13Tlb1P4vaQkQEvgvRmcLpVAiA8rc9Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021093.outbound.protection.outlook.com [52.101.62.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejbq7s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 16 Dec 2025 10:55:12 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnWwrGjqGLDUXOa+MO7ZzS4EAjcaIUFMstttV1M9CEBY6XqibjSoearsST2yz0ySi7hT0qGIeyFMiQVTHQwT0b1P3HFn9gxNSC/QitNzUcOPdeKLfGPy5O4XiMHkW/oWPwzz/X0IqcJDusw9Yb1pTwvaKvRK0kyRtoVFmhZbHGBgz6yHLo9rsfnC00A4FObHlmHoBXaGesyo/VBJ9Ws8NqNfq0L5GmHwTLPh0alVueLcMYc8+JdGyiqLJ6AtynD9WY4In7k+2g6PUHOTHC8E6d3fysRc5DCOnejnZCk74xErjKMaH+o4cEmU97EqDeNEkLWzWn2Pe2DRZLoN5qoHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzgckmLHFejvIqt7pGqeL89DWEnOjIGgx6wM2shVfaQ=;
 b=P+4AQrirKavpF9HEuoM+Iu9ZTezG4/h1Ip8vZwVTO0zQy0Lob3FIaw+h6T8ITWF0pVU7wvN+0UttldT0Z/CQXS6q9GXZK6va1HEISUZwpQ7G8eWdCGjchBjb8IjvLnQLpjFdxN5/sh7arSvUT6vSDKkDnulSjSvzKp6hHP/VviGVmUZbkl8W9acPuPaUjulgG7JW+FLO1V/sa8MChfir014kpi55AcPd1XwUtOpWqxlVyoGnI9JcjZHk2WRHjbP5tLhF/dLVk5km6oy7wrzuVTDIPnnfS4/+XNGKGiDiKFqEmZt3NT5ooJ6nk38RGpjgstYLBUpd8RNopW25QqzfKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzgckmLHFejvIqt7pGqeL89DWEnOjIGgx6wM2shVfaQ=;
 b=mDhIuUgQFnlYO78ILDy+AV2OkUN5hOg9TC7D9PPMl2oB32vMzndBqrs9pITTNogwJCjeu1ynQkeZ3Ppkbj0QjvgPPlJkyXEQaX1BrSphzGsWtHaYnbDFF/GrAX4v7eGjMoV3p7Z5HJhyTVzHCZ/wwyFxdJ4n8nNYTft+Vt8E8PU=
Received: from CH2PR03CA0017.namprd03.prod.outlook.com (2603:10b6:610:59::27)
 by DS7PR19MB6424.namprd19.prod.outlook.com (2603:10b6:8:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 16:55:00 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::b5) by CH2PR03CA0017.outlook.office365.com
 (2603:10b6:610:59::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 16:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 16:54:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CF376406540;
	Tue, 16 Dec 2025 16:54:58 +0000 (UTC)
Received: from [198.90.188.46] (unknown [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AA127820247;
	Tue, 16 Dec 2025 16:54:58 +0000 (UTC)
Message-ID: <58130bd8-25f7-44fd-930c-d9391ec06878@opensource.cirrus.com>
Date: Tue, 16 Dec 2025 16:54:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
From: Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PULL v1 linux-firmware] Add firmware for HP laptops using CS35L41
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|DS7PR19MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e9b8d8-dd1a-4731-e5ac-08de3cc3d9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027|13003099007|4076005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y01ocDhFcnJyS1NuaHpTWTFta2x3MmxyQVlVMHhKM01Xd1IrSDJvUVVNU2lB?=
 =?utf-8?B?S0NpUHZzcVJzKzZ5cTZlV2hZc21sTmtuai9LQ3RocmhBNVlZWE5MSEFCWVkw?=
 =?utf-8?B?VndIQlRHdE1pME9OSEE2dzdyV2Zaa1NDRTd6c2lsblBTNU5YZFFVYmRHUkFr?=
 =?utf-8?B?ZUsydzJOYm5lcytTeWtidWQ3a1BtQThCd09BeitReDhiS3o3ZW1tcTc2ODNW?=
 =?utf-8?B?LzVHWUV0MWphWWxRVkdyZU5sOTVydDFJOUJ3RnRLNlBjL05hVnltbnJiSkhl?=
 =?utf-8?B?cmZGcVhHc1lpbFpkS1BZbEFpTjBLR1N0b0J6V3J0RnExZFovZTIrbzl3SitQ?=
 =?utf-8?B?SFlhdXBZU1BGejhFUTVoN2VQcmdCeS9jOEFqd0kwMnd2LzhjMzJTUkZWdW9v?=
 =?utf-8?B?SzBCeHcxeWtzV1dDRnIwZ1ZVV3dxY054dlFrV3RLcXF4TWlOSzJZRTFmamxm?=
 =?utf-8?B?WndHMTJSTFZxRm5ybmdUNU1WMVZaMDdsY0Z6QW1jMFF2R05rVVBGQlZXRUtP?=
 =?utf-8?B?N1JYa2xLZFMxbDdWM1J1eEwzdHUyTDd1ZGxqT1FJUGhlMENhYlZGL1ZnOGJK?=
 =?utf-8?B?K2xKWjZLWGQ4dXpiUlJpYkY2QTcvWTlXTldJYXM4OE1UYlRmV1VBcnREeVhl?=
 =?utf-8?B?bEhSZEI3cnFJNFBEZHgwVzFCUUo0YlhvR1hPR3Jtc2thLzJvVURTakpwYW14?=
 =?utf-8?B?dnEzN21BK3NhVzNaSFp6MFgwWkZMK0Jsdi9sVlIxMS9JREpSTjhqUkJpaGlX?=
 =?utf-8?B?NllCUlJaaVBad2x6Z3VJN3M5aE91WkdoSzY3OVB3OWlGWWVwS3FVZ0ZPcDM4?=
 =?utf-8?B?NXJ2Wityc05QbWZSS2c1Z3Vjb1RneVJLY1M3Lzdha29iaHpUVWx3OGt4N2Q0?=
 =?utf-8?B?eTRBNXVGd0J0dElGRXdVZWtCM204SjJSazVnY2o2Nlk3UVM3UzFtYzlHbjEy?=
 =?utf-8?B?ZGcwUGs5MmJINnRrVzV3QVlTdDMrb25GM1BVZjRZQW5TczBSV0NUQ2ZvaGVC?=
 =?utf-8?B?OEpHT0lhM1NGUW9ETmswcFJtS2U3NWF0OG52MW81VDBMazF3akM0Ymw1Nm5o?=
 =?utf-8?B?YjRDT0FlbWtSS094cXZzM05RRXZxb2tRVEttdTBncWtLZTBJbWdRRzJCK29T?=
 =?utf-8?B?RFMwVWtZTTk0UCtNL1hPK3ppdWZ6NTRVY2lML0pqaytGeGsrRWw1Wnc4K3dp?=
 =?utf-8?B?a1VsRkxpSVBDK1kyZFUvT0xDZ0VrdXhENTIydXZycnhLQVN2am5LQjdsUEMw?=
 =?utf-8?B?RDM4cXJJaEpHRXBjcUFXOHVTLzV0MjNKV1IrK3VZVVRMRHRhVTJEM1pyWDJD?=
 =?utf-8?B?NnJhY01UZVFMaWVrYWZHODU0ZjUrK3FWNFNSMWFITnhuanNtYmJaQm1PR2Jr?=
 =?utf-8?B?VXM1NDUxK2hNUFBXMW5vM09mcmRpaklnZWpSc05FWlFnT1FxTUhBVW1ycUM2?=
 =?utf-8?B?MEloQVhNMTArejFRZkFxVEtYMkx2TmdkNXdnZjRoNzBBUXljdlhHQ05ROE1p?=
 =?utf-8?B?VFdLbk1WWnhXcGNIRUtVSU5lbFpmRkttSStCaXNTWGg0d2xiajJzS2c5em5Y?=
 =?utf-8?B?K0ZGbDVIcWltYkpPQVk1bHFwd05iSXU1WGZ5SStXbFNVZDBHUk1SQVN5Nldo?=
 =?utf-8?B?RzFWNTloVCtUcXZZSjdkTGZNVHUxUzdFcFc1WGdmRzQ4dkx1aUJBdGRaZ0V4?=
 =?utf-8?B?WnRROVNqT1ZqRmVOV0pndnMzM1IxNzJkSGxaTjUvQTFXV3dST3g1S1R6MGxQ?=
 =?utf-8?B?MjBiSEd5eHZub2hiY2M0czY5M2FEL3c4UjJtdjlDbGZxODRzOTlyV1VuaHVj?=
 =?utf-8?B?R1U0NkxpZ2g4a2xYcFpHNVZDSm8zS3BObU83N0w2QzYyL0owczhDc2luOGtL?=
 =?utf-8?B?dFVlQTVSSDl0UFMxVTNTMHlWTWtwaFRUMEwzeERuZ29zTEQvQ05uemRTeEVV?=
 =?utf-8?B?TFpQSW9TTStMalJHVVc4ZnFaa1VWM2tiNVdhcTdXTmQva0l1S2JpTGlOMHFN?=
 =?utf-8?B?TmZSZjVhd21HTjF1T1B1M0RWb3Qvc2xWTDhNdHd6R0dSNW1lbEkrUlE5SkN6?=
 =?utf-8?B?VGFrT1d3ZmUrMjFUNGpKUWRaQ2FVV3Z0dTNxdU9CWG5NR0hEcis1a1l6RDVP?=
 =?utf-8?Q?eicRKpKWOaxenhmO8RQeUSn9u?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027)(13003099007)(4076005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 16:54:59.8449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e9b8d8-dd1a-4731-e5ac-08de3cc3d9a3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6424
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69418ef0 cx=c_pps
 a=y4zkFa5omBjxxVHSBTJAWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=C0xalKkFgr1QH9JCWd0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NSBTYWx0ZWRfXzqLxW8WtRdv4
 DXUrnQFRzAjAJfNkn7pEiIdNfc6+vJOKAObEP1Td5GD5/DFhzfHL74TPO2qdP3r48G8b/MfRBgU
 s16OkPr7dm3Hk/MUU5dbkgkdNqWMmOPSrQ4TVWi5T5fBxqCWfmVETKbeTbeVbYqHNoEJAEdfyqK
 P/IKMD2fK6iSpC2Uvt4tZLxsGiapqckWs3YmMFCHJLfKMMnqTYcYvRIPF9dZfqXza4jLC6wpPR9
 ubGAnkEWmSx+n6T4RTmorkVHcJajCi1zTakWD1vWcvuLwPwXgP+8Xsyo+BhQ6AN2Wwh1ZQGifUA
 1nDDzBbzj+ny02GVhlM8UeTc4fWekY51HFV9+ZvETX615sU1QU2n1FbMVGqbtbphhcHKq0vJmoG
 fK5DhABpGpowucPtZQzWFunYgUZCmw==
X-Proofpoint-ORIG-GUID: XfPVbS6Es1hYnSF_MdD0JUE0Au-xP9x-
X-Proofpoint-GUID: XfPVbS6Es1hYnSF_MdD0JUE0Au-xP9x-
X-Proofpoint-Spam-Reason: safe

We would like to add and update firmware files for Cirrus Logic Smart Amp CS35L41 for HP Clipper and Trekker laptops.

Thanks,

Stefan Binding

The following changes since commit 03912c51ac907052f5d8f4bf6ccd987410479e80:

  Merge branch 'qcom-gpu-fw' into 'main' (2025-12-16 12:14:32 +0000)

are available in the Git repository at:

  https://github.com/CirrusLogic/linux-firmware/ cs35l41-20251216

for you to fetch changes up to fe9e5c89d5e8931e5c660713029f8ee85a6404f8:

  cirrus: cs35l41: Update firmware and tuning for various HP laptops (2025-12-16 16:51:36 +0000)

----------------------------------------------------------------
Stefan Binding (2):
      cirrus: cs35l41: Add support for new HP Clipper laptop
      cirrus: cs35l41: Update firmware and tuning for various HP laptops

 WHENCE                                           |   6 ++++++
 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid0.bin | Bin 4804 -> 4852 bytes
 cirrus/cs35l41-dsp1-spk-prot-103c8e11-spkid1.bin | Bin 4796 -> 4852 bytes
 3 files changed, 6 insertions(+)

