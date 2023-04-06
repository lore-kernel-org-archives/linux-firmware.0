Return-Path: <SRS0=cRnP=75=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2FAC76196
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Apr 2023 07:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16238C4339B; Thu,  6 Apr 2023 07:42:14 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB403C433EF
	for <linux-firmware@kernel.org>; Thu,  6 Apr 2023 07:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB403C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3367fn7tB005656, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3367fn7tB005656
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 6 Apr 2023 15:41:49 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 6 Apr 2023 15:42:09 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 6 Apr 2023 15:42:09 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02]) by
 RTEXMBS04.realtek.com.tw ([fe80::b4a2:2bcc:48d1:8b02%5]) with mapi id
 15.01.2375.007; Thu, 6 Apr 2023 15:42:08 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Timlee <timlee@realtek.com>,
        "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: pull request: rtw89: update firmware of 8852b and 8852c
Thread-Topic: pull request: rtw89: update firmware of 8852b and 8852c
Thread-Index: AQHZaFtKYkxwST97a0G0PKpVUG5xpg==
Date: Thu, 6 Apr 2023 07:42:08 +0000
Message-ID: <72e35b08661be39a97b12896c26496874418950d.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C0928E1CF4E8F4385B9E49374950CDB@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

SGksDQoNClVwZGF0ZSB0d28gZmlybXdhcmUgb2YgcnR3ODkgZHJpdmVyIC0tIDg4NTJiIHYwLjI5
LjI5LjEgYW5kIDg4NTJjIHYwLjI3LjU2LjEzLg0KDQpUaGFuayB5b3UNClBpbmctS2UNCg0KLS0t
DQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJlOTJhNDlmOTBmNzNjOGVkYzQ0
YjI1YzZlNjY5ZDVlNzA4OTNjOTA6DQoNCiAgbnZpZGlhOiB1cGRhdGUgVHUxMHggYW5kIFR1MTF4
IHNpZ25lZCBmaXJtd2FyZSB0byBzdXBwb3J0IG5ld2VyIFR1cmluZyBIVyAoMjAyMy0wNC0wNCAw
ODowMzo1Mw0KLTA0MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9wa3NoaWgvbGludXgtZmlybXdhcmUuZ2l0IEhFQUQN
Cg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDlmNzUwMmYxZGJiMTZhZWEyMTIyMDA0
ZGQ2MDdlMDNjYTZhNjJjMGI6DQoNCiAgcnR3ODk6IDg4NTJiOiB1cGRhdGUgZm9ybWF0LTEgZncg
dG8gdjAuMjkuMjkuMSAoMjAyMy0wNC0wNiAxNTozMjoxMiArMDgwMCkNCg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQ2hp
bi1ZZW4gTGVlICgxKToNCiAgICAgIHJ0dzg5OiA4ODUyYzogdXBkYXRlIGZ3IHRvIHYwLjI3LjU2
LjEzDQoNClBpbmctS2UgU2hpaCAoMSk6DQogICAgICBydHc4OTogODg1MmI6IHVwZGF0ZSBmb3Jt
YXQtMSBmdyB0byB2MC4yOS4yOS4xDQoNCiBydHc4OS9ydHc4ODUyYl9mdy0xLmJpbiB8IEJpbiAx
MTg4NDg4IC0+IDExODQ5OTIgYnl0ZXMNCiBydHc4OS9ydHc4ODUyY19mdy5iaW4gICB8IEJpbiAx
NTMyNjU2IC0+IDE1MzI3MzYgYnl0ZXMNCiAyIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygr
KSwgMCBkZWxldGlvbnMoLSkNCg0K
