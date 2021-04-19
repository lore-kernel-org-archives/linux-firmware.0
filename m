Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D0DC433ED
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Apr 2021 03:09:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7CEF36102A; Mon, 19 Apr 2021 03:09:43 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1869E61077
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 03:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1869E61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618801783; h=Message-ID: Subject: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=cuTA2RXLBlanJMc4Fkzz+vAN7R6YyOZr/HPsVC7AczQ=; b=SdJLRTiK5xa84C3wTQqB3rzo2ywU2ObqNGT8/jLjrZ47cdFb0UXMGJoacItJP/alboYfFUEQ
 czD6hwJN0DB2U2/s6R6ZuGtP5srqp8cTysVTPYciEJtzTfCzD+vzVRqrterypf+0yFGJVqea
 88CwnkVxMczs4Rbxfeogd5K8ytA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 607cf467a817abd39a1a8d76 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 03:09:27
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 3950DC4338A; Mon, 19 Apr 2021 03:09:26 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 00A1BC433F1
	for <linux-firmware@kernel.org>; Mon, 19 Apr 2021 03:09:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Apr 2021 11:09:25 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: btusb firmware 20210419
Message-ID: <dc41d16e192c7e78cdf23463db8483e3@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btusb bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
af1ca28f03287b0c60682ab37cc684c773de853f:

    amdgpu: add arcturus firmware (2021-03-18 22:24:41 -0400)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to c2968499147efaa071536c81c8c426d36325059a:
----------------------------------------------------------------
Rocky Liao (1):
         QCA: Update Bluetooth firmware for QCA6174 (2021-04-19 10:55:15 
+0800)
