Return-Path: <SRS0=7AAG=PZ=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BC0C5320E
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Aug 2024 00:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 570DEC4AF1A; Mon, 26 Aug 2024 00:55:06 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D7BFC4AF18
	for <linux-firmware@kernel.org>; Mon, 26 Aug 2024 00:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D7BFC4AF18
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47Q0snTO33418702, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1724633689; bh=MBCCWiaC7HS0XPfu7kNTP5DmJMEnZC08mxLZ3tvVu5A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VHf61Won6hG/kOnXRt8E6TWNpTGJX+XcxNEdBIfStDido54v6lDiOk0swErsLFcEW
	 CzKvRTuq547Lu2/KFo5uMUfUW038KaRtsdaamK+ype/3d6SFdN2K1x+J/VKeDyjm1W
	 LBPtjkN+b4qCTqTNRz+uFRnOf7VreomMknW/jRQfeBVlqrFHkys/lihdmtVU+iPB4i
	 ByAdOaeUea4JUjQJHqEfteXfGuax+H6SAWr14KcLLfLSaK9K5/YZePUDflLz1qYMwH
	 5r4L0VW9dcZjNQUuMnV/H+bayjEzTZIbOO87ksZlPWv1v+SftAlImodYcMWElWs0er
	 bfdoKW8cRIwxA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47Q0snTO33418702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2024 08:54:49 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 08:54:50 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Aug 2024 08:54:49 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Mon, 26 Aug 2024 08:54:49 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Nick Morrow <usbwifi2024@gmail.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH V2] linux-firmware: Add firmware for RTL8812AU device
Thread-Topic: [PATCH V2] linux-firmware: Add firmware for RTL8812AU device
Thread-Index: AQHa9MSID1+G4fkYOk+1V5IwmOeYj7I0BAFAgAJBK4CAAnSvMA==
Date: Mon, 26 Aug 2024 00:54:49 +0000
Message-ID: <87dceee9137f4bde8bbc1249583d3f0e@realtek.com>
References: <f815d748-6578-441e-b61e-0a220d45e168@gmail.com>
 <774a7dd01718448da4048e966f5430f1@realtek.com>
 <db84ee3a-1aed-4721-ac27-8c6d116979bf@gmail.com>
In-Reply-To: <db84ee3a-1aed-4721-ac27-8c6d116979bf@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

