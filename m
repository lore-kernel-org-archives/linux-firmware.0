Return-Path: <SRS0=+/JI=EX=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98318C2D0E4
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Nov 2020 07:47:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5051C24655; Tue, 17 Nov 2020 07:47:29 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E502463C;
	Tue, 17 Nov 2020 07:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E502463C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hildawu@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AH7lKFH1008786, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb05.realtek.com.tw[172.21.6.98])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AH7lKFH1008786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 17 Nov 2020 15:47:20 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 17 Nov 2020 15:47:19 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 17 Nov 2020 15:47:19 +0800
Received: from RTEXMB04.realtek.com.tw ([fe80::89f7:e6c3:b043:15fa]) by
 RTEXMB04.realtek.com.tw ([fe80::89f7:e6c3:b043:15fa%3]) with mapi id
 15.01.2044.006; Tue, 17 Nov 2020 15:47:19 +0800
From: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Larry Finger <Larry.Finger@lwfinger.net>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "jwboyer@kernel.org" <jwboyer@kernel.org>,
        Max Chou
	<max.chou@realtek.com>, alex_lu <alex_lu@realsil.com.cn>,
        Hsin Yu Chang
	<hsinyu_chang@realtek.com>,
        KidmanLee <kidman@realtek.com>
Subject: RE: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x059A_25CB
Thread-Topic: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x059A_25CB
Thread-Index: AQHWu9z+7gtTqL/X7kqTirq7TA9+xanKf8UAgAFubxA=
Date: Tue, 17 Nov 2020 07:47:19 +0000
Message-ID: <6711027507cc4338b962bede254ad546@realtek.com>
References: <20201116055438.6048-1-hildawu@realtek.com>
 <e9a95a6d-37d8-8d2c-b0f4-2cd22927d00d@lwfinger.net>
In-Reply-To: <e9a95a6d-37d8-8d2c-b0f4-2cd22927d00d@lwfinger.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.132.158]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgTGFycnksDQoNClRoZSBXSEVOQ0Ugd2FzIGluY2x1ZGVkIHRoZSBydGxfYnQvcnRsODgyMmNz
X2Z3LmJpbi4NCkZvciBkZXRhaWwsIHBsZWFzZSBjaGVjayB3aXRoIHRoaXMgbGluazoNCmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4
LWZpcm13YXJlLmdpdC9jb21taXQvP2lkPWZjZTYwYTlhODFiZjE0OGI1YzgzMWEzZTMzZmU2NjZj
OWIzOGZmMjMNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJlbWluZGVyLg0KDQpSZWdhcmRzLA0KSGls
ZGENCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IExhcnJ5IEZpbmdlciA8bGFy
cnkuZmluZ2VyQGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIExhcnJ5IEZpbmdlcg0KU2VudDogVHVl
c2RheSwgTm92ZW1iZXIgMTcsIDIwMjAgMTozNSBBTQ0KVG86IEhpbGRhIFd1IDxoaWxkYXd1QHJl
YWx0ZWsuY29tPjsgbGludXgtZmlybXdhcmVAa2VybmVsLm9yZw0KQ2M6IGp3Ym95ZXJAa2VybmVs
Lm9yZzsgTWF4IENob3UgPG1heC5jaG91QHJlYWx0ZWsuY29tPjsgYWxleF9sdSA8YWxleF9sdUBy
ZWFsc2lsLmNvbS5jbj47IEhzaW4gWXUgQ2hhbmcgPGhzaW55dV9jaGFuZ0ByZWFsdGVrLmNvbT47
IEtpZG1hbkxlZSA8a2lkbWFuQHJlYWx0ZWsuY29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gcnRs
X2J0OiBVcGRhdGUgUlRMODgyMkMgQlQoVUFSVCBJL0YpIEZXIHRvIDB4MDU5QV8yNUNCDQoNCk9u
IDExLzE1LzIwIDExOjU0IFBNLCBoaWxkYXd1QHJlYWx0ZWsuY29tIHdyb3RlOg0KPiBGcm9tOiBI
aWxkYSBXdSA8aGlsZGF3dUByZWFsdGVrLmNvbT4NCj4gDQo+IFRoaXMgZmlybXdhcmUgcGF0Y2gg
dXBkYXRlIGZvciBSZWFsdGVrIFJUTDg4MjJDIEJUIGNvbnRyb2xsZXIuKFVBUlQgSS9GKQ0KPiAN
Cj4gUmVsZWFzZSBWZXJzaW9uOjB4MDU5QV8yNUNCDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIaWxk
YSBXdSA8aGlsZGF3dUByZWFsdGVrLmNvbT4NCj4gLS0tDQo+ICAgcnRsX2J0L3J0bDg4MjJjc19m
dy5iaW4gfCBCaW4gNTg2NDAgLT4gNjA5NTYgYnl0ZXMNCj4gICAxIGZpbGUgY2hhbmdlZCwgMCBp
bnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KDQpZb3UgbmVlZCB0byBhZGQgdGhpcyBjaGFu
Z2UgdG8gV0hFTkNFLiBOQUNLDQoNCkxhcnJ5DQoNCi0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUg
ZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K
