Return-Path: <SRS0=Uv2v=2L=qti.qualcomm.com=vkasinat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13DAC87FC9
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Jul 2025 05:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B39F5C4CEEB; Wed, 30 Jul 2025 05:40:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71228C4CEE7
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 05:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71228C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5O9Ug016623
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 05:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=ynvrdrBi7y6h3ZLl5ZsjeKcTZWv/9x1DK1XGLQ1VYao=; b=eN
	Q12S/URaTsqtdyXL2efWjLDqwNK3b6VWSjOKyt4wloQyZTkeT8oTDIdIJ7mwSYcx
	gF7REaw6B5d3w0VHzTB5tjC+Dc0/mLsdaXGss5g3TmcdOfe1++8BOkQiSFsR6OFv
	2wDwNgE8gMWstbcEMzjI9Cs9AWbtKrH/rPVjHbynbHcATvZdYAV2wWOuQBakYEQ8
	V7eHygMGm9Cz2m4W0XtK5wB9o3U+XrqB2cPUv+5v5vvi7rVh8P3Z8O7d/0YXVFKf
	yYcJiwzUlpdNJG5+YZwDpWHBZOXhi2bpdeGqcGddXAWdL18bsk3Acu2wDX0t4ul4
	bmlfAl1dIE7y3509JI4A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013079.outbound.protection.outlook.com [40.93.6.79])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1ajg6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 05:40:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmvR6PC2rRoo39LyorvDhqEoGO0lsKSpum3p5dI7L8wlVe1LqXTjo1LRRv72+zkIigq6bRurH4tT4mTFgxBRYAXjfxwiWrjoKi3T7QFlepXBWc4rOmej33FwPHOFm5TB7g7GNj6QzcNeSbzaZfUR6qhJl7OUqlgrVKUAwNxz3BWaSt+lmGbZRKB7ARMcdH+b1gQ3nvlWoSNTWGKrET8IJrYsitxvO+wOWe0JYrCWjnUEkb3HMU+uV68PTvbrclQUDGrE7zrYRcwYGkwlKtk01+pzuAlT9CkCvkNb6lVKVX96Aot7iv1WB5IQyIx07bUmrKzxIw+I4/s2VG+6VCdCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynvrdrBi7y6h3ZLl5ZsjeKcTZWv/9x1DK1XGLQ1VYao=;
 b=QWexmcL1ZzUP2B2tjce+wrcUHxWiU9gsmi/TehcNOlGLDCQs7b7OXS9Rf1fIDvVarapaAtaXZq+uM8jvPxIpzdPRUi3zwCuSHTBujBjmdVy66upT4FwwZUDLLMi/eUcLM6z8lxgdd4iIureWvTqFoXBde6lOLklWdzbDp5Na+Dcv+4ezALlvVdDsynPl6/Y8m+4iR4lNfdwPMGoqgcf3ByN22bWgW3swOY18JtjDV/mIYavEAyVAdLa5I5IMPhyo6ScAb4aaveDeV/yS3JqA9bfac1ONoBd+WktB0gbAuVIlYqCMqFxSH2YBZO5iLYM3G9Cy1bzkl3M4J7VKGOoCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from IA0PR02MB9917.namprd02.prod.outlook.com (2603:10b6:208:48e::9)
 by IA1PR02MB8972.namprd02.prod.outlook.com (2603:10b6:208:3ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 05:40:19 +0000
Received: from IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444]) by IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444%5]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 05:40:19 +0000
From: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: DSP FW Release for DSP.AT.1.0.1-00125.5-LEMANS-1 
Thread-Topic: DSP FW Release for DSP.AT.1.0.1-00125.5-LEMANS-1 
Thread-Index: Adv6GIUEYBBM71OaQieDuld08XW98A==
Date: Wed, 30 Jul 2025 05:40:19 +0000
Message-ID:
 <IA0PR02MB9917271A219D863E771166B4EF24A@IA0PR02MB9917.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR02MB9917:EE_|IA1PR02MB8972:EE_
