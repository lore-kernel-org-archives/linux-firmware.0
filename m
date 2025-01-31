Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E643BC02190
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Jan 2025 16:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 994E1C4CEE4; Fri, 31 Jan 2025 16:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8148DC4CEDF
	for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738341346;
	bh=DDCT+y8xfHkJj+d88x1B0ECUWsdAD116jJjS7+Ja2uM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Lw5X+xerOvKmzYeQRyHvp/LN+O/wcuiHpeu64PjzSkUtap53kkrT6xRI1UDfVr3n7
	 cuC61Lj/booBZstQVPDrg+P2257ZKjr5CFD9UGQ8g4rLhCkT/Bi1rUJSxQH84SuJO6
	 WYoX8M7Q3zIgwYqUf6WBTkJX+DULsObKWnCsyO6wbswyjphj+m/muDyWcIvxOor2VN
	 XWQnQKrb3Rr4yzm57GX+/gqr2jdiqj0EzwSuEJgepjzphHJnZ9yxhHtP1STFDC0lmT
	 zmSbg9vBTn0AzXtBcgRvVvlrahs0wBbJfhn7EIvMdjplpSVCeWp+DMGKkw67AxlaZj
	 mpVT0XoOZSHRg==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e58a90c6059so4103769276.1
        for <linux-firmware@kernel.org>; Fri, 31 Jan 2025 08:35:46 -0800 (PST)
X-Gm-Message-State: AOJu0Yz4AiQLow3Cz64+TOd26J7oJI2SHXeSL2gvy7f4UJ1uWbOArN4y
	pGeJsY41yn5/QCsbKMKWDwKi55c5GhwaZ7rKLDUA2KDqj3+zrwtdqCw7gUcl8Cr+ZI4U0lD73T/
	I/sCytDDJ2sQLvn73fHvgAzYxL6c=
X-Google-Smtp-Source: AGHT+IE5xIhHk8h9n9ZUY5uQTRL8HsX5Yn2MkN157o4C1v6gROKWTgcNVRdH3m84cjp3Uy+E59Ul0e/kw9xBJ6HxL1g=
X-Received: by 2002:a25:dcd1:0:b0:e58:16b0:3798 with SMTP id
 3f1490d57ef6-e5ac89567ccmr5118315276.24.1738341345672; Fri, 31 Jan 2025
 08:35:45 -0800 (PST)
MIME-Version: 1.0
References: <19b2224b-ff94-419e-9af6-a9f16cf2803f@quicinc.com>
In-Reply-To: <19b2224b-ff94-419e-9af6-a9f16cf2803f@quicinc.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 31 Jan 2025 11:35:34 -0500
X-Gmail-Original-Message-ID: <CA+5PVA59hdw=G++RGdsc3f_oG+RoQ7N+4BMw2cz0jM2YP+tNKg@mail.gmail.com>
X-Gm-Features: AWEUYZk0p9H0EXP6qYBlwZXkYHt_9cAAPuSVVbzrz5qXf1Pm3lMO-SxGjnP1Yfs
Message-ID: <CA+5PVA59hdw=G++RGdsc3f_oG+RoQ7N+4BMw2cz0jM2YP+tNKg@mail.gmail.com>
Subject: Re: qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, Vivek Sahu <quic_vivesahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 6:06=E2=80=AFAM Janaki Ramaiah Thota
<quic_janathot@quicinc.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for bluetooth firmware. Please let me know if you
> have any problems.
>
> The following changes since commit 97cf368b19e641f25f35d0603869305cf17497=
dd:
>
>    qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069
> (2025-01-31 16:14:42 +0530)
>
>    Merge branch 'parallel' into 'main'
>
> are available in the Git repository at:
>
>    https://github.com/quicjathot/bt_msl_fw_1.1.3_00069.git HEAD

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/431

josh

>
> for you to fetch changes up to 7db7f79e5fe92e3fbb6ca29e9dc02fc3ddc61efc:
>
>    qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069
> (2025-01-31 16:14:42 +0530)
>
> ----------------------------------------------------------------
>
> Janaki Ramaiah Thota (1):
>
> qca: Update Bluetooth WCN6750 1.1.0-00476 firmware to 1.1.3-00069
>
> Thanks,
> Janakiram
