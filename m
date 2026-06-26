Return-Path: <SRS0=A+NV=EW=qti.qualcomm.com=skatakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EF6C43458
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Jun 2026 17:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F12AF1F00A3A; Fri, 26 Jun 2026 17:23:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782494634;
	b=nZ5S/TZ8P7nhsM2fowRO4JkE1yUfie1+EFQpXUfd8YDnSO7FETVHUB/zXzfZaNaEufIQ
	 4x0KyDGdZzqRxeoqV8/JkkwsK8GpcuiF36DPWB0rDgNhOSzWDMsmYdyNOOacBL3bTjSmV
	 R797kAdvYM7TAfxv8lC+1wSlH+iXySSJqEwPgE8JiMtzUCV0CPL25iJ6Zlc3tkycvGjHx
	 4SJMahihRS794x6Y0U3fdN72kKLgYO6MPjYnPg8k62+42H91XDTmzutT1eUoQ7COQMMlS
	 pW0B2h58w3CovgoGWn3qLXf8uGe3rLih7YAE5HTcRpUWkDJFJAG0l6cfXQN9DOT2kvw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782494634;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jsGgyQENRWwdU+OquKAnzzlb4AfN/w9hAEuHejMgIhY=;
	b=SftcwQwkjC8phPOOoYSE6I7nUa6wDxlf8xe81tks5WTVvouqaP5gx2yauoD2CUdkzKto
	 Pn8YBOtqO06nbK6qbzYuD6WtCkO28tTcMTvxp8vKGGluaYIhhViZXNEzX/5b92vliddAR
	 BhzbOkPNT2LQksFQLLu2OUzCD1BYIaC6rGUBxP2aKrFnUvmRJ0/NIQRRQzO0rs85SRnM4
	 FalfqYlErugrRcnH8xxNQ5px606eQhsCF6FBBDcLzVZX75G9e0rLBZWzp7DWqGRgTsmvz
	 AqPMcgr3l/mPj4g1Xi0fmsaAAMMpN1VtDpGvz50p8QvmHjqPiJXit23GBYV/ed0hbqQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhdVQHUs;
	dmarc=pass header.from=qti.qualcomm.com;
	spf=pass smtp.mailfrom=qti.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38A321F000E9
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 17:23:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LhdVQHUs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 38A321F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFjM091727351
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 17:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jsGgyQENRWwdU+OquKAnzz
	lb4AfN/w9hAEuHejMgIhY=; b=LhdVQHUs/0bqYBa96/WmE0DlpwqfEvIrjVVOvI
	/TtHCe0/AMKSmYyVqetSx44vyv9J0/xG/JC+tgiByhhuwOdUWlsd9RB2bP1zzun7
	oirqo0lsurXg/Zz7Z0Gaho/hXBN2CiOiz21eoU8UiMtk0V0Qjlm0xSD+qbLhEOcz
	QxrjdE1qYyURxkj+VeS2PLyvfnp8AQNoZlBHiwabt8rU76fRG4D/jHvZj/dMd7IR
	2qVnGY5ABEWRJMd33b2jUPYBhpf0evC4YgYPFVVL0RRL+Do3E4ByZPBa0VwSqQ6d
	fa2bTPeNr0xDqmNi9UPMNofswatnUtDGridjIjpp/bS/+PTQ==
