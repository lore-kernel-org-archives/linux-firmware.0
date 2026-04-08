Return-Path: <SRS0=dVP6=CH=lenovo.com=vsankar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB48C1073CA5
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Apr 2026 12:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF59AC2BCB0; Wed,  8 Apr 2026 12:27:25 +0000 (UTC)
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EB19C2BCAF;
	Wed,  8 Apr 2026 12:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9EB19C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Received: from pps.filterd (m0464639.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387jmRt3076217;
	Wed, 8 Apr 2026 12:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=m9A8AbNd81ANB/tAz3XvpEBbHb8wI29RqtFZRUzPJTU=; b=UTVI9mQlz66h
	4okfZ5+80ka2KKKWgS7Y0toH2vhsZ/taFk4OjYmV2nC2s8aL4MAlT+SEvrpQzHn2
	0uNrwPr108g5vSZ9dqSWj+U/Sp0R2IC/NPS4WewMHwK7bVfdvcxEwVzf+33Xix3u
	O7wDVA9uHrOkMAIbAHq6PAZPnLJZoqRGduAYgbqIpqTy9CHr6sG+AbMH0JnljmxJ
	VH4/OM3L25du1yCjK+3LEzi35zdzr86MJoZdCoIZEpi+13NhO8np74WsuW03Wj4R
	t7Ya8eUs4aNz0IHWoIIY36Z346/DVABy6QC+iV3Y4wqm8dGaSeTjZnycv6yR6do+
	wxzGZmLE4g==
Received: from ty3p286cu002.outbound.protection.outlook.com (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4dcmt7v9s6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Apr 2026 12:27:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qj4E+nhI6TPRa0Ro/o3fNKk0aMQDwuYk8TmGZhQI/huOZrc8XDMz4EpfjT+A8E6OClV9M+AQS1FD7Rm3zjuTYWukqr2Nyc/SYiGqpO4As2OfCy20in9dVaOJN2suFegzR5yLOh6vwXvt06go5wuJJp0DBG32ES7YYz12blw73E/N9lb/5xSoEdXoh4N0UAaOuS7JyEyD6+zWkmWsDexj4JNW+E+rCh1Dur4UnpDrrt+5prPbXElA5Eg/4mxAIbrpGGZXHVK76wWy41IbSUIkyTUtl4zBc31YUwyYffgOtdwxDrhfH4TlNBKXBHizwb9vTEt9nQnNxmuW5Cwe8TdUPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9A8AbNd81ANB/tAz3XvpEBbHb8wI29RqtFZRUzPJTU=;
 b=wtrc4As8OEs1TtWs8uokiiYoXZePCeCk0Q1TWXrAjUAEi+qxcet+faFS6zFb/Z4TPUOEecMPK0AlrSzTfiFZQx0oV7/DpK/nBI94zE1UVnPWWG/kMA5jVvov0+zjrCmb4NFjSzoyAwRCvgM/jaF7R7G5aC5HAlpXF0QGkJuf/k8BiOuLqDLfwcdZ+SRbErzpj65yegexeUmG2UbgRIJddhxrlFY2lfKAbVM40EbQV9ItYTk+dQvXcNblBw3gU+UiU8WWXEnqZwNJhoxTQe3W6v2MIYRbE3AoIttPg5n5ruhw7TAbz1XD8TaF1uNyyiIRRw/tR0ViVxRmMD8KL7+Z8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from TYCPR01MB7578.jpnprd01.prod.outlook.com (2603:1096:400:f3::9)
 by TY4PR01MB17126.jpnprd01.prod.outlook.com (2603:1096:405:367::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 12:27:09 +0000
Received: from TYCPR01MB7578.jpnprd01.prod.outlook.com
 ([fe80::8ffc:55f6:ec3e:df41]) by TYCPR01MB7578.jpnprd01.prod.outlook.com
 ([fe80::8ffc:55f6:ec3e:df41%3]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 12:27:09 +0000
From: Vishnu Sankar <vsankar@lenovo.com>
To: Josh Boyer <jwboyer@kernel.org>, Aaron Ma <aaron.ma@canonical.com>,
        Richie
 roy Jayme2 <rjayme2@lenovo.com>,
        "rjayme.jp@gmail.com" <rjayme.jp@gmail.com>,
        Vishnu Sankar <vishnuocv@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: [External] Re: [PATCH] WHENCE: Fix ISH firmware symlink prefix
 for Lenovo PTL systems
Thread-Topic: [External] Re: [PATCH] WHENCE: Fix ISH firmware symlink prefix
 for Lenovo PTL systems
Thread-Index: AQHcx05f34VHrx3Ow0qNlIz3nFHHsbXVDxh4
Date: Wed, 8 Apr 2026 12:27:09 +0000
Message-ID:
 <TYCPR01MB7578EE68948CE286A8F8C5FFD65BA@TYCPR01MB7578.jpnprd01.prod.outlook.com>
References: <20260408082834.94540-1-aaron.ma@canonical.com>
 <CA+5PVA5+t0DGasgNONe5GW-bD4hJX4Hc7ZKiB7D8kwsFQKtHuw@mail.gmail.com>
In-Reply-To:
 <CA+5PVA5+t0DGasgNONe5GW-bD4hJX4Hc7ZKiB7D8kwsFQKtHuw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-Mentions: aaron.ma@canonical.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB7578:EE_|TY4PR01MB17126:EE_
x-ms-office365-filtering-correlation-id: f08a3e46-b217-4094-867c-08de956a278b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 g50tFP/jVzZMVfXffJheIJ4R/IzTnOnhELYAGnUkWUi4zKRP3CYe1trq+bZrrqDRHAyz205WXd+kht6XRG0xGVMqMJlz2Tr9oZA5OTAWm5h+Blo//hiL+OeHTRJLC1ThCzEfF0jGa9oSRWA29ItcAOV6kW2tV870yy4tW3PqVn0veIVSrpb3GcXO9ZC8slQyYIChKbVcMG/wOwq3SuBT5qJFCGzX3JrwrvyRptMIPG5O/QzNrzyf4F0EbBofujVxst7bd7YTg0KUXlWLbOXbFVyloNdyAyzLJ05M2wQObCmwNfGD+ZQLUcwOggIBtj29/i7luPN17P24ueuXRhETKQCBBSL+/YCWc5wCXhOCDgp3ZckVyM67QoIZxMiy8iYlbtfAbleoxGvMWlfieoSDcG59Laj8x2HNCLU/ULpCLnBqYfh6VfDNlkFdit9R7MwwC0jHZaGsghRQPqVbUneFxBRFCskBBbIPjB3mEF3uhCtVKt4tisVixx8Y5rV3BkWsCoz/86gzX90oRzvKcUpxAoJhzEFwFwAOmIhyHQSEYaVgYoLX7cDp2o9Inudm7sF3AMuxs1/IjaWwYrLNjkFMsX214ne4I13bGt3MRQGa3JjtY0h07eq+PBSv90IOMCSHdjxKz+YU9YSr55C+5NQMEBO+PiM21ZsmZfulA/zg8emTG49k7sjvVKvpZ4I8rT2OKudbzZWSj4v+f3nmL1Ttu666JzbB4xCDPNC+5GnzGb/OoY5btciixdNPvfNhmYZ7JhAdXm4MtJzlzhTocGZ6mkf22T2FCVp+omORhOyMLv8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB7578.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RnRoc05pNFAvZDZzUWtvcjZ3dStRbUZFV1VJOGpOQ0JTdTdueG93cDFDTW16?=
 =?utf-8?B?TnQwT1o3WWIrV3pRd2dUZ3UvaERObERqa3lHamhJWllUd0xFVForcy81SjRZ?=
 =?utf-8?B?bUlPcjd1Qnd4VTVIT0FKcDdZUDhuM25vbWdhTkZBY1h1dXhGV3I3TmZMVTJK?=
 =?utf-8?B?cFJBSTUxWThUSnlZb2RmOEYxdGNhSklKRklFMnJidXN2dUoxM05oSit5Q1l3?=
 =?utf-8?B?STdKQTBTekgvNVFnbThvK1RYRmYvck4zaXlld1piRlJOY1hTblBJdklkTzda?=
 =?utf-8?B?Z0h1VFE1UWRXVzdicW5IQytPNXZxZ0NDbnZpWHJMUzhNSU5URnA0QWJNSWNQ?=
 =?utf-8?B?WUY0UWIwK05UY0NBbmYzMHRwNmErK1h2aElaS0I3V05xVFl2Uk9USlpLSmxD?=
 =?utf-8?B?c25rd3lrTGlpTElRZkZhbXFqTThqcWlRVGx4UUVLT0JCRFQrNnQwTTVSWFBG?=
 =?utf-8?B?RDIzM2VvaEZub29HMlYvNzNtTlM0aWtmZldXaWNFZ09NbXFpTWpxakZIQUl2?=
 =?utf-8?B?SjJ1WDFjcHpMZXlyL0llS2dwRENudVhBdU9ySjRzZHZzRmg4eXBZT1lCME9W?=
 =?utf-8?B?WXJFWVpQRFE3a3h3SXQrU1FFajRMb0tQQ09KQnNXNHJhSlVDRFhPbGxKVUND?=
 =?utf-8?B?NGtkbUtFb2FrSnJlZlpxenJSMnMxM2pmbi94QTh3UitxakZ3dHBZbm9KRmFQ?=
 =?utf-8?B?TkVvUDQrbFIyZmFHd05TUWI4VWVhRFgyRzVZRGczd2VRQktlTytHUHAydWw5?=
 =?utf-8?B?Tm5ueDRidjBOcFJoZ25PMGpHRnRvS2M1QTlGekF0K3UwVmxtMVBzUFhYSzVh?=
 =?utf-8?B?aUtEYnFMei9TWXJEZXhwZHIzcHFtMExaVkh1QVB1THBvL0l0Qko3QnJ1bTBx?=
 =?utf-8?B?L0FqSGhqeWYrUDBkSjB3aGdpZGplMDg1R3Q1b2IzbTRicXo2MVVRYURFZWFC?=
 =?utf-8?B?YjloditWU0ZFMjZDcUNQcHkxaThWdXNtMUgwTWhqc3JrSDdjSmU0d0hXYVd2?=
 =?utf-8?B?SS9zVWxENjlmNWcyTFd0eDBQWkt0eDhwZkwxckltS3c4QXZERGw1dWtWMURX?=
 =?utf-8?B?NC9pcU9IdmtyYllTRkV1K0pwU1hreW8zM1VmcUROdlFwSVpmN2NPVWw2Y2g2?=
 =?utf-8?B?RnVmTUJYYW5McVJPOCtUcnIzb0RkQ09HdDJMdTVWTlFoRytwam9WZXhKZ1JN?=
 =?utf-8?B?R0h4djhZTmFmY3hUUWgySjVWekpRQThZR3dDQmFFZ044RVlnblJoT1NCN0xT?=
 =?utf-8?B?V20yNlZJQlQ2UWVyWmdmdktmZG9EbzNRTWo5QzFTeDZPWGRodEFPaTZONjBG?=
 =?utf-8?B?TTBxa3IvYW9STHJHaFdqVlQxbGN0eDVCaG8rMlBFc0V2elR6ODFHZUp0WUw3?=
 =?utf-8?B?WngzbGFBMXNJbnMrU01XVTljQXlNVlEwUXMzWTJzbGhSaFhudWhoZGp2clpT?=
 =?utf-8?B?UExRamtpL2NoZFl2Rmk1WXo5ODNRL283ZmppSGpSaWdWc1NtSDErSktoZ2VY?=
 =?utf-8?B?U2NoTDFoaUxXR1BoZFA0OTVTQ2xyWXg5akpFdEdvSE9GT0NQT1JXMk5yUmVR?=
 =?utf-8?B?eWRyRnUvWTQrRE16OXdTdGRpQ1E3OU5rWldTT21FcFlmVk5vcy93dlRUNDJz?=
 =?utf-8?B?RlNJeENzRGdTY0MyellsS3RHOU5KVUdXNyt3U3FLSzlidGd4OW9HeW5WK2JK?=
 =?utf-8?B?MzVXRVhBZ05sbk0wMWJVZ0J2SjZyQ01HU1pIR0IwSUVGcmRUWDlETzY3NEVI?=
 =?utf-8?B?allkaFlPL2krcGFoQmFuanRHMVBJUGFmbVp6eE0xTkhYT084blNvbTU3MGcz?=
 =?utf-8?B?R3NEKzdlTzJLTHZINXgrblNRbUNqUjloUXRPZHA4WERrVm9DSk1rOHFqcm9D?=
 =?utf-8?B?OE5KelR3UnVnSXdkQmVEYlBMaFcvb0dWWU9jSUxCZTdGVzVablExVUl6cXJP?=
 =?utf-8?B?dmF4RW9BWFN1MkN4UzI1OURZZ1hvbHM3ZXVqcUloTFV2d29oSGFCTkMvbERx?=
 =?utf-8?B?YmthbFFlUENMZVpFWHVYT2MxM1ZhcXNYRGc0cG1BUG81ZXEyanNyelZnZUls?=
 =?utf-8?B?OEhIL2s2VkVlTWVuQ1E0eGowOVY5UjBOUEc4Qi9vS0lNWFpoSk5tN0dzWnFI?=
 =?utf-8?B?MkJ2UHZnZW8vWWEyeGZ6Z2Yzbk52cGVNTDNMNEV5R0VMcFN1cTNFVjdrY0wz?=
 =?utf-8?B?eXlPN0hHU3VnNkxXaTloOEhFWUMvYm9ndkRDenlWOC9CWEFyVklISFBMbVpD?=
 =?utf-8?B?bkw3b1RJTnFQS2x5Q200Yk1ubzduL2Fsdy9DY0ljNXlpcW1pWFBIT1NrSjhz?=
 =?utf-8?B?d3oxVXl2RGhDYVdwcEVHdkZMREZ3THZxUktvZzNVbUY5OXNJdW1mNWVzcUkw?=
 =?utf-8?Q?aNTpcBgLIJCyEUhd5AaKyWaTwlRAWedZC9ZFE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	QCPDRTJ29LpfesLgMhG/z1ubBukZn1efgRlKpP0UpJJhzhtdSyvTIxOkHhqvhKTmAGi/tWDciMqw1bJnV4R4XIySGBhYu7F8gfhjBy12utr+QIpSY4Uwh0S6EVBMyZXKdYRqsNrIEQEoK+cACXVVJh8Xx+09dmM/TAdbQUFD10hjmRtLBiGch7wWylvvB8DVNW8Zk4MI96V9GfHBgbveqwK9IfJKfDiB1DiOWkWhsT+1WQnihdYDSSBkA4zK0aIlpz9pxF9c2XR0xF6KT1zj7DZrDgR28F0ROasWDqn+mucxuT4liGaBTT/Im4QrZWQzUX7cXEb2BE4NMz9WIMa7Ew==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB7578.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08a3e46-b217-4094-867c-08de956a278b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 12:27:09.5268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HfaGYSK8+RsqmrpFBmYfG4wBRwi0CcEMTO527xWIHDpTfKGtRfJGvVBpXqlz55h38la9ol9jMsTiDDZ7fzxZkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDExNSBTYWx0ZWRfXzCUQ0QjiKkrN
 L9lHn0xsEKKkoiKXmYk1j8QQFikr3TcA/Jjz2wI3Pl1fwnKf6LLe5XX8w2DFJSDt/scvNR9g0hQ
 cWakny5wAqLjGecsJtxN8aXBuZEVip5T45Mz/EdIIDX4Krr7tOu7rYotiCxLErmJgHSFD4sLiXb
 rpt9dTJBUBmcBhtWJ0z7GI+SsKhIb9+SeYSQ0OiCcoI+7MKvpfjsjikRyi8DmGHsBuCgKpiA9BM
 63GFAdhHOcGupG/gsxpeEf1aHI7E1yTW6xriOQNmENOybuHYeVBhQOjrFg+2HxmoBye6xXSUDO6
 mFhyTzJ0isrwXTQcMwuuBvTb3oJHwR0CYDastR8XtyBhBnBrafrlVXqUmVcGNgezdIBlCz2YsW4
 NS8tpI4tuKpf7rr2G3KUic9fdx1Eklf9PPKDusQScqwAdT3T7Nq3oIZouqPh8nvg1YClW5iTiLz
 nh34b/daufKn51sei6w==
X-Proofpoint-GUID: qSdvgFv2ub7PAVfcjFzutfsLxbxfkvCl
X-Proofpoint-ORIG-GUID: qSdvgFv2ub7PAVfcjFzutfsLxbxfkvCl
X-Authority-Analysis: v=2.4 cv=c66bhx9l c=1 sm=1 tr=0 ts=69d649a2 cx=c_pps
 a=DW6dNcPB7Zw7F4GRSXD1iQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=tZVLdjz43cR2fSHv5-fA:22 a=8k6WQxmsAAAA:8 a=VwQbUJbxAAAA:8 a=DfNHnWVPAAAA:8
 a=pGLkceISAAAA:8 a=tXKZLL04SF5lCLriC68A:9 a=QEXdDO2ut3YA:10
 a=rjTVMONInIDnV1a_A2c_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080115

SGkgSm9zaCwKClRoYW5rcyBmb3Igc2hhcmluZyB0aGUgcGF0Y2guCgpBZnRlciByZXZpZXdpbmcg
dGhpcywgd2UgcmVhbGl6ZWQgdGhhdCB0aGUgaW5jb3JyZWN0IHN5bWxpbmsgbmFtZSB3YXMgaW50
cm9kdWNlZCBmcm9tIG91ciBzaWRlLiBTb3JyeSBmb3IgdGhpcy4KVGhpcyBmaXggY29ycmVjdGx5
IGhlbHAgdGhlIGZpcm13YXJlIHRvIGJlIGxvYWRlZCBvbiBQVEwgc3lzdGVtcy4KCldlIEFDS8Kg
dGhpcyBwYXRjaC4gUGxlYXNlIGdvIGFoZWFkIGFuZCBhY2NlcHQgaXQuCgpUaGFua3MgQEFhcm9u
IE1hCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpc2hudSBTYW5r
YXIKU3RhZmYgRW5naW5lZXIsIFNXCk1pbmF0b21pcmFpIENlbnRlciBCbGRnLCAyMUYKMy02LTEg
TWluYXRvbWlyYWksIE5pc2hpLWt1LCBZb2tvaGFtYSwgS2FuYWdhd2EKMjIwLTAwMTIgSkFQQU4K
ClNvbHV0aW9ucyBEZXZlbG9wbWVudApMZW5vdm8gSmFwYW4KCsKgdnNhbmthckBsZW5vdm8uY29t
CsKgCkxlbm92by5jb20KRmFjZWJvb2vCoHzCoEluc3RhZ3JhbcKgfMKgTGlua2VkSW7CoHzCoFRp
a1Rva8KgfMKgWMKgfMKgWW91VHViZcKgfMKgUHJpdmFjeQrCoArCoApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyb206wqBKb3NoIEJveWVyIDxqd2JveWVyQGtlcm5l
bC5vcmc+ClNlbnQ6wqAwOCBBcHJpbCAyMDI2IDIwOjUzClRvOsKgQWFyb24gTWEgPGFhcm9uLm1h
QGNhbm9uaWNhbC5jb20+OyBSaWNoaWUgcm95IEpheW1lMiA8cmpheW1lMkBsZW5vdm8uY29tPjsg
VmlzaG51IFNhbmthciA8dnNhbmthckBsZW5vdm8uY29tPjsgcmpheW1lLmpwQGdtYWlsLmNvbSA8
cmpheW1lLmpwQGdtYWlsLmNvbT47IFZpc2hudSBTYW5rYXIgPHZpc2hudW9jdkBnbWFpbC5jb20+
CkNjOsKgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZyA8bGludXgtZmlybXdhcmVAa2VybmVsLm9y
Zz4KU3ViamVjdDrCoFtFeHRlcm5hbF0gUmU6IFtQQVRDSF0gV0hFTkNFOiBGaXggSVNIIGZpcm13
YXJlIHN5bWxpbmsgcHJlZml4IGZvciBMZW5vdm8gUFRMIHN5c3RlbXMKwqAKVmlzaG51L1JpY2hp
ZSwgY2FuIHlvdSByZXZpZXcgdGhpcyBwYXRjaD8KCmpvc2gKCk9uIFdlZCwgQXByIDgsIDIwMjYg
YXQgNDoyOOKAr0FNIEFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+
IFRlc3RlZCBvbiBUaGlua1BhZCBYMSAyLWluLTEgR2VuIDExICgyMVY5U0lUMjYwKSB3aXRoIGtl
cm5lbCA3LjAtcmM2Ogo+IHJlbmFtaW5nIHRoZSBzeW1saW5rIHRvIGlzaF9wdGxfNTNjNGZmYWRf
YmMzZTI5ZjcuYmluIGxvYWRzIHRoZSBmaXJtd2FyZQo+IHN1Y2Nlc3NmdWxseSAodjUuOC4xLjc3
ODIpIGFuZCBhbGwgdGhyZWUgSElEIHNlbnNvciBodWJzIGVudW1lcmF0ZS4KPgo+IEZpeGVzOiA4
N2E3ZDNjNzJiMTkgKCJBZGQgTEVOT1ZPIElTSCBmaXJtd2FyZSB2NS44LjEuNzcyMCBmb3IgWDEg
Q2FyYm9uIChHZW4gMTQpIGFuZCBYMSAyLWluLTEgKEdlbiAxMSkiKQo+IFNpZ25lZC1vZmYtYnk6
IEFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPgo+IC0tLQo+wqAgV0hFTkNFIHwgNCAr
Ky0tCj7CoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL1dIRU5DRSBiL1dIRU5DRQo+IGluZGV4IGIyNDNmZWUzOS4uYzQ2ZGM0
MjliIDEwMDY0NAo+IC0tLSBhL1dIRU5DRQo+ICsrKyBiL1dIRU5DRQo+IEBAIC05OTI4LDkgKzk5
MjgsOSBAQCBJbmZvOiBwcm9kdWN0X2ZhbWlseSAtICJUaGlua1BhZCBYOS0xNSBHZW4gMSIKPsKg
IFZlcnNpb246IDUuOC4wLjc3MjAKPgo+wqAgRmlsZTogTEVOT1ZPL2lzaC9pc2hfcHRsX2xlbm92
b19YMV8yMDI2XzUuOC4xLjc3ODIuYmluCj4gLUxpbms6IGludGVsL2lzaC9pc2hfbG5sbV81M2M0
ZmZhZF9iYzNlMjlmNy5iaW4gLT4gLi4vLi4vTEVOT1ZPL2lzaC9pc2hfcHRsX2xlbm92b19YMV8y
MDI2XzUuOC4xLjc3ODIuYmluCj4gK0xpbms6IGludGVsL2lzaC9pc2hfcHRsXzUzYzRmZmFkX2Jj
M2UyOWY3LmJpbiAtPiAuLi8uLi9MRU5PVk8vaXNoL2lzaF9wdGxfbGVub3ZvX1gxXzIwMjZfNS44
LjEuNzc4Mi5iaW4KPsKgIEluZm86IHByb2R1Y3RfZmFtaWx5IC0gIlRoaW5rUGFkIFgxIDItaW4t
MSBHZW4gMTEiCj4gLUxpbms6IGludGVsL2lzaC9pc2hfbG5sbV81M2M0ZmZhZF83NWQ2ZWJlMi5i
aW4gLT4gLi4vLi4vTEVOT1ZPL2lzaC9pc2hfcHRsX2xlbm92b19YMV8yMDI2XzUuOC4xLjc3ODIu
YmluCj4gK0xpbms6IGludGVsL2lzaC9pc2hfcHRsXzUzYzRmZmFkXzc1ZDZlYmUyLmJpbiAtPiAu
Li8uLi9MRU5PVk8vaXNoL2lzaF9wdGxfbGVub3ZvX1gxXzIwMjZfNS44LjEuNzc4Mi5iaW4KPsKg
IEluZm86IHByb2R1Y3RfZmFtaWx5IC0gIlRoaW5rUGFkIFgxIENhcmJvbiBHZW4gMTQiCj7CoCBW
ZXJzaW9uOiA1LjguMS43NzgyCj4KPiAtLQo+IDIuNDMuMAo+
