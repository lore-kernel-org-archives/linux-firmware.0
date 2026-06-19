Return-Path: <SRS0=eQpD=EP=qti.qualcomm.com=skatakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6FBCD4F26
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 15:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83F8E1F00A3A; Fri, 19 Jun 2026 15:31:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781883061;
	b=ac+B4UdcUUtDtSPJfM+1ih3RZhDI0qxlJ2QXoQBT6zet2D+/Z5M6STDJyDbyTujoYo8/
	 WH023d1WZdzQiCayzIWnX7s2rSBT58W1t4zHN3FcXpwhkl8+ZgPeX1kA+J16De6oWtyMQ
	 u5ca/JKc5L2ed6Z2UACLaJ8qbOTU4o9wan6HwgkYs2HV1QUwQbustwUxde1NRMiCCVqTY
	 LyHDj7LtPUqwAmMJPyqoiFOXKM3lfe2tfhohiy3a/bmKvxklEzVzC+GbFebJQqwZtGUi5
	 lIWKXRG7JmvMLHDQl10ywLhp5ImNld6XCZTTIaC3WM5A/LCg/OaVUibxBK5r1Q+Ympw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781883061;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OW67kzDdqkoHDegLTGn6aA1EgK3DmnQcOunNywh9Rx0=;
	b=LY1TMlm76z/EOdmE63biJGoo2FJtXbFDpdeyFYeegZ/ZOGgkFzBnzVeYlcl6gmW432+o
	 khN5e2gIyLSTVUoW6PWNCupKkYvOwjQ9mOK738kVkSz0voExgDG85BlVwdAQQT0jT6yn5
	 TX+xnm4UYz7qUDhfrWZbeow+S9XQ1ougP7hQgQxCdRq1BlGIUG2v35p2AlFa5GJ82zWt/
	 6EPLKvxB/t1xPsSQEUTrIFIiIDQb0Z08hjVAOaLduK3SRx5okht//6FKxnf7sBilXnszI
	 xQwsAGePmQZlDngJvnMclA7VlHIMuR26nzfubvNuMw4lTJi/cCitKYz8nfvGWfS0Ugg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kn2W02yI;
	dmarc=pass header.from=qti.qualcomm.com;
	spf=pass smtp.mailfrom=qti.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C24521F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 15:31:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kn2W02yI
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C24521F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDC4oS759327
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 15:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OW67kzDdqkoHDegLTGn6aA
	1EgK3DmnQcOunNywh9Rx0=; b=kn2W02yIWGnSMmm9MAVyD6Pmkl9D6Eel4TuTW4
	4+0cRYhTV3zO3rWphXtlNNrRmkyvPkeg53zdw0wPGjClp0v6H9GT5Y0lTtqVRpHp
	RP8EWnvR0yi4Ckl896z6PYeoiO8dy62b4XdBoDaS/mXO0XObuISgwpfFpwY70Z+O
	v9ANHGK4lL3o/s0I7sdRCYscM+lfnSygLyRkvDmSoAxTIYJP/1C5MogPZvfjWAA3
	KUch5ZYrAsg92CggGrGdYGwyEwsGL2e1eUv018gvgPr0ZD5qvqgpTBW89xgrp2WY
	cfDWqKdk6+hM86AKSaLFlIkEcjlrQBt+iych7Dci7vkt1Dww==
