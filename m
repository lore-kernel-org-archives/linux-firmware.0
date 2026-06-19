Return-Path: <SRS0=eQpD=EP=qti.qualcomm.com=skatakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E71ACD98F6
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Jun 2026 05:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32D601F00A3A; Fri, 19 Jun 2026 05:40:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781847638;
	b=M+RvFNAeXJ12UHOgjNeAxfJq7DCv3LSlBI3CV+R2u6XPG30tM3/Xqe7r5M7exxQUgPEc
	 tcW1lAtBrXXJgziL81wzeJdPkrQBLDhez7Cobx2PFrLWfvjd2KkgeN2U6HehM2NVJTFRi
	 kOxLghz7/XAIt0nxdR0zXHENiZmnU6xcBpGFl5Wi5xGmV0XJ4Xk3Lu4RGDcaGYfB23OQZ
	 2+/vh63CgoL/180nL0H25dcRINT0PvsTPQgRKfVfl/vpYMgQFkoE/YlKJF3sR40iF/vmc
	 I04qvNQIOde2DLvwQRbcqpw6i0Io3cv+Gu+zSrv6G6+NXYRORh0JkikPFhrRKYYdJFA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781847638;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Cui3cGCc+lZHlPYWqQ+xmGA0yDWq43Stx149O8X8m4U=;
	b=JWUgoUBsCyCshnYYs3gus4erqM3ZGNA5ZZHgs0JDcIBssbwB/PXer5pjW7vfyod/A+2N
	 EqKS/AHzGlRnoAstrIFJD8Yvnb9CWGX2z9ygNqaVPdHTwmG/DXZdVh/fMJqeJx6WAftxf
	 2zk/Fji8Y4xnxhoL63nOsYgpZLvZJCCI0cvFDp2c1UNUkf4a9NXf9570Hy67fCZLvrmYO
	 BslOnCbIUZYL8ZRxf1JX9reBhaja936uTfz8NeUaZqpd8h3q+oMDfRuINbfGzjWE3NhCW
	 7Qad0cKBNJfyEGpCb8uIIEOINWYwkH3TgUvI2xq3qyWa5kt94r1AdrSWDKRj1Fckhcg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0PZEE27;
	dmarc=pass header.from=qti.qualcomm.com;
	spf=pass smtp.mailfrom=qti.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6570D1F000E9
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 05:40:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U0PZEE27
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6570D1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J2v1Tl3611019
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 05:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Cui3cGCc+lZHlPYWqQ+xmGA0yDWq43Stx149O8X8m4U=; b=U0
	PZEE27BRHDfnTvEXZJbdwMQpU1yygo6oz05iNj1R+BFWzV9nari+oR2vgu6qQH3C
	dDe3jWxZxEzYyKJollOBNHhGr2GqVlNEqp05O+96hnMVpV8MDnEmOqvlQNGaBhce
	oMLR+fQj1xb7Pq1UBnaMBJfR3/q5FNmPMadhTI34R4q0VWW2i+HU8y4y/rEEaKBN
	2ol9KVw6K+S2yFfvRQUD2UyTEqlVCvIEGUYJ1PWKJ2ChJhdn2s8Qeil253ku9cE1
	Mi7ooBbJXdPfhjC9cxOCe/qBN1Bcysc6pzRRXnO8nMHyYJPJtiEDRGtXM4/BLjX2
	6kt3ZJs+guOlL5x3cOYA==
