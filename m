Return-Path: <SRS0=QS6/=AZ=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF27FC433DF
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Jul 2020 16:30:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id AD2CB22464; Tue, 14 Jul 2020 16:30:51 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E1F2242B
	for <linux-firmware@kernel.org>; Tue, 14 Jul 2020 16:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E1F2242B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hau@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 06EGUlQA2026549, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
	by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 06EGUlQA2026549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Jul 2020 00:30:47 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 15 Jul 2020 00:30:46 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 15 Jul 2020 00:30:46 +0800
Received: from RTEXMB04.realtek.com.tw ([fe80::941:6388:7d34:5c44]) by
 RTEXMB04.realtek.com.tw ([fe80::941:6388:7d34:5c44%3]) with mapi id
 15.01.1779.005; Wed, 15 Jul 2020 00:30:46 +0800
From: Hau <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>,
        Linux Firmware
	<linux-firmware@kernel.org>,
        nic_swsd <nic_swsd@realtek.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH] rtl_nic: update firmware for RTL8125B
Thread-Topic: [PATCH] rtl_nic: update firmware for RTL8125B
Thread-Index: AQHWWfMUXnupSXfVO06xF89x5MgABKkHQ4iA
Date: Tue, 14 Jul 2020 16:30:46 +0000
Message-ID: <6984bfd1f42242bb852706ef0cb36bc1@realtek.com>
References: <ec13a841-ad71-dbad-6d1c-60470610cdd5@gmail.com>
In-Reply-To: <ec13a841-ad71-dbad-6d1c-60470610cdd5@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.177.157]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiANCj4gUmVhbHRlayBwcm92aWRlZCB1cGRhdGVkIHZlcnNpb25zIG9mIFJUTDgxMjVCIHJldi5h
IGFuZCByZXYuYiBmaXJtd2FyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2Vp
dCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+DQoNClNpZ25lZC1vZmYtYnk6IENodW5oYW8gTGluIDxo
YXVAcmVhbHRlay5jb20+DQoNCj4gLS0tDQo+ICBXSEVOQ0UgICAgICAgICAgICAgICAgfCAgIDQg
KystLQ0KPiAgcnRsX25pYy9ydGw4MTI1Yi0xLmZ3IHwgQmluIDk5NTIgLT4gMTAxMjggYnl0ZXMg
IHJ0bF9uaWMvcnRsODEyNWItMi5mdyB8IEJpbg0KPiAzMjY0IC0+IDMzMjggYnl0ZXMNCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL1dIRU5DRSBiL1dIRU5DRQ0KPiBpbmRleCA3NWQzZDVlLi4xYTMzMjRkIDEwMDY0
NA0KPiAtLS0gYS9XSEVOQ0UNCj4gKysrIGIvV0hFTkNFDQo+IEBAIC0zMDY2LDEwICszMDY2LDEw
IEBAIEZpbGU6IHJ0bF9uaWMvcnRsODEyNWEtMy5mdw0KPiAgVmVyc2lvbjogMC4wLjENCj4gDQo+
ICBGaWxlOiBydGxfbmljL3J0bDgxMjViLTEuZncNCj4gLVZlcnNpb246IDAuMC4xDQo+ICtWZXJz
aW9uOiAwLjAuMg0KPiANCj4gIEZpbGU6IHJ0bF9uaWMvcnRsODEyNWItMi5mdw0KPiAtVmVyc2lv
bjogMC4wLjENCj4gK1ZlcnNpb246IDAuMC4yDQo+IA0KPiAgTGljZW5jZToNCj4gICAqIENvcHly
aWdodCDCqSAyMDExLTIwMTMsIFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3Jwb3JhdGlvbiBkaWZm
IC0tZ2l0DQo+IGEvcnRsX25pYy9ydGw4MTI1Yi0xLmZ3IGIvcnRsX25pYy9ydGw4MTI1Yi0xLmZ3
IGluZGV4DQo+IDU3N2UxYmI2MWViOTVkY2VhN2FiOTFkM2MyMGI0YjZjMmFkYmUzYzEuLjkwMTkx
YWI5YzlmNmViNDE0NGM2OGQ4DQo+IGJlNzExYjdjNjAxYjRkNjM3IDEwMDY0NCBHSVQgYmluYXJ5
IHBhdGNoIGRlbHRhIDI1Ng0KPiB6Y21hRmhKSGNPPDBTSm1wYXg0c3VPcHxtQzt8PXItXm8kZT8l
PUhhVF5vPE5hbDBaLVojNzgrOTctDQo+IFQydm5zNkFKDQo+IHpUQTcreTg1dkI+JSZ6fnpFI0pU
fUxBYiR6MlNfc3JHQkJfKDJtdDg9QW9sOz8zPEBDajRXSnFVMGJ3OChYfUENCj4gSlgNCj4geiZt
YXohNjk9ampYSkZzfT1AQ0VoMXVRNGJAYyVuVnBEPDhQbjFPKkVCcXd+SjJgbmM3OygqWUIxfjh2
TnYNCj4gVmY2Kw0KPiBzO1E+Z0BmcV9CNmZxYGozM0lvRmcxX29BeGphT0xJNmt4akV7fEF7VWFL
TTJKV0lGLT8wSHZmY3ReZmM0DQo+IA0KPiBkZWx0YSA3OQ0KPiB6Y21iUT58Ry16NTBTSm1wYXg0
c3VPcHxtQzt8PXItXmI4ZFklPThVU15eRldibDBaLQ0KPiBaI0lyZFc3fU9gfm5zNjh5DQo+IGFU
YllfIW5PSUVCJS0pPkMkZkN5S3okTT1SUVV3NV4jdCllUQ0KPiANCj4gZGlmZiAtLWdpdCBhL3J0
bF9uaWMvcnRsODEyNWItMi5mdyBiL3J0bF9uaWMvcnRsODEyNWItMi5mdyBpbmRleA0KPiA0NWIw
NDQzNDI2M2Q2ZDY5YThlNzBlMjdjY2Y0ODQzYmQ1ZjkzOWE0Li5kYzc1M2I1ODdjMzhiMDQ0Nzgy
MTNlOA0KPiAzYjVkNzIzODA5MjQ4YWIxMSAxMDA2NDQgR0lUIGJpbmFyeSBwYXRjaCBkZWx0YSAx
NTcNCj4gemNtWD5nKiZ3Q00wMGMhUElUblVTcmIpVStAZGtQWmRQV0tjPUs2LQ0KPiBsYGJHdklO
Z3laeVZnK1VmMkF6cXpDTEQkcQ0KPiB6UnQ4Ml5oSzN0Nm5WQWZseGFBdWQ3ekJWMmoxRHdfYDN3
YiYzPTl1SUxKbU5VNGgmMlNRV3pLfUZmZ3poWXwNCj4gZGVGDQo+IFc7OEtDPGRqRnE2MGpUUEww
fmcyP1F+Jl4rYlEjJEkNCj4gDQo+IGRlbHRhIDkyDQo+IHpjbVpwV0l2fWFiMDBjIVBJVG5VU3Ji
KVUrQGRrUFpkV0glSFg4TU12YGJHdklOZ3laeVZnWTZiaFYrVEwNCj4gQ0xCaF8NCj4gY1I7RmZG
cmp7RXNuVkJ9dlZSR09TYXAwMH4wNFlOVDA0OTE0JHA4UVYNCj4gDQo+IC0tDQo+IDIuMjcuMA0K
PiANCj4gDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHBy
aW50aW5nIHRoaXMgZS1tYWlsLg0K
