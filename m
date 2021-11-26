Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91C2C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 26 Nov 2021 04:51:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F2B5C9305F; Fri, 26 Nov 2021 04:51:33 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECD1CC93056
	for <linux-firmware@kernel.org>; Fri, 26 Nov 2021 04:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECD1CC93056
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637902292; h=Message-ID: Subject: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=IGKIID5Mpyd1TB0GTvQHJVvSsQ7C8FLOiWu23weepJk=; b=HWRqbv9eyBD46VuAjntTQWEf6YQu2OedSmxcgvRQoVfIyQLJKscYbdE5A7xi8UujHro8zuet
 Sa4NbgLVVV8igCA1xyfnHTdC2KLNzsMJmEHrdI48/6MCeKoHQXTWqhUtrJHP/P8/v5QAQZcB
 I4e3ngYDfMfupFhHUYbn/quygbc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61a061eae7d68470af7380b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 04:26:18
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 92C95C4360D; Fri, 26 Nov 2021 04:26:17 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tjiang)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 60B47C4338F
	for <linux-firmware@kernel.org>; Fri, 26 Nov 2021 04:26:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 26 Nov 2021 12:26:17 +0800
From: tjiang@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: btqca firmware 20211126
Message-ID: <72436183aa6c164a1a9df5038fc1f652@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit 
73a13f4d8d6059768f1090a95c43b8b5333b58db

QCA: Add Bluetooth firmware for WCN685x

are available in the Git repository at:

https://github.com/tjiang123/qca-btfw.git

for you to fetch changes up to 28fdbcd7528ab7f9816fdb73ae1a0601e5ab8d37:

Tim Jiang:
QCA: Add Bluetooth default nvm file for WCN685x

thank you.

regards.
tim
