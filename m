Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA595C433ED
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Apr 2021 09:26:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 65B7A61405; Thu, 29 Apr 2021 09:26:37 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE7261418
	for <linux-firmware@kernel.org>; Thu, 29 Apr 2021 09:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE7261418
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619688397; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QBbZ5/HYpqspPUTSax/xwSJ1WUdjWXh7mazN1HVw8CA=; b=Xxt674s1R4MYExSO14NFo5/IIlu9QmptNC4Zkb6ZzTx9Qja8wLZcl+AoYyqLdPzAZB02MV1v
 u2LALjXqFTg8aCiXEHKMKLucRBROMTncHAX9pcT+3ed8bMkf0RZeixMfdy66BDAZ6LH25uSC
 QgWFtCY7aZM2dPgD/VL08XYXQow=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 608a7bc9a817abd39ac33d53 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 09:26:33
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 39CBFC433D3; Thu, 29 Apr 2021 09:26:33 +0000 (UTC)
Received: from [192.168.1.105] (unknown [61.1.231.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: akhilpo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1827BC433D3;
	Thu, 29 Apr 2021 09:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1827BC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] qcom: add gpu firmwares for sc7280
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>
References: <1619677482-14857-1-git-send-email-akhilpo@codeaurora.org>
 <CAP71WjzphRWpcMvmUZQJwobXdmgqoUG2MzgQaLLg03P-Fm0Rvw@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <e76cc831-ed8e-9f29-0472-96cdf929ce14@codeaurora.org>
Date: Thu, 29 Apr 2021 14:56:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjzphRWpcMvmUZQJwobXdmgqoUG2MzgQaLLg03P-Fm0Rvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/29/2021 1:08 PM, Nicolas Dechesne wrote:
> On Thu, Apr 29, 2021 at 8:25 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>
>> Adds a660_gmu.bin (v3.01.06) and a660_sqe.fw (v0.94) firmware blobs
>> required for sc7280 SoC.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   WHENCE            |   2 ++
>>   qcom/a660_gmu.bin | Bin 0 -> 55444 bytes
>>   qcom/a660_sqe.fw  | Bin 0 -> 40496 bytes
>>   3 files changed, 2 insertions(+)
>>   create mode 100644 qcom/a660_gmu.bin
>>   create mode 100644 qcom/a660_sqe.fw
>>
>> diff --git a/WHENCE b/WHENCE
>> index 3a27e34..3371dc7 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -5191,6 +5191,8 @@ File: qcom/sdm845/a630_zap.mbn
>>   File: qcom/a650_gmu.bin
>>   File: qcom/a650_sqe.fw
>>   File: qcom/sm8250/a650_zap.mbn
>> +File: qcom/a660_gmu.bin
>> +File: qcom/a660_sqe.fw
>>
>>   Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
>>
>> diff --git a/qcom/a660_gmu.bin b/qcom/a660_gmu.bin
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ee1b922b45bf17899f486cd1151f0fffe3fd8eb5
>> GIT binary patch
> 
> For linux-firmware PR, you most likely need to send a PR from a public
> branch instead. Binary patch isn't really working well. Here are
> example of previous QCOM firmware PRs:
> 
> https://lore.kernel.org/linux-firmware/bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org/
> https://lore.kernel.org/linux-firmware/20210401201115.stkX71kzODcOGviP6NCSqy_k3M3AN3G5oqHzAyBYMWs@z/
> 

I thought that binary patches were acceptable. It is mentioned in the 
README and also, I see a lot of binary patches being posted to 
linux-firmware like this:
https://lore.kernel.org/linux-firmware/CA+5PVA7Deq3P_cw+Ro8xDeQeS1CTeK8RTfXUB0b5L622npvX7w@mail.gmail.com/T/
-Akhil.

