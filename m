Return-Path: <SRS0=iniC=QY=chipsnmedia.com=nas.chung@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7459C433FE
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Dec 2021 10:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 810F8C341C3; Tue,  7 Dec 2021 10:50:37 +0000 (UTC)
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (mail-eopbgr1280099.outbound.protection.outlook.com [40.107.128.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6C2E1C341C6
	for <linux-firmware@kernel.org>; Tue,  7 Dec 2021 10:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6C2E1C341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD/i07LTTnvIN2iLFG4km6nuNTrLTKFE47I8/YzOVyEbcv8Sc37rqUukFt5QKvmno1zKL/KUrED+z1S/QvM0eaHZIUgIVONAJx7ySpaR/nIPhjARoUpSs+TnSgFNdxFA89Ij6xT2+WLXPZgpgpz7RdCqB9GBEJacziQjbJCpIwjFTeTZkMc8J0mUUU7CT7Q3d4Pb4WVylMttVetS/HPNc8kSMjd1thWcxWIw4ptQBDgfgRkvTxNn8OdGmnfzXm5KgnXNyJTyfAtb+HbydxQKUteAC5382jOS6T+oj7DTTAIWjxKl0Hj+L9+Rehqbg6jQYuQCAP+XOE/Ez3+gA3C2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+4RPE5FNYajQjmor7xpMYLICBJM1oZHt8vj2TxHdjg=;
 b=lNZiraqZXy9YokW7nwYeSrPgFfCm5d1rSVgK3fWwEYt/xxExkxotwvI6Lig0/kPB/FGnoJ+GCcKjvPqcOqL0FV2nq+gqS5Br93mNroIBZuiPeh6R/Fq5xuu6jRoO/OAgMkadYzLhk9ErwSHmlD3fHAWNv5aPXv3ftMBskxy3MwFSgxiMd3CqZ1T5YsI7y3Eu7AT4Y1q0N7mThwBFy9PDVCCZuBo4IgmMdz2hKHK1ihQl6OZbB+LRtpv10ZT4YJHOQqd62UunHbQVUAjUp8ttsjbcHnNLpiaz5nz0q6IGSvUeRZQqfTK5hMcDxTeHoV6axNzBGdV12EihaRLddUpBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+4RPE5FNYajQjmor7xpMYLICBJM1oZHt8vj2TxHdjg=;
 b=JBpsEy4EkyjsaTgazZQ9FIJ7JsJAvkv/2URRMdj3/hsv5VG8Nt+zn+3cA8N2xc5TDHMmneg0vGzQpz6CxgPTIdU++IjSgf5qXgv7Ti1R86UVRktIW/19g1DuZbF2w/5pK+tB2w29eFn6IUCHl2ga1GXq/FvnxPC8WT1YK7r+UJk=
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SLXP216MB0830.KORP216.PROD.OUTLOOK.COM (2603:1096:100:13::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21; Tue, 7 Dec 2021 10:50:30 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d69:e77b:a8a6:ed0b]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d69:e77b:a8a6:ed0b%6]) with mapi id 15.20.4755.021; Tue, 7 Dec 2021
 10:50:30 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Robert Beckett <bob.beckett@collabora.com>, Nas Chung
	<imhwan.ch@gmail.com>, "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
	"olivier.crete@collabora.com" <olivier.crete@collabora.com>, lafley.kim
	<lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH] cnm: add chips&media wave521c firmware.
Thread-Topic: [PATCH] cnm: add chips&media wave521c firmware.
Thread-Index: AQHX4qhTisOF1zuoIUuCCuwvA/DTGKwhGtAAgAXKJpA=
Date: Tue, 7 Dec 2021 10:50:30 +0000
Message-ID:
 <SL2P216MB12468DEF5300C6EE8B5B1683FB6E9@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
References: <20211126093014.1385752-1-nas.chung@chipsnmedia.com>
 <3a9417b9-e121-62db-212e-414d0831cb15@collabora.com>