Received: from dm5pr08cu004.outbound.protection.outlook.com (mail-dm5pr08cu00407.outbound.protection.outlook.com [40.93.13.103])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1nggj08m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 26 Jun 2026 17:23:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lz0jkoAW76gQp/0KTxEJHCPBsS6ilH86OCMRxRB2MfF3uXOkQdTgyo2FhHKFFh7jmD6HbVy8NX8xXkN9xpxu/9o+WdQp0WPGBKh2ooAlqS/w4nfQlkF6WHAPLyRb7yKG3YobZ1CwEaAd8sUdXeKngquucEAPe5C0Din1jFwNmX3BaLqUBCkxtfC4X1rI+IBo1k2okC8+AVyZuYBA+Oo1aTQJH71Gfjbt7AZS3rNL/QLfMHqwkGz1JV9e64jcQ8cUEqKTXqeOfJL5euSRUyPB1WgsV7qnLiutjToxcT1eZNL+fPyErLPa0oUNIGTYKvIIKrCUJPayuluMSbf3UKY2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsGgyQENRWwdU+OquKAnzzlb4AfN/w9hAEuHejMgIhY=;
 b=yWdUQVMafCsLhCnDYC0jXTpj6YjVMXkOCqWcffIqHK66/CaIBwLfLjDpLLzQt0H+WCC5RmWs9xckIsUtXKxVq5ZXt2IYBvT5waTyQQ0PGASTxx8wGwf8ao6GoqeI00QJtnynS5HOf5I4SI+FVTWqEQmoBDfwpeyS9n/zEwlQGI3ZPBvWvbL4fi3nF7tOSqrA+MR4ntYXzq2Jz/zWKYROxIOM29XsrzU/VeZxXU9Ra9wOyUybvEt/GwxfWfmSeSnPRRnohwWrfv3W350c8RpMju8Sw08nF6U2wmaiwv9sfsX2mFT1eqHVaNIcpWiL40w0wtW3fEIn3OZKqOOnpc65sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from CO1PR02MB8569.namprd02.prod.outlook.com (2603:10b6:303:159::13)
 by CH8PR02MB10924.namprd02.prod.outlook.com (2603:10b6:610:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Fri, 26 Jun
 2026 17:23:50 +0000
Received: from CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612]) by CO1PR02MB8569.namprd02.prod.outlook.com
 ([fe80::f7c1:7d4f:e76:1612%4]) with mapi id 15.21.0159.014; Fri, 26 Jun 2026
 17:23:50 +0000
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
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Subject: qcom: Update qdsp6sw firmware for shikra platform
Thread-Topic: qcom: Update qdsp6sw firmware for shikra platform
Thread-Index: Ad0Fjx4/anDOFZ1+QzKvJtjXbA3feg==
Date: Fri, 26 Jun 2026 17:23:50 +0000
Message-ID:
 <CO1PR02MB85698F560E017D2B9DAD0B31F9EB2@CO1PR02MB8569.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR02MB8569:EE_|CH8PR02MB10924:EE_
