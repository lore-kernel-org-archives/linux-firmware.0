Return-Path: <SRS0=GiXo=AR=dolce-energy.com=dev.delaboetie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E1BEF99D0
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Feb 2026 19:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 802FDC19421; Fri, 13 Feb 2026 19:29:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3AA68C116C6
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 19:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3AA68C116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=dolce-energy.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dolce-energy.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46AFC43208
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolce-energy.com;
	s=gm1; t=1771010972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
	bh=Tyc/on8zp+2hrY3ug2wSpp/ThESEcAp7pr2nfK9H5q4=;
	b=Pj5gZ91lqQ4xz6gqXUQOhbgjtTMWWAd8VLhckqIWgKGNVjmcG7LlbgFXU2/5/xjd2NwWze
	I6mAOzSAmAPvzQGL/xuLQvcPEJDAY15+H/ZIVf3XQpm2neUpIVZBcc0BqV5Q1r8mWl5rEx
	ijr/p3q1FQ2zUYf2qamk+BapCwx8tVk39g5JWP9LYhCqiKlxEdAAbJsqSxZVHRpqnUjHNa
	q5bK0UnHHRmSSARv1El+H8hYRdJQwxiysJRdu+uD01kQQa+uyjiSS0gcaoow00+m4Z6TNe
	3IsQHol/Clnd+XL2v5h94yyu/rbiCwguKeSaDA+azfjVMle2itkW3nGvkKTHzA==
Message-ID: <1b8eef8d-c520-471f-ac11-b804ef77e847@dolce-energy.com>
Date: Fri, 13 Feb 2026 20:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: jlmxyz <dev.delaboetie@dolce-energy.com>
Autocrypt: addr=dev.delaboetie@dolce-energy.com; keydata=
 xjMEZZA8UhYJKwYBBAHaRw8BAQdAbd2WvfsgyRt/p2o4FDi3s97bBCEvCP+JXg7n8zfuPz/N
 KGpsbXh5eiA8ZGV2LmRlbGFib2V0aWVAZG9sY2UtZW5lcmd5LmNvbT7CkwQTFgoAOxYhBFWC
 OIMHXhCZHDBissg7u6RE4bfDBQJlkDxSAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEMg7u6RE4bfDTeEBAK3sTbbufTUPb9nuwFrfNxMWza8cIu5BodA8XFfCYpPNAQCQ5UQm
 D8X2fsVvz8vjsRxrktuyKb8aqNvpwD8NkBPLBM44BGWQPFISCisGAQQBl1UBBQEBB0DIWIvq
 Iy0eD/hZXKJnc6Nww/l6BDDWllIkiKI19rElegMBCAfCeAQYFgoAIBYhBFWCOIMHXhCZHDBi
 ssg7u6RE4bfDBQJlkDxSAhsMAAoJEMg7u6RE4bfD2K0A/RKQB5KltujYVN+ZGk5Ed0jU73qA
 boTn1yGQFMEwepyCAQCX5aNMhIqYGb/55IVYYu5UdxDM/4idQPepRDDx0MotCQ==
Subject: rtl_bt/rtl8852bu_fw.bin Major stability regression
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vHInp3WEzNr42SKJmrQHbkUa"
X-GND-Sasl: jl.m.a.l.e.t@dolce-energy.com
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdeltdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfvffhufgtsehgtderredtvdejnecuhfhrohhmpehjlhhmgiihiicuoeguvghvrdguvghlrggsohgvthhivgesugholhgtvgdqvghnvghrghihrdgtohhmqeenucggtffrrghtthgvrhhnpeetudetheegffeukeehgfdvffehueefledtieeuheeihfevhfekfefhgffhfeetgfenucffohhmrghinhepghgvnhhtohhordhorhhgnecukfhppedujeeirddukedvrddugedvrddvvdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudekvddrudegvddrvddvledphhgvlhhopegludelvddrudeikedrudehvddrjegnpdhmrghilhhfrhhomhepuggvvhdruggvlhgrsghovghtihgvseguohhltggvqdgvnhgvrhhghidrtghomhdpqhhiugepgeeitefhveegfedvtdekpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhfihhrmhifrghrvgeskhgvrhhnvghlrdhorhhg

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vHInp3WEzNr42SKJmrQHbkUa
Content-Type: multipart/mixed; boundary="------------qV8CdLe1sf4CVtAdT5Xw9AL0";
 protected-headers="v1"