In-Reply-To: <3a9417b9-e121-62db-212e-414d0831cb15@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b48b266-0fb5-42bb-2df6-08d9b96f62ed
x-ms-traffictypediagnostic: SLXP216MB0830:EE_
x-microsoft-antispam-prvs:
 <SLXP216MB0830E2915DE931CF9275C99CFB6E9@SLXP216MB0830.KORP216.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xwKK/fjy4ngNSpBCu3RW2SfvycZ834dYSoQ6plibD4DJwNfeM8qihPOCfVMcBWo/JXMeFLc8wQ8SqAfEUP6pNaKJyfHiJRarBzoebqB+8IhBqZHNfrtZEddOHHxlg7JIBBPTofGJIFUY4CEMtUAEFeBQDzZ5jmUwti7HoX696Vodd5hynE0m05y0r5O58vHlpzXnW4qpxT3QBiwrOeteUg9D/R+sv2MxkH3QeZmMS4blYW29lLfHFmWy+cPMrgkO0snSqHS4uY7g73qjBmPPniVwuAwucSozE2ZsVQcxxvw7iPG0LUxolTUUbaN5n2j4FDRkv0qPxToAwljfwf8IUU1tj21lSdDBhwFdN/8+qdlQTV3uafB3AktUck6vEHnlSLtco9WuSIfcMp3AMLbCnmHLzHaVqgSJv33g56nDvu1gUYcw3Sf3UxDAUXCJnTZDfDVQZoHUzPWQqOCgCpCQwkDd6aVbwMn4yKMU3DwFsYYk6P1YtJ9xMqJWY9ZeuDbM6aaEcZVX8uCiHtT5IK0s5o+z3/++RsNVY8LI9y598NCZRpwZBX97Q6Ly/m4YpSIUPxyPGmjzMyGRQ24I7fN2U1+7qg9SYq9JP1NxhNSy/llXxaeZhpgxq4hFLQ89ZPvi8sJLNyqvNzjQZ3kwniOUOqhN66BOHK1YLag9zpXwKhIX99HHkAy3T5GDrcwBjSU34bjx1amJYjao/9xaj0nQjd9ivMv+rDaOYcUVT66ghO5mwRiF/BvgkmYDzJkOIIPPlC8hz3kRXPt7TVU6zubxoRqQ7oFE76HVIFJimw+5qeA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(136003)(39840400004)(376002)(107886003)(52536014)(5660300002)(83380400001)(38070700005)(6506007)(86362001)(33656002)(53546011)(44832011)(8676002)(8936002)(966005)(26005)(66946007)(122000001)(55016003)(71200400001)(316002)(186003)(66446008)(76116006)(2906002)(66476007)(66556008)(508600001)(64756008)(4326008)(7696005)(110136005)(9686003)(38100700002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3lqazl6UkFycjVuck56bDQwRCtjMENlMXpCOWduVTdhdUlENG5JM0FxT00z?=
 =?utf-8?B?QUNFbjJyUmQ3SUdjMmhVMjlhdFYvSXRiWWovQ3pNaEI0OEI2MTZrVCtHUUx0?=
 =?utf-8?B?U1ZYSDFFbFNmbU9HQXZyM1VIUnp2SnBsYnlNaVhrUlVIZlE4b2hHWFNFYXJs?=
 =?utf-8?B?b09VSm5wQThuUG82S1plaDFmTUhWMDZUL0xkZTR3dTlDOTRwWUdVVzRUMkgw?=
 =?utf-8?B?SXZ2b3B1dUtraWdKMmEycDJQck9VYkdtUWxTVGJzcG44c2NSb09rK1orVHdp?=
 =?utf-8?B?SnM1WEJnQzVuRWNoT1RtZ1gxR1pXMjVhdjJuOU1zSHk0ZjdsYWZ5UmlsckZU?=
 =?utf-8?B?dXBFTk93aVFDUENLM1h0MHhndllSNC80R2NxcDB4M2l0N0ZtbGZSS3dObEpU?=
 =?utf-8?B?MHF6YTBhaFBuLyt6VlZqbGM4am5NeUN3VEF4Ny8yREc4NFBvaXo2OFd3dGl6?=
 =?utf-8?B?QjNuNmlDcHBsZWFOSTB0TU9DNEdkOWQ4aXFkTCtmbGVkSWY3ODlCWC9qRVAw?=
 =?utf-8?B?NngzQ3NwKzdDV255WGFld015S2k4UFM0eTlsUjBKbGJadSsxTmhHRXcwQ0s1?=
 =?utf-8?B?b0tScVhPUFp2Nnh0Z2lmWG5kY3BkLy9sWXkzNHVuWWdnU0hFMzY5dUNtVDRk?=
 =?utf-8?B?ZUhXMkFNNEJ6bGp0Y2dPbmNINUxRbnlyNUtwTWF0OWFuVlRKU2ZBdElQMGVW?=
 =?utf-8?B?d0NkcWxBWE0vMnBYNWNnZktCZzZuR2pPdWJqVDJSK1FKWUJaclFYRktFRXVL?=
 =?utf-8?B?VkhOYXZkb3NtOEhFNDNQeHdZcmY4UTZLR0lsZDIwY1ZiYXFpZmRNeFl5OWI5?=
 =?utf-8?B?MkNJVnVrTlF1N2FWZ3JBZVl3Wmd5V2NHVVQ5ZDhJazlFM1lEVk1VcUVlSjEv?=
 =?utf-8?B?dExxZEt5TGxyTnlHK3FlcmsrV055UzJ6NVJHUEl1VmtrV2xlUTNKR09kcVN2?=
 =?utf-8?B?andwRTRmandpR0RrQWJTSnFMWHhvMUQyOGFpeWJuQXJFTCtBampnRnQ1SXRX?=
 =?utf-8?B?STAwYnBQYXk0UUtNQjhhSzYrOURJcGEyV0h1RXgreStycUovaFZnaTJkT1Ny?=
 =?utf-8?B?aUUwcHBCUTJPWlE3eVFWUTRLRTBTcjdlajU4STArREo5Si9wRmYzZm8yTGNr?=
 =?utf-8?B?SHNWRTZqYVphZHFycGJ5b3paM2k4MVNKZ25hNUdHTDRhVGJSU1RYaFVUY0RT?=
 =?utf-8?B?Znp0K3ZFRUNhTXgzTGNUbFZJd09LcEZDdjAvcFFudmFkVmVabktmYXZ4UE1N?=
 =?utf-8?B?S3dtL05mYTNGK0Q3QUh2TWpiRFZha0h1cW5VS080eW5qbkpvNHNvYk14ZnU1?=
 =?utf-8?B?VHRYc1F1SGFDczl5KzhLeU94dWtJczNnQVU3ZjVyM0dOc1MzYXVoanVGaEFU?=
 =?utf-8?B?YUkxeFJBRzIwNmk4ZHlWSGhlTUxoNDBzd1NaR2Fmb0I0Ull0R3lzR0xnMHU2?=
 =?utf-8?B?Z05RbVZXcC9ld29NRzlTMUhjTXZ1cVk4anI4dGNQL0QwcEpRcDk5NVFxbzRG?=
 =?utf-8?B?TkpDWG8zOStRRHcrK3VMNmlOZm02ekMwK2hCaFk0QWR5Ync5RUdTbk96T0J1?=
 =?utf-8?B?MHM4M0xsY1ZIK0xlSlpBQVNUa1JaUVhVTUpYODJ6ZGs5SytoWkZHOHRBbnRM?=
 =?utf-8?B?MGFVZ0kxUW5VU253RHRtanZUWWk5d0NJMmFmQ1gwY3ZYNHdrNEpDWlpFTGdP?=
 =?utf-8?B?K1o1b2JQdDJMRWszcmI1dkRDTitsSXFjbWZNUFBMdFFpcHJuR2VTTDZwYlpH?=
 =?utf-8?B?aWwyU1pQaGRYM0g5a1N4ZlVRdGtVZExKcUxYQllLdXdPbXdjWWVDTWY0RWJn?=
 =?utf-8?B?eUJTR2g2NTQ3aTEyaEF5K3pBb2x5dEFDT3VhRU9SNWNoTGU0b1hwTXcvMXJ6?=
 =?utf-8?B?ODMrWEdORVRubEx3cU9DblVSTkVtQjdBVjIxY29PeDE5czlaYzRidFhnZWlO?=
 =?utf-8?B?UDN4MmxpTEs4K1M2UU5tbXZUbWEyRGphNzR1dVcrYVY5QTgrekVCSlVwV1F3?=
 =?utf-8?B?ZGdiK2oyUTBpZlZ5dkhGam83Tm5jNmFseUtuYjd1VDVXTzJON3dHZnJvaVpn?=
 =?utf-8?B?UVlUTnVjYXdtYmtJT3JzSWVCVVltb0ZFUVBPNnJ4eThtVGROZ1RiREoxK1Jq?=
 =?utf-8?B?bkdydWVlSHp6TTViMzdzMXNZbGFCcnlnUXdxMmdMTUJFNVlEUVZwMmMxbHho?=
 =?utf-8?B?ejBTOE5rNmtaWUJOMmtkbjQ0a0hRZHZFUk03YmZDbjNQVDZQUFk2dUloSXlU?=
 =?utf-8?B?RmN6TkNjUGxtbGVGUlhJdTNKbm53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b48b266-0fb5-42bb-2df6-08d9b96f62ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 10:50:30.1230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VswXPmrQRZ19l/VNGvzI15Gw5zGAYmhAlBu1Z0NLwuQ27/AF3Rdqw7dYVwtGPe3i/Pj6Sm8IBR3Zooea5lSz/3Afgp2yFl673MWNoX7tVQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0830

SGksIEJvYi4NCg0KT24gMDQvMTIvMjAyMSAwMzowMywgUmViZXJ0IEJlY2tldHQgd3JvdGU6DQo+
IE9uIDI2LzExLzIwMjEgMDk6MzAsIE5hcyBDaHVuZyB3cm90ZToNCj4gPiBBZGQgZmlybXdhcmUg
Zm9yIHdhdmU1MjFjIGNvbWJpbmVkIGRlY29kZXIgYW5kIGVuY29kZXIgSVAuDQo+ID4NCj4gPiBG
VyB2ZXJzaW9uIDogMS4wLjANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hcyBDaHVuZyA8bmFz
LmNodW5nQGNoaXBzbm1lZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgIExJQ0VOQ0UuY25tICAgICAg
ICAgICAgICAgfCAgMjMgKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIFdIRU5DRSAgICAg
ICAgICAgICAgICAgICAgfCAgIDggKysrKysrKysNCj4gPiAgIGNubS93YXZlNTIxY19jb2RlY19m
dy5iaW4gfCBCaW4gMCAtPiA5OTg3MjAgYnl0ZXMNCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IExJQ0VOQ0UuY25tDQo+ID4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgY25tL3dhdmU1MjFjX2NvZGVjX2Z3LmJpbg0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL0xJQ0VOQ0UuY25tIGIvTElDRU5DRS5jbm0gbmV3IGZpbGUgbW9kZSAxMDA2
NDQgaW5kZXgNCj4gPiAwMDAwMDAwLi40OGQyM2VhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsr
KyBiL0xJQ0VOQ0UuY25tDQo+ID4gQEAgLTAsMCArMSwyMyBAQA0KPiA+ICtDb3B5cmlnaHQgKEMp
IDIwMjEgQ2hpcHMmTWVkaWEsIEluYy4NCj4gPiArQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4gPiAr
DQo+ID4gK1JlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gYmluYXJ5IGZvcm0gaXMgcGVybWl0dGVk
IHByb3ZpZGVkIHRoYXQgdGhlDQo+ID4gK2ZvbGxvd2luZyBjb25kaXRpb25zIGFyZSBtZXQ6DQo+
ID4gKw0KPiA+ICsxLiBSZWRpc3RyaWJ1dGlvbnMgbXVzdCByZXByb2R1Y2UgdGhlIGFib3ZlIGNv
cHlyaWdodCBub3RpY2UsIHRoaXMNCj4gPiArbGlzdCBvZiBjb25kaXRpb25zIGFuZCB0aGUgZm9s
bG93aW5nIGRpc2NsYWltZXIgaW4gdGhlIGRvY3VtZW50YXRpb24NCj4gPiArYW5kL29yIG90aGVy
IG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRoZSBkaXN0cmlidXRpb24uDQo+ID4gKw0KPiA+ICsy
LiBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIHNoYWxsIGJlIHVzZWQgb25seSB3aXRoIFRleGFzIElu
c3RydW1lbnRzDQo+ID4gK0luY29ycG9yYXRlZHMgc2lsaWNvbiBwcm9kdWN0cy4gQW55IG90aGVy
IHVzZSwgcmVwcm9kdWN0aW9uLA0KPiA+ICttb2RpZmljYXRpb24sIHRyYW5zbGF0aW9uLCBvciBj
b21waWxhdGlvbiBvZiB0aGUgU29mdHdhcmUgaXMgcHJvaGliaXRlZC4NCj4gDQo+IElzIHRoaXMg
ZncgVEkgc3BlY2lmaWMgaW4gYW55IHdheT8NCj4gSWYgc28sIHRoZSBmaWxlIG5hbWUgc2hvdWxk
IHJlZmxlY3QgdGhhdC4NCj4gSWYgbm90LCBjbGF1c2UgMiBzZWVtcyBvdmVybHkgcmVzdHJpY3Rp
dmUuIE1hYXliZSBzb21ldGhpbmcgbGlrZSAiLi4uDQo+IHNoYWwgYmUgdXNlZCBvbmx5IHdpdGgg
cHJvZHVjdHMgY29udGFpbmluZyBDJk0gV2F2ZTUgQ29kZWMgSVAgLi4uIiB3b3VsZCBiZQ0KPiBi
ZXR0ZXI/DQoNClllcywgdGhpcyBmdyBvbmx5IGNhbiBiZSB3b3JrZWQgd2l0aCB0aGUgc3BlY2lm
aWMgZGV2aWNlLg0KSSB3aWxsIGNoYW5nZSB0aGUgZncgZmlsZSBuYW1lIGxpa2UgYmVsb3cuDQot
IHdhdmU1MjFjX2o3MjFzMl9mdy5iaW4NCg0KPiA+ICsNCj4gPiArMy4gTm8gcmV2ZXJzZSBlbmdp
bmVlcmluZywgZGVjb21waWxhdGlvbiwgb3IgZGlzYXNzZW1ibHkgaXMgcGVybWl0dGVkLg0KPiA+
ICsNCj4gPiArVE8gVEhFIE1BWElNVU0gRVhURU5UIFBFUk1JVFRFRCBCWSBBUFBMSUNBQkxFIExB
VywgVEhJUyBTT0ZUV0FSRSBJUw0KPiA+ICtQUk9WSURFRCAiQVMgSVMiIFdJVEhPVVQgV0FSUkFO
VFkgT0YgQU5ZIEtJTkQsIElOQ0xVRElORywgV0lUSE9VVA0KPiA+ICtMSU1JVEFUSU9OLCBBTlkg
RVhQUkVTUyBPUiBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLA0KPiA+ICtB
Q0NVUkFDWSwgRklUTkVTUyBPUiBTVUZGSUNJRU5DWSBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Us
DQo+ID4gK1NBVElTRkFDVE9SWSBRVUFMSVRZLCBDT1JSRVNQT05ERU5DRSBXSVRIIERFU0NSSVBU
SU9OLCBRVUlFVCBFTkpPWU1FTlQNCj4gT1IgTk9OLUlORlJJTkdFTUVOVCBPRiBUSElSRCBQQVJU
WSBJTlRFTExFQ1RVQUwgUFJPUEVSVFkgUklHSFRTLg0KPiA+ICtDSElQUyZNRURJQSwgSU5DLiwg
SVRTIEFGRklMSUFURVMgQU5EIFRIRUlSIFNVUFBMSUVSUyBESVNDTEFJTSBBTlkNCj4gPiArV0FS
UkFOVFkgVEhBVCBUSEUgREVMSVZFUkFCTEVTIFdJTEwgT1BFUkFURSBXSVRIT1VUIElOVEVSUlVQ
VElPTiBPUiBCRQ0KPiBFUlJPUi1GUkVFLg0KPiA+IGRpZmYgLS1naXQgYS9XSEVOQ0UgYi9XSEVO
Q0UNCj4gPiBpbmRleCA2MTcyYjlmLi4zYmY5ODQ4IDEwMDY0NA0KPiA+IC0tLSBhL1dIRU5DRQ0K
PiA+ICsrKyBiL1dIRU5DRQ0KPiA+IEBAIC01NzE4LDMgKzU3MTgsMTEgQEAgVmVyc2lvbjogMy4x
Mi4xDQo+ID4NCj4gPiAgIExpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIHNpbGFicy9MSUNF
TkNFLndmMjAwIGZvciBkZXRhaWxzLg0KPiA+ICAgT3JpZ2luYXRlcyBmcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9TaWxpY29uTGFicy93ZngtZmlybXdhcmUNCj4gPiArDQo+ID4gKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICstLS0tLQ0KPiA+ICsNCj4gPiArRHJpdmVyOiB2cHUgLSBDaGlwcyZNZWRpYSwgSW5j
LiB2aWRlbyBjb2RlYyBkcml2ZXINCj4gDQo+IERyaXZlciBuYW1lIHNob3VsZCByZWZsZWN0IHRo
ZSBrZXJuZWwgZHJpdmVyIG5hbWUgIndhdmU1Ig0KDQpPa2F5LCBJIHdpbGwgY2hhbmdlIGl0IHRv
ICJ3YXZlNSIuDQoNCj4gPiArDQo+ID4gK0ZpbGU6IGNubS93YXZlNTIxY19jb2RlY19mdy5iaW4N
Cj4gPiArDQo+ID4gK0xpY2VuY2U6IFJlZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UuY25tIGZv
ciBkZXRhaWxzLg0KPiA+IGRpZmYgLS1naXQgYS9jbm0vd2F2ZTUyMWNfY29kZWNfZncuYmluIGIv
Y25tL3dhdmU1MjFjX2NvZGVjX2Z3LmJpbiBuZXcNCj4gPiBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4
DQo+ID4gMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uYWQ2NzEwYmJh
NGZhOThkODE1ZWRiZTljZTgwYw0KPiA+IGJlOWMxZjE5ZDY5OA0KPiA+IEdJVCBiaW5hcnkgcGF0
Y2gNCj4gPiBsaXRlcmFsIDk5ODcyMA0KPiA8c25pcD4NCg0KVGhhbmtzIQ0K
