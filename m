Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FDFC433ED
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Apr 2021 08:36:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F30B61185; Thu, 29 Apr 2021 08:36:11 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D647C61158
	for <linux-firmware@kernel.org>; Thu, 29 Apr 2021 08:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D647C61158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bounce+a91e02.be9e4a-linux-firmware=kernel.org@mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619685371; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XErExocfvzioA095Ye/csdwTGte0Z7OiMKiPrNLQVLI=;
 b=pIy/Lst2HPqhpvsNi6TmCHjzhn938GcUlC2/BlhlXTSPWAyc890zkg1iRamO8a+W5buDNPw2
 XKavghPUYWr4/MaxctJTlatFD3KyWac1NKSCgIPKeAwVVrXJqZMGNvrN9QQr/pajBBfmdI8s
 Yej90ARQl/tGK0AwzKFKJzVi2G8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 608a6feea817abd39a9a55bc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 08:35:58
 GMT
Sender: vgarodia=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 3023AC433F1; Thu, 29 Apr 2021 08:35:57 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: vgarodia)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A4FFC433D3;
	Thu, 29 Apr 2021 08:35:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 29 Apr 2021 14:05:56 +0530
From: vgarodia@codeaurora.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: smagar@codeaurora.org, linux-firmware@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 mchehab@infradead.org, linux-media-owner@vger.kernel.org,
 dikshita@codeaurora.org, adhudase@codeaurora.org, sampnimm@codeaurora.org,
 mansur@codeaurora.org
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
In-Reply-To: <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
 <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
Message-ID: <c38ab84b90feddb43b2782fa11ee5189@codeaurora.org>
X-Sender: vgarodia@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

On 2021-04-28 19:18, Stanimir Varbanov wrote:
> On 4/28/21 3:32 PM, smagar@codeaurora.org wrote:
>> Hello Team,
>> 
>> Please include updated firmware bins for venus-5.4 and vpu-2.0.
>> 
>> I have fixed comment and title updated.
>> 
>> Removed 0 byte unwanted bins.
>> 
>> Below is combined pull request for venus-5.4 and VPU-2.0.
>> 
>> Please find snapshot of pull request, let me know if anything is 
>> missing.
>> 
>> 
>> The following changes since commit
>> 85286184d9df1b03bb76049edcfd87c39ce46e94:
>> 
>>   Merge branch 'for-upstream' of
>> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
>> 11:34:11 -0400)
>> 
>> are available in the git repository at:
>> 
>>   https://github.com/suraj714/linux-firmware-venus.git master
>> 
>> for you to fetch changes up to 
>> 6cdef281cd16d967ad89c01af6fdda85529a2d80:
>> 
>>   qcom: Add venus firmware files for VPU-2.0 (2021-04-28 14:42:48 
>> +0530)
>> 
>> ----------------------------------------------------------------
>> smagar (2):
>>       qcom: update venus firmware files for v5.4
>>       qcom: Add venus firmware files for VPU-2.0
>> 
>>  WHENCE                    |  34 +++++++++++++++++++++++++++++++++-
>>  qcom/venus-5.4/venus.b00  | Bin 212 -> 212 bytes
>>  qcom/venus-5.4/venus.b01  | Bin 6808 -> 6808 bytes
>>  qcom/venus-5.4/venus.b02  | Bin 873680 -> 873596 bytes
>>  qcom/venus-5.4/venus.b03  | Bin 33792 -> 33792 bytes
>>  qcom/venus-5.4/venus.mbn  | Bin 919792 -> 919708 bytes
>>  qcom/venus-5.4/venus.mdt  | Bin 7020 -> 7020 bytes
>>  qcom/vpu-2.0/vpu20_1v.b00 | Bin 0 -> 692 bytes
>>  qcom/vpu-2.0/vpu20_1v.b01 | Bin 0 -> 7376 bytes
>>  qcom/vpu-2.0/vpu20_1v.b02 | Bin 0 -> 300 bytes
>>  qcom/vpu-2.0/vpu20_1v.b03 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b04 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b05 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b06 | Bin 0 -> 20 bytes
>>  qcom/vpu-2.0/vpu20_1v.b07 | Bin 0 -> 24 bytes
>>  qcom/vpu-2.0/vpu20_1v.b08 | Bin 0 -> 16 bytes
>>  qcom/vpu-2.0/vpu20_1v.b09 | Bin 0 -> 939184 bytes
>>  qcom/vpu-2.0/vpu20_1v.b10 | Bin 0 -> 42976 bytes
>>  qcom/vpu-2.0/vpu20_1v.b19 |   1 +
>>  qcom/vpu-2.0/vpu20_1v.mbn | Bin 0 -> 2031188 bytes
>>  qcom/vpu-2.0/vpu20_1v.mdt | Bin 0 -> 8068 bytes

Suraj, lets make these as generic names venus.bxx. We could confirm on 
hardware
with generic binary names.

> 
> Which Venus IP/SoCs use vpu-2.0 firmware? And what is the difference
> with existing vpu-1.0?
This is for sc7280.
vpu-1.0 and vpu-2.0 differs in hardware w.r.t number of hardware 
processing pipes.

Thanks,
Vikash