Message-ID: <1b8eef8d-c520-471f-ac11-b804ef77e847@dolce-energy.com>
Date: Fri, 13 Feb 2026 20:29:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: jlmxyz <dev.delaboetie@dolce-energy.com>
Autocrypt: addr=dev.delaboetie@dolce-energy.com; keydata=
 xjMEZZA8UhYJKwYBBAHaRw8BAQdAbd2WvfsgyRt/p2o4FDi3s97bBCEvCP+JXg7n8zfuPz/N
 KGpsbXh5eiA8ZGV2LmRlbGFib2V0aWVAZG9sY2UtZW5lcmd5LmNvbT7CkwQTFgoAOxYhBFWC
 OIMHXhCZHDBissg7u6RE4bfDBQJlkDxSAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEMg7u6RE4bfDTeEBAK3sTbbufTUPb9nuwFrfNxMWza8cIu5BodA8XFfCYpPNAQCQ5UQm
 D8X2fsVvz8vjsRxrktuyKb8aqNvpwD8NkBPLBM44BGWQPFISCisGAQQBl1UBBQEBB0DIWIvq
 Iy0eD/hZXKJnc6Nww/l6BDDWllIkiKI19rElegMBCAfCeAQYFgoAIBYhBFWCOIMHXhCZHDBi
 ssg7u6RE4bfDBQJlkDxSAhsMAAoJEMg7u6RE4bfD2K0A/RKQB5KltujYVN+ZGk5Ed0jU73qA
 boTn1yGQFMEwepyCAQCX5aNMhIqYGb/55IVYYu5UdxDM/4idQPepRDDx0MotCQ==
Subject: rtl_bt/rtl8852bu_fw.bin Major stability regression

--------------qV8CdLe1sf4CVtAdT5Xw9AL0
Content-Type: multipart/mixed; boundary="------------VbFmVOC2cprUHoq8BX0wVed9"

--------------VbFmVOC2cprUHoq8BX0wVed9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkRvbid0IGtub3cgaWYgdGhpcyB0aGUgd2F5IHRvIHJlcG9ydCBhIHN0YWJpbGl0
eSBpc3N1ZSByZWxhdGVkIHRvIGEgDQpmaXJtd2FyZS4uLi4uIHRoZXJlIGlzIG5vIGJ1Z3Ry
YWNrZXIgb24gZ2l0bGFiLg0KDQptb3N0IG9mIHRoZSBkZXRhaWxzIGFyZSANCmh0dHBzOi8v
Zm9ydW1zLmdlbnRvby5vcmcvdmlld3RvcGljLXAtODg3OTI0Ni5odG1sIzg4NzkyNDYNCg0K
SSBoYXZlIGEgSUQgMGJkYTpiODViIFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3JwLiBCbHVl
dG9vdGggUmFkaW8gdGhhdCANCnVzZSBydGxfYnQvcnRsODg1MmJ1X2Z3LmJpbg0KDQphZnRl
ciB1cGdyYWRpbmcgdGhlIGZ3IGZyb20gMHgwOThiMTU0YiB0byAweDQyZDM0ZTA0IHZlcnNp
b24gKGFjY29yZGluZyANCnRvIGdlbnRvbyBlYnVpbGQgdmVyc2lvbiwgaXQncyBiZXR3ZWVu
IDIwMjUtMTEtMTEgYW5kIDIwMjUtMTEtMjUgSSBoYXZlIA0KbWFqb3IgaW5zdGFiaWxpdHkN
Cg0Kb24gMHgwOThiMTU0YiBpdCBjb3VsZCBoYXBwZW5zIHRoYXQgdGhlIG1vdXNlIGdvdCBk
aXNjb25uZWN0ZWQsIGJ1dCBpdCANCndhcyBzbyBpbmZyZXF1ZW50IHRoYXQgSSBkaWRuJ3Qg
c2VhcmNoZWQgdGhlIGNhdXNlIChzZXZlcmFsIGRheXMtd2Vla3MgDQp3aXRob3V0IGlzc3Vl
KQ0KDQpvbiAweDQyZDM0ZTA0IHRoZSBkaXNjb25uZWN0IGlzIGJldHdlZW4gZWFjaCBob3Vy
IHRvIGEgZGF5DQoNCm9ubHkgcG93ZXItb2ZmLW9uIGN5Y2xlIGRvIGFsbG93IGJsdWV0b290
aCBkZXZpY2UgdG8gd29yayBhZ2Fpbi4gVGhlIA0KbGluayBzZWVtcyB0byBiZSBzdGlsbCBv
biBiZWNhdXNlIHVzaW5nIGJsdWV0b290aGN0bCBkaXNjb25uZWN0IGRvZXMgDQpicmluZ3Mg
dGhlIG1vdXNlIGJhY2sgaW4gc2VhcmNoIG1vZGUgKGxlZCBzbG93IGJsaW5raW5nIHdoZW4g
dGhlIGxpbmsgaXMgDQpvZmYsIGxlZCBvZmYgd2hlbiBjb25uZWN0aW9uIGlzIG9uKS4gVGhl
cmUgaXMgbm90aGluZyBpbiBsb2cgdGhhdCBzaG93IGEgDQpkaXNjb25uZWN0LCB0aGUgdWRl
diBkZXZpY2UgaXMgc3RpbGwgdGhlcmUsDQoNCkJlc3QgcmVnYXJkcw0KDQpKTE0NCg0KDQo=

