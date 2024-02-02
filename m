Return-Path: <SRS0=CsBo=JL=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3108AC4828F
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 14:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EACE5C43399; Fri,  2 Feb 2024 14:40:42 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 435E2C433F1
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 14:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 435E2C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9D8983F17F
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 14:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706884837;
	bh=YjR/b/AR+wcp1YSZJGwlyZXvofipIzvjF8r9v4fz5Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type;
	b=DN2BnREzePB4s/pyyUurZ1GKgf5HlGmbHAyutFefPt2XpJ2hAFg2Qp5C+vR2C5Dbj
	 QqJa6UDU2cdzuN2t0Z9UKksgdC3hdkIkpbcv64wvGqmdVQFztOOxcNjOa/UtKqusCf
	 eTJt0VEfWQdm5RhDvbhJNiWu7kVs9kO+3dF17wOn6AcJRN2227L+nBYvbEpR/HevYO
	 NbVX1c2yi7FkrPcfV1+eIGDxha0b7jEAca9q2rGTA5lysqfKT3L6RupdyoJwZTifBs
	 Yteox7YRmJJNT19iFdNDJZ0R6hwXd/QNDiCA0L7rVCUXzB3EUrVtqM7GblH1X83cO4
	 SyR5ddatQhBJA==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33b2875eaa9so34897f8f.3
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 06:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706884837; x=1707489637;
        h=mime-version:organization:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjR/b/AR+wcp1YSZJGwlyZXvofipIzvjF8r9v4fz5Ps=;
        b=c486s3qMn4zCLad/hsgfDaYN3A16t6Yj0n3V552C3F+TvPNs9M7T2CG9rz5G/Ko7ul
         CfXWboiNUhVoqzaZrZPrI1a/nC9C23kjtY5y7sI/oDtWL71myiYM+K0GTFEIKRQAKKun
         Zrpw7GUbJKcAHY+pN2Mqtz7CGwc6PMD6uu/l0v5xU5Mojxbmd8J+B5ulFQvmtdK3Kx8s
         yStmp0BXauh7MKDUfNSg+OHsgfdcSnfhd+1RpQrs3nGVSg7F+i0EEv5ORj1A8dQKS7M0
         fUub/ovac6FP0R/NEZT5QA2lfx6aK3guX4p6nDuv3S8UGXXaFNj2Ocs7ZfswQILU48E5
         jTyw==
X-Gm-Message-State: AOJu0YyRVOHNmzoDkGbqtboXO6EGAIKKiueQ2jGsyIZD4EyQzIw5/APN
	hlxqOkreIKuepr/+9zDQb58thL156N2pKb8iBOT7zoCrSiuftKNbJwWCdTQziCM/oo1z+LJFPD7
	+gU4+WPGDyuNZ5e+oqofJuY4fMIaVzM3KNmil+4ZD8zZi90U+v5xSTJCMj2bc7wJAkE4IWdI6EO
	hk+qBBrQ==
X-Received: by 2002:a5d:4d83:0:b0:33a:fcb5:af39 with SMTP id b3-20020a5d4d83000000b0033afcb5af39mr6692440wru.39.1706884837293;
        Fri, 02 Feb 2024 06:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvrSLVVJARJijtL1q1a1J7N+oMzRj0JwhCLqtEkzbZ36/Z7YXUB7FsDX3EhZ64oWXoq5Dvmw==
X-Received: by 2002:a5d:4d83:0:b0:33a:fcb5:af39 with SMTP id b3-20020a5d4d83000000b0033afcb5af39mr6692429wru.39.1706884836960;
        Fri, 02 Feb 2024 06:40:36 -0800 (PST)
Received: from gollum ([81.221.247.52])
        by smtp.gmail.com with ESMTPSA id m13-20020adfa3cd000000b0033af9b7db6esm2112184wrb.22.2024.02.02.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 06:40:36 -0800 (PST)
Date: Fri, 2 Feb 2024 15:40:32 +0100
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: sbinding@opensource.cirrus.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: linux-firmware: Duplicate links
Message-ID: <20240202154032.52fb9475@gollum>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uD1cUB0rWT2aE0JrGkQ7dX6";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/uD1cUB0rWT2aE0JrGkQ7dX6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Stefan,

Your commit [1] introduced duplicate symlinks in WHENCE pointing to differe=
nt
binaries:

Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cs=
pl_RAM_revB2_29.85.0.wmfw
Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cs=
pl_RAM_revB2_29.85.0.wmfw

Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw -> cs35l41-dsp1-spk-prot-1=
03c8ca4.bin
Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw -> cs35l41-dsp1-spk-cali-1=
03c8ca4.bin

Link: cirrus/cs35l41-dsp1-spk-prot-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cs=
pl_RAM_revB2_29.85.0.wmfw
Link: cirrus/cs35l41-dsp1-spk-cali-103c8ca7.wmfw -> cs35l41/v6.83.0/halo_cs=
pl_RAM_revB2_29.85.0.wmfw

Which two are the correct ones?

...Juerg


[1]
commit 4f498d09a4a6a905f231a52f33886f8a5d22d5de
Author: Stefan Binding <sbinding@opensource.cirrus.com>
Date:   Fri Oct 20 14:58:26 2023 +0100

    linux-firmware: Add firmware for Cirrus CS35L41 on HP G11 Laptops
   =20
    Support for 3 laptops using CS35L41.
   =20
    Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

--Sig_/uD1cUB0rWT2aE0JrGkQ7dX6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmW8/uAACgkQD9OLCQum
QrdF7Q/5AWi+DHuQpo7naPmC9/qU/Jm+3ecxjmC7SoxT2xvCNbPG3b0/wFyXtHuF
v0JGXhjH2E3qEgwkIEJ+GY6S754a9zL3zZ0guK/J0LL9IHy7YJb0otU8X8C5oBI5
C9/RrQ6T0nNWCE2MwyYyBr1JZRzWiHRImYOF2CD+Jm2gj/Pfl6E9wNykw9/Oea3z
LQDHNGLc7oVuqqVwjGP2VqoVrPXjlzlDqjIj3/JWtnbrtAbfbrU2HiWa9a4S+80u
hm2h85U4EPuPBjkamRQCOoGbLfFkRQfQc0RzcBi9qP5CQejrrHi8HZ3Nx+HgM3Is
G5Mpdln9WVfKkZAVd8w6Xvf2vLsZiBwC5236+gSl2xQsX0mBFNHcoGpBJtCBIwVE
Akcylk/BTshyGXzMTpN0DmbRYAKmw0LRPHehFN8vLCcGHFQcUWE3tSnMdtkr6IYQ
mygR6C9lHV/E5isCWa5fq3VYBNeZx6C7O3e68YGNhhsgEBAhjPtdq/S85R8IHjPS
EtXrt+TH7XlslERXEXVS1Ndb9q376BQZ2k44f2BNiZxA7g6oLF460yrfscbEjB32
Bsxb5S4E5NcoZTI09W+O968wSp3cm/t0EUI7+owbBQQQqdtdnUguzjAVvOnGxuw0
BgXCa2jucVoiF4ChZIExnPJ1Tj3L/zWCDhiKG7uoyTI6RdzxjmU=
=QoGV
-----END PGP SIGNATURE-----

--Sig_/uD1cUB0rWT2aE0JrGkQ7dX6--
