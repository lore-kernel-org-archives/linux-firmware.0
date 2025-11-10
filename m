Return-Path: <SRS0=GykT=5S=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A6BCCFA1A
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Nov 2025 03:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B4CAC16AAE; Mon, 10 Nov 2025 03:03:13 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06B94C4CEFB
	for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 03:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06B94C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AA3364P0738589, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1762743786; bh=CaoogGrl0PAOi1ROMQBc+vl3ErVXIW2CC5YYm9CaxFo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ryuh8VAgxfAcYLa/wAbew0kqq5VfWrGF0LbR4h7NP1j5K3DwhmRlcASGoPWmJyBeI
	 9duuMU9NuzPZ25tHomVNGtmPP/6PJMbZs8QX2NDF/hG2Q2Ez1LT0F4igzWD88SiH2j
	 a2Dbfmq0985KPTXXeNbsJV1rVBzdJeFiuIQ2Ihfwz+60WssZvdwCeruEj2BfAmBd1y
	 N83BZ4gW0WybvxU+vXwDJmCk4j8F7DcjxEY1a6iRpSOTPDZqFjT5uNlsVR8v3Yzl80
	 0FtdhZHKDv7XZo9ksCozNmSEVVPcbEkhpS7Hc4bj5TRCvQdvwfhjVlVueSZebOXIjj
	 ZNWzanGGs/z6g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5AA3364P0738589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Nov 2025 11:03:06 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 10 Nov 2025 11:03:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 10 Nov 2025 11:03:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Mon, 10 Nov 2025 11:03:06 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Zenm Chen <zenmchen@gmail.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: RE: [PATCH] rtw88: 8822b: Update firmware to v30.20.0
Thread-Topic: [PATCH] rtw88: 8822b: Update firmware to v30.20.0
Thread-Index: AQHcUc0WpSvFGsRUuU+F+4O1ZZ4LurTrOKeg
Date: Mon, 10 Nov 2025 03:03:06 +0000
Message-ID: <aa1a0c67256f416584c9099496cc2aff@realtek.com>
References: <20251109230315.6899-1-zenmchen@gmail.com>
In-Reply-To: <20251109230315.6899-1-zenmchen@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Zenm Chen <zenmchen@gmail.com> wrote:
> Sent: Monday, November 10, 2025 7:03 AM
> This firmware was extracted from the vendor driver for RTL88x2BU
> v5.13.1-30-g37e60b26a.20220819_COEX20220812-18317b7b from
> https://github.com/RinCat/RTL88x2BU-Linux-Driver
>=20
> Signed-off-by: Zenm Chen <zenmchen@gmail.com>

I confirmed the binary is identical as release version, so

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

> ---
> Some people said this firmware fixed certain problems [1][2], so upstream=
 it.
> Only tested with RTL8822BU, NOT SURE IF RTL8822BE/RTL8822BS WORK FINE
> WITH IT.

I tested RTL8822BE and no obvious fault.=20

Look back into vendor driver, all interfaces use the same firmware, so I
think it will be fine.=20


