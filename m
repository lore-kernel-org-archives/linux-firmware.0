Return-Path: <SRS0=HvG2=27=alien8.de=bp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6525ACA0EEB
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Aug 2025 14:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D250C113D0; Tue, 19 Aug 2025 14:03:26 +0000 (UTC)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A60C7C113CF;
	Tue, 19 Aug 2025 14:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A60C7C113CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7E35F40E0286;
	Tue, 19 Aug 2025 14:03:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id auAitoUlA6Ur; Tue, 19 Aug 2025 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1755612196; bh=n04+d6onp2WclGfkGmT16OdJYkfE3RzAaqpfKYOuFlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qf4tucmN6HJP12fsw+MDeGV5MWlR2CPjNZMvAnj75Y2AiCHZecW8jwVF8Q3E7Nduk
	 cKT8h/ipObl/b9qYjcxLjNdVkJXWFuySjPelwAwWN2wmBrnp71efAB9EMIsd3p1n5v
	 ZP1sERpMW3nPZm9WDCwAu5S2NTuYzY8qyr6sBxbcTDVlMOXfj61vCEjL7Ab5tmWQfR
	 rXaxon1Nh1mOhCZzkZ4PbX9sZzsMo/CssXrlJ0VPCNyiiTnMHOT8qySCtWzkJTEa4J
	 Y1iM/SmgP4+/0xMDB+KWMisZ5wAa62PnTfgcPtHAyL/6Ha0Siw3QSR0bSfUiYt1YKi
	 zJDkX2uvurbzoDS19e7++ACWESlC9gDFclazPY9ZQYu9YLYbCsS1NuEqWdg1NsQWdZ
	 0umUt2Ddby4x4glomxuknCPHJi/KhtUx7J3nj1f73oGhlqOgFCKKNiKoWR/bTEciu7
	 2lAxKJCE+dJ3YNKl6XRgHBWc1+fYOKhektjyNaIOl6tXOeJcHGr1dIdUS9lHxfUiGP
	 DM9pJY2cJUJbmlw71CiZ9xlePkc0lK7jmVgWIO7vXrBBupS+CAeMW3jYvkDzh/ZzUE
	 vVoHsjUmQqCRZClZP0++4C+leNqRXuQBhVYh2ElB5ZH77bpaYiL7G0E3/rr/536sUE
	 2cYDK1U6432PhgrWeaWzCobE=
Received: from zn.tnic (pd953092e.dip0.t-ipconnect.de [217.83.9.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9BC4E40E0232;
	Tue, 19 Aug 2025 14:03:12 +0000 (UTC)
Date: Tue, 19 Aug 2025 16:03:06 +0200
From: Borislav Petkov <bp@alien8.de>
To: Jinpu Wang <jinpu.wang@ionos.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: x86@kernel.org, linux-firmware@kernel.org,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] amd-ucode 20250808: "No sha256 digest for patch ID:
 0xa0011de" on Linux 6.12.37
Message-ID: <20250819140306.GFaKSEGnSdHfB3D_Qv@fat_crate.local>
References: <CAMGffEmFm8wvgiw+s0ZpOhRxBLOz3dQiS=sQCkgJLD6qC3VwJg@mail.gmail.com>
 <20250819105527.GCaKRYH9VnQaVdl7gQ@fat_crate.local>
 <CAMGffE=+hhf6EXCVYo+tvdUKN8B=uEtjkTpo1R9PXN3HycXG-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMGffE=+hhf6EXCVYo+tvdUKN8B=uEtjkTpo1R9PXN3HycXG-Q@mail.gmail.com>

On Tue, Aug 19, 2025 at 02:16:29PM +0200, Jinpu Wang wrote:
> Thank you for the quick help and for clarifying the situation. I
> apologize for overlooking the information in the `amd-ucode/README`
> file regarding the required minimum base microcode version.

That's ok, having this documented on the mailing lists is a good thing too.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
