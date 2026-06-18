Return-Path: <SRS0=YjJv=EO=qti.qualcomm.com=skatakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC33CD98F2
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Jun 2026 11:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E6EE1F00A3A; Thu, 18 Jun 2026 11:07:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781780872;
	b=Ele16psUbwv6+2L/NRl8/pJPrxnEwX5lf2PkoX2udMN/yWJF7dmjzDeNBwt1MInOjbwq
	 TYlZB89bc1nP+pceX41JhK5CCyepy5f6wy2DrKjUTQkaYp0lh7idi1+K9K85CI9wGbbsm
	 XGDDxCpO4aRubuSsE/NeNTr3lAfgTubFyFvbn65+BFV4QIAU8skkCKfUY8WAazFgDfKv6
	 6hnBpQ1HnchUAS9MJi0k19HF78GNw2fWb4fKN5DjBlUXnA+csVCXpNcaXKXhgZVIxmlXW
	 9RrWc0XEc5+QKAlIZBPeXfU7VKKz6CYV3WNm1nk9k9KdiGz7kJ6BrZRLDSOul5MTO7g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781780872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 List-Id:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lfSHzFaz3AC0goayShb8MSx2uS2dkOOStCiCIVdpuaY=;
	b=r4WlqdGRTkMuXDsTlVhBzDkZvTzDTnvIt4lh4ipFTbkTrjBOrzBWLZ+yQzNcCvn17Vym
	 ylZ+2Di5RGUF6xKZuuLo9iInzTlYCRVagnL83++S8dvmV86CZujfOPsa0EXlPPy7b9/bb
	 1a8CiTYobXhWK54fgQIqpkMIggT9TUgSy0nhZANEbkwiQX9J8OJF9WePtSPUA85+vHhRo
	 rE99asKSe1uTJaQ2GXo4gJS3aHYQRYaLKVpG0OSF/5EEvqPgMyZyt5sPdBXCh9yTs6U8m
	 qim34XFQ8qRlNaerrjO/GogC4WImanrkmYStr3EQ5JEilGR3FGtX7YgpCUjeoCeGY8w==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdFbi327;
	dmarc=pass header.from=qti.qualcomm.com;
	spf=pass smtp.mailfrom=qti.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A84FE1F000E9
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 11:07:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bdFbi327
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A84FE1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAtTZE1516048
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 11:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=lfSHzFaz3AC0goayShb8MSx2uS2dkOOStCiCIVdpuaY=; b=bd
	Fbi3270sXX4o8QWiO357pFG3167JXPF+2eJMzUnXBv2JWwWKt81MJr9R6+lyZLjb
	z3MUAuxcoRn46dOH1hhuhgjf2/ux3xT/ynIlD7zkNEHaexV3EgdaM1N0UlxwScD/
	2sbJssvbbT5yPCUFZLPf0ThW9SkI7UadyCXwGgmQKYrg1eGY1aZmMspcNv0OBOUu
	0QeBg+kEIXgU7bT6u4tqbjm+7wsL3GP1nD8eZuI9TG57XRKkxtNp+MG8s8uPzbHd
	c6dCVtJA8D5Y3tQOtmCR4s0w7k2HppZW7oW5sSFQLnRHpoc83PZf8UBsOkbrv2nw
	R6czdli1rVwNjZ1lAuzQ==