Received: from cy3pr08cu001.outbound.protection.outlook.com (mail-cy3pr08cu00105.outbound.protection.outlook.com [40.93.6.109])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp6sa3cq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Jun 2026 05:40:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmtNeC6MmShHAgyrmSDDIOArFN9JiIBR4YeVR1WHyW31mMah9wQcsC9ZR67A1qhqzsmdHKgMTXjTAAPQM/pcDMYY/koJTuSFONj/gyTwTW4N2m7YcYmLOsah22zZ95bjvfDlK23i595jm3DI37kNsloA3wmSVr4qdus7cGvo5Syhwe8BrtmR5I6pIk3VDarVoKietmlp/kqkMuR/s58EeyRAUVem7/EpaZSo5dogh2xaqheZjbw5uQ0Vqzeyn+5IQKnWmMyabYuN5HqGT6BEKMhmj/mtRxQ6zr/u1FsSmPoW4knftIaaKKw1BjfBB03aT3rW9qJlRWR7KGcD79JFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cui3cGCc+lZHlPYWqQ+xmGA0yDWq43Stx149O8X8m4U=;
 b=Bnc9+FxOT68ocTIPS8NOqPmqjzd4YtE4fcLpUxkdCWTwREBkCpepBA0mFOAPl8eM6OXCwXjjdsHZDaH64PmOctsyEvUNfIcoTNMOceiYyEUQ1mOIeZlc1nu35zhRRTKZZs0eaJ04n/fHf53q0XtKOZEoqtzwAN8O5koNVfLQTeZtaaQHtIc14SAPEoTSe8LoJvK9vYV5c5677H67TJsXEm3b94Q0u1bkmWozj+CzktbLWsZ8kuXbNutRxCYFGWvk5sA0aURzBylwJKtQ7wxWCkAOOlZ5OkAP8NHDFYP7UJlD+NDNAk2xl3kF9afUjGVXU/uQwxNS+2cTBO1ZZlpkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CO1PR02MB8569.namprd02.prod.outlook.com (2603:10b6:303:159::13)
 by DM8PR02MB8071.namprd02.prod.outlook.com (2603:10b6:8:18::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Fri, 19 Jun 2026 05:40:32 +0000
Received: from CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612]) by CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612%4]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 05:40:31 +0000
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
Thread-Index: Adz/raCJHnhMePdGSgGOjA56NsXLQg==
Date: Fri, 19 Jun 2026 05:40:31 +0000
Message-ID:
 <CO1PR02MB85695328BDF3E7F1FBCA023BF9E22@CO1PR02MB8569.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR02MB8569:EE_|DM8PR02MB8071:EE_
