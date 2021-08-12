Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48E6C4338F
	for <linux-firmware@archiver.kernel.org>; Thu, 12 Aug 2021 08:05:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 89E1461058; Thu, 12 Aug 2021 08:05:06 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 365586103A
	for <linux-firmware@kernel.org>; Thu, 12 Aug 2021 08:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 365586103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628755506; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=BTZa5fePxxkz3HSgkb8loFU1bJ39a9DfwrlgYrh6H10=; b=qKpYyg8bgsyjZwR3vJngJ4T4zZMRSE2M5rvqop6p0oVa6CqxNPp+2HET3XimS0HDOs32N14d
 0ue8LUBFj4ya7FlRDBqPoUMpYqQXzn54kdZDCpU0xvqzSxF7QAVQo6PgAPVuL0SlHFXkOvL9
 9KbSC7Tvh9reEt5slqIK1g9C/sA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6114d631b14e7e2ecb11d58b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Aug 2021 08:05:05
 GMT
Sender: smagar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 088DFC4338A; Thu, 12 Aug 2021 08:05:05 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: smagar)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BA76C433F1;
	Thu, 12 Aug 2021 08:05:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 12 Aug 2021 13:35:04 +0530
From: smagar@codeaurora.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: mka@chromium.org, linux-kernel@vger.kernel.org,
 linux-bluethoth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hemantg@codeaurora.org, abhishekpandit@chromium.org,
 bgodavar@codeaurora.org, adhudase@codeaurora.org, sampnimm@codeaurora.org
Subject: Request to update WCN3991 FW file
Message-ID: <0a05c2062052704d788511cf7edd874d@codeaurora.org>
X-Sender: smagar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi Team,


Please include updated firmware bins for WCN3991. Change includes 
updated TLV file.

Snapshot of pull request is as below, let me know if anything is 
missing.



The following changes since commit 
168452ee695b5edb9deb641059bc110b9c5e8fc7:

   Merge tag 'iwlwifi-fw-2021-07-19' of 
git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware 
into main (2021-07-19 14:35:47 -0400)

are available in the git repository at:

   https://github.com/suraj714/linux-firmware-BT master

for you to fetch changes up to 6a3a985022e1194045fc46a249ca29f8bf2fb427:

   QCA : Updated firmware files for WCN3991 (2021-08-12 10:03:49 +0530)

----------------------------------------------------------------
smagar (1):
       QCA : Updated firmware files for WCN3991

  qca/crbtfw32.tlv | Bin 126772 -> 126036 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)


Regards,
Suraj Magar
