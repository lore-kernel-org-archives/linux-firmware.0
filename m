Return-Path: <SRS0=vCEs=2Q=qti.qualcomm.com=vkasinat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50502C87FDA
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Aug 2025 09:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1DB98C4CEF0; Mon,  4 Aug 2025 09:08:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2909CC4CEE7
	for <linux-firmware@kernel.org>; Mon,  4 Aug 2025 09:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2909CC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748de5X029018
	for <linux-firmware@kernel.org>; Mon, 4 Aug 2025 09:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=YCm89gxk9ZHsppqGtRzG2TOp+QAiJ4GOtZ703XsmE/c=; b=K6
	ire3xlEZGLfzXC/S0o76JSRKYgDdh8/ctQcBQATIt4MoJkVf7a+aBXvPqgjgjy1W
	8eNp5LMqe60jfGb4bjRd/0mXOLglRMpVbKsI7YBlDv9hsMqVFVqJEK7WRQlx8PCK
	Od+hKHvVcEPCKH2fo00sPaFf0Zdr1/xJkA2hE5AS7J24YktvJhIxw0OpGOLvYBpd
	PXKr11kJH7hBswI7lIlwTZcnT3HRvApezOeTt+V36nc/bxa107MJElpKEuhZl2NH
	s+z+0DQwkhErlh/ORs7RVGnYgrnO/N/zxABCir1y1/GgQ38kiUMu13Tpro4zPs4f
	FZeXO+1p3dYAmg3R9e5g==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek47vp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 04 Aug 2025 09:08:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4D5lh8+RGAZVwDKhfvERk65NwOmCTItuZuwbWWwcOHEoxwFVq0ADPiNEERl95jS76H92I36r3DXRwKSkvWdUVGEzo3p4sSYp/aEfNk3G3tIiFaWDUjznhucJcO5BUhj9RVcNXJ9Mo87QsiPE85IVXf0dnueTYcJmBs3elJkcez3/KaU817HxXmWu/s7GPn/smheA+CqJe7hNaNn8mOcxJhrnBnTgFrrQFSNPHqwgemVNrhk/TUTDAILal5xfqUYgTO7k/oIPXBWPqjo0JUzNXd3pg73fY14Eym9HXkm5p+FKkGvBZBVZ21Ng9MZ6wj/gO/OtaTr+ff4FZgC6cmKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCm89gxk9ZHsppqGtRzG2TOp+QAiJ4GOtZ703XsmE/c=;
 b=ExVpTmNVhyWFC3a6GJcwG01EbMtQ8W884hGsijkK201Troe7VkHfu3etRg7m4Tp9t+mcIzSILjpiHc6Cn/iRLtht9A8+ylrGrmFvtA5zUntreU/hn2H1bYtSQtFrM0te3aZDt88Ex75BIu4aDPFXuyTxxNgap7gh/i3OxVJHfox5eAsamR7X4+hMkXhkNU9o8wS5Uw8ZmYP8ah7N5Zm2Dbsy0bPNSVGrGcQZ9ca8u8T1gno1Z/lc294qJ3luzZDtPuuEFIERzoxbV7pL+yJP5+bVq1Air3lcmO4jmtrsrnVr+1pzQzQcJ77g/5O8uaIKO2sOiQmX8MBkH7MH4evtSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from IA0PR02MB9917.namprd02.prod.outlook.com (2603:10b6:208:48e::9)
 by PH0PR02MB7461.namprd02.prod.outlook.com (2603:10b6:510:8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 09:08:26 +0000
Received: from IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444]) by IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 09:08:26 +0000
From: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Bharath Kumar <quic_bkumar@quicinc.com>,
        "ekansh.gupta@oss.qualcomm.com"
	<ekansh.gupta@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcm6490 platform
