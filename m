Return-Path: <SRS0=6lg8=BI=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D634EC77B75
	for <linux-firmware@archiver.kernel.org>; Fri, 19 May 2023 06:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B619C433EF; Fri, 19 May 2023 06:03:15 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7714C433D2
	for <linux-firmware@kernel.org>; Fri, 19 May 2023 06:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7714C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34J62xVE2000744, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34J62xVE2000744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 19 May 2023 14:03:00 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 19 May 2023 14:03:09 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 19 May 2023 14:03:09 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Fri, 19 May 2023 14:03:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: pull request: rtw89: 8851b: add firmware v0.29.41.0
Thread-Topic: pull request: rtw89: 8851b: add firmware v0.29.41.0
Thread-Index: AQHZiheWm13H01Q550C4n/FZaKrdaw==
Date: Fri, 19 May 2023 06:03:09 +0000
Message-ID: <35e79df26e17bd38bfb074b71df47f40277b7510.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-ID: <E779E0FF782B2244B94C80D0BCFEE71B@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

SGksDQoNCkFkZCBpbml0aWFsIGZpcm13YXJlIG9mIHJ0dzg5IGRyaXZlciBmb3IgbmV3bHkgc3Vw
cG9ydGVkIGNoaXAgODg1MUJFLg0KDQpUaGFuayB5b3UNClBpbmctS2UNCg0KLS0tDQpUaGUgZm9s
bG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDYwMWMxODEzMTBlZDA0YmVjNzQ5NjFlNjVkMWQz
MTZhMTVlYjc1NGM6DQoNCiAgTWVyZ2UgaHR0cHM6Ly9naXRodWIuY29tL3Brc2hpaC9saW51eC1m
aXJtd2FyZSAoMjAyMy0wNS0xNyAwNzo0MTozMyAtMDQwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0
aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3Brc2hpaC9saW51
eC1maXJtd2FyZS5naXQgSEVBRA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gOWUw
MjAyNDFiODc5ZWIwMDM3YjFkZGQzNDBkNmE5ZWE3ZjdjNzkzMjoNCg0KICBydHc4OTogODg1MWI6
IGFkZCBmaXJtd2FyZSB2MC4yOS40MS4wICgyMDIzLTA1LTE5IDEzOjU3OjI3ICswODAwKQ0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQpQaW5nLUtlIFNoaWggKDEpOg0KICAgICAgcnR3ODk6IDg4NTFiOiBhZGQgZmlybXdh
cmUgdjAuMjkuNDEuMA0KDQogcnR3ODkvcnR3ODg1MWJfZncuYmluIHwgQmluIDAgLT4gMTA5MDU0
NCBieXRlcw0KIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0p
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJ0dzg5L3J0dzg4NTFiX2Z3LmJpbg0KDQo=
