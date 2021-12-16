Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3800AC433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 14:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E176C36AE4; Thu, 16 Dec 2021 14:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D5FC36AE6
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639665685;
	bh=EUGxlKUOHQy889LoPNSZ4BWZHIMjz6O9A93gzd7dNsY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=P+WV/nCwm2nNs0MZ499Nf8/k87SmyycbMdc77waFfep5SGVP1ouWHpwDUaKj4o5aI
	 2Ngy/MHy9wU34/e43BI50o6mGwkcJ1lMo6P9jG/lRgznEA0Rv1criZaiYi+7BbfP+0
	 2H6X67uTPnZ5ROFE5mSVQhVNRxkwbs7t4xSEDJXQFs5qEN/iBnNRKUwWx5Ket14ho1
	 Xt2Lyu6sCbBNn9PZ6LxiJLWv4qt4490E7uko/MkuhWNxWM6U+uywaig27eRm0EOlxj
	 /JI8t0R3kCi9Gu72mbrzpg82RuO9npQlJwB3LuxthW8ZCQWfxL2PMjD6J4hmIMnNbf
	 +3n9XXwp6GXiw==
Received: by mail-io1-f45.google.com with SMTP id p65so35519402iof.3
        for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 06:41:24 -0800 (PST)
X-Gm-Message-State: AOAM532vzddHGl3tO7XPEKug+VbbqM5n5W6MON1h0sdLWQD1Tm2Fioq1
	ciO53MZeZy0k97E0Fin/CQgdoUpI++isWT65J/Y=
X-Google-Smtp-Source: ABdhPJykPi8KsIUTYxNPSipbAX6wiJk22Agg3619SLcoZ37UaWSkH1n3/QT3ZlzWxGvfF9mrEXfTWDZY4f6gaf0zfJ8=
X-Received: by 2002:a05:6638:3014:: with SMTP id r20mr9613702jak.146.1639665684183;
 Thu, 16 Dec 2021 06:41:24 -0800 (PST)
MIME-Version: 1.0
References: <72436183aa6c164a1a9df5038fc1f652@codeaurora.org>
In-Reply-To: <72436183aa6c164a1a9df5038fc1f652@codeaurora.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 16 Dec 2021 09:41:13 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4bNYAGQcEcTm+NXj5Lpet9vMsif7w8mxCDWktCUR9JNA@mail.gmail.com>
Message-ID: <CA+5PVA4bNYAGQcEcTm+NXj5Lpet9vMsif7w8mxCDWktCUR9JNA@mail.gmail.com>
Subject: Re: btqca firmware 20211126
To: tjiang@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sincere apologies for the delay.  Pulled and pushed out.

josh

On Thu, Nov 25, 2021 at 11:51 PM <tjiang@codeaurora.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> 73a13f4d8d6059768f1090a95c43b8b5333b58db
>
> QCA: Add Bluetooth firmware for WCN685x
>
> are available in the Git repository at:
>
> https://github.com/tjiang123/qca-btfw.git
>
> for you to fetch changes up to 28fdbcd7528ab7f9816fdb73ae1a0601e5ab8d37:
>
> Tim Jiang:
> QCA: Add Bluetooth default nvm file for WCN685x
>
> thank you.
>
> regards.
> tim
