Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36331C433ED
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 13:58:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F3F2B61279; Mon, 19 Apr 2021 13:58:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE52761006
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 13:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618840683;
	bh=5TOHxfqm2ijWU7hgxGlOHyq5Oju76X+fikLS7yoIgsg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=VQaa/mCSCQ4mMkI3YlmSz9R4TpdUL5EU4aaB7c/H0Xm0QQmPOqWNLSfkP5tTr/KXd
	 bPRzYp1Ul0RJUSBTST5rWI/MlEjCp5HXy+N3xJCIqF2apXvLL4X7ym4wq5oYgkkmVF
	 RHQxOWuFjITfw8IdJxOYgSd1hYd/XTztkR+aAHkgnZux6B/DPhiU+vCVvIcgXYimhP
	 SZQy1ZG4bWRPNGwMrOwIXZXEfgYniwUD7OYHPgWTgHC3JHtKrcmk7/zs8TkKJUVgeJ
	 0+RBoqYhTDvVRRX5MqTTiUIERYyDS/fES/ihUxBhHKJk0LA7z8rqp0bH3/TmNHQkr/
	 Rr1NtEv6lctSQ==
Received: by mail-io1-f54.google.com with SMTP id b9so5189535iod.13
        for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 06:58:03 -0700 (PDT)
X-Gm-Message-State: AOAM530woVUxc0s7KC9xj4pzEB1lVH5MJqAuOWDM0ekmnrZPCd3x7FXR
	flJLFlEOSX0AyOVsU3VfShGLumVVkWGa3YbAxhM=
X-Google-Smtp-Source: ABdhPJxusTdOy1DZxImLOlfSTb44W7WHXHDtgoYpGrvCpFi7mK9lBnM3d1b1ukhi4sNNKuHht1nxubH9DBwXKIO9o+4=
X-Received: by 2002:a02:cc:: with SMTP id 195mr17106395jaa.73.1618840683167;
 Mon, 19 Apr 2021 06:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <MW3PR12MB44753AF63DA77A737AE8781ABC739@MW3PR12MB4475.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB44753AF63DA77A737AE8781ABC739@MW3PR12MB4475.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 19 Apr 2021 09:57:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5bqGJoJw3njfWfOjHvzDzU2KDz5cHJ4QCexxKe1e8=8A@mail.gmail.com>
Message-ID: <CA+5PVA5bqGJoJw3njfWfOjHvzDzU2KDz5cHJ4QCexxKe1e8=8A@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.25.4.0
To: Raju Rangoju <rajur@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ramaraju Yelavarthy <ramaraju@chelsio.com>, 
	Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

This fails check_whence

[jwboyer@vader linux-firmware]$ ./check_whence.py
E: cxgb4/t4fw-1.24.17.0.bin listed in WHENCE does not exist
E: cxgb4/t5fw-1.24.17.0.bin listed in WHENCE does not exist
E: cxgb4/t6fw-1.24.17.0.bin listed in WHENCE does not exist
E: cxgb4/t4fw-1.25.4.0.bin not listed in WHENCE
E: cxgb4/t5fw-1.25.4.0.bin not listed in WHENCE
E: cxgb4/t6fw-1.25.4.0.bin not listed in WHENCE

You changed the links in the commits, but didn't adjust the actual
File entries.  Can you clean that up please?

josh

On Fri, Apr 9, 2021 at 5:45 PM Raju Rangoju <rajur@chelsio.com> wrote:
>
> Hi,
>
> Can you please pull the new firmware from the following URL?
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> The following changes since commit af1ca28f03287b0c60682ab37cc684c773de853f:
>
>   amdgpu: add arcturus firmware (2021-04-05 10:40:08 -0400)
>
> are available in the git repository at:
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 7daedba9b02bfbb47da89c4dae6f20c91a5e5402:
>
>   cxgb4: Update firmware to revision 1.25.4.0 (2021-04-09 07:45:27 -0700)
>
> ----------------------------------------------------------------
> Raju Rangoju (1):
>       cxgb4: Update firmware to revision 1.25.4.0
>
>  WHENCE                              |   6 +++---
>  cxgb4/configs/t6-config-default.txt |   8 ++++++--
>  cxgb4/t4fw-1.24.17.0.bin            | Bin 568832 -> 0 bytes
>  cxgb4/t4fw-1.25.4.0.bin             | Bin 0 -> 569856 bytes
>  cxgb4/t5fw-1.24.17.0.bin            | Bin 672768 -> 0 bytes
>  cxgb4/t5fw-1.25.4.0.bin             | Bin 0 -> 675328 bytes
>  cxgb4/t6fw-1.24.17.0.bin            | Bin 727040 -> 0 bytes
>  cxgb4/t6fw-1.25.4.0.bin             | Bin 0 -> 728064 bytes
>  8 files changed, 9 insertions(+), 5 deletions(-)
>  delete mode 100644 cxgb4/t4fw-1.24.17.0.bin
>  create mode 100644 cxgb4/t4fw-1.25.4.0.bin
>  delete mode 100644 cxgb4/t5fw-1.24.17.0.bin
>  create mode 100644 cxgb4/t5fw-1.25.4.0.bin
>  delete mode 100644 cxgb4/t6fw-1.24.17.0.bin
>  create mode 100644 cxgb4/t6fw-1.25.4.0.bin
