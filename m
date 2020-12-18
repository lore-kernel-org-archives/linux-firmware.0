Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C84FC4361B
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Dec 2020 19:06:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 44EFA23B87; Fri, 18 Dec 2020 19:06:35 +0000 (UTC)
X-Gm-Message-State: AOAM530GNtMPkcI8hou0Vi3MpUUlPgE/P8r90zN45O/bVB1nYPcp+e3r
	tVdV+84kzjj8xjM8rFGq6n4reV65aTxsMnN1EAw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608318395;
	bh=XqqUPWojYmVPa7mNvfdt2K6nsdL8qf0Nn64FWqOiRfg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=K8LTNF5EAIrDyyXbJeLPbpVxfZPtM1t9yg9CmbfDklpEk9fQA+2rcQjBGXyOKXWNs
	 KnG6JEoXiT1DkDaBaIix0tcxqVtbnprR9VZDmQypUz/KB98LQIGKbiV5siz0ebror9
	 GvUM9JXZLrFckVytdmYbqvoxrhwILRjNreh2HS/00aYqe0Ob1Sl2tlelW36e0KKGq4
	 KAoPvNRSyiy3RsWLymEdiyQhg9Lccl03FCLahdSAi3HhVsEdua40DOlrj4suZ1qRv3
	 IIrRTkrleDKt9AzW6gUmWryJtTDSgVyEXwxbJp12eePcIaY+orThiOWXygB0Vjml7y
	 nQ/jrt8UnY6BA==
X-Google-Smtp-Source: ABdhPJz3HweeVkhoNpDXXFqFCDgm+Kc4nRywUlwowz8nue7LdkTL2NF8tT9eRO6IkY6jUhdwzE1scnHXL/1l4urtg5I=
X-Received: by 2002:a05:6638:83:: with SMTP id v3mr5077068jao.106.1608318394559;
 Fri, 18 Dec 2020 11:06:34 -0800 (PST)
MIME-Version: 1.0
References: <X9LBUn5KIKVKQGlI@eriador.lumag.spb.ru>
In-Reply-To: <X9LBUn5KIKVKQGlI@eriador.lumag.spb.ru>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 18 Dec 2020 14:06:23 -0500
X-Gmail-Original-Message-ID: <CA+5PVA58UnGhdurXuQq8=46yr=OvyMfqhRvjbzjBe7KPfRK_TA@mail.gmail.com>
Message-ID: <CA+5PVA58UnGhdurXuQq8=46yr=OvyMfqhRvjbzjBe7KPfRK_TA@mail.gmail.com>
Subject: Re: linux-firmware: add firmware for Lontium lt9611uxc DSI to HDMI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Pulled and pushed out.

josh

On Thu, Dec 10, 2020 at 7:46 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hello linux-firmware maintainers,
>
> The following changes since commit 7455a36066741a6e52fba65e04f6451b4cdfd9c4:
>
>   Merge branch 'guc_v49' of git://anongit.freedesktop.org/drm/drm-firmware into main (2020-11-30 09:26:11 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware lt9611uxc
>
> for you to fetch changes up to 63ab3db8399a504048716eb3feed2867da58876a:
>
>   linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge (2020-12-11 03:27:38 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (1):
>       linux-firmware: add firmware for Lontium LT9611UXC DSI to HDMI bridge
>
>  LICENSE.Lontium  |   2 ++
>  WHENCE           |   8 ++++++++
>  lt9611uxc_fw.bin | Bin 0 -> 17932 bytes
>  3 files changed, 10 insertions(+)
>  create mode 100644 LICENSE.Lontium
>  create mode 100644 lt9611uxc_fw.bin
