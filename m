Return-Path: <SRS0=y91N=RN=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ABED2F7D7
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Oct 2024 00:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71C1CC4CECF; Thu, 17 Oct 2024 00:36:17 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 985E5C4CEC5;
	Thu, 17 Oct 2024 00:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 985E5C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 49H0a43k93784787, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1729125364; bh=zVO3Jd4vumkKOtjug0IN3GIl2UmtycEBJ1zshKSOt4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=TOFpWxhWdvQUCr0rB2MqCsbLrAK2NhNYeOPgoS2Kk4G5uVGiGibNJHEXBpzZRXdq0
	 ldjsli0W8EDTyNLXP7IDMg+PVtbIe2Nsrjwr+dLwU6AaN7pie4Wb8ZUqRoOZ1NV8iR
	 avxY430E7Ck2V/BWrSPZT/faOnK2aVs8a3MPkH++nOjCc4Pmo4vlt75mnj1I/lmXzd
	 5hJH9sQHbApnILsX9ZTX4cMXf7PZwXlH+dSHIPHmbuijYDxOM417gA/6O97GGAcXCJ
	 gAP+HRmMicmJeve23yGQfU4zJU7Fd/S94o881pxmsCGoMccYKrmTR6y3GqFvdwlEC6
	 a54GZNWTgX3rg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 49H0a43k93784787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Oct 2024 08:36:04 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 08:36:05 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 17 Oct 2024 08:36:04 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Thu, 17 Oct 2024 08:36:04 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Josh Boyer <jwboyer@kernel.org>, Zenm Chen <zenmchen@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: RE: [PATCH] rtlwifi: Update firmware for RTL8192FU to v7.3
Thread-Topic: [PATCH] rtlwifi: Update firmware for RTL8192FU to v7.3
Thread-Index: AQHbH8UzsWb2UM8CAkOhONa+QCMpobKI1AwAgAFEFtA=
Date: Thu, 17 Oct 2024 00:36:04 +0000
Message-ID: <8f3ebe73a46e4bf3b1b9eeb74bbc305a@realtek.com>
References: <20241016121544.5557-1-zenmchen@gmail.com>
 <CA+5PVA6gOcu611LcLzv47ZPwe-AtUb+GN2K-zK_84eMfk7Yc6A@mail.gmail.com>
In-Reply-To: <CA+5PVA6gOcu611LcLzv47ZPwe-AtUb+GN2K-zK_84eMfk7Yc6A@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

Sm9zaCBCb3llciA8andib3llckBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IFBpbmctS2UsIGNh
biB3ZSBnZXQgYW4gQWNrZWQtYnkgZm9yIHRoaXM/DQo+IA0KDQpDb25maXJtZWQgd2l0aCByZWxl
YXNlZCBwYWNrYWdlLCBzbw0KDQpBY2tlZC1ieTogUGluZy1LZSBTaGloIDxwa3NoaWhAcmVhbHRl
ay5jb20+DQoNCkJ5IHRoZSB3YXksIGl0IHNlZW1zIHlvdSBtaXNzZWQgYSBwdWxsLXJlcXVlc3Qg
WzFdIGRheXMgYWdvLg0KSWYgbm90LCBzb3JyeSBmb3IgdGhlIHBpbmcuDQoNClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1maXJtd2FyZS8yZTJlN2VhYzg2ZGI0NWU4YTE5ODAwMjFj
N2EzOTgzZEByZWFsdGVrLmNvbS9ULyN1DQoNCg0KDQo=
