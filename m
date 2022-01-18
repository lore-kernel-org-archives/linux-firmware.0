Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BABC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jan 2022 14:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7067C340E5; Tue, 18 Jan 2022 14:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17BEC340E0
	for <linux-firmware@kernel.org>; Tue, 18 Jan 2022 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642517263;
	bh=ToOLT+Ehn6KIhwi5e5kxOIMJ/hmH4QG/xfytPkjlFW0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VECzrUefee0ReF0cYXhilt6uvul35WBcq7wCUJn2xWjQbnS4GffUB1EzpcTpcnRlu
	 CAcMVaYXlDL/Jpq3l33r4zvmTtx1PnzIcqJgXtWW/CSHOI+fJFxC+HmYo+ZKSVJpO1
	 kOmcNBahJKY8of6pSgCPyfJ22YORpK0iR14hYiWEGXp3XHn0S2KmyrI9AVWeXneP21
	 Og+lAGJP98reA962nww3pagAlyb4QmvNjRJrGkt5EQNIcHCH5Zlz+nH5OMw8u7gF24
	 Xoe97iMGw3ya7UktPXS2H2DvakuqynIfX7ceo6j1ymYCPnYGnx1pdH4NAYdHrury9j
	 i1mDfyuophg3A==
Received: by mail-il1-f176.google.com with SMTP id r15so790259ilj.7
        for <linux-firmware@kernel.org>; Tue, 18 Jan 2022 06:47:43 -0800 (PST)
X-Gm-Message-State: AOAM530nAiwyJ9QOs/YtjhIiM1KoMIsFjFzGfao7xjUJiCurIVqRiyE/
	6zT5cwPstxsTdVhWECQ2qXVqYscyuuMjNY3S1nI=
X-Google-Smtp-Source: ABdhPJy2NZU79twaYJQlA3OSH1muClvqyzFK+qVZMbJIFEDVYFKR0EimauQVsGhLSLMjISbvWo2a0t8gmS4hK7wISmQ=
X-Received: by 2002:a92:c9c8:: with SMTP id k8mr6098170ilq.2.1642517262928;
 Tue, 18 Jan 2022 06:47:42 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR18MB4621CAC90B0C17D14D787F5DC8529@PH0PR18MB4621.namprd18.prod.outlook.com>
 <PH0PR18MB4621BFAAEB1686B3400D885AC8529@PH0PR18MB4621.namprd18.prod.outlook.com>
In-Reply-To: <PH0PR18MB4621BFAAEB1686B3400D885AC8529@PH0PR18MB4621.namprd18.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Jan 2022 09:47:32 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4w9V8iAbo1PEofLCofK=EYSo_sKZ-mogjZX0Xve8+WbA@mail.gmail.com>
Message-ID: <CA+5PVA4w9V8iAbo1PEofLCofK=EYSo_sKZ-mogjZX0Xve8+WbA@mail.gmail.com>
Subject: Re: pull request: add Marvell CPT ucode binaries
To: Dhanalakshmi Saravanan <rdhana@marvell.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, David Woodhouse <dwmw2@infradead.org>, 
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Shijith Thotton <sthotton@marvell.com>, 
	Karnam Raveendra <kraveendra@marvell.com>, Jerin Jacob Kollanukkaran <jerinj@marvell.com>, 
	Sunil Kovvuri Goutham <sgoutham@marvell.com>, Raj Murtinty <rmurtinty@marvell.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Wed, Jan 12, 2022 at 6:59 AM Dhanalakshmi Saravanan
<rdhana@marvell.com> wrote:
>
> Hi,
>
> This contains new CPT ucode binaries.
>
> Please pull or let me know if there are any issues.
>
> Thanks,
> Dhana
>
> The following changes since commit 13dca280f76009ba2c5f25408543a1aaaa062c25:
>
>   linux-firmware: update firmware for MT7915 (2022-01-11 06:53:15 -0500)
>
> are available in the Git repository at:
>
>   git@github.com:Dhana-Saravanan/linux-firmware.git cpt-ucode-mrvl
>
> for you to fetch changes up to fbbf73f539233b93f57782d07d91815be91d01e8:
>
>   linux-firmware: add marvell CPT firmware images (2022-01-12 16:53:31 +0530)
>
> ----------------------------------------------------------------
> DhanaSaravanan (1):
>       linux-firmware: add marvell CPT firmware images
>
>  WHENCE            |  20 ++++++++++++++++++++
>  mrvl/cpt01/ae.out | Bin 0 -> 9376 bytes
>  mrvl/cpt01/ie.out | Bin 0 -> 51312 bytes
>  mrvl/cpt01/se.out | Bin 0 -> 55600 bytes
>  mrvl/cpt02/ae.out | Bin 0 -> 16192 bytes
>  mrvl/cpt02/ie.out | Bin 0 -> 52896 bytes
>  mrvl/cpt02/se.out | Bin 0 -> 58080 bytes
>  mrvl/cpt03/ae.out | Bin 0 -> 10560 bytes
>  mrvl/cpt03/ie.out | Bin 0 -> 52560 bytes
>  mrvl/cpt03/se.out | Bin 0 -> 56784 bytes
>  mrvl/cpt04/ae.out | Bin 0 -> 10592 bytes
>  mrvl/cpt04/ie.out | Bin 0 -> 29872 bytes
>  mrvl/cpt04/se.out | Bin 0 -> 34768 bytes
>  13 files changed, 20 insertions(+)
>  create mode 100644 mrvl/cpt01/ae.out
>  create mode 100644 mrvl/cpt01/ie.out
>  create mode 100644 mrvl/cpt01/se.out
>  create mode 100644 mrvl/cpt02/ae.out
>  create mode 100644 mrvl/cpt02/ie.out
>  create mode 100644 mrvl/cpt02/se.out
>  create mode 100644 mrvl/cpt03/ae.out
>  create mode 100644 mrvl/cpt03/ie.out
>  create mode 100644 mrvl/cpt03/se.out
>  create mode 100644 mrvl/cpt04/ae.out
>  create mode 100644 mrvl/cpt04/ie.out
>  create mode 100644 mrvl/cpt04/se.out
