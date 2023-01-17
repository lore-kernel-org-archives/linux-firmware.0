Return-Path: <SRS0=iHc1=5O=quicinc.com=quic_tjiang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A81C3DA78
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jan 2023 06:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD411C433F0; Tue, 17 Jan 2023 06:18:15 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFB98C433D2
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 06:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFB98C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H60kcM006036
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 06:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=oMuIP0nYckR/3XQ1pOs6F9voZD6C6rGaokU5sL8j8wo=;
 b=WavBsMMSyUK4KxdyK6PNBgzAcBwOTdlR1zy/a9U6zEORhyg3viszTFm+9milQQe3wfCG
 lGvFR0GboxcOtED/lsfKFzDXamoCj/tbatitWEuO5fS1hXzDH2TRe+qQjSaHVcz6VI9x
 yX1Dbw0PhmqgCD/5fBATtIuP2IJLbb1QlOX3zNBo8XLxNH4JAMuIxnIQaXiRUU1Pn/KR
 28hhfHBAakJNL8a7+G7VrHZznbT/x4/7oyIb62EJYj3DL/hDSjwaz0uBRC9lJvbVxzeq
 WSK0fI/b20aYvAi0WUFRCBIu2N/wICEPt/LcnN03nSZd1mIJSI4jxhQXNgL5aiNB4x01 Zw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n5nkq829b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 06:18:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaaUMJ2eMSJ/mYyXg/L6Nc60GZmdLo4/72n43Qtml5tnirdO264KXCJdcFKVsu0MkwTvNuoEEDSWKj3NPhmNQAlUlcvf7IsLgOp3zCqMv9jKWA/Pd5ODHvxaphG2pVtsh3lSFhaAVKbM5QIWxAUh/BgWUY5gf5nBgSIBDeCKu8HY4B9eqSc+KMvoPzHqVHAlUPS/9mG30dGnGaLOZFgMV+NjBkTZNDQof42Q1Ree3CRhD5jNvEW1Ylht25ykuz9MoRZKYK5OqnSfckrzjUSV8trn2GTM6oaCp9O6G/X4a0tqCPNVW0zt2cP2ChJQ0xMc8Zr131AtQIwKuFPedsalaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMuIP0nYckR/3XQ1pOs6F9voZD6C6rGaokU5sL8j8wo=;
 b=DZ+BVpmves8XEoFdneDuJdZ3urhbThkuLaOc7M8cdwHt2Oe2zzBmLoA0iBm5Vn9TlFgp+5kcPpK5SGQLf0DImukDzU2jSR4dVfTZn4kQkKI9cbM2qMK7Re7odw5eUgcIEn+KYUlA7npC3MzU7qX9qqd9c2gHlHIJDAkB5wmkfuTx7TyKWJGLGckPdsad4rJUTq4C6ccg0iJ8unLpbsuQmqYsebSSl7EZf2l3HxPNRaSpsC+ySI1m7PqyIezORYGJx3GSep+uGjjg8yGd+rEPLRym0nr+kHBomDKitJTmZ+9RbaK9znOHPafG26nmY2b3TmO4/9CX14yV1otCoiH+MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM5PR02MB3686.namprd02.prod.outlook.com (2603:10b6:4:b2::39) by
 CH0PR02MB8178.namprd02.prod.outlook.com (2603:10b6:610:ff::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Tue, 17 Jan 2023 06:18:11 +0000
Received: from DM5PR02MB3686.namprd02.prod.outlook.com
 ([fe80::e71b:4864:c415:3d1c]) by DM5PR02MB3686.namprd02.prod.outlook.com
 ([fe80::e71b:4864:c415:3d1c%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 06:18:10 +0000
From: "Tim Jiang (QUIC)" <quic_tjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Ankie Wan <alwan@qti.qualcomm.com>,
        Hailong Ouyang
	<hailongo@qti.qualcomm.com>
Subject: btqca firmware 20230117
Thread-Topic: btqca firmware 20230117
Thread-Index: AQHZKjt4aCz7JhI/J0qth13PjiX5Rg==
Date: Tue, 17 Jan 2023 06:18:10 +0000
Message-ID: 
 <DM5PR02MB36861D08E417E20C3540634AEDC69@DM5PR02MB3686.namprd02.prod.outlook.com>
References: 
 <DM5PR02MB3686017F1E5D47CDE88F9BE2ED649@DM5PR02MB3686.namprd02.prod.outlook.com>
 <DM5PR02MB3686865C387271B9EA8143D8ED689@DM5PR02MB3686.namprd02.prod.outlook.com>
 <CA+5PVA4O+xVuGC1phdRjZvM_AekeCYatMZCnYBMASZs+BrbtqA@mail.gmail.com>
In-Reply-To: 
 <CA+5PVA4O+xVuGC1phdRjZvM_AekeCYatMZCnYBMASZs+BrbtqA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR02MB3686:EE_|CH0PR02MB8178:EE_
x-ms-office365-filtering-correlation-id: f79a94b0-bbaf-46b8-40cb-08daf8529b63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VYSBCSHifzhkEqoU558R8tZ4ix2X8Q44mPGsJZGCXpoDewvEj/OhHwjOYDqo5f4CjzXiEkHOApNvGRleN8VK6kBoSlVbxJ/J25LAsDa/s2iFyiO9WgmjlQg5bq6tK+U+uC672Bme8CSQaJZ6dvVJbwIX1GhGSf9Qc3qwfzQTySdxAXYqFU7PgbcflrRYVxNjc8VeQRanP7txn2Y9OWHmYp7bPf8+XPfPM1puiXwBYw72rRgGK2gUqHylhrGi8MP0SeceARfIS0nANWTyCIuPw+J9gn4LXuQ7h9QqVa3z3BvrMqLnt0lx0mS8d2xPDOAo9LaVt5X30SBQYsGJnfhyDkKOolF9eNY7ZjHOZAXtgSuJg0m/VsMi5aOd9P6LlrQVPawoEQxv2I1wwyBve6wMVMtcW5rbcuBmAUUUFYwpZaV/smC8usw43RL4EH5aQrF1PLkOVF3Ca3zIemvvvd43vNnDA+zDZOD0ljGKib9XfLgYBW2UU4wZL9f11ytuSwUHydqQSdbFKYUbhwiu1OdweBVRkBcfRvr1LOizUn/DLnGjeDfWYMzInPZl38uMZzXucduAd+EDZnGnzBZjSCqopVbYai8Wmy7xY+jA8LrIbFAL6sutM3ULI7LMviaeahQpFDf/LIhQt8KDAetFvXK4Bp3lQ+cS3CuebVrMds3ozapsJ5V3WFrqQWkzob54MnglklGCwvxXHlnN5lJExBYnJPd3EAiIJQGJJVmwzcx7c14=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB3686.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(451199015)(83380400001)(54906003)(9686003)(966005)(71200400001)(7696005)(33656002)(55016003)(478600001)(186003)(38100700002)(38070700005)(122000001)(86362001)(2906002)(52536014)(41300700001)(107886003)(4744005)(26005)(6506007)(8676002)(7116003)(4326008)(66556008)(66446008)(64756008)(76116006)(66946007)(6916009)(66476007)(8936002)(316002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NWJXUXFOTDRrUjMrbTRTUjhURW9nUnZiRzcrMkRlMnRjSjZvRit0bjBFVm0y?=
 =?utf-8?B?elFBRldXQ0kzaklraXhobEFnR3lpeStPNjlZOE9qZzZndVl5dm0wSmhYcS9W?=
 =?utf-8?B?UXcxNkFOMEtkMWQybXVoUFljYUpHOEVOVUtNV2tua1FYVnRwNVNzeWFJT2M4?=
 =?utf-8?B?SUsvM2svdGZBeHRNNFg0dXpySGJvb2JnSEJxOU10clRQMGRqWnFES2VqTlBB?=
 =?utf-8?B?ZXdHVGovL0FncWR4OWpqOFd2b0FLZTJrdXpFVk03TWdoZG8xUnVSRXZTc1JT?=
 =?utf-8?B?Z2M5WjNxOEo1eVppaG56NHhqeSt5SGZPMmhtMCtYaXlBd2QzSVlXSnV3d0xJ?=
 =?utf-8?B?WWlzdkFEek5kOFVBZmFFMHBKN3RXSzl5MUErNHgydWdqOUVhNGFpbW40ajlB?=
 =?utf-8?B?WFRiNno5R0pYNlhOV0g5TmdrQkRKWlFQWllaMjJ6MVdUejJlMkFwTnpBK1pv?=
 =?utf-8?B?QzUyZHlsUWxDME1xZTl3VkhUVEhKdDRYdUhNWitOZ1grRTlINzhYOFluY3dS?=
 =?utf-8?B?dXFYRXJhakFTSGZnQXRxdFBzTnJ1RTFaMGVqS0lzWFhXWFhSdEszOXF4WCsw?=
 =?utf-8?B?c2ZTYmRjYmlqbGlHWTFFY1FGTHMyVU11WXFRMW5vMzRuQzlVcklLU0NVWGJP?=
 =?utf-8?B?OVdYK3lDa0liYjgxZndiZ1AxRlFhMmU2YTRXUUs4MFNWbFB2S0toOVEzcUMr?=
 =?utf-8?B?LzliQ1ZhdE15anliQzFvVkt5R0F3R0psamZZU1Q1RTZpU1Y3eWdtT2twSjBN?=
 =?utf-8?B?ZGQzVG5EOWhBckFKR2h6NWRPS3pUMXAzYVdBa1FrRU5yNk9yb2diMU1jQUQv?=
 =?utf-8?B?VFJYWkFoZUphd0Z5aHZHNlUwa3NaaTA1emRMWjluUnRoRW9QQU1qcldOSUlp?=
 =?utf-8?B?bzlTNkdLc0J6UkZnT25EQ1hBYUJaRk9kdkNab2x0YnZ6Z1JpT2N3YW9WWGRJ?=
 =?utf-8?B?L0ZVMzlWZzRkcEFjK2VLbTdmUmg5K2hnNE1JSmc2NzFTREQ3TFd3V1V0cGto?=
 =?utf-8?B?WnUxRGpnT0FOUnRTSWNjUWUrSUJ1UnhVbjJ4WlZzT3YxZzU2SUl1Q2pralI2?=
 =?utf-8?B?TUhXbHhHRFQ4SmFqYkxrRVlwaVQ1WGpDTVJJVlFFSlJmYVd2cFBGaGpWd0RX?=
 =?utf-8?B?cGNSMzI4MlhKM3I5YlIxTFlhU1F6ZXI0R0dtV05DVUU3b1N3TUZ1WS9TRTc5?=
 =?utf-8?B?OUcrMzQ1SndMQmxyeUJIVGM1QmR6NkoyYThYWml0bEx3VDM5TnJzTG5VZmZL?=
 =?utf-8?B?ZldaVVRTVktETW5QSG5vUnFscnNPbERLSmRIWjg3NzRnaXNyVVMxR3plVTZB?=
 =?utf-8?B?SDdoNlJyZ3RZOWtYQUNwSFNhK2lwenJEQmRBNmhVMElFUGVIL3lMU1ZxdHZT?=
 =?utf-8?B?aUl2RG1rZjUwVFM4TXdBQktLWGJybFNRY01VYWk0N2hrcG9xeEZpUFc3bmlP?=
 =?utf-8?B?cnFwczlNOWdhUjhBV24yQnJzT2ZXQzVSV0hmQXh5djRpL1BLVHZnRHc5cmhV?=
 =?utf-8?B?V1ZxZlV3Wkd5WjlUT3N2Q0tKL202TlFJd3N3RDVIaVRPUTRzMG5ib0dOMmEy?=
 =?utf-8?B?R0hyR1h1c1RVcVR5TnpkaFd1dzJkcXVkUnp5dW1QbEw1NGM0Vk5lN2NzNGUw?=
 =?utf-8?B?S2RWRW5rVG8xNGVJRnJWY0I4U2p3cDRJcjRkRW11QzBYZGxWUXJ6UW1maVQ1?=
 =?utf-8?B?a2hxSm1XQ1dkR2JqSnhpY20zc3lvQk5LbkFKeDNubUNtazY5SGJmbTVYbEk1?=
 =?utf-8?B?Z2k5STZ3L2c1djU1ZGFYdndid1ZQOFVnNnJaNXFQNWE5L1FHODBqVmMzMHht?=
 =?utf-8?B?TWd1RjFZNUpVeEJUZENHdmpGL2ZhRzV0ZjU0SEhEa0s2eHJtVUtEQVNwaGd0?=
 =?utf-8?B?UXdaWjRIM1RzSWZpOGo1bFVLLzFoMENSUUtURGx4VWdpYkdxTUVmMTNiaXE1?=
 =?utf-8?B?Mk5UTDBmUStOVWxMT25iUFJ4bUNycGQ4SzBJQUFPYjNLUEcwNTZMdVBvdjNS?=
 =?utf-8?B?aEl6M3p3T1I1VEpqNDNYU1B3SFJuc0lhZ3ZNdDhrSGZDU3NabXp6NEJQRjR3?=
 =?utf-8?B?TFE0NGgzcitGdm1WMlg5VUJOUFBMMDI1Q205VDRDa0g2TTFQWVNxU3FYOTAx?=
 =?utf-8?Q?cnGaQvcOd4CpiwqhH82DeFDDp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yXWYa4jnJAvbLH/0SqbIpA9I+LMN0BDNzrwT37biu0k6RGC4jzctui2q3TPl9n002ra6v+M9kOamiGpyfXa+pCO3tVGG9vVZSL0wjkYMQeWotom5uk5poemlA8Kn9nron0YZ/7ffU7u2Wi1po+angXmIo7VWd96XoaVE4u3jy4DT9zyPj+v2gl3vgVHEkpS1mZk3fMK8tcgSAZBW5196JvY6m07gh0NCMs8TmcE3k6I0WDjKoqpAZVrgH5bvS2PwIafsvzr3PsQJRN6KohBmyLvBvP5i2UEZ+XMLEZlw25YuKVchqt0EkJq0iibwKsAQmmTQjcWMFMSuhknOoxPU9ehAZ4MHtCihjmDejk4kh9NjbC1s2vZve3hvJTG5FhmZG39/EJqkxGVj+UgxTwKA09E6LW2ed1OJP+yn2ry+NBvlV4mIuPwlNLkBB47e83ttNWLVFMzykxd000Pd1TSa2iDKzzJd7O1IMRG66qXRACyAjqQyG2Lkuzyh02Yp+Aoc7LwyxTpAKRWLxW6iB18YldPYuvJIFRh5Er02+V6Nw7Z0lnc0eqEBtZM6YS/G0T9bnJ3JBBpsmI507fdjvPXOn+aecUmWThtaWyUx4N4gMEhc6YW3RFHUf9mgzHmxxuAFpaVeEjHbKfUgFykV+3py+dM4J8tfo8wVuALCxuszsbt3ullEXFI0ll0vIVST+mPX5OfEA9qTlGHRkdADHZYP/eONwkgA5PwNeziSIXgtJNhg4lUrWHE0OIMb7farnwTZPrucZJgF2usSUBYVEw3O9A==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3686.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79a94b0-bbaf-46b8-40cb-08daf8529b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 06:18:10.3701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eotrIHfkISBxTOUCJHTISNaBiDyIxAUi0l6KvrgDLngLZCsxMObEOYQSdWkK8VO31uPJVYmE0CGjTlK4t4v0mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8178
X-Proofpoint-GUID: fqU7oea5BEbFxCjo3RPih1spnwmQ74Mm
X-Proofpoint-ORIG-GUID: fqU7oea5BEbFxCjo3RPih1spnwmQ74Mm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_01,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxscore=0 adultscore=0 mlxlogscore=601 bulkscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170050

IEhpIGxpbnV4LWZpcm13YXJlIG1haW50YWluZXJzLA0KDQoNCg0KIEhlcmUncyBhIHB1bGwgcmVx
dWVzdCBmb3IgYnRxY2EgYmx1ZXRvb3RoIGRyaXZlci4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHlv
dSBoYXZlIGFueSBwcm9ibGVtcy4NCg0KDQoNCiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0DQoNCiBhMWFkMWQ1YjUwNjI2ZjJkMTI2YWRmMTk2NGNlMGU5OGNiYjhiMzlkOg0KDQog
ICAgYW1kZ3B1OiBhZGQgVkNONC4wLjQgZmlybXdhcmUgZnJvbSBhbWQtNS40DQoNCg0KIGFyZSBh
dmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQpodHRwczovL2dpdGh1Yi5jb20v
dGppYW5nMTIzNC9idGZ3DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyYmExYmVh
YWUwYzY0OWNlOGE1MGJhZWNjOGRmOWU4MWNkNTI0ZTY1Og0KDQogICAgIFFDQTogQWRkIEJsdWV0
b290aCBmaXJtd2FyZSBmb3IgUUNBMjA2Ng0K
