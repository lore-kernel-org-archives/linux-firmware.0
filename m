Return-Path: <SRS0=EIid=P5=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1081ECA0EF9
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Aug 2024 09:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB6A0C4CEC4; Fri, 30 Aug 2024 09:23:09 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93F70C4CEC2
	for <linux-firmware@kernel.org>; Fri, 30 Aug 2024 09:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93F70C4CEC2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 47U9N1X20517055, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1725009781; bh=XJ02Br4nRTNzta3Tlqc1kYhLN2rChP4rPVAifw/hrtg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ewS4fl3WRFUQbq0gpTmWd7lMyn72llbjXnEM7+crBHCTLBlY+Il1kJij6C/Vvhimx
	 jV3p3D6zcMJUdDrBxsHrw9De1s11ugpTCaA1As6Rg7+gb2tWHHgI76NbK80mUW3+S2
	 euUx6WEb9N+0qwB3BJbjut3yWWMYiLDXHdFdlJB92Fv2ZEYlMBBg/1D6kA6I+LlMxy
	 Z4hmi10R1DJUohasKS/gUkJJ/3FEwuC7yZgMt0WNWZussBy2OLb2Ng+FZy4TP8yu4Q
	 KczGFRWCwcaDq1yqkjUvWilezWFy/8EC9OsTUNBPHTbSQFmHtz8EfX0hQuxijIX1oR
	 dbfRbCa83tWGQ==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.02/5.92) with ESMTPS id 47U9N1X20517055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Aug 2024 17:23:01 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 17:23:01 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 30 Aug 2024 17:23:01 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Fri, 30 Aug 2024 17:23:01 +0800
From: Hau <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>,
        nic_swsd <nic_swsd@realtek.com>
Subject: RE: [PATCH] rtl_nic: add firmware rtl8126a-3
Thread-Topic: [PATCH] rtl_nic: add firmware rtl8126a-3
Thread-Index: AQHa+qez/1Wd7fqEXUeKWzA2/PTA2LI+6UwAgACdmuA=
Date: Fri, 30 Aug 2024 09:23:00 +0000
Message-ID: <3a01675f33914bd6a779b51e271b5895@realtek.com>
References: <20240830064151.12520-1-hau@realtek.com>
 <78f2b8fc-d6c0-447e-87f1-d8e4e3174bd8@gmail.com>
In-Reply-To: <78f2b8fc-d6c0-447e-87f1-d8e4e3174bd8@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

PiANCj4gT24gMzAuMDguMjAyNCAwODo0MSwgQ2h1bkhhbyBMaW4gd3JvdGU6DQo+ID4gVGhpcyBh
ZGRzIGZpcm13YXJlIHJ0bDgxMjZhLTMgZm9yIFJUTDgxMjZBIHJldi5iLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogQ2h1bkhhbyBMaW4gPGhhdUByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAg
cnRsX25pYy9ydGw4MTI2YS0zLmZ3IHwgQmluIDAgLT4gMTMyMzIgYnl0ZXMNCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEw
MDY0NA0KPiA+IHJ0bF9uaWMvcnRsODEyNmEtMy5mdw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3J0
bF9uaWMvcnRsODEyNmEtMy5mdyBiL3J0bF9uaWMvcnRsODEyNmEtMy5mdyBuZXcgZmlsZQ0KPiA+
IG1vZGUgMTAwNjQ0DQo+IA0KPiBIaSBIYXUsDQo+IA0KPiB0aGUgV0hFTkNFIGZpbGUgaW4gdGhl
IHJvb3QgZGlyZWN0b3J5IG5lZWRzIHRvIGJlIHVwZGF0ZWQgYXMgd2VsbC4NCg0KSSB3aWxsIHVw
ZGF0ZSB0aGUgV0hFTkNFIGZpbGUuDQoNClRoYW5rcy4NCg0K
