Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2294C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Oct 2021 08:11:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A72CD61372; Tue, 19 Oct 2021 08:11:48 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9FE6112D
	for <linux-firmware@kernel.org>; Tue, 19 Oct 2021 08:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B9FE6112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634631108; h=Message-ID: Subject: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=RJidfpFJ/wOgVf9+XKzPqnIp3Psjsds+foh8qPQVgXM=; b=KSXimcPLZpIqe3+x+hxGvxVrGtpzo+A5YHFhBcz4OVmzyiG/GP6v6ioJEPr4RuCdOFS+5U8T
 ys5mCB4jQK6VReSHmhPXI/UKbdVbdzDyinFXVuoYV+73DECC0VfbH49xjIKUOK0xPbgZo0Pu
 fHqBtx6LjVzz6VmFIFTcWLMN6jI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 616e7dbd5baa84c77b9141e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 08:11:41
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id B868FC4360C; Tue, 19 Oct 2021 08:11:40 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 823B7C4338F
	for <linux-firmware@kernel.org>; Tue, 19 Oct 2021 08:11:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Oct 2021 16:11:40 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: btqca firmware 20211019
Message-ID: <ce803519aaf7feb5845bc694ceb55b1d@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if 
you have any problems.

The following changes since commit
d34196f55db16f2344483f94718c2b2263a5489e:

    linux-firmware: update firmware for MT7921 WiFi device (Mon Oct 18 
13:11:16 2021 +0800)

are available in the Git repository at:

    https://github.com/rjliao-qca/qca-btfw.git

for you to fetch changes up to c2e1fd30d91e22f9540f8253f1890c06cbba1a75:
----------------------------------------------------------------
Rocky Liao (1):
         QCA: Update Bluetooth firmware for WCN685x (Tue Oct 19 16:00:42 
2021 +0800)
