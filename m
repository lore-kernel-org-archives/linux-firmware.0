Return-Path: <SRS0=7AAG=PZ=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B5CC5321D
	for <linux-firmware@archiver.kernel.org>; Mon, 26 Aug 2024 09:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B654C4FE14; Mon, 26 Aug 2024 09:15:56 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFDAFC4FE86
	for <linux-firmware@kernel.org>; Mon, 26 Aug 2024 09:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFDAFC4FE86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47Q9FnZ023835024, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1724663749; bh=aGnEOPyTMJ53HZRp+PKrxy6tGI+Yrk+UCCHo8Tzocqk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version;
	b=MSRrRMOr07cis+zdzpMIif0jvxtRVReebWuOnoxIN5CQLIHLnfa06cfnEkBY9blfE
	 KbFkOSGq6XXyihQ0tdS132vOKY8NGEaFjxTYEYXs7O5lS3ybzp7PSp+E2lMllFQXFD
	 zFZY3rx1Tih2lWMSBrlKez42qycAPDlpfWGXN0QwVGOyuG1G1XuZYd+Vf2cl+rBbHg
	 z7D70zBZGO1ShSjkGv/uCR0nuoFbCJEL609luQ6EPUDVSqZoyIwZeLJUNfXC6NwAZi
	 1rRrjAjWu8TeLVkgcTTIYkLgB/C2dZAb6L4nXoVJGnLYRT1HWVmI3uStg5iPzHX+8f
	 4d6IwWXM8XeZg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47Q9FnZ023835024
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2024 17:15:49 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 17:15:50 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Aug 2024 17:15:49 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Mon, 26 Aug 2024 17:15:49 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>
Subject: pull request: rtw89: 8922a: add fw format-1 v0.35.41.0
Thread-Topic: pull request: rtw89: 8922a: add fw format-1 v0.35.41.0
Thread-Index: AQHa95iKKucNNGeuZkaQj3P1dSVrJw==
Date: Mon, 26 Aug 2024 09:15:49 +0000
Message-ID: <f5079de6ec52bbd97fd0deaf2df58f8b13e364b7.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF9470385B7A8646902366DC144292F6@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGksDQoNCkFkZCBmaXJtd2FyZSB2MC4zNS40MS4wIG9mIHJ0dzg5IGRyaXZlciBmb3IgODkyMkEu
DQoNClRoYW5rIHlvdQ0KUGluZy1LZQ0KDQotLS0NClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgMmNkYzExYTdiM2JmMDYwNDJmMWZiMTc5ZmExNzc1ZmRlMzgxNDkxZjoNCg0KICBN
ZXJnZSBicmFuY2ggJ210NzkyNScgaW50byAnbWFpbicgKDIwMjQtMDgtMjMgMTE6MzE6MDkgKzAw
MDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBz
Oi8vZ2l0aHViLmNvbS9wa3NoaWgvbGludXgtZmlybXdhcmUuZ2l0IHRhZ3MvcnR3LWZ3LTIwMjQt
MDgtMjYNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDgwZmEzM2I5NGE5MWExZTQ1
NjcxZThmY2Q4ZTgwYjllZmVkNDc4MzQ6DQoNCiAgcnR3ODk6IDg5MjJhOiBhZGQgZncgZm9ybWF0
LTEgdjAuMzUuNDEuMCAoMjAyNC0wOC0yNiAxNzowODowMCArMDgwMCkNCg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQ2hp
bi1ZZW4gTGVlICgxKToNCiAgICAgIHJ0dzg5OiA4OTIyYTogYWRkIGZ3IGZvcm1hdC0xIHYwLjM1
LjQxLjANCg0KIFdIRU5DRSAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBydHc4OS9ydHc4OTIy
YV9mdy0xLmJpbiB8IEJpbiAwIC0+IDE1ODM0MzQgYnl0ZXMNCiAyIGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJ0dzg5L3J0dzg5MjJhX2Z3LTEuYmlu
DQoNCg==
