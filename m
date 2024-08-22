Return-Path: <SRS0=WUtQ=PV=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE43EC3DA4A
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Aug 2024 03:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE11DC4AF0C; Thu, 22 Aug 2024 03:40:16 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88FDFC4AF09;
	Thu, 22 Aug 2024 03:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88FDFC4AF09
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47M3e9KV13526278, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1724298009; bh=0POGwxAPPv8AKX/U7cMyjw0ZuDGOyLRYhmEEOhtplmE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=LJCLAqfEcmSDOJ5c9cNg4Q7Q/IetokcXHH5IJ33ZMwiIMXePvOudrIjJbonZu3WWR
	 ehgiqWwvPqnJ+kK/97lFzfQk8XUENYQuyfASW9+9XAZFIE8xcmKcHvezpbNzu8gKYY
	 OSECxgKHGdGrErY16iseDwjMRU3mOOZMdlwUrYQrvhYsx23bJO2yJXCBGmO99ekOsW
	 ZYFvndfOYNbm7QZjQuMQaU1WBoB6NxXWj+TVAMj4zlUubQ3MP+Gnpi/3rOEbqHgB4c
	 9H5E4Xl33FRvuX1xClD0SmZZqmq7oopmyyKGvs8MTrfj0cVU1V3y9nWSe8G2Jf0yHt
	 1AVSWOH3fCptQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47M3e9KV13526278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 11:40:09 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 11:40:10 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Aug 2024 11:40:09 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Thu, 22 Aug 2024 11:40:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Nick Morrow <usbwifi2024@gmail.com>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: RE: [PATCH] linux-firmware: Add firmware for RTL8812AU device
Thread-Topic: [PATCH] linux-firmware: Add firmware for RTL8812AU device
Thread-Index: AQHa15I3Eb/Ba7fAh0+SreSWXpeY0rIyPhaAgACZ69A=
Date: Thu, 22 Aug 2024 03:40:09 +0000
Message-ID: <da2b84166be843c8a3ee21c8f1d7b6f4@realtek.com>
References: <09899e7a-6a34-4c21-bf18-6533e22b2d22@gmail.com>
 <CA+5PVA7oS2hBGTudjCzbwrpXfbdYpL7_UbqL-inhm4tKaSRGCQ@mail.gmail.com>
 <18bc165d-ad62-44c6-886e-4b8e75d70a6b@gmail.com>
In-Reply-To: <18bc165d-ad62-44c6-886e-4b8e75d70a6b@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

TmljayBNb3Jyb3cgPHVzYndpZmkyMDI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+IE9uIDcvMTYvMjQg
MTA6MDksIEpvc2ggQm95ZXIgd3JvdGU6DQo+ID4gT24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMTA6
NTDigK9BTSBOaWNrIE1vcnJvdyA8dXNid2lmaTIwMjRAZ21haWwuY29tPiB3cm90ZToNCj4gPj4N
Cj4gPj4NCj4gPj4gVGhpcyBmaXJtd2FyZSB3YXMgZXh0cmFjdGVkIGZyb20gdGhlICAyMDIxMDcw
OCAtIHY1LjEzLjYtMjMgcmVsZWFzZSBvZg0KPiA+PiB0aGUgdmVuZG9yIGRyaXZlciBmb3IgdGhp
cyBkZXZpY2UgYW5kIGlzIGJlbGlldmVkIHRvIGJlIHRoZSBsYXRlc3QNCj4gPj4gcmVsZWFzZSBi
eSBSZWFsdGVrLg0KPiA+DQo+ID4gV2UnZCBuZWVkIHNvbWVvbmUgZnJvbSBSZWFsdGVrIHRvIHN1
Ym1pdCB0aGlzLCBvciBpbmNsdWRlIHRoZWlyIFNpZ25lZC1vZmYtYnkuDQo+ID4NCj4gPiBqb3No
DQo+IA0KPiBQaW5nLUtlLA0KPiANCj4gWW91IGhhZCBhc2sgbWUgdG8gaG9sZCBvZmYgdW50aWwg
eW91IGhhdmUgdGhlIGRyaXZlciBjb2RlIGZyb20gQml0dGVyYmx1ZS4gWW91IGhhdmUgdGhlIGNv
ZGUgYnV0IEkgYW0gbm90DQo+IGV4YWN0bHkgc3VyZSBob3cgdG8gcHJvY2VlZC4gU2hvdWxkIEkg
Y3JlYXRlIGEgbmV3IHBhdGNoIGFuZCBzZW5kdCBhcyB2MiB3aXRoIHlvdXIgbmFtZSBhcyBzaWdu
ZWQgb2ZmIG9yDQo+IHdpbGwgeW91IHN1Ym1pdCB0aGUgZmlsZT8NCg0KVGhlIGRyaXZlciBjb2Rl
IGlzIHVuZGVyIHJldmlldywgYW5kIEkgdGhpbmsgd2UgY2FuIGhhdmUgdGhlIGRyaXZlciBzb29u
LiANClBsZWFzZSBzZW5kIHYyIGFuZCBDYyBtZSBhbmQgQml0dGVyYmx1ZS4gSSB0aGluayBCaXR0
ZXJibHVlIGNhbiBoZWxwIHRvDQp0ZXN0IHRoaXMgZmlybXdhcmUsIGFuZCBJIHdpbGwgYWRkIG15
IHMtby1iIGFmdGVyIGNoZWNraW5nIGZpcm13YXJlIGNvbnRlbnQuDQoNCg0KDQo=
