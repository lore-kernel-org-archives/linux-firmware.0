Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900FEC4332F
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Dec 2022 12:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A1DFC433F1; Wed, 14 Dec 2022 12:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D9BC433F0
	for <linux-firmware@kernel.org>; Wed, 14 Dec 2022 12:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671021792;
	bh=HEs+27ZcKbg+TgZxSMwByPvwXvcfS4E4nFm/6Wm6SEw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hhNSB4hTUiRPoaxrZQ9lpGlbwfXKeAHcAwA9lkyBKU/BcnpI0DHwnxU8/XrhEu65K
	 bRLYv4UFGA1Dn5KKbPvirjYJMAl4RfftIrkwOu4iCaXgID+tPLTKnhSp0YAyIwWPU7
	 BzoyFxyArDH23EDEIC4eg/IGgkCTOdzTXBO6MvCmj+P6AyoiBPh4q8xnFJdVnsjThp
	 Gs8wSBl7lunFmiKttKX+an3j0N7HPca9wmxfbDpYJI+bIzrxG+fu9PIS4wOI98gL3K
	 M10WqJXdKwdtmrvdgO+ZrNxyYnad+U7HMPkCUm/Kys8Yz9gpk+1FA4lPVsy9+Vds1M
	 cAoeS6caVyVwg==
Received: by mail-pj1-f44.google.com with SMTP id o12so6769317pjo.4
        for <linux-firmware@kernel.org>; Wed, 14 Dec 2022 04:43:12 -0800 (PST)
X-Gm-Message-State: ANoB5pnAvX0fec/8DDz2YdM+3KmlFenr72iMQ2d46ztEcyBJwU/MO+iZ
	IgOHsQ+pqh+9BGDlYG2eK9TjgH8se6k1qCxF/VI=
X-Google-Smtp-Source: AA0mqf4lpFHG9g7NtkxHSIgKtVe3YKZIgsjuwaHgM6ngEfLLzpeogdKqxgWfF/Yw+XVno4nsW0/H+sTMkZa679dwzx8=
X-Received: by 2002:a17:902:9890:b0:189:9301:9c1d with SMTP id
 s16-20020a170902989000b0018993019c1dmr47213054plp.28.1671021791956; Wed, 14
 Dec 2022 04:43:11 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_PfHVa7HUhBbxZbuFe2KD4J1qQ0F9zt0U4a2rZU1O5xtQ@mail.gmail.com>
In-Reply-To: <CADnq5_PfHVa7HUhBbxZbuFe2KD4J1qQ0F9zt0U4a2rZU1O5xtQ@mail.gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 14 Dec 2022 07:43:01 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5Oj-j5H1Ps0GLja90PZq9D+2k7Rm=uEkcBL8Yi10BgRQ@mail.gmail.com>
Message-ID: <CA+5PVA5Oj-j5H1Ps0GLja90PZq9D+2k7Rm=uEkcBL8Yi10BgRQ@mail.gmail.com>
Subject: Re: Updated amdgpu firmware for amd-5.4 (22.40) release
To: Alex Deucher <alexdeucher@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Tue, Dec 13, 2022 at 10:09 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Hi,
>
> Updated amdgpu firmwares for existing chips and initial firmware for
> some new chips.  Please apply!
>
> Thanks,
>
> Alex
