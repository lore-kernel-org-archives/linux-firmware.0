Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C533C54FCC
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Apr 2020 22:31:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8CD2620857; Mon, 20 Apr 2020 22:31:38 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6AF9920724
	for <linux-firmware@kernel.org>; Mon, 20 Apr 2020 22:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587421898;
	bh=M8RvRruvtCug/WPMI1QhzHkJ6wAv20QfmGLlxlyYsXE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Qeq8L6w7xOFyrJfzdmMzDKswBq4ltGgIO1bDEWHMMjm85dUUl2+QXI1p+DD5eP6ys
	 O5/mjT8LpNJFCwx3+Sk7peYw9gwrY+0L0U59sjt/1W9UIYPrE185rd6GEVcutBhhns
	 Ze3mSeY3HNvVzT93pWLyNfsU2HsyF7sinluntAYQ=
Received: by mail-io1-f49.google.com with SMTP id p10so3416150ioh.7
        for <linux-firmware@kernel.org>; Mon, 20 Apr 2020 15:31:38 -0700 (PDT)
X-Gm-Message-State: AGi0PubDFWjySDcSylF6+jWGTRmmMexb6WimvSHyWiRGiriWX5cCPCQs
	On8HizkoK9jLicHK+C4m5dHeb75HRYg2khOSXds=
X-Google-Smtp-Source: APiQypJ4WACHKbmwwZxOZyQfZZe2TgLWszxfLHQLMKI4BckGio/blZnxLD5rOKm+OoOx+FbxzN3dFvb6U+yHilX4YMA=
X-Received: by 2002:a02:5184:: with SMTP id s126mr16990773jaa.81.1587421897811;
 Mon, 20 Apr 2020 15:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200417162022.428430-1-hdegoede@redhat.com>
In-Reply-To: <20200417162022.428430-1-hdegoede@redhat.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 20 Apr 2020 18:31:27 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5dD7LWLfh4HaQnzZOLKi-eWJjX9qBJmEsKqRhJ2HD-UQ@mail.gmail.com>
Message-ID: <CA+5PVA5dD7LWLfh4HaQnzZOLKi-eWJjX9qBJmEsKqRhJ2HD-UQ@mail.gmail.com>
Subject: Re: [PATCH] Add symlink for Dell XPS 15 9550 Broadcom Bluetooth
 patch-ram file
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 17, 2020 at 12:20 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The linux-firmware repo does not contain many Broadcom (now Cypress)
> Bluetooth patch-ram files, because we have never been able to get
> permission to re-distribute those.
>
> We do have one file for the for HTC Vive, which was submitted by HTC
> themselves with permission from Cypress.
>
> That file contain a "BCM20703A1 Generic USB 20Mhz fcbga_BU" patch-ram
> build. The patch-ram files used by Windows for the Bluetooth module
> in the XPS 15 9550, USB-id 0a5c:6410 is also a "BCM20703A1 Generic
> USB 20Mhz fcbga_BU" patch-ram build. Since the build-parameters
> (crystal MHz, package/module type used) between the 2 builds are an
> exact match we can also use the HTC submitted patch-ram for the
> XPS 15 9550. So lets add a symlink for this.
>
> This will make the Bluetooth on the XPS 15 9550 work out of the box,
> when linux-firmware is installed, without the user needing to go and
> find a suitable patch-ram file themselves.
>
> This has been tested on a XPS 15 9550 with both Bluetooth HID and
> Bluetooth audio devices.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  WHENCE                 | 1 +
>  brcm/BCM-0a5c-6410.hcd | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 120000 brcm/BCM-0a5c-6410.hcd

It should be possible to do this by simply using the Link directive in
the WHENCE file.  That will create the symlink at installation time.
It's a fairly recent enhancement.  I'll look at it tomorrow and adjust
if so.

josh
