Return-Path: <SRS0=pAsw=22=realtek.com=shumingf@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCB9CA0EE0
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Aug 2025 02:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DECAC4CEF5; Thu, 14 Aug 2025 02:12:06 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18D7AC4CEEB;
	Thu, 14 Aug 2025 02:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18D7AC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 57E2BxMhA1015144, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1755137520; bh=OmO2UKvSnDLCvHKkXCSbkGThH9V04FKyJyfpyn4wcfk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=oAotE/57ewvm/duBSbND8Dh1Hn6cOj+nDLnWsZEZLcqbm2951R66P3URMIPq9V6Ka
	 rYPoTqX+iu1ngehZeuPxSVy32JT45vliKJmGdIleSCD4MiYfoRF1LtcJDfEzmLOaJg
	 hbJC/JekO3Y7yqtxv5PF5Is8kTgG9pqq0qGEMFgFIkTzeMjsHKRn6uAvcwlk5TzfDn
	 jWVDBP/chWwe/pfwifbQiFBJw5FxptwmTWZxdvpMkt99saON5Fly/VSkR6zonQz+Dt
	 SKO3DrXwwJIh+U81duTek6LjYcOMJpDGjDAbtHC1rvWwKI4RsYcxW15jZpp9NBX5HL
	 qJlCILVfRb0Dw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 57E2BxMhA1015144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 10:12:00 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 10:11:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 10:11:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::9617:3fd6:3830:25cc]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::9617:3fd6:3830:25cc%10]) with mapi id
 15.02.1544.011; Thu, 14 Aug 2025 10:11:59 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "Flove(HsinFu)"
	<flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu
	<jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] realtek: rt1321: Add patch firmware of MCU
Thread-Topic: [PATCH] realtek: rt1321: Add patch firmware of MCU
Thread-Index: AQHcDDBf8H4ViCp4pkS0YZY8pPTpdLRgADgAgAFogrA=
Date: Thu, 14 Aug 2025 02:11:59 +0000
Message-ID: <03bffdb43525464bab8bb73de064a2d4@realtek.com>
References: <20250813085807.1375181-1-shumingf@realtek.com>
 <CA+5PVA6NmOTsAqxiL4hOQtcrOJg2hT16+1gK165LXY348g96LQ@mail.gmail.com>
In-Reply-To: <CA+5PVA6NmOTsAqxiL4hOQtcrOJg2hT16+1gK165LXY348g96LQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

PiA+IEZyb206IFNodW1pbmcgRmFuIDxzaHVtaW5nZkByZWFsdGVrLmNvbT4NCj4gPg0KPiA+IFRo
aXMgcGF0Y2ggYWRkZWQgdGhlIHBhdGNoIGZpcm13YXJlIG9mIHJ0MTMyMSBNQ1UuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5jb20+DQo+ID4g
LS0tDQo+ID4gIHJlYWx0ZWsvcnQxMzIwL3J0MTMyMS1wYXRjaC1jb2RlLXZhLmJpbiB8IEJpbiAw
IC0+IDcyMzIgYnl0ZXMNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBk
ZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IHJlYWx0ZWsvcnQxMzIwL3J0MTMy
MS1wYXRjaC1jb2RlLXZhLmJpbg0KPiANCj4gWW91J3JlIGFkZGluZyBhIG5ldyBmaWxlIGJ1dCB5
b3UgZGlkIG5vdCBhZGQgaXQgdG8gV0hFTkNFLiAgUGxlYXNlIGZpeCB0aGlzDQo+IGFuZCBydW4g
Y2hlY2tfd2hlbmNlIGJlZm9yZSB5b3Ugc3VibWl0IHBhdGNoZXMuDQo+IA0KPiBqb3NoDQoNCldp
bGwgYWRkIGl0IHRvIFdIRU5DRSBhbmQgcnVuIGNoZWNrX3doZW5jZS5weS4gVGhhbmtzLg0KDQo=
