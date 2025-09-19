Return-Path: <SRS0=FQVU=36=devmart.info=dhruv@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E020ACAC59A
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 15:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9978C4CEF1; Fri, 19 Sep 2025 15:36:10 +0000 (UTC)
Received: from firebrick.apple.relay.mailchannels.net (firebrick.apple.relay.mailchannels.net [23.83.208.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83E06C4CEFB
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 15:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83E06C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=devmart.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=devmart.info
X-Sender-Id: hostingeremailsmtpin|x-authuser|dhruv@devmart.info
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id A07B06A238B
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 12:08:15 +0000 (UTC)
Received: from fr-int-smtpout20.hostinger.io (100-110-207-190.trex-nlb.outbound.svc.cluster.local [100.110.207.190])
	(Authenticated sender: hostingeremailsmtpin)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0F1BC6A1E18
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 12:08:14 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758283695; a=rsa-sha256;
	cv=none;
	b=Kw+QuAWh11r+QLoNYQLl90fY0dHKM9sJ9PvAcr4JF/6BjLQchMcG+XZsy6zWSAwSGXCfgb
	i1diqHHb4erNumauu18fTFfSZvTN1YzuPWJun2k7A3VcA4JdTS/T77T9Fl374ItIC1GeBf
	qAohFwPCEYYwDHdeHePDfDTY6OpUYkiig2cY68XtxJG3bjqFzyHrY6n/b52pyF0xODulZ7
	sEtMuHKSEClMISAK4/kKagEZnGxEQ4I98YSvpQw5FH4vUkIkfMkwR/2l/3J/wQl0KlK8GO
	VwIIHn2G55Qq4fYnCFS1VdwdAOHNtwfOxLDFabttmnkN6EHJMfWr/EO8RanQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758283695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=g25G6v64KOAzYlvJoPU12csYAgqIojYb6cOoKm27bZk=;
	b=YEJJvqhtNnCRwpcISi27di5uBjW9QApe5/Mu1MTjmar3TNHUQgrmYjaCMsFiXLUKVJKUjm
	dnBFMExfOhznocoCbPkN1PD3HyWxFQ3dl3HiIyHqX4YsGjrXt9At22X+1usTxEIEMs3oZm
	mOz8JSiwkDEJRl2GuFMdgfz72lNyWecimYvPuD9m/0v6ufjQXQ62K2ODAqnv9ubo0UyTBx
	3jOaKPEE0kTz+s7EtDEo7JXY1ho+2kde5nJ1XuHInl11OlX1HIPhYi9caEdQbF118g7VfF
	1QopM8H6Ql/42t+vrdHC2KaKwhcWcbRNMuln155vtuKfnKr4Lf4vajuPnjFpjw==
ARC-Authentication-Results: i=1;
	rspamd-54786f95c7-mzxx2;
	auth=pass smtp.auth=hostingeremailsmtpin smtp.mailfrom=dhruv@devmart.info
X-Sender-Id: hostingeremailsmtpin|x-authuser|dhruv@devmart.info
X-MC-Relay: Good
X-MailChannels-SenderId: hostingeremailsmtpin|x-authuser|dhruv@devmart.info
X-MailChannels-Auth-Id: hostingeremailsmtpin
X-Reign-Towering: 29dc1f7e08de3676_1758283695566_3574829962
X-MC-Loop-Signature: 1758283695566:338871183
X-MC-Ingress-Time: 1758283695566
Received: from fr-int-smtpout20.hostinger.io (fr-int-smtpout20.hostinger.io
 [148.222.54.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.110.207.190 (trex/7.1.3);
	Fri, 19 Sep 2025 12:08:15 +0000
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(Authenticated sender: dhruv@devmart.info)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cSrqx2hQsz1xxn
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devmart.info;
	s=hostingermail-a; t=1758283693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=g25G6v64KOAzYlvJoPU12csYAgqIojYb6cOoKm27bZk=;
	b=rEzONbmXyqHyOM0nQaKpCTAl6X2NLUGQxcoDCqZyJBC+XUQU54E5WIvQhWs2EDcYPp5s61
	iO2lTHgKeFogJysrmD52aIdAsFE/lqHp4xUzG0bVhzG6DLF83qOPkwqAzaosGm6Xk7jv9J
	RhF6PUrn+CAX9JRIxZzcilfAXVRFrKJLWBB/FGEOA9kWULOTdQGmjP2OkczKqXHKCdzIoq
	kno4sWHpxs63oXfT3Daa3LjZJk5qaXwZAieqJNtT9C413ogBqGUrB++WXkJsQMBXnuad7A
	1TgJVputhfzwedw/lVU1j4alJ1iYnd7cDtevK5Dqt5RPbhBpnH/zP3b6yBH/ew==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60501806so16219097b3.2
        for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 05:08:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpYUUwkfwlcmw9KG/Nb3nrGt0lmrWIzQ663+BxdpZy8EZ+amJzm551DOfIbh5ClS6Q5sKaIh0ti/eRsopzkA==@kernel.org
X-Gm-Message-State: AOJu0YxFx25iPDjS3Q30wDi0i9De42A//TDYxc8f8DDCfj5IGYEImDUH
	9oeszfwVbyd6xdld5kMjyWdfrvihUGWSZOZkI9HAIq9HKTyB2sg+T3ycRBl8SR7W+Z5bhEJad3Y
	o5PEzyKKl8ZbGD6P/ttO3ZxDn4NNaI90=
X-Google-Smtp-Source: AGHT+IFzbzjm7gBEN9sQprxU9EeVbm+pu6uR/SUIQ1LiKo4Xs6jCqRUje41opujp2/FB775qd4mdaDp9x+H9BkDjZWo=
X-Received: by 2002:a05:690c:7343:b0:723:97ed:b2d6 with SMTP id
 00721157ae682-73d376159e1mr25736797b3.24.1758283692688; Fri, 19 Sep 2025
 05:08:12 -0700 (PDT)
MIME-Version: 1.0
From: Dhruv Raj Saxena <dhruv@devmart.info>
X-Gmail-Original-Message-ID: <CAPNqms5EapU405DWzmkzWwSP8GtgxL-sbnBjRzCWwF7_j93DNQ@mail.gmail.com>
X-Gm-Features: AS18NWDqWomVXdG3s7_xRgdJLTMSA4JVBffgJrUKz1aa9gt6OmhIEpBn-quERBA
Message-ID: <CAPNqms5EapU405DWzmkzWwSP8GtgxL-sbnBjRzCWwF7_j93DNQ@mail.gmail.com>
Subject: Is Garekars Md Dermatology Clinic Open? I Noticed Something About
 Your Website
List-Id: <linux-firmware.lore.kernel.org>
To: garekarsmd@gmail.com, jstory76@naver.com, eureka_skin@naver.com, 
	emily@urbanedgebeauty.co.nz, kiran.k@intel.com, linux-firmware@kernel.org, 
	ravishankar.srivatsa@intel.com
Content-Type: multipart/alternative; boundary="000000000000eacbbc063f2652d7"
Date: Fri, 19 Sep 2025 12:08:13 +0000 (UTC)
X-CM-Envelope: MS4xfACcVigt2U5bRjCx1D0ihmeRwFc7Dq9bMbMyxU3j9hL0SWqLRyF6ifhDKeT46UToHxlcx1Yj/kVC88WZpmoEcR3vnega4nTxdnEMBUatbTgK2Z/oNcWu Lq468H4GtwHO7yTkR/dtV1/KTRrDJj4oe7FDtM27vcoB+lHttbX/BSPdnsSAQunXsD7wezAsfGaDz9fjXbNksPC4BIn1C/cd/Rk=
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=68cd47ad a=64c52ufCktWik/10SDQSMw==:117 a=MKtGQD3n3ToA:10 a=yJojWOMRYYMA:10 a=bQKA077CUkMxIIXae30A:9 a=QEXdDO2ut3YA:10 a=0DsyGr-yV2jMGUVFIEMA:9 a=VC3CRu2tPi4ofn0NlaEA:22
X-AuthUser: dhruv@devmart.info

--000000000000eacbbc063f2652d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey, this is Dhruv. I work specifically with aesthetic and cosmetic
clinics, helping them attract more high-value clients and increase bookings
through better websites and online presence.

I just want to say =E2=80=94 I really admire the work you=E2=80=99re doing =
in helping
people feel confident and beautiful.

And listen, the last thing I=E2=80=99d want to do is try to sell you someth=
ing when
we=E2=80=99ve just connected. That=E2=80=99s not my style.

But if you=E2=80=99re open to it, I=E2=80=99d love to share a little bit ab=
out how I=E2=80=99ve
helped other clinics grow their bookings and revenue =E2=80=94 and how we c=
ould
potentially do the same for you.

If that sounds okay, just drop me a "YES" and I=E2=80=99ll explain more.

--000000000000eacbbc063f2652d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey, this is Dhruv. I work specifically with aesthetic and=
 cosmetic clinics, helping them attract more high-value clients and increas=
e bookings through better websites and online presence.<br><br>I just want =
to say =E2=80=94 I really admire the work you=E2=80=99re doing in helping p=
eople feel confident and beautiful.<br><br>And listen, the last thing I=E2=
=80=99d want to do is try to sell you something when we=E2=80=99ve just con=
nected. That=E2=80=99s not my style.<br><br>But if you=E2=80=99re open to i=
t, I=E2=80=99d love to share a little bit about how I=E2=80=99ve helped oth=
er clinics grow their bookings and revenue =E2=80=94 and how we could poten=
tially do the same for you.<br><br>If that sounds okay, just drop me a &quo=
t;YES&quot; and I=E2=80=99ll explain more.</div>

--000000000000eacbbc063f2652d7--
