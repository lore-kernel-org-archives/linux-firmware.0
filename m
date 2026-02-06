Return-Path: <SRS0=yGzr=AK=qti.qualcomm.com=xueyaoa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9BDEA795E
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Feb 2026 05:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73E28C19422; Fri,  6 Feb 2026 05:01:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71ECEC116C6
	for <linux-firmware@kernel.org>; Fri,  6 Feb 2026 05:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 71ECEC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xd5X1630197
	for <linux-firmware@kernel.org>; Fri, 6 Feb 2026 05:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=twGKE1rNAersxWJ/RNmtBDmhIQG7TlP/VqWmrzYLPUo=; b=Az
	cK0FOoDwjf45rGIE9MpjQfpOxR3dfqQ3fet892BUublDAiy3MGn4E1X3HTvB7eEL
	B7K2tsyaQsMI2P0lhk+2DeY7CSooB4tkl9EE9jc4cQPsAG26nlNLjUN2/DmBlnFn
	QdeO0MpRmX/klWKy/c3kVZIOj/PGcC582RT6TILHmOfSq/UYWB4ndNpq+CfZ50KR
	UTOmeFl+xSw3Em59+86UjSwnrm6k3YlDqPQT+5c8nyQ8BqmOvrmaQ82XvtHnq4D2
	OFHjvUPT8ijWwji3ReLm5zabz3ACF+j8COvLl86+rQWeDrjuoVscybjzvaaJwtw8
	Ik6Djib3cEoxQ/U9IxNw==
