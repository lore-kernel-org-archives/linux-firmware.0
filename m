Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0718C433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jan 2022 14:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D1D0C340E2; Tue, 18 Jan 2022 14:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E8FC340E5
	for <linux-firmware@kernel.org>; Tue, 18 Jan 2022 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642517080;
	bh=TDkwP8VBKtiNnT+mTATiMg8TBiQWoMHRZB3Fmr6r6oY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=hUuwWLWz7ECRWUPamJBmmpcT6OhrSHpjfIamiLvKJY3sTvY+aEq8pd4jCS216KmM1
	 guWywQsl1arsm/kihvMaukVVg4wobscNUq1oaKCoRjw0NV2nHWHVnoEYivK4X87Tr9
	 fL/rTZhiuqzJQZrlAJv77P3FXahxvcO0OeQE9lZAy/JlqEpJd0Ot/trGY2+iB0k/yq
	 J/lHBll4xg5Y/d8BSv3nht86/LI1gQLepo2r693bwJ+PwBCaqPu9rXW5MdyxLNRUsq
	 dR5dA3u4Zc9GF6pZWVrRQgbSkeldbEtNVOLXs81ox8bdlpninKPm2vpMg29yyTK8Td
	 p4u3T1RBalpQQ==
Received: by mail-il1-f169.google.com with SMTP id u5so13465438ilq.9
        for <linux-firmware@kernel.org>; Tue, 18 Jan 2022 06:44:40 -0800 (PST)
X-Gm-Message-State: AOAM532QJNVL7VXgjAAr6TGIgcuCVvbGYA3CQpuIXVC9iCJqUPnMSzPr
	YiB64Af2A6K22164HX/y2prXjRZfZDrXSLs5mj0=
X-Google-Smtp-Source: ABdhPJzWN3HfFYXvNQ9Ib23yW6isEWwHfMq4Ghegkg+0YlCrmFzxESzPdwS0YVUoQHipwBMODqOkVEG3H3C3HNZ9m98=
X-Received: by 2002:a05:6e02:1c25:: with SMTP id m5mr14022632ilh.251.1642517079733;
 Tue, 18 Jan 2022 06:44:39 -0800 (PST)
MIME-Version: 1.0
References: <5029a137-0b82-bb66-b1f9-47fd0676aa54@codeaurora.org>
 <CA+5PVA4qFX3Gv_kuWEpe_mof=PE0CGuK4WE3bbbyCkDpPabDFg@mail.gmail.com> <7c078a1a6a9d5d834b30f252706e517e@codeaurora.org>
In-Reply-To: <7c078a1a6a9d5d834b30f252706e517e@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Jan 2022 09:44:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6cLQZ7SkSWAZ5aLrDK_c+WfpB6WyKthZjw_Hrt1Q4-aA@mail.gmail.com>
Message-ID: <CA+5PVA6cLQZ7SkSWAZ5aLrDK_c+WfpB6WyKthZjw_Hrt1Q4-aA@mail.gmail.com>
Subject: Re: QCA Bluetooth WCN685x firmware pull request at 2022/01/04
To: Zijun Hu <zijuhu@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Rocky Liao <rjliao@codeaurora.org>, 
	tjiang@codeaurora.org, Zijun Hu <quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Jan 13, 2022 at 3:12 AM <zijuhu@codeaurora.org> wrote:
>
> On 2022-01-07 20:26, Josh Boyer wrote:
> > On Tue, Jan 4, 2022 at 4:36 AM Zijun Hu <zijuhu@codeaurora.org> wrote:
> >>
> >> Hi linux-firmware maintainers,
> >>
> >> Here's a pull request for btqca bluetooth driver. Please let me know
> >> if you have any problems.
> >>
> >> The following changes since commit
> >> commit 57d6b9507e28ac4803ea4aa4dba9592c889d6733
> >>     cnm: add chips&media wave521c firmware. (Mon Dec 27 09:07:08 2021
> >> +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://github.com/zijun-hu/qca-btfw.git
> >>
> >> for you to fetch changes up to
> >> 17fe7809058ad5949c12d80bf446e726f9e9f782:
> >> ----------------------------------------------------------------
> >> Zijun Hu (1):
> >>         QCA: Add Bluetooth nvm file for WCN685x (Tue Jan 4 14:14:51
> >> 2022 +0800)
> >
> > There are actually 3 commits on your main branch that will be merged,
> > not just this one.  They are:
> >
> > 17fe7809058ad5949c12d80bf446e726f9e9f782 QCA: Add Bluetooth nvm file
> > for WCN685x
> > 72af07ecad7646f84e49222596ad09bcebe223d9 QCA: Update Bluetooth WCN685x
> > 2.1 firmware to 2.1.0-00324
> > 7411d2bf5afa895c6440ca2f935a50a74245eee7 QCA: Update Bluetooth WCN685x
> > 2.0 firmware to 2.0.0-00609
> >
> > Is that what you wanted with this pull request?
> yes, there are 3 commits to merge.
> thank you
> >
> > josh
