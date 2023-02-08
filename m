Return-Path: <SRS0=Rv/9=6E=kayleigl.top=info@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14921C636CC
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Feb 2023 13:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D20FAC433EF; Wed,  8 Feb 2023 13:25:35 +0000 (UTC)
Received: from info.kayleigl.top (unknown [120.48.94.202])
	by smtp.kernel.org (Postfix) with ESMTP id 21012C433D2
	for <linux-firmware@kernel.org>; Wed,  8 Feb 2023 13:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21012C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=zxprinter.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=kayleigl.top
Received: from SD-20220828ZQZU (113.83.185.75) by info.kayleigl.top id hsehcq0e97c8 for <linux-firmware@kernel.org>; Wed, 8 Feb 2023 21:25:30 +0800 (envelope-from <info@kayleigl.top>)
From: "ZX PRINTER" <sale@zxprinter.com>
Subject: Prnting Quote
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Sender: info@kayleigl.top
Reply-To: sale@zxprinter.com
Date: Wed, 8 Feb 2023 21:25:29 +0800
X-Priority: 3
X-MSMail-Priority: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Content-Disposition: inline
Message-Id: <20230208132533.21012C433D2@smtp.kernel.org>

SGVsbG8sDQoNCldlIGFyZSBzcGVjaWFsaXplZCBpbiBwcmludGluZyBib29rLCBjYXRhbG9nLCBt
YWdhemluZSwgYmlibGUsIGJveCwgYmFnLCBlbnZlbG9wZSwgcG9zdGVyLCBzdGlja2VyLCBub3Rl
cGFkLCBiYW5uZXIgYW5kIG1hbnkgbW9yZSwgOTAlIG9mIG91ciBwcmludGluZyBwcmljZXMgYXJl
IGxvdywgd2l0aCBoaWdoIHF1YWxpdHkuDQoNCkxvb2tpbmcgZm9yd2FyZCB0byB3b3JraW5nIHdp
dGggeW91IQ0KDQpNYW55IHRoYW5rcyENCktpbmRlc3QgUmVnYXJkcywNCg0KWlggUFJJTlRJTkcg
VEVBTQ0KaHR0cHM6Ly93d3cuenhwcmludGVyLmNvbQ0KVGVsOiArODYtMDc1Mi0yNjkwNTY2DQo=
