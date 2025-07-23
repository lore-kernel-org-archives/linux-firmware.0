Return-Path: <SRS0=3BHt=2E=qti.qualcomm.com=vkasinat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73692C83F17
	for <linux-firmware@archiver.kernel.org>; Wed, 23 Jul 2025 09:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 533B5C4CEE7; Wed, 23 Jul 2025 09:51:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2472C4CEF5
	for <linux-firmware@kernel.org>; Wed, 23 Jul 2025 09:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2472C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9PETV024814
	for <linux-firmware@kernel.org>; Wed, 23 Jul 2025 09:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=+ic4k+EDh3M5h4D5A3t7KtGw8bA2lUS+bKM8saM0O2E=; b=Sw
	1Y5SQZpTYJ/cydm9coHUYftVD5aWlVBWHnJNrhttrz8eNWPWvMuWQ6DudKzCSOdf
	MUxOQ/UIYko1QoH9ZdLBwCmY6vcLjSkczLDnU28PDeKjnkgy+6nDGSKZuEXmVx+4
	2/ID4ThCwZpmlLIelGu00NfHvBxufmAfet6gSyh9G7uHBZxfzEz0LHM1BBs+nLr1
	ObHxdPq9D+mi8j9wA3tW26hsuSH9crz639ABStq8rk6K2gOLEPLL4ugX+TX/aVLq
	wuJS28qLxhu+N2YxQ/YqTGcqP1vRFOuhzHh2RfpUQz7HzV2pwhAyeawBAms12EXB
	PHqD4fZ4dIzI9gp38+pA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dmh3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 23 Jul 2025 09:51:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWy/WVpUIcUu09bow0IMtCYToE5MQTUJ1cUuNmfrJxvhBttYxE1iSGH//EnVpR9XYIemAJ2YcZATr+wnuQdQcy634FgaQ+hacguDxe/e2v1bNXAC62iH0Cl5g7f+hppq2NKwWnhXnjzGA+GubNGuJrUz5Wi2JUh2b/w5Yyit/ExeIBfNQnTPbwudIVW9tbHQ5bXr7mB8LQsG7nBcTS9vvPpQP+SL8gVVclDobRX5PVfgIKay/T9QIbXRgONFyyBg3aYPM+B9HrPPgNZYaCJvYnlBC3QwkPgm7vdlcfADwlbzY7nn57o2fTV5yJELjBYJ3cCjQYfyuFtWPxCnvwJUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ic4k+EDh3M5h4D5A3t7KtGw8bA2lUS+bKM8saM0O2E=;
 b=nwhl9p/rg0uXtGOFzHYlal2OV3oTgpKkKoxhxxZnHU5hHgBv6nfigjUuab4QHHTnvv55tdMlgMf16z+vIUDfYtIzaL0FUfADBNTpRd6M3wOtHh6srabeQMng2ESiiT1wZLcroqjkNQ4g+CeUWPxaW1YON5t5eqEUPSfLClooScbjyClppW4NtWO1rtow1j21KiEgl8cIB5Rw5gmG2nVhO1JeIobN7Khg4lPK9W2GBQ/Ev7TG/knv4Lr1PuEt7aJWe4R8uhJlUo2ian25RJkZmt9E8vSuXMB1XmZbT5XWrd5Gbmi2/EccqBnXR8FSFgUIeZDIQXTJ4T1VfK8Pg62MUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from IA0PR02MB9917.namprd02.prod.outlook.com (2603:10b6:208:48e::9)
 by SJ0PR02MB7311.namprd02.prod.outlook.com (2603:10b6:a03:29f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 09:51:35 +0000
Received: from IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444]) by IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444%3]) with mapi id 15.20.8943.028; Wed, 23 Jul 2025
 09:51:32 +0000
From: "Venkata  Kota" <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>
Subject: qcom: Update DSP firmware for QCS8300 platform
Thread-Topic: qcom: Update DSP firmware for QCS8300 platform
Thread-Index: AQHb+7c0f0uiVPOeE0aLBNQj7RDIZQ==
Date: Wed, 23 Jul 2025 09:51:32 +0000
Message-ID:
 <IA0PR02MB99170EF1F67713EAE935DC41EF5FA@IA0PR02MB9917.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR02MB9917:EE_|SJ0PR02MB7311:EE_
