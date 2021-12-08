Return-Path: <SRS0=up0n=QZ=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D96C433F5
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Dec 2021 18:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 091A0C341C7; Wed,  8 Dec 2021 18:11:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A1B1C00446;
	Wed,  8 Dec 2021 18:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A1B1C00446
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="236633679"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="236633679"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 10:11:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600"; 
   d="scan'208";a="564211850"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2021 10:11:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 8 Dec 2021 10:11:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 8 Dec 2021 10:11:15 -0800
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.020;
 Wed, 8 Dec 2021 10:11:15 -0800
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Tolakanahalli Pradeep, Madhumitha"
	<madhumitha.tolakanahalli.pradeep@intel.com>, "Hutchings, Ben"
	<ben@decadent.org.uk>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "kyle@mcmartin.ca" <kyle@mcmartin.ca>,
	"jwboyer@kernel.org" <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Subject: RE: [Intel-gfx] i915 Updates: ADL-P DMC v2.14
Thread-Topic: [Intel-gfx] i915 Updates: ADL-P DMC v2.14
Thread-Index: AQHX5xph/f6XAKy2GE6V4WspnPfE+qwo74wg
Date: Wed, 8 Dec 2021 18:11:15 +0000
Message-ID: <2b6c0de45581430daff7f698e94d94ad@intel.com>
References: <9d3a16d4327fd6bb0a52cfe8e4bb0857a81494f2.camel@intel.com>
In-Reply-To: <9d3a16d4327fd6bb0a52cfe8e4bb0857a81494f2.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

UGluZyA6KQ0KQ2FuIHRoZXNlIHVwZGF0ZXMgYmUgbWVyZ2VkIHRvIGxpbnV4LWZpcm13YXJlPw0K
DQoNClRoYW5rcywNCkFudXNoYSANCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBUb2xha2FuYWhhbGxpIFByYWRlZXAsIE1hZGh1bWl0aGENCj4gPG1hZGh1bWl0aGEudG9s
YWthbmFoYWxsaS5wcmFkZWVwQGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIERlY2VtYmVy
IDIsIDIwMjEgNjo0OCBBTQ0KPiBUbzogSHV0Y2hpbmdzLCBCZW4gPGJlbkBkZWNhZGVudC5vcmcu
dWs+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBreWxlQG1jbWFydGluLmNh
OyBqd2JveWVyQGtlcm5lbC5vcmcNCj4gQ2M6IFNyaXZhdHNhLCBBbnVzaGEgPGFudXNoYS5zcml2
YXRzYUBpbnRlbC5jb20+OyBsaW51eC0NCj4gZmlybXdhcmVAa2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBbSW50ZWwtZ2Z4XSBpOTE1IFVwZGF0ZXM6IEFETC1QIERNQyB2Mi4xNA0KPiANCj4gSGkgQmVu
LCBKb3NoLCBLeWxlLA0KPiANCj4gS2luZGx5IGFkZCB0aGUgYmVsb3cgaTkxNSBjaGFuZ2VzIHRv
IGxpbnV4LWZpcm13YXJlOg0KPiANCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1p
dA0KPiBiMGU4OThmYmFmMzc3Yzk5YTM2YWFjNmZkZWI3MjUwMDAzNjQ4Y2E0Og0KPiANCj4gICBs
aW51eC1maXJtd2FyZTogVXBkYXRlIGZpcm13YXJlIGZpbGUgZm9yIEludGVsIEJsdWV0b290aCA5
NDYyICgyMDIxLQ0KPiAxMS0yMyAxMjozMTo0NSAtMDUwMCkNCj4gDQo+IGFyZSBhdmFpbGFibGUg
aW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiANCj4gICBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNr
dG9wLm9yZy9kcm0vZHJtLWZpcm13YXJlIGFkbHBfZG1jX3YyLjE0X3VwZGF0ZQ0KPiANCj4gZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+IDJhMmFhNDEwYzJlYWViZTU4MDdkMWZkMzIx
ZTQyYjhmNTMyODhkOTE6DQo+IA0KPiAgIGk5MTU6IEFkZCBETUMgZmlybXdhcmUgdjIuMTQgZm9y
IEFETC1QICgyMDIxLTEyLTAxIDE2OjUwOjMwIC0wODAwKQ0KPiANCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiBNYWRo
dW1pdGhhIFRvbGFrYW5haGFsbGkgUHJhZGVlcCAoMSk6DQo+ICAgICAgIGk5MTU6IEFkZCBETUMg
ZmlybXdhcmUgdjIuMTQgZm9yIEFETC1QDQo+IA0KPiAgV0hFTkNFICAgICAgICAgICAgICAgICAg
ICB8ICAgMyArKysNCj4gIGk5MTUvYWRscF9kbWNfdmVyMl8xNC5iaW4gfCBCaW4gMCAtPiA3NzMw
MCBieXRlcw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpOTE1L2FkbHBfZG1jX3ZlcjJfMTQuYmluDQo+IA0KPiBUaGFua3MhDQo+IC0g
TWFkaHVtaXRoYQ0KPiANCg0K
