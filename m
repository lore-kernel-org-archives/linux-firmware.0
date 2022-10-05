Return-Path: <SRS0=zW77=2G=mediatek.com=allen-kh.cheng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3873CC433F5
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Oct 2022 11:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9E71C433C1; Wed,  5 Oct 2022 11:42:50 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE8E6C433D6
	for <linux-firmware@kernel.org>; Wed,  5 Oct 2022 11:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE8E6C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0eaf21c96c9a40c0b4498acc3e2ef1af-20221005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=ps6aa8qPKqo9aV+U9f6dnzhulofnnznrhxzlr2doGE0=;
	b=MJHLfWcISIYbPoG+xTtj2XEDOlr/lfAQXLJmUbu+nxcClRskU4mOFQh9FqXyKVPHH4O+dzLRWdzxZCEpSOisSMiKrOv0ojX3jUDrSF1DKwhCha7yK1H69N8d+jikfz5NH5jS7Zp5n8SEttH6KTHvlBJrU0sJWJOqK+fKp5Nmf4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b40d2c99-f408-4da1-971d-80327e8a8631,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:9c7652fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0eaf21c96c9a40c0b4498acc3e2ef1af-20221005
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 218752728; Wed, 05 Oct 2022 19:42:35 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 5 Oct 2022 19:42:33 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 5 Oct 2022 19:42:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJMEABHYIHpgqYvHhJc5m5hPkVbjnQqNuNaYrsFYOktR+JvqrGJpj/ajezpVba2PBFoG95xKjoBviL+3Aw5eUDvMrWQY9d/HA31MQWuKelKMqLaJvFWRbNZwu6mlSBKsbGl3oE2w2N7gnNF/fC/uPoYPW4pHA3GGcR16Aa3tdX+zB23jxK0HoslNInUxJld1CWnhY4Xv0rIf7HYqxaSpB28Cm/HjFvq+xhSqRbH8DZvHjsMZfpHaet90YUth/BykO7rfF9vTdDb/26dNBUAA+5DepLoXW2/JyBvyliqmBEZYTESLgmhHORmmyJ/Phfi7PTwOm7Fs4BWaN7nrUWMTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps6aa8qPKqo9aV+U9f6dnzhulofnnznrhxzlr2doGE0=;
 b=GqQlm3zoVJW77NyaEDnsCU/QgbzD5rT8OaKc+JtWZ9vbRg+aOpLNY/P2mbhJYNorAr6Vg34ArWIWwqwuV0MDkpjePfYOGL5iSjtDcVFIFDWog9P9dknpijhP6FcIOjhg393kZiXYjKEEEqZzzIa/tUL2qggto9/k1F5NL87bhIElLxKMkiBDkwAkqTRf1rorwmTYE0WNFBwbi6MzTXK8JSc5ySx6lifusRwtHPqPHnfr024RxJpFPICjzEwTH+/IrZUBMnkIv6ZOa1iZp6cBoZsSS7t5SJ71G7eoOMWgvMU+ytzGEAuoLg38pZuNEmMV/UWtUwkV9oS0u6djUCk7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps6aa8qPKqo9aV+U9f6dnzhulofnnznrhxzlr2doGE0=;
 b=vlxXls6ZdQOJm7DB1nSNEvws8cAX/rOQyluuZrWOoD5YeEE0y0eHQu+kqZI/uBLYS0h/Cd9UMXweeBB/uOg85ruXiOJVHmHseRz3E4leChf8BBYCSpWKf6dvJUSErh8x+SLol7bYFn3UhLIIMuLY7A+NQxMHrw/KnBfln7iAHr8=
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com (2603:1096:400:28c::9)
 by TY0PR03MB6292.apcprd03.prod.outlook.com (2603:1096:400:144::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.3; Wed, 5 Oct
 2022 11:42:31 +0000
Received: from TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::1334:39fc:7259:5f6a]) by TYZPR03MB6919.apcprd03.prod.outlook.com
 ([fe80::1334:39fc:7259:5f6a%3]) with mapi id 15.20.5709.009; Wed, 5 Oct 2022
 11:42:31 +0000
