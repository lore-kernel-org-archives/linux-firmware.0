Return-Path: <SRS0=mj2/=DU=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8FDEB64DD
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Aug 2023 04:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44292C433C7; Thu,  3 Aug 2023 04:49:17 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F23AFC433C9
	for <linux-firmware@kernel.org>; Thu,  3 Aug 2023 04:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F23AFC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F28D23F22F
	for <linux-firmware@kernel.org>; Thu,  3 Aug 2023 04:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691038145;
	bh=34IncFehZ5CSuW7wS7rKGmjMhPjV5/xlgP+4Fk9aeYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jnorL2kKgky6wQP3xbgN+4zyVU2g5cJSzmVcNnJJBO0xfGifcwTf2GXD0vrVvriDQ
	 q4ImmM+hZue8XEc55KHmmYMZZyAzkRmSBSE0b0YaalB3acxQ86Ii+9fqrb2xjGbgM0
	 FqqztxczlvyLFT476RPHHsg3AWaEZ435QfCxeUfypM/Sl4Co6byAc1Hr02FstwagWP
	 0No6LqcNoAlnJ+gXCKpAe4LFDf4X1ZvkOdwPtqMPbLoMJZQoe/ejHVE/jmK17Cu15B
	 iPTJEJzWlyCdzqPomvHtTNBa3h6umfndBBZsuHiGeM6HA2kJvHlWNjcHSpUDhPI3on
	 MNHHIYDgTPIaA==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99c20561244so31731566b.0
        for <linux-firmware@kernel.org>; Wed, 02 Aug 2023 21:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691038144; x=1691642944;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34IncFehZ5CSuW7wS7rKGmjMhPjV5/xlgP+4Fk9aeYM=;
        b=E9HXJspZJ1ToqZdEsDSiB5aA/2747QiiVw07pILjsUImMgp7Ii58NWgiqndv9UNxcc
         xgkClCmf10RJ+xeR626W8qVtHMLyDa5Xq2O8lRdhbGZvu5SGS/L7g+jcVUL+Oe8oCMVN
         +08pf1RnrPnoW4REPGIkUNXv+dQI08e1j5BkAQbIwIbuQU3hSoYjDgrGv+lxfPoZrs5E
         6r1u8xDaPtYCBZKUtmf2Fd9bzhvFTzJpwodMiUrKGzH0ZhA6nsa8BeMOuTU00iVziY29
         k9YHx/paiAFi4qOjFyMREAVCpkMh7ZnEcH5SsXhU5BXNcNFocXDLjRY+g5wbi/JQTXOS
         zOIA==
X-Gm-Message-State: ABy/qLYW1KCkKGqF0+c6ugqpN7KLbAp7uwzpXDms9X/JmXvg54HSLY5s
	RC8yQnb6kae3d8iSG85WulNDclSUiChKFPw6h83LSUcK25xbP7ynOgjSB+Etc0U/NkW8ikkpdLn
	9zxBls6zepqwamgYGVu5lMfT7707lDeSEozkgHQ==
X-Received: by 2002:a17:906:31c2:b0:99b:bf82:75fc with SMTP id f2-20020a17090631c200b0099bbf8275fcmr5795265ejf.32.1691038144372;
        Wed, 02 Aug 2023 21:49:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlENtX2X7fs9eEWgZS4pPWHdKbX+obow1KghuXOkV5HDoFfGrQmXENBm6OJUzM5oupshHo15Mg==
X-Received: by 2002:a17:906:31c2:b0:99b:bf82:75fc with SMTP id f2-20020a17090631c200b0099bbf8275fcmr5795253ejf.32.1691038144085;
        Wed, 02 Aug 2023 21:49:04 -0700 (PDT)
Received: from smeagol ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id a26-20020a17090640da00b009829dc0f2a0sm10007498ejk.111.2023.08.02.21.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 21:49:03 -0700 (PDT)
Date: Thu, 3 Aug 2023 06:49:01 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: hildawu@realtek.com, linux-firmware@kernel.org,
 Larry.Finger@lwfinger.net, max.chou@realtek.com, alex_lu@realsil.com.cn,
 mu_hua_chen@realtek.com, hsinyu_chang@realtek.com, kidman@realtek.com
