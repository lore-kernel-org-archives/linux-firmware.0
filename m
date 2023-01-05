Return-Path: <SRS0=CW9V=5C=wkresearch.cn=joe.jabari@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD20C53210
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Jan 2023 02:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD388C433F2; Thu,  5 Jan 2023 02:51:35 +0000 (UTC)
Received: from mail-m12747.qiye.163.com (mail-m12747.qiye.163.com [115.236.127.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB3FEC43396
	for <linux-firmware@kernel.org>; Thu,  5 Jan 2023 02:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB3FEC43396
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=wkresearch.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wkresearch.cn
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Received: from wkresearch.cn (localhost [127.0.0.1])
	by mail-m12747.qiye.163.com (Hmail) with ESMTP id E30FA80221;
	Thu,  5 Jan 2023 10:51:08 +0800 (CST)
Content-Type: multipart/alternative; BOUNDARY="=_Part_347404_1939348893.1672887068917"
Message-ID: <AKEAKQC5FR1iFDNWzR0eVaqt.1.1672887068917.Hmail.joe.jabari@wkresearch.cn>
Subject: =?UTF-8?B?QSBwcm9mZXNzaW9uYWwgbWFya2V0IHN1cnZleSBhYm91dCBTdW5mbG93ZXIgT2ls?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 119.51.67.104
MIME-Version: 1.0
Received: from joe.jabari@wkresearch.cn( [119.51.67.104) ] by ajax-webmail ( [127.0.0.1] ) ; Thu, 5 Jan 2023 10:51:08 +0800 (GMT+08:00)
From: "joe.jabari" <joe.jabari@wkresearch.cn>
Date: Thu, 5 Jan 2023 10:51:08 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUNIVh4dGE1IQktISxlLHlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKQlVOSlVNTFVKS09ZV1kWGg8SFR0UWUFZT0tIVUpPTUxLSFVKS0tVS1kG
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzowPjowKjhOPSlKEj0*NSwBKUse
	LRoKD1VKVUpNTElDQ0xLTEtMTEJVMxYaEhdVERQeVREaGRoJEjsMEAkeCB4aCRgTVRgVRVlXWRQV
	HgkYCw9ZQUpXWRILWUFZSkpCVU5KVU1MVUpLT1lXWQgBWUFJT0lMTjcG
X-HM-Tid: 0a857fd6e8f5b21akuuu1855deb29ea

--=_Part_347404_1939348893.1672887068917
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGnvvIFIYXBweSBuZXcgeWVhciEKCgpXZSBhcmUgV0tpbmZvcm1hdGlvbiBMaW1pdGVkIHdoaWNo
IGhhcyBiZWVuIGZvY3VzaW5nIG9uIG1hcmtldCByZXNlYXJjaCBmb3IgMTQgeWVhcnMgYW5kIHNl
cnZlZCBtb3N0IG9mIHRoZSBGb3J0dW5lIDUwMCBjb21wYW5pZXMuCgoKUmVjZW50bHkgd2UgcmVs
ZWFzZWQgYSByZXBvcnQgdGl0bGVkLCAiR2xvYmFsIFN1bmZsb3dlciBPaWwgUmVwb3J0ICYgRm9y
ZWNhc3QgMjAyMi0yMDI3Iu+8jENvbnRlbnQgc3RyYXRlZ2llcyBmb3IgeW91ciBjb21wYW55IHRv
IHVuZGVyc3RhbmQgdGhlIG1hcmtldCB0aGVyZSB3aWxsIGJlIGEgYmlnIGhlbHAsIGlmIHlvdSBu
ZWVkLCB3ZSBhcmUgaGFwcHkgdG8gc2VuZCB5b3UgYW4gaWxsdXN0cmF0ZWQgc2FtcGxlIHJlcG9y
dC4KCgpUaGUgcmVwb3J0IGNvbnRhaW5zIGFuYWx5c2lzIG9mIHRoZSBmb2xsb3dpbmcg77yaCgoK
S2VybmVsCgoKRUZLTyBHcm91cAoKCkFzdG9uCgoKQ2FyZ2lsbAoKCk9wdGltdXMKCgpOdXRyaXN1
bgoKCkRpY2xlIEdyb3VwCgoKTk1HSwoKCkJ1bmdlCgoKTUhQCgoKQ3JlYXRpdmUgR3JvdXAKCgpU
YW5vbmkgSG5vcy4gU2EKCgpTdGFuZGFyZCBGb29kCgoKTlQgTHRkCgoKT2xpeWFyCgoKRGVsaXpp
bwoKClJpc29pbAoKCkNPRkNPCgoKUmVnaW9uCgoKTHVodWEgR3JvdXAKCgpTYW54aW5nIEdyb3Vw
CgoKUG9sb2d5IE9pbAoKCldpbG1hcgoKCkFkYW1zIEdyb3VwCi4uLi4uLgoKCg0KDQo=
--=_Part_347404_1939348893.1672887068917
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwPkhp77yBSGFwcHkgbmV3IHllYXIhPC9wPjxwPjxicj48L3A+
PHA+V2UgYXJlIFdLaW5mb3JtYXRpb24gTGltaXRlZCB3aGljaCBoYXMgYmVlbiBmb2N1c2luZyBv
biBtYXJrZXQgcmVzZWFyY2ggZm9yIDE0IHllYXJzIGFuZCBzZXJ2ZWQgbW9zdCBvZiB0aGUgRm9y
dHVuZSA1MDAgY29tcGFuaWVzLjwvcD48cD48YnI+PC9wPjxwPlJlY2VudGx5IHdlIHJlbGVhc2Vk
IGEgcmVwb3J0IHRpdGxlZCwgIkdsb2JhbCBTdW5mbG93ZXIgT2lsIFJlcG9ydCAmYW1wOyBGb3Jl
Y2FzdCAyMDIyLTIwMjci77yMQ29udGVudCBzdHJhdGVnaWVzIGZvciB5b3VyIGNvbXBhbnkgdG8g
dW5kZXJzdGFuZCB0aGUgbWFya2V0IHRoZXJlIHdpbGwgYmUgYSBiaWcgaGVscCwgaWYgeW91IG5l
ZWQsIHdlIGFyZSBoYXBweSB0byBzZW5kIHlvdSBhbiBpbGx1c3RyYXRlZCBzYW1wbGUgcmVwb3J0
LjwvcD48cD48YnI+PC9wPjxwPlRoZSByZXBvcnQgY29udGFpbnMgYW5hbHlzaXMgb2YgdGhlIGZv
bGxvd2luZyDvvJo8L3A+PHA+PGJyPjwvcD48cD5LZXJuZWw8L3A+PHA+PGJyPjwvcD48cD5FRktP
IEdyb3VwPC9wPjxwPjxicj48L3A+PHA+QXN0b248L3A+PHA+PGJyPjwvcD48cD5DYXJnaWxsPC9w
PjxwPjxicj48L3A+PHA+T3B0aW11czwvcD48cD48YnI+PC9wPjxwPk51dHJpc3VuPC9wPjxwPjxi
cj48L3A+PHA+RGljbGUgR3JvdXA8L3A+PHA+PGJyPjwvcD48cD5OTUdLPC9wPjxwPjxicj48L3A+
PHA+QnVuZ2U8L3A+PHA+PGJyPjwvcD48cD5NSFA8L3A+PHA+PGJyPjwvcD48cD5DcmVhdGl2ZSBH
cm91cDwvcD48cD48YnI+PC9wPjxwPlRhbm9uaSBIbm9zLiBTYTwvcD48cD48YnI+PC9wPjxwPlN0
YW5kYXJkIEZvb2Q8L3A+PHA+PGJyPjwvcD48cD5OVCBMdGQ8L3A+PHA+PGJyPjwvcD48cD5PbGl5
YXI8L3A+PHA+PGJyPjwvcD48cD5EZWxpemlvPC9wPjxwPjxicj48L3A+PHA+Umlzb2lsPC9wPjxw
Pjxicj48L3A+PHA+Q09GQ088L3A+PHA+PGJyPjwvcD48cD5SZWdpb248L3A+PHA+PGJyPjwvcD48
cD5MdWh1YSBHcm91cDwvcD48cD48YnI+PC9wPjxwPlNhbnhpbmcgR3JvdXA8L3A+PHA+PGJyPjwv
cD48cD5Qb2xvZ3kgT2lsPC9wPjxwPjxicj48L3A+PHA+V2lsbWFyPC9wPjxwPjxicj48L3A+PHA+
QWRhbXMgR3JvdXA8L3A+PHA+Li4uLi4uPC9wPjwvZGl2Pjxicj4=
--=_Part_347404_1939348893.1672887068917--
