Return-Path: <SRS0=fDot=KO=chromium.org=briannorris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E13EC433B4
	for <linux-firmware@archiver.kernel.org>; Wed, 19 May 2021 18:23:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1E983611BF; Wed, 19 May 2021 18:23:59 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E271661001
	for <linux-firmware@kernel.org>; Wed, 19 May 2021 18:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E271661001
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=briannorris@chromium.org
Received: by mail-oi1-f179.google.com with SMTP id w127so10139798oig.12
        for <linux-firmware@kernel.org>; Wed, 19 May 2021 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sYOOje/Q2qRGd6n8BqEkhmcCtu27g3jFDHNzv1YTwQo=;
        b=H7OwLL/JKFtsNCseAfz+e1qYcH1xiTCmKnBrF7quhLNp4zmp3EpHTCnyt6XbeFiwXR
         O5/E6OZyevBpBi2/NvBP+/clg6hd7bN1T+j0iCV9Wb0o8fhNf58Hj+Y8sNlGrSP8UVn8
         PPva9CBchHVg3J7Q5ZZVrkn7IrYc3vJWVc9dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYOOje/Q2qRGd6n8BqEkhmcCtu27g3jFDHNzv1YTwQo=;
        b=PvpVJz/d+w3IqT750Ew723Csxoqs2jukLws4MbzHpPnYlLIrYk7lixb2THMDGsa1pK
         /ywD5LW7WK0CRa7OCVxAD8WW968JUOrYEzAF8wvb2mMQh+3cwJCzUxNLK0L/nt4jv029
         d2PiPjd1GnUTRwSCFDzYhvhM8bpCnDCVHzLoNDVinW6SDFEh8/v5D/x16YkoXE27Nw5E
         Kt4VdMCKJFLrP1lBkCulrdq3e0n3arJZ0J3KeDISJSDmh+fwH6/dNPHX/s2j8s5la4fb
         1bP3/L3actjWhk6ducTPU6SVoyWZZHrUlNJyaGVw9JwNLYTxMFco9w+Dy6MNuU/3dNmC
         Q6hQ==
X-Gm-Message-State: AOAM530prA+7q/5WXJvE0gt5x2BDB6eTw7zoda3E0n3kHwhdX+LGwMGF
	abQbYZWlJ4RPmq6LKYU6386gE3CyUZmO7Q==
X-Google-Smtp-Source: ABdhPJzAXNZerO5sVKS4SC4psIbcw2obnAc1+sY/IamA3m4zix+cU+ZBH2ghTNGQ63JU4P78djSgMQ==
X-Received: by 2002:aca:7501:: with SMTP id q1mr361248oic.9.1621448637907;
        Wed, 19 May 2021 11:23:57 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id x31sm107938ota.24.2021.05.19.11.23.56
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 11:23:56 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id j75so13936861oih.10
        for <linux-firmware@kernel.org>; Wed, 19 May 2021 11:23:56 -0700 (PDT)
X-Received: by 2002:aca:d68a:: with SMTP id n132mr457745oig.105.1621448635646;
 Wed, 19 May 2021 11:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR04MB45387F399B5963BD92C57CA3FC2B9@DB7PR04MB4538.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB45387F399B5963BD92C57CA3FC2B9@DB7PR04MB4538.eurprd04.prod.outlook.com>
From: Brian Norris <briannorris@chromium.org>
Date: Wed, 19 May 2021 11:23:44 -0700
X-Gmail-Original-Message-ID: <CA+ASDXM4u=98XmyAH9=iXQGT8mP-z3WKs9vN=Ms20xXmJyKnWw@mail.gmail.com>
Message-ID: <CA+ASDXM4u=98XmyAH9=iXQGT8mP-z3WKs9vN=Ms20xXmJyKnWw@mail.gmail.com>
Subject: Re: pull-request mwifiex-firmware 2021-05-19
To: Sharvari Harisangam <sharvari.harisangam@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Cathy Luo <xiaohua.luo@nxp.com>, 
	Rakesh Parmar <rakesh.parmar@nxp.com>, Mayur Arakere <mayur.arakere@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 19, 2021 at 7:45 AM Sharvari Harisangam
<sharvari.harisangam@nxp.com> wrote:
>
> The following changes since commit 2a0a062e79b5fe9007e57c0fcd285e683e22373e:
>
>   linux-firmware: update NXP SDSD-8997 firmware image (2020-08-03 06:51:36 +0530)
>
> are available in the git repository at:
>
>   https://github.com/NXP/mwifiex-firmware.git
>
> for you to fetch changes up to db190ade4569c542cd257a9334f8f8956372f7b3:
>
>   linux-firmware: update NXP PCIE-USB-8997 firmware image (2021-05-19 12:57:21 -0700)
>
> ----------------------------------------------------------------
> Sharvari Harisangam (1):
>       linux-firmware: update NXP PCIE-USB-8997 firmware image
>
>  WHENCE                       |   2 ++
>  nxp/pcieusb8997_combo_v4.bin | Bin 0 -> 638992 bytes
>  2 files changed, 2 insertions(+)
>  create mode 100644 nxp/pcieusb8997_combo_v4.bin

I appreciate that NXP now owns what was formerly known as Marvell
WiFi, but the driver still only recognizes "mrvl/" naming, not "nxp/".
Did you actually test that this does anything useful? Or are you
planning on submitting driver patches to use the new path? That seems
like unnecessary churn to me, and you should just use the old path.

Brian
