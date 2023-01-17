Return-Path: <SRS0=x3Hz=5O=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933FFC3DA78
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Jan 2023 12:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FC9AC43392; Tue, 17 Jan 2023 12:04:01 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.kernel.org (Postfix) with ESMTP id 401AAC433D2
	for <linux-firmware@kernel.org>; Tue, 17 Jan 2023 12:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 401AAC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 30HC3tj86022689, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 30HC3tj86022689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Tue, 17 Jan 2023 20:03:55 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Tue, 17 Jan 2023 20:03:56 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 17 Jan 2023 20:03:56 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::15b5:fc4b:72f3:424b]) by
 RTEXMBS04.realtek.com.tw ([fe80::15b5:fc4b:72f3:424b%5]) with mapi id
 15.01.2375.007; Tue, 17 Jan 2023 20:03:56 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: pull request: rtw89: 8852c: update fw to v0.27.56.10
Thread-Topic: pull request: rtw89: 8852c: update fw to v0.27.56.10
Thread-Index: AQHZKmvGYPnKs/cPfUmuD8EDLzC3xA==
Date: Tue, 17 Jan 2023 12:03:56 +0000
Message-ID: <b00c91825affe825a7411391a10135bec0354664.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.16.17.65]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzEvMTcg5LiK5Y2IIDEwOjU3OjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-ID: <484609BDE03E1744BDBA08E14B0F7868@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGksDQoNClVwZGF0ZSA4ODUyYyBmaXJtd2FyZSBvZiBydHc4OSBkcml2ZXIgdG8gdjAuMjcuNTYu
MTANCg0KVGhhbmsgeW91DQpQaW5nLUtlDQoNCi0tLQ0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCBhMWFkMWQ1YjUwNjI2ZjJkMTI2YWRmMTk2NGNlMGU5OGNiYjhiMzlkOg0KDQog
IGFtZGdwdTogYWRkIFZDTjQuMC40IGZpcm13YXJlIGZyb20gYW1kLTUuNCAoMjAyMy0wMS0xMCAx
MDowODo0MCAtMDUwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3Brc2hpaC9saW51eC1maXJtd2FyZS5naXQgSEVBRA0K
DQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZmM1YTI1ZmEwMjJjN2UyOGVjZmMyY2Vk
NGVhMzA5YWQ2MWNhMTQyZToNCg0KICBydHc4OTogODg1MmM6IHVwZGF0ZSBmdyB0byB2MC4yNy41
Ni4xMCAoMjAyMy0wMS0xNyAxOTo1Nzo0MyArMDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KUGluZy1LZSBTaGlo
ICgxKToNCiAgICAgIHJ0dzg5OiA4ODUyYzogdXBkYXRlIGZ3IHRvIHYwLjI3LjU2LjEwDQoNCiBy
dHc4OS9ydHc4ODUyY19mdy5iaW4gfCBCaW4gMTUzMjYwOCAtPiAxNTMyNjU2IGJ5dGVzDQogMSBm
aWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCg0KDQo=
