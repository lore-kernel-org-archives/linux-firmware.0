Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10212C87FCB
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Aug 2025 13:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD2F3C4CEF7; Wed,  6 Aug 2025 13:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56C9C4AF09
	for <linux-firmware@kernel.org>; Wed,  6 Aug 2025 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754486498;
	bh=lG33Q/3l4FtD5YBvULqji0wQAFXPxmSQ97DL6yt0SUc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Vs+k58nCcYGyKZQdor/hUCsFfXy9MSn4biJnqRQlHIoZYu0AsD3IP3haXpvB0pw54
	 ig8zT//MqzooKVymdHYhKOAyCziRe5H/ENcgZatKPZqk/S7i6VNfTuJ2GOCO2ipcWv
	 P7sHcsVYb35Jr6+yl5b86Fyk0Yu0z1C49MYpPOAfldF7EV5TzXai/Ddov1g960Ud5z
	 9htWfqiBGULbL7Sh0qV33X9PWfOlAl+eCWDbOGZ0Sj5m067ec3xCLk82GzB3P6UkPX
	 zLWCC9vSS0vnpWaSecbb50xrcL2eOC/mnV1vz3l/WcS89pGduksabViN1KDCxryzmJ
	 TTDbOs9PdgXdw==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8e014c1d19so4629420276.3
        for <linux-firmware@kernel.org>; Wed, 06 Aug 2025 06:21:38 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx7YUGlapG2Sb1gZC0wlvqf5Lt/qaw5xGYyz0fhZ3mbwri7cuxV
	y5+B9esDj4yW9DPpfw9sdqBHEzpFztgAv7PragBclqZGxynu62c9jj7OHnMHsojDXC1m+swIunn
	NidfvocM5wIe+VJAy4D2y8efklhUKhSI=
X-Google-Smtp-Source: AGHT+IFw1P6imoj8rik6U+bAKqvaPNsiV9vlZ3dm0Vq9R13E9p5ynIe+NwCaCycF2ZyUmEI9gUJc+YwuJ4v2XlohZxY=
X-Received: by 2002:a05:6902:1025:b0:e8d:70b5:a504 with SMTP id
 3f1490d57ef6-e902ab8ab46mr2772633276.9.1754486497837; Wed, 06 Aug 2025
 06:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <57b6539b-b8c4-4adf-a806-d5e4a2da46b9@oss.qualcomm.com>
In-Reply-To: <57b6539b-b8c4-4adf-a806-d5e4a2da46b9@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 6 Aug 2025 09:21:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA76WGu2tXjxkSj9kEt_YS9zQ2BV1iYspWWmwjSraxoYGg@mail.gmail.com>
X-Gm-Features: Ac12FXzPuUDliGe5YjOrlk2Vi0KRPzOtuwi_4XakeubZsJxDGj9_05A6IrgFsBw
Message-ID: <CA+5PVA76WGu2tXjxkSj9kEt_YS9zQ2BV1iYspWWmwjSraxoYGg@mail.gmail.com>
Subject: Re: Guidance on Submitting Firmware File >100MB to linux-firmware
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Mario Limonciello <superm1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 2, 2025 at 6:24=E2=80=AFAM Kishore Batta
<kishore.batta@oss.qualcomm.com> wrote:
>
> Hi Maintainers,
>
> I=E2=80=99m preparing a contribution to the linux-firmware repository for=
 the QDU100 platform, which includes a firmware blob (qdsp6sw.mbn) that is =
~110.88 MB in size.

Obvious question, likely with an obvious answer: why is it so big?

> Since GitHub enforces a 100 MB file size limit, I=E2=80=99m unable to pus=
h this file directly. I understand that the repository does not currently u=
se Git LFS, so I wanted to ask what is the recommended approach for submitt=
ing large firmware files?

We could enable LFS on the Gitlab side, but I don't believe kernel.org
repos allow this.  I can follow up there.  Assuming they don't, I
don't really have a great solution off the top of my head.

Mario, any thoughts?

josh

>
> I=E2=80=99d appreciate your guidance so I can align with the repository=
=E2=80=99s standards.
>
> Thanks,
> Kishore Batta
