Return-Path: <SRS0=qzet=YJ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F4C00140
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Aug 2022 09:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 096D2C433C1; Fri,  5 Aug 2022 09:36:17 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED166C433D6
	for <linux-firmware@kernel.org>; Fri,  5 Aug 2022 09:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED166C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id r17so2607973lfm.11
        for <linux-firmware@kernel.org>; Fri, 05 Aug 2022 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=tLxPkoMovnTjvaiV/iJ/9xu7RPBak6OouLYkRbQhJTY=;
        b=ei1io9w2pYFYVfXJxsJIvfwnc9KlWG8ySrrOu9GGZT7Hj5WwkTN5CjCghh8GJrdrMa
         nIEHRZAk1lKOmpAfQFZ0YycCd5zPBKZn9L5FXKS+RjJIJ6Fuw7Ja70Hb9ncKsgFjNfAP
         AvG+frpVOv4MbB+i1eAXtdzWuWT0ghpXCgglikDrPIHGPfjFCl3q7Tz2D8jCgUyRcDEX
         P9KJIufNAmG/2PuetPaeGPhsf2WyAzYxr9QMJg9WY46wOk1N/rDMhyAqORvHAVTDSFdx
         PcKhaSj5PNkpuszlWLO4dc+Ed5l7G7oPN78zCbBQvl/NuC7BefaJ9mQGRulu5/4fUgYs
         RPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=tLxPkoMovnTjvaiV/iJ/9xu7RPBak6OouLYkRbQhJTY=;
        b=4Zgjfxy4e5AmTRKtrCfBG67wHsR5mdAEyLvYmf4/0wxql2NG/mUB4tpSO0oKPu+Sb0
         BFDYQRNcL1m8cMi0Y1mtJxA7Yk25vgnvNneB9cfFy3JaTg9vPDic9rg0VbL77GleNCuz
         EmzhsIsBIvgIjQQmAfGCvlzz/TT9c6VWT1tR8vO/5ggS15nNxeOeFudAgaE6Qafolvi7
         ENU4X7sn5H3omr5MPGXAhDJrkiGPSAEW3WDvJFukLkAuJa9LWiHNqy15jOQwpekizAn5
         iQtjxWUhZzXVCR4eA4adPazhyCd03Wp/JsZU6t2PoX/eAwPTPZ1w5FPFNP4Spi9nDZue
         FJtA==
X-Gm-Message-State: ACgBeo0mi8lCBsM54KXqt0UeF6UK0Zz/4+m7FgmIQe4gvLXBYPshd3db
	KN7G2RquWyrbGazsLcsi4ot5Xg==
X-Google-Smtp-Source: AA6agR4SS5kQEaAe9pPmds9idl/Ql+nXNdCDdYMRjHkFQi6huZKjhqIcfeHoJkLVQV/4Y9pFDj7gHQ==
X-Received: by 2002:a05:6512:3f11:b0:48a:3043:e7 with SMTP id y17-20020a0565123f1100b0048a304300e7mr2051198lfa.524.1659692174012;
        Fri, 05 Aug 2022 02:36:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp40-20020a05651215a800b0048a9603399fsm405109lfb.267.2022.08.05.02.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:36:13 -0700 (PDT)
Message-ID: <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
Date: Fri, 5 Aug 2022 12:36:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: Mark Pearson <markpearson@lenovo.com>, linux-firmware@kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: bjorn.andersson@linaro.org
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2022 23:37, Mark Pearson wrote:
> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
> 
>    amdgpu partially revert "amdgpu: update beige goby to release 22.20"
> (2022-07-25 14:16:04 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
> 
> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
> 
>    qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)

Mark, it's so great to see firmware packages for Lenovo laptops being 
submitted!

> 
> ----------------------------------------------------------------
> Mark Pearson (1):
>        qcom: Add firmware for Lenovo ThinkPad X13s
> 
>   WHENCE                             |   8 ++++++++
>   qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>   qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>   qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>   qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>   qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>   qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>   qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>   qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
>   9 files changed, 109 insertions(+)
>   create mode 100644 qcom/LENOVO/21BX/adspr.jsn
>   create mode 100644 qcom/LENOVO/21BX/adspua.jsn
>   create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
>   create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
>   create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
>   create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
>   create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
>   create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn

I think it's the time to settle onto firmware paths for the 
Qualcomm-based devices. At some point it was proposed to use 
qcom/<SoC>/device/*mbn.

So, in your case it could be qcom/sc8280xp/Lenovo_21BX/

Bjorn, WDYT?


P.S. Can we hope to get firmware for older laptops to be published too? 
It would be really great if it would be possible to provide full support 
for Yoga C630 or Flex5G using redistributable firmware from linux-firmware.

-- 
With best wishes
Dmitry
