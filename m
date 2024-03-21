Return-Path: <SRS0=Vin6=K3=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF49C54E58
	for <linux-firmware@archiver.kernel.org>; Thu, 21 Mar 2024 03:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 87483C43390; Thu, 21 Mar 2024 03:23:39 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7E39C433F1
	for <linux-firmware@kernel.org>; Thu, 21 Mar 2024 03:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7E39C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 42L3NMUw8854128, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 42L3NMUw8854128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Mar 2024 11:23:22 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 11:23:23 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 11:23:22 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::4c42:f80:bcc2:d00f]) by
 RTEXMBS04.realtek.com.tw ([fe80::4c42:f80:bcc2:d00f%5]) with mapi id
 15.01.2507.035; Thu, 21 Mar 2024 11:23:22 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>,
        "fiona.klute@gmx.de" <fiona.klute@gmx.de>
Subject: pull request: rtw: update/add firmware of Realtek WiFi 8703B, 8852C and 8922A
Thread-Topic: pull request: rtw: update/add firmware of Realtek WiFi 8703B,
 8852C and 8922A
Thread-Index: AQHaez8gfXswwKPojk2NYPBw/+RTQg==
Date: Thu, 21 Mar 2024 03:23:22 +0000
Message-ID: <063c9937acb36ccf352056d212a9a2733abb9dd5.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.21.69.94]
Content-Type: text/plain; charset="utf-8"
Content-ID: <276027C930F13F42896FC5AA023AC95F@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGksDQoNCkFkZC91cGRhdGUgdGhyZWUgZmlybXdhcmUgaW5jbHVkaW5nIA0KDQogLSBhZGQgaW5p
dGlhbCBmaXJtd2FyZSB2MTEuMC4wIGZvciA4NzAzDQogLSB1cGRhdGUgODg1MkMgdG8gdjAuMjcu
NTYuMTQNCiAtIGFkZCBpbml0aWFsIGZpcm13YXJlIHYwLjM1LjE4LjAgZm9yIDg5MjJBDQoNClRo
YW5rIHlvdQ0KUGluZy1LZQ0KDQotLS0NClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21t
aXQgMjJlZTFkOGNhNjY2M2NhN2MyODQ3NzU4MTk5M2Q2ZWQ1Y2M1NDMyMzoNCg0KICBNZXJnZSBi
cmFuY2ggJ3JvYm90L3ByLTAtMTcxMDg2MTE2NCcgaW50byAnbWFpbicgKDIwMjQtMDMtMTkgMTk6
MDc6MTQgKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0K
DQogIGh0dHBzOi8vZ2l0aHViLmNvbS9wa3NoaWgvbGludXgtZmlybXdhcmUuZ2l0IEhFQUQNCg0K
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDA4MjU5ZTdmMTdmNTUzZDVmOTg1YTUzMGY4
MjVhYzhhZDZmNDg0NTA6DQoNCiAgcnR3ODk6IDg4NTJjOiB1cGRhdGUgZncgdG8gdjAuMjcuNTYu
MTQgKDIwMjQtMDMtMjEgMTE6MDI6MzIgKzA4MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNoaW4tWWVuIExlZSAo
MSk6DQogICAgICBydHc4OTogODg1MmM6IHVwZGF0ZSBmdyB0byB2MC4yNy41Ni4xNA0KDQpGaW9u
YSBLbHV0ZSAoMSk6DQogICAgICBydHc4ODogQWRkIFJUTDg3MDNCIGZpcm13YXJlIHYxMS4wLjAN
Cg0KUGluZy1LZSBTaGloICgxKToNCiAgICAgIHJ0dzg5OiA4OTIyYTogYWRkIGZpcm13YXJlIHYw
LjM1LjE4LjANCg0KIFdIRU5DRSAgICAgICAgICAgICAgICAgICAgfCAgMTIgKysrKysrKysrLS0t
DQogcnR3ODgvUkVBRE1FICAgICAgICAgICAgICB8ICAgMyArKysNCiBydHc4OC9ydHc4NzAzYl9m
dy5iaW4gICAgIHwgQmluIDAgLT4gMjAyOTAgYnl0ZXMNCiBydHc4OC9ydHc4NzAzYl93b3dfZncu
YmluIHwgQmluIDAgLT4gMjMwNzQgYnl0ZXMNCiBydHc4OS9ydHc4ODUyY19mdy5iaW4gICAgIHwg
QmluIDE1MzI3MzYgLT4gMTUzMjY1NiBieXRlcw0KIHJ0dzg5L3J0dzg5MjJhX2Z3LmJpbiAgICAg
fCBCaW4gMCAtPiAxNTM3NjkwIGJ5dGVzDQogNiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBydHc4OC9ydHc4NzAzYl9m
dy5iaW4NCiBjcmVhdGUgbW9kZSAxMDA2NDQgcnR3ODgvcnR3ODcwM2Jfd293X2Z3LmJpbg0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBydHc4OS9ydHc4OTIyYV9mdy5iaW4NCg0K
