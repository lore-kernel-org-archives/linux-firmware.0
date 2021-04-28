Return-Path: <SRS0=ZQI/=JZ=linaro.org=stanimir.varbanov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C9BC433ED
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Apr 2021 13:48:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6F58961444; Wed, 28 Apr 2021 13:48:09 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4695161442
	for <linux-firmware@kernel.org>; Wed, 28 Apr 2021 13:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4695161442
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=stanimir.varbanov@linaro.org
Received: by mail-ej1-f49.google.com with SMTP id r12so94733527ejr.5
        for <linux-firmware@kernel.org>; Wed, 28 Apr 2021 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NPJFa1yPhrLq0PnWDq7NJrMIFlW4oE6/GyqIVm0OSjQ=;
        b=o+0LiwxEgpzlqOLtELHEXA0LhFqL5ZRAe5RWrHVf4fx5HL5oZPsMUiB01IzQ/FOCjs
         Ok7IfxuomUUCB6wFMd3QKtPYxlryhcvc8thhicSD+sXy2t+nIT/AWiZt5qlCBaeaP5qo
         fQpZ1u2NxaVuhN69Hb55UrUUlhor4wPg2M+1dRJcstJkNaM1zgiX16CHGzxVq6JjvJYy
         67zM1AlxlSaodd/5ApFXn+BiPez1NksXtekEPrOO/smOWeXvCMFix+FaEQtdim1e9vTA
         SLjleD/WfW5T1QAOPgTh4gvJwL+WPzs5hSmhW2OECuhL+W2kpcJVQkUt8k7IOBMdHq1Y
         Iq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NPJFa1yPhrLq0PnWDq7NJrMIFlW4oE6/GyqIVm0OSjQ=;
        b=IFsKLxzYZhKgyG4MyiN+QuwrY7Wu1CUvNC40mbBnDA8wZckR9BRqBjONzsaeUwT8X/
         AwRxH+oWvCVShoQjooJ50m1NGogZEjHvAxDNKQcrbGfowKPqB3R87L1XQ/zzxBnVcmkg
         F0ss4E02Iio7G99mbJ7TRLKqeWZuY+DhbahB8ayJR6UEJFBa6wssN+qS5WXAwb6EArNx
         IsXr/pq+o73v7Tk85I16gPinAlyAPiWwcsZ0ZTy43CZafA2I0zuP3RSwZkCdLyS//Vko
         IbFp9U25dW71nqajPNBGXGNjgQapkp35zY9odSiCnPP+hTX2/P9OD7BE7oxs6og7r3qY
         YNgA==
X-Gm-Message-State: AOAM532bk4EtlYpcJRzqChwLurfROeSLNvqjPIcOKAmA3hjVNQPUwTGv
	42vJI7QnQNKtaIVlpjJuBSRXrA==
X-Google-Smtp-Source: ABdhPJxabnOp31u5I9SpC9p+kssNW+G7GHHKzD880x1P41RkZh5iFTBtUN9HN7ZDuWqWDm7pWtS3Eg==
X-Received: by 2002:a17:906:c297:: with SMTP id r23mr7474073ejz.144.1619617687749;
        Wed, 28 Apr 2021 06:48:07 -0700 (PDT)
Received: from [192.168.1.14] (hst-221-20.medicom.bg. [84.238.221.20])
        by smtp.googlemail.com with ESMTPSA id k12sm4949564edo.50.2021.04.28.06.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 06:48:07 -0700 (PDT)
Subject: Re: Update venus firmware files for v5.4 and venus firmware files for
 VPU-2.0
List-Id: <linux-firmware.lore.kernel.org>
To: smagar@codeaurora.org, linux-firmware@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 mchehab@infradead.org, linux-media-owner@vger.kernel.org
Cc: vgarodia@codeaurora.org, dikshita@codeaurora.org,
 adhudase@codeaurora.org, sampnimm@codeaurora.org, mansur@codeaurora.org
References: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <9eaaec5d-a7d4-1889-5c92-28944b198adc@linaro.org>
Date: Wed, 28 Apr 2021 16:48:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bee73b3fe8b04c1a2663be0cd3cc7318@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 4/28/21 3:32 PM, smagar@codeaurora.org wrote:
> Hello Team,
> 
> Please include updated firmware bins for venus-5.4 and vpu-2.0.
> 
> I have fixed comment and title updated.
> 
> Removed 0 byte unwanted bins.
> 
> Below is combined pull request for venus-5.4 and VPU-2.0.
> 
> Please find snapshot of pull request, let me know if anything is missing.
> 
> 
> The following changes since commit
> 85286184d9df1b03bb76049edcfd87c39ce46e94:
> 
>   Merge branch 'for-upstream' of
> git://git.chelsio.net/pub/git/linux-firmware into main (2021-04-19
> 11:34:11 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/suraj714/linux-firmware-venus.git master
> 
> for you to fetch changes up to 6cdef281cd16d967ad89c01af6fdda85529a2d80:
> 
>   qcom: Add venus firmware files for VPU-2.0 (2021-04-28 14:42:48 +0530)
> 
> ----------------------------------------------------------------
> smagar (2):
>       qcom: update venus firmware files for v5.4
>       qcom: Add venus firmware files for VPU-2.0
> 
>  WHENCE                    |  34 +++++++++++++++++++++++++++++++++-
>  qcom/venus-5.4/venus.b00  | Bin 212 -> 212 bytes
>  qcom/venus-5.4/venus.b01  | Bin 6808 -> 6808 bytes
>  qcom/venus-5.4/venus.b02  | Bin 873680 -> 873596 bytes
>  qcom/venus-5.4/venus.b03  | Bin 33792 -> 33792 bytes
>  qcom/venus-5.4/venus.mbn  | Bin 919792 -> 919708 bytes
>  qcom/venus-5.4/venus.mdt  | Bin 7020 -> 7020 bytes
>  qcom/vpu-2.0/vpu20_1v.b00 | Bin 0 -> 692 bytes
>  qcom/vpu-2.0/vpu20_1v.b01 | Bin 0 -> 7376 bytes
>  qcom/vpu-2.0/vpu20_1v.b02 | Bin 0 -> 300 bytes
>  qcom/vpu-2.0/vpu20_1v.b03 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b04 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b05 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b06 | Bin 0 -> 20 bytes
>  qcom/vpu-2.0/vpu20_1v.b07 | Bin 0 -> 24 bytes
>  qcom/vpu-2.0/vpu20_1v.b08 | Bin 0 -> 16 bytes
>  qcom/vpu-2.0/vpu20_1v.b09 | Bin 0 -> 939184 bytes
>  qcom/vpu-2.0/vpu20_1v.b10 | Bin 0 -> 42976 bytes
>  qcom/vpu-2.0/vpu20_1v.b19 |   1 +
>  qcom/vpu-2.0/vpu20_1v.mbn | Bin 0 -> 2031188 bytes
>  qcom/vpu-2.0/vpu20_1v.mdt | Bin 0 -> 8068 bytes

Which Venus IP/SoCs use vpu-2.0 firmware? And what is the difference
with existing vpu-1.0?

-- 
regards,
Stan
