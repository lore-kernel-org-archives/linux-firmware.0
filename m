Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ACEC433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 29 Dec 2021 13:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC031C36AE9; Wed, 29 Dec 2021 13:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D35C36AEC
	for <linux-firmware@kernel.org>; Wed, 29 Dec 2021 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640784621;
	bh=KZrCRZsnoIJfERPfvOCEY0YwJU7LNuOvUffRFK+7DFw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FfIWcMo6pdHEAPg9u+mXG34BpNU8BRc8ia9BgvAjqMkuomzEzIm254/hD3B4Tz3zA
	 qyk1iXoI3LiuUZtCdngSwSwM23skSMy3r7K3CUHJttynAaB+Hs6tiFOEGUiUBDG/kD
	 PnkVX00DX6cbZmI/+MNquVh5L6AaPOkkj6Xm7njg3lDHCeYXKIZckUUDKk2rm85w4g
	 CE2liVfSVpmUCZykph6JbDX7dgcgHyqyVLDtBpRtzG1h/xR2IKBM4iAI8yYFysBLuj
	 ZiWXV1Ol6LTQ7MVfLXeE2fvPxXHhTg9oWDkvtxwpVZIXyS9GqclC7yYzlUD3ZyMmrB
	 +0UtvPGYHIP2Q==
Received: by mail-il1-f173.google.com with SMTP id e8so16536840ilm.13
        for <linux-firmware@kernel.org>; Wed, 29 Dec 2021 05:30:21 -0800 (PST)
X-Gm-Message-State: AOAM531zoB4CcsOVn/1qQkFKJ/OHaYs0yOeMjwUboS/DQYFc3tMyX2R6
	ORxBCjSfDFsP9jqQMamZ2fs+ZReSR9SaWIeB9Eg=
X-Google-Smtp-Source: ABdhPJxrMB4HO8C2fabWvMBIYgMzFW7C25g1pu9qV4s2glTrWH+WVgKpCuoP1OY9lhoXBnU9oSNx8IVQ+QuVgtTwMlY=
X-Received: by 2002:a92:280e:: with SMTP id l14mr12538555ilf.97.1640784621152;
 Wed, 29 Dec 2021 05:30:21 -0800 (PST)
MIME-Version: 1.0
References: <e270c9f1-d052-c40b-1d9e-f380f60a5a4f@codeaurora.org>
 <CA+5PVA4ZK9dVxMEP_zi=OW6TNQmiBKDWnS6+Vz7hYB9ezX2U4Q@mail.gmail.com>
 <82e89316-bc66-b56a-a57f-8d168575a767@codeaurora.org> <4c42da13-337b-b862-699a-661fed8f8909@codeaurora.org>
In-Reply-To: <4c42da13-337b-b862-699a-661fed8f8909@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 29 Dec 2021 08:30:10 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5Yr+6DowWEqghmTHdWWb6G6t-GbyTRPZXK1iP4D3zsdg@mail.gmail.com>
Message-ID: <CA+5PVA5Yr+6DowWEqghmTHdWWb6G6t-GbyTRPZXK1iP4D3zsdg@mail.gmail.com>
Subject: Re: QCA Bluetooth WCN685x firmware pull request
To: Zijun Hu <zijuhu@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Rocky Liao <rjliao@codeaurora.org>, 
	tjiang@codeaurora.org, Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.  Thank you.

josh

On Mon, Dec 20, 2021 at 9:56 PM Zijun Hu <zijuhu@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers
>
> could you pull this updated request?
>
> On 12/17/2021 12:47 PM, Zijun Hu wrote:
> > Hi Josh,
> > i have solved the conflict and update pull request as following.
> > could you pull again?
> >
> > Hi linux-firmware maintainers,
> >
> > Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
> >
> > The following changes since commit
> > commit f682ecb015df087613f91872712eb6c0f6c998a8
> >     Merge https://github.com/pkshih/linux-firmware into main (Thu Dec 16 09:42:51 2021 -0500)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/zijun-hu/qca-btfw.git
> >
> > for you to fetch changes up to 1500362ad671e202a0ccec37064528395daf5936:
> > ----------------------------------------------------------------
> > Zijun Hu (1):
> >         QCA: Update Bluetooth WCN685x firmware to 2.1.0-00298 (Fri Dec 17 12:28:26 2021 +0800)
> >
> >
> > On 12/16/2021 10:46 PM, Josh Boyer wrote:
> >> This conflicts with the update I just pulled from tjiang.
> >>
> >> remote: Enumerating objects: 7, done.
> >> remote: Counting objects: 100% (7/7), done.
> >> remote: Compressing objects: 100% (3/3), done.
> >> remote: Total 7 (delta 4), reused 7 (delta 4), pack-reused 0
> >> Unpacking objects: 100% (7/7), 81.20 KiB | 1.14 MiB/s, done.
> >> From https://github.com/zijun-hu/qca-btfw
> >>  * branch            HEAD       -> FETCH_HEAD
> >> warning: Cannot merge binary files: qca/nvm_usb_00130201.bin (HEAD vs.
> >> 2d86903a10c2b06fdc84141167030931ac973a3f)
> >> CONFLICT (add/add): Merge conflict in qca/nvm_usb_00130201.bin
> >> Auto-merging qca/nvm_usb_00130201.bin
> >> Auto-merging WHENCE
> >> Automatic merge failed; fix conflicts and then commit the result.
> >>
> >> Can you discuss and see if it's needed?
> >>
> >> josh
> >>
> >> On Thu, Dec 16, 2021 at 3:56 AM Zijun Hu <zijuhu@codeaurora.org> wrote:
> >>>
> >>> Hi linux-firmware maintainers,
> >>>
> >>> Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
> >>>
> >>> The following changes since commit
> >>> commit b0e898fbaf377c99a36aac6fdeb7250003648ca4
> >>>     linux-firmware: Update firmware file for Intel Bluetooth 9462 (Tue Nov 23 10:29:13 2021 +0530)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    https://github.com/zijun-hu/qca-btfw.git
> >>>
> >>> for you to fetch changes up to 2d86903a10c2b06fdc84141167030931ac973a3f:
> >>> ----------------------------------------------------------------
> >>> Zijun Hu (1):
> >>>         QCA: Update Bluetooth WCN685x firmware to 2.1.0-00297 (Thu Dec 9 16:09:53 2021 +0800)