x-ms-office365-filtering-correlation-id: 74bd70cf-3890-4448-0d16-08decdc546f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|8096899003|38070700021|18002099003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 DcTO2csnKG6Xdvh9f6B6+BBhGBT7WVhWpYxvDZL9mR+MFkSzQHL0dLbhXZyooVO/mAdxU3K4bwjlF9zRsPyJU5WvmSfWYXoVkNVFqjPq3TwilseCIqfdY6OgETmmK9mMvAldG6wR0tzbbzTm0+s9aXWtpNIhh9aAV4S3GRY4vP9J6anwqQnHtA3xCmCZ91nLMDOtqFr9t+wxPe096AHnHy50Yn2mWyMGT7L2EMALePU9bhSJRcMPCqdcjoBRZNFg8P8itE14AnuMxVpNU1sU/LwPLUa4o1MqprzsrHmgqOWnYzpKjvcvzPYSs1oMiDNhCI9hWeoRp3gTG4vbd7Y8s211ATkSl0ycuLAR4opMH2v6+C7k/1DZYaR+wy8d1NgZ3otDEZEVSR4mUiPIYge1S2V4foDj/aq4yiKLoukuuVqyv8S8s6ouW8OGRiDwIX3iIDfQ7OTGvpFedAps2u80ARcBxs4jGWBIZ80QoIL/0AlAyyOxQ8/e3v2MygJqm+Sqyf9X3vnsD9S5vR/q3KUPSVpsrk96V6L5Q5zYptx3YVHDfbolF0K1u05oM/KBJ+hdldU0AtD9TZ9TkP9RZ+06VP7mLfhrqB1weUropwXz6WzTG5BbrAAcidwjCq3VAfreyKwrbYQFC2fMre5co/TC+04dMSw6vxFiZFD1XIB/v/KFrfhwX8YmPF1qPIbogha4Ud72YsiiQaQjaeAmIwe6759NcCJD+547Z8FcnleVdh4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR02MB8569.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(8096899003)(38070700021)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IPjtydl7BbN+OKRi+tKd87cVVI5vfaiUk+VgfLTZvxkTihFw35hWPzpC91t2?=
 =?us-ascii?Q?4QA39SPICQdA00Yb4KOMN4tygOxfMqsriMNh4WrNHaGlXmrgQYAtfhNW4Hto?=
 =?us-ascii?Q?rbfihw2z7IiKTx2Mivl6N2YDScp62f+O7P4lgr3TFrl8RLKWBK61ARPlDfm5?=
 =?us-ascii?Q?0HN+zx3H/kT3YcP7HFkEdeNKvXCPj0va5IVpEIofYKB25sIIPiAhTk4vJzwJ?=
 =?us-ascii?Q?D+QzrYAQ+PE0t2bU7Kt5NlvAeSdoDq412XTOxmfkZnuz362nzsGwCNX61qpx?=
 =?us-ascii?Q?W+F92r1YgHayRKIWiTrqRZbivd7xPs59ml692a8gMxXr+6gNVgl5QeSEBSAq?=
 =?us-ascii?Q?j1nqCWDgefomJSN88/NFKSUlGZdQLjybV+pUSdKO6izaRdULQ3yNc2XTpv1j?=
 =?us-ascii?Q?K3UnVaB+08ybHnhJHf7fLrb2IBu2syYZrN0N/oiNjQfu47L1z8gHoHS9mxae?=
 =?us-ascii?Q?7fFa3pf/opgTKi6eG6CuB8o0Z7EN7tp4WuBR4OJflyFqvqeQiKZTkh2B8fAT?=
 =?us-ascii?Q?EauoXMJiickwB/sjjNbnyOYYDaqsIpeXt/IGMK8+zNXUx1TAPuvSxu2S81a7?=
 =?us-ascii?Q?EZyxOttETvt8nsumWsfVOcf1TyU3Lppmg1vZwnGxCkPcgjmwgTTPsPdnO6xV?=
 =?us-ascii?Q?Q0e/WfudO9OzQRWgGfdBMv21B04KrgDGwUTpJDMvUv4BgO3ZMUufJwVT0HsT?=
 =?us-ascii?Q?9VAsL//Fn2uo3x6OvmKN7xHBDvXnyAB+i2/mRwQF1Fs6O2BmdJcxj8G7ZZwG?=
 =?us-ascii?Q?Yzy/QoRNvuiSR694bicEdBxP3hWzdpXLS3LOeefJqgnKX0bL/gFbAXcM7lD7?=
 =?us-ascii?Q?iVZ3OIjUfEXgobGRStbaHPkzBSQoly846E3FbonUAP9BbCyQys+qQ2G4I0Cl?=
 =?us-ascii?Q?yi79HcFzbnSAdJsKo9YGHdCt8ql4ot39HR7ACD5Qi3Zz/Px6RxGboKyU8WvP?=
 =?us-ascii?Q?lE29ynZ4oL4gTFAtDAtUiWyoMjDI2Yssf/1gREmmOrcdhofXyqiIXT74vLFb?=
 =?us-ascii?Q?4YE55Mn1nbWdynBzyJbGeexTIUfL/GD1pUEObDV8WR6usKegNe0GGx5EBvQA?=
 =?us-ascii?Q?lmm56ZPbhedpHvBzH+pmKK0bfTkKZc7MgdPDcDm0ADdth/2kBCNAttshNooD?=
 =?us-ascii?Q?NWdcxjwjkqNsfqiebUvQDTja8KpTQPzcqu/Q27gAtI4ZPFDgunRtGabUJNgy?=
 =?us-ascii?Q?gtDyJRQJWP28P3RAl+LFyhJEkNP+DDFXvkrHeQOt2mbNfNPtL+Ekh2T13nSB?=
 =?us-ascii?Q?s7CTARJHRmKCZRmsBVqIQHJG5/7D+HYjGV3ktjYwTWc8UZ1MU5NrHiZeFgRZ?=
 =?us-ascii?Q?eArjXX0+BogawAgVd4eNRlqzyFv4r7f838VGmXNSOafkwCeo5jOJetfy02IA?=
 =?us-ascii?Q?ug7khEhSMzkBNqxPcLfVKxwf0qDEc6fMP6SHzzmGyutQxVin6FXE2zGlZS9H?=
 =?us-ascii?Q?B785uM42lSpmCFa+tOOUIAlm5Upng1KDFjIgxQJy7x8yMPnl1OdRKnfCEdXJ?=
 =?us-ascii?Q?aQFcSS1Jkh+cNsQdlPLMORMSf4nWk1b75iMaPlsIN5QdPZewJ5gUZIpRRLzN?=
 =?us-ascii?Q?i2pbnI/849omlU7s966MXTVyr1yekl6gFHnN5PIf5ejfYvsFZ+jCRv24wOA/?=
 =?us-ascii?Q?o+1OpWPpHhwxd9BmBtdorcl9KEN2u+ZYrC3pumMELTMbztno0gdOjTf3GIJ7?=
 =?us-ascii?Q?7e6+zup25pMt0+eixWflqXxSlin61cZSROkR5yq7TRR5drr7dZlkyVGAD7de?=
 =?us-ascii?Q?wqMuno2RHw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_CO1PR02MB85695328BDF3E7F1FBCA023BF9E22CO1PR02MB8569namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	I9SRlGDH8vn2EeBG2h6Ev3MFoSPjlzzARA8CKkYCFZUER2wVPK6xBOmkMzUPoarcCXQQVmALFIXGDwro99bJhibMpDPy8U58pa8LIM81Yl9TLIBIdDMqBhrPnS0IQRWYvm774U44qXvs+krgGK4YUCs62MPl8VWqCXf6FIpO78feeNGcvCirys4fDvpf1OOVKAiIf7X/JEfKyIv06QdJjMv0JYCjI/B2PGSolPYgBjUusyMM3c9Lhy1FSRiyoFa1o9wwNEcUcICyvLy5w6YwHIOnGbmGU/I/dHrcTeugr+QgVZFPA74++B1lQosDr+rNc72CLnuaRVKpNJG6rkbcuA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KGQvaUcSCVxa15vZNQDyveECJr2kxW763y+4/fw8P78s8iQP9n7AgFcQFoh1oriVGwNK/IR3nHSInpKo/FN4ZmC1b2zg2ayviGYIG/3esFFOC1FAVCE8CxySiptZe3KNg2Nb3YUTmjCl+m521pyKr4t7t8h6aB3BlXkdIIn/pI4VtezyXntg0dqh4WK5Yy9aczbb05jmrKOVvX3VCxw19M8ljLeSUVa73/uEpVO95NJbTvVBgXxnlhOseuenHXAmJ9ZoEJdF5ptXjdHjVy1eKXs6Esj8ER0mdhYXh0Y95DsoYJ5Mjp7MSji1GPy25kDOM7luGKCcKBhY4ItNJVTOnvU2KHQKE/8+zGds+eJIh4xxdBCfN3zrQCsWoWfTsqKOGzl1fXH+pfbebxTglIsyWBDvU2C0MeckXxhms7I2J8w7NVURnXEwUOy6Bia9SYUnwr+aJ8PUrHbqsYDs9wqo+dvIuwRBviMOuuPWoorC5F7Q+JWOWDhtDRcihyyhFjrQruhXlPtT4zJNb9eJFPedfGPbrVVi48oeGE0GIwVSq70zQVqZ/xEucyReZPDpFY2HG9O3Zh9jhvL46ODTaZWEUONlGoNHyq30kaZw0tIjwhm54+aFdfmqyR+1A5FP12Mq
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8569.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bd70cf-3890-4448-0d16-08decdc546f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 05:40:31.5570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X3vQUx3hfv1X5/qYmnvBGNeew7LKboAC52gWmKaxTG+xzN6guQD+Ocm9qPrD08/ZIGSAZ3OskMsFtPmNVPfHzfDEqUf2snuRXFdUYt/4E5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8071
X-Proofpoint-GUID: q2U_AgxhiqHYu5WrAp9NY-j52tYkQok3
X-Proofpoint-ORIG-GUID: q2U_AgxhiqHYu5WrAp9NY-j52tYkQok3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDA0OSBTYWx0ZWRfX6mjPlxYo9TV7
 jTVYEUoR6gnkxylPEXq05ikFxYpU8kfT5gyCDkT8cwHUZyDL6MPV61l8XmUjiUAGjmqGPqchgbO
 bikenw5zt/owAt+4DTmV/dqZtLf3AXvgd+H5WCiLjjqTVGxY/ObhxwzjDdfoevRwl9GDDIQx3uc
 cITnJtGpr+3hMUqMdpVI7qKPXHVDW699o1aozPBZ7xMECSNAicjr/8wOnEGTfzLvoaFOfpo0b5R
 oYp5GVPfyIvigOAgzpDg3wkPBIG3Ew26yoE23VUc3HxP5G3DH7aLgUgqYCM96Bjcu1UsE5EDslc
 +jnbISu+aWXtHy/SV2MTFpIb2zDgAFhe1H1zfC/ifaCJ5AtJTgJieh6en1E8RzR8avfiWKtkVDH
 ox699bZ4gZP1SUXL/oWQ067zCEQHWyoCv7PFsHGguzWS9aG+x6D80e+rAyPQN/9y540gWUxy8sx
 foSVrzJJjAhogvbC/Sg==
