Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8FFC433EF
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Jul 2022 15:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 733A4C341CE; Tue,  5 Jul 2022 15:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E51CC341CA
	for <linux-firmware@kernel.org>; Tue,  5 Jul 2022 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657034978;
	bh=2CjkaCskZ/VGE230bmTruOf6EFaVlqpwO7Uu+ZRQ1AU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=BgUD6YtmOuCl6Ub8o037p7OsYZmTdAYEa+1cSkJ3rmr6Et4MQIub1CE+ZhxQb/OFy
	 6g4aPxSWFuEDmnuiv1uX1NQJxD96+3hJL3raVvVWnhqsW83qD1SpLQ56yzy6wKseVu
	 0mbjVb9ZB8OKq+F6zyBPwZMNtjCDXZgbcXWtheUdXZVjHei6vCDoGuhOIb6+LiDkdL
	 WEK0wZvp6zpq6+ZgmNY0TYblQ5lUqzPQB/XlLPBCbfJohbCVVt2aFUv3jPOGGJADj1
	 OGdYliBiyjo4YYl+9OIoCdqIf1n0NFbWDjQTV3zBAXrF6VmDY73o16B5gggPBvebOd
	 32KX7fbAHcA6g==
Received: by mail-il1-f170.google.com with SMTP id p9so7442222ilj.7
        for <linux-firmware@kernel.org>; Tue, 05 Jul 2022 08:29:38 -0700 (PDT)
X-Gm-Message-State: AJIora9/3yhBj2sdCZ4U5wa5eA7M7+nMehBx6IxaxKi7FWIMADJd0B8c
	7rR44zBlPbsOi0JyrRoeRifGmX5nT/1hmIkiAQM=
X-Google-Smtp-Source: AGRyM1txFUPY7N0y55/i/a+0/mmY79R96CanGwNGs2ngtuxMyq8bl0JciYRZ1UwmJUx3s+VS/9NTf5yYGyXuThiWb+4=
X-Received: by 2002:a05:6e02:1b86:b0:2da:bf51:1d47 with SMTP id
 h6-20020a056e021b8600b002dabf511d47mr19960785ili.218.1657034977449; Tue, 05
 Jul 2022 08:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <8fa3de7a18829a865933c4d4ab2b49f6e60a1054.camel@realtek.com>
In-Reply-To: <8fa3de7a18829a865933c4d4ab2b49f6e60a1054.camel@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 5 Jul 2022 11:29:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5xtwoyPKPi6fDYtVjOauOPvMWYXy+s81WTevw5RdvSng@mail.gmail.com>
Message-ID: <CA+5PVA5xtwoyPKPi6fDYtVjOauOPvMWYXy+s81WTevw5RdvSng@mail.gmail.com>
Subject: Re: pull request: rtw88: 8822c: Update normal firmware to v9.9.13
To: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Bernie Huang <phhuang@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.  Thank you.

josh

On Thu, Jun 23, 2022 at 7:48 AM Ping-Ke Shih <pkshih@realtek.com> wrote:
>
> Hi,
>
> Update 8822c firmware of rtw88 driver to 9.9.12/9.9.13.
>
> Thank you
> Ping-Ke
>
> ---
> The following changes since commit 7eef50f83896dc574582d69a36a643722365b04c:
>
>   rtw88: 8822c: Update normal firmware to v9.9.13 (2022-06-23 19:39:58 +0800)
>
> are available in the Git repository at:
>
>   https://github.com/pkshih/linux-firmware.git
>
> for you to fetch changes up to 7eef50f83896dc574582d69a36a643722365b04c:
>
>   rtw88: 8822c: Update normal firmware to v9.9.13 (2022-06-23 19:39:58 +0800)