x-ms-office365-filtering-correlation-id: b7f2af8c-fab8-4b0a-852a-08ddcf2b91e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|8096899003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?73TybD8V7NDhtnNAuxztst6KRsyGMyr+HylehKzNBDytFsbYsaPXdzVha3FJ?=
 =?us-ascii?Q?LkC6dsJt8a8xN+t+2+fq42i36IdE8yX40QQ+LkydSto+80q3fKxAbQoJlPHG?=
 =?us-ascii?Q?5jDKoFdPYIPCqAFqbal4WazJn43YHFuKjreXQ9QvexGtMi5ESPHEdnXAUS4g?=
 =?us-ascii?Q?CbxXUJq0phW2Th9lkxcMnwzw02m6MAe9zD7wfmx09xWGQZ133uPik+E24lBi?=
 =?us-ascii?Q?fQmtezwJDSa6BoYsgVfpSyGDEaT/uqtRII00HuBg4uV4+8ArFtTP+8TEs4Mf?=
 =?us-ascii?Q?6gBa+OExCs1zhWgtH/gA/JWX/sdJIoFTj6yUrWNYFoWdfWMSNl/S7f0vfv28?=
 =?us-ascii?Q?jPTmXlcCY8w03mSRZ7wGxHp8r5ilOst5U8yISllbCjjMVYqYVrQfjUiI6mnB?=
 =?us-ascii?Q?TFnbsi16hj6xj4naZ59G7IDMzZuSmfFTZ3yw+PVbitXln4ORDr3K3Yc05Ppd?=
 =?us-ascii?Q?jTlxkie+YiSJwkWY2AjdoTT5hr3yrdu8lFSfgU5qXAV4rYHd/zSVdaTAQ0rv?=
 =?us-ascii?Q?kjypeUnkt5vgi8wW1Fpvs+Uho2C2+W2UK0pNJoqqKmILixHG+l0X5m25ddMQ?=
 =?us-ascii?Q?iz6vLnwmW3C+wsqXHRwBxxNDR4nmPgcKm6lDOFdZh+268RShnBw0f8+qqGDR?=
 =?us-ascii?Q?1gmFRncGkP9ZS12BBxqmGW7C7+6bGrbqDdj1+NMLh9a9drPx+aH6v39Jfa0M?=
 =?us-ascii?Q?8UfGM6mTrP5k2jfL3QOlc/NcdwwkLmH+BvP4DCpcuhlj7MGyJ1AF0aqMEyti?=
 =?us-ascii?Q?/HPvLl2n7PBdn1SIhM8kKsEZWhFSLon9Q+c0XM6cmvhgEAfjEpabu987Sr5G?=
 =?us-ascii?Q?tO8G9FS4oohsXpREAM/JbrTEp3ovAJ9ZYJzY5shbiNLiOtugtC5bPWsqeKMF?=
 =?us-ascii?Q?JT3chWA/ucGHl/5HG4I9a824FqyGwbHeMkel3mXqmWC2b9Xe6mBIa06kftoZ?=
 =?us-ascii?Q?OvRVLLKPaYEdNWaj1rXyvYMpsndGmnJyQWd5IfB3z2fsVaXBLEDn0sq0vOIX?=
 =?us-ascii?Q?XsYqSLVQwSm6Wz0wDsLLgzmaFHIr26k5BF9TjTCQhPD/K650yKO0MVHng10B?=
 =?us-ascii?Q?Jea74WUuYuoAW1e/JnoP8W+15LruWTm4MhdnNixbpEafdipeiJTu89kXgoDO?=
 =?us-ascii?Q?NRYXhKKb1i3tE1saNK1BvdyqDDdO9EKgbzUXDsj0vYsszH/kfRNJsafrPuX8?=
 =?us-ascii?Q?2upybB3wVO5U4wBzGJ5BPgWMJ1Uivro0YAm3P1b4ujP+1eHOwmvDybq5s9ZF?=
 =?us-ascii?Q?wEWhif3nVonEF9mIRxjFOimZdf7t7yfEOd0LJqMSQRSoAiwAuCEwvFlDmij/?=
 =?us-ascii?Q?LGhv87SK8HFaA+bmrDg+V6a6sFBHjhy3iVmTO7UxCb8qEVNvr2yUqD7/aToR?=
 =?us-ascii?Q?tQVRA8WrNFdBHxlBKRH/JO1w+JVs37l0wu4TWWjBxXaMj3+gOH0wAKL9asiY?=
 =?us-ascii?Q?rjt4djZeXmc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR02MB9917.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zPgmgvdN6bK6fJK5CbcmGpqBr/sisTO6NaRUR12j6Ndc2dabHd+OS4NpiDZn?=
 =?us-ascii?Q?K55ZFbLmMAwTAVSN4v5W/d2G7uW3DpNpIw7ocMaEThVRtCXy69LnN83zmGTx?=
 =?us-ascii?Q?mqw6PhCAQ2THq61UYk8KaTP7i5wbQiG2BqUDYrw8iK4QR3D4CGLPUv4aGiw4?=
 =?us-ascii?Q?Mhxoz6LLwpG2hm3c3bnup5Z2rSxk5HaPfRa9pB7Ucnwn2WDWrmuoVRc/y36j?=
 =?us-ascii?Q?jJD9vDfwF51bCi14mjyxggE+f4osWVxv0kNlqriYfXr/tqXZgbARcnZSzirh?=
 =?us-ascii?Q?I2xPfeTaP4nbfwc80RvKwEMdVZyLDpHitd0QZBsdDXURf7fZq1QKSNYZSMwM?=
 =?us-ascii?Q?UixeQdFAisoqQfs4TWSUuQMV4h71mia+kvZ8HqdhkBdcsIOzJvorQ5IyiVgr?=
 =?us-ascii?Q?yeC07TW3YdbSLpLh4hxN0nFNdeXynf52a+jcH3NFUtKeIWr1vFsVaTiPvJb/?=
 =?us-ascii?Q?ptZKyKNIUZgxUyMBWOlv9Z6T/8FNi8Ro+J0cHTUBXY5ERXrCmVsycHDA9R0m?=
 =?us-ascii?Q?Dh8YqAavrmnHV74Equbqej24w+FqZ5YqdJs3AXNABcZHTF4WDL6QVA4d1bbZ?=
 =?us-ascii?Q?h1tP5lrC34V9+rdVWLTwQRsjDkgow4Pytqwa2sTpsRTza+XkBLODtJQ/Yspc?=
 =?us-ascii?Q?KxGB6sy45hbipZL4U1iYuko3X9Re8XXqDHefik2OoeWVNxZHiMxve2NTK7iG?=
 =?us-ascii?Q?JpceucXaVBm0tz1tTDSeq/lhsD1SvnS5dkDNrZkMvnEUR94askTF/kaqZcqz?=
 =?us-ascii?Q?TR9Mk+kJVYYDnApZEx7G3BDR3pMkYeb9Tyb+IsQXQbYBxUvp05jJVGiK/bDG?=
 =?us-ascii?Q?Kokk0E/KXAxFgD5DOHvdajs8PVd4XNYZsA61/qZglxEnarw+TdcBuEVxtP8W?=
 =?us-ascii?Q?k62KIEA3I70YAOTtQfGqgqQBiY9+67uB0iUUNch0BcI8itlDQD3vr/3ig/mG?=
 =?us-ascii?Q?BJEeZlrzB7sGs1HY6u9Pj9OagKgAasA9G3XuivDkfrHRJ5G4FV1k/DZMpBU1?=
 =?us-ascii?Q?rf9zVK5u4NB88FC4+rgmka+e8b/8VSltjM0BwFUyV9vy4iPaYFbvWKZykL45?=
 =?us-ascii?Q?d1lDcr5YDL+THnYDJyMsdJOgDH1iN003wS6wYoVJf6YkkGA7ZOHDRc4/Bhyj?=
 =?us-ascii?Q?PNj8jj6bH4fjbtFG4LJU/6pM7AaX9dKGXLAxKjZOWkBrxOx1xqkz9rxMDt/X?=
 =?us-ascii?Q?ut9bpq52CIDd8x7OIIk0vx96jHTZ2pPo4ZcFs0Opj1gmP7BHIWCBJwfWy8m4?=
 =?us-ascii?Q?EHrZwyMMVVEEqOswH9zQFOTmMZRQ2odxs72pjn0/3okFkxdzZFdvfIh9i7UA?=
 =?us-ascii?Q?rRNRVVXhVjaRLhfqAo0rYPykRtFUqj+XdWWAlE36ftPCsNzNoeeZKACMdAW9?=
 =?us-ascii?Q?9Dw+HoGRU45J8B25xwuwhfMBsATCVVpY6y19s5I6cweX6tF9ZEgzLx2cgwTy?=
 =?us-ascii?Q?6s9bmkXce7uRAZsJTRW121ppyyyzbD9Nw1Ti5oo9N4corrG/lU/X3jFt6VE2?=
 =?us-ascii?Q?GEvDvKpI+I270kE9I9sbZC3OgBbpFC6ZgFt4/a/YybbN7Aao/Y0ygrl8J3MG?=
 =?us-ascii?Q?kyYsRgqpWcbIT3WZ3P7M5uKM3JhiZORtJimF8rdn?=