Received: from ds2pr08cu001.outbound.protection.outlook.com (mail-ds2pr08cu00106.outbound.protection.outlook.com [40.93.13.54])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a33b1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Jun 2026 11:07:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+34y6/s0p9bkIpmIbcn7pHU8M+Lj3/x8jus/8zzj0FFPm4J4pebs5YFItUP8OrorMzzZS71sE7yB26KMnW0y+PVaTONIJPfYeSbVzN+vSV7gmDCs5KLZwW+GOM+bJWUh6E31ovXzjvPTqPoIobZ83QQwgkpdulAXIGXPsK+XUmyrd91ml0WyzUoOFwigJZyp2hC+2eFnFGUgG+8pcO+8GyZpcF8gJVYCpOn6YMomVSVhzIC6/JHrGg7KdU6xNG9EidvrhRvDAq4VpaleizhgjyZxTP6hShcR/YNXy+YdoGp7EKCzDWQcy2TD7GgciKQNOW0JrHFaJE/aU3nZGn6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfSHzFaz3AC0goayShb8MSx2uS2dkOOStCiCIVdpuaY=;
 b=v03tsDVDDU8mM/fNwTIIc9IriT/RmR/uQ3KPZyPBCw7OlIFgRD5z5cKM9SpuSEU8HawCLP7Tlf72tGQR/QR8rGtrB3ClP/vNafVg+eY3tMxg/CV0jvHn7lAs+MjJHh6HShWmXNgX6W+8bGdvfNCjvPAFRBeTqJd3ac92Yc/JU8ar5g1LTwUFcwBHEMUYkvSjXQ1qa5sSS2guTW/4YjjTKZRBjCQVej3qJNSdpZ/eZlOWaik0I4Tfhhfc0ZjaJyuLvRkDRJ8ojDbJ7X+stRyHLi6lHZFlfjMT100uxgCKZ2Ymw2lP2b6gZY1ypqHp7TrD3JICHt95gm4yCa1G6X/INw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CO1PR02MB8569.namprd02.prod.outlook.com (2603:10b6:303:159::13)
 by LV3PR02MB10691.namprd02.prod.outlook.com (2603:10b6:408:28e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 11:07:47 +0000
Received: from CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612]) by CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612%4]) with mapi id 15.21.0113.015; Thu, 18 Jun 2026
 11:07:47 +0000
From: Srikanth Katakam <skatakam@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi
	<raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>
Subject: qcom: Add qdsp6sw firmware for shikra platform 
Thread-Topic: qcom: Add qdsp6sw firmware for shikra platform 
Thread-Index: Adz/ErBcuMJebC9+R2mv6Mqx/o+p1A==
Date: Thu, 18 Jun 2026 11:07:47 +0000
Message-ID:
 <CO1PR02MB8569A2D4E39BAF76305DCFB3F9E32@CO1PR02MB8569.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR02MB8569:EE_|LV3PR02MB10691:EE_
