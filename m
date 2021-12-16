Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA934C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Dec 2021 08:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79FA5C36AE9; Thu, 16 Dec 2021 08:56:32 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1E5AC36AE2
	for <linux-firmware@kernel.org>; Thu, 16 Dec 2021 08:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1E5AC36AE2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1639644991; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: Subject: From: Cc: To: Sender;
 bh=F+l5EINt08SlDYRyGfNgN7yRSvFPf+Nzd/KtJk7ydpU=; b=aVInCnAogB0uiqTFbopX2alA7jW/nyVy+svPGuXqw4Fc6QBrTQ/nsN4Zqd9kzh73PRI90ztZ
 VGPsKy4BtsCySStnQ8yfzUM4E2I86zPenDZiT89Gk7nGyRI+jLo7EpUYJQTVlubPmn1DG78r
 kWA9JE9QwT3L9XteDyFch0zh7aU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61baff3ec7b58d29096c4afb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Dec 2021 08:56:30
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id BF0A6C43619; Thu, 16 Dec 2021 08:56:30 +0000 (UTC)
Received: from [10.231.195.33] (unknown [180.166.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: zijuhu)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 27952C43616;
	Thu, 16 Dec 2021 08:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 27952C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Rocky Liao <rjliao@codeaurora.org>, tjiang@codeaurora.org,
 Zijun Hu <quic_zijuhu@quicinc.com>, zijuhu@codeaurora.org
From: Zijun Hu <zijuhu@codeaurora.org>
Subject: QCA Bluetooth WCN685x firmware pull request
Message-ID: <e270c9f1-d052-c40b-1d9e-f380f60a5a4f@codeaurora.org>
Date: Thu, 16 Dec 2021 16:56:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.

The following changes since commit
commit b0e898fbaf377c99a36aac6fdeb7250003648ca4
    linux-firmware: Update firmware file for Intel Bluetooth 9462 (Tue Nov 23 10:29:13 2021 +0530)

are available in the Git repository at:

   https://github.com/zijun-hu/qca-btfw.git

for you to fetch changes up to 2d86903a10c2b06fdc84141167030931ac973a3f:
----------------------------------------------------------------
Zijun Hu (1):
        QCA: Update Bluetooth WCN685x firmware to 2.1.0-00297 (Thu Dec 9 16:09:53 2021 +0800)
