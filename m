Return-Path: <SRS0=BfRf=2M=mediatek.com=tinghan.shen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970D1C433FE
	for <linux-firmware@archiver.kernel.org>; Tue, 11 Oct 2022 11:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CD33C433D7; Tue, 11 Oct 2022 11:32:40 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2765C433D6
	for <linux-firmware@kernel.org>; Tue, 11 Oct 2022 11:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2765C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f96be453ac534224aec11e92fadb0dae-20221011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=rStBllpIR3NFMcBGHyNyLRM6mevgl59/I0nq5Ju1hxE=;
	b=HqmrcgqOA98PWUYeeJbF+cbPZESlznO8QxU5Q6lFPHKSXrNnjAzcLWLcgd6Kon/uFl9gINEsaM6ua7rQeuV5r1MYl3y6De3scNyoMMIyfWQoa4Tn4SexJfQLzx7MagAirvIASYhG+SigPAcTK5f5Y7sGVr10cPQ6yxczUxwO+M8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ef16779e-b1a3-41e5-a575-8ba8bf5d2eba,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:7bee90e1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f96be453ac534224aec11e92fadb0dae-20221011
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2023226985; Tue, 11 Oct 2022 19:32:33 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 11 Oct 2022 19:32:32 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 11 Oct 2022 19:32:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CN1YKFnsJQBzXbCvuSh41zn98PjvLJ50O/RHOFymtRbFEAFCZ9xrMrWwkxE29Hz87CP5Gp8ufAAVTm0HrUG5Dt6mPuUIpiLqGaZ8nik/GVj0bJQz54tGMk2yBVhZMvWIavBVbLodTHzJdCM6YKLJQkiPn0OAZr3V/qJn8YvE6ykN2jFmSleM56jfeXS2OdTf/Z8TCuOv13udjZwyDLh8qKGEESHzaKgBGDI2wsdSY6TCg90GEtQx6zpByqfyhHugfnKBfFg4XLHfJl3j8bFPWP5a+OnbBvj0paib9E5IZrcTcdcjiiKhj+VtaKlkgJk27RcnlLspgXZiRv0nPbd/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rStBllpIR3NFMcBGHyNyLRM6mevgl59/I0nq5Ju1hxE=;
 b=QC8M13Dr8HBWeVlkcA3Qx7EX8rMTviDRwZUJUUwXXBm2Mq8hrHdeZ5gVt1KoQ3zKCCjuKuJijvnpzU9kMnJvBSaQsfdI5OD2ZeBi1Q6Dg3gg5vG/QYiF9jrXtfdbSLPYkRYvGRnCZz9dJrmKiES7EZ3awhkKQ8us4E/Q9GU81OgLgpvTg9+UBtWw/XeG7ZJUyfWkw3m/9q2uJgEQDa5+QXK//jaS6C1Rq5PxDAvGLCcZBZsFyrnQ/Ru08uIVtiQB45vY1Kjsldx3kzF4DAkGqjHrnEl7cvO4V69ns02JX/ilFiRxnqx2wWbpWSFG/fCkNm8D3UZqWG+sU7efKrA9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rStBllpIR3NFMcBGHyNyLRM6mevgl59/I0nq5Ju1hxE=;
 b=e3AAULeL5q8E8VSp5ozPTAu+mlVxpqqI4PZucaVex0W0YnVjL95UVGT/FZkHRb3yXS3r149G2rpKMJ09MV+5AbpJ2sW9MPqTJtm4lmyWX89uEa5T8JQvCL9AFR571/mqMQ91eEUHhg08Rj+YE8CqFBf+m93Fh58THUmccdkHpj8=
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com (2603:1096:100:53::15)
 by KL1PR03MB7126.apcprd03.prod.outlook.com (2603:1096:820:de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.9; Tue, 11 Oct
 2022 11:32:30 +0000
Received: from SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::fd9e:be5e:18eb:3382]) by SL2PR03MB4204.apcprd03.prod.outlook.com
 ([fe80::fd9e:be5e:18eb:3382%5]) with mapi id 15.20.5709.010; Tue, 11 Oct 2022
 11:32:30 +0000
