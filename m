Return-Path: <SRS0=JEnZ=4M=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722F7C4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Dec 2022 14:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 290FDC433EF; Wed, 14 Dec 2022 14:01:23 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.kernel.org (Postfix) with ESMTP id 0B046C433F0
	for <linux-firmware@kernel.org>; Wed, 14 Dec 2022 14:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B046C433F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2BEE0RBt8010997, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2BEE0RBt8010997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 14 Dec 2022 22:00:27 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 14 Dec 2022 22:01:16 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 14 Dec 2022 22:01:16 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::15b5:fc4b:72f3:424b]) by
 RTEXMBS04.realtek.com.tw ([fe80::15b5:fc4b:72f3:424b%5]) with mapi id
 15.01.2375.007; Wed, 14 Dec 2022 22:01:16 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>
Subject: pull request: rtw89: 8852c: update fw to v0.27.56.9
Thread-Topic: pull request: rtw89: 8852c: update fw to v0.27.56.9
Thread-Index: AQHZD8SIR/Dk1apsNkuwxqUejT+OFg==
Date: Wed, 14 Dec 2022 14:01:15 +0000
Message-ID: <f3f5066578b088ee35dd7103a36bb6fc7c543ead.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.16.16.60]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzEyLzE0IOS4iuWNiCAxMDoyMDowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-ID: <70DAD0797F0584418AB3D5DD55C545FC@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled

SGksDQoNClVwZGF0ZSA4ODUyYyBmaXJtd2FyZSBvZiBydHc4OSBkcml2ZXIgdG8gMC4yNy41Ni45
DQoNClRoYW5rIHlvdQ0KUGluZy1LZQ0KDQotLS0NClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgZjNjMjgzZTE5OGQzZmI2OWY1MTgzYjhkZWE0ZmQzMmI4YzNjYmU3NjoNCg0KICBh
bWRncHU6IHVwZGF0ZWQgbmF2aTEwIGZpcm13YXJlIGZvciBhbWQtNS40ICgyMDIyLTEyLTE0IDA3
OjQyOjA1IC0wNTAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoN
Cg0KICBodHRwczovL2dpdGh1Yi5jb20vcGtzaGloL2xpbnV4LWZpcm13YXJlLmdpdCBIRUFEDQoN
CmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjOWMxOTU4M2Y3MTcyMTk2M2I0MzVmYzZi
YzlkMWVhYjQ5YzczYWQ0Og0KDQogIHJ0dzg5OiA4ODUyYzogdXBkYXRlIGZ3IHRvIHYwLjI3LjU2
LjkgKDIwMjItMTItMTQgMjE6NTU6NTggKzA4MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNoaW4tWWVuIExlZSAo
MSk6DQogICAgICBydHc4OTogODg1MmM6IHVwZGF0ZSBmdyB0byB2MC4yNy41Ni45DQoNClBpbmct
S2UgU2hpaCAoMSk6DQogICAgICBydHc4OTogODg1MmM6IHVwZGF0ZSBmdyB0byB2MC4yNy41Ni44
DQoNCiBydHc4OS9ydHc4ODUyY19mdy5iaW4gfCBCaW4gMTUxNjA0MCAtPiAxNTMyNjA4IGJ5dGVz
DQogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCg0KDQo=
