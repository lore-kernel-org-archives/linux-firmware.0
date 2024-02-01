Return-Path: <SRS0=lPTi=JK=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4DFC48291
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Feb 2024 14:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00733C43390; Thu,  1 Feb 2024 14:30:23 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66E6CC433F1
	for <linux-firmware@kernel.org>; Thu,  1 Feb 2024 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66E6CC433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 411EUGCX01577703, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 411EUGCX01577703
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Feb 2024 22:30:16 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.17; Thu, 1 Feb 2024 22:30:16 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 22:30:13 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::c9b7:82a9:7e98:fa7f]) by
 RTEXMBS04.realtek.com.tw ([fe80::c9b7:82a9:7e98:fa7f%7]) with mapi id
 15.01.2507.035; Thu, 1 Feb 2024 22:30:13 +0800
From: Hau <hau@realtek.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Linux Firmware <linux-firmware@kernel.org>,
        nic_swsd
	<nic_swsd@realtek.com>
Subject: RE: [PATCH] rtl_nic: add firmware for RTL8126A
Thread-Topic: [PATCH] rtl_nic: add firmware for RTL8126A
Thread-Index: AQHaVRpSCvOD9aa1lkCB21/Kp6kNqrD1BL8AgACGXtA=
Date: Thu, 1 Feb 2024 14:30:13 +0000
Message-ID: <a7367e1b27064656860c8faaca6fad0c@realtek.com>
References: <62adc40d-fd8e-4a5e-9671-8a42260fc81c@gmail.com>
 <91d0c882-0ad5-4f25-a95b-bdbcf3f699ed@gmail.com>
In-Reply-To: <91d0c882-0ad5-4f25-a95b-bdbcf3f699ed@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
x-originating-ip: [172.22.228.56]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

PiBPbiAwMS4wMi4yMDI0IDE1OjI0LCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+ID4gUmVhbHRl
ayBwcm92aWRlZCBhIGZpcm13YXJlIGZpbGUgZm9yIG5ldyBjaGlwIHZlcnNpb24gUlRMODEyNkEu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21h
aWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBXSEVOQ0UgICAgICAgICAgICAgICAgfCAgIDMgKysrDQo+
ID4gIHJ0bF9uaWMvcnRsODEyNmEtMi5mdyB8IEJpbiAwIC0+IDI5MjQ4IGJ5dGVzDQo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBy
dGxfbmljL3J0bDgxMjZhLTIuZncNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9XSEVOQ0UgYi9XSEVO
Q0UNCj4gPiBpbmRleCA5OTYzMmJiLi4yMTEyMDJjIDEwMDY0NA0KPiA+IC0tLSBhL1dIRU5DRQ0K
PiA+ICsrKyBiL1dIRU5DRQ0KPiA+IEBAIC0zMzU2LDYgKzMzNTYsOSBAQCBWZXJzaW9uOiAwLjAu
Mg0KPiA+ICBGaWxlOiBydGxfbmljL3J0bDgxMjViLTIuZncNCj4gPiAgVmVyc2lvbjogMC4wLjIN
Cj4gPg0KPiA+ICtGaWxlOiBydGxfbmljL3J0bDgxMjZhLTIuZncNCj4gPiArVmVyc2lvbjogMC4w
LjINCj4gPiArDQo+IA0KPiBIaSBIYXUsDQo+IA0KPiBjb3VsZCB5b3UgcGxlYXNlIHJlc3BvbmQg
d2l0aCB5b3VyIFJldmlld2VkLWJ5Pw0KPiANClJldmlld2VkLWJ5OiBDaHVuLUhhbyBMaW4gPGhh
dUByZWFsdGVrLmNvbT4NCg==
