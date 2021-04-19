Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42093C433ED
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 15:35:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1969861246; Mon, 19 Apr 2021 15:35:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 024C7611CE
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 15:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618846500;
	bh=NNcGtkbr72F5VMgjDx01i7fWfeefa4IYnqgHgmffnbo=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=alzfokSq+N4do0PRboIgTTP95Zq9TLqV7oBKHV4Hj3V0p8NdFhOjGaVVJHcwJ+Xmp
	 T8LpTjEqgOizgAvhs5XRndAirOZccA01Dk7QAEQvFWy3/DUM/hK8/0XTd9Ulz5swpO
	 V2MqrtH4bDlne8uqLBYm3TuCSCb9ntz/rYRjfaRwwyeEKFvFdnLht3pIz75A7VGbAd
	 HSpUkCid9gNQqXzj3keggPKc59dHpJkJhkg7l1CIQsIbrBsC/hmkOA2jxrRdnvV/KF
	 6RL2vPofoWFsW5+JzC48/mNIWZmBYX4LaMtIi8eqwtzbLmQfqIgSQYtVvYqDwAujEx
	 RCyt3aPlDy6Qg==
Received: by mail-io1-f43.google.com with SMTP id s16so30023733iog.9
        for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 08:34:59 -0700 (PDT)
X-Gm-Message-State: AOAM530kC0eItn+WfTm9Rb30L/jHjSSy8+Xv1KJQ4pnzNT2+SeKn2QLz
	R6Aj3wV7o3lait9JqXJMOsjA+pbbDPl71wijV/4=
X-Google-Smtp-Source: ABdhPJw1oaeb75acCFeej4TQcZhB1c+4BwKLJoZZkrxIruGG9ExhvysHIVNkYbt5ej5x1ff+y5sOQX78pDGlP5uFJQA=
X-Received: by 2002:a05:6638:218b:: with SMTP id s11mr16998527jaj.81.1618846499436;
 Mon, 19 Apr 2021 08:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <MW3PR12MB447503341F6A5ABA178CD2CBBC499@MW3PR12MB4475.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB447503341F6A5ABA178CD2CBBC499@MW3PR12MB4475.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Apr 2021 11:34:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4WQEMcxtfKGxdwy4U7N_TM8mMvsVvVJ4tZFOywDDDzrQ@mail.gmail.com>
Message-ID: <CA+5PVA4WQEMcxtfKGxdwy4U7N_TM8mMvsVvVJ4tZFOywDDDzrQ@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.25.4.0
To: Raju Rangoju <rajur@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ramaraju Yelavarthy <ramaraju@chelsio.com>, 
	Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

Thanks.  Pulled and pushed out.

josh

On Mon, Apr 19, 2021 at 11:25 AM Raju Rangoju <rajur@chelsio.com> wrote:
>
> Hi Josh,
>
> I've adjusted the actual file entries now. Can you please pull the new firmware from the following URL?
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Raju
>
> The following changes since commit f66adc3cde7ee0607ea9198ca460031d3564fb33:
>
>   Merge branch 'main' of gitolite.kernel.org:/pub/scm/linux/kernel/git/maks/linux-firmware into main (2021-04-19 10:07:57 -0400)
>
> are available in the git repository at:
>
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 940b7f42d45de247eb9a2c4874985a400cb936c4:
>
>   cxgb4: Update firmware to revision 1.25.4.0 (2021-04-19 07:44:20 -0700)
>
> ----------------------------------------------------------------
> Raju Rangoju (1):
>       cxgb4: Update firmware to revision 1.25.4.0
>
>  WHENCE                              |  12 ++++++------
>  cxgb4/configs/t6-config-default.txt |   8 ++++++--
>  cxgb4/t4fw-1.24.17.0.bin            | Bin 568832 -> 0 bytes
>  cxgb4/t4fw-1.25.4.0.bin             | Bin 0 -> 569856 bytes
>  cxgb4/t5fw-1.24.17.0.bin            | Bin 672768 -> 0 bytes
>  cxgb4/t5fw-1.25.4.0.bin             | Bin 0 -> 675328 bytes
>  cxgb4/t6fw-1.24.17.0.bin            | Bin 727040 -> 0 bytes
>  cxgb4/t6fw-1.25.4.0.bin             | Bin 0 -> 728064 bytes
>  8 files changed, 12 insertions(+), 8 deletions(-)
>  delete mode 100644 cxgb4/t4fw-1.24.17.0.bin
>  create mode 100644 cxgb4/t4fw-1.25.4.0.bin
>  delete mode 100644 cxgb4/t5fw-1.24.17.0.bin
>  create mode 100644 cxgb4/t5fw-1.25.4.0.bin
>  delete mode 100644 cxgb4/t6fw-1.24.17.0.bin
>  create mode 100644 cxgb4/t6fw-1.25.4.0.bin
