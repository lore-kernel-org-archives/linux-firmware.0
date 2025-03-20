Return-Path: <SRS0=nZ5L=WH=tuxedocomputers.com=ggo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891D0C28B30
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Mar 2025 12:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D176C4CEE8; Thu, 20 Mar 2025 12:17:52 +0000 (UTC)
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D1A5C4CEDD
	for <linux-firmware@kernel.org>; Thu, 20 Mar 2025 12:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D1A5C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8343C2FC0191;
	Thu, 20 Mar 2025 13:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742473061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U2G45JwkiuKUFcys+DtoNHHLBH1XV9DqRJlWo0d+5yw=;
	b=tfwbS/SHdB3Tn/U0To+HdM0bzbrExuU4nUwD3hoB0q7SeSg+1Gpvnrt6yeGhotAQN5v7Gr
	IRgmu31aoWfAQOaSodqPwviIWpwhU4zoDCy6OHUee+xeeWDwCVZL+ADAsomLe3dS0dI/ig
	97GUuzj6PSL/2uMzDoUNNzh9sSWgCa0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <0ca4584f-7da1-4b0a-b526-75151625dea8@tuxedocomputers.com>
Date: Thu, 20 Mar 2025 13:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath12k: WCN7850 hw2.0: update board-2.bin
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Georg Gottleuber <ggo@tuxedocomputers.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Christoffer Sandberg
 <cs@tuxedocomputers.com>, Werner Sembach <wse@tuxedocomputers.com>
References: <398de7cb-e455-4cb4-98e8-31471bb740a6@tuxedocomputers.com>
 <iffofcri7ah2pwu3b77z5zfsa2wkzl5mcoarm2any4fdcjvsys@o35roczyxb6q>
Content-Language: en-US
From: Georg Gottleuber <ggo@tuxedocomputers.com>
In-Reply-To: <iffofcri7ah2pwu3b77z5zfsa2wkzl5mcoarm2any4fdcjvsys@o35roczyxb6q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dimitry.

Am 18.03.25 um 22:12 schrieb Dmitry Baryshkov:
[...]
> 
> Please follow the process specified at the kernel wiki [1]. Otherwise
> the next update by Jeff will revert your changes.
> 
> [1] https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html

Thank you for this hint. I will stick to this in v2.

Best regards,
Georg
