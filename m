Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7BDC433EF
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Jan 2022 09:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5B3BC36AEB; Tue,  4 Jan 2022 09:36:42 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74392C36AF2
	for <linux-firmware@kernel.org>; Tue,  4 Jan 2022 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74392C36AF2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1641289002; h=Content-Transfer-Encoding: Content-Type:
 Subject: From: Cc: To: MIME-Version: Date: Message-ID: Sender;
 bh=Ls9AsQjjOTaajELCl36ohUi/iZx7ALL30Cgmi6SbCrs=; b=kPZ3sRXKh4sjY8F4XgD9TDk9nO0cMINCEUx/zi3f8/yd+QYcbRCSl0Ldoju3cs2WNtwWYjOy
 xrfpiXQ5yJxcjI5ov86F4tfW6Vr3lymJ2yzip4VfqeBIfeOTwbnb+4G7cBlfuXOZgorTQ1Tj
 oRSMLFYFMJPtIpK+h+FjpMC9f6o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61d41529f41cb327b632d793 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Jan 2022 09:36:41
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 696D0C4360D; Tue,  4 Jan 2022 09:36:41 +0000 (UTC)
Received: from [10.231.195.33] (unknown [180.166.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: zijuhu)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id E4C36C4338F;
	Tue,  4 Jan 2022 09:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E4C36C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <5029a137-0b82-bb66-b1f9-47fd0676aa54@codeaurora.org>
Date: Tue, 4 Jan 2022 17:36:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>
Cc: Rocky Liao <rjliao@codeaurora.org>, tjiang@codeaurora.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
From: Zijun Hu <zijuhu@codeaurora.org>
Subject: QCA Bluetooth WCN685x firmware pull request at 2022/01/04
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.

The following changes since commit
commit 57d6b9507e28ac4803ea4aa4dba9592c889d6733
    cnm: add chips&media wave521c firmware. (Mon Dec 27 09:07:08 2021 +0000)

are available in the Git repository at:

   https://github.com/zijun-hu/qca-btfw.git

for you to fetch changes up to 17fe7809058ad5949c12d80bf446e726f9e9f782:
----------------------------------------------------------------
Zijun Hu (1):
        QCA: Add Bluetooth nvm file for WCN685x (Tue Jan 4 14:14:51 2022 +0800)
