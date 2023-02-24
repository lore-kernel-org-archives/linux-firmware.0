Return-Path: <SRS0=6lOY=6U=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB1EC64ED8
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Feb 2023 08:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07F3EC433EF; Fri, 24 Feb 2023 08:28:08 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D02BC433D2
	for <linux-firmware@kernel.org>; Fri, 24 Feb 2023 08:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D02BC433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31O8RvVA2018605, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31O8RvVA2018605
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 24 Feb 2023 16:27:57 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 24 Feb 2023 16:28:02 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 24 Feb 2023 16:28:02 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Fri, 24 Feb 2023 16:28:02 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: pull request: rtw89: 8852b: update fw to v0.29.29.0
Thread-Topic: pull request: rtw89: 8852b: update fw to v0.29.29.0
Thread-Index: AQHZSCnoNW+4nSQCD0qAnnB+UYTKmA==
Date: Fri, 24 Feb 2023 08:28:02 +0000
Message-ID: <98579f05de72dae9d826268e731a0ca2bcfb5e88.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzIvMjQg5LiK5Y2IIDAxOjEyOjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AA3094796C4BA49A407C4DD7A52BC4A@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGksDQoNClVwZGF0ZSA4ODUyYiBmaXJtd2FyZSBvZiBydHc4OSBkcml2ZXIgdG8gMC4yOS4yOS4w
DQoNClRoYW5rIHlvdQ0KUGluZy1LZQ0KDQotLS0NClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgODNmMWQ3NzgxMzAwYjUyNzg1YzA2MmE4Mjg1ZGE1OTA0MmMwZDFmZjoNCg0KICBN
ZXJnZSBicmFuY2ggJ2F0aDEway0yMDIzMDIxNScgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2t2YWxvL2xpbnV4LQ0KZmlybXdhcmUgKDIwMjMtMDItMTUg
MTQ6Mjc6MDMgLTA1MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9wa3NoaWgvbGludXgtZmlybXdhcmUuZ2l0IEhFQUQN
Cg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDczNzViY2ZmM2ZmZDliYTBjMTRjOWJk
ZmYzM2Y2ZDUyNzYwN2UyNmI6DQoNCiAgcnR3ODk6IDg4NTJiOiB1cGRhdGUgZncgdG8gdjAuMjku
MjkuMCAoMjAyMy0wMi0yNCAxNjoyMzozMyArMDgwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KUGluZy1LZSBTaGlo
ICgyKToNCiAgICAgIHJ0dzg5OiA4ODUyYjogdXBkYXRlIGZ3IHRvIHYwLjI5LjI2LjANCiAgICAg
IHJ0dzg5OiA4ODUyYjogdXBkYXRlIGZ3IHRvIHYwLjI5LjI5LjANCg0KIHJ0dzg5L3J0dzg4NTJi
X2Z3LmJpbiB8IEJpbiAxMDM1MjMyIC0+IDExODg0ODggYnl0ZXMNCiAxIGZpbGUgY2hhbmdlZCwg
MCBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KDQoNCg==
