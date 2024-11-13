Return-Path: <SRS0=rA0X=SI=163.com=ichibangroup01@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE17D597C5
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 02:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43DBAC4CED4; Wed, 13 Nov 2024 02:52:52 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.kernel.org (Postfix) with ESMTP id E40DFC4CECD
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 02:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E40DFC4CECD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lianfa-group.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=PhOcK4XXJjPPYzxvB/rTBMp8MGaLoGuIXuyonJo6JMI=; b=h
	ee4xweq1Kr6Hje/aKgXtge8eYds8GdQqOreDwq8pc5uST26lY/+dInccJFX9kesX
	J/UJuf7d9AtVXxy1izbiFzlIj4B92fpHbeyb2NWOGLgWGD5KDNl4sHe395cBb2wF
	Hi22/3iiClSLz5e9D4HRgV4XB+3MtO7wGbGULbznlU=
Received: from sales2$lianfa-group.net ( [60.168.38.232] ) by
 ajax-webmail-wmsvr-40-122 (Coremail) ; Wed, 13 Nov 2024 10:51:15 +0800
 (CST)
X-Originating-IP: [60.168.38.232]
Date: Wed, 13 Nov 2024 10:51:15 +0800 (CST)
From: "daisy.zhao" <sales2@lianfa-group.net>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: inquiry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
Sender: ichibangroup01@163.com
X-NTES-SC: AL_Qu2YA/iduUos4ySYYekfm0oSg+w/X8WyuPkj3oRfPph6jDHp8SoHcW5SMFrX6Me0MiyVmgmGVzRy9dtUZI5BQagLcbHHvA1PI/6dPKS2NEKgHw==
Content-Type: multipart/alternative; 
	boundary="----=_Part_49234_213254243.1731466275409"
MIME-Version: 1.0
Message-ID: <4a2df49b.3284.193236eaa52.Coremail.sales2@lianfa-group.net>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eigvCgDnr0MjFDRn_5clAA--.25185W
X-CM-SenderInfo: plfkxuxdqj20lxsqiqqrwthudrp/1tbiXRCW32c0DHmwdQAAsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

------=_Part_49234_213254243.1731466275409
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhcgoKCgoKV2UgYXJlIHN1cHBsaWVyIG9mIHN0YWlubGVzcyBzdGVlbCBicmFkZWQgZmxleGli
bGUgaG9zZSBmb3Igd2F0ZXIgb3IgZ2FzLgoKRnJlZSBjYXRhbG9ndWUgYW5kIHNhbXBsZXMgd2ls
bCBiZSBzZW50IGlmIHlvdSBuZWVkLgoKCgoKVGhhbmtzLg==
------=_Part_49234_213254243.1731466275409
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PHAgc3R5
bGU9Im1hcmdpbjowOyI+RGVhcjwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48YnI+PC9wPjxwIHN0
eWxlPSJtYXJnaW46MDsiPldlIGFyZSBzdXBwbGllciBvZiBzdGFpbmxlc3Mgc3RlZWwgYnJhZGVk
IGZsZXhpYmxlIGhvc2UgZm9yIHdhdGVyIG9yIGdhcy48L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+
RnJlZSBjYXRhbG9ndWUgYW5kIHNhbXBsZXMgd2lsbCBiZSBzZW50IGlmIHlvdSBuZWVkLjwvcD48
cCBzdHlsZT0ibWFyZ2luOjA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPlRoYW5rcy48
L3A+PC9kaXY+
------=_Part_49234_213254243.1731466275409--

