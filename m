Return-Path: <SRS0=BKJT=HK=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C25C433E0
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Feb 2021 15:33:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1897B64E37; Mon,  8 Feb 2021 15:33:19 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE91664E15;
	Mon,  8 Feb 2021 15:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE91664E15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anusha.srivatsa@intel.com
IronPort-SDR: AzJ6O6Jzdc8HCpgMezscUceIn2gIrV8l1VQgd3Lf4xgj+SVEZu5PFQqhMapjUv6DYZfUCMHbKX
 LA+K3gfrHMRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="179169283"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="179169283"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 07:33:17 -0800
IronPort-SDR: Z5aY/69ZF3p3D5DtS1UEVFN/P1lI7OM9LhEKqeXG1+CqZgCXlJbWcR+FKpvL/O4BsaFljYdjFt
 Uy3utx8cZB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="377813227"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga008.fm.intel.com with ESMTP; 08 Feb 2021 07:33:17 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Feb 2021 07:33:16 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Feb 2021 07:33:16 -0800
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.002;
 Mon, 8 Feb 2021 07:33:15 -0800
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Kyle McMartin
	<kyle@mcmartin.ca>, "ben@decadent.org.uk" <ben@decadent.org.uk>
Subject: RE: I915 Update - ADLS(dmc), DG1(GuC, HuC)
Thread-Topic: I915 Update - ADLS(dmc), DG1(GuC, HuC)
Thread-Index: Adb4/PP2tsg17x6CSV+7Ubau+LgHLwFY5+YAAAw5icA=
Date: Mon, 8 Feb 2021 15:33:15 +0000
Message-ID: <951e83dc7c3249d4806f530258c9c507@intel.com>
References: <6ac7d05dfec24e8abff678f47f27f6a1@intel.com>
 <CA+5PVA53a7tKz3MkLGHCMROMWoQWdCbm6L5r5ifsc8wqoESW8w@mail.gmail.com>
In-Reply-To: <CA+5PVA53a7tKz3MkLGHCMROMWoQWdCbm6L5r5ifsc8wqoESW8w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zaCBCb3llciA8andi
b3llckBrZXJuZWwub3JnPg0KPiBTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDgsIDIwMjEgNToyMyBB
TQ0KPiBUbzogU3JpdmF0c2EsIEFudXNoYSA8YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4NCj4g
Q2M6IGxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmc7IEt5bGUgTWNNYXJ0aW4gPGt5bGVAbWNtYXJ0
aW4uY2E+Ow0KPiBiZW5AZGVjYWRlbnQub3JnLnVrDQo+IFN1YmplY3Q6IFJlOiBJOTE1IFVwZGF0
ZSAtIEFETFMoZG1jKSwgREcxKEd1QywgSHVDKQ0KPiANCj4gUHVsbGVkIGFuZCBwdXNoZWQgb3V0
Lg0KDQpUaGFua3MgSm9zaCENCg0KPiBqb3NoDQo+IA0KPiBPbiBNb24sIEZlYiAxLCAyMDIxIGF0
IDc6NDkgUE0gU3JpdmF0c2EsIEFudXNoYQ0KPiA8YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBTZW5kaW5nIHNvbWUgaTkxNSB1cGRhdGVzIHRvIGJlIHB1bGxlZCBp
biB1cHN0cmVhbS4NCj4gPg0KPiA+DQo+ID4NCj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2lu
Y2UgY29tbWl0DQo+IDA1Nzg5NzA4Yjc5YjM4ZWIwZjFhMjBkODQ0OWI0ZWI1NmQzOWIzOWY6DQo+
ID4NCj4gPg0KPiA+DQo+ID4gICBicmNtOiBMaW5rIFJQaTQncyBXaUZpIGZpcm13YXJlIHdpdGgg
RE1JIG1hY2hpbmUgbmFtZS4gKDIwMjEtMDEtMTkNCj4gPiAwNzo0Mjo0MyAtMDUwMCkNCj4gPg0K
PiA+DQo+ID4NCj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4g
Pg0KPiA+DQo+ID4NCj4gPiAgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0t
ZmlybXdhcmUgREcxLWd1Yy1odWMtQURMUy1kbWMNCj4gPg0KPiA+DQo+ID4NCj4gPiBmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCj4gMzQ4ZDhhOTc0MDkzMGU3YjhiZDgzYTM2YmFiYTQw
YzVjZmMzZjhiZToNCj4gPg0KPiA+DQo+ID4NCj4gPiAgIGk5MTU6IEFkZCBETUMgdjIuMDEgZm9y
IEFETC1TICgyMDIxLTAxLTI5IDExOjQzOjEyIC0wODAwKQ0KPiA+DQo+ID4NCj4gPg0KPiA+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gPg0KPiA+IEFudXNoYSBTcml2YXRzYSAoMyk6DQo+ID4NCj4gPiAgICAgICBpOTE1
OiBBZGQgR3VDIHY0OS4wLjEgZm9yIERHMQ0KPiA+DQo+ID4gICAgICAgaTkxNTogQWRkIEh1QyB2
Ny43LjEgZm9yIERHMQ0KPiA+DQo+ID4gICAgICAgaTkxNTogQWRkIERNQyB2Mi4wMSBmb3IgQURM
LVMNCj4gPg0KPiA+DQo+ID4NCj4gPiBXSEVOQ0UgICAgICAgICAgICAgICAgICAgIHwgICA5ICsr
KysrKysrKw0KPiA+DQo+ID4gaTkxNS9hZGxzX2RtY192ZXIyXzAxLmJpbiB8IEJpbiAwIC0+IDE4
NzA0IGJ5dGVzDQo+ID4NCj4gPiBpOTE1L2RnMV9ndWNfNDkuMC4xLmJpbiAgIHwgQmluIDAgLT4g
MzExODcyIGJ5dGVzDQo+ID4NCj4gPiBpOTE1L2RnMV9odWNfNy43LjEuYmluICAgIHwgQmluIDAg
LT4gNTgyNDAwIGJ5dGVzDQo+ID4NCj4gPiA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KQ0KPiA+DQo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGk5MTUvYWRsc19kbWNfdmVyMl8wMS5iaW4N
Cj4gPg0KPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCBpOTE1L2RnMV9ndWNfNDkuMC4xLmJpbg0KPiA+
DQo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGk5MTUvZGcxX2h1Y183LjcuMS5iaW4NCj4gPg0KPiA+
DQo+ID4NCj4gPg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+DQo+ID4gQW51c2hhDQo+ID4NCj4gPg0K