Received: from dm2pr04cu003.outbound.protection.outlook.com (mail-dm2pr04cu00300.outbound.protection.outlook.com [40.93.13.56])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp8n5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 15:30:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGTg/JK6K8PKlKLsOoemtIUSgWC07bYf8BwGdPcY/XpThk+nrfQK/gttsdQjnjRecMdIDGG27YVjTQnXVM27/P5DGJkjrv/zy8VHRWImF/uCMi/RMeNZMHPkSFXqLp41UCyXd1ZQAsUMxVDIfO9uIu4Nocw0+ptwdxVAE6ezUN/lE2t+yh0TA+IZfTyls4gUQcC35rL7hUVyIzsdhcjPhKmzZV2UvjChwrya4x1tjdZoccWK2+8OV07G3Pr8B+VtK4SRpl90XbrtWFQNxjvmANWYEg+iYI6lQFYege5zOthRaFZnL/UaRdMSVEodrON9UzjdaYgsUlSki6W4LjvcDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OW67kzDdqkoHDegLTGn6aA1EgK3DmnQcOunNywh9Rx0=;
 b=Y3mydVshHV+3BRiiOl8b4L8ynigfrNVXTrXRHbNEkEafQfBqCc8V+C0q+0fk0FUPKFbhs8I1FsgyilYwtpMShDOVkKX2tpwMrnNW4ZKe4ER8Vkj86TYvWBTU6+TaOQHaa3kKKL22o7G4mC79hTBMmj9N/lF5bnYQpDisiKI0ixrYbyQSfPSVTeE3StvjJQ1fvqIGUTL8KiGY+v5c74WAwENolub1y0nfb97sJ2KT0WkrloqAkXPn/TjkG79CUokUP2ZEm6GQW+TDnm6VK+dyeXbRWscZ+mWaA0NlTRK9Ava91LoToaGptMhpx8qVbKWvVCPpnHKjxcdcHnqSnch7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CO1PR02MB8569.namprd02.prod.outlook.com (2603:10b6:303:159::13)
 by CH2PR02MB6806.namprd02.prod.outlook.com (2603:10b6:610:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 19 Jun
 2026 15:30:56 +0000
Received: from CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612]) by CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 15:30:55 +0000
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
Thread-Index: Ad0AAHstRXTEf6poRPik3bHA9Igdbw==
Date: Fri, 19 Jun 2026 15:30:54 +0000
Message-ID:
 <CO1PR02MB8569B45CFD8912B922F7F833F9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR02MB8569:EE_|CH2PR02MB6806:EE_
