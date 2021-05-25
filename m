Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A910C47084
	for <linux-firmware@archiver.kernel.org>; Tue, 25 May 2021 09:48:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10E7D613E6; Tue, 25 May 2021 09:48:16 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBAC4613FA
	for <linux-firmware@kernel.org>; Tue, 25 May 2021 09:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBAC4613FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621936095; h=Message-ID: Subject: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=TZkvsETiYkEUkMBHwAbzd88q1SCwUwAp6niOri0NSAE=; b=VihUuxcFJIMzHI+3elVF3Cj4VdjoQJf93jziPeubNEcqLGnKSNK/I8W08Qkb1XvUFqE72V7B
 +Z7ln7y1rWM2glmR4dDp6otTJzYbG3WJiqfvhErrtSmmoc1DncMlQGYRPSL2Km+9CH+GrA4B
 bXnXMwohc3vBbJyszuhC+fUnmr4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60acc7df60c53c8c9dfa844c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 09:48:15
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 2E6FFC433D3; Tue, 25 May 2021 09:48:14 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id EDF16C433F1
	for <linux-firmware@kernel.org>; Tue, 25 May 2021 09:48:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 25 May 2021 17:48:13 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: btqca firmware 20210525
Message-ID: <a7032e79a0456a4375453613ffab47fc@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
f8462923ed8fc874f770b8c6dfad49d39b381f14:

    nvidia: fix symlinks for tu104/tu106 acr unload firmware (2021-05-18 
16:36:31 +1000)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to 293c78917c8113b7e3193733cb15d8f66b0249c7:
----------------------------------------------------------------
Rocky Liao (1):
         QCA: Update Bluetooth firmware for QCA6390 (2021-05-25 17:36:19 
+0800)
