Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B920C433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 27 Oct 2021 11:38:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3C3BA60ED4; Wed, 27 Oct 2021 11:38:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26A076103C
	for <linux-firmware@kernel.org>; Wed, 27 Oct 2021 11:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635334694;
	bh=EhI46bO/kN8HCDNKS9UyZgqnt7Rh0jQ5MWBy7KBc70w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=pL5QvJ9yFqKdNtOHeAxMfsH9ihA1W3gZzbbE8MbpdpiU4xCmXAt4akdVLNVV9NVeG
	 +lIjD+lmyXINvifYMk2Z1og3aU7o1FrcTnMHeAG8muhKtx9202m1EF5nN01Po+ov/y
	 MlGcAWBY089bNQNrRwbI4pc8dvHrURu0gCqa1VZRtEtDawWr2iDvzft+y8h1fXhrJA
	 0c4gke8QNWd5wC1KgRrJciE/cvNacRKdwz6DP9Tm59BqRclEiFTqq5wpW2WLUglhkD
	 HmSo8wdCjnfE6y/xN3+oGiwY1Q+ocIJZZHIK91UggkuhGZnp6BdBVGG8i3743vXc+V
	 +YQj+skDFXtIw==
Received: by mail-io1-f41.google.com with SMTP id r194so3216087iod.7
        for <linux-firmware@kernel.org>; Wed, 27 Oct 2021 04:38:14 -0700 (PDT)
X-Gm-Message-State: AOAM531O+Dqb6JsOFU/IfmTFtJk9214WCSJjzKlTxNA0fOHIl6y7Xy3t
	ahX6Y3bKtgZS5wfydM/qmEvXlXepSeBcrCtAtLs=
X-Google-Smtp-Source: ABdhPJwlSW0eosN0NEsR9z0//crpuF7wxxUNsCjiM+TF4zV/tjkHNfm8YfWA0JayQl08NNmwI/oPJRJQE1/TdBgCy8U=
X-Received: by 2002:a05:6602:2dca:: with SMTP id l10mr18714323iow.175.1635334693536;
 Wed, 27 Oct 2021 04:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <ce803519aaf7feb5845bc694ceb55b1d@codeaurora.org>
 <CA+5PVA4YdACvgNPUSE-w-x6HUa9nX-gz6RPkimj6htZ-edanUQ@mail.gmail.com> <51d8f88a8118d2aa7da78f7eeee68717@codeaurora.org>
In-Reply-To: <51d8f88a8118d2aa7da78f7eeee68717@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 27 Oct 2021 07:38:02 -0400
X-Gmail-Original-Message-ID: <CA+5PVA79RUCEnxQ8axnUU+bOAL-MQi=h_ueMEP20YBVjnq9zDg@mail.gmail.com>
Message-ID: <CA+5PVA79RUCEnxQ8axnUU+bOAL-MQi=h_ueMEP20YBVjnq9zDg@mail.gmail.com>
Subject: Re: btqca firmware 20211019
To: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 11:19 PM Rocky Liao <rjliao@codeaurora.org> wrote:
>
> Hi,
>
> Updated, the new commit id is: 582c9da3e47b41f6a2620fd76d650f9d69de54fe

Thank you.  Pulled and pushed out.

josh

> =E5=9C=A8 2021-10-25 19:17=EF=BC=8CJosh Boyer =E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Oct 19, 2021 at 4:11 AM Rocky Liao <rjliao@codeaurora.org>
> > wrote:
> >>
> >> Hi linux-firmware maintainers,
> >>
> >> Here's a pull request for btqca bluetooth driver. Please let me know
> >> if
> >> you have any problems.
> >
> > qca/nvm_usb_00130200_0109.bin is a new file and needs to be added to
> > WHENCE.  Can you please adjust and resend the pull request when it's
> > fixed?
> >
> > josh
> >
> >> The following changes since commit
> >> d34196f55db16f2344483f94718c2b2263a5489e:
> >>
> >>     linux-firmware: update firmware for MT7921 WiFi device (Mon Oct 18
> >> 13:11:16 2021 +0800)
> >>
> >> are available in the Git repository at:
> >>
> >>     https://github.com/rjliao-qca/qca-btfw.git
> >>
> >> for you to fetch changes up to
> >> c2e1fd30d91e22f9540f8253f1890c06cbba1a75:
> >> ----------------------------------------------------------------
> >> Rocky Liao (1):
> >>          QCA: Update Bluetooth firmware for WCN685x (Tue Oct 19
> >> 16:00:42
> >> 2021 +0800)
