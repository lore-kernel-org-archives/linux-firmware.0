Return-Path: <SRS0=j3g7=YY=gmail.com=kade.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91597C61CE8
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Jun 2025 14:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6001CC4CEED; Mon,  9 Jun 2025 14:39:04 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 906F8C4CEEB
	for <linux-firmware@kernel.org>; Mon,  9 Jun 2025 14:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 906F8C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a51481a598so2550448f8f.3
        for <linux-firmware@kernel.org>; Mon, 09 Jun 2025 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749479941; x=1750084741; darn=kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gRcAnEJQE1m2jgwRtVY41KA8QpfOkPeS/y88hbROblI=;
        b=iRcKzuI6JrHWR7QiRp4u9CvOBj84wMBvBOZ2cXmx6V9ENmIS5dvPJjAB88alu5gnZq
         lQPVs+iK3ta9jEs/9gZfhPCtRiP/JdjmiOOmUhZfTIlrfgAFpLwsGQ44ccBlGS6c2vu9
         EBPdLSYC3/5dLtF5lrtocih5LxGS6PgImLKAzhDunen3uVRXFY1QWKQ9eRGKAMu8aUfz
         0AmilaqCfvKMMA2vn7DDodRdZmzl7NA6Ekauuv6MGWEfQIoaC5Buz6hMx2elJba/ljtR
         ONwHgv112OPAVRHS/lzX2g4XmMf1ydndCSGTUds/HY79J0hZZq3l+w6N+mfQ0+u4labI
         fHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479941; x=1750084741;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRcAnEJQE1m2jgwRtVY41KA8QpfOkPeS/y88hbROblI=;
        b=H716wPLUChApoLi3vrImZuBVHwamjfJ82baa7oOBujoiIXbGOf/UhURQv4FCJ8d4pf
         9CqPhWyaRK4rb+Md4zxs+nmJ4xa8gppanaPIbHs4VsTBjB+ua/a6uTozIf+5ORi6NYcM
         icFg4L3etIprFzyCFra+Ctt34PrRFv7TY/FAV0P2UK6Tc/7N0Meo2g4uKe2yzWkWCm8h
         738mt/t5mPEpKwMrtvigPRwjdTLjwPawpD1yNskIt9CmVfWrypTCbB3yERhZHjd5r0nI
         Yr14vbyXKE7uuZKyEAwa1lMkUEY9zb+bWsDgFPC+zWiCQRWsZ7mgV0/bqdSrL76cmAen
         DKag==
X-Gm-Message-State: AOJu0YwnZaZ8tnOOGXKEJWvD8yFRPi8eaXb+6BaV1vqlq5JWitE9o21h
	nOvy1aaakRLazmCgN1CDzHZ53L79fFABHzfMCn0A199eD83skx3Z7ljA5/mJaw==
X-Gm-Gg: ASbGncuLJeVXDqonZa8mr6r2zbnPx7gEnQGAh44UZX3KFo2BIzBOqghYCBMwZlvXV/z
	FB0O3Ll+Uad5uc23zuLjPgk5BSZPTmeKmpQS9ncD5aRF2iGcdQKTZr4l9hD+wDnC8Cbd9K/pm6Q
	5oWsjsdiJkRXz/LAB026ovo0FO8TkkXNAQTyq/p8yHhXYVb3fPBh2iJGX2gPPk6MuUtzgNomIZF
	R7b4QSjbu/9szupIXtxMCW7EY3P3Nvt5MaL226ekfijlmmZEmw00xgx99eoDlrbjMi8LCKH52WN
	0XOJSdQEWZ/IzsS1FgXTkeA4CW4FLxcK7wP9H2Wq8WgeRuLLxBsKuXKsDKs8t+oT8qyr/pilT4r
	FY0XnWyyeOg8MCA==
X-Google-Smtp-Source: AGHT+IG0x/PerEIaT308zCsoSheOBLdYUhtowyq+i7dV+DY+c1vXyeyjkpnUjRfDg7zmuyTSYe3SJg==
X-Received: by 2002:a5d:5f88:0:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a531786869mr11839181f8f.13.1749479941537;
        Mon, 09 Jun 2025 07:39:01 -0700 (PDT)
Received: from DESKTOP-A54QG66 ([39.46.231.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322ab413sm9634852f8f.23.2025.06.09.07.39.00
        for <linux-firmware@kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 09 Jun 2025 07:39:00 -0700 (PDT)
Message-ID: <6846f204.df0a0220.1d54d8.d7aa@mx.google.com>
Date: Mon, 09 Jun 2025 07:39:00 -0700 (PDT)
X-Google-Original-Date: 9 Jun 2025 10:39:01 -0400
MIME-Version: 1.0
From: kade.mypackagingpro@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Personalized Bags and Boxes
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksDQoNCldlIG1ha2UgcGVyc29uYWxpemVkIHBhY2thZ2luZ+KAlHR1Y2sgYm94ZXMs
IENCRCBib3hlcywgbWFpbGVyIGJveGVzLCByaWdpZCBib3hlcywgYmFrZXJ5IGJveGVz
LCByZXRhaWwgYm94ZXMsIHNob3BwaW5nIGJhZ3MsIGxhYmVsIHN0aWNrZXJzIGFuZCBt
b3JlLg0KDQpTaW1wbHkgcHJvdmlkZSB1cyB3aXRoIHRoZSBkaW1lbnNpb25zIChMIHgg
VyB4IEgpLCBxdWFudGl0eSwgYW5kIHByZWZlcnJlZCBib3ggc3R5bGUsIGFuZCB3ZSds
bCBwcm92aWRlIHlvdSB3aXRoIGEgY29tcGV0aXRpdmUgcXVvdGUuIFBsdXMsIGZvciBh
IGxpbWl0ZWQgdGltZSwgd2XigJlyZSBhbHNvIHByb3ZpZGluZyBjb21wbGltZW50YXJ5
IGRlc2lnbiBzZXJ2aWNlcyBhbmQgc2hpcHBpbmcgb24gYWxsIG9yZGVycy4NCg0KVGhh
bmtzLCBhbmQgbG9va2luZyBmb3J3YXJkIHRvIHBvdGVudGlhbGx5IHdvcmtpbmcgdG9n
ZXRoZXIuDQoNCkJlc3QgcmVnYXJkcywNCkthZGUgTGF3c29uDQpNYXJrZXRpbmcgRXhl
Y3V0aXZlDQpNeSBQYWNrYWdpbmcgUHJvLg==

