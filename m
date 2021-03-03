Return-Path: <SRS0=TMfW=IB=stro.at=maks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E39EC433E0
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Mar 2021 19:57:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1B14C64EAE; Wed,  3 Mar 2021 19:57:01 +0000 (UTC)
Received: from baikonur.stro.at (baikonur.stro.at [88.198.36.42])
	by mail.kernel.org (Postfix) with ESMTP id 79E2C600EF;
	Wed,  3 Mar 2021 19:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E2C600EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stro.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=maks@stro.at
Received: from localhost (localhost [127.0.0.1])
	by baikonur.stro.at (Postfix) with ESMTP id 726AAE76C8;
	Wed,  3 Mar 2021 20:56:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at stro.at
Received: from baikonur.stro.at ([127.0.0.1])
	by localhost (baikonur.stro.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38HbbW7a9Ipz; Wed,  3 Mar 2021 20:56:58 +0100 (CET)
Received: from photino.stro.at (unknown [82.220.104.185])
	by baikonur.stro.at (Postfix) with ESMTPSA id 73034E7385;
	Wed,  3 Mar 2021 20:56:58 +0100 (CET)
Date: Wed, 3 Mar 2021 20:56:57 +0100
From: maximilian attems <maks@stro.at>
To: Josh Boyer <jwboyer@kernel.org>, 982579@bugs.debian.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
	Bernhard <bewoern1@gmail.com>, vagrant@debian.org
Subject: Re: Bug#982579: Solution for loading firmware
Message-ID: <YD/qCeeJIvUzgPKU@photino.stro.at>
References: <cbcb1fabd3a005142216213ca67c1a1664b7958a.camel@gmail.com>
 <YCtw7RaNEyod8mxb@photino.stro.at>
 <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <YCwShdDfEI8Fzidn@photino.stro.at>
 <YDQg9nkcyzzdljno@photino.stro.at>
 <6fe1da22eb783f020de8bfa3b9f2b1457e593a4b.camel@gmail.com>
 <CA+5PVA59VxknE=+2zVC-qOmQ_jQ8k7iWbSwCJyPAB7u8tYJeaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+5PVA59VxknE=+2zVC-qOmQ_jQ8k7iWbSwCJyPAB7u8tYJeaA@mail.gmail.com>

> Both patches applied and pushed out.

great thank you.
 
> In the future, could you please send the patches either as direct
> emails or as attachments or as pull requests?  When you embed them in
> the body of the email I have to manually adjust them to get the commit
> log properly included.

sure, will do as pull request.