x-ms-office365-filtering-correlation-id: d2eefff9-8667-4bb3-667d-08decd29d477
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|18002099003|56012099006|8096899003|11063799006;
x-microsoft-antispam-message-info:
 YL6GAPcrIeEcuSDPm8zbJ0IF3yuHPw6TlAUro6cR10zCwbRU9ubh0xUskExaPnBC2ffCKDFWorEm3rxEeZPjE7UcyCwihl+zzJVmomHxiNpUuSJ4UmJYWPNjoqs7drir4gQ1sWvV+SR278+WTXE6jkjBlreXoZGTffwLGX5oMqrjSW6wdKMijG0DSs3EULscvQ1S3miCoxlhO4dPkcITcCUe2Qdv/4EwE6sPpBalp+7k5m5tHI1GfWmbCqvNxLEmEWXhLDjCdT98v6c3IO0WwTy6iisGqpt51h26PrRG7rnI+x5jfCznWWss3MKAOOzPPyJvH3UYmGpn54lMoSaimJ3qmt110ZRADeQgEBuhqm9D/Fq1Ob/1Sm9+R+iR5sTqm+YoIg+vMVTsPwvhiW2z1GzJBxEoOi/A/lswJSjiYiM294n0hKqtWWdVDwZy1oV1mcUo7eKOQDkIPo+BW9GlXpmt/0EEoTE2sJNC4ONl/tD7KqvgxflPxzEqJNquh/4i7KJ/v+i09vKzgXrdKReFyLLOM9Ac/0oEex6kQjNRiQjGk+CdWtWM2Mumyf8aBJelHhWQK8Mk0+oLGb0F32AVkLkygxWVABFZE5KicUEVKuiFR+PRRaeTt5uRR58CrLCt4aLjGj+Xvv5BOmkBJw/tIxSQqMndLvaXbOqEmt3Wz6dBFHlGOoZpebfMEh0h4QTwEwTxQBRffPfhAdb8vxpvft2I8+fbrvNiodEm//m26Chk6HEHmKZMIpZiKlyoRvnv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR02MB8569.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(18002099003)(56012099006)(8096899003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hUHD2Jl5jAn8tDNB5Zzw1FZQEkIsdaQvnv2kzA/6DCaizXeQpVzpJq4MyozA?=
 =?us-ascii?Q?yVeP58qIx2j6iPXnPx66gXZ3iHZMh59V7ZNmWrkUTq2BrGo88987QeSaVoIX?=
 =?us-ascii?Q?c7oO1kowl2fegU0oBxxgMHOJWd/cAVpscc0AXOrWw39rgtq/gb3oE35f6/Pv?=
 =?us-ascii?Q?CvA2vNAg3KwDrwGYo1jfYlPd7FZahulkkBHa8kKXuOQFza5AeA5kq2Y9Uivk?=
 =?us-ascii?Q?/RlGLcSknVx49xQ+FAyxBiSYsuUMCjRRkHNpish8Sy1c967FQc7oaaDQtyec?=
 =?us-ascii?Q?IU377S1W5HZBCJMVY/ZCh7+xMJwsNAvKbn8N5CYPbwyJR5RicJ3Jm8qI43Gf?=
 =?us-ascii?Q?eDwlJOu3qznGnc4NTj0CVimbeJ8Q9muRLMeg4bLsypUD6wcXIs7XBIIyckqa?=
 =?us-ascii?Q?+N6vPSiPluk+HfdUHZzIMz1L/JMIhFY++EaJixSqMjTuFkxe/2hM6kv38zNg?=
 =?us-ascii?Q?5xMbhI0BNqzgrW6ilslmdIiHY9EImvqkbF8a8wxzfjb330DEo9CoDLhehVtI?=
 =?us-ascii?Q?lWCxzFhBY549hVQSbEpPXhFs5+mWmMUgOBL+B7kr2ac/G7bGLf7Ycefxtcwp?=
 =?us-ascii?Q?uQmtWNwn5t4wQZY7hHNyz/ONhsaIFq/5PTFezC57YZm5SZlphc/qPIhTWQuo?=
 =?us-ascii?Q?anHcX6jS+Vh5k748KvCLwOO9l6EY7kUVj0dLBYANimh0fLtmpzI7AJNaIJTq?=
 =?us-ascii?Q?Y2ugJb7v8ZxucKbeRXKZ0fPeD55wrQdlwdyH71/pLZgPZSr9/QT6UwPkGxhd?=
 =?us-ascii?Q?RMYB5SZ5nflD8VblaRbDVLDgJ+rfSkuVI0/G9gtjK2CFHhCDMouAu9XzI9Xa?=
 =?us-ascii?Q?Allbw4sUTYg/IFeq2S3vGx5FzhLC5Uyb8vvyUZdTZPfbmiyB5xfVVCzSQ8ZG?=
 =?us-ascii?Q?/WnQGWp8gWim3Sa5GcL5b4LKfPWJeUh5pYkkOEQjxjuB6Iw/x6sUHiyTv5tt?=
 =?us-ascii?Q?1l7hJow851ADgDBY/ajN3GJZTun7eVrkcgQDP8iTw2H8AlAkJ8ODVijSDkCP?=
 =?us-ascii?Q?igq08J1L4IjCn27QqeEss/ynVTQKKMBLnGerjdDVZA7kaufRm6ubJ/muy0Ym?=
 =?us-ascii?Q?NkdinOYtaMYnW2lktGTmL3HW+XpYoq6fWET5dsdNh+K81NYe9NrJbyZErJxf?=
 =?us-ascii?Q?h1LHBhgLTH4kjAOY0/ALLKHUflD+L8PnxzVDv6yJewOCG60vQegfcqcGl8I8?=
 =?us-ascii?Q?N0s+G4OosSHi60XfBbUm6B19oBvgztH5Xiu5+qEvKRVXfVJ9YLXFxInfTOqh?=
 =?us-ascii?Q?IEb7uRS7omg49ecsyO3OLTZhZSbXKeobDZ7qz7v5HMFTLCKxU9TepW1cyy7u?=
 =?us-ascii?Q?+jNChfo9itFsy7cMbTZBKqJx2skFTdA5iFwewyZzdND7SzBkV95cJvPLji/0?=
 =?us-ascii?Q?+p1q8GmCmhy4leUoqb42lUfWV07lsr77C1etRkAoStW7EJTL+km43F9dzvmE?=
 =?us-ascii?Q?Z4kUH72yzZioRqR7rqiqyFGXYoC9nIBoznGq6lAlaUjXicb6IV3U4HkGpsG9?=
 =?us-ascii?Q?d1fF11VqS/850vcXaTCAGwZJD4T0bUX2VIhsNS4qwCAsvPSvNa2r9PoiE45Y?=
 =?us-ascii?Q?JOj/2vo7duuLZoy6EyofXu14xS1L1dRqQSSrZ1T2jMod4DXlF4OiZOJd82d/?=
 =?us-ascii?Q?+735S2mGXLWyE9usOHYVlf8i5jhPl9KcHjZul75Tv4OuNlS2s2AkkMGC9RgP?=
 =?us-ascii?Q?mGi6IUmdAidFyfk3FI3PB+nz2A/ky0Y1f9/KcXMdaSEqbBczuLWDMYIZuJ5n?=
 =?us-ascii?Q?tMHxK1Jcpw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR02MB8569A2D4E39BAF76305DCFB3F9E32CO1PR02MB8569namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Z9wVGd00gmymC858l1qzASYg4/qXEUKqGEBVEOFkzM5ASS3GPnXxbi0MFoYW8yHIZq0iGDEtj7JCAveugLYro5SuTwncfLRlu4HIHvqmjiXmp+WaV2JNy4ojnZd/+IpZy7YgHJvT8qncSkP/B/nEdH4AY1i+CSjTnuI2yLZKr7ndtqWCBALjnusSKgLrvO8zTDXGZyu4fIVW8AaY7puCFyR08TSvVMeKPLQ12aWOO1yyVIAjRE7uWMOTpq75Gy/mrGtYC4xC/i3SqxOZnkU+ifrmB9BRLuMlTCCpeUxJ1qN0lgFYHYLSVSJlZk5xwxnO6ykEZEfGhVwklBmtjpcTMA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6SP3NT9Q00s8I7kweyUQyKlZW47vJnZEs0fX1GEZaYX4x2okQeyxwgOeH8rlVZrbG2JM+AQZBM4iv2hIObWLOH9h5TU+Zmune0uc5jOrElVhUkXxTThfCe4zAkBBBqNBZsNqZjtDuhNpz7stLRhUn0Tye3Am1QW7u7D5Yp8O5X8hOv8k5zgmJlU5ygCv/GPKd6iOM42oGjE51H8BB4JW3VxKdJREFmKdNxuGcW/B/S2TR67XUsewcJmsW3+gpNC6okUIdCugorwz7hkUaCR+aNNYkpukkBjdy3Az1SExBnI6xgOvjYeSOUnxEDOdGYEDocdJiQhuobHBkJ0pMNSxofpR78k8pLiWqsIdY4/g2OzeZ3M3lAglcwHh49ZMv2Jit1920HpZqkbIIwIQqFXJF8tyl63IFki8nQg6f1GizqPGHPSho7FmU2/yIe+pwTgqVcqR93HLpjfO4Uk0XbZomLmLMQU/OVhXObuc8XJy+n6f/uSEvLkN1Yt1UNSpqelKkBztztLUIjryymIfAzV2OCa+aSLPEDkWNQKwdNEaxqd5h4LqTJuEMi/OYJAEuwzknzlQXHXeibqxPuezKUtYUf0G/ef5eUh0aS5qHjaMJkPPZwRsK39nb4EF4Oy0bph2
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8569.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2eefff9-8667-4bb3-667d-08decd29d477
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2026 11:07:47.4728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqB599rYUsSs8C2TC3glWboDcdfXRZITknClQlK+8cBnywVMnmufmqy967PyMKQAUrA6QcFSbiS1mBRPhuRdNxYs2j2IGUUzPEji9OFeOe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10691
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33d186 cx=c_pps
 a=GoGi1iBRA8+OE3v1NGiPow==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=ERarx-68r2MmJZibShQA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=RlKo_pU38nH9fgdjplwA:9 a=Dx0hQsT9L79GQD-B:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwMyBTYWx0ZWRfX8Fxg9IyBhjOh
 vsqzMjpPrVmSY2AMmI6hI4FRgzrW9PdpbaRzchBDSFVSdfkqxDnaQLfIYL9FrLY7Sz5Kp3KSIQA
 83mrANMM80f4Xv0EZDvsgeS4008RvKA=
