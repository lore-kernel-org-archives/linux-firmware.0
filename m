Return-Path: <SRS0=8m58=IV=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B42C433DB
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Mar 2021 08:17:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30938619BB; Tue, 23 Mar 2021 08:17:27 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id CCD6B619BA
	for <linux-firmware@kernel.org>; Tue, 23 Mar 2021 08:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD6B619BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id BFEB2E7746;
	Tue, 23 Mar 2021 09:17:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKZSey7CFyum; Tue, 23 Mar 2021 09:17:24 +0100 (CET)
Received: from photino.stro.at (unknown [82.220.104.185])
	by baikonur.stro.at (Postfix) with ESMTPSA id B05EEE019E;
	Tue, 23 Mar 2021 09:17:24 +0100 (CET)
Date: Tue, 23 Mar 2021 09:17:23 +0100
From: maximilian attems <maks@stro.at>
To: Phil Elwell <phil@raspberrypi.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
	Linux Firmware <linux-firmware@kernel.org>
Subject: Re: RPi 4B wireless firmware update?
Message-ID: <YFmkExHX+1ByZXcP@photino.stro.at>
References: <YFkFQ9+dFc/mM/Sq@photino.stro.at>
 <CAMEGJJ0-ZccyOw6HUoJabUxgxh6CnYf2qnUfKX7O5YW_xx7zhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMEGJJ0-ZccyOw6HUoJabUxgxh6CnYf2qnUfKX7O5YW_xx7zhA@mail.gmail.com>

Dear Phil, dear Chi-Hsien,

 
> The Cypress firmware in our repo has been tailored to our platforms. I believe
> it is up to the creators to decide whether or not to upload firmware to the
> canonical Linux firmware repo and, if so, which and how many variants.

The vendor may wish good support of his devices. In linux-firmware the
newest cypress firmwares are from 22/10/2020. In the Raspberry pi repo
the latest firmware for cyw43455 - 7.45.229 is from 04/01/2021, hence
it be great if the general build of that version could be pushed upstream
for all distributions.

Unrelated to that firmware, there are debian reports that newest
cyw43455 does not work in Japan with the newer cypress sdio.clm_blob
is that know to Cypress (worked on old brcm firmware) and where could
this be reported?

best,
maximilian
