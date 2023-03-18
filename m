Return-Path: <SRS0=q3rQ=7K=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9130C74A5B
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Mar 2023 14:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FBC9C4339B; Sat, 18 Mar 2023 14:05:37 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17FA9C433EF;
	Sat, 18 Mar 2023 14:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17FA9C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 32IE5JltC020195, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 32IE5JltC020195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Sat, 18 Mar 2023 22:05:19 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Sat, 18 Mar 2023 22:05:20 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sat, 18 Mar 2023 22:05:19 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Sat, 18 Mar 2023 22:05:19 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: "tiwai@suse.de" <tiwai@suse.de>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "jwboyer@kernel.org"
	<jwboyer@kernel.org>
Subject: Re: [FIRMWARE] Regression on rtw89/rtw8852b_fw.bin by the latest update
Thread-Topic: [FIRMWARE] Regression on rtw89/rtw8852b_fw.bin by the latest
 update
Thread-Index: AQHZWW1XWbnmP+zm1kmF5YO7UZIcUa8ADB0A
Date: Sat, 18 Mar 2023 14:05:19 +0000
Message-ID: <00af66ce474c19ead83b9a507661a0f5993b5ad3.camel@realtek.com>
References: <878rfuo67a.wl-tiwai@suse.de>
In-Reply-To: <878rfuo67a.wl-tiwai@suse.de>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.16.16.31]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7946C6F06FE4547ADBC766D20EA5600@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

T24gU2F0LCAyMDIzLTAzLTE4IGF0IDA4OjQzICswMTAwLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
IA0KPiBIaSwNCj4gDQo+IHdlJ3ZlIHJlY2VpdmVkIGEgcmVncmVzc2lvbiByZXBvcnQgb24gb3Bl
blNVU0UgVHVtYmxld2VlZCBhYm91dCB0aGUNCj4gUmVhbHRlayBXaUZpLCBhbmQgdGhlIGN1bHBy
aXQgd2FzIHNwb3R0ZWQgdG8gYmUgdGhlIGxhdGVzdCBmaXJtd2FyZQ0KPiB1cGRhdGUgb2YgcnR3
ODkvcnR3ODg1MmJfZncuYmluLiAgVGhlIGZvcm1lciB3b3JraW5nIGxpbnV4LWZpcm13YXJlDQo+
IHRyZWUgd2FzIGF0IHRoZSBjb21taXQgNWMxMWEzNzQyOTQ3LCB3aGlsZSBicm9rZW4gYXQgNWJj
Mjc5ZmIxNjFkLg0KPiANCj4gVGhlIGRldGFpbHMgYXJlIGZvdW5kIGluOg0KPiAgIGh0dHBzOi8v
YnVnemlsbGEub3BlbnN1c2Uub3JnL3Nob3dfYnVnLmNnaT9pZD0xMjA5NDQ5DQo+IA0KPiBDb3Vs
ZCB5b3UgY2hlY2sgdGhlIHByb2JsZW0/DQo+IChPciBmZWVsIGZyZWUgdG8gam9pbiB0byB0aGUg
YnVnemlsbGEgZW50cnkgYWJvdmUuKQ0KPiANCj4gDQoNCkkgaGF2ZSBzZW50IGEgcHVsbC1yZXF1
ZXN0IFsxXSB0byByZXZlcnQgdGhlIGZpcm13YXJlIGFuZCBDYyB5b3UuDQoNClsxXSANCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWZpcm13YXJlLzg4OWYzZGI2Y2E0MDA4MDQ3NTk1ZjQz
OTIzODhhY2MxZjE2NWUwM2MuY2FtZWxAcmVhbHRlay5jb20vVC8jdQ0KDQpQaW5nLUtlDQoNCg==
