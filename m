Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28630C433EF
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Oct 2021 13:10:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F2EFB61074; Mon, 18 Oct 2021 13:10:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC3346103D
	for <linux-firmware@kernel.org>; Mon, 18 Oct 2021 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634562643;
	bh=/bSqBAJe1qdSUvT9gTyiZIzUjPyMZNB7W1gizTQcUn8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eLI/F2b9GneWWfoa3s5u3KM3qfpwtHH8WXrZxFqDnjp0CHk4aTvWenthHWJKCGHRU
	 XBKwokj6sURxvQ5YflBupJ/WO25j1fVC4h2QnWf8X45vVrwxeJQOG6C5bcwoeWVDXK
	 7ndUY3pXp6iOIXiY3tYTcEdY93LY2/DyfuRbLMGuk5yqnPQLjPvmFOFp6c/BryKt1K
	 ytb9KNzrBbsPpo2Ax3txVc62FlPZxmI24lC7K/pPswmcgfWg4N09AA8jF1w/6H09bc
	 z3zH0JXgZf0uD7HxDXcLzDeWwQUXddXeh27Mqd7L1UicG2NE5zDNhQJLQiyytLhgzF
	 ChW3uvaFlnMOA==
Received: by mail-io1-f50.google.com with SMTP id m20so16128017iol.4
        for <linux-firmware@kernel.org>; Mon, 18 Oct 2021 06:10:43 -0700 (PDT)
X-Gm-Message-State: AOAM530AKFNmqST6Y6BqCzNdGAPBc5fqMF5Pe+kB+LKv7IxI3OCr5jgA
	zCqfx+2VxHmUo7ltzN5ZOQnZWsx/7NxxOOcKvuQ=
X-Google-Smtp-Source: ABdhPJx/VjnsAHJOCLtoz8JguJSAfFH6ceap6Rfx6Y6mIT5OXBNMoYgxasIaf7dWxpRhg0kqFNP3iXzycqAkefPHZw0=
X-Received: by 2002:a05:6638:632:: with SMTP id h18mr18878552jar.76.1634562643269;
 Mon, 18 Oct 2021 06:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <b3dc77916dc7486eb312e1e44119116b@realtek.com>
In-Reply-To: <b3dc77916dc7486eb312e1e44119116b@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 18 Oct 2021 09:10:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5qbQEr5d-dKa77vQWmztyRc_JrBi2WTCNcuL4BCQ=z7Q@mail.gmail.com>
Message-ID: <CA+5PVA5qbQEr5d-dKa77vQWmztyRc_JrBi2WTCNcuL4BCQ=z7Q@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852a: update fw to v0.13.30.0
To: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 13, 2021 at 5:46 AM Pkshih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update firmware of rtw89 driver that get merged.
>
> Ping-Ke
>
> --
>
> The following changes since commit ec17b637b7ab928ca7ebc0389e0e3921f1cc7d17:
>
>   rtw89: 8852a: update fw to v0.13.30.0 (2021-10-13 17:40:46 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to ec17b637b7ab928ca7ebc0389e0e3921f1cc7d17:
>
>   rtw89: 8852a: update fw to v0.13.30.0 (2021-10-13 17:40:46 +0800)

Is this from the 8852AE-0.13.30.0 branch?  The github repo defaults to
8852AE-v6 which does not have this commit.

josh