From: =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
	<Allen-KH.Cheng@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>
Subject: pull request: linux-firmware: Update Mediatek MT8186 SCP firmware
Thread-Topic: pull request: linux-firmware: Update Mediatek MT8186 SCP
 firmware
Thread-Index: AQHY2K+NVnQ5kQ9uQkyI5POzV2P1iA==
Date: Wed, 5 Oct 2022 11:42:31 +0000
Message-ID: <418eecee438cd3386b1001a3bdba6d8e4e6307a3.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6919:EE_|TY0PR03MB6292:EE_
x-ms-office365-filtering-correlation-id: 7a73a877-32f1-4cf4-9aad-08daa6c6affc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KfvwKQaQFC4NfVPMmjxr0OywGvhJS7iPW5pXW1SwytuXSiJZXEmhR/b38YWKU7/i/UzU4sQLJhfQkScqvCNKb8P1b10uVRcWBB0xgKavVCvKDZ3UJ2eE2yTQQSEFm6bNqvhni3RzWCTrxrwpU/0Bf8lY3eKWXY0Wcsi//bybMTN4xnO0U7TgWcDRFsJfTiCtDNMOOJ0VYGVhhB1qtpiXuxTMMIXp9fH/dVfxzbnEWwegd/6/uCygztafKzX2OrFze4iiqCE1gaHeA0FyfqXnYmM65GOxHG3HOJgN2cxHBDU2qkzXF8vvbwxFAn7Qwk7Qyzdn1HRC9JOciZcWWpwfDU90WMsNh1rSz1KkwpvbzvVhLnvkPKlFQhZ9mZBiDHR+ek0I7Y9pK66rqzcZEu5q2GRLeQzazEV+9Jai9KpdcbEdgFHX/rt99gQvhXOGV1jg4lrE2M779r2bWVEUVemvDUxl/fZGnXVg/XW6JPwzGtmMM8t56rLjsmLB6UqFe4Kvo6MHpCNWFctRL4sLW1qq5o2ds6+t9xIsvFdgzoJQSqcH/MQMZNTJJiv74F6WbBLvPEPxeNZamawCnZrGwbRk6XN6W7ArDxN6bmW8UnM7k0xtZT+Wyx8H33I4yez2XqPMEBd1kl4rssj7e9+sW03ppgVP8zL8BYLAEvXUhMdhY13vsFS0wOGElPHcuqQJVOf3YJFGmaxnHMMb8LhhLsbqWT3ofLCViW1Fi7HorCxOjSn0e8RlDjE0WxkXfLX8HyMUPiaYVjm3l9n+VUKF7cdiCVDDZVp30GHHL9OxSNrqUYDsL14exb399FX/WdbC8VDZkNyww525jkA61yNdvgt6LA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6919.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(8936002)(15650500001)(316002)(6916009)(186003)(71200400001)(26005)(41300700001)(6512007)(2906002)(86362001)(966005)(122000001)(4744005)(2616005)(38070700005)(6506007)(6486002)(107886003)(38100700002)(83380400001)(66446008)(478600001)(66556008)(66476007)(64756008)(5660300002)(36756003)(85182001)(66946007)(76116006)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1dYWjNUZ3VKTUJScE5YeXFacWNDbEZ4UUdQekJpMGxOK0VxUnVxaDZtNlhw?=
 =?utf-8?B?NzM0dFBUcXY0aXhOUXhuQW05b3dlVzlIaTlsU3hSbVhKQTlSeUtDUkh1NkEx?=
 =?utf-8?B?b0J1bHZIQkZxNmxhWHRPVXBMUG5XTTBOa2xEa3EzajBaRENsbFFsMThHTUV4?=
 =?utf-8?B?MXYxOEFCSUR4UWYyc0owUG0yUUJrQU9FZktkMEZVbWErL0dYL0dIRWJ3Z0di?=
 =?utf-8?B?Q2RWTVd3YnE1cGl0R3lEZU9zWWFwSlJwN0pzb1llNmYzNnEzMlhlRUFRUkho?=
 =?utf-8?B?VFpHazBHejc4cUltcFpIdTNCY0pET3ZOTjJ6TndFSGhLd2ZqYThZcGhpbzho?=
 =?utf-8?B?VHU5Sm11Y1lyeFlXUjRPWncvL3RMTHZtVDlXYVhCUFZCVkhWb1VKY0w4dGo3?=
 =?utf-8?B?MTU2UFY5YnZ5T25pbFJaTlg1S0NmandISytrenEvQ29BelRNVDB0RHdsb3ky?=
 =?utf-8?B?WXNjL0pZUkZvdEZiVFNtbWQvRFc0VlhpMHVnNk5wc3FpN2ZXNFdEZFZJMkFh?=
 =?utf-8?B?RnpMSzBGbUtCSmE1a2cwQytORFFBNFdZTndWWS8zUk1PRGxRNUhvUmJ2VVV6?=
 =?utf-8?B?bC95TlhFM2RSWFZONUxHV2t6L3FKbHNqY1NqYmFGZTJuRVZYYmtheW9LN25C?=
 =?utf-8?B?SHhIRGJiVnRycklaQ2JYQ0JrbFc0dmlWQTZuM3h5bUF6ZlJ3ZDYxM09WQ2xi?=
 =?utf-8?B?WDhSUVpxbWJTRVk5M1htU3hNSlJuZFRWL1hYbmhiU0QxMGsyK3FkTHpnRksw?=
 =?utf-8?B?bFN0UmMvZWZQaDdYUmZxc3pWdmxQTFRKQWNwMXRhNWVrQ29ncU5XRmw2cThR?=
 =?utf-8?B?RUllV20zSlBldXIyK2IrblM0Ry9rWWtwRWhGZlh0T3BXYTZSa0JPdXR1bFRY?=
 =?utf-8?B?MHUyT3h3WXJQNE5wYUhmZnJYYUx6OVl4NGk2c08vdlhEWUhGaWJIWXhyaHhV?=
 =?utf-8?B?TlQ4NFBzZDRmS0xpYkdBRVdQcVBrdUxJb3M2Y3Nod29oVi8wRmRJcnFuaVhU?=
 =?utf-8?B?SjlJcDk4cDFRaElLRlN5L3JuaklPQysrYjg5Z08vZDdodUYvbC9xZ0Ztakxy?=
 =?utf-8?B?eW9VQmpEQVRJWnlsV2M2aXlEdjh1Y3FlU2paMHNNMzZza3dndnhDejJNeWxB?=
 =?utf-8?B?Si9ybXhpWVVsTjlrMTY0N0d3enFXTThucU9rd0FDaTV1WlU5VkZHdlBTSGVS?=
 =?utf-8?B?VDIreUUxUUlnTWRNMXhoaHRJZ3p2bTZzRUtHajR4RTRnWEZxaE1UOWhLc04y?=
 =?utf-8?B?MU1aZTZvaXI3UXBPY2dSeksxQVRlWE4vVjZhMVVsOVVuRWIzWnhveU9QOW1i?=
 =?utf-8?B?UFh2VWxsak93ckUrYyt5eWtvYit3UlRRNUZXS3dJZElpcFkzQ3crMXdjdkpW?=
 =?utf-8?B?SEJIVDl6WjNZaVh5aUR5SDliRndmcll0TUdLUE9hb0hyd2pDa0xabk8rZWtt?=
 =?utf-8?B?cXZxTlBNMEdWWGYwRU1qbHR0dCt2OGFaNmFtWW11ejVtRXJFMWZ4NVErU1I5?=
 =?utf-8?B?WHVZdWl1VERXdU9Lb0NpUllSYmxqVW1RNkJjVVlsUkNLeXJHK1A4cFhBeEdu?=
 =?utf-8?B?UVVSYi9TazlOOGJEZDhweHJEWUhiWTVaazRDREowYmVyTXJQcXBMbnVIR3R0?=
 =?utf-8?B?MVY5SFFQbkRacE9qanVkaGtVaFdWSWJvL3g2UGZuTUQ4eldqVFFMZTMwMmxi?=
 =?utf-8?B?TVp6eDFhc09ycGpMVkxJMmVkNCswdDU1cEFZVFEralNreHN4MVo1c3RKZlFl?=
 =?utf-8?B?aXlVU3FNVCtVemViK1ZJZkdpSzRmd2Z2OXVtTHBsZmRwc2p5WC9Db2RNVUpT?=
 =?utf-8?B?Q1BZYWd1UzBRTXhpRVRVVWljcWE5WU5VSVh5Y09XS2lpcGx2V2xMSjhDMmU5?=
 =?utf-8?B?Yk5GZ0Iwb2JCK2hKN0ZrR0hhOG9Ud1BMb2M1NHlJcGVxOWg1bGR5dU9ROXZR?=
 =?utf-8?B?T1M5cjQvenlGVUplS1Y0TUlYMUJiTmtoNkVWWC9yM2tISTVWMEJtM2lGN045?=
 =?utf-8?B?aThQSDMvdHgzMmUwYUgxLzZ2cTc5c0d5UmRaZWN5QktmdmhWdTNHMjNQWHBJ?=
 =?utf-8?B?UkJPOVR6aXM0eVVtemFiOVR0Ni9Ic2taN0x3TytudWFSQ3BpenY2YjZ0Yk1S?=
 =?utf-8?B?RVFkdEZ0UWFtbkE1ZGhVNERVRVIwanB2OU9kekRZVnVaTFlFRTcwQ1ZjdHNN?=
 =?utf-8?Q?bHgrE/WHRLn/9oqyjeU2qMA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B4BB4C8F7FA2D4FACFB27440FE3C75C@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6919.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a73a877-32f1-4cf4-9aad-08daa6c6affc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 11:42:31.2024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vjbece/iYTKLJzytbyMl6UCFXWDUcg7jR614AK0KlYTA6I39hdLlohDxW2gPrYPyo1sIajDUHCP4vFv1akKt567dTeBhU4RoiOi3QARyTX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6292

