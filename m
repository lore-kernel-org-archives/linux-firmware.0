Return-Path: <SRS0=0FPw=EC=intel.com=anusha.srivatsa@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E8DC4363A
	for <linux-firmware@archiver.kernel.org>; Tue, 27 Oct 2020 21:33:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D1DF2223C; Tue, 27 Oct 2020 21:33:24 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D158E221FB;
	Tue, 27 Oct 2020 21:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D158E221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anusha.srivatsa@intel.com
IronPort-SDR: KNcK8dwaPV5YbZIkdM07jW0DYWfECH/x4Yn9CxzFIPkdUUxwaO3H8YDdGU6m/TIRZ0mupr29Ay
 mqh0HUZ0t9EA==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="148020863"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
   d="scan'208";a="148020863"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2020 14:33:22 -0700
IronPort-SDR: A1haXKy0dHeoMGOaDGk5u8TrcS8qSB7ICFlFJ/Z2bljFtZOgwf2+Qi0gSgRuIjwkRYwetY0vZ3
 KYANvyCwD8kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
   d="scan'208";a="323100591"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2020 14:33:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 14:33:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 14:33:21 -0700
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 14:33:21 -0700
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, Kyle McMartin
	<kyle@mcmartin.ca>, "ben@decadent.org.uk" <ben@decadent.org.uk>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: i915 Update : DG1 DMC
Thread-Topic: i915 Update : DG1 DMC
Thread-Index: Adaea4W6Jtrfz8J7RqGJot9NVZc0zQLAvXsAAM6Q1zA=
Date: Tue, 27 Oct 2020 21:33:21 +0000
Message-ID: <9bd49e7ab68c4ef0b17173cfc9d4ecfa@intel.com>
References: <3997663f047e4ab68fca41e3c8a05671@intel.com>
 <CA+5PVA4tEqub_1KmA9WeRa3WZ4OpDejdBn2FDxZ-LESfFD1Vnw@mail.gmail.com>
In-Reply-To: <CA+5PVA4tEqub_1KmA9WeRa3WZ4OpDejdBn2FDxZ-LESfFD1Vnw@mail.gmail.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zaCBCb3llciA8andi
b3llckBrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMjMsIDIwMjAgNDo1OCBB
TQ0KPiBUbzogU3JpdmF0c2EsIEFudXNoYSA8YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4NCj4g
Q2M6IGxpbnV4LWZpcm13YXJlQGtlcm5lbC5vcmc7IEt5bGUgTWNNYXJ0aW4gPGt5bGVAbWNtYXJ0
aW4uY2E+Ow0KPiBiZW5AZGVjYWRlbnQub3JnLnVrOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBpOTE1IFVwZGF0ZSA6IERHMSBETUMNCj4gDQo+IFB1bGxl
ZCBhbmQgcHVzaGVkIG91dC4NCj4gDQo+IGpvc2gNCj4NClRoYW5rcyBKb3NoLg0KDQo+IE9uIEZy
aSwgT2N0IDksIDIwMjAgYXQgMjo0MSBQTSBTcml2YXRzYSwgQW51c2hhDQo+IDxhbnVzaGEuc3Jp
dmF0c2FAaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIEt5bGUsIEJlbiwNCj4gPg0KPiA+
DQo+ID4NCj4gPiBQbGVhc2UgYWRkIHRoZSBpOTE1IHVwZGF0ZXMgdG8gbGludXgtZmlybXdhcmUg
ZnJvbSBicmFuY2gNCj4gPiBkZzFfZG1jX3YyXzAyDQo+ID4NCj4gPg0KPiA+DQo+ID4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA1OGQ0MWQwZmFjY2EyNDc4ZDNlNDVmNjMy
MTIyNDM2MTUxOWFlZTk2Og0KPiA+DQo+ID4NCj4gPg0KPiA+ICAgaWNlOiBBZGQgY29tbXMgcGFj
a2FnZSBmaWxlIGZvciBJbnRlbCBFODAwIHNlcmllcyBkcml2ZXIgKDIwMjAtMTAtMDUNCj4gPiAw
ODowOTowMyAtMDQwMCkNCj4gPg0KPiA+DQo+ID4NCj4gPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBH
aXQgcmVwb3NpdG9yeSBhdDogZGcxX2RtY192Ml8wMg0KPiA+DQo+ID4NCj4gPg0KPiA+ICAgZ2l0
Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1maXJtd2FyZSBkZzFfZG1jX3YyXzAy
DQo+ID4NCj4gPg0KPiA+DQo+ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+IGEx
NDBlZjNlYjM3NDZhYmEyYzg5N2RiMTZlMDJmZmI1ZmZhOWU3YTI6DQo+ID4NCj4gPg0KPiA+DQo+
ID4gICBpOTE1OiBBZGQgREcxIERNQyB2Mi4wMiAoMjAyMC0xMC0wOCAxMjoxMzozMyAtMDcwMCkN
Cj4gPg0KPiA+DQo+ID4NCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiBBbnVzaGEgU3JpdmF0c2EgKDEp
Og0KPiA+DQo+ID4gICAgICAgaTkxNTogQWRkIERHMSBETUMgdjIuMDINCj4gPg0KPiA+DQo+ID4N
Cj4gPiBXSEVOQ0UgICAgICAgICAgICAgICAgICAgfCAgIDIgKysNCj4gPg0KPiA+IGk5MTUvZGcx
X2RtY192ZXIyXzAyLmJpbiB8IEJpbiAwIC0+IDE2NjI0IGJ5dGVzDQo+ID4NCj4gPiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGk5
MTUvZGcxX2RtY192ZXIyXzAyLmJpbg0KPiA+DQo+ID4NCj4gPg0KPiA+IFRoYW5rcywNCj4gPg0K
PiA+IEFudXNoYQ0K
