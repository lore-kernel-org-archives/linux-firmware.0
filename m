Return-Path: <SRS0=h77y=GK=realtek.com=hayeswang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64508C433DB
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Jan 2021 03:28:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30656230F9; Thu,  7 Jan 2021 03:28:32 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2501B22D01;
	Thu,  7 Jan 2021 03:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2501B22D01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hayeswang@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1073SQTu8005931, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.95])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 1073SQTu8005931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 7 Jan 2021 11:28:26 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 7 Jan 2021 11:28:25 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::ecca:80ca:53:e833]) by
 RTEXMBS04.realtek.com.tw ([fe80::ecca:80ca:53:e833%12]) with mapi id
 15.01.2106.006; Thu, 7 Jan 2021 11:28:25 +0800
From: Hayes Wang <hayeswang@realtek.com>
To: Josh Boyer <jwboyer@kernel.org>, Yorick de Wid <ydewid@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: Linux Firmware <linux-firmware@kernel.org>,
        nic_swsd
	<nic_swsd@realtek.com>
Subject: RE: Suspecting firmware issue on RTL 8152/8153
Thread-Topic: Suspecting firmware issue on RTL 8152/8153
Thread-Index: AQHW3rD6NugVZVUR/kq5IJ8kso16xqobiR+A
Date: Thu, 7 Jan 2021 03:28:25 +0000
Message-ID: <645a407a811542728a8c4f27a13ff8f5@realtek.com>
References: <CAGDk_A-uNtewPCAf3mDOAvjvXY005RCMb2cdBmqtS4ysE392Zg@mail.gmail.com>
 <CA+5PVA7qZ_wXnJ-X955+vWx_OMCNoO3eyMAk7LomuLQspxxLnQ@mail.gmail.com>
In-Reply-To: <CA+5PVA7qZ_wXnJ-X955+vWx_OMCNoO3eyMAk7LomuLQspxxLnQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.177.146]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGksIEpvc2gsDQoNCldlIGRvbid0IGdldCBhIHJlcG9ydCBmb3Igc3VjaCBpc3N1ZS4NCkkgdGhp
bmsgaXQgbWF5YmUgYmUgcmVsYXRpdmUgdG8gYSBzcGVjaWZpYyBwbGF0Zm9ybS4NCldlIHdvdWxk
IHRyeSB0byBib3Jyb3cgYSBwbGF0Zm9ybSB0byByZXByb2R1Y2UgaXQuDQoNCkJlc3QgUmVnYXJk
cywNCkhheWVzDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKb3NoIEJveWVy
IDxqd2JveWVyQGtlcm5lbC5vcmc+IA0KU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAzMCwgMjAy
MCA5OjM4IFBNDQpUbzogWW9yaWNrIGRlIFdpZCA8eWRld2lkQGdtYWlsLmNvbT47IEhheWVzIFdh
bmcgPGhheWVzd2FuZ0ByZWFsdGVrLmNvbT4NCkNjOiBMaW51eCBGaXJtd2FyZSA8bGludXgtZmly
bXdhcmVAa2VybmVsLm9yZz4NClN1YmplY3Q6IFJlOiBTdXNwZWN0aW5nIGZpcm13YXJlIGlzc3Vl
IG9uIFJUTCA4MTUyLzgxNTMNCg0KSGF5ZXMsDQoNCkhhdmUgeW91IHNlZW4gc2ltaWxhciBpc3N1
ZXM/DQoNCmpvc2gNCg0KT24gU2F0LCBEZWMgMTksIDIwMjAgYXQgMzo1MCBBTSBZb3JpY2sgZGUg
V2lkIDx5ZGV3aWRAZ21haWwuY29tPiB3cm90ZToNCj4NCj4gSGkgYWxsLA0KPg0KPiBXZSd2ZSBi
ZWVuIHRyYWNraW5nIGEgYnVnIHZpYSBCdWd6aWxsYSB3aGljaCBpcyBhc3NpZ25lZCB0byB0aGUN
Cj4gdmlydHVhbCBhbGlhcyBkcml2ZXJzX25ldHdvcmtAa2VybmVsLWJ1Z3Mub3NkbC5vcmcuDQo+
IEl0IGxvb2tzIGxpa2UgdGhlcmUgaXMgbm8gbWFpbnRhaW5lciBhc3NpZ25lZCB0byB0aGUgaXNz
dWUuDQo+DQo+IEZyb20gd2hhdCBJIGNhbiB0ZWxsIGl0IHBvaW50cyBpbnRvIHRoZSBkaXJlY3Rp
b24gb2YgYSBSVEwgZmlybXdhcmUgYnVnLg0KPg0KPiBLb25zdGFudGluIFJ5YWJpdHNldiBhZHZp
c2VkIHRvIGluZm9ybSB0aGlzIG1haWxpbmcgbGlzdCBhcyB3ZWxsLg0KPg0KPiBodHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTE5ODkzMQ0KPg0KPiBZb3JpY2sgZGUg
V2lkDQoNCi0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50
aW5nIHRoaXMgZS1tYWlsLg0K