X-Authority-Analysis: v=2.4 cv=H6LrBeYi c=1 sm=1 tr=0 ts=6a34d654 cx=c_pps
 a=lkbh7UP1KfD7YpE6p/j4Yg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=tMCWJGPFQV7RDBEO_pcA:9 a=CjuIK1q_8ugA:10 a=yMhMjlubAAAA:8
 a=SSmOFEACAAAA:8 a=nyUt58vozEy2cgJdDG4A:9 a=fjHmTbQCA4QiWplG:21
 a=gKO2Hq4RSVkA:10 a=UiCQ7L4-1S4A:10 a=hTZeC7Yk6K0A:10 a=frz4AuCg-hUA:10
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDA0OSBTYWx0ZWRfX6gKrUWTR0LlS
 pApTVJLXNAV1xGABIAEI0jrqjCz5+kByUsps0CuN8Btu3pXKUnwuZsIWJ3lzO8eUCp/Sgzcbr0X
 SDZ8xu+0iXQT/2NoenyTpxFBsJfXO/c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606190049

--_000_CO1PR02MB85695328BDF3E7F1FBCA023BF9E22CO1PR02MB8569namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25=
:

  Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39 +00=
00)

are available in the git repository at:

  CodeLinaro / linux-kernel / linux-firmware * GitLab<https://git.codelinar=
