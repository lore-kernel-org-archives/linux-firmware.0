Return-Path: <SRS0=BYXa=44=mediatek.com=erin.lo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,MIME_BASE64_TEXT,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9BAC10F25
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Mar 2020 03:36:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3C12421D56; Wed, 11 Mar 2020 03:36:21 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by mail.kernel.org (Postfix) with ESMTP id 68FE120578
	for <linux-firmware@kernel.org>; Wed, 11 Mar 2020 03:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iERI+jak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68FE120578
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=erin.lo@mediatek.com
X-UUID: 1aa98038cfbd4693bc62a88c2391dbf7-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DPJUQnv87RbzN8dm0Mgk9azwyYcGOhnHBbgcNu92ga0=;
	b=iERI+jak/HtMasoCvWXvUVw192XtrcERlG2u980a1zpgERP8wFU7foQ3UYStKaKb9IoBEKp51wPndZ01t5tthjGJZhPYwV/6NEBtFSh0vg54X+sRXqkXP66IJgZtStHfuirh/KnKuMIsW7yKirTbIWqZYlzOA2upjLNd0dhkwXU=;
X-UUID: 1aa98038cfbd4693bc62a88c2391dbf7-20200311
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
	(envelope-from <erin.lo@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 763538050; Wed, 11 Mar 2020 11:36:16 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 11:35:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 11:35:23 +0800
From: Erin Lo <erin.lo@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<yunfei.dong@mediatek.com>, <maoguang.meng@mediatek.com>,
	<menghui.lin@mediatek.com>, <sj.huang@mediatek.com>, <drinkcat@google.com>,
	<shawnku@google.com>, <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8183 SCP firmware 
Date: Wed, 11 Mar 2020 11:36:01 +0800
Message-ID: <20200311033602.31905-1-erin.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwMTQ4Y2ZlZmNiZjk4ODk4Y2E2NWJi
MjZkOWQ3ZDYzOGIzMGUyMTFkOg0KDQogIE1lcmdlIGh0dHBzOi8vZ2l0aHViLmNvbS9yamxpYW8t
cWNhL3FjYS1idGZ3ICgyMDIwLTAzLTAyIDA4OjA4OjE1IC0wNTAwKQ0KDQphcmUgYXZhaWxhYmxl
IGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vZXJpbmxv
L2xpbnV4X2Z3X3NjcCB2MTI1NzMuNzcNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IGE1MjE1MGQ4ZTFmZTY1OTk0NDY0YjE1ZWExNjJiZGM4OWJhNjFjZTg6DQoNCiAgbWVkaWF0ZWs6
IEFkZCBtdDgxODMgU0NQIGZpcm13YXJlICgyMDIwLTAzLTExIDEwOjM2OjQ1ICswODAwKQ0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQpFcmluIExvICgxKToNCiAgICAgIG1lZGlhdGVrOiBBZGQgbXQ4MTgzIFNDUCBmaXJt
d2FyZQ0KDQogbWVkaWF0ZWsvbXQ4MTgzL3NjcC5pbWcgfCBCaW4gMCAtPiAxMDI3MTA0IGJ5dGVz
DQogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgbWVkaWF0ZWsvbXQ4MTgzL3NjcC5pbWcNCg0K

