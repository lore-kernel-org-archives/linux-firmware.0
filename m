Return-Path: <SRS0=97Ij=BS=163.com=hosesales01@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ABC10854CF
	for <linux-firmware@archiver.kernel.org>; Wed, 18 Mar 2026 02:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71ED0C19425; Wed, 18 Mar 2026 02:58:39 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B8F7C4CEF7
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2026 02:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B8F7C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Y06grafSbd8rIQEGni2L6dlLE/oz1FdSbVMJhNg/JUg=; b=a
	BdWCs0rpHyuogApHA1Gk/QKUBEfLOizuOGqS8d+FLc6BpgO0d54ksOnbFXUdir5C
	x6s1d4Z2DziRmQUc4gPolBttv1vLWvwHQBikbA6bo44NJ+LrHoXZePFny8hS+ZfX
	PXI90t2C2nTYVa4mNGvExXEjDi5y1LGoBQGDI8RBHA=
Received: from hosesales01$163.com ( [60.168.252.211] ) by
 ajax-webmail-wmsvr-40-126 (Coremail) ; Wed, 18 Mar 2026 10:54:14 +0800
 (CST)
X-Originating-IP: [60.168.252.211]
Date: Wed, 18 Mar 2026 10:54:14 +0800 (CST)
From: Danny  <hosesales01@163.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: rubber LPG hose inquiry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20251222(83accb85) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2cAfSbvUwu4iKfZekfm0oSg+w/X8WyuPkj3oRfPph6jA3p+hsSfXJOEEDp1emgLBC1qAKuSAVMxORgQqVyU40u9ogMXcZRqgPpZ0Haw61bHA==
Content-Type: multipart/alternative; 
	boundary="----=_Part_41649_989870266.1773802454282"
MIME-Version: 1.0
Message-ID: <3ab47ce3.2b90.19cfedd7d0b.Coremail.hosesales01@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:figvCgD3v8rWE7ppCmF7AA--.785W
X-CM-SenderInfo: 5krvv2pdoh2iqr6rljoofrz/xtbC8RYDeGm6E9aOSQAA3N
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

------=_Part_41649_989870266.1773802454282
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

