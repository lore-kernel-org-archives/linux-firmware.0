Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A786C48BDF
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Jun 2021 03:05:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7483F61246; Wed, 16 Jun 2021 03:05:24 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7095260D07
	for <linux-firmware@kernel.org>; Wed, 16 Jun 2021 03:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7095260D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623812724; h=Message-ID: References: In-Reply-To: Subject:
 To: From: Date: Content-Transfer-Encoding: Content-Type: MIME-Version:
 Sender; bh=FaeUOPR5bUusVu6jVCMLWYsOLMrngYr1H+CJiTuvdEY=; b=sZU43mB6rk64JMsf4jtrgSqLkISDlHUzdo8vvioI2/TGEJI0JLfK/N5nG885TdbIkc0E+bz4
 Q7CPi+iflu2qyieVifiyJNdxRBkdKzyT7jXE44lZztfaqHqI0v42pYppNlHIOAqEpEND+eIB
 xjv0gm/I+iGQYgICtMsgZGYPdEk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60c96a55e27c0cc77f29eed4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Jun 2021 03:04:53
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id E9F51C433D3; Wed, 16 Jun 2021 03:04:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id B8ADDC433F1
	for <linux-firmware@kernel.org>; Wed, 16 Jun 2021 03:04:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 16 Jun 2021 11:04:52 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: btusb firmware 20210616
In-Reply-To: <15d16bdefcfa6a48f39f8de3cf11c2e7@codeaurora.org>
References: <15d16bdefcfa6a48f39f8de3cf11c2e7@codeaurora.org>
Message-ID: <7bbf7086f9b75a3489ee155e9b867eea@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Sorry, missing the commmit id: 160fd62e7662df212df96650db49baaea1d314cb

在 2021-06-16 11:03，Rocky Liao 写道：
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btusb bluetooth driver. Please let me know
> if you have any problems.
> 
> The following change is available for you to fetch in the Git
> repository at https://github.com/rjliao-qca/qca-btfw.git:
> 
> Rocky Liao (1):
>         QCA: Update Bluetooth firmware for QCA6174 (2021-06-16 10:56:11 
> +0800)