Received: from byapr08cu003.outbound.protection.outlook.com (mail-byapr08cu00301.outbound.protection.outlook.com [40.93.1.105])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8u4ra-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Feb 2026 05:01:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcnm/B+rfOiCUy4w1jO4NinVnPimVecp5pVngToeDvI7/SMjukcVU3ePX8aFsrM5z5j2QMaB6c0+6KOuDM3v/zr0jlOzjAkqS81zpJh/mq/PUICV5rcVmqJoh9SbVaD/vG6nQub3pNWM0I8L/U2aV/4koGbT+zanK9YRiGn7VUaZxkhmsFgr9burQ/pek6842r4undrkiM/iICu0qVNYQ5Y25OzCCjcBBDV9DIp2dV9KdJyjaP3zhwWq9ZmIFnJ8+KTstu6ZueblTITsuzD/kV9w3frk77RGdZGiH5YpjNmFt7HkxLVGH695BPjVHOnDlF2WMlMn7WXv8rWCovPMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twGKE1rNAersxWJ/RNmtBDmhIQG7TlP/VqWmrzYLPUo=;
 b=LMR/VX5Z7wfVCEnIe6noKUU2IZiz9RMPlmeFuZjKX42WvwIoFvTVH91DdDyHz1FPHBu5k8vrHqrj/qFNhykSuWaadHBT3W2vf8fYxK5Ulzp3iJI2E30YbNtpD9X/sOae9IbHR9FoZ5RPe6ELfjWbh89hzJJLekSYRSWMkBQMODdy1g7B1LkIYW6fCZhWXLGwNqlDgQhdQJYc9l9tScZxmn3JmmwDnUGXpkKjwXRS1gNn/GSCCWQaIm7hdB6DQP5v+2ZYUDjb6vaNxDjiRTm8dbcfiQDXKzeXC8CBXURwQVrtKWGCyXffqHoB/Agr8CLTabZe8B7Rs2vsd8pFDLy7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from LV4PR02MB11027.namprd02.prod.outlook.com (2603:10b6:408:2da::8)
 by BY1PR02MB10379.namprd02.prod.outlook.com (2603:10b6:a03:5a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 05:01:04 +0000
Received: from LV4PR02MB11027.namprd02.prod.outlook.com
 ([fe80::cd3:93fa:cc18:8c6d]) by LV4PR02MB11027.namprd02.prod.outlook.com
 ([fe80::cd3:93fa:cc18:8c6d%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 05:01:04 +0000
From: Xueyao An <xueyaoa@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Jyothi Kumar Seerapu <jseerapu@qti.qualcomm.com>,
        Viken Dadhaniya
	<vdadhani@qti.qualcomm.com>
Subject: Hamoa Linux-firmware: qupv3fw.elf
Thread-Topic: Hamoa Linux-firmware: qupv3fw.elf
Thread-Index: AQHclyVkA6ETFskdTUSwJByJha/rSA==
Date: Fri, 6 Feb 2026 05:01:04 +0000
Message-ID:
 <LV4PR02MB11027E62DEF383623683543F18C66A@LV4PR02MB11027.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV4PR02MB11027:EE_|BY1PR02MB10379:EE_
x-ms-office365-filtering-correlation-id: 42a1a8b3-d6fa-456b-24d8-08de653cbade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|8096899003|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ETmobj9wRfUopjD58yAO4xbJaisctbYIqpI2L6ki/AYCRDTPjFUmfFY8xp?=
 =?iso-8859-1?Q?VTld7/W/qzofdPNbh5OTVvFDc/fSkxaSLohFkHDuXQGladUgBUoNBjFb1R?=
 =?iso-8859-1?Q?iPs3TDkuCmoRbSEV7+d+CPP+J94ixgBLXvCPvXkQXLqirfkhbL0mkgmJ4R?=
 =?iso-8859-1?Q?cjJXWqRoeNhvqDHUTdvlJBSuxRuGX80tEHSXn7PeVuIV6ThF121wM023jh?=
 =?iso-8859-1?Q?A8LpRWMxlSF3r0bB4t7gBTj1mtQbWdjkh7U1/MZCvklF+m/YlUHmoV4gWZ?=
 =?iso-8859-1?Q?x7ltSw891Ni2FeTGMimnwKtxiuZ8GnX19lioC2faoV7kp2HW//FPtLGZNk?=
 =?iso-8859-1?Q?iIJJez2mBZg/qC4VS3VxcOPQGVmaCS8HUxnAxqLs3gYAfHmwRYGw0lzfQJ?=
 =?iso-8859-1?Q?cbvNbztpaqgxJmXj9ECCzpAOpuAtIDRSUyKj0hBVmZjT3o4Cyc5b/EQX8n?=
 =?iso-8859-1?Q?GyoqLfpAY+M2pqyXrHSMDrgOqasoucKg6Y5cGoQj6pd0mKhzsv8zGJO6rr?=
 =?iso-8859-1?Q?ufWEEXQ2zYizO8AdySYhb0IDh272lkhuBRmb+mmoB8fDRt92AvT4nTyyaA?=
 =?iso-8859-1?Q?x60b6i1nhoEScp73JKr8SW5LJdJb1O9/YfYBswvSW41oDBlWxhKkPOoDZR?=
 =?iso-8859-1?Q?ZW7iwW6UElZnRH0RWDEQ3r5ToR9CI7ljWuHvsgMtXQNiXZP3t6Anyoh9BL?=
 =?iso-8859-1?Q?EbVNPH+ZGFCf57VJNAETwXDUkU6JTjizwU7/SDK+WnqqTgY4op2yTgCzr9?=
 =?iso-8859-1?Q?ZpyiGjBB8hw6f5G45oudFKPvJCOuYQ8K5ccRobTUNPCPkP4WlhOIVfG8ya?=
 =?iso-8859-1?Q?2Vwfi4P0voALimnFUUMgKv74WGbkcNUbJ2XZo4LYWUvtcgEz8Duor8gxp0?=
 =?iso-8859-1?Q?aONqmNRrKzWwcqCBYK4Pe4qAypG6BGXIGNhrMxom234BeRIrURnzpB/aBJ?=
 =?iso-8859-1?Q?uiPy+uO1psIMLEd/ysa/YQJQP+IgPE4P+Qwt4AVo85CK8cZKcvaZNFVLWp?=
 =?iso-8859-1?Q?J7AJVRrJwNdHEUn6dMR/USqQ866+KhipOBZAkpndgSfF5ThibI6cAbyVaT?=
 =?iso-8859-1?Q?48QsyqRylZAviWclylcZZLsFFyNdjpww/ZZpEN94XMIKYFI2GiIdPGAwRw?=
 =?iso-8859-1?Q?GelEwcMq19DRD9GduzdVu6WZe8mhVcR02Yviv+lPptDOCBFgQHHH0wipHU?=
 =?iso-8859-1?Q?OFNWK5cCprUgCr0BNi+DAyvhw9VjcJbE01ZSbNVANGXwMChuIBMpgPL/mj?=
 =?iso-8859-1?Q?NWTMahumIk8QjKSSG0zLpHp/dcJMmYTRexY0s21JBcjAZkaSc+K0VRE1er?=
 =?iso-8859-1?Q?V8E8bXOUMI58jwWBlSWMqMggBtkbLRSIvk4GyvraIdYls2VJnhRc2/42qz?=
 =?iso-8859-1?Q?angB4IU43ZnlJx17Ze/pUPdsHoOTWjisk8Gl30duPY/fnEAA25FiD/7Ohj?=
 =?iso-8859-1?Q?W82AXdG7XPHAdea/9tA46x1N4dubWTQe6i1ZX4dzN6KuMM6jhagCjqfBoV?=
 =?iso-8859-1?Q?sjIqjEdWagwS+PPriGFhTcJ14ajA7VV3PFFDZqR34F2BDvK0TThXNQZJwU?=
 =?iso-8859-1?Q?okOGkf2pF1gsTFZFNFo72G8c+siBXyCrQqKLbXxBeoDDP7AB5MHn3NFQIP?=
 =?iso-8859-1?Q?3gZxxrXG84nT8PO57JJzKZ8g2z+4LR/gNy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV4PR02MB11027.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d5S3iso8T0rZc+8S7lEJp9kmXh8jLFhGMoK+9xFg8QNUBQTaOzCunAWMZ1?=
 =?iso-8859-1?Q?vdCxJnwdljx8aiCKJ5sDJ8K8IjJ2VNRD5lKgEUZJ2zSfRNY+hP3+Fk74Ss?=
 =?iso-8859-1?Q?rbPM7bGHpc/B/X2i7UXDFjtjHBAITHod9wPrbBOJOXFwT7h+L+nM/yctJ3?=
 =?iso-8859-1?Q?5mFFg4yMTwj0rq9BR/yRX3XBKV2PqAHiqvkT0ROUKEF0X4TZIt/YGop+3m?=
 =?iso-8859-1?Q?33L/5/ugQE8FOrAX2jXUJy3NZC83pZkS4aLpsypp3MDOPG/gfZwy9qcD/T?=
 =?iso-8859-1?Q?xPYBysyUyu18QS//vXJv1/evuflfzTawGE/XBI56CvSvfovyAyKcm3J8Os?=
 =?iso-8859-1?Q?2hQ7r3rgbMRnZM7xpjkWtX565oi0+6pbgKWQcR6Eay1Vwd1ygs3KiGf+bv?=
 =?iso-8859-1?Q?OuqnMgRG06Vh9M5j2cr6ZMZZdd5hSZdgyCB4YPnazCDk804oRxx+u0g3jY?=
 =?iso-8859-1?Q?8pZrtx9lWLe3dDl8xyQfUwVyAp74LS1p4Ine+IhXTTgHpBLkP5DK8W4fXL?=
 =?iso-8859-1?Q?L0VA/GM9JkNpvJxJ3Xn9QhJMh02oDa0Wbi4VL6Jsr8RaZ3g0MY4b4X4VIB?=
 =?iso-8859-1?Q?yjLo+hfqdeF3MIUWoXE2aG7uBYLWRi7wwC4NaiFzGcVMksLVlMJMpp2iEr?=
 =?iso-8859-1?Q?faIRWgc2GTenmjjatZ+7xunQs/jkb/8y1krmDyd4lYzSSs87y82wEqUnQZ?=
 =?iso-8859-1?Q?5cfgJj1vsdhVSBv2u/C5HwcDQtILKS9IiEYgeQ93wLlkBo3nh5SMEE3D9x?=
 =?iso-8859-1?Q?YigaVcE85j12jeGm8riaAyTsXph2woBFuX0ifnQlajl6IEOkGth3DnaHAz?=
 =?iso-8859-1?Q?XNtqz9KDxr1J9tMwKSMOpiYQ9WbbqikXAnD/C5vq8MQ2FElEkbcqBXZZU9?=
 =?iso-8859-1?Q?sXgazPy1IkchTtWiPOlMScREJ4WTCS6zFoQp8DcNLBIgjsRvuU25dOa0KO?=
 =?iso-8859-1?Q?+OeIQ9QGVsLVhKc3m8co13JaVyIlxdChS6TsKbn4ht2cDwo1LelhPzTuF2?=
 =?iso-8859-1?Q?pqNpispxq2A/wvIALtJVvZB6rRNvVjlqOfNK9/mTcEEvoknhp1ZtuSfuX5?=
 =?iso-8859-1?Q?HmCYgt4h+DbbIfMZRAfGYaKRk55Dbt6a2yPxux952ReyD3F7FEvVx+/FLg?=
 =?iso-8859-1?Q?Bk8ZqOVCD0yTmjjEYplUjpjWN9EBspRgbSQKpJwJSJ/ONM2W5e1eDIsRAW?=
 =?iso-8859-1?Q?hKjdSQh7VnCG/yS2yySt/OeQTZkNcRO7KPiLFxj2GcYSWiOZ712zhEYUFD?=
 =?iso-8859-1?Q?l0cswSLVLrOheaxSlkHb+l/QwLdF8uJpe3cbbN3LR1ngV7Ef5sg8ewPfYb?=
 =?iso-8859-1?Q?zGKyGrSDAsgGa+ELc75gJQXoPLP3Za0EDGGQzJ8McVQRYwtoAaFXM9KxMi?=
 =?iso-8859-1?Q?ltroiSwTeyR3pEiJQ8FOFQCSV6C9pWx3w9CZTW/Et+jVZNl9wFQDo57AKP?=
 =?iso-8859-1?Q?AXcxZA5HC0ElhUMOuo7g//Pm/uqD1RlvoPqp1kScdBfvh+8J9X59pk2QYQ?=
 =?iso-8859-1?Q?ruA1OXl4X+V2Wqpk3tkGkxm9kLks618dpyKsKw0dhXoI+vWz4M6yRu1mue?=
 =?iso-8859-1?Q?eHa3KB6Kl/EZr9N+VfS5RSLSnkavUNN0J93XMDQb7gOxH6FRFPF4w4C0Ay?=
 =?iso-8859-1?Q?C8V7Xw5Ad9hqWlgbVLSPOF9WUAj2klH3jbmskuw5yQPAeLvbesspNxZYKw?=
 =?iso-8859-1?Q?NNLCLZDx/lVGFBz8LSV56euLOaoK1Q4fPoOuttbojAQEvDe3feIxGlJcba?=
 =?iso-8859-1?Q?lva0RmvvHqBCeMJFwZ4iNSyHLvZ/cSpDywym3819fWA4MJwEXOqNF4NJgx?=
 =?iso-8859-1?Q?hkaMODp3Ow=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV4PR02MB11027E62DEF383623683543F18C66ALV4PR02MB11027na_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cSbc0beFiFWvaB2NRP78MUggRBn4dfV75XQo8f+OFo2FuI/S3bER8vy4CBpxMK967mHjKE7gIAyjRYel8nkLWSlH5r1Osxg1blyoUDSD3e880H4Aui6WtPlPw7W5jI8ghqX2YcHggay7SP++vbJ/nCfnMsQEb38YRwLCVYeL37yA4Rdbu8fcw+eXS72gop0dNZjdQU9enZKCnp32X6PPcHV/XacehdK8/fpCe1afuwI2SNJQfU95FQ6sJPtM/9bgExOm7tIjOnnbHwoFQmNwq6z6+p1yM5O7pX+4KZpS/zkuZbG8UmBKCR954F9rupuK1tALLMDWzzhBfaNA5Zv1G9YcvZkCwUKJLaIVX/L5pMGOddgL7o+a2cNk+nZuaLZp17J5BpA3KLAxQy8BYb/Zvz3Sl/5+K42URkkwZmN/ABahj/z8A9dlxwFMzvrcVzqctXuv2DU5Rxh6IUFxHE1Sw2CWYMMuUVTv/X1SvSGXSx32HcIUfwg+AHtzxejS6KiHqOyVVsz3MWpshRGvRDCtJFHlpyjrIYoQJusXl5wBQdH7F4tXjfAxaQ9lcOeNsJ9H6sKixSb/BgLEmr1TTwPAB33d2dMPFdrSix+5vJBEdAFtrAWD9hsPWil8u1Q4D9qJ
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV4PR02MB11027.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a1a8b3-d6fa-456b-24d8-08de653cbade
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 05:01:04.0359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytbB7uBJEkXDVn36Vza5P0XW7CvekqG/dYuNKOB3yXzB42dc7qpDlXNe4vOI+NpOgASEp7Bkw1CuQiqtTaiMPA+gV/Vp/wZSHO9KE4DCPa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR02MB10379
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=69857595 cx=c_pps
 a=kvx6ZQzDH6Ei332aIKkncA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=yj1sxr4RbS7r7ypeV5sA:9 a=wPNLvfGTeEIA:10
 a=-NHU1dP35niUBAqfrDgA:9 a=yTSQk_gW9q9NSbNT:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAyOSBTYWx0ZWRfX7mf9xr41htne
 RmoV7QyKsRocG/yOWSPJdp9pAOvvmobV4syCwDL+ETANJ3tiT/Pb2fpVtECXpoy/XAKr+ug4zfV
 4meAKA86FD9/RotxbUflfYyD+FpbZOtrDf1KVf6/IDopr6qVknkbCjRJr4ENvtQpc4GKLFb9b9G
 Hldw+2eHG3jF4jE8Hlc5F1Az0VStPET6ZLhfa/wR+9P7OMjcpd8SV1Rk2Zw5AFju0A+B2NwZF90
 ywQb4i12F1ilXaRo+uxvRGZmn5fUDrm7sfmFdeQFAfmCokvqtUSxOh14Tm1n0qcLwbpsXd1JiqS
 0PNeOaaOG3OSVQ8slqpCF9WGK48rDGwGxdb0pXtbRhqx1TlyDWZikalHb2WTUOfKprgk5kyMDNu
 u+qj1C59fWt8DcECIluEHMNZTN4Ggdz5OuRTWZM1j/9zZ9Z+Brj3Lv3GJBggkEA/40ZxhoaU9pS
 FOWm/HHEHtfI7PCjDWw==
X-Proofpoint-ORIG-GUID: RAc2JSm3e_c2Vbkhe7g8QEJ01VesFz46
X-Proofpoint-GUID: RAc2JSm3e_c2Vbkhe7g8QEJ01VesFz46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060029

--_000_LV4PR02MB11027E62DEF383623683543F18C66ALV4PR02MB11027na_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The following changes since commit c695356f6ea11b6585b85d31931bafcb10abb2b2=
:

  Merge branch 'main' into 'main' (2025-12-17 00:42:29 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git qupv3-fw-h=
amoa

for you to fetch changes up to d8c5dbbfac6dc054552295c13b03a4ffc959539b:

  qcom: add QUPv3 firmware for x1e80100 platform (2026-02-04 13:27:20 +0800=
)

----------------------------------------------------------------
Xueyao An (1):
      qcom: add QUPv3 firmware for x1e80100 platform

 WHENCE                    |   1 +
 qcom/x1e80100/qupv3fw.elf | Bin 0 -> 52288 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/x1e80100/qupv3fw.elf

--_000_LV4PR02MB11027E62DEF383623683543F18C66ALV4PR02MB11027na_
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
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
The following changes since commit c695356f6ea11b6585b85d31931bafcb10abb2b2=
:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; Merge branch 'main' into 'main' (2025-12-17 00:42:29 +0000)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
are available in the Git repository at:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git qupv3=
-fw-hamoa</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
for you to fetch changes up to d8c5dbbfac6dc054552295c13b03a4ffc959539b:</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; qcom: add QUPv3 firmware for x1e80100 platform (2026-02-04 13:27:20 =
+0800)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
----------------------------------------------------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Xueyao An (1):</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp; qcom: add QUPv3 firmware for x1e80100 platform</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;WHENCE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;| &nbsp; 1 +</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;qcom/x1e80100/qupv3fw.elf | Bin 0 -&gt; 52288 bytes</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;2 files changed, 1 insertion(+)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;create mode 100644 qcom/x1e80100/qupv3fw.elf</div>
</body>
</html>

--_000_LV4PR02MB11027E62DEF383623683543F18C66ALV4PR02MB11027na_--