Content-Type: multipart/alternative;
	boundary="_000_IA0PR02MB9917271A219D863E771166B4EF24AIA0PR02MB9917namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oR3eRAH3pYWPJSrppEp3p2vNqGjF3NnKvAXJfVA6jE8hl3db03FoNbk7n55FlmjKXREM1t5AO1lc5LRxP1yXV/WAiO00IuDuf3UN5aN8Ft7CYPPdR/+VJTeyk9BCn5tIL53CdIBk3FveRZUubQaZQdJyQWC+6tnGnmXC/SsvYmyn9AeE/tnObGuLegw1Ld7+9/jj9Sx+TPSbVzIpzXPwCfvMTHOgdnntlQdib2tDn3Ky/NC2cMuvsBxgeziaLa/3CV3WI/yXnfFY2BbqOIuNKsEvXZu8DryYVB7zh/jlQC808koZyQmkcI87OgiL/g6u3czfU8gOvBcPTMF3R7zioulQwnZMDFV0+vQzl+BL0WgMfDt3zMbON+X1Ga10dvKBdFe/keBzjTHeMsmeSjQ95zk4r6ZMGGlZMDpoUjz6jfCpKkdSo+SZWufAv+gzVxBZ/DfubQSlzw1pke0zYiCN/hpbPwANt9AQDswPfGs45k/IfFTVCwUeq29dVZf1iGXjs5y3laqTnQ3brybnJckMQ3DEgulib7/PGHCDb1+leNByBHG6+tsxk8WKM5kbn5cE8cGf63ESwq1wQ0k+mUW6iYo3feagZeLR8oZyB/EcwsEz6V0uiSENWWldkeTQqtfk
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR02MB9917.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f2af8c-fab8-4b0a-852a-08ddcf2b91e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 05:40:19.3894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wMrE1YCXEkI4k4he9BCpHaCgJSHoXNugrVmXv070PA0d8TWZyF8udpZbnhSmRYs+u1pOj785iyhtJYW7NL6LRrzeh1Dg5KT1s+Kkkii2dwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB8972
X-Proofpoint-ORIG-GUID: niJH8K8PA8_KDRsRYW7r9wL0xy3fpm1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDAzNyBTYWx0ZWRfX9GQLXh0MLFCa
 6qy9jqX6avpNSQehjS3lysNz9lfsC/MdDbS++UOINwfjWmXh1PUL3kRGANAPlwGD/M/h6caiAoP
 OUqXW8u+LmdhXxjCDoiAceyywYQlhxG5lx8c9U28X0EXpL5hrR7ojRFUi3ytZfufNEP18yRew2L
 0bN/zofPskkovbPU3tFQSDxeoeGwL7YZTxOWzJSDSfxZz/4BUC8Mf/PFOwlYC8aoYQzcwLlUyep
 f112wpNz6XnFu5P6fHPzr85AzU0iCPJVJJv5sJ1BZgbfZmJItPYCOL9LCHngXaH1lQNFmix3UId
 +fUYxzCHvrrQWTsN6S7DYJ3TdrY2+Vrxs82YtxNS3sGIjkYmGIVBgrkb8KQsZeXySSltL4JF1Dp
 hFEvxdM155wYyTUdNkkQN/ekfkuA5FB2ymb56qCZjufMAdfZoeXQSWJK/q6ycXik+//Y0zQd