Thread-Topic: qcom: Update DSP firmware for qcm6490 platform
Thread-Index: AQHcBR83z0F9lfWjXk6xCS9GkVO3xA==
Date: Mon, 4 Aug 2025 09:08:26 +0000
Message-ID:
 <IA0PR02MB9917670B5507A3ABE0A216FEEF23A@IA0PR02MB9917.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR02MB9917:EE_|PH0PR02MB7461:EE_
x-ms-office365-filtering-correlation-id: 919504a0-3035-4094-b741-08ddd33678fe
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/nhTx0F/5qDn/XIG+z6mm1SDmscz53Zrh2iYIh66IICEA6LofMwHLRPDr6?=
 =?iso-8859-1?Q?i+a88nCezOWIw7fK2M2KkoUs0a7TsYsvt3W0FgGhwhled/qqIzZjAbiQ4r?=
 =?iso-8859-1?Q?3sXHJGk8TucZ7gIRdqWxycQYBQmYq6MPkU3TlUBRWqMVuW9UDSCCPj5kL1?=
 =?iso-8859-1?Q?FqGDtP2Ixl2i8tArflwjV9Cxd0VbE5/a0Q71giKUMlWjcJrIcr0Yofjz2N?=
 =?iso-8859-1?Q?ttGZ5RsUF0hCuGn0igjJwq/FmLF6F4b4actQCEr2SrHKMZdUZmg6fqI6ls?=
 =?iso-8859-1?Q?zizLUAAcYPsI9bvoqflQ6KlPFmNbw+F8eeRyFFOglcC0woiKWlHNif7G+/?=
 =?iso-8859-1?Q?d0qlyMdvB/UlHdmr9TMHy4dd8pjhZkbxCWSGWEJsjt1n70FWfMlENHw1f+?=
 =?iso-8859-1?Q?hTQlTq81hxrZpDxZVLOVGl7iPCwtcyArFmqaZsnZmBEA+4jrb6JSd8EHsp?=
 =?iso-8859-1?Q?v+Gw1ZEXgOpcOiJH7U/q0jVB/irFihcy8goa+10yQmUR+a0q9xsTmsGWqa?=
 =?iso-8859-1?Q?LmC27yiRqELO7yO2HjQNdIyu5AVRnVg5mbh0Aj9a5aud863J1NnItBy6j4?=
 =?iso-8859-1?Q?wYHjKu0QJox3j3ocQqqkqQXTfIrUt+a8BB3nLCNv1cVKPBnukuLsnKzLAS?=
 =?iso-8859-1?Q?etQFr5MLu1DciwAsA/51q2OqwO/8BbFUtVIA5DBvpwR92ceYISadC8nuMQ?=
 =?iso-8859-1?Q?zyHXBi3ILc/tsqgAPPGnVSBNpaf9+WEFLjn3798pCqYz+3k1XRP9+6eWS3?=
 =?iso-8859-1?Q?gN8QHvRlO/FlJVtiPgdDP2cQrvtvbFcd4TXIH8UpcJjrU8H7kvpgLQEJ47?=
 =?iso-8859-1?Q?xXxnyfYj6tNBNXocxbP2+Kxo+buMrAiwawhzRZVlp+G6p3bNEZFcYVwzE/?=
 =?iso-8859-1?Q?a0BMTAcl9pWCaPcy+I4hlbqlaMoMcA40brXV1f5/n8nUBpqn7r3DR3yHIY?=
 =?iso-8859-1?Q?4n3DfYA4wN0+v/uPzYwj/DVL1ZagzzmnSajye3XFAmLejo55ahC4FtULXD?=
 =?iso-8859-1?Q?Sza0Nvp2up9TAKW0FBHB9IK0h3bPXW7r5ze735+18tIQSD1Couvd/M1Ac0?=
 =?iso-8859-1?Q?xuKhZMfsKGJqhnOU5b4bisXnt85IIEoSWwb1PRKjhKp1qD5rmRTh9GPFIH?=
 =?iso-8859-1?Q?1lM5eAKcvb+iJTG2NRZ54hDBWYIV3PgZx9ju7NNrMN6FuThMxuK9xV28ik?=
 =?iso-8859-1?Q?T2IGcsfcGI2mY+AT1zLIPQtPlKImAJHHiq8vV8xrOZfCT3KzqyOLRsEIGh?=
 =?iso-8859-1?Q?sYSog/afJKieMdn9R1tsVZvhcavd2Qp+yAwGLBTGt2IdZiQERmDLg725IJ?=
 =?iso-8859-1?Q?S1smvLWpnAEWatPjaEb7xPCp/tvdIXeVV2DLQAZIt8GkrL4TSSjiXc0kU7?=
 =?iso-8859-1?Q?ZN10MVlyVMC01Oc2CxiEWKQaRtqLxuyBSc9vnEwqsUSdPfq1JmwjuKzTNx?=
 =?iso-8859-1?Q?/UCjVsO8PUA1rIKv4yuDhpVa2L9J6mMwtwctAC66kXyFucwhL8g3PyDGyU?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR02MB9917.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Wp95LgeLcOriHhWzm98bFrOrKvYocaG9tS8hLVdoYjRrrYONczUWkSPVbC?=
 =?iso-8859-1?Q?g6TsaPMbF1C1c5sZ1AqsJQjGqFO4skC2yKxjlccio2gVOWcgCQ/bS9Wgs2?=
 =?iso-8859-1?Q?SxXwcPwfa9MVtEcdvH1XXDOxr8Wr4LVzQgtbKtZZ9S6OdZhJgfgQ+UJgeD?=
 =?iso-8859-1?Q?8Q6ji7cVxKG05+v+ZLCx16mr9mY6DhszKw+ZxJ4euRLnxpxPXAgt39KZAt?=
 =?iso-8859-1?Q?MmlC6JY4aACzHHRTp2ddQN+mJWt8bpc+3W6IbdtNXjO3xOOp4XrEJTZhbS?=
 =?iso-8859-1?Q?9D+f8wHXHk/zUIfW9zbv0JuttILzBHtBfAVSdYbIQtzeQgzVUi3R5XCxE3?=
 =?iso-8859-1?Q?Y2eE85DvfFn7/V8Gu6QOvrxeBan8wMH+mkooFcc6E+YT8hBXmNvmgPdzSH?=
 =?iso-8859-1?Q?2hfzMMWUwN0p8uLAXsYkoK9rsWBjV2D0t8xtxBqQX/CXehRQuaAx0QAazZ?=
 =?iso-8859-1?Q?TYJWsMp3rrow2ijBZepDgK8Fon/jffWY2W9oiLiWRSA0k5IAsO5v8a1IGf?=
 =?iso-8859-1?Q?4/aOnJzKA1wKjIQvAce54JKffEtvt50l+X/NSV2+PiX/bT1crJEhNEd7Uu?=
 =?iso-8859-1?Q?Tf9Bwly92Fnx9IOZ2qgD5sI1xAGgMEetdZxDUTwGkqf7k0VEWk3s5ZqS6l?=
 =?iso-8859-1?Q?HVrNZFdVNLbbYRZc92pWgcFLQRDiw3qR0I5wfBOMOJMc+OUduol6DrMGk6?=
 =?iso-8859-1?Q?X3z3WPUIC9wIoKV83U9yF9phvV7fR0m3krTKVGZ2/S/1iKRhyTLV8adYbi?=
 =?iso-8859-1?Q?PasHtXwHVxZE6o048/TQq9F8062f1o0TrDBCXpcgLHFCh2MiI31O86UEfj?=
 =?iso-8859-1?Q?cmmjxHzgxE9weZkOxlXAMxkEIBj1k4v8O483gF24n69nYnMRbxnWSaS2at?=
 =?iso-8859-1?Q?CkXRNE/JXKworO/Ok7S+DFhFKu+ilZ9sBqR35aY/Odb0E8NAf/n8f7weYi?=
 =?iso-8859-1?Q?eKzNfiOp4zxTIMdDseuLT8ZsTiu3adbo7nDsnKAzhb+lh947Y6NgZTGSct?=
 =?iso-8859-1?Q?nBa+N/VXIM7Y0kTDORIVXsVh8FBcAtx4mz3xVIPUK+q/N3dqz152s8d+rK?=
 =?iso-8859-1?Q?6e7ustWoJxifG2dslRTWU54150iBCm4rdV5Vsrq7dm1rzzXzTnusBoDLFD?=
 =?iso-8859-1?Q?GxuGueB38T8yWhogKTnBPkb/xz/q/GyJ9Uvr5mDD/NOHhxxlALcTJ2fTk6?=
 =?iso-8859-1?Q?D5UUCwzDwYq0DBVqc+SaBxy6GWJ7foN8gX2LukU36FhPVEk4ixIN/WqzHI?=
 =?iso-8859-1?Q?G1+KyskfAiZQVDa88VS0CyZ6RhJ1zBAhQnBSbzlC1m9Rbzj6/uveRUDanK?=
 =?iso-8859-1?Q?RUrLqq1bn7EZGJwoJ1nP3dtbLaLSYfiXOWcyilziUT8mgWrio19SHIG82Q?=
 =?iso-8859-1?Q?iPQ6qIamdMTVMkQKDsMXSjA9/E/JyuXg8yPTPInYlnDg8HkxtS5BStjfEs?=
 =?iso-8859-1?Q?YnnKEkauzKm98X1B3VaazojW3rUvgjp9QmRpTD4G6+WlrDr7GAmEtP2Qsa?=
 =?iso-8859-1?Q?t+H6BbuGhqnfzUWDRDMvY2YpzWg14Z5/ia+ebp6k+uqMEGBlib2uWYPkIY?=
 =?iso-8859-1?Q?DPILrBBfvSNZ+ckZSD1BQBQGSH7fqeu4yAtz6dDqxIgPnJIVHSYerl487W?=
 =?iso-8859-1?Q?l8eeECXNephqjHDGX4DMLXIzB3hhl8T0qN?=
