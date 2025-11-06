Return-Path: <SRS0=x3Hz=5O=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A0CCFA0D
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Nov 2025 01:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C01BC4CEF8; Thu,  6 Nov 2025 01:50:59 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3C97C4CEF5
	for <linux-firmware@kernel.org>; Thu,  6 Nov 2025 01:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3C97C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5A61orPwB2168297, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1762393853; bh=qfmvX+lFub9aFvDogyapA9eARnqCQv29tVp71Wuc8RQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=PJjP3HNqPEUtHvK1rcSf2/cCVs5l/2FoIPDyFgjgpOcPy8yPG+MlXZ5NneNmxlBiJ
	 LzD/xniIsslvXk7Hv1P8M44X3yg52/Up2MFj86Dy7LhhcC2SUln/y0LEfgjE7fzenr
	 K4EF1CoXLxDTHF1/kiGF4tSC0mQl8AshL+rIpPl2Cgvp/F4Ir2X2r/dtV6ZHPKIIZ0
	 c9h4qTTunIF5Wi9Yq69TeWeM3JWtIj5YQSI+gHk8iHrzMDAupgnNhU8eUO73ce8OZH
	 3p+QgIlq1TVP2UhF732nHqgUrE4WK6ScS5DpluZdAN+lxSNONwFPITf/KBoRiBNi5H
	 R17m46AL4s3cw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 5A61orPwB2168297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 09:50:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 6 Nov 2025 09:50:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 6 Nov 2025 09:50:53 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Thu, 6 Nov 2025 09:50:53 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>, Zong-Zhe Yang <kevin_yang@realtek.com>
Subject: RE: pull-request: update rtw firmware rtw-fw-2025-11-04
Thread-Topic: pull-request: update rtw firmware rtw-fw-2025-11-04
Thread-Index: AQHcTVWDwVYHJS/OqECSpY3xKh7z3rTk5IRg
Date: Thu, 6 Nov 2025 01:50:52 +0000
Message-ID: <9b7e38119bc348df9aee5d6078da8f0e@realtek.com>
References: <6896693c-d69a-441f-90d3-0c9ee850eb78@RTKEXHMBS04.realtek.com.tw>
In-Reply-To: <6896693c-d69a-441f-90d3-0c9ee850eb78@RTKEXHMBS04.realtek.com.tw>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Ping-Ke Shih <pkshih@realtek.com> wrote:
> Hi,
>=20
> The RTL8852BT v0.29.127.0 and RTL8852B v0.29.128.0 need new BT-coexsitenc=
e
> flow to support them, or BT will get degraded performance. So, revert the=
m
> and re-add them with increasing format suffix. When driver updates
> BT-coexistence flow, it will declare to support these new format.
>=20
> Others are to fix XTAL issue for PS resume, including RTL8852BT, RTL8852B
> and RTL8851B.

Please drop this patchset. I will re-spin a new one. Sorry for the inconven=
ience.=20

