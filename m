Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26371C433F5
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Dec 2021 09:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9B6BC341CA; Thu,  9 Dec 2021 09:48:02 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 514F4C004DD
	for <linux-firmware@kernel.org>; Thu,  9 Dec 2021 09:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 514F4C004DD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1639043282; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Date: Message-ID: Cc: Subject: From: To: Sender;
 bh=6+f59zGixyXbOVFNB/3KDBqLwrszbyyVjv2vNsJ2ylI=; b=a2xoKLS0Bv5ZG+izG9584zfPnyjOmi5m7t6owL+Mc9WPMecSwsvpk383Ihlt6jPNgSHnwjFO
 lhkacV6+MSam68hGoikIIUFUfSDYPACGaRq0lTL9DinEivIxS5CJ86YCvhtjq038Sw6KV1tm
 P7omynH+Ut7W72kVhiMk1elGpr0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 61b1d0d191ff7f02683b6ee3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Dec 2021 09:48:01
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id A643AC4360C; Thu,  9 Dec 2021 09:48:00 +0000 (UTC)
Received: from [10.231.195.33] (unknown [180.166.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: zijuhu)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A3CCC4338F;
	Thu,  9 Dec 2021 09:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8A3CCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Zijun Hu <zijuhu@codeaurora.org>
Subject: QCA Bluetooth WCN685x firmware pull request
Cc: Rocky Liao <rjliao@codeaurora.org>, ", tjiang"@codeaurora.org
Message-ID: <e8aacdd6-061b-f604-ff28-badd90ae7bfa@codeaurora.org>
Date: Thu, 9 Dec 2021 17:47:57 +0800
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

for you to fetch changes up to e79f6d3fdf79d7f4938b5b107213937c044035fc:
----------------------------------------------------------------
Zijun Hu (1):
        QCA: Update Bluetooth WCN685x firmware to 2.1.0-00297 (Thu Dec 9 16:09:53 2021 +0800)


