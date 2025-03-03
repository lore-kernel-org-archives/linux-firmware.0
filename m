Return-Path: <SRS0=2ndo=VW=gmail.com=philip.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956C1C282C6
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Mar 2025 19:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E6B2C4CEE6; Mon,  3 Mar 2025 19:35:01 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52D26C4CED6
	for <linux-firmware@kernel.org>; Mon,  3 Mar 2025 19:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52D26C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so2456749f8f.2
        for <linux-firmware@kernel.org>; Mon, 03 Mar 2025 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741030498; x=1741635298; darn=kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HCSIRiPLOeXZoxxmR5pfHcDKKtu1bEfAJbNrWGlpH1c=;
        b=GadTuqp2ADlbG3Emny0NSbVqCAePRyFV5zrn8gPnIL7lwVn6byRKumij3IDpiuMMqU
         CBlDE1In5hUpYm7rMDKmYzZt+wCe+Z2bkOmtz5VKkSmp9ygquk6UIfag6FRbsh//LsBp
         JAXMkLrHIvjNU9TrwFuLsYole73+Q52SDpLvzlhtrbFTFaZ4ikicKRsg+TY71zBOy/kB
         08qpKZ3JNH+YgON0yvpFeYmvlclvilaJUrIsFrntu/0vtwpMLO2b7lscuwFinyfUc0LR
         JRq9MVJZqtLE1fjg1Eu/Kf7Ps8JtjwPvljp6AOF7W66hVppfi5Gkl0z8kvyeVrKBoR5H
         WzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741030498; x=1741635298;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCSIRiPLOeXZoxxmR5pfHcDKKtu1bEfAJbNrWGlpH1c=;
        b=adjkcnyUmj3GVL1rm5NRgzAO50Lla+YZ5Ucgdby1OYssnlGXUk0rWPrniIte3CJYAw
         3fl3D66wD07NERCC7j1vefqU5Jwv03rGercBr0DV8AlEGpNgJot2erdOlT9wLNpLI4q1
         cjIYGKnnNFN9Q91xPnbPhq8QsyXL5SDJ9ojQlphU8oSiInrQIt0KoNjKnQwmb82mk5k1
         rIjqhiv8Tmu0shGjrWkEC9XIjLWmZ1PxrWM3IPti+ENIGFzYSEyaaqjHdHPRTM9oY2Wi
         4o5mzYPLP0yB9DdN/xMZgYVukASMnAAyKVQNonq+cY94tr0hHfqAf85pie9+f1yDgxfN
         qP3w==
X-Gm-Message-State: AOJu0YymnPstEjShrV8LlGuuyENrNvNBiaXX93ZQRg3wVGlGan4a1N26
	5fwhf6Hl0xdUO7DR/qa7NQ7UzK8Hb25MhB806o/xM6vZ6s+7aBjaLwS+pCow
X-Gm-Gg: ASbGncsepgONVMjtlm7X4a7QCWW37aARIAcLDzx/mast3WzAUEnVikgK+VNp2fOljBF
	kX7riv7up6FvuVAKsZWgOqssJGaHtqTz7StnvwFYpC1aiTyTL05B8K5Yuc1HroZwUig0gXame3E
	VlaoBHdoRS0sEJsiaQYyCDS6Q60w3W+TXO3AkttRiRXvLmcL1CW5BDcYWpAHBIaRsMThdiK3Dln
	ureuX74OxeeYah1K2uqCqQhR5VDaCiUwHxQSOCxHhyvVTP3OdODiRAIea1+TjAtc9LP3GQljxgh
	02xz5GN9wfr/1Bi8jJi1/m7v9Qf1v7XHVIMVAAewCakiUQW2klGfx+0a2xHewf84lsNwK0E14Y0
	=
X-Google-Smtp-Source: AGHT+IGLyRCg4jypTWY7hqDZBRra3Ns2U/p7vJjW1SnjFuGpBIUU4VDLnPpxouvLTR+8VMJ37+oCTg==
X-Received: by 2002:a05:6000:270f:b0:390:dfe0:1320 with SMTP id ffacd0b85a97d-390ec9c1bddmr9513020f8f.33.1741030498265;
        Mon, 03 Mar 2025 11:34:58 -0800 (PST)
Received: from DESKTOP-A54QG66 ([39.46.196.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bca3df658sm9025365e9.9.2025.03.03.11.34.57
        for <linux-firmware@kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 03 Mar 2025 11:34:57 -0800 (PST)
Message-ID: <67c60461.050a0220.2384df.6473@mx.google.com>
Date: Mon, 03 Mar 2025 11:34:57 -0800 (PST)
X-Google-Original-Date: 3 Mar 2025 14:34:57 -0500
MIME-Version: 1.0
From: philip.mypackagingpro@gmail.com
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
ZXRoZXIuDQoNCkJlc3QgcmVnYXJkcywNClBoaWxpcCBXYXJkDQpNYXJrZXRpbmcgRXhl
Y3V0aXZlDQpNeSBQYWNrYWdpbmcgUHJvLg==

