Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344B9C433E0
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Mar 2021 19:01:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E3BD9601FB; Wed,  3 Mar 2021 19:01:27 +0000 (UTC)
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436B864ED7
	for <linux-firmware@kernel.org>; Wed,  3 Mar 2021 19:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436B864ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614798087; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=XCaJkg/07Qju0xDLW2/0tiQPWCjxTw8nP7t7Cm/n/9g=; b=asUiuOdWDuNFojTr1MZ4gZo5PYhYWtsJ3OeCpQHHzAY5z0lENHU8Acw0enZgTdjYFqcb221d
 uPU3HCCBVQd1frSA0apeDpWlj31SYpHbUg/guUcqcQoTt/NJMmGkwmehvuJQ42EDI8CsgEiL
 kcCXTCWG06yUg0ixdRseUS+wkGs=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 603fdcde60050cf4d08f0fe9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Mar 2021 19:00:46
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 233D4C43463; Wed,  3 Mar 2021 19:00:46 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6515FC433ED;
	Wed,  3 Mar 2021 19:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6515FC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Srinivasan Raju <srini.raju@purelifi.com>,  Linux Firmware <linux-firmware@kernel.org>,  mostafa.afgani@purelifi.com, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] [v6] linux-firmware: New firmware files for pureLiFi USB devices
References: <20210226132057.120007-1-srini.raju@purelifi.com>
	<CA+5PVA7okASXRaiA8LoNp1gVHAd7iDPvzXsr1x2rBkh=4-VZXA@mail.gmail.com>
Date: Wed, 03 Mar 2021 21:00:42 +0200
In-Reply-To: <CA+5PVA7okASXRaiA8LoNp1gVHAd7iDPvzXsr1x2rBkh=4-VZXA@mail.gmail.com>
	(Josh Boyer's message of "Wed, 3 Mar 2021 13:50:34 -0500")
Message-ID: <87ft1c6p0l.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

(Srinivasan, please cc linux-wireless on wireless firmware submissions)

Josh Boyer <jwboyer@kernel.org> writes:

> Is the driver reviewed and merged now?  If so, Kallle (or whomever)
> can you provide a Reviewed-by?

It's not merged yet, but we are getting closer.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