x-ms-office365-filtering-correlation-id: 2d84e501-0995-4e03-a74d-08ddc9ce8143
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?05oZe7QLat+liejIb2QRT7BgmXsY1gl8Ufdy3iO5Si0Gp8Utjvm6mXaqtk?=
 =?iso-8859-1?Q?2o+/afH0DXmqQMn+PibwrnTGgGxtmsmzIaB3Sh7iT4R0ooLFH3GXpLjWPs?=
 =?iso-8859-1?Q?0sFVE4wEOjcJpOM9PnVGna3srbWYaKylJpTyIERaRiAt0AED6HIWfioB6B?=
 =?iso-8859-1?Q?8NTcSKPmX1a6FHPBL4N+fr9NIc+grA6MxZGbpAWnpXZfdUVr+k8KCY9s4n?=
 =?iso-8859-1?Q?ZgQjWzjP0EcbsTjEUhbOYX7okpoQEOdFzNAdkDYEz5S7yzqb7rl7Lx8ySz?=
 =?iso-8859-1?Q?np6SRBf9jtutSgOV7eS5BoHN88qUsjVAgXk32nb6encvrI8Qx1296FjJRg?=
 =?iso-8859-1?Q?Qw8QqvSN+5WdK+NPSoo56n3sWhO7agjdSnff8cm3HHpvMO3WFpjri1xIic?=
 =?iso-8859-1?Q?7VLZbyND8s9PtBJNObb3hZEPmIHy67zJXV8tr0ngNSmmeNosW9UtL1YZze?=
 =?iso-8859-1?Q?y8en1+FwGTUnW/BI1K+jm4Bn+L/rUcHlybv9i6gR4W/ve34lqyE4DTNRGm?=
 =?iso-8859-1?Q?87oCZoYaxK/sPTUEzwGuJaGHYqQK10ihmCCOpTUOymxr5yrV+QB5/UFt99?=
 =?iso-8859-1?Q?w9jlpWUYb9vp/fkSMLhQgkFgElWufoX2GHG7efZEGcrdVY2j24hGi3n/bK?=
 =?iso-8859-1?Q?aOBHyp5fUWkVflylPC0Bmfvd61ZbdgTvijmpXth4XsOP0VVPbD+IuPozVB?=
 =?iso-8859-1?Q?2YI6qD0MY/fiQv4s5PoWJfV8qPDY6VSPbZjvlWRyTh+Zy9X8GAogADYOtO?=
 =?iso-8859-1?Q?RSu9zXeb3nq3hycJZ38jPQjikX6pSwXimLCNd8YYsDegUs8zdz/GeXuRBy?=
 =?iso-8859-1?Q?NvV4WRwMLBAULyAX0dr501O3TGJM+AUUY5IClfz2Z8awBPo5pORwQp+jBK?=
 =?iso-8859-1?Q?fVEXunWdi/sCy4lgJ3DG00UTgFDUtKMLXLaMQ1Gc5AWv/4LyDQ02xeUWwz?=
 =?iso-8859-1?Q?9KaFztBAGqlsdKxk4s1cpzmoo3lmpF3sEwAYsUhhNre4huu71Opkbuc2uU?=
 =?iso-8859-1?Q?pwqZNcFQRlk74/ETpm72dgNtdbiAmPpMAugdNSUsmJAYILyImwp0bnxn49?=
 =?iso-8859-1?Q?N8vqW116hxhyUKc8mbGV6WtJT8HFD72kCaZdwrLkaMhO/FIiYx33txArS4?=
 =?iso-8859-1?Q?zXCLQcGdAs7ZyevRi8SInOFd4gvB4AQ7AvTR4ataJmU/DxfngqvwBc9w9K?=
 =?iso-8859-1?Q?niScZNA2qm/ZQealctrzPFiUqVyFW+9A5x3Omkh+uYZjwZRmHffCCAPwsL?=
 =?iso-8859-1?Q?L3iX8fHFY7w4PhgAK4Feu13w1KdY7l/6rbAKtbE8nidftBrdi+pQY1p76v?=
 =?iso-8859-1?Q?133TOfMRjfM2ObGn9HFeZMq5K2XiQY3kJ6+GMrFBISKe7srkgkPpBDxFAt?=
 =?iso-8859-1?Q?lm2En0B9Uv27hqcPnP0LktQ7S3G6Ws0LoPNme07ziP4+IcP/bJMUPUJp3g?=
 =?iso-8859-1?Q?hQXg/vEziWbcFaOH4sl8LhCZYfiQomMbBJx6mqFBtHCjcS/V8fxbzQmi+j?=
 =?iso-8859-1?Q?U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR02MB9917.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?4UA5FCSwXcz+QB007FhxQNQ5kZhjoGQHnpA4Dpr3CPgrIzR7dZkMPaFEK0?=
 =?iso-8859-1?Q?jreMXtLYxg1JSdfj3JrBQIR/PQTZZpy+aa5rtU7HIGAx2/X84yYrJYb9j4?=
 =?iso-8859-1?Q?+J6gE7MpidnrbBCSg9Xw0/6G0n+mlD5zuqrnKjhhiRkfM/UnkdEKuSudVm?=
 =?iso-8859-1?Q?PnrQpMinqfDkFYSuvPtVYe4TAPY8oOnjLixe7u7KsGGFAQo2pjjkCkpZ7t?=
 =?iso-8859-1?Q?f5Tmq4ixdB/S4rysZ8OqnphnKnugzaTZHeOSVKP7YWjDPrEsdjFkBi4p3Z?=
 =?iso-8859-1?Q?4ldbkEER8bj68G/c7i1/PAJy7+K2pvYjJjgC2JSPvyq++Km1ffDWHO75Qp?=
 =?iso-8859-1?Q?2q1+WZ5ovCVGZ3VwCBcqdf8NmXOLdRxJ49YCMBtqEu0aqCQLga2nHcXrQD?=
 =?iso-8859-1?Q?ShAvYI5dpubU2Gap59SkAbqbVYLIotpEhaZ2dsE5VA3Ph2xroWv48Q5Z/q?=
 =?iso-8859-1?Q?VyJ+W7xrO8hxMYjrgeSiJ6gakD/D5JVaHMYlC8lHLrFYwQhee9Yp9Qft0s?=
 =?iso-8859-1?Q?xq/BxI4rsY34Av5eDoN/zDI1fEXqG/VD5+gCSYYZS29v/I8bQ6lX+kgbyD?=
 =?iso-8859-1?Q?GAt2zq3BsDUkcr94V8FL+bOrjkvEeupAbQm7yd4993cI0Nz3XrHu9kAQBT?=
 =?iso-8859-1?Q?8GRmzcejdYhc225P6RvSyzM+c1ClKeb0DSScXXCy9OKmVBe1H+C6BYvr3k?=
 =?iso-8859-1?Q?eAK44iq9Vaa9RlNKVW1sqPfL+5C13Bs/vovDR3IzN7v7SSwBwAqGyZ/cHo?=
 =?iso-8859-1?Q?NAYksW1xUyAihw/eyy2zA0XbaMfz//vQ5210u4s0I1vGYdRugyaxEKIZOL?=
 =?iso-8859-1?Q?sh/5zO+0lWY2qHlEI2vKOrh9yHtYxIs/c1iFJirNUpHxf5dvoz7De0Qo3g?=
 =?iso-8859-1?Q?Mg2cecapK0l6EqUa/c5UMrSWRSg4+FrpnNs7YPvoA9xiKdj14p+8kQaI/H?=
 =?iso-8859-1?Q?XdFvf8/Zt7EsYkVj40okRYn6hfI+HI3Jfw3mSw6J6KkuNfDwBleWuwWfPX?=
 =?iso-8859-1?Q?4EF3VNKhVUMs0mFDvIn8fT1BFn5YLivxhxmJXVXUc87e649VdgqSAZEd+C?=
 =?iso-8859-1?Q?luWyDaDTcNFv7SNIXcimjSPDgcU2schKpp/rRmtJ3WKpZWX5rWzL2GA4Oa?=
 =?iso-8859-1?Q?Y9vkdQVC9Jjcq1ekLdriHvnJdXvCNJGR+9YCLCAUEP3LkOT1nED31PAKRI?=
 =?iso-8859-1?Q?IF1DJZTBki7xjE7NthyDcNeO4WcaE2SKnEUI8A4qWMG831z2RLyBFIpSam?=
 =?iso-8859-1?Q?PzeegvQXhfNqBFx6XKDSVpgEpwWp+zeCrh8e88FDjW3WMMq0XxJuwXXTOc?=
 =?iso-8859-1?Q?PnGcLFbr4pErDVS6stB3x+EHbuhTc+QUKuAePO52CCG82v7FUOboVKnQcY?=
 =?iso-8859-1?Q?JvUQp6g89MKyGmUF+vfWUV1fVh6o3j5AFuV16E4SjESPmaIQByJhctrE3W?=
 =?iso-8859-1?Q?PuZZMbgsKBDcYUcK6O5qnohIweRBORuvUFzoWcH0F7z6YYBu9MKLMUEviZ?=
 =?iso-8859-1?Q?NaSNcplaCTNsn1Z50y7SKi4ryBRr1fhIjn/4Cg+g6D3C3nsy21fFCqvuOs?=
 =?iso-8859-1?Q?2ptrTOU4xMGUmP9+PlBFDYoLqXYmL25J2u8jaSG3DmnfXaegGg/4cdrSQ8?=
 =?iso-8859-1?Q?ij622w8KseLVAgSc5iO/NIL3WolMMEBV79?=
