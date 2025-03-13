Return-Path: <SRS0=jw21=WA=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAA5C282DE
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Mar 2025 07:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6812FC4CEE9; Thu, 13 Mar 2025 07:25:23 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D3E1C4CEDD
	for <linux-firmware@kernel.org>; Thu, 13 Mar 2025 07:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0D3E1C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 52D7PFtM4749306, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741850715; bh=ehdEyZ7t2NqjkWQJiH9DLFhJ2Wh+aNXA1q2mvFdlbuQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KA1Kcb3uM7hyDM14Gu5/NdxgVLliT04J9sJlkpXsfJnsD7WgrGg+x6A5Fa/l8MJAT
	 ygUZqvjBvoE6pBF1yknm/ciMtDOAJlEjOin5g6uLa3a/2bubKXbn9TEZbjyJaHmXMt
	 4+Kc8uv4Wbo4UbskDARQ8ikJ8tuZsCZFFaQh7mVp0tDiCsDiM04Rk0MfPwdJaEjH6S
	 Sp0nhtINrP3irXboRuMavivPwBOuWXZ8OEtpPKqWAGaDxV/SAE1D5Ijhz7padNCrZH
	 LH3LRUHzHBy1hVpb18ll/s5ygPySOBobtVG6UbRK/7xLn5zyDPNkyIpxASDLhj4RH1
	 pQdvj/IRkWZlw==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 52D7PFtM4749306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 15:25:15 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Mar 2025 15:25:15 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 13 Mar 2025 15:25:15 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::4c19:b586:6e71:3622]) by
 RTEXMBS04.realtek.com.tw ([fe80::4c19:b586:6e71:3622%5]) with mapi id
 15.01.2507.035; Thu, 13 Mar 2025 15:25:14 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Zenm Chen <zenmchen@gmail.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
        "usbwifi2024@gmail.com"
	<usbwifi2024@gmail.com>
Subject: RE: [PATCH] rtw88: Add firmware v33.6.0 for RTL8814AE/RTL8814AU
Thread-Topic: [PATCH] rtw88: Add firmware v33.6.0 for RTL8814AE/RTL8814AU
Thread-Index: AQHbk9bmGrCyI8cApEKNr4dejN/4S7NwqjFA
Date: Thu, 13 Mar 2025 07:25:14 +0000
Message-ID: <09b00f3c6d554ef0ab76065284eaf0ec@realtek.com>
References: <20250313051501.2519-1-zenmchen@gmail.com>
In-Reply-To: <20250313051501.2519-1-zenmchen@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Zenm Chen <zenmchen@gmail.com> wrote:
> This file contains the firmware v33.6.0 for RTL8814AE/RTL8814AU and
> was extracted from the vendor driver v5.8.5.1_35583.20191029 from
> https://github.com/morrownr/8814au
>=20
> Signed-off-by: Zenm Chen <zenmchen@gmail.com>

I have confirmed the content is identical to official release, so

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


