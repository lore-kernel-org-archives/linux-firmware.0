Return-Path: <SRS0=0j1l=ZY=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5D1ECAAD8
	for <linux-firmware@archiver.kernel.org>; Wed, 21 Sep 2022 08:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58987C433B5; Wed, 21 Sep 2022 08:44:48 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0283C433C1
	for <linux-firmware@kernel.org>; Wed, 21 Sep 2022 08:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0283C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 55B1F3F138
	for <linux-firmware@kernel.org>; Wed, 21 Sep 2022 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1663749878;
	bh=DqH0K51UyTYbMdPeDdb50Ry7JZRrT9mZT8SvU172pnE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Qk2ks4B2Qz+f4q2OYBpupBke2gYlu6lJiAzkbkjPMSOEEuCJlfegA2s5zyVK6SRrT
	 cSHamZoPS01sI0wO1cCG8n+IIRkDQXuy1uUNCakKi9b2I+Dp0d050TUWDJi7fGBTjD
	 6OvvT2ueRRFM+RTf+WCVcuLzyAdqB9DguMx+np8R+lGCNwMFNZAnyl+5R/zeUTO5AZ
	 ZL/Ai+GMRVEOFh1Fn/755OepLNP4Px2m8JjyLH1ijvrg8YoeanbXLGrMnBs87ihmhA
	 5Ztj29Qfhww2HlK1SEBr6bZhNCY8Uymdq0qEVV964Yh1geJuUdu8jEX+r27teu2xpY
	 aUnXfqv6bTywA==
Received: by mail-ej1-f72.google.com with SMTP id xc12-20020a170907074c00b007416699ea14so2734621ejb.19
        for <linux-firmware@kernel.org>; Wed, 21 Sep 2022 01:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=DqH0K51UyTYbMdPeDdb50Ry7JZRrT9mZT8SvU172pnE=;
        b=sAA2RDKwh04P3BIqK5DJQ0gTepui6EHrB/QVyK3EFMoP5GT2mU39GbGhd06FRrwt8T
         UCwy79BtGHw0eqaMn72zxMg9GFYU1Mleq3OdG68DwtuAlUmHbI/M/QWyEcl0viljpXw6
         NdPbXi7yv9afbBsErDTJCnCotu5BVV8WqYHFixnPokSmJ29oVleYh4l5WqCChNiv0U0M
         sgINw/WRxpsyXG0Y/epvwmqGemZT6BQNFuVL/RfhpCFS+Izx2N/pjhnMYfwN5v/NaniB
         S73mJXAncdlGTzI52y01JODoluniw4OlS3SFRFG7x6D7hOhNScb2V+6mW0M5yV8exMpM
         0VZQ==
X-Gm-Message-State: ACrzQf0OSE1+E1kVk3eEQULn2Ky8cEFJkO74RuFsA3X/gOmNOTNcc8H7
	l8h/SKoMc5cG1Rtu58WkJAtV4/Y9XVhLV8FMilPx6zQwG5FgTyrXaq8cpbgaFR2qyFel0YpBTgp
	mfG6vdsV/KeJGP/Ubcbhmx+v6nu4oY+P1dWcYxQ==
X-Received: by 2002:a05:6402:440d:b0:450:de54:3fcf with SMTP id y13-20020a056402440d00b00450de543fcfmr23466755eda.312.1663749878095;
        Wed, 21 Sep 2022 01:44:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FW8Ihpne98QK7GKfHf3O43P8AlLC1ErQ10ZILYuYb6+RHESHYxpgqfolFFnhgsAZzdZkxNw==
X-Received: by 2002:a05:6402:440d:b0:450:de54:3fcf with SMTP id y13-20020a056402440d00b00450de543fcfmr23466739eda.312.1663749877878;
        Wed, 21 Sep 2022 01:44:37 -0700 (PDT)
Received: from smeagol ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7df8a000000b0044e01e2533asm1429972edy.43.2022.09.21.01.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:44:37 -0700 (PDT)
Date: Wed, 21 Sep 2022 10:44:34 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Peter Robinson
 <pbrobinson@fedoraproject.org>, Takashi Iwai <tiwai@suse.com>,
 contact@laurentcarlier.com, mpagano@gentoo.org, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, Jared Dominguez <jaredz@redhat.com>, Alex
 Deucher <alexdeucher@gmail.com>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, "Linux-Kernel@Vger. Kernel. Org"
 <linux-kernel@vger.kernel.org>
