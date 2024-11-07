Return-Path: <SRS0=keeq=SC=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40547D3E79A
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Nov 2024 01:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10E63C4CED2; Thu,  7 Nov 2024 01:53:48 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFBB5C4CEC6
	for <linux-firmware@kernel.org>; Thu,  7 Nov 2024 01:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFBB5C4CEC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4A71rddM73686587, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1730944419; bh=ziCAAWGLPQmPvlUixjAWPpWuNu5vC0aayR5nXF2yEQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=CbFOR+LC75WSa38Pr874IRxd99Xen5OaYHpzqrMQthgIdECBuVL1dV47fqAukkOCA
	 1GxbhzYar3PvGleQePWchVMH7ES0h0632yfek52vMnVnhPeo/KpJWI+oeAVrOgcI9q
	 lEY2dtmS6fuSJndxomZYXMXjwB+Nhgv5VgsTH3sgz2d4khnATYwF6zQZMoYoFF7gVu
	 HBCRkulP9zJDASlamz4wQhksXx+39NKFxMM61KsiDQiOj8fcwXT6IgrL/+wuzaRBo0
	 sKibcb44OUaXNXUrG+lDgnvhDSJvsYWEQBEWgRy/o67585oPR14MyakKrTpXtiO3ZL
	 UDQgwl8slg2aw==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4A71rddM73686587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Nov 2024 09:53:39 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 7 Nov 2024 09:53:40 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Nov 2024 09:53:39 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Thu, 7 Nov 2024 09:53:39 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Zenm Chen <zenmchen@gmail.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>,
        "usbwifi2024@gmail.com"
	<usbwifi2024@gmail.com>
Subject: RE: [PATCH] rtw88: Add firmware v52.14.0 for RTL8812AU
Thread-Topic: [PATCH] rtw88: Add firmware v52.14.0 for RTL8812AU
Thread-Index: AQHbMK7JUEuVfeHls02tmolgZA5uerKrDgew
Date: Thu, 7 Nov 2024 01:53:39 +0000
Message-ID: <c9dd95ae55bd4f368f3486d2411571fe@realtek.com>
References: <20241107004830.14261-1-zenmchen@gmail.com>
In-Reply-To: <20241107004830.14261-1-zenmchen@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Zenm Chen <zenmchen@gmail.com> wrote:
> This file contains the firmware for RTL8812AU and was was extracted from
> the vendor driver v5.13.6-23-g232107d9b.20210820 from
> https://github.com/morrownr/8812au-20210820
>=20
> Signed-off-by: Zenm Chen <zenmchen@gmail.com>

Compared and identical with official release.

Acked-by: Ping-Ke Shih <pkshih@realtek.com>


