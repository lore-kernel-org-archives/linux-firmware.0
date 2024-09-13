Return-Path: <SRS0=X4EH=QL=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921E0FA3723
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Sep 2024 07:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 805BDC4CEC6; Fri, 13 Sep 2024 07:34:56 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D225AC4CEC0
	for <linux-firmware@kernel.org>; Fri, 13 Sep 2024 07:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D225AC4CEC0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48D7Ypf862573885, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1726212891; bh=GOtH+8RJl/wTD0A3yc7L1Pq5M80vBwfy9m7TADvt2Mc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	b=ZYPWlN6XftbHWPoUCnD81BY6d+/3O2YeqNdh1rIIPH7/66VT+JpaSAgFyd2Yw+1gW
	 +cUcTUWAVH9CXVss2d71sUldViBY9Sl554dWJ7wJ3WeV5tIsg10PPsGOnqlwtb4NAB
	 dy53ISisfgpJGsy9UzO9Z7KrfdzCckhpjbOkR/cuvxtTMbvsNtIx7nziC5rPAWbVNN
	 72ef75WnHeVoE0CFvHRZJURKI/YLNVn5y8l0zePGQxAuBNk3LgYmNXdc6Crm6P5vdj
	 1qxMdOezxpkFQdjVL6Nw0NLt+cNdVysA5SR+PV3OPYQA6RNncUkk2WpPGKGjx/V6KB
	 R+DQH5PhQ/kdA==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48D7Ypf862573885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 15:34:51 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 15:34:50 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 13 Sep 2024 15:34:50 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f]) by
 RTEXMBS04.realtek.com.tw ([fe80::2882:4142:db9:db1f%11]) with mapi id
 15.01.2507.035; Fri, 13 Sep 2024 15:34:50 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>
Subject: pull request: rtw89: 8922a: add fw format-2 v0.35.42.1
Thread-Topic: pull request: rtw89: 8922a: add fw format-2 v0.35.42.1
Thread-Index: AdsFrxRbFYw1/HcRTNWpL95YKBrH5g==
Date: Fri, 13 Sep 2024 07:34:50 +0000
Message-ID: <28a0ab5067a34a308c155f3ccc08790b@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Hi,

Add rtw89 driver firmware for RTL8922A that firmware version is 0.35.42.1.

Thank you
Ping-Ke

---
The following changes since commit b9daf8c33f02650b79bd1c61d61d6b1fae470e8b=
:

  Merge branch 'amd-staging' into 'main' (2024-09-12 16:05:08 +0000)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2024-09-13

for you to fetch changes up to 5685e14f2a1cf8ce8ee2ab5883eb327c9c9c5d15:

  rtw89: 8922a: add fw format-2 v0.35.42.1 (2024-09-13 15:28:58 +0800)

----------------------------------------------------------------
Chin-Yen Lee (1):
      rtw89: 8922a: add fw format-2 v0.35.42.1

 WHENCE                  |   1 +
 rtw89/rtw8922a_fw-2.bin | Bin 0 -> 1586954 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 rtw89/rtw8922a_fw-2.bin