Content-Type: multipart/alternative;
	boundary="_000_IA0PR02MB9917670B5507A3ABE0A216FEEF23AIA0PR02MB9917namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qGzUo3BlwkCQUS62/aHnnzxHa49XLc7Z1W0fcuUDmbZkBxQgRv9XA2pmKYh9m0Br0e+wEpbADOkuIWzulw/PXvss4fnPDo819nbfVVRNPGeQrAkeo5oTsowbR/0Z5sV7+xQPTJzNdjMiC1UiA1cFwe9arrv9f1omQsjSPaQkQnBQMUbdFR9dETJWZVlp7J+s3M/6xYQMXXZ4YPDW76Rn0wwRvpg9MhLr7x/By59OwtZ4bTjFyS0w14JLGOtKPcudVsofhHei5gGMLdBbC1/d5mY68W0gTwe8+iFQwk24/IcmBFqXoIKeQCT3Jh63+vfcZNXNVjaKIhB1FezE7MOWrcmjIW0nIEN9iM2sxm4cvSpaBKnpBOyPNv69JCnyFtIt1yVvuh6POFtF9u3LFg13i/QJ4hISiZDxsPhQb9qaoc8s47g7o0B92Tjko6m26PxDQzYOsmTAgX/caopxmOQPCDjaPY8butCgrAKGkJQCfsz+PD2D/7u3AAhRd5M7LzoNhvEB4w/9Hh4FuzA4fZq/1oxuPTXe7u7Qk+biYYIKJlJ2mm+3Kj0/YeyOvZCOweAstYO+J4DnfMGascaaFd24q16NWhmjUWoKya9lWUHrmp+6fFxW6HCSkdR56O8U3/pe
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR02MB9917.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919504a0-3035-4094-b741-08ddd33678fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 09:08:26.7724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kMCs3DCfASCjYea0QOiEz2qkd5jpA2H2iTtOiZ1PmIb1pDGp13ePcU+LumoQtMiK6DhCxLME25jAtq2kLaXHJhyWEuvX/ejDdHBZOxXvjNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7461
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=68907890 cx=c_pps
 a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=qC_FGOx9AAAA:8 a=DyEZiCTT3RNuaYIG0VoA:9 a=wPNLvfGTeEIA:10
 a=c32ZLuSOm0s_6TV7jx4A:9 a=yTSQk_gW9q9NSbNT:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA0OCBTYWx0ZWRfX6AJiqOg5CjA+
 4JErhRwJ0+DcyS4phyBofPNPqI1mzPnCcED+ChUlR0IHNGxzxXzC3c4nj2PbRS5h5jK4ZIbYzUF
 hUX17a9tX1gdoMRD9DxZIkVONdlSnaPr5HHnXw5nX2jQA/XM4AWl2+t/x3/n1GX9U9o7i3VCV01
 B2hTKCiQFkOVbKIUUX1X4GScTg+fgKyPsO5SewrOScBnBupXiaeAa3/4TfIqpFJOQGmPD+sL1+6
 3HRH5qeUj3O/PMUdq06uuuSFhtpbsxdeEUes2EvNj39feWTkaohPFgeajFh2cQjLF9ECx6refaD
 F5NMAN5uxAlj3jkX313GKEsNpLeFHq/xjmyEcA37Mvm+PE4FeatYm8iNxM+iUzyGaUzx5bCQPYF
 PcqJvu5frY3j9npcnGVml/r1xAtRnr2xb5nOH12cnVa9GPDfuIT7JII+VEl6uFf0fn6KJRIA
