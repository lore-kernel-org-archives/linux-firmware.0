Return-Path: <SRS0=aCa0=7Q=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEF8C6FD20
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Mar 2023 11:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E100C433D2; Fri, 24 Mar 2023 11:31:20 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B5A5C433EF
	for <linux-firmware@kernel.org>; Fri, 24 Mar 2023 11:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B5A5C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 32OBUssV6010541, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 32OBUssV6010541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 24 Mar 2023 19:30:54 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 24 Mar 2023 19:31:09 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 24 Mar 2023 19:31:09 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Fri, 24 Mar 2023 19:31:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "Bernie
 Huang" <phhuang@realtek.com>
Subject: pull request: rtw88: 8822c: Update normal firmware to v9.9.15
Thread-Topic: pull request: rtw88: 8822c: Update normal firmware to v9.9.15
Thread-Index: AQHZXkQg4BVPI2F8DkqQ1aXRQNZG/w==
Date: Fri, 24 Mar 2023 11:31:08 +0000
Message-ID: <b02dace035e2b58686f8c7f449be6be3f32a6485.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.16.18.182]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzMvMjQg5LiK5Y2IIDA5OjM1OjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB6B81FB31EDBA4DA6327ECBFA79BCBE@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

SGksDQoNClVwZGF0ZSA4ODIyYyBmaXJtd2FyZSBvZiBydHc4OCBkcml2ZXIgdG8gdjkuOS4xNQ0K
DQpUaGFuayB5b3UNClBpbmctS2UNCg0KLS0tDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0IGJjZGNmYmNmMGE4ZjI0YTkxNGI4YzE2MzkwNmU2Y2U5M2Q3Zjg4OTc6DQoNCiAgbGlu
dXgtZmlybXdhcmU6IFVwZGF0ZSBmaXJtd2FyZSBmaWxlIGZvciBJbnRlbCBCbHVldG9vdGggQVgx
MDEgKDIwMjMtMDMtMjAgMDg6MzQ6MjcgLTA0MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9wa3NoaWgvbGludXgtZmly
bXdhcmUuZ2l0IEhFQUQNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGU0MGE1YjYz
MjQzZGJjMGE3NzU0M2QzOTc1NjU4ZmQ2NjhlZjI1ODY6DQoNCiAgcnR3ODg6IDg4MjJjOiBVcGRh
dGUgbm9ybWFsIGZpcm13YXJlIHRvIHY5LjkuMTUgKDIwMjMtMDMtMjQgMTk6MjY6NTcgKzA4MDAp
DQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NClBvLUhhbyBIdWFuZyAoMSk6DQogICAgICBydHc4ODogODgyMmM6IFVwZGF0
ZSBub3JtYWwgZmlybXdhcmUgdG8gdjkuOS4xNQ0KDQogcnR3ODgvcnR3ODgyMmNfZncuYmluIHwg
QmluIDIwMjU1MiAtPiAyMDI2MDAgYnl0ZXMNCiAxIGZpbGUgY2hhbmdlZCwgMCBpbnNlcnRpb25z
KCspLCAwIGRlbGV0aW9ucygtKQ0KDQo=
