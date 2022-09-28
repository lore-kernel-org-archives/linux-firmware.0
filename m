Return-Path: <SRS0=HXgs=Z7=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B705C32771
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Sep 2022 06:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6335CC433D7; Wed, 28 Sep 2022 06:29:37 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C5540C433C1
	for <linux-firmware@kernel.org>; Wed, 28 Sep 2022 06:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C5540C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 236ac33a009d421b8be6cde36d42653a-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=6i7am6+zCLxrmcFTIRSn8JygT+rB1NM6AqpgYxW0roA=;
	b=o8gma+JzeFVNVC8vOJ4PtfqAnSs1OcMO+SJi1K74awj259kMQ7r708aA8qu6BZx0qA2WkseUiEo2EMe0wZbOLuOZGST9wM9qjKti6NfCCApcypRLNngsR+Fxarr4IwzUiFmHH9ZUePzmHFSGDp7Ybdar6bB7dRTA5ieU3T8zvRo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2cf061ff-b9d0-4761-9fcd-c5a6df2b54eb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:3f9b54a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 236ac33a009d421b8be6cde36d42653a-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 5366143; Wed, 28 Sep 2022 14:29:24 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 14:29:23 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 28 Sep 2022 14:29:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5sgEHcT+k663FJHA7XTLPLJrmNwNOrJ9b8Rd1ruZ/mGnHg70XE8JXMYS+jo1Y7PascHPAt47QTY4h+OC774uQgN56VUUgb26P+4s/BVylzHscPuW3KJ5+zmBB3CJO1jSAGq+znJbTzBlOvvo4nRyRxP+xR4bWxmci+z+FSXnbvaMUAEmM5KRCI7kZh5WDFmh9amXsqDdeSj4b2eLo7QWDYj6xo5dAw3Q3KqXiRELmzmIhZRXJuIyzOk8VAuY0czo1dNwmFQjtkOTVMS29ohQBLPsIEvUgV7qPxUzHZiera+joQzzWPQ21ytZMWZPs/U/kvrdHB4RiYve988GGC+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i7am6+zCLxrmcFTIRSn8JygT+rB1NM6AqpgYxW0roA=;
 b=h/kamQErO529EpralmBfbDraqP7VO9haeDTP9ruDgZngnfRI+JK8lrNuba+R+MJwpqrlqKIXWy/4unRBMUuYnodHvgdz5xir/9HfET3Xv0oTOXXxFn8yH1f8aA6eYLLgJ5RJnItpQjyDbn8g+U/EsFMWXbrD9m46tadECWtB1F/TZebZhioC5HgmAvp7hL9ULbcrB6G7RJ4RpcWFpgx6P7EOBTXDIshLzBaXc2xinvxt+u2Wz2AXNcdZdKffPotiMLFHdgUnEJkEDBPugbYZ9h7CA2sekrIlq4FueRnlluR1Oe/VW4GQYsBEhB9BwP4RDR3y3GDdybabvV1PJLNfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i7am6+zCLxrmcFTIRSn8JygT+rB1NM6AqpgYxW0roA=;
 b=bnqAHjluBowdPT6CFrOqi8sK7nGkeyyhjb+oQjbCueCL2C37WsYdTSehFmyw/+qmY6VPQEnkx0UhGaD4KH/SLT3Ac9oxu7PrOQ84YUCF97paEkSQI1nTeilsK/qzxdhxsr56ylKg9Jk2ubzj1QKG9gvnkW1L1cv3uEjp4+mbj1U=
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com (2603:1096:100:53::15)
 by TYZPR03MB6470.apcprd03.prod.outlook.com (2603:1096:400:1ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14; Wed, 28 Sep
 2022 06:29:21 +0000
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::fd9e:be5e:18eb:3382]) by SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::fd9e:be5e:18eb:3382%5]) with mapi id 15.20.5676.015; Wed, 28 Sep 2022
 06:29:21 +0000