X-Proofpoint-GUID: nbsb5GPkalTxZme7C6heYqL87r_gsd4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwMyBTYWx0ZWRfX3cSh4ovEpZ+L
 DBZCXsrPuW6Unt6EdKW89ERaAQE84Sun4ctuAuiPlsHd79BQpeZ12zqK9WVGzRMUNe7+VfFXhqZ
 VMg3bedD3prSIjn34ydwDNxl7ngxMGzfcgey/cOU4wRdL10vzSj7OE/grUiGGJethz9JhjkOouY
 wuO06PX6/heU8Qa58I+nKw7NxC+ZrwR6L1S/ng7CR9YGbFTeJ4ECzuAL6PlfiAzG7NJpJlCiV7J
 aINBSyHO52QHYkEbKbjFxy/Frzz38MfUn0BPG58hjXS5Q/cxbq21n8gG5TqqYMT3vhoTghYqcXq
 tBXS7w5h81ms2bbRUplSrg0NKnPDcZJJ/iGX5DzJ+waiedzBr3lChkhv7lrYUOjqo8HsM43xnZ6
 r67lsdapaPtUEgceadia3zKJqjD5YncOfwO5ghJtaZdECkrIqebVqfu2MdYt7CiuriD3JFCwS82
 uR3FvmDOhCzECxHel6Q==