x-ms-office365-filtering-correlation-id: c93ef1e9-fb25-4acd-3655-08ded3a7b05a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 xhIuEzFQZwKHC6eUX3L1WVrJJ+/D7GDdCPVIfcp29xJyHB/hVhPwyfKqoqd/qWbDl5baI3CiiYz7LjJ3TIRy8mCLGvLp0EEmkyiveO9NCBDaby6y3pVu2GZtnm7IGpwmEAp72X9dkCq8WFoi9JnqpK3G/jUWSOpPcgDhsX0/SkOhBI23YxDUSGvmPGUSdCeihx3hHplpp03sC/X5DMRtV5CnClDzp2ELAPAJpUYirdevIYyqYlnjhZ5IEnTf0H3p4yGpfw6293Z2yMUww1bqECcbBRv4rucItwaRoLaI3xZbHTGl2zADA0vExDj5kCACeYROKGTaMXUKzLZMW1mgFM7RdqqFVlhAzxk0M6N02OaED4VxGmtTFSzXCYphU9l2MDRE3WnsfJVeMiJmLKQB//E1GBLHm5PWIXMupZk9O8OM2q6OZGu+V9QDt6kkOHqRhy9Ii1svDSX9pHmeEbCXUkUkiNmvNYyliTXnluw1QsSbwxgpmdjgyC+RtTr8UxCDLIbCzzoBgPlIpNq5qhIqfbzuVIfQ0e/nACC5wfjYi7BTInFpvuuhJr/AxcOMKkNxVhRC5pwywcZH6/s8Cit+uOiThjdqMEgy8HvP/MV2uG/QVNehdV0L2R1KIetsWsd1eCKSt16k7cvzhxAlarNoAE0KDG9MxsTVtpXScczz5DqpxnNwkks9nermpbSft5LY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR02MB8569.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UmYklHxczaUeLihyXOn4SoLoZ7eyxkH2gaEUEzmswwP9aHllA15UO4hKMPpK?=
 =?us-ascii?Q?bIENgczKiN2vOp8uPijIRUcirVGybwxLGtmFaUyG77KI67VkCoU3SnglmVSh?=
 =?us-ascii?Q?UkaDZmui1jK8UohRfpFK0Ku6VgiyQNkGkaVh9FZ2a/F+sm1bFFwRctkyxjyP?=
 =?us-ascii?Q?ldbIcVP7yW4815GrRt4mDk0ZBPgil37cQnZMkltwLXeZotj59piRJLx+gJT+?=
 =?us-ascii?Q?2oWIIb0DgB9ZAuoGMfIngjB7EYS8H3w9dYuDnxOK696l23xeNQsdoJHWehfg?=
 =?us-ascii?Q?KueVnpbd4wtuaWTcbYpKYrdr1adBbBqcYZKI3JdCObl8tjqWOk0mS8mvxdex?=
 =?us-ascii?Q?0C7Hd4LgYARqXjniNJxxrfnUNjqQM5dFqMkXe2cqBBaRXjfIrbkGlE2y6Sld?=
 =?us-ascii?Q?/MseKdV5GiOrZlG9xZaZDUNEO0bBxejnH43dGu0jiwBeOXLBdJJquEIKhpme?=
 =?us-ascii?Q?RI9cpPMfdx4jRvQ+nam8Vkjj8Sm50fElKZFiJD1fUdFPtma1wvAHFXpAsVEG?=
 =?us-ascii?Q?CFUJSfNSoSNh7tnyahOv40G1JamNXy+sSDNQ5uqiNTIz+79a4tg/nx57h99g?=
 =?us-ascii?Q?6evHWQE4HVGM4CBCZaDuI7E6geucNxUAFmc1TGtwm6BzGNq+Hnz2KwAf31et?=
 =?us-ascii?Q?Jqy4iMgguWSBCwUVaodjT2K/Y2DsRpy6rNOzSvZOitIpkAS5Zv6zGZuHYYZ+?=
 =?us-ascii?Q?W/j84qbH9rIc7kNM49K/1NWqaphlGnXd5MDDt/4mIKxjVG3op3aJBf68rGjz?=
 =?us-ascii?Q?x5B0wBjWlo5aMRvwFKSgkYC6DH9EBzJ6e5SV94+pjuG1cduenHAxtet9a9TD?=
 =?us-ascii?Q?9khiiD1YchYsjahSkBs4CbH80a1K5BCrqWbZ29I7G02mpL8f2U/AOAOerMFc?=
 =?us-ascii?Q?W4VYEzFcyHm/6GkLlENaoiCeQ/dGQleBVldpd17eoj/6Awkhogth/C++q8NL?=
 =?us-ascii?Q?2Bam89w6BiU3/Z/uf8dqoZtXtd6/nArP72CTCI0XQpgW9WSRXJ8Tx+wJtPTF?=
 =?us-ascii?Q?nprdrWdZSkBXXkXXDPmb/Kr2R4NwbzbavKxocKi/harmVVmmVyKjHxWXpHw+?=
 =?us-ascii?Q?/ds1dUBJB3TU+6adV6ChnVF58eYY+W8h1IsvkNfqfyUiksNjGYtFj02t8Hr4?=
 =?us-ascii?Q?iEOzc1Ms6a8AubIiYTYqMnxD85C7jBWKz41suTQQUOCOdwddW13Zly7vH38i?=
 =?us-ascii?Q?S4QrVqqrHgIWCAugxxfRINMfUy5mob7jSzo43dCky03mtVtwMPTI04OM3k2E?=
 =?us-ascii?Q?vN6ajHPUK7dX8SCYYZ2rIW3tPqgVI8+vOYzEseW7JB7ljvdSfcz2J3p4ufDA?=
 =?us-ascii?Q?uKYbIKQmIxvjIuMGohRYgwrBOIPINgQIBmGs3NyVTPCKIjBfUhdOQJ1665Iq?=
 =?us-ascii?Q?vw8/WHKiQzJhJIIzrdIF8pHhBk1mXmZ9ox3w2H4ecwy/lIAHhMBU24NRvP3V?=
 =?us-ascii?Q?cNt6n48VICV6DvAbIIqZ9HCQY7zo7A8rapowdxZk/Mf3GyKYtB+MiiLoA/zY?=
 =?us-ascii?Q?rymu8lgvL47vn+FQJ3oFL35ezacp4QPx7cZNSzA8UgoulLhlHeLQxYnESqva?=
 =?us-ascii?Q?KUzXQVJR6LdbhKxnfPyo0d1LfcX5ddwOLIscSPt9vZanDOIVPmY+/RERJc0H?=
 =?us-ascii?Q?KorK71N8moT5vxwr12D4ZuuItVZCSYo+yPehZJ0PpwczqtyRtpmNgYTrg96Z?=
 =?us-ascii?Q?mJBl2Y/uUl99o5FCz2oiiAEsiBra+fQgLkdiiNok34vw+sBbf/7nCOlb8Ssa?=
 =?us-ascii?Q?AvczkW2nBg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cyhHgAoBwPfVWT+WsBDM33x6wDclLxbM5ohl15/mWipwaXkOt26LIIBhiN1nypS53g7q3fyPWGULz2rTyHNCxWmnWdt86x6LhEjMqJWP4Dtve4OhLKBk8Vh03Vxe1g+otv7XE7FvDxJzwXj8Llhp7GSvOerxWZqClS/lHKaCQzOQUSNECr1owvhYGonzcXmDuSZ2XxAbnA7FpfV3Yxv1XZ0Lahe/K9baGCvOVFvYK+b4R8AHk+JP/ewPb0mHY0qkMyD5ByliiaYgs07gurtapiA3LivQ0dVSxlYzIdDZ0C/+xH3LdStJwybDqbUQMbF97IuIxtLYiaqgbGD/h8e3Pw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JQ73j+DapIwq7mxEReAAIVGIPjXtN8/w/sFDyTBDiodhd0vHOwCiPhclcfOH+CulMnWYe6M+aInCScKtzgV3gQb2QOMrL0nv9e1SMggZex4rApuQMeU/fy8Sg+IUYeCL8KhoOoHAIKR1/gAvx2fvRcs/vMt2x6hlDUqdfJe1w9glLmyeYtWT2a/FuXGXfXg5JZ/vg0rbH9q+bQsZXJWA3viF4bCAujTEc8leo/K3q8V53QxBtGPNfgLLYgzqybLYd7YpByQVtusD7Ah4jTNyfGWOP6vfWJPchdO9lPMVxzsvDUtY/2VqPbaNslTcal/ZSNoj1lD0+EcSQPXOL9wPYYM7Z9iPLxWPee39lgGMpAkc2WZMY4cnbd1qLEXiYzm+mYDAc9RQxwEiMYyINfkzj7gsl/dbPqK+PxB85xM31pWJIXo9f8/PA+2X7COPFiMN6dKVOfUzqfCt9qLwmNVeqjAhTUTGGX6Jp4Kl+AC+EJFWn1xpTXTgZz5u0R9nBokjwgZb5HQOJLY9M/8aOipvsgWDHK0W+qWrhy701G4Q+34h4Na3Y7RlCgyVhS4q2miGZvaM0Q/b3nx/qCA6kMeNeszSayqcGw9ZXjx6/zAizRzA9W0/Vk2zU3BZpXyfEeNd
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR02MB8569.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c93ef1e9-fb25-4acd-3655-08ded3a7b05a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 17:23:50.4347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWRxYTnzkIKp9OPq1bAer5QVeeDRxROSGsw+CZpttgyXltKlePDq9K/NmyBiy12C9FAfpumHyaY9IXZixcCisQNnk1t7WYHs4WLBpD0AD4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR02MB10924
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE0NSBTYWx0ZWRfX7UkHLYV06BCQ
 1yJzftgiN3bRPZcp2y+Gtrfy5D3mWd66v98TkYy06cVogdNrG9cJssS4t66djsTMJlz1/+K5Zkb
 FXUizBbK3l2liM4IrJ21v6pQRM7t2NtpWqozW8o1DFM1ev56G+j0+6G6Ebrf9aXhBsPcoxOEGBJ
 hwTh3zUfb1V7HaFMLMVCHWYv1W/JaOcMHfuamIvxTuTYfjrOjhHwkAhumQRk3xT9ul11hu3EyZM
 82r2QsUh8jgCtKg17pqECIIHs2KGKZEy8yL5k+bE9iFZedAMTfEJZlEHnxuWiT1YK+if+/xtpvn
 Ey0KRRS408SBPGQWcNGuqN/dHD6qqsgKuNk6w1+uBhJFfJSAa7gMTczbVFrOx3CuDVOxVkwIY1i
 bsvtbmWlOq0Ams288+WpC2md8XDONLvg17G1QQxGEN6jEQlzQtRoeuNhApEzqBa6Wyy83UsKdry
 TymwUEVVks8w9hyYhgA==
