Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6DFC48BDF
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Jun 2021 03:04:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 674EA611CE; Wed, 16 Jun 2021 03:04:07 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30AA160D07
	for <linux-firmware@kernel.org>; Wed, 16 Jun 2021 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30AA160D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623812647; h=Message-ID: Subject: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=ZRvt07n85zhQOYvJGayy55oOqKnoDqIMkxPVtJst5go=; b=PjE1wE96EY2DjJe2ihAXiH/ONyYnUvNd7ANZypV2DTbvOK1L8ThrTpSH97sOm3P6fk1d5jaI
 GToS0thhToW1lpfG33y+12nwth2piQaCfmkfBtIc8A2O6Yv/5JfWdGOmHyKbhxefTciakW+v
 v993/4arzGztSqt80zNYjMgqc9Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60c96a1ce570c0561930e9d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Jun 2021 03:03:56
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 23A5FC433D3; Wed, 16 Jun 2021 03:03:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E5EA5C433F1
	for <linux-firmware@kernel.org>; Wed, 16 Jun 2021 03:03:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Jun 2021 11:03:55 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: btusb firmware 20210616
Message-ID: <15d16bdefcfa6a48f39f8de3cf11c2e7@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btusb bluetooth driver. Please let me know if 
you have any problems.

The following change is available for you to fetch in the Git repository 
at https://github.com/rjliao-qca/qca-btfw.git:

Rocky Liao (1):
         QCA: Update Bluetooth firmware for QCA6174 (2021-06-16 10:56:11 
+0800)