X-Proofpoint-GUID: niJH8K8PA8_KDRsRYW7r9wL0xy3fpm1Y
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6889b046 cx=c_pps
 a=K1+iGLXgNHoxMcL4Lb8acQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=qC_FGOx9AAAA:8 a=d85GLZ2lVxKp6GIVMKUA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=RmiTbC_imQAJpXycXqQA:9 a=NTeOE3g-5WHmVDCQ:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=592 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300037

--_000_IA0PR02MB9917271A219D863E771166B4EF24AIA0PR02MB9917namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 04c379b552c7ff194e0840ede6a2997d7deac691=
:

  Merge branch 'robot/pr-0-1752559067' into 'main' (2025-07-15 21:06:17 +00=
00)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcs=
83005

for you to fetch changes up to e58faa78b6d6d88f0395bef769628d04e937dc55:

  Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1 (2025-07-16=
 14:00:17 +0530)

----------------------------------------------------------------
Ekansh Gupta (2):
      DSP.AT.1.0.1-00125.5-LEMANS-1 DSP Firmware Release
      Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1

 WHENCE                   |   8 +++++---
 qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
 qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 2629632 bytes
 qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
 qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
 qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
 6 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100644 qcom/qcs8300/gpdspr.jsn
 create mode 100644 qcom/qcs8300/gpdspua.jsn


