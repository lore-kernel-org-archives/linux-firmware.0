Return-Path: <SRS0=eQpD=EP=qti.qualcomm.com=skatakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADF7CD4F26
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 12:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 958BB1F00A3A; Fri, 19 Jun 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781871444;
	b=OWlGfrZtqk2Zpf0ofDI2gsu5PdbzMdjkF12sioAI4ec3hNTgHpPt+EJaXipzMlnVD+NL
	 u7mac2+2erql3F1zmEUcWCe7VdiY2R4uC6TZzpVP1UO7TYWwO+Tnw4e6Vbo8UguO/LOv4
	 oMh3cNqTeATqooCRlFRjfMyNSXy0atXySASShybqF52AUTEsZTzR9MO1YpiaB4DxxIXWg
	 JIehy/kfJ0vDLDxwQVmQ5dGLlrXfixuiqSI1VwUWzrZulnkcjwb2hxDqpR2emUHRN+LPP
	 8MW1DUwQTfjYgIdO+pAImKlQs8vJPNWbbd59qccj25whpUbcGNrurA0l2u7VBQCGY8w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781871444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 List-Id:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hKtsXj3UhXzKS8K2cfFKdL6yErnR6fJjY7D7jK1S1o8=;
	b=1l71S+9a47SgCXpaijVxMh0K3pzWlClnBQTZb82aEuu/Z26+jXAJNby5Zv0fTOwXpnri
	 MSsC1EUf4//uooTMoHfE6PCbaAgvEW+Muc9WMzLdHcX7J/cOGL22PXI8e8taDRcnvXMBz
	 HLLRS6BZGxxmioPXvmI7kTeZORzFFmsneFO8lbiMRdfjJAcESpHkEI8RfPusppZgHAl/P
	 vQ+6Qqo7BkF/VMQaJDTR+ommxo44lPvdZBmTRQqLEh5fDoZuzvoIuYq1lbvC/2gYo+BFJ
	 NDqgWhUQlS5pNqY83CvdIKPzTb8nHK806iU20t6h1d0umdS60nrNKn66d1oybzrpjXQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ot0Kgw/G";
	dmarc=pass header.from=qti.qualcomm.com;
	spf=pass smtp.mailfrom=qti.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFCDF1F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 12:17:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ot0Kgw/G
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EFCDF1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J7Oivg3707359
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 12:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hKtsXj3UhXzKS8K2cfFKdL
	6yErnR6fJjY7D7jK1S1o8=; b=Ot0Kgw/GbcOFojc73WsiybUf9/BoqKiXj7pesS
	ENW+3Ffrypc0eXSHosYxj0GANdINRMt1g2nU6lBMunsoKSRiCZVNs6FtpB9M67Lb
	6yH3jvuvMPtSzY12xIi/2fiD76R99Lc70cP+v41JMRslDGKhRrfT9sSJso8eXa0T
	Z96+p8WFwomXtrMDFc9TNjYkfMS66xl8uf7DPqEzBVGAyey+xIDmm3SKJ4iUZ+2e
	ypsFOsspTA5S5PXk5nyXQmR77g+Q/U5qANCcAZXqxigU6MsMeSP4rTQTJGCS7kv/
	dkIXnMRxn8LRhFmk5MJt3UOdyP+Ij+kqbDuX3D4M0k6f5Y3Q==
Received: from co1pr07cu001.outbound.protection.outlook.com (mail-co1pr07cu00102.outbound.protection.outlook.com [40.93.10.90])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6732p2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 12:17:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOWFwjLvVTAvDkIkTtqql+qaQh7maprDE5uRO329q7gSc8TApykfg5X4StDzAr5mQg1YxuunuYwQhdk4IzCD31CwDo2GnRp5+oIW2rFkXfhHm+gL6Atpo1XTPd++31tJvpYeZqFiG4XAgJ+zoxUHlrlOGxnpRZLKSpa2heEHl+EuKA3dQI94qRkytvUrhnpcZXjh/ZVbqvjBtlnsu4MiHwQaWvcqWFcp07SlszXIoFQFOEmWw7qG4cPHcoJk2hxreN6yx1yaSPQMb/hIX17Z7p9EKY/l72Od51oRCJ4kOhDoMGh0tnntJRq/bMvWVX8gPfDRmxSPtVL/x7AnntMNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKtsXj3UhXzKS8K2cfFKdL6yErnR6fJjY7D7jK1S1o8=;
 b=qfoPmxsCZlTHM0QmwNRa+6HxoCBBEWgUYjwDO05b6+cVN1fPTsSpYmInuhpwM7n/KeT/hjQyrRuCQn3Q5HXPe34WK6qp6Vc+AofOmKn49DkU+hh3BHb2XsGbkMTCWUl6R4Kdu1dD391dnuPj9xpoDD8q9hoCI1lZlmaCrzMDvKxuTV83hI/S57G1QVzKLHkG+qZMvxNtYBRL0Go8mVJ2FzZm2pGRgPpkN4cS1ZPr8tDzRCAMBY+Z7/b8plqEqT1RLjMqoAmIjgh1KB7YNQXrjEjXNWc2WWRInnQhwi5hXNBIliW+ziSYg2gYnt7DFDA+rQMukGYFOAuiikZcD5ulPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CO1PR02MB8569.namprd02.prod.outlook.com (2603:10b6:303:159::13)
 by SA3PR02MB10067.namprd02.prod.outlook.com (2603:10b6:806:3a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 12:17:20 +0000
Received: from CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612]) by CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 12:17:19 +0000
From: Srikanth Katakam <skatakam@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi
	<raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata
 Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>,
        Sankar Reddy Poli
	<psankar@qti.qualcomm.com>