Content-Type: multipart/alternative;
	boundary="_000_IA0PR02MB99170EF1F67713EAE935DC41EF5FAIA0PR02MB9917namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i+7f7DaCgk3t+RB2UOQcvIbydtjluQsiEvltxEJK9UQHYpMtOlz2lZ24nlBzqChOXO015frQ856Dh3Ksg/LkZFNNJYGew/bDFo6sNUhsLFBPPBxIp5946u1jrWgbRhN+Q1pZykkIObxzhGJ5koSR1MKUBZEKwhksSsE6BVpyxzADMPCyxQFfdHv7JVo9E2iUayib8oY+84pgTPIP322SnQLPlfy9ZMSgBR+E4UJ7QNzXezqn2fyfG5W9/d7uNVJBZ72+D1G4OIL7880376iJYJg31eeRGr+wdDTgq3AjO4CxqUIaKWQB/dfS8xDn71oQdxrgkG1o6pEjSO8wb1D5FP90Vy/MH2OgzuO/dRtqXUVNUHwsoOejrkLFEpQ2Ra9Okozwm77ag4dC3UHyMHcz9bh1O2fbaup6o3607Q1DzKpch60NY/DThuX1PzIXNp2hfZtUxUXh1o9Jb/VxloMxgufDaS3cHhut8Z9JsdMHCRHPp0q9L30V6DEDc5PZXJEjaoQPfS7gTKMucKO3A2ZJa8Hyr+x82ZYMyuWJrjrxy4KZv4ydTrOq2P2Q+xjc3ymVXg1FsmD5WowpWwiIDKxMIv7Qixow7inlY3DIN9BlLwQMU72vMl0HetVWbEK+DxE2
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR02MB9917.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d84e501-0995-4e03-a74d-08ddc9ce8143
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 09:51:32.5082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pKscQA2ykqD3RxbbVhRthLIY9f/kFRQj1kqbXgYa/exfJlg5JLlNPBbCovRfT2QzB5NKSPV5etHEqN16V8hNbGLC/7vydOqZnksPXri+DVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7311
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6880b0aa cx=c_pps
 a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=d85GLZ2lVxKp6GIVMKUA:9
 a=wPNLvfGTeEIA:10 a=x0V3C95xfjfR35e4sxoA:9 a=wHEw5OfSqdTmmyli:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Iscu_d-PX53U-5QuMwbO2S249NQZP7R0
