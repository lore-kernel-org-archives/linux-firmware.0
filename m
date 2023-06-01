Return-Path: <SRS0=r3Bz=BV=mediatek.com=yunfei.dong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232C1C7EE23
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Jun 2023 06:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D93CDC433D2; Thu,  1 Jun 2023 06:28:50 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62DFDC433EF
	for <linux-firmware@kernel.org>; Thu,  1 Jun 2023 06:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62DFDC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8d9657fe004511eeb20a276fd37b9834-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=vjyFzjP9TphCvKM0NGF2uUPsPops0yIbbZcd2ASLfXg=;
	b=i8G/HTZashRDSAtfotAs6yTe2lbiUCk11G4DclQKTSdAxW0PipUP87VhUqQ/cOo2YAC5Y3rdRiQNH7Zo8xfrqEIp2sxxcAaDL6IkyiaP7iffM+HDBcxKm18kKy7TlnBXFJNtFv0TH5p9M0L18QO+oTyCBBm/Cq4OhUHhxUvFCZ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:823d7789-b93d-40db-bd91-0b665289bcb4,IP:0,U
	RL:25,TC:0,Content:-5,EDM:0,RT:10,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-INFO: VERSION:1.1.25,REQID:823d7789-b93d-40db-bd91-0b665289bcb4,IP:0,URL
	:25,TC:0,Content:-5,EDM:0,RT:10,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:b812ae6d-2f20-4998-991c-3b78627e4938,B
	ulkID:230601142845JQ3C03T1,BulkQuantity:0,Recheck:0,SF:17|19|102,TC:nil,Co
	ntent:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 8d9657fe004511eeb20a276fd37b9834-20230601
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1231945429; Thu, 01 Jun 2023 14:28:42 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 14:28:41 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 14:28:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmBD0mQQcUQoAl1OVU5lEwYJL/PQytMlsCQgVAfkGuez77YV/LkukVfdzi2Ye9yqr1OfFxVNExQHSYKfNT46DjPIlvZOmKMOWVinsdnjJlTnq2Oujq8cYF11yLKMCBfGpt6+w1LcFO8lg1aIjn8c6+16GAQB26SDnS2uVU2Zbj18WLmtXNy8HRoWHo5KlajyqgnaTzfSan6MRQ3edjRGmp1LLmXWvWnPkUtdcifEusu3xwqeClHRhPgZkb2y53YAktC/iYgPaIm6f47QJibDuUpFknzFQT6YPTExyYyHgvEJDBGTzEZU4p5fZYA+4W0qvTChXnr3jwwSBYpo8FsrSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjyFzjP9TphCvKM0NGF2uUPsPops0yIbbZcd2ASLfXg=;
 b=Vs8BR3MPedyS4bEXpnDjrNRK4MtJW92RS2YIQ7XuNqM5EolAFWYFQuksA4WtTgYbyhVVbGo+C0jfdZKEk71oWSh9Bs04OXOQnf4cylH9j5RXpZBzBzPRqCM79pgUxN7ZmNMd+StHWxlRxKTezcp9Mb3vXCUKkPHliOs3xONdNZ7FCafip5DTInSqJIej72kbkZH95jJ6p0OqqPxPHwwhLldGpfaEwvo0UueTX8Z6RDD1RZi3FePJErx/LW6pj0GeYAhSOwspPsoUq1dl3nMfss07HPAAxlzbne4i3XcARU4YAuOMsYn8b17SI0krORwc+vJSCUBBZqHIswkcRtG5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjyFzjP9TphCvKM0NGF2uUPsPops0yIbbZcd2ASLfXg=;
 b=s3N+hY0bUEujxKcdabVezYd6MqFw8i4YIosCukpAXaWWMDNSNN5nXs6zQZD5Yw481dg1T/pHz7IbTGcWOOyPqf4Ztua0rdCT7LQs2mH1vtxvxPkFCfoh+jJvev4Mn7v3jUwovN8B9KnieImBjPO3gU5xB4MmDTPJM3iszjZ9Meo=
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com (2603:1096:100:4e::10)
 by SG2PR03MB6230.apcprd03.prod.outlook.com (2603:1096:4:169::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 06:28:39 +0000
Received: from SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b]) by SL2PR03MB4153.apcprd03.prod.outlook.com
 ([fe80::8fce:558a:2511:c41b%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 06:28:39 +0000
From: =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>
Subject: pull request: Update mt8195 SCP firmware to support hevc
Thread-Topic: pull request: Update mt8195 SCP firmware to support hevc
Thread-Index: AQHZlFJNlt7HSraeRE2rdDbYiN+8Tw==
Date: Thu, 1 Jun 2023 06:28:38 +0000
Message-ID: <6d2667a4001cd22c42a7e3985ffdcad0edec6e78.camel@mediatek.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2PR03MB4153:EE_|SG2PR03MB6230:EE_
x-ms-office365-filtering-correlation-id: 76ab02e9-8ed2-46ed-3938-08db62696fc6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2rH+LSvNNJlryKLSp7WI1/wvAC0nBqxNTlXMGnvmRhUBeNQzLo0/FuUI0/lo/ExU2lN72vNVboB59vNaqHHjsK1SF3nYWCOooHvzWzkCKTGycW193ua/gCFZVt2yykSyd0Wpqyckozgbs5Q9RAG1ay7D/Hm49whZFMhw3dOILIjHtDc8X8DEWqjk2+AUsOaLGNqlaRNjzeuGwwLrKz1b0s7BLehByta+pn3YYKwTFxYYV0piT5h3FhPbl51tCXdvkSW6yx2nzGMQEJBfZpp7TD/z0hkBJg5RcuHCPL81VC0FEkTfNYyz4WmMpg3/5ErItRg/I1yVOM6vcb4TYjqP4ff0FfgyfYPJOJLybk5c1S4lovr2yY0zmiOCJ6WWSrEE0/c6waM5bQlQZWGytUg5erOEJ2jBOzCsYATvnuFMs6uqqhs3ViCodffAkVuPLSwy264yK2Q5Zo9rC2d4P7K8MrSh2DfAQU6Kgd2EdOssGIbM/+kTOXBCtjSnjqyWD+gsCMNXZF5Uu2pTRbF9hmzb3t6IJyI6T1EkZmwbpsK1P3arJXxN0weZFOI6uOmbLzFU6f3XZekcc4Ud73nrgyYa9uqvtGMHwUMSTYKJoXoQf5ezaS+OxMolQOJyxBdI1gaycGfT8miUXXbgWGpd18TLFKs+lOf/Vz2dLYMvJQTgxtkBy/MQVq/MOcSDgGubRKSI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4153.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199021)(38100700002)(85182001)(122000001)(86362001)(38070700005)(36756003)(8936002)(8676002)(41300700001)(966005)(26005)(107886003)(5660300002)(6512007)(6506007)(2906002)(4744005)(186003)(15650500001)(2616005)(83380400001)(66556008)(66476007)(66446008)(91956017)(66946007)(316002)(76116006)(6486002)(71200400001)(478600001)(54906003)(4326008)(6916009)(64756008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0FYTFd0cmVkbFhLS2o0WVhvV2w2WFVYa2NpTksxbU51enNibjdlcm5ZbnpE?=
 =?utf-8?B?Sks5di9IakY3UGlpTVFqblpJY3ZJWldwVjJFWUFhdjRBcnkrb045WVV1NmYz?=
 =?utf-8?B?VUprelZiYWkzRUF3VnM2dkJKRjZ0V05CQnVwS0hXdXJRMlBibkNpZHVFUG1i?=
 =?utf-8?B?dGVzeGpMUWxURkk1UEV4bGV4MG4vYlQvVU1aa3JydVczSTdOeW4zcG51NHF0?=
 =?utf-8?B?UFhBcWtxbnRKQm42Y1Qwa3RzNXliMzNwdlpOclR4dURSVHFwWkRCNHRLU0pr?=
 =?utf-8?B?dmhqR1gvcEQvdTNFYXRrbDVNWXp4VG9nejU1RXNCNDE3Qi9pSkV6bFlXemxo?=
 =?utf-8?B?WEw0Qm5YRGVzTWVxRE10VGJjaDJkWnlpM0p4dnBpMDJkV0FuL3BmWHQxUjdp?=
 =?utf-8?B?YW5jK3o1Q1c3N2NmMjJ1K3RERGM0RFJKZ2l1aVJhZ3E5THREZjJkRHVXMnM2?=
 =?utf-8?B?MkdMZ3JWdWd0N3lKYks4bTVWblNvR1lPOEZyV01nLzU0RmxVbHZIL3FMUmRQ?=
 =?utf-8?B?dGJTdXM1dkpyOUc0TjA1NmF0QkxhUkhHL29EdlM1OUlyNEd2WXZLRjBTSVNl?=
 =?utf-8?B?NzUwdjllNHRJaFhDbjE2bkludCtMTzA4S1FFTWNNZndjb21UcndVaHBzQzEz?=
 =?utf-8?B?Vm9KTVZqTTNhTVIyTVZEN2lEWU5OYXZyS3V5YjJXemhvWDJMQW5NL0Y2Y2Q3?=
 =?utf-8?B?Zld5dDB0bnYwNkRuZ3lETkNLN1p4NTljd056V0IrL1pZQUFnc0RQNUJDaE5v?=
 =?utf-8?B?Mkh6YlRnRlh5WFNpRkNmY3d6MXJHbGZoWm1maDhQVVA2UDdYSjBQNEd4MkYv?=
 =?utf-8?B?ZkdBbjV0dUhseHQvNVZIaXVoY1dDOUxiUnB0R3hyVHlqMnhoNUVjV0ZETHdl?=
 =?utf-8?B?ZG5yQXJEb0xKbTlKZzVYK3E0bFBORVZxNHhaTitGZHZFVnFFd1dBbnIySnpw?=
 =?utf-8?B?bHg2UklrdzFSZjA2V3hzaWs1VnM3SnhFRTg1VkhteDh2N09mbGI0eXZnODZy?=
 =?utf-8?B?Rzh5SHJTZmxxNHhmdE45eCtZMFZDaS9Jd3dkQlIzM1RFTkJCeVZ1azZkSHpV?=
 =?utf-8?B?NXpCNERuUUo0ZkVXejQ5QWZzS2F6ZzFQRU9lc3JIK3F2TWRZa0Z6OExCNTN2?=
 =?utf-8?B?ZEVteTFJemdXM3NtQjkwWCtpdVBZcmFQcGlCczRmRlZqbU9yQ2xQL0xPMm5V?=
 =?utf-8?B?UTJwSHZtYzRkOGxTcmlvRzNuNmgva1htODBmTHBDbTZVU25zQ1ZueEZKNm42?=
 =?utf-8?B?cUhoMHdPbTV3SFlPaSsreFJibmdwVlVUYTY1V3RPS2dOQ2JMWEJlSkFDOTVq?=
 =?utf-8?B?Q1l1RS95YW05Y0lveXhyS0tvTTAxTnNXdndla1F0WHJoR3VtWFVnbm9RTEVY?=
 =?utf-8?B?anJkaDBFRVVVMnNOZ1hXRGJSY1ZVUlo5NmsveEo2Q3BMSTNQT0o0VTZ4ei9D?=
 =?utf-8?B?cE40eFYrOHl2U25UQ01VSFBUcWNIVm1naUZpODVnL1lvL3ZJQzRqS0UvenE0?=
 =?utf-8?B?MmNxUnJERmQwMGtxODF2Q3hydXdiQXcwRm1FWFhQTWV6WVJ3VW03RmREdWtm?=
 =?utf-8?B?YTRIWnFySEYzb3RjN29DQi9uRGFkUkxQMldReWVnN2ltSklYSmhjZG5WRTkv?=
 =?utf-8?B?QXRnNlQwdVBkZkwrcS9uRGVob1VmWEZlRHRWZHRVSFVPVHk1aUlac0tGdEVL?=
 =?utf-8?B?YXkvS3BycW1seXJBempVRjk1LzhDRTFzTlB6YjVoMlVET3pYM3FHK2VQSWRv?=
 =?utf-8?B?bUFPb2R2eFBRaFJzRFFtZ0l1c0FzdmNRNFhsamtMaFE1cXlJQlhONFZ4MGZY?=
 =?utf-8?B?QnNIb3RyWUI5TWU5ak5HdndUeDVMRUdObFErUHJZdXBUNndTMUc0U2xVK0k3?=
 =?utf-8?B?cEt2RDk3ZE9GQmlQUVJVcEtxUUFsc3hPQ3ZJRzAzenorYXR4NUVrVzJGNkNG?=
 =?utf-8?B?bThqRHJ1Vy9PV094b3grUkw3ekhHc2ZnOHVNb1FmTVA5VmVMaHdtQjViRU1a?=
 =?utf-8?B?RGlxOVIyVVVnMW44SndjcGY0NkRqUW13VDVGWUQ0eWtaWXY2RVRnaGxWKzBs?=
 =?utf-8?B?WFhPZzVKaU05SFVGVWhLYlV2dmJtUWNraGN2V3pERG0wQWlwRHNSc1djQWk5?=
 =?utf-8?B?cFRkMUVZUlE1TmpiWXpiT2x6aHpWQmdESWwwWFhYUlJSUG9vZFFJNXdkRE9a?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E391C13BDE109849AD6C805CA3DFDBCE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4153.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ab02e9-8ed2-46ed-3938-08db62696fc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 06:28:38.8947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: khide3fOFKyhvUs4kbZJWoaffs6GOwLOPyKCMEbMnu15sbOTIYngZGCrbfTKAnl5o99hAwriOCs76v0Lhbaj5H9scMdWw2jJtriM2H+DGtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6230
X-MTK: N

SGksDQoNClRoaXMgaXMgdXNlZCB0byBhZGp1c3QgaGV2YyBoYXJkd2FyZSBkZWNvZGVyLg0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgaXMgYW55IGlzc3VlLCB0aGFuayB5b3UuDQoNCi0t
LQ0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQoxZjk2NjdlYmQ4ZTZhYWMy
M2JhYjhlOTViMGQ1NTUxODFkZDQzMmJhOg0KDQogIE1lcmdlIGJyYW5jaCAnZm9yLXVwc3RyZWFt
JyBvZiANCmh0dHA6Ly9naXQuY2hlbHNpby5uZXQvcHViL2dpdC9saW51eC1maXJtd2FyZSAoMjAy
My0wNS0zMCAwNzo0NjoyMA0KLTA0MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS95dW5mZWktbXRrL2xpbnV4X2Z3X3Nj
cCB2Mi4wLjIxNDc4DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KODAwMDZkOGM3
Zjc5ZGUxNDkxY2ZkNGVhNWViYTI3ZTM3NDlmZTA2ODoNCg0KICBtZWRpYXRlazogVXBkYXRlIG10
ODE5NSBTQ1AgZmlybXdhcmUgdG8gc3VwcG9ydCBoZXZjICgyMDIzLTA2LTAxDQoxMzo1MjozNCAr
MDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KWXVuZmVpIERvbmcgKDEpOg0KICAgICAgbWVkaWF0ZWs6IFVwZGF0
ZSBtdDgxOTUgU0NQIGZpcm13YXJlIHRvIHN1cHBvcnQgaGV2Yw0KDQogV0hFTkNFICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0NCiBtZWRpYXRlay9tdDgxOTUvc2NwLmltZyB8IEJpbiA1ODc4Mjgg
LT4gNjM1NDEyIGJ5dGVzDQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KDQotLS0NCkJlc3QgUmVnYXJkcywNCll1bmZlaSBEb25nDQo=