Subject: Re: [PATCH] rtl_bt: Update RTL8852C BT USB firmware to 0x040D_7225
Message-ID: <20230803064901.4c87ea8b@smeagol>
In-Reply-To: <20230703134824.7795b277@smeagol>
References: <20230607082751.13580-1-hildawu@realtek.com>
	<CA+5PVA7k+NHHb9LqEw04nfBA4mJ5O=XrNqh86cHbDSeUzW87NA@mail.gmail.com>
	<20230703134824.7795b277@smeagol>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mj_HeLa5_Mt1bWjJ2AzTNAx";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/mj_HeLa5_Mt1bWjJ2AzTNAx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Josh, Realtek,

Any comments?

Thanks
...Juerg


> Josh,
>=20
>=20
> > Applied and pushed out.
> >=20
> > josh
> >=20
> > On Wed, Jun 7, 2023 at 4:28=E2=80=AFAM <hildawu@realtek.com> wrote: =20
> > >
> > > From: Hilda Wu <hildawu@realtek.com>
> > >
> > > This firmware patch update for Realtek RTL8852C BT USB controller
> > >
> > > Note: This firmware patch needs to be used with driver
> > > "btrtl: Firmware format v2 support". Please update the
> > > driver with this commit: 9a24ce5e29b15c4c6b0c89c04f9df6ce14addefa =20
>=20
> Do I understand this correctly that kernels that don't have this patch (a=
ny
> kernel < 6.4) can no longer load this v2 BT firmware because it's not
> compatible with old drivers? That's a regression, no? The incompatible new
> firmware should be named differently so that we don't break old kernels.
>=20
> The v2 driver [1] seems to support both the old and new firmware binary s=
o IMO
> should try to load the new firmware first and fall back to the old one if=
 not
> found.
>=20
> Unless I'm misreading this.
>=20
> ...Juerg
>=20
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D9a24ce5e29b15c4c6b0c89c04f9df6ce14addefa
>=20
>=20
>=20
> > > Release Version: 0x040D_7225
> > >
> > > Signed-off-by: Hilda Wu <hildawu@realtek.com>
> > > ---
> > >  rtl_bt/rtl8852cu_fw.bin | Bin 113336 -> 112953 bytes
> > >  1 file changed, 0 insertions(+), 0 deletions(-) =20


--Sig_/mj_HeLa5_Mt1bWjJ2AzTNAx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmTLMb0ACgkQD9OLCQum
QrctAQ/+Ls/gunNwAgkhMpwbtfX5ArC5BF4mpNCIFXzq/Yxt5HAD5aEcSECGPoxL
KTG9vblG7PlUr6YdABTy2bsVv+4TU///+LzeGxchL4s+h3oAPzHdThPX69MiAqFo
wL59ypIxauPPC7FO/yoeKtpMoglqc2dlnAYZx+yOE5d9osOxmmSVDFvjJKK1OpBF
pUubBL0Sho9NRg24cAHmiBTcG6ihj8ONEHyL47rjdFl9DJZGzh196dZOQZXmxtjB
d4TKL29AFnMEKM9sgzzMxcoqCzlT/oYmeutIjxu4zgeBy5Fnx7eDbrpcknaiYSey
Lke471Gig9lZYPAEQ0hKtVhIXBofTs9aCkww78OqVcJ2ucspxfQ9v1hGCl4eHr6s
LAOT5cSq9i22+KcdaYnMhQ1pZOUO578C8+/dbXGe/NC2TbJJHW5K2Rb2yCP2cKSs
STpwKZGyP5eiefxzJN7t1sYysIqsX214Z8UBbZxckekqAyJzPniJng3bpkUwxq0y
um5LQamPNsa/1BBOZi0sLDKNGm/cpOiwS7/VQU5jw8rypvk2SFa0iO18idI8qI8A
YMUftuWnFP9h7FDjLTkm/7TH6botitX8hQOBwKhLFhuQWIUBkfULJjJwSl9zcK0X
b9apzIJi18Puxo3UZhrNpG34NqXJZTS6LQXv3CqgosLFo62zOm0=
=fT82
-----END PGP SIGNATURE-----

--Sig_/mj_HeLa5_Mt1bWjJ2AzTNAx--
