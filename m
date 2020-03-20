Return-Path: <SRS0=p8by=5F=mediatek.com=erin.lo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,MIME_BASE64_TEXT,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A1AC4332D
	for <linux-firmware@archiver.kernel.org>; Fri, 20 Mar 2020 07:13:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E5C6B20777; Fri, 20 Mar 2020 07:13:41 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by mail.kernel.org (Postfix) with ESMTP id 184B820776
	for <linux-firmware@kernel.org>; Fri, 20 Mar 2020 07:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iQ5dSost"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 184B820776
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=erin.lo@mediatek.com
X-UUID: fe6e58230481426591d35cee78bd5517-20200320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k58APG24uidmU5v8KtptUOGOeNfiLEWeS+xyzZ6fKUI=;
	b=iQ5dSost9Wnho3MFg3aDcFx5NtUWxkTmfe3IuhR1yUa6k0WtBY+nXG7GX5BeU5nqaHFKmoUCyHUvm5qfWIoPRi6Ayw4aRQg2fHtOnaLwGJw78oH138t61PAQw76pjuIrUwPwEJBqWH2T5pm2Qk3uliHu0jroGLlC6n+EcPX4ZDg=;
X-UUID: fe6e58230481426591d35cee78bd5517-20200320
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
	(envelope-from <erin.lo@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 972960322; Fri, 20 Mar 2020 15:13:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 15:12:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Mar 2020 15:13:37 +0800
From: Erin Lo <erin.lo@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
	<yunfei.dong@mediatek.com>, <maoguang.meng@mediatek.com>,
	<menghui.lin@mediatek.com>, <sj.huang@mediatek.com>, <erin.lo@mediatek.com>,
	<drinkcat@google.com>, <shawnku@google.com>, <srv_heupstream@mediatek.com>
Subject: pull request v2: linux-firmware: Create Mediatek MT8183 SCP firmware  
Date: Fri, 20 Mar 2020 15:11:42 +0800
Message-ID: <20200320071143.4225-1-erin.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64

SGksIG1haW50YWluZXJzLA0KQ2hhbmdlcyBzaW5jZSB2MToNCiAtIEFkZCBpbmZvcm1hdGlvbiB0
byBXSEVOQ0UNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAwMTQ4Y2ZlZmNi
Zjk4ODk4Y2E2NWJiMjZkOWQ3ZDYzOGIzMGUyMTFkOg0KDQogIE1lcmdlIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yamxpYW8tcWNhL3FjYS1idGZ3ICgyMDIwLTAzLTAyIDA4OjA4OjE1IC0wNTAwKQ0KDQph
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1
Yi5jb20vZXJpbmxvL2xpbnV4X2Z3X3NjcCB2MTI1NzMuNzcNCg0KZm9yIHlvdSB0byBmZXRjaCBj
aGFuZ2VzIHVwIHRvIDNjMjEzYWE1OTY2MWM0NjQxZjBjMjE2NmEzMTUxNDBhYzA0NDUyMzA6DQoN
CiAgbWVkaWF0ZWs6IEFkZCBtdDgxODMgU0NQIGZpcm13YXJlICgyMDIwLTAzLTIwIDE0OjM3OjQ5
ICswODAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpFcmluIExvICgxKToNCiAgICAgIG1lZGlhdGVrOiBBZGQgbXQ4
MTgzIFNDUCBmaXJtd2FyZQ0KDQogV0hFTkNFICAgICAgICAgICAgICAgICAgfCAgMTggKysrKysr
KysrKysrKysrKysrDQogbWVkaWF0ZWsvbXQ4MTgzL3NjcC5pbWcgfCBCaW4gMCAtPiAxMDI3MTA0
IGJ5dGVzDQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IG1lZGlhdGVrL210ODE4My9zY3AuaW1nDQoNCg==