TmljayBNb3Jyb3cgPHVzYndpZmkyMDI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+IE9uIDgvMjIvMjQg
MTk6NTgsIFBpbmctS2UgU2hpaCB3cm90ZToNCj4gPiArbGludXgtd2lyZWxlc3MNCj4gPg0KPiA+
IEhpIE5pY2ssDQo+ID4NCj4gPiBQbGVhc2UgYWx3YXlzIENjIGxpbnV4LXdpcmVsZXNzIGZvciBy
dHc4OCBmaXJtd2FyZS4NCj4gPg0KPiA+IEFuZCBzdWJqZWN0IHByZWZpeCB3b3VsZCBiZSAicnR3
ODg6IC4uLiINCj4gDQo+IEhpIFBpbmctS2UsIEkgYW0gdHJ5aW5nIHRvIHJlc29sdmUgd2hhdCB5
b3UgYXJlIGFza2luZyBmb3IgdnMuIHRoZSBpbnN0cnVjdGlvbnMgYXQgbGludXgtZmlybXdhcmUu
IFNob3VsZA0KPiB0aGUgc3ViamVjdCBmb3IgVjMgYmU6DQo+IA0KPiAgIFtQQVRDSCBWM10gbGlu
dXgtZmlybXdhcmU6IHJ0dzg4OiBBZGQgZmlybXdhcmUgZm9yIFJUTDg4MTJBVSBkZXZpY2UNCg0K
TW9zdCBjb21taXRzIGV4Y2VwdGluZyB0byBtZWRpYXRlaydzIG9uZXMgZG9uJ3QgdXNlICJsaW51
eC1maXJtd2FyZTogIiBhcyBwcmVmaXguDQpJIGRvbid0IHdhbnQgdGhhdCBuZWl0aGVyLiBPciBJ
IG1pc3MgdGhpcyBuZXcgcnVsZT8NCg0KPiANCj4gPg0KPiA+IE5pY2sgTW9ycm93IDx1c2J3aWZp
MjAyNEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+PiBUaGlzIGZpcm13YXJlIHdhcyBleHRyYWN0ZWQg
ZnJvbSB0aGUgIDIwMjEwNzA4IC0gdjUuMTMuNi0yMyByZWxlYXNlIG9mDQo+ID4+IHRoZSB2ZW5k
b3IgZHJpdmVyIGZvciB0aGlzIGRldmljZSBhbmQgaXMgYmVsaWV2ZWQgdG8gYmUgdGhlIGxhdGVz
dA0KPiA+PiByZWxlYXNlIGJ5IFJlYWx0ZWsuIFRlc3Rpbmcgb2YgdGhlIG5ldyBkcml2ZXIgaGFz
IGJlZW4gYWNjb21wbGlzaGVkDQo+ID4+IHVzaW5nIHRoaXMgZmlybXdhcmUuIE51bWVyb3VzIHRl
c3RlcnMgaGF2ZSBiZWVuIGludm9sdmVkLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBOaWNr
IE1vcnJvdyA8VVNCV2lGaTIwMjRAZ21haWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gdjI6DQo+ID4+
ICAgICAtIE5vIGNoYW5nZS4gUmVzdWJtaXR0ZWQgbm93IHRoYXQgdGhlIGRyaXZlciBpcyBpbiBy
ZXZpZXcuDQo+ID4+IC0tLQ0KPiA+PiAgICBXSEVOQ0UgICAgICAgICAgICAgICAgfCAgIDEgKw0K
PiA+PiAgICBydHc4OC9SRUFETUUgICAgICAgICAgfCAgIDMgKysrDQo+ID4+ICAgIHJ0dzg4L3J0
dzg4MTJhX2Z3LmJpbiB8IEJpbiAwIC0+IDI3MDMwIGJ5dGVzDQo+ID4+ICAgIDMgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBydHc4OC9y
dHc4ODEyYV9mdy5iaW4NCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL1dIRU5DRSBiL1dIRU5DRQ0K
PiA+PiBpbmRleCA4YWViZTU2Yi4uZDZiZDQ4MTQgMTAwNjQ0DQo+ID4+IC0tLSBhL1dIRU5DRQ0K
PiA+PiArKysgYi9XSEVOQ0UNCj4gPj4gQEAgLTMyNzAsNiArMzI3MCw3IEBAIExpY2VuY2U6IFJl
ZGlzdHJpYnV0YWJsZS4gU2VlIExJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQgZm9yIGRldGFp
bHMuDQo+ID4+ICAgIERyaXZlcjogcnR3ODggLSBSZWFsdGVrIDgwMi4xMWFjIFdMQU4gZHJpdmVy
IGZvciBSVEw4ODIyQkUgYW5kIFJUTDg4MjJDRQ0KPiA+Pg0KPiA+PiAgICBJbmZvOiBTZW50IHRv
IExhcnJ5IEZpbmdlciBieSBSZWFsdGVrIGVuZ2luZWVyIFlhbi1Ic3VhbiBDaHVhbmcgPHloY2h1
YW5nQHJlYWx0ZWsuY29tPg0KPiA+PiArRmlsZTogcnR3ODgvcnR3ODgxMmFfZncuYmluDQo+ID4+
ICAgIEZpbGU6IHJ0dzg4L3J0dzg4MjFhX2Z3LmJpbg0KPiA+DQo+ID4gSSBmYWlsZWQgdG8gYXBw
bHkgdGhpcyBwYXRjaCwgZXZlbiB0aGlzIHRleHR1YWwgcGFydC4NCj4gPg0KPiA+IFR3byBsZWFk
aW5nIHNwYWNlcyBiZWZvcmUgIkZpbGU6IHJ0dzg4L3J0dzg4MjFhX2Z3LmJpbiIsIGJ1dCBhY3R1
YWxseSB0aGlzDQo+ID4gc2hvdWxkIGJlIG9ubHkgb25lLiBOb3Qgc3VyZSB3aGF0IGlzIHdyb25n
Lg0KPiANCj4gSSBhbSBjYXJlZnVsbHkgZ29pbmcgb3ZlciB0aGlzIHBhdGNoIGFnYWluLi4uIHdo
aWxlIHByZXBhcmluZyBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4gSSBkbyBub3QgcmVjYWxs
DQo+IGVkaXRpbmcgdGhlIGxpbmUgdGhhdCBoYXMgdHdvIGxlYWRpbmcgc3BhY2VzLg0KDQpJIHVw
ZGF0ZSBteSBsaW51eC1maXJtd2FyZSByZXBvc2l0b3J5IHRvIHRoZSBuZXdlc3Q6IA0KICAgMmNk
YzExYTdiM2JmICgiTWVyZ2UgYnJhbmNoICdtdDc5MjUnIGludG8gJ21haW4nIikNCg0KQW5kLCBh
ZGQgdGhlIGxpbmUuIFRoZSBkaWZmZXJlbmNlIGxvb2tzIGxpa2UgDQoNCmRpZmYgLS1naXQgYS9X
SEVOQ0UgYi9XSEVOQ0UNCmluZGV4IGMxOGIyZTBkOGRiOS4uMGMwM2IyZDAzYjgzIDEwMDY0NA0K
LS0tIGEvV0hFTkNFDQorKysgYi9XSEVOQ0UNCkBAIC0zMjcwLDYgKzMyNzAsNyBAQCBMaWNlbmNl
OiBSZWRpc3RyaWJ1dGFibGUuIFNlZSBMSUNFTkNFLnJ0bHdpZmlfZmlybXdhcmUudHh0IGZvciBk
ZXRhaWxzLg0KIERyaXZlcjogcnR3ODggLSBSZWFsdGVrIDgwMi4xMWFjIFdMQU4gZHJpdmVyIGZv
ciBSVEw4ODIyQkUgYW5kIFJUTDg4MjJDRQ0KDQogSW5mbzogU2VudCB0byBMYXJyeSBGaW5nZXIg
YnkgUmVhbHRlayBlbmdpbmVlciBZYW4tSHN1YW4gQ2h1YW5nIDx5aGNodWFuZ0ByZWFsdGVrLmNv
bT4NCitGaWxlOiBydHc4OC9ydHc4ODEyYV9mdy5iaW4NCiBGaWxlOiBydHc4OC9ydHc4ODIxYV9m
dy5iaW4NCiBGaWxlOiBydHc4OC9ydHc4ODIyYl9mdy5iaW4NCiBGaWxlOiBydHc4OC9ydHc4ODIy
Y19mdy5iaW4NCg0KVGhpcyBpcyB3aGF0IEkgZXhwZWN0LiBDYW4geW91IGFwcGx5IHlvdXIgcGF0
Y2ggc3VjY2Vzc2Z1bGx5IGluIHlvdXIgc2lkZT8gDQoNCg0K
