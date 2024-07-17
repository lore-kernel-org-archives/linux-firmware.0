Return-Path: <SRS0=NJAD=OR=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D1EC3DA59
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Jul 2024 00:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90553C4AF09; Wed, 17 Jul 2024 00:36:12 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBBE1C116B1;
	Wed, 17 Jul 2024 00:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBBE1C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 46H0ZvpO61462032, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1721176557; bh=nrU2pXBdRzN4nySW56G6lhloZgrXbdr6vofI6q2kTp0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=QxNOmyK0P2N/ch4lbnmeVDaYSVvTQW7CzPBIwT/uTNGc0jMVCTQwMKpiNagBcoVpD
	 0Nx2zvQavOoz3wtY0i4gb2GTEN05bQD0vx9TZORps6o/Z2hdmxhsW0V4XiD4Aivp+R
	 nrQQnWNo8WsE5OIwrmlZYvuvF/Nvjb1PwFYrxhrcIAmhv+bRS03mLIDMwJDR01uDXx
	 kSliUk7FLHPX03AHC/oh+XyGF+soZjPemAbHlaQVCEBp26n5LG/hgvsSsvHC7hOi9x
	 wTUa7AXEyTiwqUB/vbUM3DB8RS/SNyyfz6EUAQ0zJQJ71+158X9Y3p93aV50QmqSbX
	 jzF9LXnFKM+Eg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 46H0ZvpO61462032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jul 2024 08:35:57 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 08:35:58 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jul 2024 08:35:57 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7]) by
 RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7%5]) with mapi id
 15.01.2507.035; Wed, 17 Jul 2024 08:35:57 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Josh Boyer <jwboyer@kernel.org>, Nick Morrow <usbwifi2024@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: RE: [PATCH] linux-firmware: Add firmware for RTL8812AU device
Thread-Topic: [PATCH] linux-firmware: Add firmware for RTL8812AU device
Thread-Index: AQHa15I3Eb/Ba7fAh0+SreSWXpeY0rH6Er3g
Date: Wed, 17 Jul 2024 00:35:57 +0000
Message-ID: <91575ad3af41462a9ba2688e0920dc94@realtek.com>
References: <09899e7a-6a34-4c21-bf18-6533e22b2d22@gmail.com>
 <CA+5PVA7oS2hBGTudjCzbwrpXfbdYpL7_UbqL-inhm4tKaSRGCQ@mail.gmail.com>
In-Reply-To: <CA+5PVA7oS2hBGTudjCzbwrpXfbdYpL7_UbqL-inhm4tKaSRGCQ@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.69.94]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

Sm9zaCBCb3llciA8andib3llckBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgSnVs
IDE2LCAyMDI0IGF0IDEwOjUw4oCvQU0gTmljayBNb3Jyb3cgPHVzYndpZmkyMDI0QGdtYWlsLmNv
bT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+IFRoaXMgZmlybXdhcmUgd2FzIGV4dHJhY3RlZCBmcm9t
IHRoZSAgMjAyMTA3MDggLSB2NS4xMy42LTIzIHJlbGVhc2Ugb2YNCj4gPiB0aGUgdmVuZG9yIGRy
aXZlciBmb3IgdGhpcyBkZXZpY2UgYW5kIGlzIGJlbGlldmVkIHRvIGJlIHRoZSBsYXRlc3QNCj4g
PiByZWxlYXNlIGJ5IFJlYWx0ZWsuDQo+IA0KPiBXZSdkIG5lZWQgc29tZW9uZSBmcm9tIFJlYWx0
ZWsgdG8gc3VibWl0IHRoaXMsIG9yIGluY2x1ZGUgdGhlaXIgU2lnbmVkLW9mZi1ieS4NCj4gDQoN
CkkgY2FuIGhlbHAgdGhpcy4gUGxlYXNlIHNlbmQgcGF0Y2ggdG8gb3IgQ2MgbWUgbmV4dCB0aW1l
LCBOaWNrLg0KDQo+ID4gICBydHc4OC9ydHc4ODEyYV9mdy5iaW4gfCBCaW4gMCAtPiAyNzAzMCBi
eXRlcw0KDQpTaW5jZSBydHc4OCBoYXMgbm90IHN1cHBvcnRlZCB0aGlzIGNoaXAgeWV0LCBwbGVh
c2Ugc3VibWl0IGZpcm13YXJlIGFmdGVyDQphZGRpbmcgZHJpdmVyLg0KDQo=