x-ms-office365-filtering-correlation-id: 1e9236b1-bd73-4be1-d54f-08dece17c0f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info:
 djSRkh5oNsaQyc4UrjVnS6pJSsN/NuOcbh+r9QDqyQBdbxMkvi5OMcKZ+f2Nm7mwnIrj+s9dG6Xmgbl0px4wMWH4J19fSEQEHrBezjX5GZLn/oXoXMPDWSyaI6N+ywHH1w7jgr2O6Wj0a5XyX4rLyS4oI+S2SKiqYomns5h2ijtkNOIVAk+X/Bww5oKOJJt+vU80FmQZ60a/lZh9ZxEmIt9lXX1L+O0aeagvtimvn6lCvKoUb2XZHHgv8R8UCN+le5MrvSOHYJmSbe4d3AVKaPdnKqv0JqPd2mRMmdHUFVq2RJ64i8DAt6QYG0mZnLhk3ke62blVy1HcSTARRiv1jmqtbLl9ATCykUAb54l1OSu7cA7ZNo1YFLNZf/Spijso7nkW4f3QIIaXR80v70qjP4czEMSSQtv+TzHiuwTU8EKtXo7Ss0sSCtLVTCDo4kSoig4tK10aez2r9UzJ+qPNnhB7vL9GvkIyj6WJK62SgYRoaeUu6HcgoAM/3c3omSvY5uD/fd/RLz/Hzxn84nbJppnxlyXzaBjXyrC9PwO5I1iNYg8otatq2Amx2Pw40TmTouxUncbi8cXd4y6c9e5qjOXZL0QFPjDQMlrsYoIhsIwv2L6O7YannphgFh3PCAcdaFYRooP4OPi7V3bbUttrW1CC/hXCnZ1TpC9n4VjTpw7VlbXyqYJUKM8Vc3NNocrEdXMiVuzEbVZCqyvyh3hdHZ1TivzKxevIAKUGcfzyhdM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR02MB8569.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PIEnYMhu9/JAzK629+qHV6lhltdIVGspTmlxkkKlOof3yqzL0Xn+XwdGt8g2?=
 =?us-ascii?Q?oXnACm23iZ6Leo1D6JCEyHJdJsEWoTAAsD4HK7T2kk3ao4QRFx8vev9gujx8?=
 =?us-ascii?Q?lXT76+vKigi8+YOuqmse9+cE/21vBf4D+sehhcz8XVDuy0O7FByMsU4NC+df?=
 =?us-ascii?Q?AUUNRW8wslT+hsiyjczgw13iyjofM7TLgmuGaKZOB572xZ9saTrQiL/ScMou?=
 =?us-ascii?Q?C/FgqP1PoB9RFjeas+Ktt46N7/Pw3njnNqq8AA8X6eU30TOnFJgq8ChBmm+S?=
 =?us-ascii?Q?+8Fma8gSplvK0iHZ6SOYfAx/0dZxEKIqKAq/Sf0PnQ25cw0/25n1Kt+FY7zh?=
 =?us-ascii?Q?ipse9u/GeQse5wK1FF4HCyWXRb9eBSdWff7KOdCsQKqLYeplfdJ66Sdv/eUj?=
 =?us-ascii?Q?0xQpgBn2/A+8F1Svugn/X/hsXlffu4BvCv3GjHAjCbFFArf+m3+JEdJQuXKO?=
 =?us-ascii?Q?Pw2MYsKia9+EouU5fuVd5XVBDSqVA5P6w+Zxy570dKKntIzokzi1QiVb0vLY?=
 =?us-ascii?Q?olHaezlTrHPGJVbWHkn6N1R3GloLc7WLK7x8pR2K4EXIyCSFT+YpO65cwuxj?=
 =?us-ascii?Q?R9cziKZhvmivUPxhxcifUwqBWj+Ex1hdxPbUAFoqsRj2rOG520QW0mJIYgJs?=
 =?us-ascii?Q?mJR1NSjsyKctanGI4phXErsMI+g8zSj1xGuMJULkDKlvGQDk5Mqi9674I0JB?=
 =?us-ascii?Q?mJMxYtZh3+Y3MXIbhZW8lSAq51feD1WMKX+2Y+Y+SOBygUrPxDw1tEPXEyOb?=
 =?us-ascii?Q?wLicj1RNTKykpsn51qRkNmth73sZ57G7vvkI8H5fGMjFizbaOvy8/7+ywRz7?=
 =?us-ascii?Q?+RhULV1WCmmciTTWpnSjSw5ouG77qgeenWqxzb9U80ygxerK8NeLRmOZ6Ha+?=
 =?us-ascii?Q?3amxxu7W9SFGuYNKmLCarMVlEZcjAPkrP3gA5yeLpuLeuCk3pIxu40GsReQ+?=
 =?us-ascii?Q?3GduQdKrfUQyyCnZbGAwM9EvoRDoC6rSeFjGPws2PVA4WR3pSNqpADbWtNCW?=
 =?us-ascii?Q?gLBhz71jDYYBNbQhFwyibAtBbRuAHAV3KDsr1hwsexvX1a26RZXw0nl0p+rw?=
 =?us-ascii?Q?+troloJzHhalnoKhvEFzLIFb8i6Uf+rQLiBdtZjqlRvUrT6ezxulyH2grMDx?=
 =?us-ascii?Q?8qWlgsiXhqAoy9wfFeUlZR1+Z+S1wtiaeiLYhPgHDaZ4GLZWMhahcI/aY9mo?=
 =?us-ascii?Q?rFaZ8EmyosEFMGRzekX2HThpNt3z+DoLrzrR+0JslYm9i8Om0z5xHo/FeT1s?=
 =?us-ascii?Q?6wTpJjTvlp08zPNxA2MAbLRcoxAbo7KzQ0zt4Vqcvm7RzHlTeRpl7rqBtf02?=
 =?us-ascii?Q?/S/ljemWaliHUsndosFXnipUiQQLHJdahq5+e8H3/AbtcasYYY13XQLJ6HWd?=
 =?us-ascii?Q?V9rmcF7KWjGtRKps/dZemQEipvu3XkZ+AurXRsoN/5i6DTSzKviIPo8gu7dZ?=
 =?us-ascii?Q?hqaCkjvQqBYg1sAs2V/PSWG214m03GhjQ4E8qYj9kubIdzD7wvranZ6XrWvT?=
 =?us-ascii?Q?cQVF5jTSwCClyMR4phFBogXK+TD84qCahlyFl8b3XaPe+7hyFitsUUlAumXB?=
 =?us-ascii?Q?hOj4bfConQeGj9SP7eloZ2vFlrXiHwlSRiwcnZL/RAAb9XOu9TaKlhRYbDFq?=
 =?us-ascii?Q?UmCptpB3yYSwOv2+SHJvIRtL/QF06umImHl9V+vkSvxZUfhBjm+RvB9Cj+04?=
 =?us-ascii?Q?G+TVrgZYHx9KN6AwYrGHJdiJ1kpZYeAPpAeKepmKqTPhb8974sKxO8Ggs3S4?=
 =?us-ascii?Q?EyRCN2Hd2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	OF/FDv4irgiZRFj7ukVmEgngAQLfpRMIQjze2aP2gfK2wyCFM4z2fMeC6SEX1k+WmWRE7o3RVfM7lA0Ju42t76x9V3qrnGMAsOeha4p+EBvmNjt955/L8DggU+Zg7dvyiIZJlkTixDizGB1y2QxRBfzI7tvlTf3CVsfGwTm3NBhI5l3X3kBojx9IZjJe28N7HDD3iYy56hMEHx1UGM77EbHXujI9Poagl7h/yIUe0xISd1XZyRQED+MaetqnPNnMMUd233zLPFMexa/Q7Jwzc2nqBFP6SpHy6N3oZOU4FrgowQpx7UGXtl6f+mCXYbt0SrlVnd2Z6C2KRWV5HyPS1w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xw950AZImnDKHz8dsTWnes70zE0kE3sgIGA7qz2xr+ic8hdlV/kNJ1m1LPYHLX96Upl76Iqo0y6SPXwreBGTg+Abv4M4XPlKaDBUcISr4hAl5nLdU0P9eNfMTEInv/LCES4bKvfJiEv1UQS28Ns9RpYVdpv/RS8ICK2S3XHghhGwR0Iogr5v5KWnjYWjl4wUC8w3GyDTuDrkVb/5/89M54aRMhOyTAYH6Eb6yYR6uAygeCmi2FOUH/pH/sM3NS+TkNV5v2CnNNOVZbY51KsDxh+Dm1pLjP6yvayHx6X3r0XuDhSgdLVRIM15oQ0m5/Tb3azGSPfw/Z17QVEAGk+olZV/Xzh3eIB82y1BgyvUEL8JRQgOu4RyahArWcWdPymbpMWT6KoKJXdTo85RsA19OioyrLTE+6+ly+zJGacjnEYrXINtCRL1OHMd82s+YAATz9TGtacXhNAFbEAR1RKHc7NNPtxHys1vU11pGcsMFQdGafEN8El1k1sT3HmA4siHoon2iR9dIYirAOQ6gLtGeJbgQZDQjHYc8DTRkO1wuiSMXBm8lQVw1EcZtFGYON2aLIIuBSouAxOGBCNq5PuLHLgZaDj6eSK/vJuzJzma21sq3QRSTHUNB6AdfFfGFrpv
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8569.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9236b1-bd73-4be1-d54f-08dece17c0f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 15:30:54.9554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eu2RYu8o/bQoVgAD9NNwqy1FJ4vFFbpZYHX75figM8F5vFmJJ/cZG/BRPjp7PV8obUEHUh0K0nlwunaKUpSemO5scLHJLutOhOfZTg/fqgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6806
X-Proofpoint-GUID: n3DehH8ItwnVBAshQSp3hOLnNorBn16k
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a3560b3 cx=c_pps
 a=wTW14iHPWsjxmVSX4jmdzg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8 a=g6CV1AVuQJ-najt76CYA:9
 a=CjuIK1q_8ugA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: n3DehH8ItwnVBAshQSp3hOLnNorBn16k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX7YWPzSYyIw61
 8B7ub39w8fIHSuIS+/5Ir1N66amFfeD25tFqFmQhn1kvwABI5ozDec88QHir+h90MkQWh0nThmu
 xkFHWaaYCC8cZ1xRdXvYPoDjzuoFgNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX9b3gyUlwJPjv
 dRNDZyJ/6uN9GA3B4qfzDC/y6AQqe4RJ57ELMdRJhSLzYAQKVB1Owa4CboQ3dCRdBsbnBMDmo+Q
 1JwWq6M20NA21Je+dyOW95ISa/xvj9+nRXR3/3z3cNn9b97I1EPXZJY+HXKQQCj3A1foBsyNxSt
 PBQo3Tf92gs/SneN6CT4Q4OV8g+qWRAeGdUrhZ+YilLfd2K3jCpY6o5voqEOC4bxZWr//0shNrl
 2vutFofMhYMXGnkdMjauId55d1AbOKFLm8UmeCg4IAuDQQmYsN9hUFBHgu+bmRmS6SLY0UyraAx
 iKZTknEvh7Whji+fKu1C7cEZTEwY/2FYakEo2onR5/gq3mCU3yCcuaKtFCBbSyY1VbR/nZoXunw
 YymgM+GBleeA+vxydWHBgf+idR0PhrpuqfWm0p73hPhS4/HGaRL9+lHqXD3/QBnKetZInoUcSmF
 Eyd12M+fLd+kdRfq7Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25=
:
=20
  Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +00=
00)
=20
are available in the git repository at:
=20
  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git modem-fw-s=
hikra5
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
