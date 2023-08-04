Return-Path: <SRS0=WFcK=DV=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C25AC001DE
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Aug 2023 06:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A8A7C433C9; Fri,  4 Aug 2023 06:04:06 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.kernel.org (Postfix) with ESMTP id C1E02C433C7;
	Fri,  4 Aug 2023 06:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1E02C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37463dptE001136, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37463dptE001136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 4 Aug 2023 14:03:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 4 Aug 2023 14:03:54 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 4 Aug 2023 14:03:54 +0800
Received: from RTEXMBS03.realtek.com.tw ([fe80::5510:ad08:5390:1ed3]) by
 RTEXMBS03.realtek.com.tw ([fe80::5510:ad08:5390:1ed3%2]) with mapi id
 15.01.2375.007; Fri, 4 Aug 2023 14:03:54 +0800
From: Max Chou <max.chou@realtek.com>
To: Juerg Haefliger <juerg.haefliger@canonical.com>,
        Josh Boyer
	<jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
CC: Hilda Wu <hildawu@realtek.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>,
        "Larry.Finger@lwfinger.net"
	<Larry.Finger@lwfinger.net>,
        "alex_lu@realsil.com.cn"
	<alex_lu@realsil.com.cn>,
        =?utf-8?B?6Zmz6ZyC6I+v?= <mu_hua_chen@realtek.com>,
        Hsin Yu Chang <hsinyu_chang@realtek.com>,
        KidmanLee <kidman@realtek.com>
Subject: RE: [PATCH] rtl_bt: Update RTL8852C BT USB firmware to 0x040D_7225
Thread-Topic: [PATCH] rtl_bt: Update RTL8852C BT USB firmware to 0x040D_7225
Thread-Index: AQHZmRn2c0pDn/x1HESichptY70mNq+GhCOAgCEMGACAMEMZgIABpz/w
Date: Fri, 4 Aug 2023 06:03:53 +0000
Message-ID: <9a4f49f76f83454d8583680e507fdc7a@realtek.com>
References: <20230607082751.13580-1-hildawu@realtek.com>
	<CA+5PVA7k+NHHb9LqEw04nfBA4mJ5O=XrNqh86cHbDSeUzW87NA@mail.gmail.com>
	<20230703134824.7795b277@smeagol> <20230803064901.4c87ea8b@smeagol>
In-Reply-To: <20230803064901.4c87ea8b@smeagol>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.132.197]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