--------------VbFmVOC2cprUHoq8BX0wVed9
Content-Type: application/pgp-keys; name="OpenPGP_0xC83BBBA444E1B7C3.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC83BBBA444E1B7C3.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZZA8UhYJKwYBBAHaRw8BAQdAbd2WvfsgyRt/p2o4FDi3s97bBCEvCP+JXg7n
8zfuPz/NKGpsbXh5eiA8ZGV2LmRlbGFib2V0aWVAZG9sY2UtZW5lcmd5LmNvbT7C
kwQTFgoAOxYhBFWCOIMHXhCZHDBissg7u6RE4bfDBQJlkDxSAhsDBQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEMg7u6RE4bfDTeEBAK3sTbbufTUPb9nuwFrf
NxMWza8cIu5BodA8XFfCYpPNAQCQ5UQmD8X2fsVvz8vjsRxrktuyKb8aqNvpwD8N
kBPLBM44BGWQPFISCisGAQQBl1UBBQEBB0DIWIvqIy0eD/hZXKJnc6Nww/l6BDDW
llIkiKI19rElegMBCAfCeAQYFgoAIBYhBFWCOIMHXhCZHDBissg7u6RE4bfDBQJl
kDxSAhsMAAoJEMg7u6RE4bfD2K0A/RKQB5KltujYVN+ZGk5Ed0jU73qAboTn1yGQ
FMEwepyCAQCX5aNMhIqYGb/55IVYYu5UdxDM/4idQPepRDDx0MotCQ=3D=3D
=3Dcx9x
-----END PGP PUBLIC KEY BLOCK-----

--------------VbFmVOC2cprUHoq8BX0wVed9--

--------------qV8CdLe1sf4CVtAdT5Xw9AL0--

--------------vHInp3WEzNr42SKJmrQHbkUa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRVgjiDB14QmRwwYrLIO7ukROG3wwUCaY97mgUDAAAAAAAKCRDIO7ukROG3w7cO
AQCsj4S87DIxVtRboneCjagghTViRMMSGO+vzbZmioh4gAEA3oJMuDIub79SWw9hGu6z+ouSU9cB
mEc3UgqSN8Ii5ww=
=dY6G
-----END PGP SIGNATURE-----

--------------vHInp3WEzNr42SKJmrQHbkUa--
