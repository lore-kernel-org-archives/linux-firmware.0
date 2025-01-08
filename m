Return-Path: <SRS0=9p9Y=UA=yeah.net=flexiblehose03@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA0E77188
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Jan 2025 08:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41F59C4CEE1; Wed,  8 Jan 2025 08:22:03 +0000 (UTC)
Received: from mail-8160.188.com (mail-8160.188.com [60.191.81.60])
	by smtp.kernel.org (Postfix) with ESMTP id D745CC4CEE0
	for <linux-firmware@kernel.org>; Wed,  8 Jan 2025 08:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D745CC4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=/rPLQFow2ndkxhckwZSaZnLqa5Fj3dTMILpNk7RGLms=; b=T
	zwjFjPlh6L1AdQgE7FRbPMpvShM2mz2gTwnEyVGmYo7kn5WL8xFBOet2sjG+MuZP
	lX69Cpbe2Kn9pjidWsF84aLgkveij9k73cf+PxwoQAOQWl6mp+o3XIza2khYrYfN
	noyUdeXoE34Nj4Sde5rTDk6F2lULVNRNzGLEuBVZ9k=
Received: from flexiblehose03$yeah.net ( [114.97.216.243] ) by
 ajax-webmail-wmsvr-207-62 (Coremail) ; Wed, 8 Jan 2025 16:10:31 +0800 (CST)
X-Originating-IP: [114.97.216.243]
Date: Wed, 8 Jan 2025 16:10:31 +0800 (CST)
X-CM-HeaderCharset: UTF-8
From: "DAISY ZHAO" <flexiblehose03@yeah.net>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: hoses inquiry
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn yeah
X-NTES-SC: AL_Qu2YBP+ZvEAo5ySRbOkfmkYQg+c7W8GzuP8v3YBXPJp+jCvnywMQc0FzMV3E/OWUESSTvSinVx1N2+pIYY1hca8UgqoL9JVgzaG66lEWZr51lw==
Content-Type: multipart/alternative; 
	boundary="----=_Part_14426_101520633.1736323831511"
MIME-Version: 1.0
Message-ID: <79344af0.ea2.19444f716d8.Coremail.flexiblehose03@yeah.net>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:Ps8vCgD3Xwn3Mn5niD4KAA--.8047W
X-CM-SenderInfo: xioh5xxeohx0lvhqjqh1hdxhhqhw/1tbiCQjO92d+GWphfQADsN
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

------=_Part_14426_101520633.1736323831511
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RGVhciBNYW5hZ2VyLAoKCldlIG1ha2UgYW5kIGV4cG9ydCBydWJiZXIgYW5kIHB2YyBob3Nlcy4K
U3VjaCBhcyBtZXRhbCBicmFpZGVkIEdhcy9XYXRlciBob3NlLCBJU08zODIxIHdlbGRpbmcgaG9z
ZSwgTFBHIGdhcyBob3NlLCB3YXRlci9haXIgaG9zZSwgcHZjIGxheWZsYXQgd2F0ZXIgaG9zZSwg
VElHIGhvc2UsIGluamVjaXRvbiBob3NlLCBhbmQgb2lsIGhvc2UgZXRjLgoKCklmIHlvdSBuZWVk
IGNhdGFsb2d1ZSBvciBmcmVlIHNhbXBsZSwgd2VsY29tZSB0byBjb250YWN0IHVzLgpUaGFua3M=

------=_Part_14426_101520633.1736323831511
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9z
X01TRm9udFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXpl
OiAxMnB0OyI+RGVhciBNYW5hZ2VyLDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJmb250
LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwg
Q2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7Ij48YnI+PC9z
cGFuPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyBmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7Ij48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46
IDBweDsgZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9u
dFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyI+V2UgbWFrZSBhbmQgZXhwb3J0IHJ1YmJlciBhbmQgcHZjIGhvc2VzLjwvZGl2PjxkaXYgc3R5
bGU9Im1hcmdpbjogMHB4OyBmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwg
QXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250
LXNpemU6IDEycHQ7Ij5TdWNoIGFzIG1ldGFsIGJyYWlkZWQgR2FzL1dhdGVyIGhvc2UsIElTTzM4
MjEgd2VsZGluZyBob3NlLCBMUEcgZ2FzIGhvc2UsIHdhdGVyL2FpciBob3NlLCBwdmMgbGF5Zmxh
dCB3YXRlciBob3NlLCBUSUcgaG9zZSwgaW5qZWNpdG9uIGhvc2UsIGFuZCBvaWwgaG9zZSBldGMu
PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtZmFtaWx5OiBBcHRvcywgQXB0b3Nf
RW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRpY2EsIHNh
bnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46
IDBweDsgZm9udC1mYW1pbHk6IEFwdG9zLCBBcHRvc19FbWJlZGRlZEZvbnQsIEFwdG9zX01TRm9u
dFNlcnZpY2UsIENhbGlicmksIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0
OyI+SWYgeW91IG5lZWQgY2F0YWxvZ3VlIG9yIGZyZWUgc2FtcGxlLCB3ZWxjb21lIHRvIGNvbnRh
Y3QgdXMuPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7IGZvbnQtZmFtaWx5OiBBcHRvcywg
QXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBIZWx2ZXRp
Y2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsiPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdp
bjogMHB4OyBmb250LWZhbWlseTogQXB0b3MsIEFwdG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNG
b250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEy
cHQ7Ij5UaGFua3M8L2Rpdj48L2Rpdj4=
------=_Part_14426_101520633.1736323831511--

