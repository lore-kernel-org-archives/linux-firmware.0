Return-Path: <SRS0=+Jyk=PH=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006A0C3DA7F
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Aug 2024 01:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9FBBC4AF0D; Thu,  8 Aug 2024 01:53:23 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3E09C32781
	for <linux-firmware@kernel.org>; Thu,  8 Aug 2024 01:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3E09C32781
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4781rIDO13068544, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1723081998; bh=JL1bGUge+vhrVgHODA4oBNYyg1NLikci1SCOnTS51aA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version;
	b=fTUXY9eMrlaXNt7dQMyWLJnngZgaxnH/TGdYoIehetcKWFNageqL6fz3I9Fl5jlCO
	 MPdx4FDhfqIUVRZ5OBUk/cpmz6iwRJfZlqPiM4VbqEw3YlC81ohK0H1O9UVaWYYXUo
	 fYGOIuZgUoTtG/g+oP8M3DcVIbiGakUlqZZMAthdSXiPzGyAojThoT0EkUXJ29Mf7u
	 Vuc0lfV9eZB445WaboaRGERvq6spzWUdFdvx+oC36iJGVT/aTD23UFzAdATEOvFuQ5
	 vr4rCOC74aOappLq0YDihkjhxE59R4g/hR11fHysCj7G2qcB1zfBFSbiRKnpYe2bv6
	 9c3KvnqZom7TA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 4781rIDO13068544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Aug 2024 09:53:18 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 09:53:18 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Aug 2024 09:53:17 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7]) by
 RTEXMBS04.realtek.com.tw ([fe80::1a1:9ae3:e313:52e7%5]) with mapi id
 15.01.2507.035; Thu, 8 Aug 2024 09:53:17 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>, Damon Chen <damon.chen@realtek.com>
Subject: pull request: rtw89: add firmware of 8852bt v0.29.91.0 and 8852c v0.27.97.0
Thread-Topic: pull request: rtw89: add firmware of 8852bt v0.29.91.0 and 8852c
 v0.27.97.0
Thread-Index: AQHa6TW9GPTFBqhxLkquYaCEUDoxmQ==
Date: Thu, 8 Aug 2024 01:53:17 +0000
Message-ID: <f6b548ef4c1a2404dc1f7a497c24a82c9247a3bd.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F2B3AEE2B0CD54ABC34CF549919CFD5@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGksDQoNCkFkZCBSVEw4ODUyQlQgYW5kIFJUTDg4NTJDLTEgZmlybXdhcmUgb2YgcnR3ODkgZHJp
dmVyLg0KDQpUaGFuayB5b3UNClBpbmctS2UNCg0KLS0tDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMg
c2luY2UgY29tbWl0IGUxMzFhNDM3MDUwMzYwYmYzMWIwYWQ3YjY5NjY3NDMyOTQ3YWNiYWI6DQoN
CiAgTWVyZ2UgYnJhbmNoICdpbnRlbC0yMDI0MDgwNScgaW50byAnbWFpbicgKDIwMjQtMDgtMDUg
MTE6NDE6MTQgKzAwMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0
Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9wa3NoaWgvbGludXgtZmlybXdhcmUuZ2l0IHRhZ3Mv
cnR3LWZ3LTIwMjQtMDgtMDgNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDFhMGNi
ZWI3NTM3MmUwNDc5MjBiYjE3YmExMmExZDVmOGNhNTkwNjY6DQoNCiAgcnR3ODk6IDg4NTJjOiBh
ZGQgZncgZm9ybWF0LTEgdjAuMjcuOTcuMCAoMjAyNC0wOC0wOCAwOTo0MDo0MCArMDgwMCkNCg0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KQ2hpbi1ZZW4gTGVlICgxKToNCiAgICAgIHJ0dzg5OiA4ODUyYzogYWRkIGZ3IGZv
cm1hdC0xIHYwLjI3Ljk3LjANCg0KUGluZy1LZSBTaGloICgxKToNCiAgICAgIHJ0dzg5OiA4ODUy
YnQ6IGFkZCBmaXJtd2FyZSAwLjI5LjkxLjANCg0KIFdIRU5DRSAgICAgICAgICAgICAgICAgIHwg
ICA0ICsrKy0NCiBydHc4OS9ydHc4ODUyYnRfZncuYmluICB8IEJpbiAwIC0+IDg5NzUxMiBieXRl
cw0KIHJ0dzg5L3J0dzg4NTJjX2Z3LTEuYmluIHwgQmluIDAgLT4gMjE4MDYxNiBieXRlcw0KIDMg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHJ0dzg5L3J0dzg4NTJidF9mdy5iaW4NCiBjcmVhdGUgbW9kZSAxMDA2NDQgcnR3
ODkvcnR3ODg1MmNfZnctMS5iaW4NCg0K
