Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783B4C54FC9
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Apr 2020 11:47:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6683220753; Tue, 21 Apr 2020 11:47:50 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 459B320722
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2020 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587469670;
	bh=FZhkQIoBspWB4zZhjVIieLX31xUGV75HcS5dyJEqqPk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=zhOmOdqW9vdqYKnlHhftiQZfpvHV4VKDxwDtL9/DMQZbfafRU3GjehxnOg5Kud/gY
	 AaYYuWR8knAYrqgXVAPwiJTAyi/uHP/nZGZUQIm85t5PcNQQ8g/7LJ6+BJPZNHm3LQ
	 hGKRpgd5EDV4XWk1Haba+L4P6/jwLjJdr5KgprCk=
Received: by mail-io1-f44.google.com with SMTP id k6so43584iob.3
        for <linux-firmware@kernel.org>; Tue, 21 Apr 2020 04:47:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuYtFjXA1SrLkUuK6TmlGXMFAlkoNVI0UEw/t90H09jdn5We2J8t
	wOrMM7uPm9snlK0uzEdvFBi7d8VBsU4MjY951jw=
X-Google-Smtp-Source: APiQypKcvHsAcYWCnYybnHQm+riyaNVKmeyRoIjHXEKGh10y9Fnvve01ob1Ul2tw7XvAYN4w1Z4CGZXhHOa8w5Lksa0=
X-Received: by 2002:a02:cc19:: with SMTP id n25mr19447072jap.107.1587469669696;
 Tue, 21 Apr 2020 04:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200417162022.428430-1-hdegoede@redhat.com> <CA+5PVA5dD7LWLfh4HaQnzZOLKi-eWJjX9qBJmEsKqRhJ2HD-UQ@mail.gmail.com>
 <df06edbf-003b-bb1c-ac8e-d46a3c5ed2da@redhat.com>
In-Reply-To: <df06edbf-003b-bb1c-ac8e-d46a3c5ed2da@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 21 Apr 2020 07:47:38 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6p5Dah4YcA-1q7WYD35JVz-Xs1Q6-k_29XMOHCvvvm9w@mail.gmail.com>
Message-ID: <CA+5PVA6p5Dah4YcA-1q7WYD35JVz-Xs1Q6-k_29XMOHCvvvm9w@mail.gmail.com>
Subject: Re: [PATCH] Add symlink for Dell XPS 15 9550 Broadcom Bluetooth
 patch-ram file
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 21, 2020 at 3:46 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/21/20 12:31 AM, Josh Boyer wrote:
> > On Fri, Apr 17, 2020 at 12:20 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> The linux-firmware repo does not contain many Broadcom (now Cypress)
> >> Bluetooth patch-ram files, because we have never been able to get
> >> permission to re-distribute those.
> >>
> >> We do have one file for the for HTC Vive, which was submitted by HTC
> >> themselves with permission from Cypress.
> >>
> >> That file contain a "BCM20703A1 Generic USB 20Mhz fcbga_BU" patch-ram
> >> build. The patch-ram files used by Windows for the Bluetooth module
> >> in the XPS 15 9550, USB-id 0a5c:6410 is also a "BCM20703A1 Generic
> >> USB 20Mhz fcbga_BU" patch-ram build. Since the build-parameters
> >> (crystal MHz, package/module type used) between the 2 builds are an
> >> exact match we can also use the HTC submitted patch-ram for the
> >> XPS 15 9550. So lets add a symlink for this.
> >>
> >> This will make the Bluetooth on the XPS 15 9550 work out of the box,
> >> when linux-firmware is installed, without the user needing to go and
> >> find a suitable patch-ram file themselves.
> >>
> >> This has been tested on a XPS 15 9550 with both Bluetooth HID and
> >> Bluetooth audio devices.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   WHENCE                 | 1 +
> >>   brcm/BCM-0a5c-6410.hcd | 1 +
> >>   2 files changed, 2 insertions(+)
> >>   create mode 120000 brcm/BCM-0a5c-6410.hcd
> >
> > It should be possible to do this by simply using the Link directive in
> > the WHENCE file.  That will create the symlink at installation time.
> > It's a fairly recent enhancement.  I'll look at it tomorrow and adjust
> > if so.
>
> Nice, that would indeed be an improvement as in the past make install
> turned the symlinks into file copies IIRC.
>
> Perhaps you can also convert the brcm/brcmfmac43362-sdio.lemaker,bananapro.txt
> symlink to use this new method?

Both done and pushed out.

josh