--_000_IA0PR02MB9917271A219D863E771166B4EF24AIA0PR02MB9917namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">The following chang=
es since commit 04c379b552c7ff194e0840ede6a2997d7deac691:<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; Merge branch=
 'robot/pr-0-1752559067' into 'main' (2025-07-15 21:06:17 +0000)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">are available in th=
e Git repository at:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; https://git.=
codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcs83005<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">for you to fetch ch=
anges up to e58faa78b6d6d88f0395bef769628d04e937dc55:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; Adding RAW F=
iles for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1 (2025-07-16 14:00:17 +053=
0)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">-------------------=
---------------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ekansh Gupta (2):<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &nbsp; &nbsp=
; DSP.AT.1.0.1-00125.5-LEMANS-1 DSP Firmware Release<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; &nbsp; &nbsp=
; Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;WHENCE &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 8 +++++--=
-<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;qcom/qcs8300/=
adsp.mbn &nbsp; &nbsp;| Bin 6643712 -&gt; 6684672 bytes<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;qcom/qcs8300/=
cdsp0.mbn &nbsp; | Bin 3084288 -&gt; 2629632 bytes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;qcom/qcs8300/=
gpdsp0.mbn &nbsp;| Bin 5832704 -&gt; 5873664 bytes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;qcom/qcs8300/=
gpdspr.jsn &nbsp;| &nbsp;22 ++++++++++++++++++++++<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;qcom/qcs8300/=
gpdspua.jsn | &nbsp;29 +++++++++++++++++++++++++++++<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;6 files chang=
ed, 56 insertions(+), 3 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;create mode 1=
00644 qcom/qcs8300/gpdspr.jsn<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;create mode 1=
00644 qcom/qcs8300/gpdspua.jsn<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_IA0PR02MB9917271A219D863E771166B4EF24AIA0PR02MB9917namp_--
