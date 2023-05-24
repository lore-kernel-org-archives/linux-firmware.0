Return-Path: <SRS0=fZ7M=BN=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49248C77B7A
	for <linux-firmware@archiver.kernel.org>; Wed, 24 May 2023 08:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13727C4339C; Wed, 24 May 2023 08:36:02 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B4A5C433D2
	for <linux-firmware@kernel.org>; Wed, 24 May 2023 08:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B4A5C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34O8Zj0R2001224, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34O8Zj0R2001224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 24 May 2023 16:35:45 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 24 May 2023 16:35:56 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 24 May 2023 16:35:56 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Wed, 24 May 2023 16:35:56 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Ping-Ke Shih <pkshih@realtek.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: pull request [v2]: rtw89: 8851b: add firmware v0.29.41.0
Thread-Topic: pull request [v2]: rtw89: 8851b: add firmware v0.29.41.0
Thread-Index: AdmN2K1wMvVRYge3Ts2HesAmQ7eBCgAQfBPg
Date: Wed, 24 May 2023 08:35:56 +0000
Message-ID: <895f3746d1d046a8a4de2b295b9e5414@realtek.com>
References: <bb354783d5c6464a87a3e2d90a0a13bd@realtek.com>
In-Reply-To: <bb354783d5c6464a87a3e2d90a0a13bd@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback


> -----Original Message-----
> From: Ping-Ke Shih <pkshih@realtek.com>
> Sent: Wednesday, May 24, 2023 8:45 AM
> To: linux-firmware@kernel.org
> Cc: linux-wireless@vger.kernel.org
> Subject: pull request [v2]: rtw89: 8851b: add firmware v0.29.41.0
>=20
> Hi,
>=20
> Add initial firmware of rtw89 driver for newly supported chip 8851BE.
>=20
> Add the missing WHENCE by v2.
>=20

I forget to modify driver description by v2, so please drop this pull-reque=
st.

Ping-Ke

