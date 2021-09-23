Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F2EC433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Sep 2021 16:40:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CE6E96115A; Thu, 23 Sep 2021 16:40:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B5808610D1
	for <linux-firmware@kernel.org>; Thu, 23 Sep 2021 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632415238;
	bh=V1cWZb0nJ3xV2ilEt8lFy8OBkxvOxBktcmuhLF+tzbw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=nYq0OiFr0bPM7cNwAZ1ruB7BQVh+e6Z5ky/sbWrUHtqUVjAd/B301Vc0muwMdL9XK
	 2xswMHJhbG6bgrBQs8i72ar6bwBZ1GfwVKXfjSwsbz6Wie9SK6hknw0QTRurgftZ/V
	 ZwZ56dR+1hwEYjfESVq3lP+Yv5LrvFOrGTHfjeAmGcenFE6dgdGnft+e2R0pFBr4/K
	 UUqi0WKN06N2+BvgMXiqQoDN32l3qw72cwZ84Dd3eMrQKZVGLS0oGgFZvCXEaFICKj
	 PQmcNt+srxCfj3+4jiwJqBdjC4XFwpdwwPvv0PHEwnF/YRCOFFTItW6ztECdZK7zpC
	 WtVQKsY0oNpBA==
Received: by mail-io1-f51.google.com with SMTP id b78so3556553iof.2
        for <linux-firmware@kernel.org>; Thu, 23 Sep 2021 09:40:38 -0700 (PDT)
X-Gm-Message-State: AOAM532QZpNpyLZgzQy+zQAc11VjhIjARO2wnm+dyutoJtuKXbiSSddf
	4k+StvzUiveN6Q/KYie5L9ILwyjYWENiL5qW3kk=
X-Google-Smtp-Source: ABdhPJxRzDS0jvjRFMzDM1+kAhCWeYgZVzxurLt3Cy3a9zZM1KfMR5r+yzDhH7VQpK0CZFppda2hmo235rJFGSRI2X4=
X-Received: by 2002:a5d:9601:: with SMTP id w1mr4714503iol.209.1632415238195;
 Thu, 23 Sep 2021 09:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <c5ec6f413e4940c486505b2d511d091d@intel.com>
In-Reply-To: <c5ec6f413e4940c486505b2d511d091d@intel.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 23 Sep 2021 12:40:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5C4PqcFfLNxzEHBFchALTvsmLoKw+TFy4Fu4zVzXAt_w@mail.gmail.com>
Message-ID: <CA+5PVA5C4PqcFfLNxzEHBFchALTvsmLoKw+TFy4Fu4zVzXAt_w@mail.gmail.com>
Subject: Re: i915 Updates - ADLP DMC v2.12
To: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Kyle McMartin <kyle@mcmartin.ca>, 
	"ben@decadent.org.uk" <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 20, 2021 at 5:57 PM Srivatsa, Anusha
<anusha.srivatsa@intel.com> wrote:
>
> Hi josh, Ben, Kyle
>
> Kindly add the below i915 changes to linux-firmware:
>
> linux-firmware: add frimware for mediatek bluetooth chip (MT7922) (2021-09-13 11:35:49 -0400)
>
>
>
> are available in the Git repository at:
>
>
>
>   git://anongit.freedesktop.org/drm/drm-firmware adlp_dmc_2_12

Pulled and pushed out.

josh