X-Proofpoint-ORIG-GUID: Iscu_d-PX53U-5QuMwbO2S249NQZP7R0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4MiBTYWx0ZWRfX+zWWrTX46z67
 NVYIQFYbadOCDFVBc2AQu6FMFT8LQSi/3CLqTWY07Ak5ckDdsYXe7mYCoND3saaMEGkAxMZjCfX
 OJMgThcee6Qee5QlnmOTvu1XIKu4ty6jhFvKpJqihPCU8DQZqXzM/mp93dk1DRiY3avgat0q5aA
 6iWURD1U02Fc4caDjRDmidHvM+szkTKQbyRXsFtCulEDjN6n0egXLjbUsm3CrSxMXdvl+Y3ioJa
 vYQzY+tNOuC1O2UmOQON6Wy58V4OknPSjNoTSbhSg2xxx9Axl19QoPHL43tYVQtBA5YHay0afE8
 XDupEI8EAZ46fSksjJJqKS+YfvaAL3/52ajsNTJ8+ajfLokF8KFrJ+fUQBNT07/7ijaqNNTEj5E
 6A67W6UyufFmC1yYtWyUP+5RWvIZTkdHkl8dzcX8KpBJhO45TDgDh1QR/XG/1SLYO//mQJqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 mlxlogscore=725 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230082