X-Proofpoint-ORIG-GUID: nbsb5GPkalTxZme7C6heYqL87r_gsd4q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180103

--_000_CO1PR02MB8569A2D4E39BAF76305DCFB3F9E32CO1PR02MB8569namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25=
:

  Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +00=
00)

are available in the git repository at:

  CodeLinaro / linux-kernel / linux-firmware * GitLab<https://git.codelinar=
o.org/clo/linux-kernel/linux-firmware.git> modem-fw-shikra3

for you to fetch changes up to 82532137f255131a68aedcc93dbf07011b47a5d1:

  qcom: Add qdsp6sw firmware for shikra platform (2026-06-18 16:28:43 +0530=
)

----------------------------------------------------------------
Srikanth Katakam (1):
      qcom: Add qdsp6sw firmware for shikra platform

WHENCE                      |   2 ++
qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -> 5709176 bytes
2 files changed, 2 insertions(+)
create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn


--_000_CO1PR02MB8569A2D4E39BAF76305DCFB3F9E32CO1PR02MB8569namp_
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
	{font-family:"Angsana New";
	panose-1:2 2 6 3 5 4 5 2 3 4;}
@font-face
	{font-family:"Cordia New";
	panose-1:2 11 3 4 2 2 2 2 2 4;}
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
<p class=3D"MsoNormal"><br>
<br>
The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25=
:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; Merge branch 'robot/pr-0-1781081510' into 'ma=
in' (2026-06-10 10:48:39 +0000)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">are available in the git repository at:<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"https://git.codelinaro.org/clo/lin=
ux-kernel/linux-firmware.git" target=3D"_blank" title=3D"https://git.codeli=
naro.org/clo/linux-kernel/linux-firmware.git">
CodeLinaro / linux-kernel / linux-firmware &middot; GitLab</a> modem-fw-shi=
kra3<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to 82532137f255131a68aed=
cc93dbf07011b47a5d1:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; qcom: Add qdsp6sw firmware for shikra platfor=
m (2026-06-18 16:28:43 +0530)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">----------------------------------------------------=
------------<br>
Srikanth Katakam (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qcom: Add qdsp6sw firmware for shikra platfo=
rm<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp;&nbsp; 2 ++<br>
qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -&gt; 5709176 bytes<br>
2 files changed, 2 insertions(+)<br>
create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CO1PR02MB8569A2D4E39BAF76305DCFB3F9E32CO1PR02MB8569namp_--