X-Proofpoint-ORIG-GUID: 0W9AluBih7VNPOJJIT7DvTHLcs0PEs_d
X-Proofpoint-GUID: 0W9AluBih7VNPOJJIT7DvTHLcs0PEs_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=737 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040048

--_000_IA0PR02MB9917670B5507A3ABE0A216FEEF23AIA0PR02MB9917namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8=
:

  Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +00=
00)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcm=
6490

for you to fetch changes up to 5d8fc0d700640138f1890e675c0ba3e80f8b6f9d:

  qcom: Update DSP firmware for qcm6490 platform (2025-08-04 14:33:36 +0530=
)

----------------------------------------------------------------
Venkata Kota (1):
      qcom: Update DSP firmware for qcm6490 platform

 WHENCE                |   4 ++--
 qcom/qcm6490/adsp.mbn | Bin 12079548 -> 12693084 bytes
 qcom/qcm6490/cdsp.mbn | Bin 3637248 -> 3637248 bytes
 3 files changed, 2 insertions(+), 2 deletions(-)

--_000_IA0PR02MB9917670B5507A3ABE0A216FEEF23AIA0PR02MB9917namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8=
:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:2=
2 +0000)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
are available in the Git repository at:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-f=
w-qcm6490</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
for you to fetch changes up to 5d8fc0d700640138f1890e675c0ba3e80f8b6f9d:</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; qcom: Update DSP firmware for qcm6490 platform (2025-08-04 14:33:36 =
+0530)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
----------------------------------------------------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Venkata Kota (1):</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; qcom: Update DSP firmware for qcm6490 platform</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;WHENCE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp=
; 4 ++--</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;qcom/qcm6490/adsp.mbn | Bin 12079548 -&gt; 12693084 bytes</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;qcom/qcm6490/cdsp.mbn | Bin 3637248 -&gt; 3637248 bytes</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;3 files changed, 2 insertions(+), 2 deletions(-)</div>
</body>
</html>

--_000_IA0PR02MB9917670B5507A3ABE0A216FEEF23AIA0PR02MB9917namp_--
