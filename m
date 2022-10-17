Return-Path: <SRS0=XmTi=2S=scanred.cn=info@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68DC433FE
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Oct 2022 06:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9198FC433C1; Mon, 17 Oct 2022 06:29:13 +0000 (UTC)
Received: from info.scanred.cn (unknown [117.50.184.211])
	by smtp.kernel.org (Postfix) with ESMTP id D7E42C433D6
	for <linux-firmware@kernel.org>; Mon, 17 Oct 2022 06:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7E42C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=abcglong.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=scanred.cn
Received: from USERMIC-GOBFUE0 (183.12.238.163) by info.scanred.cn id h9jr380e97cn for <linux-firmware@kernel.org>; Mon, 17 Oct 2022 14:28:59 +0800 (envelope-from <info@scanred.cn>)
From: "Kroi" <kroi@abcglong.com>
Subject: test
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Sender: info@scanred.cn
Reply-To: kroi@abcglong.com
Date: Mon, 17 Oct 2022 14:29:00 +0800
X-Priority: 3
X-MSMail-Priority: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Content-Disposition: inline
Message-Id: <20221017062910.D7E42C433D6@smtp.kernel.org>

SGkgRGVhciBmcmllbmQsDQpUaGlzIGlzIEtyb2kgZnJvbSBHTE9ORyAgSW50ZXJuYXRpb25hbCBT
dXBwbHkgTGltaXRlZCB3aGljaCBvbmUgb2YgIFdDQSBNZW1iZXJzaGlwLiAgDQpXZSBhcmUgcHJv
ZmVzc2lvbmFsIG9mIGN1c3RvbXMgY2xlYXJhbmNlIG1hbnkgeWVhcnMgaW4gVVNBLiANCkxldCB1
cyB0YWxrIGFib3V0IGZ1cnRoZXIgaWYgd2UgZ290IGNoYW5jZSB0byB3b3JrLg0KT3VyIFNlcnZp
Y2U6DQpVbml0ZWQgU3RhdGVzIFByb2R1Y3QgcmlnaHRzIHByb3RlY3Rpb24gDQpDdXN0b21zIGNs
ZWFyYW5jZSBhZ2VudCAoTERQIC9ERFUvRERQL0REVS9GT0IpDQpUcnVjayBkZWxpdmVyeQ0KUHJv
ZHVjdCByaWdodHMgcHJvdGVjdGlvbg0KSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBhYm91dCBh
Ym92ZSBzZXJ2aWNlIGluIHRoZSBVbml0ZWQgU3RhdGVzLCB5b3UgY2FuIGNvbnN1bHQgb3VyIGNv
bXBhbnkgYXQgYW55IHRpbWUuDQpXZSBob3BlIHdlIGNhbiBkbyBhIGxvbmctdGVybSBidXNpbmVz
cyByZWxhdGlvbnNoaXAgYW5kIFdlIGJlbGlldmUgd2Ugd2lsbCBwcm92aWRlIGdyZWF0IHNlcnZp
Y2UgZm9yIHlvdS4NCldhaXQgZm9yIHlvdXIgcmVwbHkgc29vbi4NClRoYW5rcw0KQlINCg==
