Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E19BC4361B
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Dec 2020 19:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 05D6323B85; Fri, 18 Dec 2020 19:10:12 +0000 (UTC)
X-Gm-Message-State: AOAM532uBxu33NBXo96QES5JkYMzFGWD4EXRE7N7ZkN4L+2w7YIn9DmL
	j7/OV8e5HdsWNEoiae5VRzShjd/M9d530VBWaPM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608318611;
	bh=m+IrcOfE4AenMX1aV6Ab9xG88pOPUoFNVUzGVF2Ox1U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RQ2c8A9Kmhn1pO6Uz2k0nUQffkklHYgdMdsVJ16s1f0eG3zm+iXukUHFcd0T1mnez
	 L+J6S7qmHqq+BQL3vQV7ZH5H44K8n8xyNJOXanB5FxJyhTUTR08v7wxTfz4MrMoOvf
	 RU/yRPtBaYbSfN5E3qCerHUixH0KMY/HcCVkXAHZ6CEomhLSVyZ5FYr6WXKytWHMqh
	 DBlfkKdcAUxu8AoNNIP/YnMzr8EmX5Iu+9YlNLZVaewc4p9v60wbQuO0qA0VKfA9Sq
	 dqZ9h0ChTIM5GU4YDn61T2ZTUZexrWM/FOmY6hDnCgJ3KgbKH8NcA64CAJmtH1xwLt
	 In3pevZEO6uJA==
X-Google-Smtp-Source: ABdhPJwm4dAZ7rMXhDatlRMWluPKHJwM+x5oPjae/S3MtZe3rBvtYjc3X/6/hJw6ZRhDfwAwVkPO4Pxblua98Tnp77w=
X-Received: by 2002:a6b:6d1a:: with SMTP id a26mr5229538iod.158.1608318611399;
 Fri, 18 Dec 2020 11:10:11 -0800 (PST)
MIME-Version: 1.0
References: <f0abb3ea-0c12-3b21-12e5-331071bbbe8b@message-id.b1-systems.de>
In-Reply-To: <f0abb3ea-0c12-3b21-12e5-331071bbbe8b@message-id.b1-systems.de>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Dec 2020 14:10:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA63Qc1WTQDqQimOUSAy28fmDDcRAcX4mE8DNs8J9u+Ptw@mail.gmail.com>
Message-ID: <CA+5PVA63Qc1WTQDqQimOUSAy28fmDDcRAcX4mE8DNs8J9u+Ptw@mail.gmail.com>
Subject: Re: brcmfmac: add AP6212 symlinks to make bananapi boards happy
To: Stefan Seyfried <seife+dev@b1-systems.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Wed, Dec 16, 2020 at 8:50 AM Stefan Seyfried
<seife+dev@b1-systems.com> wrote:
>
> Hi linux-firmware maintainers.
>
> The attached (sorry ;-) trivial patch, also available from
> https://github.com/seife/linux-firmware.git adds two symlinks to make
> BananaPi M2 zero and M2 plus WiFi work out of the box.
>
> Thanks,
>
>         Stefan
> --
> Stefan Seyfried, Linux Consultant & Developer
>
> B1 Systems GmbH
> Osterfeldstra=C3=9Fe 7 / 85088 Vohburg / http://www.b1-systems.de
> GF: Ralph Dehner / Unternehmenssitz: Vohburg / AG: Ingolstadt,HRB 3537
