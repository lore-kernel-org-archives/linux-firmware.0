Return-Path: <SRS0=UjEc=JP=craftyguy.net=clayton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9000C48297
	for <linux-firmware@archiver.kernel.org>; Tue,  6 Feb 2024 12:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B7DEC43394; Tue,  6 Feb 2024 12:24:25 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B37FC433F1
	for <linux-firmware@kernel.org>; Tue,  6 Feb 2024 12:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B37FC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=craftyguy.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=craftyguy.net
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4TTj9G0vmNz9spj
	for <linux-firmware@kernel.org>; Tue,  6 Feb 2024 13:24:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
	s=MBO0001; t=1707222258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Wu7vgIBe/xm8jUhTcj04SBAWjhhto0rQINbFQP0iNh8=;
	b=C6KLu35fdchqeW166YSmfanvv76Lum4KHV3sR/RYMuCzy9w9n2uQB6Rf24VteaKl17kh1y
	Uq++8N+8XHezvpA00FlDNmSYey8iRiwAY8kNjEcBxrah7fVGARNOcKJyfWms0prxEQCVIg
	ilHEZkZOVRl9bMEIaHu4dWSojPK+kgwdGIC6gIUchodtcKHU+P+kjkuR3mQsc7Zdt4ofgQ
	s61bYLlnwuaXbPHEsJybu96jws/4nDN6MqyDwYOEskt4UKGXdOXIhZNenNODbmLgoRrUuM
	0pk6V2XntWe1OyO+FlWy0YqLFtbAvJnIuRhog4Wv9EV6H/azjBsgTSUFSM+s+g==
Date: Tue, 6 Feb 2024 04:24:16 -0800
Message-ID: <20240206042416.GB5111@craftyguy.net>
From: clayton@craftyguy.net
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: firmware files located in root of repo
References:
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="a7out1/sw9Mxpcwm"; micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4TTj9G0vmNz9spj


--a7out1/sw9Mxpcwm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

U29tZSBkaXN0cmlidXRpb25zIHNoaXBwaW5nIGxpbnV4LWZpcm13YXJlIChlLmcuIEFscGluZSBM
aW51eCkgc3BsaXQgdGhlCmxpbnV4LWZpcm13YXJlIHByb2plY3QgaW50byBtdWx0aXBsZSBwYWNr
YWdlcyBiYXNlZCBvbiBzdWJkaXJlY3RvcmllcyBpbiB0aGUKcmVwbywgZS5nLiAvYW1kZ3B1IG1p
Z2h0IGJlIGluIGEgbGludXgtZmlybXdhcmUtYW1kZ3B1IHBhY2thZ2UsIHRvIGFsbG93IGZvcgpy
ZWR1Y2luZyB0aGUgcm9vdGZzIHNpemUuIERpc3RybyBpbWFnZXMgYW5kIHVzZXJzIGNhbiBpbnN0
YWxsIG9ubHkgdGhlIGZpcm13YXJlCnRoZXkgbmVlZC4gSWRlYWxseSwgZm9yIHRoaXMgdXNlIGNh
c2UsIGFsbCB2ZW5kb3IgZmlybXdhcmUgaW4gbGludXgtZmlybXdhcmUKd291bGQgYmUgaW4gc3Vi
ZGlyZWN0b3JpZXMuCgppd2x3aWZpIG1ha2VzIHRoaXMgbW9yZSBkaWZmaWN1bHQgdG8gc3VwcG9y
dC4gSSBjYWxsZWQgb3V0IGl3bHdpZmkgYmVjYXVzZSAxKQp0aGUgY29sbGVjdGl2ZSBzaXplIGlz
IGxhcmdlICh+MTc1TUIsIGFsbW9zdCAyMCUgb2YgdGhlIGVudGlyZSBsaW51eC1maXJtd2FyZQpy
ZXBvKSwgMikgdGhlcmUgYXJlIG90aGVyICJmcmVlIGZsb2F0aW5nIiBmaXJtd2FyZSBmaWxlcyBh
dCB0aGUgcm9vdCBvZiB0aGUKcHJvamVjdCBidXQgaXQgaXMgYnkgZmFyIHRoZSB3b3JzdCAib2Zm
ZW5kZXIiLgoKSXMgdGhlcmUgYSByZWFzb24gd2h5IGl3bHdpZmkgKGFuZCBvdGhlcikgZmlybXdh
cmUgaXMgaW4gdGhlIHJvb3Qgb2YgdGhlIHJlcG8KYW5kIG5vdCBpbiBzb21lIHN1YmRpcmVjdG9y
eSAoJ2ludGVsJyA/KSA/IAoKLUNsYXl0b24K

--a7out1/sw9Mxpcwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEkdOrrjmBP3eB7DeWSkztbX7flQoFAmXCJPAACgkQSkztbX7f
lQpT3hAAmoqFi5BxiaFd+08qtTao1Iosh6aA/dsqL1UeQsfPMd+tnA3sMtFfMgFq
i2NxAvOdih9DqT6lmtbKMCpgxA9bJ8TpVWPyVtelqJ8skiQcopR53bNo2c+XrSWy
bXVhJyovH5P57nmuar95rqf4I9NgkZ6/Z0Q4VHHpJvN31xsGXCjTP1UsBEzext07
eRBWSQnrau0eBlYW1CbVl+rmZ81KrwYaNHW3U/zSbv/FMcZwvyhbZHpPXPTtoFdU
0bGw28nYtGAzs/jFmU9uXRbAJ/Ts0GbSNaMPXfYCS/t2JM912lB+joi42hzAKltC
QSxUbh1mkgYM+B5L98Ug3yCKo0RAg6Wr0Wix5FiP55wE/6Ck8sxdziVNBKhlMECn
a41tJQcOJbUHemoikbi7439JArshnW+U5nU0tp3z3GdB+O47SNa7y6Zw02qIobXE
1s7ECLv3NVR/Jh1k0LucMDSN1NoxovZF/WtcXVUnzitTt0hXaetetnyVGJznkA/5
ZdU5Va5Gcwa8GNTafFcr1XfldwqFCeTyJu7UbW/vLR8VZgWga9OYYIzf/cek0WxM
CQzjTkNTVGje1CG/GuBh/x/a7mcAAv8VA5Q9IllSc/5BaTAACCLXoGj4wrC2lUCH
xOoZek1wkqFwXxMdoQ4Zqu+KjshMrchdr0FS0B+1PjB1W8sT6do=
=4zRo
-----END PGP SIGNATURE-----

--a7out1/sw9Mxpcwm--
