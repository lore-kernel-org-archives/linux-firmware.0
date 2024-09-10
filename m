Return-Path: <SRS0=x4cV=QI=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780A3EB64DE
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Sep 2024 10:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 334CAC4CECF; Tue, 10 Sep 2024 10:25:11 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24684C4CECD;
	Tue, 10 Sep 2024 10:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24684C4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48AAP2C901914485, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1725963902; bh=GhCHXq31WELXIBu8yyjXu/q/RnBbVanNyWuaoZW0fSQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=LOwl+70IGduhwjctkFRyTTzk9t8tWLA1KJO78qi7r9Cf9bFDWmb8obzR7I9qsGKWX
	 Rjtb9t9xZ8wGkEHsXsiCej5gZNLmKyuBtlt4SlqRfucPZ0uesFCxF6NlXkd8PMZWXb
	 J5jA3biXu+TkWNwVt84tM7zysykeNRDFfwYR6hvONm3BvblXl1CjI/4dgz3JaQI/Uh
	 hcN+mHh5/j8VY+pPqqxvJ19NxtJqPFyh1OxvP8o8XoWWwP6pqYGEiP4UePMZ/0bSZG
	 co+G9laThdSjz1iHM1FXsJ/zmCN9vM/iIniyxddzOWemgMaccA61ScVcZN36ua+mmJ
	 w8URl33czRvIg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48AAP2C901914485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 18:25:02 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 18:25:02 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 10 Sep 2024 18:25:02 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Tue, 10 Sep 2024 18:25:02 +0800
From: Hilda Wu <hildawu@realtek.com>
To: Alexander Tsoy <alexander@tsoy.me>, Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Max Chou
	<max.chou@realtek.com>
Subject: RE: [PATCH] rtl_bt: Update RTL8761B BT USB firmware to 0xDDD5_C761
Thread-Topic: [PATCH] rtl_bt: Update RTL8761B BT USB firmware to 0xDDD5_C761
Thread-Index: AQHa/tmJFQel0BkGg0yuJp/gNW7smbJHY/yAgAdiw8A=
Date: Tue, 10 Sep 2024 10:25:01 +0000
Message-ID: <c74ed71eb4ad4e379c6e162dda3caf32@realtek.com>
References: <20240904132742.2861526-1-alexander@tsoy.me>
	 <CA+5PVA7a6SQo1Uvj=oG_2_2QgY6jZ18B09z+wiXQ6J3g+XK7Vw@mail.gmail.com>
 <cc0c058998c3e72bf6834987502cc7995b0abae0.camel@tsoy.me>
In-Reply-To: <cc0c058998c3e72bf6834987502cc7995b0abae0.camel@tsoy.me>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgQWxleGFuZGVyICYgSm9zaCwNCg0KRHVlIHRvIHRoZSAweERERDVfQzc2MSBpcyBXaW5kb3dz
IGZ3LiBUaGUgZncgdmVyc2lvbiBpcyBub3Qgc3VpdGFibGUgZm9yIHVzZSBvbiBMaW51eCB1cHN0
cmVhbS4NCldlIGFwb2xvZ2l6ZSBmb3IgYW55IGluY29udmVuaWVuY2UgY2F1c2VkIGFuZCB0aGFu
a3MgQWxleGFuZGVyIGZvciB0aGlzIGZ3IGZpeGVzIHJlZ3Jlc3Npb24gaW5mby4NCkkgd2lsbCBj
b21tdW5pY2F0ZSB0aGlzIGlzc3VlIGFuZCBtZXNzYWdlIGludGVybmFsbHksIExldCByZWxldmFu
dCBjb2xsZWFndWVzIGV2YWx1YXRlIGFuZCBjb21lIHVwIHdpdGggYSBmaXguDQoNClJlZ2FyZHMs
DQpIaWxkYQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogcHVsZWdsb3RAcHVs
ZWdsb3QucnUgPHB1bGVnbG90QHB1bGVnbG90LnJ1PiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIFRz
b3kNClNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgNSwgMjAyNCAxOjU3IEFNDQpUbzogSm9zaCBC
b3llciA8andib3llckBrZXJuZWwub3JnPjsgSGlsZGEgV3UgPGhpbGRhd3VAcmVhbHRlay5jb20+
DQpDYzogbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSF0gcnRs
X2J0OiBVcGRhdGUgUlRMODc2MUIgQlQgVVNCIGZpcm13YXJlIHRvIDB4RERENV9DNzYxDQoNCg0K
RXh0ZXJuYWwgbWFpbC4NCg0KDQoNCtCSINCh0YAsIDA0LzA5LzIwMjQg0LIgMTA6NDggLTA0MDAs
IEpvc2ggQm95ZXIg0L/QuNGI0LXRgjoNCj4gT24gV2VkLCBTZXAgNCwgMjAyNCBhdCA5OjI44oCv
QU0gQWxleGFuZGVyIFRzb3kgPGFsZXhhbmRlckB0c295Lm1lPg0KPiB3cm90ZToNCj4gPg0KPiA+
ICogVXBkYXRlcyBhZHZlcnRpc2VkIEJUIHZlcnNpb24gZnJvbSA1LjEgdG8gNS40DQo+ID4gKiBG
aXhlcyBjb21wYXRpYmlsaXR5IHdpdGggWGJveCB3aXJlbGVzcyBjb250cm9sbGVycw0KPiA+DQo+
ID4gUmVsZWFzZSBWZXJzaW9uOiAweERERDVfQzc2MQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIFRzb3kgPGFsZXhhbmRlckB0c295Lm1lPg0KPg0KPiBBcG9sb2dpZXMsIGJ1dCBJ
IGRvbid0IHJlY29nbml6ZSB0aGlzIGFkZHJlc3MgYXMgYSBjb21taXR0ZXIgdG8gdGhpcyANCj4g
ZmlybXdhcmUuICBIaWxkYSwgY2FuIEkgZ2V0IGFuIEFja2VkLWJ5IG9yIFNpZ25lZC1vZmYtYnkg
ZnJvbSB5b3UgZm9yIA0KPiB0aGlzIHVwZGF0ZT8NClllcywgSSB1bmRlcnN0YW5kIHRoYXQuDQoN
CkhpbGRhLCBwbGVhc2Ugbm90IHRoYXQgdGhpcyBmaXJtd2FyZSBpcyB0YWtlbiBmcm9tIHRoZSBX
aW5kb3dzIGRyaXZlciBwYWNrYWdlIHZlcnNpb24gMS45LjEwNTEuMzAxMy4gSXQgZml4ZXMgcmVn
cmVzc2lvbiBpbnRyb2R1Y2VzIGJ5IHRoZSBsYXN0IGNvbW1pdCB0aGF0IGNhdXNlcyBmcmVxdWVu
dCBkaXNjb25uZWN0cyBmb3IgWGJveCBjb250cm9sbGVycyBhcyByZXBvcnRlZCBpbiBbMV0gYW5k
IHNvbWUgb3RoZXIgcGxhY2VzLiBJJ20gc29ycnksIEkgZGlkbid0IGZpbmQgd2hlcmUgdG8gcmVw
b3J0IHN1Y2ggcHJvYmxlbXMuIElmIHRoaXMgcGFydGljdWxhciBmaXJtd2FyZSBpcyBub3QgcmVk
aXN0cmlidXRhYmxlLCB3b3VsZCBiZSBuaWNlIGlmIFJlYWx0ZWsgcHJvdmlkZSBhIGZpeCBpcyBz
b21lIG90aGVyIHdheS4NCg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9hdGFyLWF4aXMveHBhZG5l
by9pc3N1ZXMvNDkyDQo=
