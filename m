Return-Path: <SRS0=63PM=TM=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6437E7718A
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Dec 2024 13:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C5F4C4CED0; Thu, 19 Dec 2024 13:34:50 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67BF2C4CECE;
	Thu, 19 Dec 2024 13:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67BF2C4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4BJDYg6tA4046901, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1734615282; bh=02hwGklPecSImhUkoXxOT6AR/TZ6WG72U8fx9K99ovw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=EqBmEz1+dQM8cCTDs231jbLSn4xH0QhpfA71VetKleoWEsM9gN9WC2OcAftpdIWpu
	 5GvjNlWaypLkhwgpdGo9o/xtIPTfwdud9zQ2A7LS+zpYE2UMY8ugr4gD5VjSgLksi5
	 KjMYlDDcZX+RNbgFpD19twG4OPWP8iHiWcrrI1uD9f1cDcZb6uUzT8pla2ks/NeC3J
	 zBXx/j9vhEYsDUcZzVJqKwte1xUp7HR58l8Mb79xkeBRyzRYwZRhUaFnyDc3lVOXZL
	 Aqu2aPH6qDelJPjGP3olKGB3Yl0Cuq1GKjQYa5+/2RHId578XeD1DWsem8cKWJeSeI
	 RNprf1prUv5VQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4BJDYg6tA4046901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 21:34:42 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Dec 2024 21:34:42 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 19 Dec 2024 21:34:39 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Thu, 19 Dec 2024 21:34:39 +0800
From: Hau <hau@realtek.com>
To: Josh Boyer <jwboyer@kernel.org>, Hayes Wang <hayeswang@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        nic_swsd
	<nic_swsd@realtek.com>
Subject: RE: [PATCH] rtl_nic: add firmware rtl8125bp-2
Thread-Topic: [PATCH] rtl_nic: add firmware rtl8125bp-2
Thread-Index: AQHbUfLW4Ft5BPHxCU+Rdi76+O8Es7LtA74AgACNjLA=
Date: Thu, 19 Dec 2024 13:34:37 +0000
Message-ID: <fa86de1d099a480baf2106d4760da6f1@realtek.com>
References: <20241219084852.8737-1-hayeswang@realtek.com>
 <CA+5PVA68tj1wkU6zV1G222Wf+XYq6R6+md-xDB=G9C008AGGxg@mail.gmail.com>