SGkgbWFpbnRpYW5lcnMsDQoNClVwZGF0ZSBhIFNDUCBmaXJtd2FyZSBmb3IgTWVkaWFUZWsgTVQ4
MTg2Lg0KVGhhbmsgeW91IQ0KDQpSZWdhcmRzLA0KQWxsZW4NCg0KLS0tDQoNClRoZSBmb2xsb3dp
bmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCmZkZjFhNjUyNTg1MjJlZGYxOGEwYTE3NjhmYmFmYTYx
ZWQwN2U1OTg6DQoNCiAgbGludXgtZmlybXdhcmU6IFVwZGF0ZSBBTUQgY3B1IG1pY3JvY29kZSAo
MjAyMi0wOS0zMCAxNzozMzozNSAtMDQwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJl
cG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL2t1YW5oc3VuY2hlbmcvbGludXgt
ZmlybXdhcmUtc2NwIDgxODYtdjAuMC45DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
bw0KYjdkNmM5ZjY2NTc5ZDBhZDgwMTAzNDA5NDdhZTJmNjNhNzg3Yjg4YjoNCg0KICBtZWRpYXRl
azogVXBkYXRlIG10ODE4NiBTQ1AgZmlybXdhcmUgKDIwMjItMTAtMDUgMTk6MzQ6NTggKzA4MDAp
DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCkFsbGVuLUtIIENoZW5nICgxKToNCiAgICAgIG1lZGlhdGVrOiBVcGRhdGUg
bXQ4MTg2IFNDUCBmaXJtd2FyZQ0KDQogV0hFTkNFICAgICAgICAgICAgICAgICAgfCAgIDIgKy0N
CiBtZWRpYXRlay9tdDgxODYvc2NwLmltZyB8IEJpbiA0MTY5NjAgLT4gNDE5NDg4IGJ5dGVzDQog
MiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQoNCg==
