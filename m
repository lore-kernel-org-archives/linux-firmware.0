Return-Path: <SRS0=eFOr=7M=qualityservice.top=info11@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B117CC6FD1D
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Mar 2023 13:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99035C433D2; Mon, 20 Mar 2023 13:02:17 +0000 (UTC)
Received: from server2.jysoo.top (unknown [182.61.1.79])
	by smtp.kernel.org (Postfix) with ESMTP id AFDCCC433A1
	for <linux-firmware@kernel.org>; Mon, 20 Mar 2023 13:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AFDCCC433A1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=ruiqimfg.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=qualityservice.top
Received: from LAPTOP-37OF0C8K (114.93.123.55) by server2.jysoo.top id h31clc0e97ca for <linux-firmware@kernel.org>; Mon, 20 Mar 2023 21:02:12 +0800 (envelope-from <info11@qualityservice.top>)
From: "Daisy" <daisy.lee@ruiqimfg.com>
Subject: test
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Sender: info11@qualityservice.top
Reply-To: daisy.lee@ruiqimfg.com
Date: Mon, 20 Mar 2023 21:02:15 +0800
X-Priority: 3
X-MSMail-Priority: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Content-Disposition: inline
Message-Id: <20230320130214.AFDCCC433A1@smtp.kernel.org>

RGVhciBQdXJjaGFzZSBtYW5hZ2VyLA0KSSBhbSBEYWlzeSBmcm9tIFNoYW5naGFpIFJ1aXFpIGNv
bXBhbnkuDQpTaGFuZ2hhaSBSdWlxaSBUZWNoLiBDb21wYW55IGhhcyBiZWVuIGluIGJ1c2luZXNz
IGZvciBvdmVyIDEwIHllYXJzLiBXZSBzcGVjaWFsaXplIGluIHByb3ZpZGluZyBjdXN0b21lci1m
b2N1c2VkIHNlcnZpY2VzLCBzdWNoIGFzIHByb2R1Y3QgZGVzaWduLCBwcm9jZXNzLCBzaGlwcGlu
ZyBhbmQgbW9yZS4gT3VyIHRlYW0gb2YgcHJvZmVzc2lvbmFscyBpcyBjb21taXR0ZWQgdG8gcHJv
dmlkaW5nIHRoZSBoaWdoZXN0IHF1YWxpdHkgb2Ygc2VydmljZXMgYXQgY29tcGV0aXRpdmUgcHJp
Y2VzLiANCldlIGFyZSBkZWRpY2F0ZWQgdG8ga2VlcGluZyB1cCB3aXRoIHRoZSBvcHRpbWFsIHBy
b2dyYW0gYW5kIHByb2Nlc3NpbmcgdGVjaG5vbG9neSwgdG8gc3RheSBhaGVhZCBvZiB0aGUgY29t
cGV0aXRpb24gYW5kIGdpdmUgb3VyIGNsaWVudHMgdGhlIGJlc3QgcG9zc2libGUgZXhwZXJpZW5j
ZS4gV2Ugc3RyaXZlIHRvIG1haW50YWluIG91ciByZXB1dGF0aW9uIGZvciBzdXBlcmlvciBjdXN0
b21lciBzZXJ2aWNlIGFuZCB0byBzdGF5IGNvbXBldGl0aXZlIGluIHRoZSBtYXJrZXRwbGFjZS4g
DQpUaGFua3MgZm9yIHlvdXIgdGltZS4gV2UgbG9vayBmb3J3YXJkIHRvIHdvcmtpbmcgd2l0aCB5
b3UgYW5kIGhlbHBpbmcgeW91IHN1Y2NlZWQuDQpCZXN0DQpEYWlzeQ0KU2hhbmdoYWkgUnVpcWkg
VGVjaC4NCkh0dHA6Ly93d3cucnVpcWltZmcuY29tDQo=
