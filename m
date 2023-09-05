Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0977FC83F2C
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Sep 2023 16:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD259C433C9; Tue,  5 Sep 2023 16:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E8BC433C7
	for <linux-firmware@kernel.org>; Tue,  5 Sep 2023 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693932596;
	bh=i1PH/j/ZO8BysE2ECjZtl8w5uNyRRmgG+JfVc32Cpvc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=LWxzfEbGCan+hBchWyZigGXjVHnSjAtRhqTA0FadTI4zbPkR0Si2g8v3TFy51rRzr
	 NUQrpSwOHqE3NPdRkfPBy0qi1Z2ZzJLC3HnHxkB75UmjQz29d/pMjIolxTzO5/9ris
	 dkVETzQU8ZGXKj9N9Y0yU9gpDqnYeEMmDzgdsP7i/WQOtLcOeFHQm6BhR15xL7nI3O
	 bLGwa9PfzjgMD3iT1EaTSRRmCDrkGOBI3URrx0TyMeaWMxcXXjRcCbvRe7MuQCQUZM
	 D+55Gyo7qESi1Iozd6mFDArjRmTorNvVVRMkA4qUFCXe+o2QSUhKpKhje5Y496LelL
	 ISRzAcwYhbKsg==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-58c92a2c52dso26010207b3.2
        for <linux-firmware@kernel.org>; Tue, 05 Sep 2023 09:49:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YxuCfW1DCGOjzsJO8DMVGxlIAjHN9rDzNzgpv2WsIyRwW0Njx1P
	Dpks8b9WTdo+dykWK+/5whAVoevcBZzKVvkybaw=
X-Google-Smtp-Source: AGHT+IEc2j9u/oHXxyvlYdG4cJWNYP1F+5gIg4ygcmIfyio1sBsvV/6qrWeBVrofpaezD1kgpQ8+4/qQd4SZKdERiAQ=
X-Received: by 2002:a81:6d55:0:b0:58f:c452:74da with SMTP id
 i82-20020a816d55000000b0058fc45274damr16565448ywc.42.1693932595643; Tue, 05
 Sep 2023 09:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <91fea221-6ff9-6850-7d4c-5ecfa2b8a3c6@quicinc.com>
In-Reply-To: <91fea221-6ff9-6850-7d4c-5ecfa2b8a3c6@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 5 Sep 2023 12:49:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5DY_18LEqUa10ZcbEYBJWhFXAraXx=UpM+qeqe0-iipg@mail.gmail.com>
Message-ID: <CA+5PVA5DY_18LEqUa10ZcbEYBJWhFXAraXx=UpM+qeqe0-iipg@mail.gmail.com>
Subject: Re: btqca firmware 20230831
To: Tim Jiang <quic_tjiang@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 5:46=E2=80=AFAM Tim Jiang <quic_tjiang@quicinc.com>=
 wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
> The following changes since commit
> 5ebb5914a3b95be1dab4f058d073bd75afcdd0f2:
>
>     Merge branch 'mlimonci/update-ci' into 'main'
>
>
> are available in the Git repository at:
>
>     https://github.com/tjiang1234/btfw-wcn6855-605

Pulled and pushed out.

josh

>
> for you to fetch changes up to 1edd2d6faa066928f0ef7594ffc2a13d9888ea85:
>
> ----------------------------------------------------------------
>
>          QCA: Update Bluetooth WCN685x 2.1 firmware to 2.1.0-00605
>