Subject: Re: linux-firmware signed commits; does anyone care?
Message-ID: <20220921104434.2529c45d@smeagol>
In-Reply-To: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
References: <CA+5PVA5ymJ-ghhhCfEBPxBynucF3gD+nHVNwcZkC5bsVotatDQ@mail.gmail.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SMLZX+r.Pk4dPIyz4DXcpay";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/SMLZX+r.Pk4dPIyz4DXcpay
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I don't care much about GPG signed commits so dropping them is fine by me.

...Juerg


> Some time ago, we went back to doing ~monthly releases for
> linux-firmware primarily to help distributions package firmware in a
> simpler manner.  We GPG sign the tarballs, as is good practice, but as
> part of reintroducing the tarballs we also started having a
> linux-firmware maintainer GPG sign *every* commit done by a
> maintainer.  The intention there was that because we're dealing with
> binary blobs we really have no recourse to see changes unlike a source
> code repo.  The signed commits at least provides a measure for
> interested people to ensure the repo itself is only being committed to
> by a recognized maintainer and it isn't compromised (in theory).  The
> downside is that pull requests are merged non-ff and we wind up
> signing the merge commit.
>=20
> The question at hand though, is does anyone care about the GPG signed
> commits?  It's not clear to me this practice is even noticed nor if it
> is bringing any value to this project.  Since we've started this
> practice, I am literally the only one committing to the repo and while
> it isn't hard to do I want to know if it's actually useful to anyone.
>=20
> I ask for two separate reasons.  The first is that a group of
> interested firmware submitters is looking at modernizing the workflow
> for the linux-firmware project and moving to a merge request workflow
> instead of submitting giant binary blob patches via email.  This would
> allow us to put some CI in place for simple checks to the WHENCE file,
> etc.  Doing this while still having GPG signed commits isn't
> impossible but it certainly complicates things a bit, and would likely
> require a trusted bot to sign commits.  That has implications on
> secret storage and changes the dynamic on trust levels that make the
> whole thing even more questionable.
>=20
> The second reason is that even if people are validating the GPG signed
> commits, it's not exactly user friendly.  I've been looking at
> sigstore and recor and that might be a better solution in the long run
> if we do want to utilize something like the current scheme.
>=20
> I'll still GPG sign the tarballs, but I'd like to propose dropping our
> current self-imposed requirement that all commits are GPG signed.
> Thoughts?
>=20
> josh


--Sig_/SMLZX+r.Pk4dPIyz4DXcpay
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmMqzvIACgkQD9OLCQum
QreUbw//Qs3WlJnIyQRd4qkIDZUZH+d+Qn9dDXPXCWKP4n60mm2oqZQaSBCLombt
Lba5wqFF6Zva9lmo22Tg4ojBkt8KgmYSW0SRgJLOJV6iHBI/x+WiWG6aklSvAGIv
Q8F/H6HbkXCHak1wiNb8f5XsBMsYE8BwqUELY65emfSBJhS2aZ1I2buHX7w5j011
gWXZI2gbMmUyF616WqMcpbNxdo+CRb1Y4n9EgZBnU3fNyY/dTeQaH6FNAooCEWRa
KGw49nX2uIZoYRh7NBuU106GT4RGXQiQ8zgCpB+8WpA3Qw9Yxtpu3unL0KMbdZMa
9XKwEWIV7d/jSRUWrDRGXtn+YSv8uXwOf9PfxtZNiw7aqiI7iG7j2gIpaWWjkV75
osRzI/jWLKrxDRh1ucz5AM9vSM4GSzKM/Fpi+PyjD0RtTsCcIkKi9cCem/vjMqjs
AqZBI+l4lkuy3D1Kf3z0G64ILeoHz3t1ww1tPoWJhMjvya07Oni+vJeKnIENCKf0
hoMtFeQ/ePm9lkq1/bsFVrydEqWS0aQJg+9zO8cBswVgwJTyot2BM596Vloxp0i1
qD8aoVaBweI72IDUmTUkzF5Y5NW4aYcNpe29nRL4qKXhghwUvexpE8G1M+IXsswn
IT+xcsk7Pk0cQwEvxVQiFsIhljukuPsXB307iylfMkEFBpfgQ7c=
=vITi
-----END PGP SIGNATURE-----

--Sig_/SMLZX+r.Pk4dPIyz4DXcpay--
