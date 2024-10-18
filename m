Return-Path: <SRS0=7E3B=RO=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A42D3C541
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Oct 2024 01:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B87C2C4CEC3; Fri, 18 Oct 2024 01:48:21 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03F4DC4CECE
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 01:48:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03F4DC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 49I1m8umD1287289, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1729216088; bh=fYmZlbDI8LwU2ZR9owMoRZlB79TnjT6ZB2KE6ilr3yk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=uJYxvIwhufmMIq1VUUqtQanTnxNZ2DMjBP0k3QSn4qw+zMe5RamoOt3jHodpLKNOE
	 0w+1rFuXQMdCOrr8n98MOKQeAj24EJ5teOPM0ZbMNfF1Ck/CZ/1N22sKlo/AU2TYaH
	 cEqAIEpyKHA8dC0MZw5elbOiS/Q6tsGA+jhB2W5ifwp8KHEsEsQBMMOVbnRcfApsiz
	 1C1RgWi1yQnpigDC2LdCyqMEHn+MgeEH42wWKOQF078zZx6iAUEGZIuMcWHJXW3FNV
	 CQvJdx6CjopSYSUCzEeXZkvTa0m+hoGBxojamsOgb2pKV3NFIty3rHEEnUQQB1HKGb
	 cUWHeBWXPtG6A==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 49I1m8umD1287289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 09:48:08 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 09:48:08 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 18 Oct 2024 09:48:08 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Fri, 18 Oct 2024 09:48:07 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Zenm Chen <zenmchen@gmail.com>,
        "linux-firmware@kernel.org"
	<linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: RE: [PATCH 2/2] rtlwifi: Remove unused firmware images
Thread-Topic: [PATCH 2/2] rtlwifi: Remove unused firmware images
Thread-Index: AQHbIKgrKBNsTJOjZEOj1hqWHuhyqLKLp86Q
Date: Fri, 18 Oct 2024 01:48:07 +0000
Message-ID: <7b298bde63ef426bb01ea463c783d9e3@realtek.com>
References: <20241017152043.10205-1-zenmchen@gmail.com>
 <20241017152043.10205-3-zenmchen@gmail.com>
In-Reply-To: <20241017152043.10205-3-zenmchen@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Zenm Chen <zenmchen@gmail.com> wrote:
> The firmware images below are no longer used by any in-kernel driver,
> so remove them.
>=20
> rtlwifi/rtl8192eu_ap_wowlan.bin
> rtlwifi/rtl8192eu_wowlan.bin
> rtlwifi/rtl8723bs_bt.bin
> rtlwifi/rtl8723bu_ap_wowlan.bin
> rtlwifi/rtl8723bu_wowlan.bin
> rtlwifi/rtl8723defw.bin
> rtlwifi/rtl8822befw.bin
>=20

I have confirmed these files are not used, but distro can select and pick
firmware by module info. Not sure if cleanup is necessary.

By the way, I found some firmware aren't added to MODULE_FIRMWARE():

rtlwifi/rtl8723ae/sw.c:         fw_name =3D "rtlwifi/rtl8723fw_B.bin";
rtlwifi/rtl8821ae/sw.c:         wowlan_fw_name =3D "rtlwifi/rtl8812aefw_wow=
lan.bin";
rtlwifi/rtl8821ae/sw.c:         wowlan_fw_name =3D "rtlwifi/rtl8821aefw_wow=
lan.bin";
...

I will prepare a patch for them.=20