SGkhIEp1ZXJnLA0KUmVhbHRlayBpbXBsZW1lbnRzIGEgZHJpdmVyIHBhdGNoIHRvIG1lZXQgdGhl
IGNvbmRpdGlvbiBhcyB5b3VyIHN1Z2dlc3Rpb24uDQpQbGVhc2UgY2hlY2sgdGhlIGNvbW1pdCBm
cm9tIHRoZSBwYXRjaHdvcmsuDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3Qv
Ymx1ZXRvb3RoL3BhdGNoLzIwMjMwODA0MDU1NDI2LjY4MDYtMS1tYXguY2hvdUByZWFsdGVrLmNv
bS8NCg0KRm9yIHRoZSBwYXRjaCBvbiBsaW51eC1maXJtd2FyZSBwcm9qZWN0LCBpdCB3aWxsIGJl
IHN1Ym1pdHRlZCB3aGVuIHRoZSBhYm92ZSBkcml2ZXIgcGF0Y2ggaXMgYXBwcm92ZWQuDQoNCkJS
cywNCk1heA0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVlcmcg
SGFlZmxpZ2VyIDxqdWVyZy5oYWVmbGlnZXJAY2Fub25pY2FsLmNvbT4NCj4gU2VudDogVGh1cnNk
YXksIEF1Z3VzdCAzLCAyMDIzIDEyOjQ5IFBNDQo+IFRvOiBKb3NoIEJveWVyIDxqd2JveWVyQGtl
cm5lbC5vcmc+DQo+IENjOiBIaWxkYSBXdSA8aGlsZGF3dUByZWFsdGVrLmNvbT47IGxpbnV4LWZp
cm13YXJlQGtlcm5lbC5vcmc7DQo+IExhcnJ5LkZpbmdlckBsd2Zpbmdlci5uZXQ7IE1heCBDaG91
IDxtYXguY2hvdUByZWFsdGVrLmNvbT47DQo+IGFsZXhfbHVAcmVhbHNpbC5jb20uY247IOmZs+mc
guiPryA8bXVfaHVhX2NoZW5AcmVhbHRlay5jb20+OyBIc2luIFl1DQo+IENoYW5nIDxoc2lueXVf
Y2hhbmdAcmVhbHRlay5jb20+OyBLaWRtYW5MZWUgPGtpZG1hbkByZWFsdGVrLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gcnRsX2J0OiBVcGRhdGUgUlRMODg1MkMgQlQgVVNCIGZpcm13YXJl
IHRvDQo+IDB4MDQwRF83MjI1DQo+IA0KPiBKb3NoLCBSZWFsdGVrLA0KPiANCj4gQW55IGNvbW1l
bnRzPw0KPiANCj4gVGhhbmtzDQo+IC4uLkp1ZXJnDQo+IA0KPiANCj4gPiBKb3NoLA0KPiA+DQo+
ID4NCj4gPiA+IEFwcGxpZWQgYW5kIHB1c2hlZCBvdXQuDQo+ID4gPg0KPiA+ID4gam9zaA0KPiA+
ID4NCj4gPiA+IE9uIFdlZCwgSnVuIDcsIDIwMjMgYXQgNDoyOOKAr0FNIDxoaWxkYXd1QHJlYWx0
ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gRnJvbTogSGlsZGEgV3UgPGhpbGRhd3VA
cmVhbHRlay5jb20+DQo+ID4gPiA+DQo+ID4gPiA+IFRoaXMgZmlybXdhcmUgcGF0Y2ggdXBkYXRl
IGZvciBSZWFsdGVrIFJUTDg4NTJDIEJUIFVTQiBjb250cm9sbGVyDQo+ID4gPiA+DQo+ID4gPiA+
IE5vdGU6IFRoaXMgZmlybXdhcmUgcGF0Y2ggbmVlZHMgdG8gYmUgdXNlZCB3aXRoIGRyaXZlcg0K
PiA+ID4gPiAiYnRydGw6IEZpcm13YXJlIGZvcm1hdCB2MiBzdXBwb3J0Ii4gUGxlYXNlIHVwZGF0
ZSB0aGUgZHJpdmVyIHdpdGgNCj4gPiA+ID4gdGhpcyBjb21taXQ6IDlhMjRjZTVlMjliMTVjNGM2
YjBjODljMDRmOWRmNmNlMTRhZGRlZmENCj4gPg0KPiA+IERvIEkgdW5kZXJzdGFuZCB0aGlzIGNv
cnJlY3RseSB0aGF0IGtlcm5lbHMgdGhhdCBkb24ndCBoYXZlIHRoaXMgcGF0Y2gNCj4gPiAoYW55
IGtlcm5lbCA8IDYuNCkgY2FuIG5vIGxvbmdlciBsb2FkIHRoaXMgdjIgQlQgZmlybXdhcmUgYmVj
YXVzZSBpdCdzDQo+ID4gbm90IGNvbXBhdGlibGUgd2l0aCBvbGQgZHJpdmVycz8gVGhhdCdzIGEg
cmVncmVzc2lvbiwgbm8/IFRoZQ0KPiA+IGluY29tcGF0aWJsZSBuZXcgZmlybXdhcmUgc2hvdWxk
IGJlIG5hbWVkIGRpZmZlcmVudGx5IHNvIHRoYXQgd2UgZG9uJ3QNCj4gYnJlYWsgb2xkIGtlcm5l
bHMuDQo+ID4NCj4gPiBUaGUgdjIgZHJpdmVyIFsxXSBzZWVtcyB0byBzdXBwb3J0IGJvdGggdGhl
IG9sZCBhbmQgbmV3IGZpcm13YXJlDQo+ID4gYmluYXJ5IHNvIElNTyBzaG91bGQgdHJ5IHRvIGxv
YWQgdGhlIG5ldyBmaXJtd2FyZSBmaXJzdCBhbmQgZmFsbCBiYWNrDQo+ID4gdG8gdGhlIG9sZCBv
bmUgaWYgbm90IGZvdW5kLg0KPiA+DQo+ID4gVW5sZXNzIEknbSBtaXNyZWFkaW5nIHRoaXMuDQo+
ID4NCj4gPiAuLi5KdWVyZw0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbQ0KPiA+IG1p
dC8/aWQ9OWEyNGNlNWUyOWIxNWM0YzZiMGM4OWMwNGY5ZGY2Y2UxNGFkZGVmYQ0KPiA+DQo+ID4N
Cj4gPg0KPiA+ID4gPiBSZWxlYXNlIFZlcnNpb246IDB4MDQwRF83MjI1DQo+ID4gPiA+DQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEhpbGRhIFd1IDxoaWxkYXd1QHJlYWx0ZWsuY29tPg0KPiA+ID4g
PiAtLS0NCj4gPiA+ID4gIHJ0bF9idC9ydGw4ODUyY3VfZncuYmluIHwgQmluIDExMzMzNiAtPiAx
MTI5NTMgYnl0ZXMNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAg
ZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gLS0tLS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9u
bWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=
