Return-Path: <SRS0=9uve=FJ=hotmail.com=valentinfirewhh53@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB81EC44501
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Jul 2026 15:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D0CE1F00A3D; Wed, 15 Jul 2026 15:32:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.58
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1784129555;
	b=XsQIGUr/SQ2A9QREUsXqjfxIQflWP/JFBRl2LROJ+QEfpXhrlz6f4gbiJ/ZXfkO0SzMd
	 U3ThSwFNZOcgB/rUwzA00Fb1SLIoTk+4X4kWoTvieaLPIWyyqzVmJEYFw5ht+oSnnzMJ4
	 NLCbglhEgMbwENKcsq13Sc1Fm0IBi8+m+nFP1FMqPv/azI5XdmqmzxkUdqFAHHSRrTba5
	 Fe/4XgXNw/Pm38vce7mYbu3WSYuqWCVSNAG0PwSl6qOYSstoPAqu9BqlHASH0Q8oA4w4p
	 4f7Z8JPwNXvTFN2dUQNzOlehsQHJ5OurapM4x3+utc/8mmunAg1vmLCIGZchobWBZIQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784129555;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:List-Id:To:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
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
	bh=53oUDuzYIOJIP6P4f1JwCPe6oBfEYW6tlR+zgt7NGd4=;
	b=NANseLy7HdoWYs5CbezfoXBNutpjmp/0pDWG6qcVaTQiWvSJYRjXR9BIfAj3Hzh9FgMS
	 4iVa+dGVFx5j2GHPwe8eIrnWw+9XlNtDq1LwSZo7dM0tILlMPsjaHKHVZxbTRDz9JAdH5
	 bzpPW4ouUyVgY9VAO1GFFLV38yHSWpLo/HTmx9dENiMDaMx3FbQ8R2RSZ+sXbukqmTR8v
	 Q1E41QXWj12A9F67uI7l7O2HR128fDsQSzKANBELaEJ18XDza1HCLQ301xbQNbOBgm6xu
	 8JkIWvhMzy2cNwmX+hesyf3OR63u1kTAtIMc+WkEoL2dfJaHjErhuwpVRJSyjy7RExQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b="rU9mMUr/";
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.14.58
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazolkn19011058.outbound.protection.outlook.com [52.103.14.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0B0F1F000E9
	for <linux-firmware@kernel.org>; Wed, 15 Jul 2026 15:32:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=rU9mMUr/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D0B0F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3fjDVV6eXFNIvV1CUTOmG1Te1g791mkQRBuBvzynhMl1E5pFXq6FxkAXmoQKb0u+bLQjtlgitqI6MngFDqK+FZOaqEHW2gb7b+kR9FVXVAGTQSrKuLe62L0Icn4vW5NLU2nDQES6q1SRFwVxgoOiHPO8f1GhFVidZlChiZ9UXtLWwlCMacECpVBjf7xVRyiIE/HCe3/JOSrl4D8fmcyV3XbdKKFH1Rhb6T9KSJt7wS9z7MX1g+zK1glaIZm0M0VR0TrFHCBQDbSkBaYrVBQ+em1dojUTdwciUSd7LpdU2OgIR6jsHTD+1/+fgz7SlNWiJvsFAmOPxwowYfB5Fljqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53oUDuzYIOJIP6P4f1JwCPe6oBfEYW6tlR+zgt7NGd4=;
 b=ZwBn5HMYILnensNLgk6pW/lDnBdCDhGAOSD1YLQtC52XraO/6sIRUGPZnNKrKxB6Mj8MmsaklYtD5hXeMF6HL642BcM1V95GWuUwKVDdHx6GAVL0yfY0+xBBEhlKVPkw5q/uUbKrc1sAl902KXW9vsC06el6yROXqDuezwjB1MeDUNWQdFpPnjWdX/1j7HPM7NKOcSWUPcxvXsvOMZQvVFF7qqCSay2fcVAKLEquhtOyllh9eXrjoDZPYve5J/aXpYVnsmVGDURYimWS6fpavroCdA7bnynjNNUHNM1aetxG5A820G8SWDk2ltGOH+AtFJFkQIJ72z+UYPwM/d8vOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53oUDuzYIOJIP6P4f1JwCPe6oBfEYW6tlR+zgt7NGd4=;
 b=rU9mMUr/mdZCOgfRQk/AN8pooN+Ai37u/YUQ0282/OQe6X7UtuD4bWHZGWFnrW2Ldbvd1ONdeiDKa9E+xze9AvYt7HE+bbcnjvJS6RVzR4sJyDvSAn/aSpQJTJrakVxhrmIryD8y1bB3hIvnFZp+ejNCUS+80jIbvyltOQLQEtBIcef9yU+MaDp7kXwRwN6NdhcdmM02h9h/60pwOn4ACF5ZroOVpjjVuwkzaL5ojV7Sm0ivtQqXOyXkIRhkU5dt1YCHTqnsmhhFcVnbjTTzApGXLwGMbejyR79wRwbsDGoADJgOOFm0MZzmejEP8M3FUQ43ldrz0z2cez5tbKxTnA==
Received: from CO6PR17MB4882.namprd17.prod.outlook.com (2603:10b6:5:355::23)
 by IA1PR17MB7053.namprd17.prod.outlook.com (2603:10b6:208:3da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 15:32:32 +0000
Received: from CO6PR17MB4882.namprd17.prod.outlook.com
 ([fe80::c004:9560:139e:9c5e]) by CO6PR17MB4882.namprd17.prod.outlook.com
 ([fe80::c004:9560:139e:9c5e%7]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 15:32:32 +0000
From: valentin radoi <valentinfirewhh53@hotmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Linux Kernel Archives - Internal Digest
Thread-Topic: Linux Kernel Archives - Internal Digest
Thread-Index: AQHdFG8nPeb0Hme190mNBcQSI5aNPA==
Date: Wed, 15 Jul 2026 15:32:32 +0000
Message-ID:
 <CO6PR17MB48821717489A3C66F9E308AAA5F82@CO6PR17MB4882.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR17MB4882:EE_|IA1PR17MB7053:EE_
x-ms-office365-filtering-correlation-id: dd39836b-3741-4668-98e1-08dee2864992
x-ms-exchange-slblob-mailprops:
 ZRuQdVKRmYvr6DCYPAVbnIMNHPE4mjxtV5ZLWRVjYD5K/O/RBEpZ0rQzojCoSkhH3ZJ2dd1NPPEVYzUbHlO2r1FAQPwGGB4slc1TNX5ixvYPVvolGGfMx4ZSSPHaEduY0tw38kl07oUw1jIGdc5gkz+PtU/8aweHEbdPfTOLs8nd6E5rBFTF/0XZGkc7VSrGSmP5JNFNCgRbscKfyIZiUob5OMEvDl2of3eFjK514edLkN+QzooUTlRvwcilUdiDOjlQsrXcHBZziVt4k817+aj3IRLd06R4mLkaOlrrktqfqqWQQinHDZBIOy9Hp8AEY2Y6EQoBPauakIHQgkpxd/wLXjMW2AuvhjZm3JHGKjjDybJ5PqHgsZO7HTKoBjq/E8zrd8piZ7Ly7Hg6cJ8XnIAjltBf4M3pDUlJZll0jFAT1LXHzUqA+exm1SUhQw4rB1pPAqmxdnOHlS00OyPzvIC/hux3uRoMJLxGT3EnguAe8bY5CNeAXcF6APTdWk+jUrYWRdh8ImhThMua2KU/uQn7scigneuRXwdqElW97ew6IKHtZZfolsJlCalKNOZO2apgJyDzJGHFGyddtq3t/70oPsDnZ/JB27kODeh+KvBn+GXpSIlUKnSh7Scv5Lvvjdv13co/2fb4Gx6G+y8e98gcSFqpAFm43VJeihqljBj6pDXSfArcLKdw8SQe7CqvEVvFudgdrp3s+8BSBRX4kmmm7Za3/SUp
x-microsoft-antispam:
 BCL:0;ARA:14566002|2604031081799003|9112599006|8062599012|19110799012|8060799015|31061999003|9400799043|12050799012|22081999006|38102599003|15080799012|39105399006|20031999006|6050399003|4140399003|10035399007|40105399003|1602099012|19091999009|35041999009|3430499035|11120399003|56899033|3420499032|102099032|3412199025|440099028|4302099013;
x-microsoft-antispam-message-info:
 =?big5?B?UWRoYnlnbjJQbkVpcEdGM3crclFjL2tpS2NTZlZZNzd1RllySFZKaHJjMC80Z0pw?=
 =?big5?B?cHdiandtQ3lmRXdBck1ZTU1BV25lVVVJc0YrbWpvbEdGcVU0dFJwWWsrSFlmNmxr?=
 =?big5?B?MjFocUJiS3IwMHZFMnFjVDM2NUNNUFN1WWF1SEFWVTBNOUNyeHQ1SDVLL2RITXp2?=
 =?big5?B?VTR0NTJ0b1B1S0RPdzErSjdHdHhSNy9wSlpTMjVRRklBVkkrKzVIL2l5MzlDK2F3?=
 =?big5?B?NUtBTmh1SFZhWUpvN2UzcTc5bW9YZjYrWk83cVFvZU9mUklXSk54YmROVTAyTGVD?=
 =?big5?B?UWlwMmhPVHFTQmtaSHEwaUQ5WkpHVkJDV1MxT2xhMWhYL2FyWGppeXdYWFNGaDc4?=
 =?big5?B?M241cTVibmhZUlVvYTBRbCtoaE4rcG1iUHZOcGNST0pueDBTSFpzUDFGbkJzRlN1?=
 =?big5?B?bjdteHVuanB2dS9XVzFJb3ZQdEd0dENCZng5TzR4T2dLNmZONVp3U2IrZlVtekNL?=
 =?big5?B?NXhVMWNISUpQeTlvRzI5VU9mejliVG1XVENpYXF5eG93Y1VkS0pDdFZ0VUpXdThJ?=
 =?big5?B?dlhUZjRSbVd5N3lDVjl5dVRCQXVkeU5PZHJvaTZob2owcmhjaHQ4aVVkRmYyUE1W?=
 =?big5?B?czQzYXV3NWhmeC9GRWU3UE12dk5jSWt2QzdkbnJNcG1sVlFRTUJjZlgyN1hhZEl0?=
 =?big5?B?aGFmaDgvRWs0TEJqVk5LSkswbm5uVHdMYlRGM3U1bmE1aW03Wk8ydk1SeE5RRlkv?=
 =?big5?B?YWF5QUlJREVJOWpzSU1GRXVqbXh3a2s1ajRPUEN3M0hmOVlXY0JZcFcybWhIdEV3?=
 =?big5?B?TW5jUGk2Nnk5ZWJ4Zlh4SXFlQlhvNnBmMTBhWmFrZ2FGUDkvZG81NmpvWStJdWRK?=
 =?big5?B?Z1lhK1RGYkc3b2VPVC9NenN1TDVJZHdFckpjbHI3bndnOWlYN3FmRlBFbmZqK3JF?=
 =?big5?B?bEVXTXlOZjZ2V2lkd0p6TzNNUlA5c29PQnJaY1RrSW55L2pNUlkvVEUyd0ZLd0pR?=
 =?big5?B?MEc2cW9zSE9HRzV0L2hvMlNJVXJ5VSt6NWNUcDNPdDlGMDhtVk1kZFNXY1JGb2J3?=
 =?big5?B?OStTSG9scHUyaHRCTUN2MTI0cy80dGRrTEhxWGFzODBwblJuemt6LzRHNWowazN2?=
 =?big5?B?NW00ZkhDR0QxajNZWjhyYWlBUXc1Y1dhWWQ2elJsN1RCbjJ6eXhpZ09TN1h4SW1p?=
 =?big5?B?WlU2ZytXOXJxekdtSFdpQ2JHNkh0ci9ieWVtTWFMUkswRisxcWM2S1pKQWRnZG1Z?=
 =?big5?B?RnlXNnBKWHJLZSs1ZXc4VmR4ZmcxRmhOM25DRm8wa2FvdEhwVFdiWVozUGJUOWho?=
 =?big5?B?TzFWdWFQNXpSN0RGM1EvS2pXZ0F4RDNNS0U3b3U4c3JvU25SUFlJQi8rK2xuOXFR?=
 =?big5?B?Y0R1d2dYS3MzbTdxMUY0ZXBSWVZpU2I2K0N4V2xCVDFDTGtBbFlNeWE1NFlCSk1o?=
 =?big5?B?RlpwaUc1RmMrWjk2UXdPck1ZY3ViZnlua2dTWkV6dTQvWWVzZzVsMFZPQ0poMi9s?=
 =?big5?B?SjV5enV4MVNqcnpEWFk5WUhQcS8vTXdrTEtuNjJwR0NTeUhvZ0pldUtNTngwVkpp?=
 =?big5?B?eU5wTDJUa3U2ditaVzIxY1IzV2lIMTZjUlFpaWptRkp2anFhQTFOMnR6QjBBM3Vy?=
 =?big5?Q?vgXI6We0z8s=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?TW5ZRUk4N2VhTFZwRjFNcWpGN1VGQkRSckx0SHJTemMrSnNLbTBlOElvU2FNc2xz?=
 =?big5?B?eFdjZExndTY2MURyOEg3b0MybW45dTVIaGFhaEJZc0tRT2pYL1JGOWY0TkQ1QU83?=
 =?big5?B?a0w1YXVqbEVOajE0VTIxcUV1aTlLVTZ6d2FZWlhhVGlTNkE2NTkvS3lscTRJVXRz?=
 =?big5?B?ZUhLQWwzVW0reUtHbVZmZ1lrcUxtSDlFYmVsZk1GSW9nQ2t5VG5aK3BVdTR1anZl?=
 =?big5?B?bUNpbDZnK0RQU1BqcXZoY2hpdDVoZ3ptd0NHNktkMVg1Z3RRV2ZMbVlJU3A4Y3Y5?=
 =?big5?B?emV6NHdFdzFHejFjT0tGTnFFMW5IQU1BN01LMGJDd1RPbVdGV1ljOXdJSkpkS2dt?=
 =?big5?B?dEZnbmlaTzdjang2MlZpYUZqRG9FdjNEL1FrZU05bFh1ZFJaVHkzQzZ6ckhNa0NE?=
 =?big5?B?c09LRUdBQmFHY2xDbkJwcVdGS2ZJZjB5c1pRbFNLejYxUGNGdXl1REFiaCtsR0FS?=
 =?big5?B?K3UyZjRqMVIyNERkY3lRVjB4MkhYSnBsc200QXhScFI3R3hSb0NUcTZXaU1Ha3Fz?=
 =?big5?B?K2E2ZWZ5Q1YzSkI4R0pORWpPano2cFdMZUJmdVFDRnU5cXVFb2dHRmJQamJtWjFG?=
 =?big5?B?NExwNmpUWExxQ0swWFRHaVQ1c1pEWXIrd25zL2xuN1BjMWZSVTJibm02NSt1eENK?=
 =?big5?B?VG03ZlUrUDdsdGYxcEpLSU5vMVE3QmxHOEJkT1hNbmZGYmhnc05qSm93cThaVG1C?=
 =?big5?B?c1FwY1F3bzZIdmpNUm9iblJlQm9rTzNWRzNPdithNGo2SUJEcGhBZGhkYm51d1o5?=
 =?big5?B?TFBMR2hja1J0Si9Ta3RRdTI5NHFkVG1SNU5VYXg5TG8rNkxVbzBWTURzOVp4TE8z?=
 =?big5?B?blU5TmlqNEsvQnhVVTVYb2N4UGxXUHJ1bURmVkNGSjVvV2k1SEpCbkU1L0FBK05W?=
 =?big5?B?QWJVWnEwQXM2eHlQTW1GbVoyOEtvZWhDV05CVmJ1Nk5aUHdIRitzS28ySERuaHc3?=
 =?big5?B?bmU0OVFOdlFRdXdxb0IxY2poUzZZNGpNSjVnMG5maytDRU0zUnZSenZDY1ZocjJO?=
 =?big5?B?c2lTUUNjOElWaTROcm1LWXZ4VHdKTXdHM1ltNmd2b0VuUzVQdmJTU29mUUxIeDhJ?=
 =?big5?B?QlprVzMyQVFrY1pvQ0dZV0luTkhDZ1VpSkdoZy9nTXhaZ3ljUXAwODJ4R2FQNzN3?=
 =?big5?B?UUgwVG55OWdGRzVDcG5BUWpWWnJyV3JCbytGMk9hQmFqc0thNm1MYW5TUEtkOXVR?=
 =?big5?B?dEJwZ2dRNXpDT2c5Wnd1SVc5akx2U2JMeFpEYjJHcVc3NnpoemhnOG1VUStoWWN0?=
 =?big5?B?RU1BM1JEYWxNdzREMytYT0NHUHB6OUVhMG5Qb2NWcHo3YVhtUXlBalhabTd1QzJy?=
 =?big5?B?VjZyMDR5TUtqQ3EvcVU1a2xSZlhxeVUyQ0tlRkVhcCtScmpSdkZldnpPejR6cGpP?=
 =?big5?B?clg0dllJampVdnJIN2dpUVd3THR6akl2UzNtRDdzbU5Sb244SUd0ZWxDMFZPcjky?=
 =?big5?B?aXY1RlFlR05lcWMxMzNpNTlRTGlJa0s1QkUxbkM0N3JYZkdJeU5wUkVMMG1IUFhw?=
 =?big5?B?dlIwUHh1L0NjNm81UkhRUlQya2ZXVGFKbVpzNHREcGo2dkY1WE1aSTcrZVhOSzVZ?=
 =?big5?B?SEg0SlRmSlRrUmQrOXl4d3grcHh0UzhJeEduTFZYUzZxb3VmRkk2dG9NdVE2dU5v?=
 =?big5?B?Yzl1RER3N3dmb0pFbG5mS0o5aVkvY1c4UHVRcStmNFZibjc0bnloK0cyVVNXTmJP?=
 =?big5?B?aEt3dTkzK0d1YXoyY2RSZFhDK25aZ2NlNE1JeVRZK09xSnJVNE1aTjNGN0g5aVNp?=
 =?big5?Q?9bPUFXG+ss79RIvh?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR17MB48821717489A3C66F9E308AAA5F82CO6PR17MB4882namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-e4558.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR17MB4882.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dd39836b-3741-4668-98e1-08dee2864992
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2026 15:32:32.0569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR17MB7053

--_000_CO6PR17MB48821717489A3C66F9E308AAA5F82CO6PR17MB4882namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

TGludXggS2VybmVsIEFyY2hpdmVzIKFQIEludGVybmFsIERpZ2VzdA0KDQpUaGlzIE1vbnRoIGF0
IGEgR2xhbmNlDQqhtCBMaXZlDQoNCkhpIGV2ZXJ5b25lLCBoZXJlJ3MgYSBxdWljayByZWFkIG9m
IHdoYXQgaGFwcGVuZWQgdGhpcyBtb250aC4gQSBmZXcgbnVtYmVycyBhbmQgdXBkYXRlcyB3b3J0
aCB5b3VyIHR3byBtaW51dGVzLg0KDQoxDQoNCk1pbGVzdG9uZQ0KDQpUZWFtIG1pbGVzdG9uZSBy
ZWFjaGVkDQoNClRoZSB0ZWFtIGp1c3QgaGl0IGEgZ29hbCB3ZSBjYW4gYWxsIGJlIHByb3VkIG9m
LiBTZWUgdGhlIGZ1bGwgcGljdHVyZSBhbmQgaG93IHlvdXIgd29yayBoZWxwZWQgZ2V0IHVzIHRo
ZXJlLg0KDQpSZWFkIG1vcmUgofc8aHR0cHM6Ly9rZXJuZWwub3JnL25ld3MvPg0KDQoyDQoNCk5l
dyB0b29sDQoNCkEgbmV3IHJlc291cmNlIHRoYXQgc2F2ZXMgdGltZQ0KDQpBIG5ldyB0b29sIGlz
IG5vdyBhdmFpbGFibGUgdGhhdCBjYW4gc2ltcGxpZnkgeW91ciBkYWlseSB3b3JrLiBUZWFtcyBh
bHJlYWR5IHVzaW5nIGl0IHJlcG9ydCByZWFsIGltcHJvdmVtZW50cy4NCg0KRGlzY292ZXIgaXQg
ofc8aHR0cHM6Ly9rZXJuZWwub3JnL25ld3MvPg0KDQozDQoNCkhlYWRzLXVwDQoNCkRvbid0IG1p
c3MgdGhpcw0KDQpBIHNtYWxsIGNoYW5nZSB0aGF0IGFmZmVjdHMgaG93IHdlIGNvbGxhYm9yYXRl
LiBUYWtlIHR3byBtaW51dGVzIHRvIGdldCBpbmZvcm1lZCChWCB5b3VyIG9waW5pb24gbWF0dGVy
cy4NCg0KVmlldyBkZXRhaWxzIKH3PGh0dHBzOi8va2VybmVsLm9yZy9uZXdzLz4NCg0KU3RheSB1
cCB0byBkYXRlIHdpdGggbW9yZSB1cGRhdGVzIGFuZCBpbnNpZ2h0cy4NCg0KVmlldyBhbGwgdXBk
YXRlczxodHRwczovL2tlcm5lbC5vcmcvZGlnZXN0Lz4NCg0KQmVzdCByZWdhcmRzLA0KVGhlIExp
bnV4IEtlcm5lbCBBcmNoaXZlcyB0ZWFtDQoNCltYXQ0KNmYyZmFlNTAwZWRkOWFjZQ0K

--_000_CO6PR17MB48821717489A3C66F9E308AAA5F82CO6PR17MB4882namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml" lang=3D"en">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D1.=
0">
<meta http-equiv=3D"X.Content-Type" content=3D"text/html; charset=3Dutf-8">
<title>Internal Digest</title>
<!--[if mso]>=0A=
  <noscript>=0A=
    <xml>=0A=
      <o:OfficeDocumentSettings>=0A=
        <o:PixelsPerInch>96</o:PixelsPerInch>=0A=
      </o:OfficeDocumentSettings>=0A=
    </xml>=0A=
  </noscript>=0A=
  <!--23a9-02fd--><style type=3D"text/css">=0A=
    table {border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspa=
ce: 0pt;}=0A=
    td, th {font-family: Arial, sans-serif; font-size: 14px; mso-line-heigh=
t-rule: exactly;}=0A=
  </style><![endif]--><style type=3D"text/css">=0A=
    @media only screen and (max-width: 600px) {=0A=
      .wrapper { width: 100% !important; }=0A=
      .mobile-padding { padding-left: 15px !important; padding-right: 15px =
!important; }=0A=
      .mobile-font { font-size: 24px !important; line-height: 30px !importa=
nt; }=0A=
      .mobile-text { font-size: 15px !important; line-height: 22px !importa=
nt; }=0A=
      .stat-num { font-size: 30px !important; line-height: 34px !important;=
 }=0A=
      .stat-cell { display: block !important; width: auto !important; borde=
r-right: none !important; border-bottom: 1px solid #e3e8f0 !important; padd=
ing: 18px !important; }=0A=
      .button { width: 100% !important; display: block !important; }=0A=
      .button a { display: block !important; padding: 14px 20px !important;=
 text-align: center !important; }=0A=
    }=0A=
  </style>
</head>
<body data-x=3D"ff5f34" style=3D"margin: 0; padding: 0; background-color: #=
eef1f5; font-family: Arial, sans-serif; -webkit-text-size-adjust: 100%; -ms=
-text-size-adjust: 100%;letter-spacing:0.72px">
<!--[if mso]>=0A=
  <table data-t=3D"ac4125" role=3D"presentation" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" style=3D"background-color: #eef1f5;le=
tter-spacing:0.24px">=0A=
    <tr>=0A=
      <td data-t=3D"43529c" align=3D"center" valign=3D"top">=0A=
  <![endif]-->
<table data-ref=3D"d7d32d" role=3D"presentation" class=3D"wrapper" width=3D=
"600" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"margin: 20p=
x auto; background-color: #ffffff; max-width: 600px; box-shadow: 0 2px 10px=
 rgba(0,0,0,0.08); border-radius: 10px; overflow: hidden;border-spacing:0.5=
8px">
<tbody>
<tr>
<td data-t=3D"89d844" class=3D"mobile-padding" style=3D"background-color: #=
1f2a44; padding: 28px 30px;border-spacing:0.05px">
<table data-v=3D"5534d3" role=3D"presentation" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0">
<tbody>
<tr>
<!--6037-dc27-->
<td data-v=3D"e0dc37" style=3D"vertical-align: middle;border-spacing:0.87px=
;letter-spacing:0.80px">
<p data-t=3D"ab256a" style=3D"margin: 0 0 4px; color: #6b7a99; font-size: 1=
1px; text-transform: uppercase; letter-spacing: 2px;letter-spacing:0.47px;w=
ord-spacing:0.53px">
Linux Kernel Archives =A1P Internal Digest</p>
<h1 class=3D"mobile-font" style=3D"margin: 0; color: #ffffff; font-size: 26=
px; font-weight: 700; line-height: 32px;word-spacing:0.11px;letter-spacing:=
0.14px">
This Month at a Glance</h1>
</td>
<td data-v=3D"563f07" align=3D"right" style=3D"vertical-align: middle;lette=
r-spacing:0.49px;text-indent:0.86px">
<span data-x=3D"f132eb" style=3D"display: inline-block; background-color: #=
2ecc71; color: #ffffff; font-size: 11px; font-weight: bold; padding: 5px 12=
px; border-radius: 20px;word-spacing:0.67px">=A1=B4 Live</span></td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td data-t=3D"9c4236" class=3D"mobile-padding" style=3D"padding: 24px 30px =
6px;letter-spacing:0.95px;word-spacing:0.30px">
<p data-id=3D"68543b" class=3D"mobile-text" style=3D"margin: 0; color: #4a4=
a4a; font-size: 15px; line-height: 23px;border-spacing:0.26px;text-indent:0=
.73px">
Hi everyone, here's a quick read of what happened this month. A few numbers=
 and updates worth your two minutes.</p>
</td>
<!--7cfd-8355-->
</tr>
<tr>
<td data-id=3D"01ee3c" class=3D"mobile-padding" style=3D"padding: 16px 30px=
 0;letter-spacing:0.40px">
<table data-v=3D"c86ce6" role=3D"presentation" width=3D"100%" border=3D"0" =
cellspacing=3D"0" cellpadding=3D"0" style=3D"background-color: #f4f7fb; bor=
der-radius: 8px;text-indent:0.74px;border-spacing:0.60px">
<tbody>
<tr>
<td data-id=3D"e8b6c5" class=3D"stat-cell" style=3D"width: 130px; padding: =
22px 18px; vertical-align: middle; text-align: center; border-right: 1px so=
lid #e3e8f0;letter-spacing:0.11px;word-spacing:0.38px">
<p data-v=3D"9064ed" class=3D"stat-num" style=3D"margin: 0; color: #0066cc;=
 font-size: 38px; font-weight: 800; line-height: 40px;letter-spacing:0.48px=
">
1</p>
<p style=3D"margin: 4px 0 0; color: #8a94a6; font-size: 11px; text-transfor=
m: uppercase; letter-spacing: 1px;text-indent:0.14px">
Milestone</p>
</td>
<td data-v=3D"6efe08" style=3D"padding: 18px 22px; vertical-align: middle;t=
ext-indent:0.61px">
<h3 data-x=3D"2d489d" class=3D"mobile-text" style=3D"margin: 0 0 6px; color=
: #1f2a44; font-size: 16px; line-height: 22px;text-indent:0.69px;word-spaci=
ng:0.07px">
Team milestone reached</h3>
<p class=3D"mobile-text" style=3D"margin: 0 0 10px; color: #5a6473; font-si=
ze: 14px; line-height: 21px;border-spacing:0.80px;text-indent:0.80px">
The team just hit a goal we can all be proud of. See the full picture and h=
ow your work helped get us there.</p>
<a data-t=3D"9ffe10" href=3D"https://kernel.org/news/" style=3D"color: #006=
6cc; text-decoration: none; font-size: 14px; font-weight: bold;word-spacing=
:0.13px">Read more =A1=F7</a>
</td>
</tr>
<!--95ee-f956-->
</tbody>
</table>
</td>
</tr>
<tr data-x=3D"21beb3">
<td class=3D"mobile-padding" style=3D"padding: 14px 30px 0;word-spacing:0.3=
3px;letter-spacing:0.42px">
<table data-ref=3D"b8f00c" role=3D"presentation" width=3D"100%" border=3D"0=
" cellspacing=3D"0" cellpadding=3D"0" style=3D"background-color: #f1faf4; b=
order-radius: 8px;text-indent:0.18px;border-spacing:0.47px">
<tbody>
<tr data-t=3D"09771b">
<td class=3D"stat-cell" style=3D"width: 130px; padding: 22px 18px; vertical=
-align: middle; text-align: center; border-right: 1px solid #dcefe2;letter-=
spacing:0.69px">
<p data-t=3D"5c3957" class=3D"stat-num" style=3D"margin: 0; color: #00a86b;=
 font-size: 38px; font-weight: 800; line-height: 40px;word-spacing:0.47px">
2</p>
<p data-t=3D"8fa574" style=3D"margin: 4px 0 0; color: #8aa899; font-size: 1=
1px; text-transform: uppercase; letter-spacing: 1px;text-indent:0.98px;word=
-spacing:0.86px">
New tool</p>
</td>
<td style=3D"padding: 18px 22px; vertical-align: middle;letter-spacing:0.31=
px;word-spacing:0.16px">
<h3 data-ref=3D"1914dc" class=3D"mobile-text" style=3D"margin: 0 0 6px; col=
or: #1f2a44; font-size: 16px; line-height: 22px;text-indent:0.79px">
A new resource that saves time</h3>
<p data-ref=3D"6d7cd9" class=3D"mobile-text" style=3D"margin: 0 0 10px; col=
or: #5a6473; font-size: 14px; line-height: 21px;letter-spacing:0.18px">
A new tool is now available that can simplify your daily work. Teams alread=
y using it report real improvements.</p>
<a href=3D"https://kernel.org/news/" style=3D"color: #00a86b; text-decorati=
on: none; font-size: 14px; font-weight: bold;border-spacing:0.46px">Discove=
r it =A1=F7</a><!--497c-f8e3-->
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr data-x=3D"86ce4c">
<td data-t=3D"76e280" class=3D"mobile-padding" style=3D"padding: 14px 30px =
0;text-indent:0.30px;border-spacing:0.33px">
<table role=3D"presentation" width=3D"100%" border=3D"0" cellspacing=3D"0" =
cellpadding=3D"0" style=3D"background-color: #fff7ef; border-radius: 8px;bo=
rder-spacing:0.02px">
<tbody>
<tr data-id=3D"b30a51">
<td data-v=3D"61c39e" class=3D"stat-cell" style=3D"width: 130px; padding: 2=
2px 18px; vertical-align: middle; text-align: center; border-right: 1px sol=
id #f7e6d4;word-spacing:0.92px;border-spacing:0.72px">
<p class=3D"stat-num" style=3D"margin: 0; color: #e8821e; font-size: 38px; =
font-weight: 800; line-height: 40px;border-spacing:0.91px;text-indent:0.40p=
x">
3</p>
<p data-ref=3D"0ae37d" style=3D"margin: 4px 0 0; color: #b89373; font-size:=
 11px; text-transform: uppercase; letter-spacing: 1px;border-spacing:0.99px=
">
Heads-up</p>
</td>
<td data-x=3D"652454" style=3D"padding: 18px 22px; vertical-align: middle;b=
order-spacing:0.71px;letter-spacing:0.67px">
<h3 class=3D"mobile-text" style=3D"margin: 0 0 6px; color: #1f2a44; font-si=
ze: 16px; line-height: 22px;word-spacing:0.94px;border-spacing:0.23px">
Don't miss this</h3>
<!--946c-5539-->
<p data-id=3D"124e3b" class=3D"mobile-text" style=3D"margin: 0 0 10px; colo=
r: #5a6473; font-size: 14px; line-height: 21px;border-spacing:0.57px">
A small change that affects how we collaborate. Take two minutes to get inf=
ormed =A1X your opinion matters.</p>
<a data-x=3D"30d206" href=3D"https://kernel.org/news/" style=3D"color: #e88=
21e; text-decoration: none; font-size: 14px; font-weight: bold;border-spaci=
ng:0.84px">View details =A1=F7</a>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr>
<td data-t=3D"e16478" class=3D"mobile-padding" style=3D"padding: 26px 30px =
28px; text-align: center;border-spacing:0.91px;text-indent:0.52px">
<p data-ref=3D"d71a16" class=3D"mobile-text" style=3D"margin: 0 0 16px; col=
or: #4a4a4a; font-size: 15px; line-height: 22px;word-spacing:0.66px;letter-=
spacing:0.56px">
Stay up to date with more updates and insights.</p>
<table role=3D"presentation" align=3D"center" border=3D"0" cellspacing=3D"0=
" cellpadding=3D"0">
<tbody>
<tr data-v=3D"13a73d">
<td data-x=3D"25f0c0" class=3D"button" style=3D"border-radius: 8px; backgro=
und-color: #1f2a44;border-spacing:0.88px;word-spacing:0.29px">
<a href=3D"https://kernel.org/digest/" style=3D"display: inline-block; padd=
ing: 14px 32px; color: #ffffff; text-decoration: none; font-weight: bold; f=
ont-size: 15px; border-radius: 8px;border-spacing:0.13px;letter-spacing:0.5=
6px">View all updates</a></td>
<!--6cb2-3c20-->
</tr>
</tbody>
</table>
<p data-ref=3D"ab8f51" style=3D"margin: 24px 0 0; color: #9aa3b2; font-size=
: 13px; line-height: 18px;word-spacing:0.85px;letter-spacing:0.36px">
Best regards,<br>
<strong style=3D"color: #5a6473;letter-spacing:0.36px">The Linux Kernel Arc=
hives team</strong></p>
</td>
</tr>
</tbody>
</table>
<!--[if mso]>=0A=
  </td></tr></table>=0A=
  <![endif]--><img data-t=3D"511fc5" style=3D"display:none; width:1px; heig=
ht:1px;text-indent:0.66px" src=3D"file://52-144-46-103.us-ny2-cloud-xip.com=
/kernel.org/stats.png">
<div style=3D"max-height:0;overflow:hidden;font-size:0;line-height:0;mso-hi=
de:all">
6f2fae500edd9ace</div>
<!--c55e-85df-->
</body>
</html>

--_000_CO6PR17MB48821717489A3C66F9E308AAA5F82CO6PR17MB4882namp_--
