Return-Path: <SRS0=NJAD=OR=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A37C3DA59
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Jul 2024 01:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3335C4AF0D; Wed, 17 Jul 2024 01:14:15 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51F03C116B1;
	Wed, 17 Jul 2024 01:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51F03C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 46H1E9E801504360, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1721178849; bh=qL3e3I0h6u+GlWN0Kwv6fp2LPxDkm0OZvMZhSKHpqWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=kDd7QY3N5wn8HdJGUSO3uBI6xPnVarLS4k8/EAHwzCGkVog27QgUd5O9javv9dlMr
	 RzOLwfg7RLYY3hB1LuH02DtUhsb07OkmRNTza2Dn9k8OX/oAnt3UJYlA7ZmhzYdlZ9
	 MlomhzMmjYAmGwRtUFAv+ZI8ntSbyiYwYpepCrGfs4bMYDIGMI7q1aLKOWfCGsilhL
	 tuwhA+Yc3xtX053erco2qXFZzdN2M/R6NySfPx9N0Aw/eBOoyLVOn3j8TyfUZCYyRb
	 85ddCcOdSARuC1rNGzCVVZI2F+n9WzSpLOI3X1t3vh1LfPnmEqzOWq4ZGTKx0saM93
	 OFH0MDpt2pNYQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 46H1E9E801504360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jul 2024 09:14:09 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 09:14:08 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jul 2024 09:14:08 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7]) by
 RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7%5]) with mapi id
 15.01.2507.035; Wed, 17 Jul 2024 09:14:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Nick Morrow <usbwifi2024@gmail.com>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: RE: [PATCH] linux-firmware: Add firmware for RTL8812AU device
Thread-Topic: [PATCH] linux-firmware: Add firmware for RTL8812AU device
Thread-Index: AQHa15I3Eb/Ba7fAh0+SreSWXpeY0rH6Er3g//+DMYCAAIcRMA==
Date: Wed, 17 Jul 2024 01:14:08 +0000
Message-ID: <32111a5ceffe421fbe1d91ae60a8eb0b@realtek.com>
References: <09899e7a-6a34-4c21-bf18-6533e22b2d22@gmail.com>
 <CA+5PVA7oS2hBGTudjCzbwrpXfbdYpL7_UbqL-inhm4tKaSRGCQ@mail.gmail.com>
 <91575ad3af41462a9ba2688e0920dc94@realtek.com>
 <0e5a3ee7-a5d5-4705-8e39-829e089c1a4e@gmail.com>
In-Reply-To: <0e5a3ee7-a5d5-4705-8e39-829e089c1a4e@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.69.94]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

TmljayBNb3Jyb3cgPHVzYndpZmkyMDI0QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBRdWVzdGlv
bjogQXQgc29tZSBwb2ludCBpbiB0aGUgbmV4dCBmZXcgbW9udGhzIHdlIGFyZSBnb2luZyB0byB0
cnkgdG8gcHVzaCBhIGRyaXZlciBmb3IgdGhlIHJ0bDg4MTRhdSBjaGlwDQo+IGFzIHdlbGwgYnV0
IEkgaGF2ZSBubyBpZGVhIHdoYXQgdGhlIG1vc3QgcmVjZW50IHZlcnNpb24gd291bGQgYmUuIERv
IHlvdSBoYXZlIGEgc3VnZ2VzdGlvbiBhcyB0byB3aG8gSSBzaG91bGQNCj4gY29udGFjdD8NCg0K
V2hhdCBpcyB0aGUgdmVyc2lvbiB5b3UgaGF2ZSB0YWtlbj8gQnkgaW50ZXJuYWwgcmVjb3JkLCB0
aGlzIGRyaXZlciB3YXMgbm90DQp1cGRhdGVkIHNpbmNlIDIwMjAuIA0KDQpQaW5nLUtlDQoNCg==
