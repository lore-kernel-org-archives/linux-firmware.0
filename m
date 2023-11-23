Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F145C27C40
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Nov 2023 00:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD930C433CB; Thu, 23 Nov 2023 00:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8204C433C7
	for <linux-firmware@kernel.org>; Thu, 23 Nov 2023 00:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700697920;
	bh=L1OswcVO61MjalP/YFjT4Z7TxVkgrbjWTBYba3T59WA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ID4CWe6BnTo+UmXx3eIz8eIcmX2c5RyCMeYrwMzknBFqYfLYQWIlKfaRR0hF4LPt4
	 1HMDoRVZDwBhbM9SrOl2WgY/jGSryO9ZYq3A1olkg7LuG64UTbymh4gSKvzrvdGj4e
	 uqD4s4/XnFq69VZusm2YLggq61gCptJ3N/mSR4NhGp4o8QxyBkqXryV001CIeKkIdN
	 KwzSpPkcsOk9h+l4OvwmTr+S3e4KYc40oddRIDd+d3ioWqFWLnzmiFuG+gduf3eyPs
	 AffFyM5xWzQi0FmqCdRWTPlMsSNTUOLHgGx0ZK2YNvgqvg752x88L3RW2BTybPAl0q
	 bPIWe7UdKQ1mg==
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso34414276.2
        for <linux-firmware@kernel.org>; Wed, 22 Nov 2023 16:05:20 -0800 (PST)
X-Gm-Message-State: AOJu0YzAXfgj3k3JfgzbSHpryelCPA77VX0fxKvFe3Le7gGO2jtfEoCx
	0YMU+Af5TIbNx6gmsP8kgOScEee+pUJ3WtNpbRo=
X-Google-Smtp-Source: AGHT+IEZJaaXAVUDl8vtj2YFKAhdUbCYlrHXCWIbVx3fqTcvmXyxAHnY4DYXzN1yTNAjbPWSr3nS11AiwqzKeiq9jUs=
X-Received: by 2002:a0d:ef45:0:b0:5c9:12ec:5203 with SMTP id
 y66-20020a0def45000000b005c912ec5203mr3970793ywe.32.1700697919955; Wed, 22
 Nov 2023 16:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20231121081735.21837-1-jason-ch.chen@mediatek.com>
In-Reply-To: <20231121081735.21837-1-jason-ch.chen@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 22 Nov 2023 19:05:09 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6AdWpwKD1+e4y01fVQG9hq7XFo8bYvpz4BJ9DtvLh1ng@mail.gmail.com>
Message-ID: <CA+5PVA6AdWpwKD1+e4y01fVQG9hq7XFo8bYvpz4BJ9DtvLh1ng@mail.gmail.com>
Subject: Re: pull-request: linux-firmware: Update MT8195 SCP to remove an
 unused packed library
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	yunfei.dong@mediatek.com, menghui.lin@mediatek.com, shawnku@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 3:17=E2=80=AFAM Jason-ch Chen
<jason-ch.chen@mediatek.com> wrote:
>
> The following changes since commit 9552083a783e5e48b90de674d4e3bf23bb855a=
b0:
>
>   Merge branch 'robot/pr-0-1700470117' into 'main' (2023-11-20 13:09:23 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23042
>
> for you to fetch changes up to ebebd79cb34038b0dcc964fbb4a07525b2b790aa:
>
>   mediatek: Remove an unused packed library (2023-11-21 16:14:00 +0800)
>
> ----------------------------------------------------------------
> Jason Chen (1):
>       mediatek: Remove an unused packed library

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/73

josh

>
>  mediatek/mt8195/scp.img | Bin 635448 -> 635532 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
>
