Return-Path: <SRS0=rEyJ=ED=realtek.com=max.chou@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B917CC388F9
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Oct 2020 03:05:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C67122454; Wed, 28 Oct 2020 03:05:10 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB8C22450;
	Wed, 28 Oct 2020 03:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DB8C22450
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=max.chou@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 09S354Lh8013638, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 09S354Lh8013638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 28 Oct 2020 11:05:04 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Wed, 28 Oct 2020 11:05:04 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.34) by
 RTEXMBS01.realtek.com.tw (172.21.6.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 28 Oct 2020 11:05:04 +0800
Received: from RTEXMBS03.realtek.com.tw ([::1]) by RTEXMBS03.realtek.com.tw
 ([fe80::1416:4382:69d3:e2f0%16]) with mapi id 15.01.2106.002; Wed, 28 Oct
 2020 11:05:04 +0800
From: Max Chou <max.chou@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "jwboyer@kernel.org" <jwboyer@kernel.org>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>,
        "Larry.Finger@lwfinger.net"
	<Larry.Finger@lwfinger.net>,
        alex_lu <alex_lu@realsil.com.cn>, Hilda Wu
	<hildawu@realtek.com>,
        KidmanLee <kidman@realtek.com>,
        Hsin Yu Chang
	<hsinyu_chang@realtek.com>
Subject: RE: [PATCH]  rtl_bt: Update RTL8822C BT(USB I/F) FW to 0x099A_25CB
Thread-Topic: [PATCH]  rtl_bt: Update RTL8822C BT(USB I/F) FW to 0x099A_25CB
Thread-Index: AQHWrAxfEst3DZ/wmUiuOKbjGPMzm6msVD2Q
Date: Wed, 28 Oct 2020 03:05:03 +0000
Message-ID: <b10fd478d5c74bbabca90e535ce375e0@realtek.com>
References: <20201027025334.5956-1-max.chou@realtek.com>
In-Reply-To: <20201027025334.5956-1-max.chou@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.132.163]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Dear Sir,
Sorry for the inconvenience.=20
Please drop this patch published because there's an issue for this firmware=
 file during compilation.=20
I will confirm the md5 checksum and send another patch.
Sorry again sincerely.



BRs,
Max


-----Original Message-----
From: Max Chou <max.chou@realtek.com>=20
Sent: Tuesday, October 27, 2020 10:54 AM
To: jwboyer@kernel.org; linux-firmware@kernel.org; Larry.Finger@lwfinger.ne=
t; alex_lu <alex_lu@realsil.com.cn>; Hilda Wu <hildawu@realtek.com>; Kidman=
Lee <kidman@realtek.com>; Hsin Yu Chang <hsinyu_chang@realtek.com>
Cc: Max Chou <max.chou@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT(USB I/F) FW to 0x099A_25CB

From: Max Chou <max.chou@realtek.com>

    This firmware patch update for Realtek RTL8822C BT controller.(USB
I/F)

    Release Version: 0x099A_25CB

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 rtl_bt/rtl8822cu_fw.bin | Bin 55296 -> 54740 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin index f36e37=
f27aa2801ac84f17820d644a1418b8e082..da029f5fe53de05056daf35aee870fc762e1601=
6 100644 GIT binary patch delta 9059 zcmZ8G30PBC*6$@R8|zEhRV08bf(u|ryFNCR&8=
0JTT&D?`29p<1&{mylE-uwtwBS=3Dw
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
I
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
KNz9|3yz#$Y#8Tk^

delta 9435
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

--
2.17.1

