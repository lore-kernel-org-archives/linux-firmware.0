Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637C8C433F5
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Nov 2021 08:28:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4728961BF4; Wed, 17 Nov 2021 08:28:10 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFD961BF5
	for <linux-firmware@kernel.org>; Wed, 17 Nov 2021 08:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECFD961BF5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637137689; h=Message-ID: Subject: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=RkPjfT9fPL5GKpEjt72prsQjQExtrjopSbRy9stFlIo=; b=jhmXCkkTcOra8UACdAxMVfTYeQWyEi+bpG80xeMVukdX1RIbgY/fyNy62f4XFFAtwrBLgNbK
 HBjxd4xXYNQH2KHqfKh8X+/XFHFlVccM9EIWCvDAHWFy+pW2Eeq6z2UFkW63C1bsqvWjnJbs
 5eZ8Geiap3XVicuSCzxYEc2RFGE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6194bd185bbbed1f705a9eb4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 08:28:08
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 7D456C4360D; Wed, 17 Nov 2021 08:28:08 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tjiang)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 46901C4338F
	for <linux-firmware@kernel.org>; Wed, 17 Nov 2021 08:28:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 17 Nov 2021 16:28:08 +0800
From: tjiang@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: btqca firmware 20211117
Message-ID: <d11597264d04b8e21a425ffb48372c5c@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit 
f5d519563ac9d2d1f382a817aae5ec5473811ac8

linux-firmware: Update AMD cpu microcode

are available in the Git repository at:

https://github.com/tjiang123/qca-btfw.git

for you to fetch changes up to 73a13f4d8d6059768f1090a95c43b8b5333b58db:

Tim Jiang:
QCA: Add Bluetooth firmware for WCN685x


thank you.

regards.
tim
