Return-Path: <SRS0=+zm6=WG=quicinc.com=quic_ekangupt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD763C35FFA
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Mar 2025 14:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84742C4CEE8; Wed, 19 Mar 2025 14:54:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C9C8C4CEE4
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 14:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C9C8C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDUR79021121
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 14:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3x3/tAGOAHHvzSbasSdsmuZroTA30t4FcB+Su/tt5S0=; b=SggUvsO7/9NsG8Jn
	VgJjs3JZisDeA9MOrFlYyVSPe8RtTvvg1EzqAUV5uZnYiJTKjlxZP7xCSpKXO4wH
	RjGOVOwbMSyI8tpkYpNFgMCE14Ljwj3fZl9h/+fOS+lpcm/9H8ozYtrGHJDb6yft
	4h+bRw9z6EpEz8pGAR0ygB6N5guqmzc0neiZl7MiDg656leN3HM97vI4OSZsUYEM
	8EG7vXPG7OcuFneERWwGgdRio/fmDi/AfErQrK+3yGEBiucLWNIi2ZuEaxD3bELn
	D0xpxbssDH4s34DT7XDvsfe2cAf2YL5pYTGWfB3bT4jvru9AQlipcj+vxIv/q1/x
	7E3+cg==
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013078.outbound.protection.outlook.com [40.93.1.78])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbnpeu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 14:54:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTeYxS6IfE9JWCwphDBamtDvYNXTPZpOqhZUWF4xwssJIR/i2tCxgWaBahhx3v19ildg5WTDDuIxPNByDaAkvnORvchTJfHnEmS7t6yGU/SV8IJrFh9Ixb5WwEBSBIoZ6r9vR32z/LyfiQ/pffIfwRhaOla8kcv1XA6QS6MdNnnjyipUyYuqWiCo2aNCaY6tFS7LCeva/MVaNFU/mcn37DTuzr8UdI4LiPDzg34+ctW/JQn8uxL8JtzlgN+5gu98hOg6f1Wo/maHC1joFhItja4mIb0FnkM8YprOWDa9MpODhrEWnfEeGiVwtRvn423C4OScQTLegpez7vR2wtuymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x3/tAGOAHHvzSbasSdsmuZroTA30t4FcB+Su/tt5S0=;
 b=IlfG56E0fxQtazIKhUMuGuxNWSusZPmzMJEXipe1wY5GJdkx2MgnkNTjV9qSNnqbTya8ziZheQ73ex4jxkuk77ZF4UuC9C1a5yBIV4ROuEswyABsbr5aOKyZLc4BYzSU23LjTIp5udeAL/E46scTLt2D29Rq2nKoTw/Cunu/WyEIjF0Cpq0IsWbqTpc/OKl/8JFj/IrLk+JeYyQ5eDXkSGKjWsLdPaCi3WzQqS0PziBCDg/eDeSok0XUGBbBBiZ4p3GM/T8fS9yLeUw60FB7suYg+H9RQ68rVXDguPG6D78MKAWcgeuUHP5/FybWjmsrNPa9+FZzGCy6TiXkBTFNLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8295.namprd02.prod.outlook.com (2603:10b6:5:314::7) by
 IA1PR02MB9136.namprd02.prod.outlook.com (2603:10b6:208:42c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 14:54:36 +0000
Received: from DM8PR02MB8295.namprd02.prod.outlook.com
 ([fe80::4f71:f1:2945:f8a4]) by DM8PR02MB8295.namprd02.prod.outlook.com
 ([fe80::4f71:f1:2945:f8a4%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 14:54:36 +0000
From: "Ekansh Gupta (QUIC)" <quic_ekangupt@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Ekansh Gupta
 (QUIC)" <quic_ekangupt@quicinc.com>
Subject: RE: qcom: Add DSP firmware for Qualcomm QCS8300 platform
Thread-Topic: qcom: Add DSP firmware for Qualcomm QCS8300 platform
Thread-Index: AQHbmMV+xarjxR6nHUmd4u0hGIaF5rN6i88g
Date: Wed, 19 Mar 2025 14:54:36 +0000
Message-ID:
 <DM8PR02MB829581B2846F4FC48F23F4AAE5D92@DM8PR02MB8295.namprd02.prod.outlook.com>
References: <20250319114242.7192EAE2@hu-devc-hyd-u22-c.qualcomm.com>
 <qf52acj3rhmztyhtmvxejzzz263bznwvvbs7dqm4yytw3mduif@yl4ocbykomb6>
In-Reply-To: <qf52acj3rhmztyhtmvxejzzz263bznwvvbs7dqm4yytw3mduif@yl4ocbykomb6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB8295:EE_|IA1PR02MB9136:EE_
x-ms-office365-filtering-correlation-id: c4817106-14d2-46d6-b3fa-08dd66f5f792
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kDhcOTd2eY7TtFnjXSmKIISYC6lA10R64GmjiUdru1wNSORE36PLe4DoZJsp?=
 =?us-ascii?Q?+N8zjckBFDTQ2ElEHd+7Xc9pu4zKUN2PynNwGzidJUVKcc8LgDTxkrC5KkMS?=
 =?us-ascii?Q?HVpmMuZ7lHktMJMI2q4DG6jWSHlZvBe54mdcw5/mJB/QO5BEtca7tmAOUJDp?=
 =?us-ascii?Q?JGc3Rj79eLti4GYGNcTC9h8mkZKzln2O611YtZ2mPXZpIi/vk29a6e4FOPyz?=
 =?us-ascii?Q?oS8xLxYH1TF/scKCaTMeInfNgH3YaztkS4mYPn9uL+nvQgkVaEft9iUotflu?=
 =?us-ascii?Q?RJ9/BrC4LFfCdWAU99/MTBcRum/WODZXQCzXR7rq8FLyqZBnVuzw3Px3dadL?=
 =?us-ascii?Q?y89vB3YAGdo93R5KYQIksQDRR9+69I50FrAivymDbUvvrZgXBRDIQlQK1unt?=
 =?us-ascii?Q?4xZ9b35D11uS5SML9fK4KyQE1OupjURXW0Utkdzckc6TL0ZVysleqdLu3lgM?=
 =?us-ascii?Q?iVp5Ctm2p4E+SpCfh5f/3cvvUfRMXoAUnxmpYHBTyLYgfuQRpPxn0bQTMmO8?=
 =?us-ascii?Q?JZzGcrAc1hqqoi3pqPFJI3wyeBZOp8emFeXXQyY3VnLNqfQCG50ZyOxiq7Ae?=
 =?us-ascii?Q?AQN3aUsHOYEMlrR4jBj9rBgGMPHjQTVJZwpLXTw2Y1BqIrE2ECjLQykAv6WK?=
 =?us-ascii?Q?/MIE06GrpAjN2XqsL9NUvdI1Q73etdHhU4Qj7h716nYw1KGdOYn1ns8JPmUb?=
 =?us-ascii?Q?nBcwx+PR6qzGSsCn/GmzvtGxrd+eknY+RmIh2wDiUZhqmlYyD3VQ9Drq4k7P?=
 =?us-ascii?Q?7XIxsCWdMvuSm41+KgCMKQ7LzGock3g/AbAz7+mmnjs0XLy3zv7DtVG+4DfS?=
 =?us-ascii?Q?Sxrm8zZkzG9W4Gq0xOj2glMIzCoD2IHVG9QrpUvX049VB4+8/5toBDMwyHvi?=
 =?us-ascii?Q?Gy+GYUSykk9zrfXzi4UmBYh3kiybjSlgvUdGjRu98MvTS4phN484Yn6Xsw8K?=
 =?us-ascii?Q?cb2iBZK1R4VrsUqOCwFUgfStyZ8fiSMwXI5sA5cJX1pSKLYXyzGXidh8kanD?=
 =?us-ascii?Q?ca+y4zvRQnrkjEHHdUUdx+Ze3PqV+PAxX+59WC6bnYmXyb0s9PnGGk0HPqZW?=
 =?us-ascii?Q?cI4fFhg8c3xbz0DmmOcoLQ9B4qgGTmsFyvhPtQYXCAwLfbMlHPHngIU2OhTx?=
 =?us-ascii?Q?EwJRGLPSbrnGGk3nmgEq/puMrGZZm15Bdxd0KVFptrZqxUHvBaN3UqK9GwRd?=
 =?us-ascii?Q?9PPHz+EgTR5Wz9sDn8Ka45Fb4Y8MpPaiPEdE1Pb71OenpPzciR4oKPMsI75W?=
 =?us-ascii?Q?4/y3GMxWJwGGFlFrlsdUmJne/cDv05TVGaF4aJ/4GMJlyEmcZlpH/v3aftIB?=
 =?us-ascii?Q?4TrmI15/PvEGl+OjLSx/la4HcQDuR1jVghNwe1Su+6A28RyXsqSGFb0gQwrk?=
 =?us-ascii?Q?SA31xOEvsYOyc1wAfsf0LADgHOiQPeqbMABk5P6DsC0en65t2g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8295.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZgA3M8HnkPlfh2/SyZSEKBe6f8kB0npI67jaG3IfaXxC9uhqnCbllNs6PoMg?=
 =?us-ascii?Q?QdYmKqSD+s7kKnbY+9yo3VJDMAzwbADOWiZV1cwyz5d69b6wsqsPWV8PL1AG?=
 =?us-ascii?Q?fa6MxkLE5z5tQR5aI9NN2w2PBuUpK9TentVHUFflCmMVDtSF0jHarOEjd9PZ?=
 =?us-ascii?Q?Coi8VITTVFKfLRpYW+HMn02TlKg8Expj+hc6KWvzYh0q5L4diGkR0Pjrc9nG?=
 =?us-ascii?Q?wea9QcUn9E/ftJvESCfPLPRU9r8r3kSp/ZGuuZRzEfM85DDcVBII7K+EAlyO?=
 =?us-ascii?Q?f1NaYUIYgJJINEejq6ZYSpe+Nuf67pF5IOETbhRzKDamTBm9MOGT2bnIMBKT?=
 =?us-ascii?Q?si8gKSVELKtpnaA17UJSs64oOxkHBqBT6rAKYk2cunGxCOlZZny7wSF/Ge0s?=
 =?us-ascii?Q?sjqnVWPraNZY4mE36pgvPRZ5PBLtyZfEhHVRo5rHVKkZ+dkeOtdlQ1qpedBW?=
 =?us-ascii?Q?VOz1+xvga0kAe9ah86AiJizRyE3V146IAb/3NjVblyHsg2pPY20vN0WxNlF1?=
 =?us-ascii?Q?Pw3sM4zxvzYUpNyKva1UDn1X257uDeTCmSTH+0TEYUV3rRFoQha7rNLVQSpY?=
 =?us-ascii?Q?8ivVjyyNzo8gv+EgLIcuEjHPi/CbueB4hZ06i7qIVhSD8pWkuYycWOE43+mp?=
 =?us-ascii?Q?QLfbCvnt+GtTv6Jz3ZsZJVep8a7qtiTJMcHBG+Bh1v685FgDJkHvveM3vJ3S?=
 =?us-ascii?Q?mfJ/yJxPgeO8gyyjA371px9C9ICEOJci9JdWT6xdLjivFnarBERdQ5PVJTxm?=
 =?us-ascii?Q?IVyEUY81JDHwKDUJnkFdo2vpn55q1Q/+7ylfNXUJUlU6Iglby/ZhVI5oGr1S?=
 =?us-ascii?Q?omBdXv9xGr76mEe4IqOBbERBRVv+HpaVwjYp/IbDh7StTvUK/H007QLXdtDb?=
 =?us-ascii?Q?rESfjgUgnS45hEcChVxCombd7ngssQCzeT67zjlw8tqmoZNOYXZN/88K2XeM?=
 =?us-ascii?Q?RJrKCH+e7In7kA1uVHoK1uld3Qot7y790F1f7ga1je4Cxc/KB6FZjvZMm7sz?=
 =?us-ascii?Q?gbr0Zs8fE8jq46VLFM4hkDmKuVmqBiU1kbob5X2WxMg1jrERIzP+obkGCPUL?=
 =?us-ascii?Q?AaO+ptiy8JgyFDb6cGHl07zeefJpsK3hvJqEI4e9U28R4GTWSv2LIfI5mgaz?=
 =?us-ascii?Q?YECWMPfzxxcthlUb0lL6VtFAwLUXL308ua13l8pCZ01zXQvjDlRJBTj3nARs?=
 =?us-ascii?Q?36UW7s6mk1QxdscQ1WR7Sxhpxf48BJw0j7FkD4ZY0NSg9J9ezGJpyrgKetA7?=
 =?us-ascii?Q?JaxNaG+vKvDQgZCqjek+uTJ4ldRQxBJLl6Ggi/N+mJtLfyRVWWa5UX0FkzaD?=
 =?us-ascii?Q?H253klCLFZ1xNW5dTtppcuIA2a7bwfaV0GrhKr4shdtiTK2AwjM5NRVpQJL5?=
 =?us-ascii?Q?HGWNzlVAsjXMOhJ/PxLJLceGd/Fq3p8jvKOVt6cwTl5RnNsgy4nN5rX3VBXd?=
 =?us-ascii?Q?sSlOUDNrqxcp5MpN1ZqNF/jYTzjw6hsqbYJHfCCiZ0RwFzlsqqEo4W9MM3CG?=
 =?us-ascii?Q?a5t43UPPbyPAnqm29zIuwSNxFRQWoFHk+bIbs3DsXiokF1BbTiQReoxNiA2q?=
 =?us-ascii?Q?G/ZdtE9VPqlyRgPLJEgw9eM3FeL47XcYAedBHS+q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SW+gNz7YoFaCFzLYtyHx6qeevYXd23YGEqGfVl8hudpFHPAMcTeSZSc2cjvaFRM4rOieAl7uci1BPAwAFqCD5lgKzptDoXRBYr5ghAgCN05KagsaFhmVVpH7HDlTV5haNnWvr+9m5tfAWSOzXHV8BdOYIgMH2ybhGaLXRaegE2s6vySVRdVFavfvgetuuvmIgQ5jVWB1zVPRa68Ec9L4hLP4vQuD6JDaDMqBhp8IDEHO16xTTEqwiN6PSWk16NzMhdH4gE8fqydTdGAAyKjq4NTrhB+pZPCcEdMw1mh7o+5rt2hIl47xB9qzBwQRbc/SokJCZcYsWnZK2MtNVV6B7SsqF89G5CUHaddCDzwx5eg8ypGG0QYp1ZZnCxh/7fI2TA44BXw4hS4akudVnOzPNLoEwqbH2OGp68D2zvT/y3n7SRym8QHNj3XEWhJWUHn6KMZdfaKUCVV74DY3Er1FZcKYNSSQqUjliQBUFzll+0ev5isRJDgWFn4dolI3/H1tGSZEBHRJgHldg1QkEd3dJMAm4JrjWMtq7Kh2cpYLyrGqMKDtEE+V4lkbZC2dyv76eXpPfung26FjuhgdVcprclcUv4D07sQln6ydpxu2Ko/9Q8iyzba+XdeSlwWftols
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8295.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4817106-14d2-46d6-b3fa-08dd66f5f792
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 14:54:36.2808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7+SxdtIF9cb+5ovdN9J2bbY5L0cXQohExxHVZ8g1Q2ZHr189cEs2mtNW6tMt7ft5YSZL9H8bMreUu8mCx33qYI5t8tPyYZr7oR+xe5EwJvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9136
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67dadab2 cx=c_pps a=l9cCpZ6fIogKje1+qubiRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8 a=sVfnBozzeAjatfXXt_4A:9 a=CjuIK1q_8ugA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Xdl-OtMjgoxehJR__AuV9clWmxWumimB
X-Proofpoint-GUID: Xdl-OtMjgoxehJR__AuV9clWmxWumimB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_05,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=836
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190101

On 3/19/2025 8:17 PM, Ekansh Gupta wrote:
>> The following changes since commit 0c5a986c6bd6b8cf382379c4f9c844867251b=
afa:
>>
>>   qcom: Add DSP firmware for QCS8300 platform (2025-03-19 15:48:48
>> +0530)
>>
>> are available in the Git repository at:
>>
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwar
>> e.git
>>
>> for you to fetch changes up to 0c5a986c6bd6b8cf382379c4f9c844867251bafa:
> No, they are not. Please review your messages before sending or open a me=
rge request at gitlab.
I didn't mean to send this out. I was planning to upload firmware here: htt=
ps://git.codelinaro.org/clo/linux-kernel/linux-firmware

and send a PR to linux-firmware.

Please ignore this. Apologies for the confusion.

>
>>   qcom: Add DSP firmware for QCS8300 platform (2025-03-19 15:48:48
>> +0530)
>>
>> ----------------------------------------------------------------
> --
> With best wishes
> Dmitry
