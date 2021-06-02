Return-Path: <SRS0=VKJg=K4=infinera.com=Joakim.Tjernlund@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60EBC4708F
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Jun 2021 15:36:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BE713613D2; Wed,  2 Jun 2021 15:36:01 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D5A613BF
	for <linux-firmware@kernel.org>; Wed,  2 Jun 2021 15:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D5A613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Joakim.Tjernlund@infinera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcvA+JivX995zKHObC2w7zo4C0Qh9XRMVbDk84Qxm81f/Tk/EqOVJeVIxSCq5RbO9MsNiuMqd0KMKqiUMiD0PgsqeDvFlwM6doPFPUIk7MNwTSikThpGdS/qNJraNpYnS4gKDmNYRkwariFU5CiZSGMbcS/Bs7anaY3ix/yaWQPiNwfQ5k7yYtXBoRH51M+CbvQsRYR22sIRnU1pLkH5YCis6X3+vy9hJJBG5L+bu8j16sq5X96q2Rn7l+Joqi+4tOGjziUSiUrDXtYqGpf01hK3UDMseW5FjY/VxswnECfLkbR5J3YE/jVxdjA/iyR7YK0eYz0x8+RSqYALyADp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTf2RfxiyBicRr1CxAPqv0aV0N5OCNMGmXHPSL9BXfU=;
 b=VK4VsXqAO6iAr4G7ow8j2BPkRSReqbSyUCgkfGOVk/5FJW86j71nLI07Caidh9hjF5PAwYYiHS3Umc9wxDjtkX1zLOidXePzhNuY1yauVnzxFfcYGLLeDBdCy6w8jxpaioRrMWxJSxxAlDk4hcMcu1Nmls971jIgttl/mweVZfCIpgIDmusT9b863JLIr5xyMLCuOHOG9YiArK/6tL2EJSw8Ayw4F3MjN1z2ulFIQ5P/9kDDKwGpZT9CdKQnDEhfXJQLS84Wszxm4HZsMqDdCPOY0q18RBOcU8NZQl1tIQt8tXbWc3GiRoh72HcENtmjyP/DfDZ6ZGXM/r2Li2+naw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTf2RfxiyBicRr1CxAPqv0aV0N5OCNMGmXHPSL9BXfU=;
 b=XpO3BSQ650l0dheO0/1JNa3MW8vWGUS03N48ol8TcMfBxx8S/ehbqDKuZMLV17JMliU1w69SVRs3ihUmxBJmPLfbDTXNm/27xAxesWnBNXl6PVU4orpt3TvzFDPnGeW7JxwfLVP2d6miWGQk4LIwN3qYbUW9S5p6mNkdHX/0OTw=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB4487.namprd10.prod.outlook.com (2603:10b6:510:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 15:36:00 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::5021:f762:e76f:d567%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 15:36:00 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: Re: [PATCH v2 1/2] rtl_bt: Add rtl8761b firmware
Thread-Topic: [PATCH v2 1/2] rtl_bt: Add rtl8761b firmware
Thread-Index: AQHXVImmVCXG0vzceE+LePAwYONh26sA4OWA
Date: Wed, 2 Jun 2021 15:35:59 +0000
Message-ID: <7cc65112118eb90ba3cfee772ce546318d8a513e.camel@infinera.com>
References: <20210529125334.32258-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20210529125334.32258-1-joakim.tjernlund@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.40.0 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1939fca6-7bf0-40fc-d29e-08d925dc1f98
x-ms-traffictypediagnostic: PH0PR10MB4487:
x-microsoft-antispam-prvs:
 <PH0PR10MB4487CD943B957F70DBA5A613F43D9@PH0PR10MB4487.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NRQw5tYFmzQWtQ6Us7eAnnbBLbQPGkXBKFoIeYLx6kJ8fS5pilFRMDMIcA60dFq+nXXaAaajebB6k18SXSV2Ix+6mkgAVhdk2NYKC/23oNjAIv2u35txKvPPyGmT0w6IkySj1Qvw7M3vsD9YJ1+qgKwFdwMgK6xzDMKgjZLyNpthunXDK+J2aak6k6JHTyFsgOw9kwq3BXHLQ0PsRhgzQK8oTDtmwqrTDQKYpC2N1+gQEpyB2cjNdhZbtNq7k/KLNu3ZsMY/tDe72mxjhWbCwOBhoxfaILUK7tBrZtg6sfM/rntfugnmMq3A/G3Ee97IOBiLtuwpxOh6PoRc9nB2wyse1q83QdmiPnLQdWzMnq/W8GvTKSLIMNcgt7RBwwuOYHbdCRmoSsd4AOGt7gV2TepWsOfMJHcnkKxPvCPYMhtCuslmJLrfyXrrOnx3ddyJeoE8bvbTPhz/yunILGsSITvqF8PqsgPudHLF0JE+LtUtV0hiH5WWLCIE1JS75ZSAIU+R9mMshjqIIDxlREq1br0zHmESI3wTvOWLKXWBXczpoq5AzUtV87R6U9q3npzVF9NzAkKAOjep4AlQ//DXdGeA5THg8b82U9tolUj6tBE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(83380400001)(186003)(26005)(122000001)(64756008)(36756003)(8676002)(71200400001)(2906002)(478600001)(8936002)(66476007)(38100700002)(86362001)(316002)(5660300002)(66946007)(6512007)(91956017)(66446008)(76116006)(6506007)(6916009)(2616005)(66556008)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SDUyZ29Xc0NjYjA2dlNicUlHeWREak5PS1ZTUCtSOU1jTzlyS1EzYjRPQnE5?=
 =?utf-8?B?ZFNlN2JhcU1JczdtdmNYd2ExZWQ5bUFMZmtlbE5naUZiTC92Mmp3TVhBaWhC?=
 =?utf-8?B?YWZPNHZhSEhYbmlnTE5DWElqc3BYTGlRRGkxc2ZTZCthVWJWVEF5N3RKbVB4?=
 =?utf-8?B?aGVmaTMzT3BOamFQbnZ6OTErRHlheS81WVY1RnNCZ1ZnZXduVkJwZzNEc2Qw?=
 =?utf-8?B?N0lqRVJER2tDUDl0MHVUaUFqY1hsL0RabTJCRGVJVTlEOXMzYytjVlgxM052?=
 =?utf-8?B?T2JteTMzUFh6WnIzb1lqTWEvb25UR09XcUdWOGZqSDlZM3ZUSjVERmVhRStn?=
 =?utf-8?B?OXJGTkFZaCtUU3lFYjh2Vm53TCt2ako0RFNZRUNWMkV1clBScFMvLzlxdnI4?=
 =?utf-8?B?N0tRbzVsWlBQYVM1M0JaNm9WWW9OSERVQ3dycFBiRk8yWVR3cDYwUHAweEsz?=
 =?utf-8?B?NnpEb1J2MEN5d0lYQmtta2U1c3I0bUVFOTcrQy90ZHJydEI1b1c5RCtERUs0?=
 =?utf-8?B?Z1RHVUJOWG13QWNTY1hjanlza3dRUXpNOGxpUlo1b0g3dS9DbFNHdE5yL0xm?=
 =?utf-8?B?MDFkd090UmNBaGoxVCs1cUR4ejA5MnFqM1RzRUpxSHlXT1pwZS9zRndXSzZW?=
 =?utf-8?B?YnFrU2hudytUNlhrL0ZnV2pzOEhFczNDalVNOFJqVExQaTd4dm1Lekl1T09j?=
 =?utf-8?B?bFcxbWtScUp4bElxVlZ4R1RjR2ZYd09kZm13RjhQWXZwRjhLU0lrUFlMMi9o?=
 =?utf-8?B?WHQ3YythaDhHVk96cFUva0xYY1cyZFhuTERLZU9sNlBKYlZEUXBhN2pqNUFT?=
 =?utf-8?B?cHhQTEVoeDBaOWhIL2I1aDh6S3A0WmlYOEQxaFJad3pyV2ptc2xXL1FXQU9p?=
 =?utf-8?B?ZnZDNEpldkVZNDA3UEZBZ2dvYzA2NlBTL2NZakd6eXZ4dG40L25WNDZtdGlP?=
 =?utf-8?B?SDhDZ1o1YUw4cXROdi9kZUlSOFZEK3RsZlhqUW00YXBrTEd6b0dsRUZaSnRo?=
 =?utf-8?B?Ykd6TVhLMVhZSzlhTWhWRkY1dGloaG41VjRqM2pWckIvNnZTcVo2bCtUTzIw?=
 =?utf-8?B?STNaby9IdUloUnR5bnpyNEtDOUkvSVNzTmVNd2dRaFpWZERuczNiTkJOVU9l?=
 =?utf-8?B?NzRCVm92Q0VRVUhBa0dsdWY4YU4wSTVlTE1mcmQyTk5SN0U2ZHVxWmd2YWpR?=
 =?utf-8?B?dURCU1UxQjhUam0rbllJdThvTGtrbm5rK0paY3RVKy83MTdwSk90WUVLUkY4?=
 =?utf-8?B?WkJOR2Y3OTdKR0JaMVR0eDFjY2l0ay9qMkxIdkNtaVBmTWNvdFRoYyt1Nlpz?=
 =?utf-8?B?YmxpY0Fhbnh6Sk94Vms3Qkxkc1JYU0diNmREejRoaGptMWVMNk1hbWVlYll5?=
 =?utf-8?B?Yk9SYm5jUDVtdEpIZFJ3enVFY0xvOUNVa3NnVnJzd1FBYnRBNEtJcHhlYzYx?=
 =?utf-8?B?Z2x6djVGdnM4Z2UvNWtWZmUwNkFmSStvNVVMc2dta0JPcE1sVUJxTXprQnpY?=
 =?utf-8?B?c1RWaGVSNDg0MlU2Y3pYSlBzSDluNFk0b0FEc0RaMnJRSm1wbkQ3YjErbFc2?=
 =?utf-8?B?cHl4TS9ubWt2Vk44d2JSbUFzL1JuUUppVlRSWmlyQ0k5SzVhZXFQWXZMREFK?=
 =?utf-8?B?d2pqU3hNWGY0ajZKQnBpT2dNNjNsNHVQckxTd1FhRmduc1lmOVlTWUpTMFE0?=
 =?utf-8?B?bVVuWEx4OWVXTlprVXB3MnJxYTJ0Z0lGNjhpZTNKbENoaS96NG04Q0NCVFVs?=
 =?utf-8?Q?7Fvruhd8pBUvVk1O/zF6HhMQW9BVKuDXrERTec+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3174EC5B120BEB41A8B346CEEE371E70@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1939fca6-7bf0-40fc-d29e-08d925dc1f98
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 15:36:00.1363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rjdD+bvLC42M9KvVoRFbBPvzfaejq6AYQ0W+tuFm9nGFm/FRSiE3Kr3LBnrtiOEMm77lFtdpbawVrEvz1S+Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4487

T24gU2F0LCAyMDIxLTA1LTI5IGF0IDE0OjUzICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBGcm9tOiBKb2FraW0gVGplcm5sdW5kIDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNv
bT4NCj4gDQo+IEZyb20gUmVhbHRlayAyMDIwMDgwNl9MSU5VWF9CVF9EUklWRVJfUlRMODc2MUJf
Q09FWF92MDIwMg0KPiBkcml2ZXIgcGFja2FnZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9ha2lt
IFRqZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+IC0tLQ0KPiANCj4g
wqAtdjI6IEFkZCBXSEVOQ0UgZW50cmlyZXMNCj4gDQo+IMKgV0hFTkNFICAgICAgICAgICAgICAg
ICAgICAgfCAgIDUgKysrKysNCj4gwqBydGxfYnQvcnRsODc2MWJfY29uZmlnLmJpbiB8IEJpbiAw
IC0+IDI1IGJ5dGVzDQo+IMKgcnRsX2J0L3J0bDg3NjFiX2Z3LmJpbiAgICAgfCBCaW4gMCAtPiAz
NTY0NCBieXRlcw0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHJ0bF9idC9ydGw4NzYxYl9jb25maWcuYmluDQo+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHJ0bF9idC9ydGw4NzYxYl9mdy5iaW4NCj4gDQo+IGRpZmYgLS1naXQgYS9XSEVO
Q0UgYi9XSEVOQ0UNCj4gaW5kZXggYjZlNTczYS4uZDY3NzNkYSAxMDA2NDQNCj4gLS0tIGEvV0hF
TkNFDQo+ICsrKyBiL1dIRU5DRQ0KPiBAQCAtMzc2MCw2ICszNzYwLDggQEAgRmlsZTogcnRsX2J0
L3J0bDg3MjNic19mdy5iaW4NCj4gwqBGaWxlOiBydGxfYnQvcnRsODcyM2JzX2NvbmZpZy1PQkRB
ODcyMy5iaW4NCj4gwqBMaW5rOiBydGxfYnQvcnRsODcyM2JzX2NvbmZpZy1PQkRBMDYyMy5iaW4g
LT4gcnRsODcyM2JzX2NvbmZpZy1PQkRBODcyMy5iaW4NCj4gwqBGaWxlOiBydGxfYnQvcnRsODc2
MWFfZncuYmluDQo+ICtGaWxlOiBydGxfYnQvcnRsODc2MWJfZncuYmluDQo+ICtGaWxlOiBydGxf
YnQvcnRsODc2MWJfY29uZmlnLmJpbg0KPiDCoEZpbGU6IHJ0bF9idC9ydGw4ODEyYWVfZncuYmlu
DQo+IMKgRmlsZTogcnRsX2J0L3J0bDg4MjFhX2Z3LmJpbg0KPiDCoExpbms6IHJ0bF9idC9ydGw4
ODIxYV9jb25maWcuYmluIC0+IHJ0bDg4MjFjX2NvbmZpZy5iaW4NCj4gQEAgLTM3ODksNiArMzc5
MSw5IEBAIEZpbGUgcnRsX2J0L3J0bDg4MjJjdV9mdy5iaW4gY2FtZSBkaXJlY3RseSBmcm9tIFJl
YWx0ZWsuDQo+IMKgdXBkYXRlZCBvbiBPY3RvYmVyIDIzLCAyMDE5DQo+IMKgRmlsZSBydGxfYnQv
cnRsODgyMmN1X2NvbmZpZy5iaW4gY2FtZSBkaXJlY3RseSBmcm9tIFJlYWx0ZWsuDQo+IMKgDQo+
IA0KPiANCj4gDQo+ICtGb3VuZCBpbiB2ZW5kb3IgZHJpdmVyLCAyMDIwMDgwNl9MSU5VWF9CVF9E
UklWRVJfUlRMODc2MUJfQ09FWF92MDIwMi56aXANCj4gK0ZpbGUgcnRsX2J0L3J0bDg3NjFiX2Z3
LmJpbg0KPiArRmlsZSBydGxfYnQvcnRsODc2MWJfY29uZmlnLmJpbg0KPiDCoC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+IMKgDQo+IA0KPiANCj4gDQo+IMKgRHJpdmVyOiBidG10a191c2IgLSBCbHVldG9v
dGggVVNCIGRyaXZlcg0KPiBkaWZmIC0tZ2l0IGEvcnRsX2J0L3J0bDg3NjFiX2NvbmZpZy5iaW4g
Yi9ydGxfYnQvcnRsODc2MWJfY29uZmlnLmJpbg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi45OTQ3NWVlM2Jh
ZDk1MDJkY2EzZGQ5MmMzOGI0N2EyMjlhZWNkMzZiDQo+IEdJVCBiaW5hcnkgcGF0Y2gNCg0KR2Vu
dGxlIHBpbmcNCg==