Subject: qcom: Add qdsp6sw firmware for shikra platform
Thread-Topic: qcom: Add qdsp6sw firmware for shikra platform
Thread-Index: Adz/5YeF9u6ocoYARNuK41Tvapy1tw==
Date: Fri, 19 Jun 2026 12:17:19 +0000
Message-ID:
 <CO1PR02MB8569E09510530CE9F5ADFCB4F9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR02MB8569:EE_|SA3PR02MB10067:EE_
x-ms-office365-filtering-correlation-id: 2ec41dbf-f248-4604-fb93-08decdfcb5ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 T7HbdbxiEEsUapPC+lkDr+UFQ9EcMigMq/IhE9RJkk6NAevguTOar/duOBKnP4x+E3dlt6XYxzkGMqgLBrRnAiFcO0Zqpt2Qr89L0EcG9JHYPiauk+GHXxAX9j5mZCU5o5a0GgA0kzPUAOq5rUm0l/kuCpk78tYxNyitAGK6jIQv3by6ExLLt0ufDyuNugP/eWYaUvOIL8xkBcmheCvgUW9TeiDLSio2aFWLmJjjJYjUWRjcOGq6FJJbF9anoxG/zF+2AbbfPUDZQiAm/t42vLp0k641WGM+YpVT/jh86uXpt3PMWBnRL1dpRq2dUCgD90PB1sm7llMCph86ZGCJEYsFiU9pv9BQd/EztDVe5J+v4sU8KGVmexVj7e2Z+AQ3WceXyliGSYZMMp3YRPawB3PVwmbmB6Zc7113TAWGP3CvYhFhycCVnc7ohlE66EKgm67UvexFcOzyv3HRpqjxKR9ZjVD9QVXUJT5IQMgyaQPUd900fWhImBf6ria6x6QfYNdTVFDHvAMwzqYnwfwP/oQYn/X7okuHQW5sbViZelggRC6B5GhWYZ+QxnBrXQhKhc+oa+seATdPf/M6B2rSstgUJl1hCFSeZW4swQ2YAzeCJQ726m5GClrFmxZ52cyZqSEHswZLneQi5CCYV9EwRATU18nbC2lnMa7eg4/WjFNYhwmuIQ1pp3ih6ya6+Iv3iHTi6PkL2BkKJz1lnOQdlZM+CUvnlo1xdBPadMMAowg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR02MB8569.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?snV3QdR7E3Ua8i512zfzxfACe8KdHk7IJ+yXagcGsDUd+PJUleKRh4hiDhqr?=
 =?us-ascii?Q?iUib9qbXUw/07KdFgnMGTXFqZl/xej/fGGNRABY2a2Y9YRnkQCOxns5XUafm?=
 =?us-ascii?Q?5NTjZpA6iuoZQ6gXATmkzjg7l35ZUWOmpZC2JBc03M/3k/+1hKQkZdPdiezW?=
 =?us-ascii?Q?QlHyjpG9bzj4V//pUuT0VianqINyhikIVVcTwhnI8fWx1Rlw0qXNIurtv3D/?=
 =?us-ascii?Q?aKfRWLP6EFD7e2MEQfPLlQFt0PPPWj5pGGf53ozpWCglA90jFy+e8ct5kkSi?=
 =?us-ascii?Q?9zPI47N0pdIcj89QwgdaIWbhl4JHBY2emY85KanDpo3aRzac5OJURdHK+xoM?=
 =?us-ascii?Q?d3r0tEc7zXRC0o4xHLwDTxy7Bq2pUQ1Q1gUuuF5P/YO436c/WnLeIkeS5iOM?=
 =?us-ascii?Q?wZmDKSzhqu9zDgitRFqo9mX5SN9lDW/DTppqAH0QdnzuOM6q27qUggYc9NlW?=
 =?us-ascii?Q?3F180q8jSxt8316PQRDBRTqJJek4yWTKqzqpjqHm7yN+H85el5n3WMV8a9bH?=
 =?us-ascii?Q?r3xNSK0TDCssmWSHylpCI89BWEp/QCu2v/cO7kCrOXbiSb1jrgdlxzdcEXpC?=
 =?us-ascii?Q?1mdMlitDUZuSJlCLBAx0ZI9bVkIVRWm/djfIVL4Fls1DIfuwBO5ct1dPMH0Y?=
 =?us-ascii?Q?dlzDbdq0ddQfZjKXeI/rNKAmXAQcq8JxiskBJbtfH0r5dRVnY3L4N8q8+uAT?=
 =?us-ascii?Q?QlCGGZKSiU19mXOBPVGXxlymulTu2xJqDG/h7PhDl9vyacbxz+hfYW1bhb3W?=
 =?us-ascii?Q?jDnTP3fNIHWRHgw9+0ermutyvy3VLKTni6P12fuQyWqvHUfT2cXaH10i9jcx?=
 =?us-ascii?Q?16nZ4c+y97h5rpFsNiLA5ui1vic9GCcDgaGwZxWjtOSEJRjVhgy0Q4XmCetN?=
 =?us-ascii?Q?Q1foQ0AVS5PWQyrKthmMnvhJxKNkvXrdC3NkkKtWw8n479Nhl/o9sfMvZDq/?=
 =?us-ascii?Q?1XUICRfxq59vFlzaBUtVtJSo6XKGARLeB5igCpV+rCprnu+cm9vHkuTRsMK/?=
 =?us-ascii?Q?dI43CIKfmD2OqRJix2buT8mMC2UyZEaHBvUR23+jBKOR5rRXc68yotKLy1Zr?=
 =?us-ascii?Q?aeF4uvSXeKdKM1uuwkKwgN5oLm5omr4z4IDgwNv0x8fIqwpHXSteG5Ww7ZYe?=
 =?us-ascii?Q?cI+cX/eXyQqq4eM381dsm+18V8SL7nVS1muu+aaLEJP25BFBf39cROuR0YUU?=
 =?us-ascii?Q?sTtgWC5llSebhDns+UBWhxR4TF9626O+a2TnkbQn7dbFxqgWK22rj9tQVuBB?=
 =?us-ascii?Q?gemndivuJ341gB0/oadnF+geRworIxMeECbclWl9gvFYD0AJkqtjRPHI+eBC?=
 =?us-ascii?Q?c015KpcfK7y7BFMeCL31bJA/hNtwHjFW4lj9zRaP6EIyOGKRrHgCK0skxPvJ?=
 =?us-ascii?Q?gjCAga83/N6/vdSSLTEYUtDDWbND+8DplC2oGNHqoDnREvaTzmEZswsrycMI?=
 =?us-ascii?Q?lgGBQRI7pXQ692pg8wApJfMyKoWh2guk3WesuNC6ptqmKTbinSTAXBI0W/Ck?=
 =?us-ascii?Q?Gl0IMTpIhkwU/DUeWN+h7kJHFRM7xi/cSSEVSXnSRhwr0GJznrgmKKV98rUZ?=
 =?us-ascii?Q?OtZva3QlKno86cwGysKCdRauEqDbU42ci85fxhyCjJt7R5SO3w6eYWIUVfB7?=
 =?us-ascii?Q?53v2SyUxzvmOiAcknTAp8YyCFHh5jNiKOb9Wh/YaJMezAUtPd3ubjImLncPu?=
 =?us-ascii?Q?RsiV6hklGVqaIWUCjDmEac3SaD9JQX0ig8Ceqlr0I46HIOTKVExTq8CtAps/?=
 =?us-ascii?Q?UMNL6k6p7g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	hV8cnT1NicgN4wK5uZa8ho7jQKqgiBqa6fONGNFOg8w6noEGwD+yD76qlrX3bEXijesbwodsO/rKQqFaPBLBateSmhB6GQbr1XAfUFJeUJSzLQoTRWeuQj74CtDTczkIPn1JbvsOVH3dP0l3Hr67UYyNc4IpFiJZteYwE5hT4qfiGk/ax5dJ0mNTGnywbDAhhw0K7HY9x5UUuLPGiYmZSm5pAm2ANBHdNmnuBQ+ublhnUkLENHwXxZ5kRuuTMue34l4Ai2ozfG8xG/W+epmB+FowENkMtcxBvqQEuVOAk++ORTDJFm1cA8VOHtauDC0XvSxALCHG/hy2KCXMwtBTkw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EtPH1b1EInmm3zCnK0m2tO9oNbJST2zv+8Nb4qjWb/+UyrFHyaW/WYhuwk9010tsL/SFEMupTx73Fw4M5vyAUoTKKMdEPmrgPlxN0Gr6pSTs8Dhnd69bMSTXrGxSg1FK3llMMkkrq9aixApShhu8yHPjZgHiOTwlCIgj3D8fiA7Qxak4qF1E4xjBeNCAddy+aHzKHLniCWM8Ff0QxR+C+zZ2KbnFchYKDADJo5Ygp0EGSXZhZNEUKSLhGLYe/lj3Ft33zExbZyGxlLi9qVL/LUeCFumD9HLdh5zIcj0FIMB7bd2GmmpW0ppcU7EtdVKCwRZyZSigwRnZKFIyOi4SpAfKdXCUN9/e0J8zPeTlrmagHiYJT3CShul8J0sXJ8KiEN7c8GoaoUp3YgW7+KjhlZppccILxATFjRkxFY3SrNKNLg6OHxrFfErVZZ8fdLpG4EapuQZXxXrKMnirrl4aWk53uxe3DG+gICJTp/bvxNOiJ2FhQkqJ2Cm2c4n225xCNM6vSiU68o9pacAWXfLscAwFlU0a+opW0nHxGijr/p0beotCSXlJJAIh212M4FINMlvvD+gYjx9gwkn80q/woLy9fkRusBM6VnThEe8s7U3H+iaqet0MssvtI6vNford
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8569.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec41dbf-f248-4604-fb93-08decdfcb5ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 12:17:19.8802
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gyFhypvXN0ArkSSrwpOCjxouleovPD+VKYICJ5CMZ787+nPk9Vr8QlXsry4OEciFvc0mylspsRDojEmAnPc8NFBeB909ebz3r+8eEkNFAUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR02MB10067
X-Proofpoint-ORIG-GUID: z3K3sOC-W3M3GXIQE8Skh3YkZ2CX-YOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfX6y0jjqrVWPoz
 d4NWEfMsbklMdQFCaHnDCX0Vx3CCedZ2ujHL49Iv814y+NnoJsE4MTmaXmK048YBoUr+hxCc26c
 DUA4MgQuMmQt/74a9/gxot5jzGSrTiLXr2cYmfm2jQiCwbtB8UWBLbpiiA4Amql1lj3jRDn//jx
 H6U+nzUdmoLlLmFJRrNbRDdTlLJkfLgRtwnner/zwiAMzY27ypqBZ+BsXxNOCHatXkB34KUWvBz
 +vtXdyNqCIP+3UX5xBPfOEmvk3qtVsIYmdGykE3OxqkqZAsNeBYR4GrHJOZHRUeKbo6RGEMeaww
 8m4h79C8JJvARH7GLhaMLbmvzLX34SbARnCwQSMgt0rMPVodxdS55560bf99PjqMQImV6yLORQK
 JL3Tu/fShJotLSBHegoR0kNYETOCXu6p+EH0MAVJM7MyZYfLJIujYGtVgTfsREmh6jJIpnImtLh
 uRT6G3Y+PsDQTgLQ+cA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDExNCBTYWx0ZWRfX+H8Pn4gXJnQS
 Avo4E7hZQTdNDbDss69xttYYffSB7ScNQo/kC54P4YCPHfyNTMqfb+Mtr4hzpdhj3nRRsV7klyB
 OZrgtTPWpq6C5I0h5J5jwIuqj3ECM4c=
X-Proofpoint-GUID: z3K3sOC-W3M3GXIQE8Skh3YkZ2CX-YOh
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a353353 cx=c_pps
 a=s1B6KbOLKPxgfRSf6UFSLw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=g6CV1AVuQJ-najt76CYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190114

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25=
:
=20
  Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +00=
00)
=20
are available in the git repository at:
=20
  CodeLinaro / linux-kernel / linux-firmware * GitLab modem-fw-shikra5
=20
for you to fetch changes up to e5851e6ff573e78d5b0a5cceeff076efca8d46a2:
=20
  qcom: Add qdsp6sw firmware for shikra platform (2026-06-19 09:48:10 +0530=
)
=20
----------------------------------------------------------------
Srikanth Katakam (1):
      qcom: Add qdsp6sw firmware for shikra platform
=20
WHENCE                      |   2 ++
qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -> 5709176 bytes
2 files changed, 2 insertions(+)
create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn
