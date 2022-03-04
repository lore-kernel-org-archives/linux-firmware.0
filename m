Return-Path: <SRS0=QnlO=TP=canonical.com=vicamo.yang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C998EC433FE
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Mar 2022 14:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 952B1C340F4; Fri,  4 Mar 2022 14:58:55 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E99AC340E9
	for <linux-firmware@kernel.org>; Fri,  4 Mar 2022 14:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E99AC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 981F93F1E6
	for <linux-firmware@kernel.org>; Fri,  4 Mar 2022 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646405931;
	bh=QtQbVQ/Ih1Irc0+PAo8QP/2uR7NXEGebuISPpisZF0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rHOuGZnsMSwTw0gESjf3R2Q+AoKM7Yl1ocFuBVuS3vshMH5i7MIf9e0gcl0glwyTk
	 n6CkLxsfAsILfTEnCaKkcDRT2k53AFzClvbGlYn3y1WZEM0PhDOzyKH2QUqS2dD9gv
	 zygSLRcb5U2xpAQoW/jPWN5PqDuHrzNsCDsKZRLTrDp8nwiid61HbOEJiPl08OwJbu
	 HBfrg8m6G7v0rRnzqpnTeK5BnJJXfy9LonLdg6b+epKMaq0/5/7kMkgDAELxSZ8vGH
	 2ylJh3jGm6OS+3Pbx45Q0LrfaGmXjs/49w8TWC/XwVWqC6sFOQAc4IOCa7RBDrgNNx
	 q4AjjgSqFGi8Q==
Received: by mail-io1-f71.google.com with SMTP id k10-20020a5d91ca000000b006414a00b160so5590756ior.18
        for <linux-firmware@kernel.org>; Fri, 04 Mar 2022 06:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QtQbVQ/Ih1Irc0+PAo8QP/2uR7NXEGebuISPpisZF0E=;
        b=GGMcv98IvWAzd71DahZtYd8nwyrLFD+jxhkZo/up7Vx8tJliRVSOjxbQIdMxC/J6RL
         JLYSNwom6OOFWUs2K7b/jNRSXwdKyiz9sykWbuIPn3A8Jb61gQCtLmo7yNAIim3/HFj+
         baRwNFQYaAdG1O4NXvwb75GMzhK7CH3jl1rAJGbIibHxhFxS6XHUFI61V93TtRGTeQlZ
         AxKLPLSz8tbZB7tuQGO/q2R6R7ezZqSyIj7wGyX1WJzOPwsf7AWUkaQkm9KkHCoPDDXU
         Q4qJo43IWcbBilS9dezcj747anMB700lUzmU/3SgZ6H4FLjRvu5r0p6i94ptGHA/PsCX
         D6nQ==
X-Gm-Message-State: AOAM533c03ZJ4ItfPH0sEgIr6QuMHDy475GMG+sJxEhcBGopRus6jJF2
	HrMoyAcPiZNwKjq2OK37toqlsXEKD+41hx2VQvKq+OINfh2qwPOqeDG883VFdzpZy2rr79Yuuew
	Fq8xBXao2TIV0EIMs/W0MjRrKcpsvTnw8f6tKilMBxi+sMDBw4QjZeA==
X-Received: by 2002:a05:6638:204d:b0:314:a290:48c with SMTP id t13-20020a056638204d00b00314a290048cmr34358723jaj.264.1646405930446;
        Fri, 04 Mar 2022 06:58:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7cF00yllaiBj+bcheGWbi8fhRdM4yllT56fHvUl2pS93MSK17sBSOY/l9uo+vqTUkZ0ce7TewUy5uECUbaMU=
X-Received: by 2002:a05:6638:204d:b0:314:a290:48c with SMTP id
 t13-20020a056638204d00b00314a290048cmr34358707jaj.264.1646405930140; Fri, 04
 Mar 2022 06:58:50 -0800 (PST)
MIME-Version: 1.0
References: <af43569b2247f7aff44b1ea3680d88dbe083d78d.camel@coelho.fi> <CA+5PVA4BbLaze8-c4R-8LESA9UhsDAJu3_FK4GZKUpVUkPKDrQ@mail.gmail.com>
In-Reply-To: <CA+5PVA4BbLaze8-c4R-8LESA9UhsDAJu3_FK4GZKUpVUkPKDrQ@mail.gmail.com>
From: You-Sheng Yang <vicamo.yang@canonical.com>
Date: Fri, 4 Mar 2022 22:58:38 +0800
Message-ID: <CA+rHWAL+JDKJVvocS_JX6CtJ4JUDf_wRMCQ-T1ejw+gT2LOekg@mail.gmail.com>
Subject: Re: pull request: iwlwifi firmware updates 2022-03-03
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Luca Coelho <luca@coelho.fi>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kyle@infradead.org" <kyle@infradead.org>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>, golan.ben.ami@intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 9:46 PM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Thu, Mar 3, 2022 at 6:11 AM Luca Coelho <luca@coelho.fi> wrote:
> >
> > Hi,
> >
> > This contains some new and updated firmwares for all our currently
> > maintained FW binaries.
> >
> > Please pull or let me know if there are any issues.
>
>
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: iwlwifi-QuZ-a0-jf-b0-71.ucode listed in WHENCE does not exist
> E: iwlwifi-so-a0-hr-b0-71.ucode listed in WHENCE does not exist
> E: iwlwifi-so-a0-jf-b0-71.ucode listed in WHENCE does not exist
> [jwboyer@vader linux-firmware]$
>
> Can you fix that up please?

My patch[1] doesn't have anything related to it, and another ppa[2]
with that has build pass. I believe that's something wrong in some
other place. Could you share your wip branch?

[1]: https://git.launchpad.net/~vicamo/ubuntu/+source/linux-firmware/commit/?h=bug-1962515/ax211-needs-67-fw/focal-pull&id=debfaf22ebeb0186789c52c2897b55d47f624ff8
[2]: https://launchpad.net/~canonical-hwe-team/+archive/ubuntu/linux-firmware-staging

> josh
>
> > --
> > Cheers,
> > Luca.
> >
> >
> > The following changes since commit ee0667aa201e7d725ec87b1e4cf08de1d748d64f:
> >
> >   amdgpu: update raven2 VCN firmware (2022-02-28 09:44:17 -0500)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2022-03-03
> >
> > for you to fetch changes up to ba104c67dfb838e892b6b4c72569aa7f1ee955a2:
> >
> >   iwlwifi: add new FWs from core68-60 release (2022-03-03 13:00:52 +0200)
> >
> > ----------------------------------------------------------------
> > Update and add iwlwifi firmware binaries for release Core68-60
> >
> > ----------------------------------------------------------------
> > Luca Coelho (2):
> >       iwlwifi: update 9000-family firmwares to core68-60
> >       iwlwifi: add new FWs from core68-60 release
> >
> >  WHENCE                            |  40 ++++++++++++++++++++++++++++++++++++++--
> >  iwlwifi-9000-pu-b0-jf-b0-46.ucode | Bin 1519544 -> 1520208 bytes
> >  iwlwifi-9260-th-b0-jf-b0-46.ucode | Bin 1490376 -> 1491056 bytes
> >  iwlwifi-Qu-b0-hr-b0-71.ucode      | Bin 0 -> 1364312 bytes
> >  iwlwifi-Qu-b0-jf-b0-71.ucode      | Bin 0 -> 1285192 bytes
> >  iwlwifi-Qu-c0-hr-b0-71.ucode      | Bin 0 -> 1364328 bytes
> >  iwlwifi-Qu-c0-jf-b0-71.ucode      | Bin 0 -> 1285208 bytes
> >  iwlwifi-QuZ-a0-hr-b0-71.ucode     | Bin 0 -> 1364308 bytes
> >  iwlwifi-cc-a0-71.ucode            | Bin 0 -> 1322288 bytes
> >  iwlwifi-so-a0-gf-a0-71.ucode      | Bin 0 -> 1550124 bytes
> >  iwlwifi-so-a0-gf-a0.pnvm          | Bin 41808 -> 41808 bytes
> >  iwlwifi-so-a0-gf4-a0-71.ucode     | Bin 0 -> 1566352 bytes
> >  iwlwifi-so-a0-gf4-a0.pnvm         | Bin 21576 -> 28064 bytes
> >  iwlwifi-ty-a0-gf-a0-71.ucode      | Bin 0 -> 1494024 bytes
> >  iwlwifi-ty-a0-gf-a0.pnvm          | Bin 41588 -> 41588 bytes
> >  15 files changed, 38 insertions(+), 2 deletions(-)
> >  create mode 100644 iwlwifi-Qu-b0-hr-b0-71.ucode
> >  create mode 100644 iwlwifi-Qu-b0-jf-b0-71.ucode
> >  create mode 100644 iwlwifi-Qu-c0-hr-b0-71.ucode
> >  create mode 100644 iwlwifi-Qu-c0-jf-b0-71.ucode
> >  create mode 100644 iwlwifi-QuZ-a0-hr-b0-71.ucode
> >  create mode 100644 iwlwifi-cc-a0-71.ucode
> >  create mode 100644 iwlwifi-so-a0-gf-a0-71.ucode
> >  create mode 100644 iwlwifi-so-a0-gf4-a0-71.ucode
> >  create mode 100644 iwlwifi-ty-a0-gf-a0-71.ucode
> >



-- 
Regards,
You-Sheng Yang
