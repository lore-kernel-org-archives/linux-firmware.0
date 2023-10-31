Return-Path: <SRS0=ddDb=GN=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1CEC4332F
	for <linux-firmware@archiver.kernel.org>; Tue, 31 Oct 2023 03:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86733C433CA; Tue, 31 Oct 2023 03:34:24 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47C41C433C7
	for <linux-firmware@kernel.org>; Tue, 31 Oct 2023 03:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47C41C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 39V3YH0c83811872, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 39V3YH0c83811872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Oct 2023 11:34:17 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Oct 2023 11:34:01 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 31 Oct 2023 11:34:00 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7]) by
 RTEXMBS04.realtek.com.tw ([fe80::40c2:6c24:2df4:e6c7%5]) with mapi id
 15.01.2375.007; Tue, 31 Oct 2023 11:34:00 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>
Subject: pull request: rtw89: update 8851b/8852b fw to v0.29.41.3/v0.29.29.5
Thread-Topic: pull request: rtw89: update 8851b/8852b fw to
 v0.29.41.3/v0.29.29.5
Thread-Index: AQHaC6sWZ2TJa7f/CUK1ZfMxc4xrCQ==
Date: Tue, 31 Oct 2023 03:34:00 +0000
Message-ID: <baed3fc347269c3dd34244f34946e09dff183825.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.21.69.94]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-ID: <50EA596FC2BB314B8BA4C9BFA4191EEC@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

SGksDQoNClVwZGF0ZSA4ODUxYi84ODUyYiBmaXJtd2FyZSBvZiBydHc4OSBkcml2ZXIgdG8gdjAu
MjkuNDEuMy92MC4yOS4yOS41Lg0KVGhpcyBpcyBtYWlubHkgdG8gZml4IEJULWNvZXhpc3RlbmNl
IGlzc3VlIHRoYXQgY2F1c2VzIEJUIHdvcmtzIGltcHJvcGVybHkNCndoZW4gV2lGaSBlbnRlcnMg
cG93ZXIgc2F2aW5nIG1vZGUuDQoNClRoYW5rIHlvdQ0KUGluZy1LZQ0KDQotLS0NClRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMmIzMDRiZmVjYjI3NGQ1M2YzOGI2NzZkODViNDNi
Y2I4M2RiMzBkZDoNCg0KICBNZXJnZSBicmFuY2ggJ21haW4nIGludG8gJ21haW4nICgyMDIzLTEw
LTMwIDExOjIwOjEzICswMDAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vcGtzaGloL2xpbnV4LWZpcm13YXJlLmdpdCBI
RUFEDQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAyYWZkMTQyM2U0NzY1ZWI2OTE3
MTFlYTVlNzhhMTk4NTNjYjJmNmViOg0KDQogIHJ0dzg5OiA4ODUyYjogdXBkYXRlIGZ3IHRvIHYw
LjI5LjI5LjUgKDIwMjMtMTAtMzEgMTE6MjY6MTYgKzA4MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkNoaW4tWWVu
IExlZSAoMyk6DQogICAgICBydHc4OTogODg1MWI6IHVwZGF0ZSBmdyB0byB2MC4yOS40MS4zDQog
ICAgICBydHc4OTogODg1MmI6IHVwZGF0ZSBmdyB0byB2MC4yOS4yOS40DQogICAgICBydHc4OTog
ODg1MmI6IHVwZGF0ZSBmdyB0byB2MC4yOS4yOS41DQoNCiBydHc4OS9ydHc4ODUxYl9mdy5iaW4g
ICB8IEJpbiAxMTYwOTg0IC0+IDExNjIwMjQgYnl0ZXMNCiBydHc4OS9ydHc4ODUyYl9mdy0xLmJp
biB8IEJpbiAxMjM3NzA0IC0+IDEyNDI4MDggYnl0ZXMNCiAyIGZpbGVzIGNoYW5nZWQsIDAgaW5z
ZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCg0K
