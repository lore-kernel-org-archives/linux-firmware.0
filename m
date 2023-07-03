Return-Path: <SRS0=ofop=CV=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18D1EB64DC
	for <linux-firmware@archiver.kernel.org>; Mon,  3 Jul 2023 11:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6705BC433C9; Mon,  3 Jul 2023 11:48:40 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56580C433C8
	for <linux-firmware@kernel.org>; Mon,  3 Jul 2023 11:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56580C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5FF233F84C
	for <linux-firmware@kernel.org>; Mon,  3 Jul 2023 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1688384908;
	bh=vDTYAiKa0AnhkO5+SszoQjtSsjFXGBhMs0HZu50JRBA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ML4Jhil4cs3re5LK2kFWltkwzhUy5LAs9O4pQK/iy36Hyxo09srZQFmAqhc6S2ByL
	 uTnK/fcb7RnBAG4EOu/MtXKxtm69ZxDnSP2w+vjXQD6ndBYH9BKiDpHoDUEGW/yUpp
	 egRuEFJJP7G8uZxR4MV3UcAz5/q3c3pqKd/wqWrrLXIi0LMtaTHf5/KplD5YmYV2lG
	 P6S2Ei06HPRNJIaJimDA4ChzKQN2zjBpH1Wp2yuqkXlUU8izveAwLCgXiBmfnHzbFI
	 hgPDfTI/Njj1RcN9vpd+4duclSEJs50vxqqSZNe5z7N2v7TKJV94lHHm7BFWwo9Y8u
	 LjPvIVDDOJ0Fg==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-987a0365f77so240195266b.1
        for <linux-firmware@kernel.org>; Mon, 03 Jul 2023 04:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384908; x=1690976908;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDTYAiKa0AnhkO5+SszoQjtSsjFXGBhMs0HZu50JRBA=;
        b=jn4kuy2vb76uRJHhwkTqcTJ4KRt8Rs9vcXd6hkA5pHc9tovZVzG8U4I2uaRZulhVLF
         gY41yADT4sAYTqm+M1AfY7Wx5joS7nwzwzZuRbIO7qMtY6ntb8ApFQQYdXtzErqgURzp
         f/wJ6qMIojGoSMLejo86fgCYCJ20IJo+6YKLPAZr+A2+2SMyD7Yfw61QJSTvRzlSCpfY
         LW59/lGka3uukVmaQHOq+7YqtIZ9P+wVwWeyKJufimnjh/qO/kGMjTiXj/cdST3L1zCV
         9ejIIT0zwAGQcLeyZ+Qs8gCzxEyPf9UwwpllNs0An4wb0BITDrVRUdnzYENzhxtkbIWg
         6NbA==
X-Gm-Message-State: ABy/qLYx5QaAFXnhImX9fCJ8uGfofA3AA7DPzfSRS07tzw9mb6FGHJF5
	Q2GN1kHAM9+c1YQs3RjFpiYFxay6HyQreb0VlixOAPfsHKYyG5OwG/DuBjZa1skhZsadA8IiBU3
	M99PJgwcc1c6RkU1duKVhuFEVa2vhlx/9LKNaKQ==
X-Received: by 2002:a17:906:8696:b0:98e:23d3:bf47 with SMTP id g22-20020a170906869600b0098e23d3bf47mr7541031ejx.36.1688384908113;
        Mon, 03 Jul 2023 04:48:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGvKnMIJ1WMQfhYxATbYCkAejFRi06DssqviRjEJLtu7SGvuRXkTCQ7S7zEHyRNlLmV0dz8AQ==
X-Received: by 2002:a17:906:8696:b0:98e:23d3:bf47 with SMTP id g22-20020a170906869600b0098e23d3bf47mr7541012ejx.36.1688384907808;
        Mon, 03 Jul 2023 04:48:27 -0700 (PDT)
Received: from smeagol ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id y26-20020a1709064b1a00b0099236e3f270sm7774922eju.58.2023.07.03.04.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 04:48:27 -0700 (PDT)
Date: Mon, 3 Jul 2023 13:48:24 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: hildawu@realtek.com, linux-firmware@kernel.org,
 Larry.Finger@lwfinger.net, max.chou@realtek.com, alex_lu@realsil.com.cn,
 mu_hua_chen@realtek.com, hsinyu_chang@realtek.com, kidman@realtek.com
