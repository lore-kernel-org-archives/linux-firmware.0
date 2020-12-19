Return-Path: <kvalo@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7028DC4361B
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Dec 2020 12:37:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 48BA623C43; Sat, 19 Dec 2020 12:37:23 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 22CECC433C6; Sat, 19 Dec 2020 12:37:23 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 79BFDC433CA;
	Sat, 19 Dec 2020 12:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79BFDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Srinivasan Raju <srini.raju@purelifi.com>,  Linux Firmware <linux-firmware@kernel.org>,  mostafa.afgani@purelifi.com
Subject: Re: [PATCH] [v4] linux-firmware: New firmware files for pureLiFi USB devices
References: <20201208114532.348780-1-srini.raju@purelifi.com>
	<CA+5PVA5O=i6DW-01eziStVe5O=BwAafb20=4RUAOs8Q1m329LQ@mail.gmail.com>
Date: Sat, 19 Dec 2020 14:37:19 +0200
In-Reply-To: <CA+5PVA5O=i6DW-01eziStVe5O=BwAafb20=4RUAOs8Q1m329LQ@mail.gmail.com>
	(Josh Boyer's message of "Fri, 18 Dec 2020 14:02:45 -0500")
Message-ID: <875z4yrmyo.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Josh Boyer <jwboyer@kernel.org> writes:

> The README file says the firmware should be in
> /lib/firmware/purelifi/li_fi_x/.  Is there a reason you didn't create
> the directory structure here so that it's automatically placed in the
> proper directory during installation?
>
> Also, the README file is missing from WHENCE.

I think it's better to wait that we first review the driver in
linux-wireless and only submit the firmware files after that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
