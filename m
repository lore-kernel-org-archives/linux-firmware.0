Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073A5C636CD
	for <linux-firmware@archiver.kernel.org>; Fri, 16 Jul 2021 11:48:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DAFA5613FD; Fri, 16 Jul 2021 11:48:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4708613FB
	for <linux-firmware@kernel.org>; Fri, 16 Jul 2021 11:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626436114;
	bh=GGGC9Fvgk/gTl3Rhlt02Aim+WaxDFg0a3DDBSh92AwI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=MGJ3ULOVecjT679K2Xswnxw3De8W/ZkTOoGgAC7400VwsnnVtwxndnXw/bhRP8ZWI
	 eI2uXZuQnUSVJOgWJQTsUEWiUohshIeibJorGmkTFdLLUXtI5Y5xIj5n6WUbDbyxb4
	 sRoMafyO+wWubQRDUXej/IOA9QYrTpC/XNbHQQOCEjZ5otlxhn1ppQ1YB/NFDnRhRV
	 PykragQw/cGeXFmRxCAEnZXUBHk3VtmsT+myqEPjTvhyjxpcvR4PLniwcYhekdL9cH
	 Md1eZbfEWahK0QoC5p/HTcdhxXV31XgQrQ4zSZUu8jxnt9uG1tP8wRWlIZnuW46ktE
	 1U7nhA2Wir/QA==
Received: by mail-il1-f176.google.com with SMTP id b6so7979529iln.12
        for <linux-firmware@kernel.org>; Fri, 16 Jul 2021 04:48:34 -0700 (PDT)
X-Gm-Message-State: AOAM532qJvpfLoyBQESdLGdlrcxJKhOi7LPsY0rt0DQXoiG1aJ5pYwgK
	cnsZN5TjVE20OMilzPqpU6kDQUieTaBRw4cshyM=
X-Google-Smtp-Source: ABdhPJydRJJE3RK1J7r60My+DC+BlgGRtN5kfOP5IvfE8kzDN7svBv7U1oondY1CCCNn5rMRtuYEQEfn4lRFPJWp9Yo=
X-Received: by 2002:a92:507:: with SMTP id q7mr1995482ile.81.1626436114310;
 Fri, 16 Jul 2021 04:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <BN9PR12MB5321B78120F39E6FE2D46798BC189@BN9PR12MB5321.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB5321B78120F39E6FE2D46798BC189@BN9PR12MB5321.namprd12.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 16 Jul 2021 07:48:23 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7H0gyNgzHbUE7JoPTdevmTFSYvHuEcVFgaft8v_7WTtw@mail.gmail.com>
Message-ID: <CA+5PVA7H0gyNgzHbUE7JoPTdevmTFSYvHuEcVFgaft8v_7WTtw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.26.0.0
To: Raju Rangoju <rajur@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ramaraju Yelavarthy <ramaraju@chelsio.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 7:05 AM Raju Rangoju <rajur@chelsio.com> wrote:
>
> Hi,
>
> Can you please pull the new firmware from the following URL?
>
> git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> Thanks,
> Raju
>
> ------
> The following changes since commit d79c26779d459063b8052b7fe0a48bce4e08d0d9:
>
>   amdgpu: update vcn firmware for green sardine for 21.20 (2021-06-29 07:26:03 -0400)
>
> are available in the git repository at:
>
>   git://git.chelsio.net/pub/git/linux-firmware.git for-upstream
>
> for you to fetch changes up to 99cd4f9425cb0ecba3e46f0ccae70f760ceb0e27:
>
>   cxgb4: Update firmware to revision 1.26.0.0 (2021-07-09 03:55:45 -0700)
>
> ----------------------------------------------------------------
> Raju Rangoju (1):
>       cxgb4: Update firmware to revision 1.26.0.0
>
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.25.6.0.bin => t4fw-1.26.0.0.bin} | Bin 570368 -> 570368 bytes
>  cxgb4/{t5fw-1.25.6.0.bin => t5fw-1.26.0.0.bin} | Bin 675840 -> 675840 bytes
>  cxgb4/{t6fw-1.25.6.0.bin => t6fw-1.26.0.0.bin} | Bin 730112 -> 729088 bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.25.6.0.bin => t4fw-1.26.0.0.bin} (77%)
>  rename cxgb4/{t5fw-1.25.6.0.bin => t5fw-1.26.0.0.bin} (72%)
>  rename cxgb4/{t6fw-1.25.6.0.bin => t6fw-1.26.0.0.bin} (61%)
> -----

Pulled and pushed out.

josh