Subject: Re: [PATCH] rtl_bt: Update RTL8852C BT USB firmware to 0x040D_7225
Message-ID: <20230703134824.7795b277@smeagol>
In-Reply-To: <CA+5PVA7k+NHHb9LqEw04nfBA4mJ5O=XrNqh86cHbDSeUzW87NA@mail.gmail.com>
References: <20230607082751.13580-1-hildawu@realtek.com>
	<CA+5PVA7k+NHHb9LqEw04nfBA4mJ5O=XrNqh86cHbDSeUzW87NA@mail.gmail.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uB0WOkOQ1mydbOTKEUlAt1a";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/uB0WOkOQ1mydbOTKEUlAt1a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Josh,


> Applied and pushed out.
>=20
> josh
>=20
> On Wed, Jun 7, 2023 at 4:28=E2=80=AFAM <hildawu@realtek.com> wrote:
> >
> > From: Hilda Wu <hildawu@realtek.com>
> >
> > This firmware patch update for Realtek RTL8852C BT USB controller
> >
> > Note: This firmware patch needs to be used with driver
> > "btrtl: Firmware format v2 support". Please update the
> > driver with this commit: 9a24ce5e29b15c4c6b0c89c04f9df6ce14addefa

Do I understand this correctly that kernels that don't have this patch (any
kernel < 6.4) can no longer load this v2 BT firmware because it's not
compatible with old drivers? That's a regression, no? The incompatible new
firmware should be named differently so that we don't break old kernels.

The v2 driver [1] seems to support both the old and new firmware binary so =
IMO
should try to load the new firmware first and fall back to the old one if n=
ot
found.

Unless I'm misreading this.

...Juerg

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D9a24ce5e29b15c4c6b0c89c04f9df6ce14addefa



> > Release Version: 0x040D_7225
> >
> > Signed-off-by: Hilda Wu <hildawu@realtek.com>
> > ---
> >  rtl_bt/rtl8852cu_fw.bin | Bin 113336 -> 112953 bytes
> >  1 file changed, 0 insertions(+), 0 deletions(-)

--Sig_/uB0WOkOQ1mydbOTKEUlAt1a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmSitYgACgkQD9OLCQum
QrdtKA//ea5gHMOY7b48RqIAA15FWTW6gvkyZZOMxGRlELC8rxrVPuMxySsfE/j2
/oLNS765zbVubxofiYdYrje83groYV/vgfuAiuShz+VgnOZV79w7Lzl1oeLhasHf
uW6kOFPA5E4UrH5zyyd8LCLzcgJ4W/tkKpndorl1o1q65Ue6BZ1pFc8MeXdhB+F6
WjE2IdR6Yz7qx3ttVksNmX61whcfYD/ZW00UlSPFBuBHu+H4jCZZMDoM8TXw215B
/APzl7OnvQtn0wZaHYUhLydpljUyVe5BNSJdHYbg80GaEYQaNcfhGI9593EBvc2x
qIAIMuwRHzcoJ+CQ92f35y+csDJpoyc7rXXUdiZR+aA8j2ZDle4I27x4bBNd1ZPt
oNkyqvkKrkTJXkBH7nw/MrV44VZdwmNGBRAZLOtfcWZ+Pvi9hOy9Kc8OlFOON8C/
p9zo3vKCH8J33ZiSec4f5miPZpB09FK6rBU6fAYE92b7vv2JXVMwhp0Fq07bXJ/X
10sj79SL4KoGWFBy604S5NGZtu1aMcue2ObYe4MOptM2wkqVfk6VjxLy/YeFjhN/
aoVUHvgS1KjC+Ct2MtUs919hU9Q4bLVZr2kdFE0YPABZa7IT7kXlaW1bbORY2Xi0
gQAmSGUDAlRjNrVHPLklsFm/kfUz1AiZpkdd7K0urY5c0ZcG+jM=
=4a+x
-----END PGP SIGNATURE-----

--Sig_/uB0WOkOQ1mydbOTKEUlAt1a--