--_000_IA0PR02MB99170EF1F67713EAE935DC41EF5FAIA0PR02MB9917namp_
Content-Type: text/plain; charset="iso-8859-1"
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



--_000_IA0PR02MB99170EF1F67713EAE935DC41EF5FAIA0PR02MB9917namp_
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
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
The following changes since commit 04c379b552c7ff194e0840ede6a2997d7deac691=
:</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp; Merge branch 'robot/pr-0-1752559067' into 'main' (2025-07-15 21:06:1=
7 +0000)</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
are available in the Git repository at:</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp; <a style=3D"margin: 0px;" data-linkindex=3D"0" title=3D"https://git.=
codelinaro.org/clo/linux-kernel/linux-firmware.git" class=3D"ms-outlook-lin=
kify OWAAutoLink" id=3D"OWA2882bc78-af4d-a294-84a4-59a807c86652" target=3D"=
_blank" href=3D"https://git.codelinaro.org/clo/linux-kernel/linux-firmware.=
git">
https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git</a>&nbsp;dsp=
-fw-qcs83005</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
for you to fetch changes up to e58faa78b6d6d88f0395bef769628d04e937dc55:</d=
iv>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp; Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-LEMANS-1 (2025-=
07-16 14:00:17 +0530)</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
----------------------------------------------------------------</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
Ekansh Gupta (2):</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; DSP.AT.1.0.1-00125.5-LEMANS-1 DSP Firmware Release</di=
v>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp; &nbsp; &nbsp; Adding RAW Files for gpdsp from DSP.AT.1.0.1-00125.5-L=
EMANS-1</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;WHENCE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 | &nbsp; 8 +++++---</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;qcom/qcs8300/adsp.mbn &nbsp; &nbsp;| Bin 6643712 -&gt; 6684672 bytes<=
/div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;qcom/qcs8300/cdsp0.mbn &nbsp; | Bin 3084288 -&gt; 2629632 bytes</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;qcom/qcs8300/gpdsp0.mbn &nbsp;| Bin 5832704 -&gt; 5873664 bytes</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;qcom/qcs8300/gpdspr.jsn &nbsp;| &nbsp;22 ++++++++++++++++++++++</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;qcom/qcs8300/gpdspua.jsn | &nbsp;29 +++++++++++++++++++++++++++++</di=
v>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;6 files changed, 56 insertions(+), 3 deletions(-)</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;create mode 100644 qcom/qcs8300/gpdspr.jsn</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSF=
ontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, =
0, 0);" class=3D"elementToProof">
&nbsp;create mode 100644 qcom/qcs8300/gpdspua.jsn</div>
<div style=3D"background-color: rgb(255, 255, 255); margin: 0px;" class=3D"=
elementToProof" id=3D"x_appendonsend">
</div>
<div style=3D"text-align: left; text-indent: 0px; background-color: rgb(255=
, 255, 255); margin: 0px; font-family: &quot;Segoe UI&quot;, &quot;Segoe UI=
 Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quo=
t;Helvetica Neue&quot;, sans-serif; font-size: 15px; color: rgb(36, 36, 36)=
;" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_IA0PR02MB99170EF1F67713EAE935DC41EF5FAIA0PR02MB9917namp_--
