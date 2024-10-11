Return-Path: <SRS0=T+tu=RH=163.com=jessie6332@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744B3D24463
	for <linux-firmware@archiver.kernel.org>; Fri, 11 Oct 2024 02:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 326D5C4CEC6; Fri, 11 Oct 2024 02:31:52 +0000 (UTC)
Received: from mail-8160.188.com (mail-8160.188.com [60.191.81.60])
	by smtp.kernel.org (Postfix) with ESMTP id BE336C4CEC5
	for <linux-firmware@kernel.org>; Fri, 11 Oct 2024 02:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE336C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=JaR3t+9C4jx4mRxXKA3ZB2DCHa/vTmOA28YX1w26hAk=; b=A
	wAGD/m5NRTRiQUtiKYoYYknq0Sxf47imOcPPEjYdVFBjTfGEKJcJ+dCtJSPMzUtV
	hR4lFpZMKyxNV3MUnrv4SYaU5tPxTrRggWvcmeoY7ha+/Jd4J19aF0kzo7f84M7X
	74tTHZa0vpXb9TDMhYkh71rdlWvhG2YgRO/UmgCMBc=
Received: from jessie6332$163.com ( [60.168.33.190] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Fri, 11 Oct 2024 10:29:38 +0800
 (CST)
X-Originating-IP: [60.168.33.190]
Date: Fri, 11 Oct 2024 10:29:38 +0800 (CST)
From: Jessie  <jessie6332@163.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: pvc hose
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2ZCvqavE8s7iGbZ+kWmE4Sjug4XMe3s/ov1YJVN5k0oCTB9gkuREZlM2DMyM+VBiqHiSGRaj5oxct+Zbdkb4XDQPXXMFprKowHjclk6A2i
Content-Type: multipart/alternative; 
	boundary="----=_Part_39425_1746261646.1728613778137"
MIME-Version: 1.0
Message-ID: <3cbe1a20.28ae.192796902da.Coremail.jessie6332@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bygvCgDnrzGSjQhn9s0KAA--.18788W
X-CM-SenderInfo: 5mhv2xjhwtjji6rwjhhfrp/1tbiRwN0WmcIH-b3jwADsX
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

------=_Part_39425_1746261646.1728613778137
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgTWFuYWdlciwKCgoKCkdsYWQgdG8gY29udGFjdCB3aXRoIHlvdSEKCgoKClRoaXMgaXMgSmVz
c2llIGZyb20gQ2hpbmEsUFZDIGluZHVzdHJpYWwgaG9zZSBtYW51ZmFjdHVyZXIuCgpEbyB5b3Ug
aGF2ZSB0aGUgbmV3IGRlbWFuZHMgb2YgdGhlIFBWQyB3ZWxkaW5nIGhvc2UgbGlrZSBzaW5nbGUv
dHdpbiBveHlnZW4gYWNldHlsZW5lIGhvc2UsbHBnIGhvc2UsIGFpci93YXRlciBob3NlLHRpZyBo
b3NlLGxheWZsYXQgaG9zZSwgcHZjIHN1Y3Rpb24gaG9zZSBldGMuPwoKCgoKSWYgeWVzLCBwbGVh
c2Ugc2VuZCBtZSBpbnF1aXJ5LCBob3BlIHdlIGNhbiBoYXZlIGEgY2hhbmNlIHRvIGNvb3BlcmF0
ZS4KCgoKCk1vcmUgaW5mb3JtYXRpb24gYW5kIGNhdGFsb2cgd2lsbCBiZSBzZW5kIGlmIHlvdSBu
ZWVkLgoKCgoKV2FpdGluZyBmb3IgeW91ciBraW5kbHkgcmVwbHkuCgoKCgpCZXN0IHJlZ2FyZHMK
Ckplc3NpZQ==
------=_Part_39425_1746261646.1728613778137
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBk
YXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDogMS43OyI+
PGRpdiBpZD0ic3BuRWRpdG9yQ29udGVudCIgc3R5bGU9IiI+PHAgc3R5bGU9Im1hcmdpbjogMHB4
OyI+SGkgTWFuYWdlciw8L3A+PHAgc3R5bGU9Im1hcmdpbjogMHB4OyI+PGJyPjwvcD48cCBzdHls
ZT0ibWFyZ2luOiAwcHg7Ij5HbGFkIHRvIGNvbnRhY3Qgd2l0aCB5b3UhPC9wPjxwIHN0eWxlPSJt
YXJnaW46IDBweDsiPjxicj48L3A+PHAgc3R5bGU9Im1hcmdpbjogMHB4OyI+VGhpcyBpcyBKZXNz
aWUgZnJvbSBDaGluYSxQVkMgaW5kdXN0cmlhbCBob3NlIG1hbnVmYWN0dXJlci48L3A+PHAgc3R5
bGU9Im1hcmdpbjogMHB4OyI+RG8geW91IGhhdmUgdGhlIG5ldyBkZW1hbmRzIG9mIHRoZSBQVkMg
d2VsZGluZyBob3NlIGxpa2Ugc2luZ2xlL3R3aW4gb3h5Z2VuIGFjZXR5bGVuZSBob3NlLGxwZyBo
b3NlLCBhaXIvd2F0ZXIgaG9zZSx0aWcgaG9zZSxsYXlmbGF0IGhvc2UsIHB2YyBzdWN0aW9uIGhv
c2UgZXRjLj88L3A+PHAgc3R5bGU9Im1hcmdpbjogMHB4OyI+PGJyPjwvcD48cCBzdHlsZT0ibWFy
Z2luOiAwcHg7Ij5JZiB5ZXMsIHBsZWFzZSBzZW5kIG1lIGlucXVpcnksIGhvcGUgd2UgY2FuIGhh
dmUgYSBjaGFuY2UgdG8gY29vcGVyYXRlLjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwcHg7Ij48YnI+
PC9wPjxwIHN0eWxlPSJtYXJnaW46IDBweDsiPk1vcmUgaW5mb3JtYXRpb24gYW5kIGNhdGFsb2cg
d2lsbCBiZSBzZW5kIGlmIHlvdSBuZWVkLjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwcHg7Ij48YnI+
PC9wPjxwIHN0eWxlPSJtYXJnaW46IDBweDsiPldhaXRpbmcgZm9yIHlvdXIga2luZGx5IHJlcGx5
LjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwcHg7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDBw
eDsiPkJlc3QgcmVnYXJkczwvcD48cCBzdHlsZT0ibWFyZ2luOiAwcHg7Ij5KZXNzaWU8L3A+PC9k
aXY+PGRpdiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsgZm9udC1mYW1pbHk6IEFyaWFsOyBm
b250LXNpemU6IDE0cHg7IHBvc2l0aW9uOiByZWxhdGl2ZTsgem9vbTogMTsiPjxkaXYgc3R5bGU9
ImNsZWFyOmJvdGgiPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg==
------=_Part_39425_1746261646.1728613778137--

