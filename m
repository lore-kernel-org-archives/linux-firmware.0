Return-Path: <SRS0=LOva=UR=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230D5C433F5
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Apr 2022 08:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2A7BC385A8; Thu,  7 Apr 2022 08:26:25 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38C75C385A4
	for <linux-firmware@kernel.org>; Thu,  7 Apr 2022 08:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38C75C385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 2378QCdC4014307, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 2378QCdC4014307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 7 Apr 2022 16:26:12 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 16:26:11 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 7 Apr 2022 01:26:11 -0700
Received: from RTEXMBS04.realtek.com.tw ([fe80::41d7:1d2e:78a6:ff34]) by
 RTEXMBS04.realtek.com.tw ([fe80::41d7:1d2e:78a6:ff34%5]) with mapi id
 15.01.2308.021; Thu, 7 Apr 2022 16:26:11 +0800
From: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>
Subject: pull request: rtw88: 8821c: Update normal firmware to v24.11.00
Thread-Topic: pull request: rtw88: 8821c: Update normal firmware to v24.11.00
Thread-Index: AQHYSlkjgwCeVK7dJ0ybKZ9OR83hhg==
Date: Thu, 7 Apr 2022 08:26:11 +0000
Message-ID: <3ea2314b865bfd4799fc5edd998439bba4e59f2a.camel@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.1-2 
x-originating-ip: [172.16.21.190]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzQvNyDkuIrljYggMDY6NTE6MDA=?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4623B0DA97C6F4AA5854CC998DA35F1@realtek.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled

SGksDQoNClVwZGF0ZSA4ODIxYyBmaXJtd2FyZSBvZiBydHc4OCBkcml2ZXIgdG8gdjI0LjExLjAw
DQoNClRoYW5rIHlvdQ0KUGluZy1LZQ0KDQotLS0NClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgMDczMzhmOWQzMzA4OWFiYTY4NTNjYjdiM2ExZDlhODY3NmM4MzU4MDoNCg0KICBy
dHc4ODogODgyMWM6IFVwZGF0ZSBub3JtYWwgZmlybXdhcmUgdG8gdjI0LjExLjAwICgyMDIyLTA0
LTA3IDE2OjIwOjQxICswODAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vcGtzaGloL2xpbnV4LWZpcm13YXJlLmdpdCAN
Cg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDA3MzM4ZjlkMzMwODlhYmE2ODUzY2I3
YjNhMWQ5YTg2NzZjODM1ODA6DQoNCiAgcnR3ODg6IDg4MjFjOiBVcGRhdGUgbm9ybWFsIGZpcm13
YXJlIHRvIHYyNC4xMS4wMCAoMjAyMi0wNC0wNyAxNjoyMDo0MSArMDgwMCkNCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
DQo=
