Return-Path: <SRS0=22N4=HW=outlook.it=marco_giunta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172E5CA5FC5
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Sep 2026 20:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD9B21F00898; Wed, 30 Sep 2026 20:33:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.63
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790800412;
	b=nBuNph5yDcHGxW2g0RoFEd9D8RMoRp5fbYeskwra5IHBhNKvzCMdI/t53yylWgz9qmn3
	 MVwq6a0zpArQt+LqSTYTJqsOGDsAF0Ws3BHgftR8St0858WV6A61932G8H8xZCwr9lu+h
	 gQ2xUisR1l8UnLXalBWKlFiJ89zm84BvIjjHXBF3O53I1guhgLTT1R5VdPvPPGztq0oGY
	 wrX5BUsowLoeFEUnkS8yWUzo2svBBYblvudNXdOGzntIDzxeybCUTZ1SZDThG5GaiCBYK
	 pqa1xZN4tBiLWEIJv5A6GnbaYatv8D8yzGuYyR2wy9a4n53mVkatXvgxK7MAmYxiZLw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790800412;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:List-Id:To:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:msip_labels:
	 x-ms-exchange-messagesentrepresentingtype:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:MIME-Version:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=tRvgX7Jdu/FKtkKXah0wqyeCj44ed2eDr1vYH0DHUTs=;
	b=Fu09NVgg7Sa0NzNn5r5FjwLazbFTP7Rib0QghYW7kuP47G7y5S/X5H58T3SFBYJMlqfF
	 VkzQigIXrK+JW7DO6fN6Thv4f5wusSZRNQsHm12abgnZl/eUe0O9h1L0Ox0Cf4394EfVS
	 6EFXb75jPvR7wnDknEBrzoQlApGoIsLIchRFYBBw7LgIbr2nSHHMLLjRoA3vkRYf+tgzk
	 sWcQsbdYpW+3WNXcrWkaqQ7YQ+KN1Q6oWsBZ8DevpmyBspD5C9WEg0NDCu3sVrUlZwC6V
	 DrDvVd3hTtrNNO83pkkFnWq9urPUpQG/njSzKgdh20lqoKWjwJGW+YlKjtGTxPK1RSw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=EdZGayFN;
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.63
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011063.outbound.protection.outlook.com [52.103.14.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3D001F000FF
	for <linux-firmware@kernel.org>; Wed, 30 Sep 2026 20:33:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=EdZGayFN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E3D001F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.it
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSkokUYj//dwC7xphnoSGT+60CVgj2kHw7ZA+UGq/zP4wZEZyGUfXp9OWEiYGb4QWcvT/b3oUUA6WBV5Sixd2M6/toNeS8hzlrYhfFI5BAYP5tR22moNFWq3XFlclNb4MTRCKtyBbwcDsHqsIC06G0ADRneBhbdKrgihsQ5KaR374T5ZjHFU/0lLWlWz2g3J+lv+VFHCAuasPYTljL7vt/zuCLqaViJo250q6mnIPxguJYBPt1696yLSDbyp7+HxQuaNZ0JX2wDP/Fi8TRXInAT1KgLavekmxHpkXt9aRql/D1u8OwwplFV/LjPxgYTB11nUV9d1xJ/FXE5cafivIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRvgX7Jdu/FKtkKXah0wqyeCj44ed2eDr1vYH0DHUTs=;
 b=tcHU1+NhsBYxnXmWZPtVy7+XQSrw1C35G7aIXhaTl2yHnJN0tJVHBpdetSAK2cI/7un+D5I3prC0vWU5+JWcnXRFS9HwRakp8rgR2LuRwg/hp5HKFwdqf3BfIXDkdYWI1O1ks7bNgsIjZNjwl9osEn5qcDE4CyoU10m5TPYhYi8hYeX4mbaiZ7zKaOjyfQ9dnpWbN6Ks5z+8E2QRX2Ldwi3RWrQ7xGmKH16EagZS5IqQ/yd0AJTVDDsCbW48BMrI6GWsQ1maUbeMMzFH93MP9Yie2sn9UCMxDKhSOpYgc3DuoB5ubEnuTcwZmNrpnmiENeYuOSUNYy6M4kKqPzxxVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRvgX7Jdu/FKtkKXah0wqyeCj44ed2eDr1vYH0DHUTs=;
 b=EdZGayFNdaiH2iUhFodDp17K+2qm52cvzKi+oPCgjSxvuRmDU5ouaybtGTE7R67Smmmi7X1BVScJhjvm8Qh6yHFm09VrT2R6raUo5w0uAPmR2y4C1lYqB6hIPW+fysrXnehfnJyODBrLJg9CVPsypq/eOi4NGpqLASaQQKs4JhNN+5YDTPfWaf14Mp/SWbkQzwqicRSqoQGupEsvo9aMtG0UKgr6VN1uhBSBhRoIcHgoqZQW8ZbGnn4QGsFTEM1q+5gm9fmGdhDl7w2pTjGMtAsV/Gm/e6al0BpmDpeaslTs8EOaMDThktE6yM4G8bafCwZ70SpeDa2Vn0ueJONdTA==
Received: from BYAPR19MB2293.namprd19.prod.outlook.com (2603:10b6:a02:be::11)
 by CH6PR19MB020568.namprd19.prod.outlook.com (2603:10b6:610:304::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 20:33:29 +0000
Received: from BYAPR19MB2293.namprd19.prod.outlook.com
 ([fe80::c4e4:5169:dd46:c0f0]) by BYAPR19MB2293.namprd19.prod.outlook.com
 ([fe80::c4e4:5169:dd46:c0f0%4]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 20:33:29 +0000
From: Marco Giunta <marco_giunta@outlook.it>
List-Id: <linux-firmware.lore.kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "sunweiwen@awinic.com"
	<sunweiwen@awinic.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "zhangjianming@awinic.com" <zhangjianming@awinic.com>,
	=?iso-2022-jp?B?JxskQjBXS1wbKEIn?= <yijiangtao@awinic.com>
Subject: R: [PATCH] linux-firmware: Add firmware for awinic AW88399 SmartK AMP
Thread-Topic: [PATCH] linux-firmware: Add firmware for awinic AW88399 SmartK
 AMP
Thread-Index: Ad1QhHqSq4g+idpZRw2CPW3pJb72EgAk962AAABsQ0g=
Date: Wed, 30 Sep 2026 20:33:29 +0000
Message-ID:
 <BYAPR19MB2293EAE0FD7C027343D4EB61FC8B2@BYAPR19MB2293.namprd19.prod.outlook.com>
References: <000001dd5085$3216f260$9644d720$@awinic.com>
 <4b70e056-89d9-4d92-8ecb-ecb4c7d48c8a@app.fastmail.com>
In-Reply-To: <4b70e056-89d9-4d92-8ecb-ecb4c7d48c8a@app.fastmail.com>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR19MB2293:EE_|CH6PR19MB020568:EE_
x-ms-office365-filtering-correlation-id: 476e398e-49f9-4615-0f37-08df1f321694
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599012|31061999003|51005399006|8060799015|19110799012|24021099003|15080799012|15030799006|55001999006|25010399006|4140399003|440099028|3412199025|102099032|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?iso-2022-jp?B?M0luV3pCc01WZW44d2pPQVYwUEcxbjBVQ1YyOXkzY3lHNDNBd1F2MkJP?=
 =?iso-2022-jp?B?a0JXT1pNVk9pT202Ym0wd0MwZndlRFdjU2p3OUNKSWFVakt5TEFOM1d1?=
 =?iso-2022-jp?B?bHZ5dDR5cCtNV2wwY1poZUxtUkNvUmhrV0E3dWNSdWk5RndUSUNBN0xz?=
 =?iso-2022-jp?B?c3FlM0l2Wld1Vm1ic2plVmVKYUxpcUYzZ1lHYW0wVXBqUEI0NGl4aFh3?=
 =?iso-2022-jp?B?WVpwWWhzY3VFYmIzVTJBTG5sWlM4cjRXdXFwMTBPbndYVDR3UXkxeU9k?=
 =?iso-2022-jp?B?ZU43UWdreDUrZmtmY01BSVZjNXozNkVnd2h1UUVBR09aTnNzNUk4K0tq?=
 =?iso-2022-jp?B?M2Rnc3pIMFZrQWlpdmhmRVlSbFcrMnhIWUJxNTcwdmViMXFVeHpRUmxS?=
 =?iso-2022-jp?B?aTBEUkIrcVh0MDNYZXFiVlh4L01ic0h2T0hvYldtMFJPTktoMVJYOE1n?=
 =?iso-2022-jp?B?K2hRVXMrTlAveHQ2anNoK09NZnlGYU5rMVdxNElEbTkxb3hpdHNrODZ4?=
 =?iso-2022-jp?B?M21BaW5lRk5za0F6RXdMNHowSmxxQzM2WWlxSnA0QzF6eFdzblVVVEUr?=
 =?iso-2022-jp?B?L2xtd3RWdm42NGFSamdJZzRxS0prQmlMMHpYK1g5ekF3Y05DeUdONlE0?=
 =?iso-2022-jp?B?RWprdXFZZFJqRkVGRXdvRUZiWWVaZDZpVUpUMkM2QWZDWFJJc1NMM0Rn?=
 =?iso-2022-jp?B?MURXRXNBVVhzcmc1L2ZUc05EMERndHpLZER5MGgyQjJ4c3I5d2I2L1dE?=
 =?iso-2022-jp?B?eUlLcHhjclZIeVhTZ3ZVZ2QvUHA3MU43b2d5K2FMS0tCTUhZZmhCelVP?=
 =?iso-2022-jp?B?V0VNYnhNdXpoS1doUFZERXNIbWZDcndPMFhIRExsVzF4MExxcStuRW1R?=
 =?iso-2022-jp?B?VDA2N2hwY2ZQZ0Erbi9peHhkTkd0SmZIOXFqVlRNY1FwN1R5dGQ2cUsw?=
 =?iso-2022-jp?B?d2FJc1MyUFNIeVRTSVVzcU9vMHBWdFNxYUg1TlZGMFFpMG5nMlJ0MGFX?=
 =?iso-2022-jp?B?Ui96czVvL1o0cG5XSklnOHdRbkpiL2dqVFdOc2dIUGlJRzUyWUNSbU9D?=
 =?iso-2022-jp?B?bzhGMVE1RG1ZR2VNeGw0Sjl3a0hkbmZ4Y01aaDNxQ3B0YzFhaWsyYUo1?=
 =?iso-2022-jp?B?YUgwRm44bHUvcnROWU8zNWlzVUlXZG5NR2tZdGpidFhYUjZraEJHRGV6?=
 =?iso-2022-jp?B?dnlRL1dvNnZXcWxBYmFrNFdzc0UzOGZuc2RqUzlMV0tDWWVpOG5ZY0V3?=
 =?iso-2022-jp?B?OUlsSmZwQU1wSklxV3d3SUwzekhORmgzVFhQQzBOc0lnN3NVRS9Tbk1k?=
 =?iso-2022-jp?B?bnZUWDF4cWtCL0JLZFFXbThlSzNhS01Na09CZVdybVE0STZjOHRTSEx3?=
 =?iso-2022-jp?B?QmFNTVFBYUJkcU9FekFwUUFmZVowMk5TQ0twMVZOKy9mb3NTSHRkdWIv?=
 =?iso-2022-jp?B?Z2xDbUdQU09jcFJDYlRGZQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?RSt1SDlhL1QwdVlEQlI3emoybnZMM1NycHZrYlVOaXpIaGdMVnFJdFRT?=
 =?iso-2022-jp?B?dTI0SmtIeFZNcDVHMmpOZ3ZBR1BkMXF3SkpwSFRsdEdkK2FjZ0s0Si9i?=
 =?iso-2022-jp?B?MFUwRHBsSDFlajBEN3VnNVVhcFY0OVVPeWhiVml2SjJkbmlnQ01PRFVt?=
 =?iso-2022-jp?B?K0NRNnpEVzR2bGJMcm43ZG5iZFpLY2NzL0tabWc1cVVXeGoxRTJPVEZY?=
 =?iso-2022-jp?B?NGt5aEF0STNEYklPcVNRb2hHemd1cFpaVnI2R2MwUWtMeDU4UEpoRDBB?=
 =?iso-2022-jp?B?bWMwMmh0RWRId2dMQjZQUERlSDRXZzB4bkd0RjVGU3FtajFpbkFpWGNp?=
 =?iso-2022-jp?B?QUNPT29RdUFzVURHcDJqc25XNkxsbnd1Z0RqNTN0V2p5UTllYmJxdzZF?=
 =?iso-2022-jp?B?U0VmYVRkL2xmTytyQ3JXYWJ1QWwwUUxvR1dORVBQcnh6cFJDTUpTdzRv?=
 =?iso-2022-jp?B?aHdYVGFKajVMNVhjZGFkS3pveFE0Y2ZBaG5vbVZ4bis4Yk9QZFlKYmZO?=
 =?iso-2022-jp?B?d2Vlblp0RG55bklOVlFBOGc4K3lFcjJDOVhIczR2SnF3ZW9zSHdhV2NP?=
 =?iso-2022-jp?B?bFRDM3dkSGMyUHEzcklRWGZ5V2FqdzNWTCtKZXY3UTdlTitMNjRoUGZI?=
 =?iso-2022-jp?B?djZOcnRCOTlnbGpseUJUNzBDT0JwNndhMVIzUFFvUm5vUERlODlKYnk4?=
 =?iso-2022-jp?B?ZktuamNHajdteXd1SWQ4RVp2cThSZGxjaXB3M3paN2JBS2FSb1N0dEli?=
 =?iso-2022-jp?B?WXpZWGgvaEtPRGtsd05lNDR2SmUyRkVPREVacUpaUk40cHp6TU45d2h0?=
 =?iso-2022-jp?B?b3RGUkNsTjYyL0oyQmhRR2hqN1EwT3BqWUhCZEszWXFJTmNUVG9KQVl2?=
 =?iso-2022-jp?B?ejJGZWx2azVFSm1hUks5TnR4d2pjSEZQZXpIaUtqREpaOTFzbWs3dnda?=
 =?iso-2022-jp?B?alhpMTJzck96R0Y4UDdGVGlneWpuUm5qWGE3MHlwVVBsTWdqTkR5SmFT?=
 =?iso-2022-jp?B?YzhmVjVwZjBiS2xJc1E3SDdTSDJDVDk0N2d6eW1uRTdPb1BaZXNKU0p5?=
 =?iso-2022-jp?B?ekRPdk1kY1paQlRPVnk3VmxZUU53MWl1b2dBbVZzSWhoYjdrVzRHUFNO?=
 =?iso-2022-jp?B?R254T1lSNExxRjYxeTNVS0Jndzk2RHpyblVaVVM2Yi95VzZ4K3A3LzBN?=
 =?iso-2022-jp?B?R2NRQmtGN2p0MDdSblFPTUxYTFdrV1Uvd1g1blNLTGdYS2JaWjFkblUv?=
 =?iso-2022-jp?B?d1RydEROZjhJQnNnM0JqQ0hFMngyczN4K1Q5L0FvTGJiUGtWMmtWWVVl?=
 =?iso-2022-jp?B?akVXcnQ4V0h6MnE5YmgyWko5bWppTWZXc1VsL3V1d0xuczhnTitKa2I5?=
 =?iso-2022-jp?B?NnVpN3FqTjBTMngwcTVuRE9sSDB5MzV6NENEejhud2V1VnExZWp0c0xl?=
 =?iso-2022-jp?B?V2VIK1VJWm8zdzMydFJKSFRwL0krV2xwWmkyOWpFMEdLY2JhMkJnalhO?=
 =?iso-2022-jp?B?QVlJY2xlOUJwYVFPN0lZZjd6VkdMSFFFdm54a0ZvbEdwUzRHbHlYem5Y?=
 =?iso-2022-jp?B?YU50Zi91clhBdit2dDRKV1c5azBhaW10ZzRucFpkUUhHSWNJVFNYOGdD?=
 =?iso-2022-jp?B?TW9MSldjY3BaR2VIa3Q2MmoxVlhWL2lXNDFEV25pSFh3NklUWHlBSER1?=
 =?iso-2022-jp?B?VVh5cEd2bHJ1UnlWOU1sdDlwb3dQNHkzL1IzQTFtUFJuZlQycW1tVkxZ?=
 =?iso-2022-jp?B?Z0ZJVHRmeU45dnllUW9OdUVKcnpXYUtJdk9seThYWVlHZ0laeWxqRFE3?=
 =?iso-2022-jp?B?c1dROTBGdE84aXpoVHBxTGw0OUFhaWxGMWFtamtDcFJKSituZ3ZEN1dk?=
 =?iso-2022-jp?B?ZmVPZHVCM1ozQjJ2MmtDVlpUdDgwSHIzai96aktMUG5WL2g3bk9hSnQ2?=
 =?iso-2022-jp?B?TGtiY240Tkg5SGtKc3Y0K05sOUxudFJLTGwwTnAvb1FVRXhrMnJEa0xx?=
 =?iso-2022-jp?B?bz0=?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR19MB2293EAE0FD7C027343D4EB61FC8B2BYAPR19MB2293namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR19MB2293.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 476e398e-49f9-4615-0f37-08df1f321694
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 20:33:29.7491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH6PR19MB020568

--_000_BYAPR19MB2293EAE0FD7C027343D4EB61FC8B2BYAPR19MB2293namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi all,

Thank you Wayne and Mark for the great collaboration.

I confirmed the firmware checksums match the files used during
driver development and testing, extracted from the official
Lenovo Windows drivers. I have a follow-up kernel patch series
ready that makes the HDA driver request these per-model
filenames based on the ACPI subsystem ID, which I will submit
once this lands.

Reviewed-by: Marco Giunta <marco_giunta@outlook.it> # AW88399 HDA side code=
c driver

--_000_BYAPR19MB2293EAE0FD7C027343D4EB61FC8B2BYAPR19MB2293namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi all,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thank you Wayne and Mark for the great collaboration.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I confirmed the firmware checksums match the files used during</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
driver development and testing, extracted from the official</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Lenovo Windows drivers. I have a follow-up kernel patch series</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
ready that makes the HDA driver request these per-model</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
filenames based on the ACPI subsystem ID, which I will submit</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
once this lands.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Marco Giunta &lt;marco_giunta@outlook.it&gt; # AW88399 HDA sid=
e codec driver</div>
</body>
</html>

--_000_BYAPR19MB2293EAE0FD7C027343D4EB61FC8B2BYAPR19MB2293namp_--