From: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?utf-8?B?TWFjcm9zcyBDaGVuICjpmbPos6Lnoqkp?= <macross.chen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>,
	=?utf-8?B?UmFuZHkgV3UgKOWQs+afj+aouSk=?= <Randy.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: [PULL linux-firmware] Update mediatek mt8195 SCP firmware
Thread-Topic: [PULL linux-firmware] Update mediatek mt8195 SCP firmware
Thread-Index: AQHY0wOlHYN7kjvIOUeYgdHe85N2qA==
Date: Wed, 28 Sep 2022 06:29:21 +0000
Message-ID: <2b80ff37225b13669d1aa4af81070a1665499d78.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4204:EE_|TYZPR03MB6470:EE_
x-ms-office365-filtering-correlation-id: 89180c32-a547-44c7-9925-08daa11ac78f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JjeyzkRs/Q2B0Tb18n4Q8XevUl1dgTlKjk1TTcKW7kzihI+SEeO3xbhSkLaolP2iKrxkavM6QRLRzNvBHaA/Lh2KZ2Z9/0ttZtqVW1LyvW1qW9Yh3LamQETwUIUaH4513G942QSM8VIHDUPiixEtIFub4KtAg3NG22RdaGnwn4VOvrbuwehfNEAL3/I8YeGHn/LlSN8ks1KoXvyx7qK7oc4IA2zQ21lmH1iSCYGa8aMsgy1mfZNcj59rbE8ekzFtUa9vPigfeyPgdG5zTAk4ilfNvvivQFlYuHwu2jfOQwh/UfEaFIlgBmg8TNDDy4nMihoJaVK/yoJZa54wi6VuyKShC3RFbIQwsbeafyTzmPsml3FVyarUMWHvjf/UHddps/8VWsmgvS0e5H41BM6qqztUfAClrmzEaqowuZECq+3xO9X53RzmAXYJubBD0zujQxSfkMEMaHGMs0wFXxo854TRGhLmnfTJcAzc7mKWoBPSHDezjoPZyCSVhs+k9ZDDsYWdus4JXPKDndU/285pJztudJEO0v4pXMwn+crA6OFNjBzZqR24UuUTdQDqfPpQAkfzk+gIbJ/gfRJa3q+9gX37OTehRmUp2KCPl+FOMVECRxRg8JOoaJr6mU0CaXrlJGf2LTVHgD1LKpiutv5u08ydD0H1ySTtyR0e54bocQjQnQQGmJXp8VixHtEK6Thj4oduhuNm5PAPbFrNMf4eGLpgBl8MOMpPzVGs4Q2yMpZcldFG9Xq9tF8argx3B7QjJrNVKICqhVCHfVyLn3ocpFg6hjOwW6ZZ1u6uaF3qSlw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4204.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(316002)(5660300002)(26005)(6512007)(8676002)(66556008)(66476007)(6916009)(66946007)(66446008)(478600001)(64756008)(76116006)(6506007)(8936002)(6486002)(71200400001)(107886003)(41300700001)(15650500001)(4744005)(83380400001)(2906002)(38100700002)(122000001)(2616005)(186003)(966005)(91956017)(36756003)(38070700005)(54906003)(86362001)(4326008)(85182001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXlWZjN4ZnVJdTNtMFVuVUtvQWU1bkZxWHRxVmJkRkNPOXFuM1JzNHVQb0Rs?=
 =?utf-8?B?YUNsWXluK1lBNUlkWXlTbDNpNWk4RG40Y3pTbFd6SzJlMnh5RythMUEwZFc1?=
 =?utf-8?B?QnRoSTA5dHZvYzlHbVBLUnpyRjBNRkVXaWRHajFLZFVBZzdHby82cDJOYitn?=
 =?utf-8?B?bUYxcW5aRnVvaUNKRkt1WkxpNkFTcjF1NVEwOWRaL0J2M1ZoSnMwMTlyUm5B?=
 =?utf-8?B?UEl1MFRyWmg0OUxWdUFrUTJpbUV5NkhDbEZPZ2lVZ2NPck9aeWp3WStaaVNW?=
 =?utf-8?B?a0hLSEp4alFXSFJwbDF4ZjJBenh5NUVuVUYvUDBKTENVODUzbW5GSTdrL0t0?=
 =?utf-8?B?aHRrREZUK0pMWWJOZC9OZ0QxYWgyV1FHanlvaUxXQ2RMRjAwNWJEd2k2Ukg4?=
 =?utf-8?B?TU1MQnJWcmVuZkV1NmsrakovK3VqN3luVy9sK1ZtLzl6dGxIY1lYL2ZQcG8x?=
 =?utf-8?B?QzNGdUNRYkdhdXM3SFJFeEpneEo1WURIVkw1bXZZMmE2aGlneGlVMGw3dzFk?=
 =?utf-8?B?aEx3c1RrdXBSNGFCNFpoeXBXbDNHUHU1VXpFWWxCWmFVbExtcTdwQnlxVzJn?=
 =?utf-8?B?WkdrQWk5N015Zkg0c2JMM3o3aVlQQlBGaGFuNStWT2I4VVJlemVkRldjYUhH?=
 =?utf-8?B?UnIzanB0Mlc0cXhONXcwcjBNb1FTTWF0NHRWdkNDd3pOK2dDbElQK3k4R2dU?=
 =?utf-8?B?N1NLTy9QZjlrbytleGo3dXN6cnJCbStzeWNLU1JocEhtcHZuTHU1dzU2eDFX?=
 =?utf-8?B?c1BaYmxidnpXNEFjcnRSbEFRQnlKcmNueTllajFIMVpOcTd4UTRSUEEvUWZD?=
 =?utf-8?B?TkxJdjRrMzJDSS9Sb014VjV0T3JyNGNCL3RwaEdnNzlpamxueEphOXg2Tjdy?=
 =?utf-8?B?U3FWZVVLWmI5YmxLTGsyUFN4UDRkdjB0cW9uNC9tRlVxSHg3STlJK29CSG1v?=
 =?utf-8?B?NnZ2dGhEbXc4SU45V3cxdVpVbjZ2aUlaODVLZk91QkNicVZ5eGN2ZXRSc2lN?=
 =?utf-8?B?WUg0bHNoSGIvaFFHUEJjNHE5RkQ1ekF2a09lZFR4YWFyOXV3SUZ5SHNhaDhQ?=
 =?utf-8?B?QnBJaVpDRTd6NEhtU25KVDBQTzlIcjQwTXFDWXlnNUhmN2lBM0w3UjRNMnll?=
 =?utf-8?B?cCtKR0MzbUQwd3ZEejdCWm9OT3NRUUFabHM5Y3JlWVRmOFVqclgwOFJ1TWlD?=
 =?utf-8?B?eVkrR2pTQ0xpUVZDTUdZakI1S3JoMkxMcFA4RWFFKzN6UHRyQkFyR2FNazg1?=
 =?utf-8?B?OHpWYTllN3VkdWg3UlViZkxRSzQrMGlsRU9LWWt2azJJVkY4eFBlM2wrVWFk?=
 =?utf-8?B?ZjBMT28xTUpFTlZMNHdUTkVXbDVQVlYzYTRMQTJDaUZmblJWcXBVSmJ2N2Vl?=
 =?utf-8?B?NjNUTTJvYmQwRHAyTFRyRDYyNDBVcFY2MmRjbW93dnR0T0NMSjFveWJQUGtS?=
 =?utf-8?B?V2tNWDR4QWJRMGova0V0NVdYUUxGdVRiSkwyNGVnWVFUWHdDOFN5UHpSVVVa?=
 =?utf-8?B?bFljUEdNc2UwbzdNbkZSQnM4dkp2eEdSaGFRMlRWckE5MW9NcUxUNUxoVTJQ?=
 =?utf-8?B?Z1gxdG5qRHQ5TXQ2dVhtSlNJajhoT1F5TDJkL2hubWhUVFBnaXpxclFzUUxa?=
 =?utf-8?B?N2Ivd3FTZ1FnNmplK3Azbm5xejU4OElvZXQwbmV5ckpMb0VDT2tFaTNMaG1C?=
 =?utf-8?B?SmdPSDlRN2RhT1dTeEVSaVBhM0lwWHYzYTZiSzQwNm1KNjE2ZStiVk9EQ21K?=
 =?utf-8?B?NU1WQVdQd2oxZWhUM1g0YlhCZXBUSVZZTnE0NlBhMXpOc21tUWVlWE5SYyti?=
 =?utf-8?B?Ulo4TGZIV1VYRWRiVzhvanZwRVI0QmI2K1RabGZERmNWVmVzMlJxQ0ZXM01B?=
 =?utf-8?B?VnBTS2pUV0ZQTG9WNm12TkpEdWtFdmg4RzJkN0JDMWVFWHFPZ2tlQVlpUVl1?=
 =?utf-8?B?WUR6YUtoai9yQ2pqeUhKY3lIc1BVbHluY2c4emhYSlAzdFk0R2dvVEtYbXF4?=
 =?utf-8?B?L0lFWDhYNjF1cEhnaXJLVzduakNWbldyV0ZUSG4wVU83YUE1bGZtSVhDcmx0?=
 =?utf-8?B?VC9ncllnWERSYklqOGJkSWlQTllWekF0NUMyY3R3Rk9jQVlBbkFqZnRkYlR6?=
 =?utf-8?B?S0FFZUVDZmpiQk5UVXpXc1dSaHhUZ2FNNkJZODJucXA5SmZnNW9GQVFhKzR3?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D47E626ECEA3C844878BD18605A9FB65@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4204.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89180c32-a547-44c7-9925-08daa11ac78f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 06:29:21.5019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ICu9ERn6U0zXuovcRKtAhBCd6agyaWWNaSbRcOpfwabAz8gLABa7xgxeimm+W6N6NerH9AmGvb+gO0sGXS1yLyczHMUMEickXLW4WPDy6NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6470

SGkgbWFpbnRhaW5lcnMsDQoNClRoaXMgcHVsbCByZXF1ZXN0IHVwZGF0ZXMgTVQ4MTk1IFNDUCBm
aXJtd2FyZS4NCg0KSWYgdGhlcmUgaXMgYW55IHByb2JsZW0sIHBsZWFzZSBsZXQgbWUga25vdy4N
ClRoYW5rIHlvdS4NCg0KQmVzdCByZWdhcmRzLA0KVGluZ0hhbg0KDQotLQ0KDQpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDA5NTgzMDFiZGU5Nzc1NmYzNGI2N2ZkZDI1NTI2ZTZj
Yzg4Y2RiNDE6DQoNCiAgTWVyZ2UgYnJhbmNoICdtdGstMjAyMjA5MTUnIG9mIGh0dHBzOi8vZ2l0
aHViLmNvbS90aW5naGFuLXNoZW4vbGludXhfZndfc2NwICgyMDIyLTA5LTI3IDEzOjIzOjQyIC0w
NDAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRw
czovL2dpdGh1Yi5jb20vdGluZ2hhbi1zaGVuL2xpbnV4X2Z3X3NjcCBtdGstMjAyMjA5MjgNCg0K
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDM3NWQ0NTAwZDMxNWZmMjBjNTk5MTFkMTJk
ODZiNDc3ZDQ5NzliMWQ6DQoNCiAgbWVkaWF0ZWs6IG10ODE5NTogVXBkYXRlIHNjcC5pbWcgdG8g
djIuMC4xMTk1NiAoMjAyMi0wOS0yOCAxNDowMzoyNCArMDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVGluZ2hh
biBTaGVuICgxKToNCiAgICAgIG1lZGlhdGVrOiBtdDgxOTU6IFVwZGF0ZSBzY3AuaW1nIHRvIHYy
LjAuMTE5NTYNCg0KIFdIRU5DRSAgICAgICAgICAgICAgICAgIHwgICAyICstDQogbWVkaWF0ZWsv
bXQ4MTk1L3NjcC5pbWcgfCBCaW4gNDI5ODIwIC0+IDQyOTkyMCBieXRlcw0KIDIgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg==