R29vZCBkYXkgdG8geW91LgoKCldlIGFyZSBhIHByb2Zlc3Npb25hbCBtYW51ZmFjdHVyZXIgYW5k
IGV4cG9ydGVyIG9mIGluZHVzdHJpYWwgcnViYmVyIGFuZCBQVkMgaG9zZXMuCgoKT3VyIHByb2R1
Y3QgcmFuZ2UgYXMgYmVsb3cgZm9yIHlvdXIgcmVmZXJlbmNlOgpNZXRhbCBCcmFpZGVkIEhvc2U6
IEZvciBnYXMgYW5kIHdhdGVyIGFwcGxpY2F0aW9ucy4KV2VsZGluZyBIb3NlOiBDb21wbGlhbnQg
d2l0aCBJU08gMzgyMSBzdGFuZGFyZC4KTFBHICYgR2FzIEhvc2U6IEZvciBzYWZlIGFuZCByZWxp
YWJsZSBmdWVsIHRyYW5zZmVyLgpXYXRlciAmIEFpciBIb3NlOiBGb3IgZ2VuZXJhbC1wdXJwb3Nl
IHVzZS4KUFZDIExheWZsYXQgV2F0ZXIgSG9zZTogTGlnaHR3ZWlnaHQgYW5kIGVhc3kgdG8gZGVw
bG95LgpTcGVjaWFsdHkgSG9zZTogSW5jbHVkaW5nIFRJRyB3ZWxkaW5nIGhvc2UsIGluamVjdGlv
biBob3NlLCBhbmQgb2lsLXJlc2lzdGFudCBob3NlLgoKCldlIGFyZSBjb21taXR0ZWQgdG8gcHJv
dmlkaW5nIGR1cmFibGUsIHNhZmUsIGFuZCBjb3N0LWVmZmVjdGl2ZSBzb2x1dGlvbnMuCklmIGFu
eSBvZiBvdXIgcHJvZHVjdHMgbWF0Y2ggeW91ciByZXF1aXJlbWVudHMsIG9yIGlmIHlvdSBoYXZl
IGEgc3BlY2lmaWMgYXBwbGljYXRpb24gaW4gbWluZCwgcGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0
byBjb250YWN0IHVzLgpXZSBhcmUgcmVhZHkgdG8gYXNzaXN0IHlvdSBhbmQgcHJvdmlkZSB0aGUg
YmVzdCBzb2x1dGlvbi4KCgpUaGFuayB5b3UgJiBiZXN0IHJlZ2FyZHMs
------=_Part_41649_989870266.1773802454282
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBz
dHlsZT0ibWFyZ2luOjA7Ij5Hb29kIGRheSB0byB5b3UuPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2lu
OjA7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5XZSBhcmUgYSBwcm9mZXNzaW9u
YWwgbWFudWZhY3R1cmVyIGFuZCBleHBvcnRlciBvZiBpbmR1c3RyaWFsIHJ1YmJlciBhbmQgUFZD
IGhvc2VzLgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPjxicj48L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46MDsiPk91ciBwcm9kdWN0IHJhbmdlIGFzIGJlbG93IGZvciB5b3VyIHJlZmVyZW5j
ZToKPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5NZXRhbCBCcmFpZGVkIEhvc2U6IEZvciBn
YXMgYW5kIHdhdGVyIGFwcGxpY2F0aW9ucy4KPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5X
ZWxkaW5nIEhvc2U6IENvbXBsaWFudCB3aXRoIElTTyAzODIxIHN0YW5kYXJkLgo8L2Rpdj48ZGl2
IHN0eWxlPSJtYXJnaW46MDsiPkxQRyAmYW1wOyBHYXMgSG9zZTogRm9yIHNhZmUgYW5kIHJlbGlh
YmxlIGZ1ZWwgdHJhbnNmZXIuCjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+V2F0ZXIgJmFt
cDsgQWlyIEhvc2U6IEZvciBnZW5lcmFsLXB1cnBvc2UgdXNlLgo8L2Rpdj48ZGl2IHN0eWxlPSJt
YXJnaW46MDsiPlBWQyBMYXlmbGF0IFdhdGVyIEhvc2U6IExpZ2h0d2VpZ2h0IGFuZCBlYXN5IHRv
IGRlcGxveS4KPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij5TcGVjaWFsdHkgSG9zZTogSW5j
bHVkaW5nIFRJRyB3ZWxkaW5nIGhvc2UsIGluamVjdGlvbiBob3NlLCBhbmQgb2lsLXJlc2lzdGFu
dCBob3NlLgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPjxicj48L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46MDsiPldlIGFyZSBjb21taXR0ZWQgdG8gcHJvdmlkaW5nIGR1cmFibGUsIHNhZmUs
IGFuZCBjb3N0LWVmZmVjdGl2ZSBzb2x1dGlvbnMuCjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjow
OyI+SWYgYW55IG9mIG91ciBwcm9kdWN0cyBtYXRjaCB5b3VyIHJlcXVpcmVtZW50cywgb3IgaWYg
eW91IGhhdmUgYSBzcGVjaWZpYyBhcHBsaWNhdGlvbiBpbiBtaW5kLCBwbGVhc2UgZG8gbm90IGhl
c2l0YXRlIHRvIGNvbnRhY3QgdXMuCjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+V2UgYXJl
IHJlYWR5IHRvIGFzc2lzdCB5b3UgYW5kIHByb3ZpZGUgdGhlIGJlc3Qgc29sdXRpb24uCjwvZGl2
PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+
VGhhbmsgeW91ICZhbXA7IGJlc3QgcmVnYXJkcyw8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsi
Pgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46
MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJn
aW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJt
YXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0
eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2
IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48
ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rp
dj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPgo8
L2Rpdj48L2Rpdj4=
------=_Part_41649_989870266.1773802454282--