In-Reply-To: <CA+5PVA68tj1wkU6zV1G222Wf+XYq6R6+md-xDB=G9C008AGGxg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiBPbiBUaHUsIERlYyAxOSwgMjAyNCBhdCAzOjQ54oCvQU0gSGF5ZXMgV2FuZyA8aGF5ZXN3YW5n
QHJlYWx0ZWsuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IENodW5IYW8gTGluIDxoYXVA
cmVhbHRlay5jb20+DQo+ID4NCj4gPiBUaGlzIGFkZHMgZmlybXdhcmUgcnRsODEyNWJwLTIgZm9y
IHJ0bDgxMjVicCByZXYuYi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5IYW8gTGluIDxo
YXVAcmVhbHRlay5jb20+DQo+ID4gLS0tDQo+ID4gIFdIRU5DRSAgICAgICAgICAgICAgICAgfCAg
IDMgKysrDQo+ID4gIHJ0bF9uaWMvcnRsODEyNWJwLTIuZncgfCBCaW4gMCAtPiA3NTIgYnl0ZXMN
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNzU1IHJ0bF9uaWMvcnRsODEyNWJwLTIuZncNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9XSEVO
Q0UgYi9XSEVOQ0UNCj4gPiBpbmRleCAwNzVjMjc2YS4uOTQxMDk5MGYgMTAwNjQ0DQo+ID4gLS0t
IGEvV0hFTkNFDQo+ID4gKysrIGIvV0hFTkNFDQo+ID4gQEAgLTM1NjIsNiArMzU2Miw5IEBAIFZl
cnNpb246IDAuMC40DQo+ID4gIEZpbGU6IHJ0bF9uaWMvcnRsODEyNmEtMi5mdw0KPiA+ICBWZXJz
aW9uOiAwLjAuMg0KPiA+DQo+ID4gK0ZpbGU6IHJ0bF9uaWMvcnRsODEyNWJwLTIuZncNCj4gPiAr
VmVyc2lvbjogMC4wLjQNCj4gPiArDQo+ID4gIEZpbGU6IHJ0bF9uaWMvcnRsODEyNmEtMy5mdw0K
PiA+ICBWZXJzaW9uOiAwLjAuNQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3J0bF9uaWMvcnRsODEy
NWJwLTIuZncgYi9ydGxfbmljL3J0bDgxMjVicC0yLmZ3IG5ldyBmaWxlDQo+ID4gbW9kZSAxMDA3
NTUNCj4gDQo+IFRoaXMgZmFpbHMgcHJlLWNoZWNrIGJlY2F1c2UgaXQgaGFzIHRoZSBleGVjdXRh
YmxlIGJpdCBzZXQuICBDYW4geW91IHBsZWFzZQ0KPiByZXN1Ym1pdCB3aXRoIHRoZSBmaWxlIG1v
ZGUgYmVpbmcgNjY0Pw0KPiANCj4gam9zaA0KPiANCkkgd2lsbCByZXN1Ym1pdCB0aGUgcGF0Y2gu
IA0KDQpUaGFua3MuDQoNCj4gPiBpbmRleA0KPiA+DQo+IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAuLjI2Zjg5MmQwNTgwNDgwZGFjMTA5OWI1NjU3DQo+IDZlDQo+ID4g
MDA5OWI1Y2NiYzUwDQo+ID4gR0lUIGJpbmFyeSBwYXRjaA0KPiA+IGxpdGVyYWwgNzUyDQo+ID4N
Cj4gemNtWWspWkFnPCo3ez5BMiRDfFIlVHNtWiF4WUlDXnM1eiZ9Nz9PX35WcDFVQEF8bUVxbG9A
SmNHa1lROA0KPiBBfHBhVg0KPiA+DQo+IHpMTCNEQk5KdkNQakY3TXcjRm1WUmg+RDFhaD1ZVmdN
NjVwYXh2UmReMUFxNyhvfTJyOElVKnY3aVAxbzwNCj4gZXxJPigNCj4gPiB6JVlWcXteP0I9NnQt
DQo+IHEhPVB+KSVYUGt3UUJqVFFaeVJFZVFVWiY7MG1BfVRaPFJxQHlmSDVOSWxoRFE9KCQzbHJB
DQo+ID4NCj4gejYlUzJCVmsmWVpJOzh5bVV8az9zPWFZP3BjSUFuZm5JYm50cyN6aGtHOD9scTJQ
PFl5Uj8xd2dqRnF6cnJrSUNTDQo+ID4NCj4genZNU19AWGJ9cyplR1Y8QygrMWt+MjZTaSg0KExM
M1lBZD81NGMqI345Xz5Ke0U9SGVycUY8THtLKVchZyVNDQo+IGpNKA0KPiA+IHppMFRTaDdQO0h1
TDIwZk0/cmF0OFc7S2QpSjIxMHRDemlLK0F0Z1EoPG9xeWBePkFleV8mKSZTTS0NCj4gYmB1TXlS
UGgNCj4gPg0KPiB6a1ZPK2xXZWEhZ01TaVhnRXk7RnhyYUI8JHtWMzF9O1lvSSlDRGpGJD8xcWBA
ZiNtbkhLM0xOSUZyRSVUOXR8U2ENCj4gPiB6OUVNKHhxSV9pLQ0KPiBUUVZfTiZCTChmTXAyWCpy
e2xhb2ZyYUQqWT8oPShrTXNWTXkjRXdiPk5JMzRGclBYREJZUElJDQo+ID4NCj4gemQ9OWclPWVj
VmRZd0gpZFp3QUI3N3g4T3U3UkpnWSRrSnNySTxNZ016Tj8mezxOUzUzSHFHO1ZnWGFhRg0KPiBa
PSVuPA0KPiA+DQo+IHpNYz0wSEs7JGwrcnRpXjxGck02cEpYb1MxYV5HWF9UYyVleWxpfCFOb3Uh
fUEmKj5OUk9acFo0aEpIKUdxdTwNCj4galgNCj4gPg0KPiB6PSNUVSNUR01PdlhMX0NmTFZyY1ck
VHpxKWVUUU1vIUwjYCV7PU9ZcChBWnB2PX5nUihQOCV7IWNKIUpLeGMNCj4gfE4+DQo+ID4gVEY8
WSV9Ukc8V1RkYEJpTnw5IXMhYFZhO1gNCj4gPg0KPiA+IGxpdGVyYWwgMA0KPiA+IEhjbVY/ZDAw
MDAxDQo+ID4NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=
