Return-Path: <SRS0=CFBE=EP=wkdatav.cn=mia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A34C83F15
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Aug 2023 03:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F19E3C433C7; Wed, 30 Aug 2023 03:54:47 +0000 (UTC)
Received: from mail-m120131.xmail.ntesmail.com (mail-m120131.xmail.ntesmail.com [115.236.120.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D93FDC433C8
	for <linux-firmware@kernel.org>; Wed, 30 Aug 2023 03:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D93FDC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wkdatav.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wkdatav.cn
DKIM-Signature: a=rsa-sha256;
	b=EM0qzCh3Y/BHASEA2gOHDIXUxMvEEHVLHqMtO3W2onT1gSWzeq6Qqk6b//Q1aNIkshx5z5/maG9fT/VQOZaA4Z1yu5Q1utmHlgCEjo0ZoJ5GyI4n83MmiB51RKV/QX7TprRI4YkcTRqa0wsxsNaxK/n1dnXEeVOAWkl5XTZZt5g=;
	s=default; c=relaxed/relaxed; d=wkdatav.cn; v=1;
	bh=6AayjWR3NWV9x2V2IQ/GK3ER4PG/Y9wTj6Qxd7snbnI=;
	h=date:mime-version:subject:message-id:from;
Received: from wkdatav.cn (localhost [127.0.0.1])
	by mail-m12744.qiye.163.com (Hmail) with ESMTP id 7F77F100A12;
	Wed, 30 Aug 2023 11:54:30 +0800 (CST)
Content-Type: multipart/alternative; BOUNDARY="=_Part_457209_1868487759.1693367670507"
Message-ID: <ANcA1gBqF7bMR58ABBOGBKqM.1.1693367670507.Hmail.mia@wkdatav.cn>
Subject: =?UTF-8?B?QSBwcm9mZXNzaW9uYWwgbWFya2V0IHN1cnZleSBhYm91dCBFbGVjdHJvbmljIENvbHBvc2NvcGU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 119.51.62.62
MIME-Version: 1.0
Received: from mia@wkdatav.cn( [119.51.62.62) ] by ajax-webmail ( [127.0.0.1] ) ; Wed, 30 Aug 2023 11:54:30 +0800 (GMT+08:00)
From: Mia <mia@wkdatav.cn>
Date: Wed, 30 Aug 2023 11:54:30 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS05NVkNDSB9CTElCTBofGFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKQlVOSlVNSVVNSVlXWRYaDxIVHRRZQVlPS0hVSk1IT09JVU9VSk9ZBg++
X-HM-Tid: 0a8a449416ebb217kuuu18a22340c2b
X-HM-MType: 1
X-HM-NTES-SC: AL0_4z5B86Wr4Tz9jdMF+bhXMX0BDPIZ88wGswHLij7vG3dI6fU8R2h6vJhB5n
	O9gKse3kRALr4Ou2XtLgVJ9qMVmYidiR1X9klIpUV+4Mww9y36ZKxMhjZ1twW0gB83ak8GTNyhbY
	CTqBEaI0z0C/edJim5RCc6pV5ksQxxYTmlZ6M=
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo1GDpKHDkKPUwZNilOQzo5OTQ8
	OTAKNlVKVUpNQkhITUxNTEpJQ0lVMxYaEhdVFhIaOwwQHxoPGg1VGBVFWVdZFBUeCRgLD1lBSldZ
	EgtZQVlKSkJVTkpVTUlVTUlZV1kIAVlBSkxLS0I3Bg++
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org

--=_Part_457209_1868487759.1693367670507
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

QWZ0ZXIgZGV0YWlsZWQgcmVzZWFyY2ggb24gdGhlIEVsZWN0cm9uaWMgQ29scG9zY29wZSBtYXJr
ZXQsIHdlIGFyZSBzdXJlIG91ciByZXBvcnQgY2FuIGhlbHAgeW91IGNhdGNoIG5ldyBvcHBvcnR1
bml0aWVzIGluIDIwMjMuIFNhbXBsZXMgYXJlIGF2YWlsYWJsZS4KVGhlIGZvbGxvd2luZyBwbGF5
ZXJzIGFyZSBjb3ZlcmVkIGluIHRoaXMgcmVwb3J0OgpMZWlzZWdhbmcgCldlbGNoIEFsbHluIApD
ZW50cmVsCk9QVE9NSUMKTWVkR3luCkVjbGVyaXMKRFlTSVMgTWVkaWNhbApMdXRlY2gKQVRNT1MK
V2FsbGFjaApFREFOIEluc3RydW1lbnRzClNlaWxlcgpYdXpob3UgWmhvbmdsaWFuClNUQVIKS2Vy
bmVsCihtb3JlIGNvbXBhbmllcyBhcmUgYXZhaWxhYmxlKQpUaGFua3MgJiBSZWdhcmRzLApXb3Js
ZCBLbm93bGVkZ2UgSW5mb3JtYXRpb24gQ29tcGFueQpUZWw6ICs4NTItNTgwOC0zMTMxCk1vYjog
KzEtODY2LTczOS0zMTMzCkVtYWlsOiBzZWxlbmFAd2tpbmZvcm1hdGlvbi5jbgoKCg0KDQo=
--=_Part_457209_1868487759.1693367670507
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwPkFmdGVyIGRldGFpbGVkIHJlc2VhcmNoIG9uIHRoZSBFbGVj
dHJvbmljIENvbHBvc2NvcGUgbWFya2V0LCB3ZSBhcmUgc3VyZSBvdXIgcmVwb3J0IGNhbiBoZWxw
IHlvdSBjYXRjaCBuZXcgb3Bwb3J0dW5pdGllcyBpbiAyMDIzLiBTYW1wbGVzIGFyZSBhdmFpbGFi
bGUuPC9wPjxwPlRoZSBmb2xsb3dpbmcgcGxheWVycyBhcmUgY292ZXJlZCBpbiB0aGlzIHJlcG9y
dDo8L3A+PHA+TGVpc2VnYW5nJm5ic3A7PC9wPjxwPldlbGNoIEFsbHluJm5ic3A7PC9wPjxwPkNl
bnRyZWw8L3A+PHA+T1BUT01JQzwvcD48cD5NZWRHeW48L3A+PHA+RWNsZXJpczwvcD48cD5EWVNJ
UyBNZWRpY2FsPC9wPjxwPkx1dGVjaDwvcD48cD5BVE1PUzwvcD48cD5XYWxsYWNoPC9wPjxwPkVE
QU4gSW5zdHJ1bWVudHM8L3A+PHA+U2VpbGVyPC9wPjxwPlh1emhvdSBaaG9uZ2xpYW48L3A+PHA+
U1RBUjwvcD48cD5LZXJuZWw8L3A+PHA+KG1vcmUgY29tcGFuaWVzIGFyZSBhdmFpbGFibGUpPC9w
PjxwPlRoYW5rcyAmYW1wOyBSZWdhcmRzLDwvcD48cD5Xb3JsZCBLbm93bGVkZ2UgSW5mb3JtYXRp
b24gQ29tcGFueTwvcD48cD5UZWw6ICs4NTItNTgwOC0zMTMxPC9wPjxwPk1vYjogKzEtODY2LTcz
OS0zMTMzPC9wPjxwPkVtYWlsOiBzZWxlbmFAd2tpbmZvcm1hdGlvbi5jbjwvcD48L2Rpdj48YnI+
--=_Part_457209_1868487759.1693367670507--
