Return-Path: <SRS0=WiKr=IU=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCB9C433DB
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Mar 2021 20:59:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4647A61998; Mon, 22 Mar 2021 20:59:53 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id E04266191C
	for <linux-firmware@kernel.org>; Mon, 22 Mar 2021 20:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04266191C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id C2E01E6F06;
	Mon, 22 Mar 2021 21:59:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3PQKHXgnfV9; Mon, 22 Mar 2021 21:59:49 +0100 (CET)
Received: from photino.stro.at (unknown [82.220.104.185])
	by baikonur.stro.at (Postfix) with ESMTPSA id 72609E00D4;
	Mon, 22 Mar 2021 21:59:49 +0100 (CET)
Date: Mon, 22 Mar 2021 21:59:47 +0100
From: maximilian attems <maks@stro.at>
To: Phil Elwell <phil@raspberrypi.org>,
	Chi-Hsien Lin <chi-hsien.lin@cypress.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: RPi 4B wireless firmware update?
Message-ID: <YFkFQ9+dFc/mM/Sq@photino.stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear Phil, dear Chi-Hsien,

It seems that there is a new firmware [1] distributed for the CYW43455
since creation of the cypress directory in linux-firmware git:
[1]
https://github.com/RPi-Distro/firmware-nonfree/commit/f713a6054746bc61ece1c8696dce91a7b7e22dd9#diff-1ddd585d9cadb82dd8e346a46cc6b76ad5ffa1d64b2c79c855062fd863d37f99

Where is this version to be downloadable at cypress/infineon and
is it distributable as the previous version?
If it is could it be submitted to upstream linux-firmware?

thank you.