X-Authority-Analysis: v=2.4 cv=KNlqylFo c=1 sm=1 tr=0 ts=6a3eb5a9 cx=c_pps
 a=9233HxQhCuv4AHT522PGaw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8 a=uzgQX-YNPCFMPQdn_PAA:9
 a=CjuIK1q_8ugA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE0NSBTYWx0ZWRfX0Om/gw6PagJS
 4gaFp4V4RCtdGZHlcoUz/r1NHF5U/UDWkJErQQ9028VN5NyGyd8UWCe1B36esyrN/iq/9Fcmqcu
 IF0Jot/QuYM7Fb1Nq+PsHE+ywpHOmCk=
X-Proofpoint-ORIG-GUID: xBAMssemBLmEWkEtTnX-MaC2OnhUceSu
X-Proofpoint-GUID: xBAMssemBLmEWkEtTnX-MaC2OnhUceSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260145

The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245=
:
=20
  Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26 15:53:01 =
+0000)
=20
are available in the git repository at:
=20
  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git* modem-fw-=
shikra6
=20
for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744:
=20
  qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 22:26:52 +0=
530)
=20
----------------------------------------------------------------
Srikanth Katakam (1):
      qcom: Update qdsp6sw firmware for shikra platform
=20
WHENCE                      |   2 +-
qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5709176 bytes
2 files changed, 1 insertion(+), 1 deletion(-)
