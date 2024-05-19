Return-Path: <SRS0=ME+9=MW=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5142C25B74
	for <linux-firmware@archiver.kernel.org>; Sun, 19 May 2024 00:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB8A8C32782; Sun, 19 May 2024 00:01:04 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4683C113CC
	for <linux-firmware@kernel.org>; Sun, 19 May 2024 00:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4683C113CC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44J00l3iA3873108, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44J00l3iA3873108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 19 May 2024 08:00:47 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 19 May 2024 08:00:47 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 19 May 2024 08:00:47 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7]) by
 RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7%5]) with mapi id
 15.01.2507.035; Sun, 19 May 2024 08:00:47 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "Larry.Finger@gmail.com" <Larry.Finger@gmail.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>
Subject: Re: [PATCH v2] linux-firmware: Add ordinary firmware for RTL8821AU device
Thread-Topic: [PATCH v2] linux-firmware: Add ordinary firmware for RTL8821AU
 device
Thread-Index: AQHaqLyk9cuWMhljlkiILrPzprx6d7GdJ4uA
Date: Sun, 19 May 2024 00:00:46 +0000
Message-ID: <e40c53904baae78c4c605a9d389920288952e39a.camel@realtek.com>
References: <4un2zu7ofgoz.76eagbFcUhFoEANVDT3_qQ2@1EHFQ.trk.elasticemail.com>
In-Reply-To: <4un2zu7ofgoz.76eagbFcUhFoEANVDT3_qQ2@1EHFQ.trk.elasticemail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
user-agent: Evolution 3.36.1-2 
x-originating-ip: [125.231.81.142]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-ID: <625660ECCA55BE45BCF1E00182DD2EEC@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

T24gU2F0LCAyMDI0LTA1LTE4IGF0IDAwOjQzICswMDAwLCBMYXJyeSBGaW5nZXIgd3JvdGU6DQo+
IA0KPiBUaGlzIGZpcm13YXJlIHdhcyBleHRyYWN0ZWQgZnJvbSB0aGUgMjAyMTA3MDggcmVsZWFz
ZSBvZiB0aGUgdmVuZG9yDQo+IGRyaXZlciBmb3IgdGhpcyBkZXZpY2UuIFRoZSBmaXJtd2FyZSBj
b3JyZXNwb25kcyB3aXRoIHRoZSBsYXRlc3QNCj4gcmVsZWFzZSBieSBSZWFsdGVrLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTGFycnkgRmluZ2VyIDxMYXJyeS5GaW5nZXJAbHdmaW5nZXIubmV0Pg0K
PiAtLS0NCj4gQ2hhbmdlcw0KPiB2MiAtIENoYW5nZWQgYWRkcmVzcyB0byBsaW51eC1maXJtd2Fy
ZUBrZXJuZWwub3JnDQo+IA0KDQpJIHN0aWxsIGhhdmUgdGhlIHNhbWUgcHJvYmxlbSBsaWtlIHYx
LCB3aGljaCBydHc4OC9ydHc4ODIxYV9mdy5iaW4NCndhcyB0cnVuY2F0ZWQgdG8gMCwgd2hlbiBJ
IGFwcGxpZWQgaXQgYnkgJ3B3Y2xpZW50IGdpdC1hbSAxMzY2NzQ3MCcuIA0KDQpUaGVuIEkgdXNl
ZCAncHdjbGllbnQgZ2V0IDEzNjY3NDcwJyB0byBnZXQgYSBsb2NhbCBmaWxlLCBhbmQgbW92ZWQN
ClJFQURNRSBhbmQgV0hFTkNFIGNodW5rIHVwd2FyZCwgYW5kIHRoZW4gSSBjYW4gZ2V0IGV4cGVj
dGVkDQpydHc4OC9ydHc4ODIxYV9mdy5iaW4sIHdoaWNoIGlzIGlkZW50aWNhbCB0byB0aGUgcmVs
ZWFzZWQgZmlybXdhcmUuDQoNCk5vdCBzdXJlIGlmIHRoYXQgaXMgbXkgbG9jYWwgZ2l0IHByb2Js
ZW0uIEFueXdheSBmaXJtd2FyZSBpcyBmaW5lDQp0byBtZSwgc28NCg0KUmV2aWV3ZWQtYnk6IFBp
bmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29tPg0KDQoNCg==
