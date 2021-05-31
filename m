Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64943C47082
	for <linux-firmware@archiver.kernel.org>; Mon, 31 May 2021 06:08:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32CFB610A6; Mon, 31 May 2021 06:08:02 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC369610A0
	for <linux-firmware@kernel.org>; Mon, 31 May 2021 06:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC369610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622441281; h=Message-ID: References: In-Reply-To: Subject:
 To: From: Date: Content-Transfer-Encoding: Content-Type: MIME-Version:
 Sender; bh=z5kT8jbLa3B1j37fixvUFNYR47YyTWR8hYfpWxX1dCA=; b=xhb9xhyk+GRADzZX2u3jhAVu/cJ1FpKXt9ZgXEG8wJn1x6hOPwnk+ScdJobcuzNoEs10tdes
 eQtInxWcdP8+ciZwupP9vjcsiTiO7GS5wR1nWza058s5mvSVj1pz/oVmZ+aCfdDwjgq3xIK6
 6fXpgGjaYjKozhvE712bLI3b5Ow=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b47d406ddc3305c40a19bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 06:08:00
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 73C3EC4338A; Mon, 31 May 2021 06:07:59 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A37EC433D3
	for <linux-firmware@kernel.org>; Mon, 31 May 2021 06:07:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 31 May 2021 14:07:59 +0800
From: Rocky Liao <rjliao@codeaurora.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: btqca firmware 20210525
In-Reply-To: <12c9ae4818ee072ea81d4fe2e6438b5f@codeaurora.org>
References: <a7032e79a0456a4375453613ffab47fc@codeaurora.org>
 <12c9ae4818ee072ea81d4fe2e6438b5f@codeaurora.org>
Message-ID: <ea5b7ab62b5f03091b1551e9d387100e@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi,

Add one more pull request:

commit-id: 4adb20b44c1aa98eff0f6c8311a9611b1c6db3a6

Rocky Liao (1):
          QCA: Add Bluetooth firmware for WCN685x (2021-05-31 13:49:24 
+0800)

在 2021-05-27 16:44，Rocky Liao 写道：
> Hi,
> 
> Add one more pull request in the same
> https://github.com/rjliao-qca/qca-btfw.git:
> 
> commit-id: 48237834129d17f9d77301f4c6ec4afc0c83fbac
> ----------------------------------------------------------------
> Rocky Liao (1):
>          QCA: Update Bluetooth firmware for QCA6174 (2021-05-27 
> 16:31:22 +0800)
> 
> 
> 在 2021-05-25 17:48，Rocky Liao 写道：
>> Hi linux-firmware maintainers,
>> 
>> Here's a pull request for btqca bluetooth driver. Please let me know
>> if you have any problems.
>> 
>> The following changes since commit
>> f8462923ed8fc874f770b8c6dfad49d39b381f14:
>> 
>>    nvidia: fix symlinks for tu104/tu106 acr unload firmware
>> (2021-05-18 16:36:31 +1000)
>> 
>> are available in the Git repository at:
>> 
>>    https://github.com/rjliao-qca/qca-btfw.git
>> 
>> for you to fetch changes up to 
>> 293c78917c8113b7e3193733cb15d8f66b0249c7:
>> ----------------------------------------------------------------
>> Rocky Liao (1):
>>         QCA: Update Bluetooth firmware for QCA6390 (2021-05-25 
>> 17:36:19 +0800)