From: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
Subject: [PULL] mediatek: Update mt8195 SOF firmware to v0.4.1
Thread-Topic: [PULL] mediatek: Update mt8195 SOF firmware to v0.4.1
Thread-Index: AQHY3WUlMSpBO+nv2EuMPipBRpDq3g==
Date: Tue, 11 Oct 2022 11:32:29 +0000
Message-ID: <676d04caef93b8608ef14aebfbeb06a7b4af9cd3.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4204:EE_|KL1PR03MB7126:EE_
x-ms-office365-filtering-correlation-id: 4c4e5ab4-4149-4b04-5812-08daab7c4813
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cSJtrwRjbFJGTWGKicLtT4DFdeJKqSozyRT+PBGH8UJZLGhyipEwEuAxicFx5y7RWaPH5LLuDXUMqBzNT8+saeUd1l3EgYEDXmpPFUPZePFPRqIAw8gNlvovdLAlJucfqqZu7PChFF/IJNAGCQwI3yTfCh8BtfCWb3eTqw7plXXrihuYXgZ7cS9Tt9b5xFkQ8QJLsdNXmyOEP2e+GWaj9CI+yRo0ubPnNYpQ95QsEv1CIE5FSeRfjhSFZAX1hWWLqWATsK/iLktUV1fNqsEJbeCv7yj4CB6gzLf4Rq8Ytm1RnLK3yXBvMoLIQWS3FfWykZKs/04NFzXZgA9bvefCwf1oUMVn6DpWNWhlgm2FADCl7HLowrPI/uFQzhohcUI49arlSAh9k/qiT16FjGlrFVrATRZQ1wRrETjsBK39UbTFVV920GUDd2XU/iUeFuYKdSui90ShXsvQDCaH4qfXzCd9rAJ84kcTQNJGb66rJm4Uv1G0es1psWL6abR0T02NSKVBJ7X76B1sOrMWiWbQHqw7KNMhDr+XASPFJywDoAhrfDvMmiMDGSBTvxzxBAnazirOtr+yIXHNYLvvCfBA+nx55WEa7WDgnNtwOpka85GBzZDxacYh3B0HWDhzDBiM7lkPmQ0j82VthVatVd5Ntf7KLvfRwSrdLGR9egCCr6e+OEm0Z8r3bLlduAg/T6hBFNzbY4+eJjAVgJzhDMks7ePHkDI+D7JkfvEJWaPNTACL+cznchm9NB/ugmMwxK9CWq29PJGNRZKCPZ6qlyDk3Fzlt2l9LRnHByKGeJnc0LfnTteyiPB+CmXSlob/5L9gKWnO2DFi7f6DeuMAmdM3vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4204.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(4326008)(36756003)(85182001)(86362001)(316002)(122000001)(38070700005)(4744005)(4001150100001)(2616005)(54906003)(186003)(83380400001)(38100700002)(91956017)(26005)(478600001)(6512007)(6506007)(5660300002)(66476007)(41300700001)(71200400001)(15650500001)(966005)(66556008)(66446008)(6916009)(64756008)(76116006)(66946007)(8936002)(6486002)(2906002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2lWUDZ4bkNRb1pEVEpzNjNqeEFOSmxLM0hrQWNuTFNzQyszc29HcUlkUVdD?=
 =?utf-8?B?VlNuamxpd0o3V2FheERqcllNZVBVeTlPTm82bklqcWRTb1NnbVdvdm0yNlgz?=
 =?utf-8?B?V09oSnpoMlhoUVhDbmpKSDhBN29OenpOTG1VcGpidFNVOU8ybFZDR1UyeHpM?=
 =?utf-8?B?YTl1WWozVzVRb0VRRTBCeGxGUG5IT3VFVXc1MHZwZmhqWHk5T2lSTUtQd0hX?=
 =?utf-8?B?dUdYdE5uT1AvbU83Z2dmREJuWm1ZUFBxNGtkTHlEUlJEMW04U083aTI1cURj?=
 =?utf-8?B?REk2SVVHQXA0SlRnTGlrMnNjZzBocmlFeUlOTWhvMm1wS3pPMXp1ZVZyODAv?=
 =?utf-8?B?ekp2VzRYYVdUK0ZjZjhyTGdKMEowL2xhd0dETVFBUnI0UDRLcnVId3V1Z0M5?=
 =?utf-8?B?VTBLaDNyZkRUdnpJcGowZkJVQkljWHh6d0U4NEFzemFGK2JGbkF3RGQ0eVAw?=
 =?utf-8?B?L1VWRnpsemJkU0xvRWo2aXN3NWo4aUV2SjdGQ293cnVTbGN4SHFTMEloUnFr?=
 =?utf-8?B?bUpaMktmcnFiM0UvbEJDeFkrUFZMdzY5ZURXRXVMeG5OZnFjRjkxckFsQTFI?=
 =?utf-8?B?Z3hYMldxb3Z3dDZOTGRCc1kvb3ZMdzJLSHBzWVNDakpqaGMzS1ZPdURQdW9G?=
 =?utf-8?B?TUQxd0RsSUdjTlkrcS92RC9uTUFXSTBYSXJkY21tcDFyZXNzM2RybzZiYXB3?=
 =?utf-8?B?aFZyVVdGWjBoQjBsQWtySjFPamZZZm5nS0lvKzdzb2NHYUM3eWxTMUxrMitV?=
 =?utf-8?B?aGFRTExvdlVhMnZFbW9lejJCTXZKNW5ra0FPa1MwbDFNdFo1NkdlaU42TVZU?=
 =?utf-8?B?cnhoM3A1aTZBYU5yUExtU1hTWnEvQitMUk5Gb2wySWozc3c4T3g4dWxvMkVL?=
 =?utf-8?B?dGJKNHEzMWVCdEVIMktiMWtKeHlhekdRWFBYSHc1WHBERXZwWDA0Zkx3Ymtj?=
 =?utf-8?B?Yk5MYUZnVkZNL1draDkwNlRmby92QjBEMGlteHVMdmZvYzBYYk5kY2xXQXh4?=
 =?utf-8?B?QVpWMTN2RDEyUW9CZ3ZnRG84VldobWE2MGQ1QkdPek1NUVJzdzBQR1Vacnpk?=
 =?utf-8?B?SlV3ZXUybERuQnUxaWdlZUpWOGlIL05Eb3B5UDZvdkJKSHZkR1ZYYkQ2Sk1D?=
 =?utf-8?B?bDhTTlRDWFA2dyt5Sk1YTlA0U0pCeTUyb0dIVEEvbFdWV2xRMy9DelorVlFU?=
 =?utf-8?B?TmcxZm12SDE1MUZWYUpzU3RSZ1d2Q2pWVC9HZzlvTEdhbmRMMEZIZXNmRVAx?=
 =?utf-8?B?OEZlZU9SSlVsQlE5eUVCSDZvQmpCdmZ2TFBDNS9jdUE4TGs4NWpDV0NNMEFB?=
 =?utf-8?B?eFYxUlZkVTdmZHhXcGsxanZWU3YyK1B5T0NjSnh0UFRsNG1CalJNbTdaUWlp?=
 =?utf-8?B?WG1aNm5TK1hpSEZTSGY1L0JYV05SVEFDR3F3NjV3TEVrK0JYeXFVME45bG12?=
 =?utf-8?B?WTVNOWFXaXZtOGR5V1J0cnVoYlpwV3RuL1dUejA4bm90ZkM0UGw1d1ZQQU01?=
 =?utf-8?B?Z1l6UHVzRURqYm10MUdxdnEwa1N4czBrMnhhMCttUzB1cUtIQmlxV21lMUsr?=
 =?utf-8?B?RTFBbHRMRmh1UkNqOWVBcTlLOXY5em5pUGUvUVhUZkxCZlVmdXZ2ekRoM0U2?=
 =?utf-8?B?TXdLTU8vVVYzT2hxZ3k1VW9ycG03eUtkUWdET0o3aXB1MWVMQlVrM1RtcjBz?=
 =?utf-8?B?VUQ2ZVdCRmRHem53WSt6dTlaM3RNazd5TjM4L0ZWRVNnblhjb1hQalVyOHZj?=
 =?utf-8?B?UEdhVFFWdXFFMFVWT0FnV01oS01BRWFBaWFrSmJTSEtGQjY2N2VNSXM0MGhP?=
 =?utf-8?B?ajB6aFE0L2JDbDZkM1ZKemxPZ1d6T2hvKzN2RWwyM29QVmRYdnd4T0xiZUln?=
 =?utf-8?B?YklrYllVbVRxOGxQRUk1ek9IbWJWT3B6MEp5UzNacjAraVZwNkpvdnl0RG96?=
 =?utf-8?B?aGNHR1NRMjg3SmdpVWlzWEtKNlgwUlZROGlwSVpzazRMWThpNEVvMTZvQnZl?=
 =?utf-8?B?cHNXenpRV3RoS0pzUWdtU2tWd1RkRkpnVEJBZnN2Q2R2Z0lTVlhpR0VrSVRY?=
 =?utf-8?B?ei81dEdHS1M0bWZrTFdVQnhTejlnREM1cHBZSkFPS25OWVJ4R1p0c0lrTWEy?=
 =?utf-8?B?eXdiQUJ3MVpybndtVXJqYUk1RGFjbGVUYVU2VC9Ydk1POXJHclEwcDAwZVcy?=
 =?utf-8?B?TFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D948C7D42DD50478BDCDE5BAC4045C8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4204.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4e5ab4-4149-4b04-5812-08daab7c4813
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 11:32:29.9711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s2zEb35fcwy9MaoLpauBqkLCwfTS/35aVQA+F5priOJ8MldX7jIfMQxA/yemVORu985KPP+fpsmT5vqEB4e89RAR6zGRQXrDLY4c/92YYXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7126

SGkgbWFpbnRhaW5lcnMsDQoNClRoaXMgcHVsbCByZXF1ZXN0IHVwZGF0ZXMgTVQ4MTk1IFNPRiBm
aXJtd2FyZS4NCg0KSWYgdGhlcmUgaXMgYW55IHByb2JsZW0sIHBsZWFzZSBsZXQgbWUga25vdy4N
ClRoYW5rIHlvdS4NCg0KQmVzdCByZWdhcmRzLA0KVGluZ0hhbg0KDQotLQ0KDQpUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGZkZjFhNjUyNTg1MjJlZGYxOGEwYTE3NjhmYmFmYTYx
ZWQwN2U1OTg6DQoNCiAgbGludXgtZmlybXdhcmU6IFVwZGF0ZSBBTUQgY3B1IG1pY3JvY29kZSAo
MjAyMi0wOS0zMCAxNzozMzozNSAtMDQwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3RpbmdoYW4tc2hlbi9saW51eF9m
d19zY3AgbXRrLTIwMjIxMDExDQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2NzVi
ZDZhMjRiYTE1ZDBkOWEwNTUwMTU4YTFiMmM1MTAyYWEwMzM3Og0KDQogIG1lZGlhdGVrOiBVcGRh
dGUgbXQ4MTk1IFNPRiBmaXJtd2FyZSB0byB2MC40LjEgKDIwMjItMTAtMTEgMTk6MDc6MTIgKzA4
MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NClRpbmdoYW4gU2hlbiAoMSk6DQogICAgICBtZWRpYXRlazogVXBkYXRl
IG10ODE5NSBTT0YgZmlybXdhcmUgdG8gdjAuNC4xDQoNCiBXSEVOQ0UgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQogbWVkaWF0ZWsv
c29mLXRwbGcvc29mLW10ODE5NS1tdDYzNTktcnQxMDE5LXJ0NTY4Mi1kdHMudHBsZyB8IEJpbiAy
MDg5NSAtPiAyMDg5NSBieXRlcw0KIG1lZGlhdGVrL3NvZi9zb2YtbXQ4MTk1LmxkYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCBCaW4gNDA1NjggLT4gNTExNjggYnl0ZXMNCiBtZWRp
YXRlay9zb2Yvc29mLW10ODE5NS5yaSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
QmluIDEwMDc0MCAtPiAxNzM4MzIgYnl0ZXMNCiA0IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo=