o.org/clo/linux-kernel/linux-firmware.git> modem-fw-shikra5

for you to fetch changes up to e5851e6ff573e78d5b0a5cceeff076efca8d46a2:

  qcom: Add qdsp6sw firmware for shikra platform (2026-06-19 09:48:10 +0530=
)

----------------------------------------------------------------
Srikanth Katakam (1):
      qcom: Add qdsp6sw firmware for shikra platform

WHENCE                      |   2 ++
qcom/shikra/cqs/qdsp6sw.mbn | Bin 0 -> 5709176 bytes
2 files changed, 2 insertions(+)
create mode 100644 qcom/shikra/cqs/qdsp6sw.mbn


--_000_CO1PR02MB85695328BDF3E7F1FBCA023BF9E22CO1PR02MB8569namp_
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
<p class=3D"MsoNormal">The following changes since commit e7eb98afc667913ac=
c533ab910c608bee7d08f25:<o:p></o:p></p>
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
kra5<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">for you to fetch changes up to e5851e6ff573e78d5b0a5=
cceeff076efca8d46a2:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; qcom: Add qdsp6sw firmware for shikra platfor=
m (2026-06-19 09:48:10 +0530)<o:p></o:p></p>
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

--_000_CO1PR02MB85695328BDF3E7F1FBCA023BF9E22CO1PR02MB8569namp_--
