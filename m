Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE979C433EF
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Jan 2022 12:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB377C36AE5; Fri,  7 Jan 2022 12:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A480AC36AE0
	for <linux-firmware@kernel.org>; Fri,  7 Jan 2022 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641558396;
	bh=gCzLs7Z6/jb5/LhUi1dj53BlX2+ojjgM5ssneDILpR0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=dnvUmMRXJ036GZB/LbgF2JZPCny/NoJQTaTxUtLsoF2pqkVD5+isdlR9166PhoL7o
	 hezYXjlTyTm2A4o7luEWEofuW8JwMLIW2gqbCpyfdshPdx8MpTDd5z0S4IatyETQdo
	 dHJm4cCNkBPFsODg3WrFc3Sof+dPB5eJEKm2V+th5/6JFuBLtdH+aIvxXll6f8gv+V
	 W7EL7mxkqjr/W5gyLsZ1x6QA/jv1sjvYvsBLXGnkm8+OpJJayT4ZCYC6wIzLbm5OSh
	 5Tm7J2tNnNOeuxeJ4OPrbqRfkuGAs2fdLnaLEaOSMLP0BWDhuuLIb3lTvZuf98JoYf
	 S1NjKPlD+xTTg==
Received: by mail-io1-f49.google.com with SMTP id 19so6870169ioz.4
        for <linux-firmware@kernel.org>; Fri, 07 Jan 2022 04:26:36 -0800 (PST)
X-Gm-Message-State: AOAM533hM1B5UNtsLk5NkRGHUVrJ8OUbh/pnz6F2cR3TFUficjEClH1z
	44FHPV/lJO8LHnR4Vvr4hOP6UOqCfmPNZ2mld00=
X-Google-Smtp-Source: ABdhPJymaIVwENcVy6S8XU71Suozvw83PXVYdRUsOPA6dDbsS9WWcv0cc2yDIqm1+WWwD3/VWLmmFI66My8DT4KmITM=
X-Received: by 2002:a05:6638:44f:: with SMTP id r15mr29385488jap.254.1641558395878;
 Fri, 07 Jan 2022 04:26:35 -0800 (PST)
MIME-Version: 1.0
References: <5029a137-0b82-bb66-b1f9-47fd0676aa54@codeaurora.org>
In-Reply-To: <5029a137-0b82-bb66-b1f9-47fd0676aa54@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 7 Jan 2022 07:26:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4qFX3Gv_kuWEpe_mof=PE0CGuK4WE3bbbyCkDpPabDFg@mail.gmail.com>
Message-ID: <CA+5PVA4qFX3Gv_kuWEpe_mof=PE0CGuK4WE3bbbyCkDpPabDFg@mail.gmail.com>
Subject: Re: QCA Bluetooth WCN685x firmware pull request at 2022/01/04
To: Zijun Hu <zijuhu@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Rocky Liao <rjliao@codeaurora.org>, 
	tjiang@codeaurora.org, Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 4, 2022 at 4:36 AM Zijun Hu <zijuhu@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
>
> The following changes since commit
> commit 57d6b9507e28ac4803ea4aa4dba9592c889d6733
>     cnm: add chips&media wave521c firmware. (Mon Dec 27 09:07:08 2021 +0000)
>
> are available in the Git repository at:
>
>    https://github.com/zijun-hu/qca-btfw.git
>
> for you to fetch changes up to 17fe7809058ad5949c12d80bf446e726f9e9f782:
> ----------------------------------------------------------------
> Zijun Hu (1):
>         QCA: Add Bluetooth nvm file for WCN685x (Tue Jan 4 14:14:51 2022 +0800)

There are actually 3 commits on your main branch that will be merged,
not just this one.  They are:

17fe7809058ad5949c12d80bf446e726f9e9f782 QCA: Add Bluetooth nvm file for WCN685x
72af07ecad7646f84e49222596ad09bcebe223d9 QCA: Update Bluetooth WCN685x
2.1 firmware to 2.1.0-00324
7411d2bf5afa895c6440ca2f935a50a74245eee7 QCA: Update Bluetooth WCN685x
2.0 firmware to 2.0.0-00609

Is that what you wanted with this pull request?

josh
