Return-Path: <SRS0=as9S=J6=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB433C433ED
	for <linux-firmware@archiver.kernel.org>; Mon,  3 May 2021 18:31:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9CB416112F; Mon,  3 May 2021 18:31:14 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC67610FC;
	Mon,  3 May 2021 18:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC67610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anusha.srivatsa@intel.com
IronPort-SDR: +YOHA9YaWgpKvNjdZFLEdG8iIhqntidMerHytbly8AKz/UjMhKHWbBNpYG9oMLUe0MBDROSpSn
 EbhunJgXXoNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="218602911"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="218602911"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 11:31:12 -0700
IronPort-SDR: 6/HX2dhl4Ro2I34lUzhYMfouXYt3E1/HjFWayRBfaWOivYxLkksn7KXR0MNEJmCY8UApYwJFnN
 bQWtdtStzHlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="432869278"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by orsmga008.jf.intel.com with ESMTP; 03 May 2021 11:31:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 3 May 2021 11:31:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 3 May 2021 11:31:11 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.013;
 Mon, 3 May 2021 11:31:11 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"ben@decadent.org.uk" <ben@decadent.org.uk>, Kyle McMartin <kyle@mcmartin.ca>
Subject: RE: I915 updates to be pulled to linux-firmware
Thread-Topic: I915 updates to be pulled to linux-firmware
Thread-Index: Adc7sTBBiM+CNTIxTZCi4iLVgJTXhAEprOcAAANgoDA=
Date: Mon, 3 May 2021 18:31:11 +0000
Message-ID: <6e0e1de1772b4645aaefae259e83e4f7@intel.com>
References: <e3fb2ef55263454495ed8b4aabfa77be@intel.com>
 <CA+5PVA4ZcqSyvMg1tsy_gbnLgMzKtsDTJ+mESJcmEFjoGOyttQ@mail.gmail.com>
In-Reply-To: <CA+5PVA4ZcqSyvMg1tsy_gbnLgMzKtsDTJ+mESJcmEFjoGOyttQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvc2ggQm95ZXIgPGp3Ym95
ZXJAa2VybmVsLm9yZz4NCj4gU2VudDogTW9uZGF5LCBNYXkgMywgMjAyMSA2OjA3IEFNDQo+IFRv
OiBTcml2YXRzYSwgQW51c2hhIDxhbnVzaGEuc3JpdmF0c2FAaW50ZWwuY29tPg0KPiBDYzogbGlu
dXgtZmlybXdhcmVAa2VybmVsLm9yZzsgYmVuQGRlY2FkZW50Lm9yZy51azsgS3lsZSBNY01hcnRp
bg0KPiA8a3lsZUBtY21hcnRpbi5jYT4NCj4gU3ViamVjdDogUmU6IEk5MTUgdXBkYXRlcyB0byBi
ZSBwdWxsZWQgdG8gbGludXgtZmlybXdhcmUNCj4gDQo+IE9uIFR1ZSwgQXByIDI3LCAyMDIxIGF0
IDY6MDQgUE0gU3JpdmF0c2EsIEFudXNoYQ0KPiA8YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBTZW5kaW5nIFBSIGZvciBBREwtUDoNCj4gPg0KPiA+DQo+ID4NCj4g
PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo+IGZhMGVmZWZmNDg5NGUzNmI5
YzM5NjQzNzZmMmM5OWZhZTEwMWQxNDc6DQo+ID4NCj4gPg0KPiA+DQo+ID4gICBsaW51eC1maXJt
d2FyZTogVXBkYXRlIGZpcm13YXJlIGZpbGUgZm9yIEludGVsIEJsdWV0b290aCBBWDIxMA0KPiA+
ICgyMDIxLTA0LTI2IDA3OjAwOjU2IC0wNDAwKQ0KPiA+DQo+ID4NCj4gPg0KPiA+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiA+DQo+ID4NCj4gPg0KPiA+ICAgZ2l0
Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1maXJtd2FyZSBhZGxwX2Zpcm13YXJl
DQo+ID4NCj4gPg0KPiA+DQo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+IDcy
NjY0NWQwOTE1Yzg1MDZiNDkxZGIyM2QzMTAzZjAwMjcwNTVhYzU6DQo+ID4NCj4gPg0KPiA+DQo+
ID4gICBpOTE1OiBBZGQgQURMLVAgRE1DIFN1cHBvcnQgKDIwMjEtMDQtMjcgMDk6MzI6MTMgLTA3
MDApDQo+ID4NCj4gPg0KPiA+DQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4gQW51c2hhIFNyaXZhdHNh
ICgxKToNCj4gPg0KPiA+ICAgICAgIGk5MTU6IEFkZCBBREwtUCBETUMgU3VwcG9ydA0KPiANCj4g
VGhpcyBhZGRzIHR3byBuZXcgZmlsZXMgYnV0IGRvZXNuJ3QgdXBkYXRlIFdIRU5DRS4gIFBsZWFz
ZSBjb3JyZWN0Lg0KDQpXaWxsIHRha2UgY2FyZSBvZiB0aGUgV0hFTkNFIGZpbGUgYW5kIHJlc2Vu
ZCB0aGUgUFIuIA0KDQpBbnVzaGENCj4gam9zaA0KPiANCj4gPg0KPiA+DQo+ID4NCj4gPiBpOTE1
L2FkbHBfZG1jX3ZlcjJfMDkuYmluIHwgQmluIDAgLT4gNDQ2MzYgYnl0ZXMNCj4gPg0KPiA+IGk5
MTUvYWRscF9kbWNfdmVyMl8xMC5iaW4gfCBCaW4gMCAtPiA0NDYxNiBieXRlcw0KPiA+DQo+ID4g
MiBmaWxlcyBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBjcmVhdGUgbW9kZSAxMDA2NDQgaTkxNS9hZGxwX2RtY192ZXIyXzA5LmJpbg0KPiA+DQo+ID4g
Y3JlYXRlIG1vZGUgMTAwNjQ0IGk5MTUvYWRscF9kbWNfdmVyMl8xMC5iaW4NCj4gPg0KPiA+DQo+
ID4NCj4gPg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+DQo+ID4gQW51c2hhDQo=
